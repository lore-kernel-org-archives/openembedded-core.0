Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id BED2071C47
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 19:34:30 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 03 Nov 2016 12:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,440,1473145200"; d="scan'208";a="27240399"
Received: from bkarakos-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.187.65])
	by orsmga005.jf.intel.com with ESMTP; 03 Nov 2016 12:34:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 04 Nov 2016 08:34:27 +1300
Message-ID: <1890495.kdAhvlCMlm@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.10-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1480827.LzmdYstA2d@peggleto-mobl.ger.corp.intel.com>
References: <6511599a-ddb1-77b0-f42e-69afeaa60cae@linux.intel.com>
	<1480827.LzmdYstA2d@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Subject: Re: using devtool for rebasing patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Nov 2016 19:34:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Fri, 04 Nov 2016 08:29:26 Paul Eggleton wrote:
> Hi Alex,
> 
> On Thu, 03 Nov 2016 18:01:27 Alexander Kanavin wrote:
> > it would be very useful if devtool offered support for rebasing source
> > patches when they fail to apply, but currently there does not seem to be
> > any such feature:
> > 
> > ak@kanavin-desktop:~/development/poky/build$ devtool modify libksba
> > Parsing recipes..done.
> > NOTE: Fetching libksba...
> > NOTE: Unpacking...
> > NOTE: Patching...
> > ERROR: Applying 'ksba-add-pkgconfig-support.patch' failed:
> > checking file Makefile.am
> > Hunk #1 FAILED at 21.
> > 1 out of 1 hunk FAILED
> > checking file configure.ac
> > Hunk #1 succeeded at 414 (offset 14 lines).
> > checking file ksba.pc.in
> > checking file src/ksba.m4
> > ERROR: Function failed: patch_do_patch
> > ak@kanavin-desktop:~/development/poky/build$
> > 
> > What devtool could do here is apply the patches that can be applied and
> > then partially apply the patches that fail. Then give the developer some
> > kind of UI for dealing with the rejected hunks (which typically means
> > finding the place in the target file where the changes should go and
> > then manually editing them in, while looking at the original patch).
> > 
> > Without this feature devtool is half as useful as it could be
> > particularly for recipe version updates.
> 
> "devtool upgrade" is designed specifically to handle the upgrade case and
> tries to rebase the old patches onto the new version, putting you into
> resolution mode with "git am" if it fails to apply a patch. I appreciate
> that you may now be working through sorting out all of the patches to
> reduce the fuzziness when applying, and that won't help in that scenario,
> but it would definitely be worth considering for upgrades.
> 
> I'm open to implementing better support for handling patch application
> failure for devtool modify - in fact there is a bug open for just that:
> 
>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=8325

(Although admittedly that was mostly for an earlier issue - we ought to add a 
bit of description of where to go from here.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


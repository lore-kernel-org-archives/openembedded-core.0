Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8EA5961855
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 12:53:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Sep 2013 05:53:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,847,1371106800"; d="scan'208";a="373900560"
Received: from unknown (HELO helios.localnet) ([10.252.123.106])
	by orsmga001.jf.intel.com with ESMTP; 05 Sep 2013 05:53:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <pb@pbcl.net>
Date: Thu, 05 Sep 2013 13:53:44 +0100
Message-ID: <3397753.WTGSduA6kl@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-29-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1378384174.6940.86.camel@phil-desktop.brightsign>
References: <cover.1378366233.git.laurentiu.palcu@intel.com>
	<3518999.x3yV6XY4Eo@helios>
	<1378384174.6940.86.camel@phil-desktop.brightsign>
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] image.bbclass: leave metadata in place if a PM is installed in the image
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
X-List-Received-Date: Thu, 05 Sep 2013 12:53:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 05 September 2013 13:29:34 Phil Blundell wrote:
> On Thu, 2013-09-05 at 07:19 -0500, Paul Eggleton wrote:
> > I'm clearly missing something here. If we have a generic mechanism to run
> > postinstall scripts now, and "package-management" is not in
> > IMAGE_FEATURES,
> > why do we need or want the package manager to be in control of running the
> > postinstalls?
> 
> We don't.  The postinsts should be getting run by run-postinsts.
> 
> I must admit I still don't entirely understand what the problem is that
> Laurentiu is trying to fix with his patch, and the description in the
> Yocto bugzilla remains opaque to me.  Can you clarify what exactly it is
> that's currently going wrong?

The reason I reopened the bug (the final comment) is that I had a situation 
recently where I had got opkg installed in an image via dependencies and I did 
not have package-management in IMAGE_FEATURES. The result was that 
postinstalls to be run on first boot just silently did not work, which is not 
good behaviour.

Now, with the image I was dealing with I needed to add package-management to 
IMAGE_FEATURES anyway; but things shouldn't just silently break because the 
package manager happens to be installed especially as it may not be 
immediately clear to the user that the latter had even happened. I'm pretty 
sure this didn't used to be an issue.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


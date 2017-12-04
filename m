Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 444896007A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 15:14:14 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2017 07:14:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,359,1508828400"; d="scan'208";a="183823602"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by fmsmga006.fm.intel.com with ESMTP; 04 Dec 2017 07:14:16 -0800
Date: Mon, 4 Dec 2017 09:23:59 -0600
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20171204092359.0bef0632@lsandov1-mobl2.zpn.intel.com>
In-Reply-To: <CA+chaQcDrNUp_fE2a+JpkBOgAKAzA+e8SMKMqRGMpcD7jrLvGA@mail.gmail.com>
References: <20171114212050.15881-1-california.l.sullivan@intel.com>
	<20171201220258.2785.92203@do.openembedded.org>
	<CA+chaQcDrNUp_fE2a+JpkBOgAKAzA+e8SMKMqRGMpcD7jrLvGA@mail.gmail.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGluaXRyYW1mcy1mcmFtZXdvcmsgaW5zdGFsbGF0aW9uIGltcHJvdmVtZW50cyAocmV2NCk=?=
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
X-List-Received-Date: Mon, 04 Dec 2017 15:14:15 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 1 Dec 2017 23:07:48 +0100
Martin Jansa <martin.jansa@gmail.com> wrote:

> Is it trying to apply whole series (including the 2 patches which were
> already merged to master and actually introduced the issue I was trying to
> fix)?
> 
> Does it mean that I cannot send a fix into the e-mail thread where the
> issue was introduced and discussed?

I do not the answer but I can tell you about the fail check: patchtest is pretty dummy in this check, it simply does git apply --check <your series.mbox> so you need to base on master's HEAD.


> 
> Regards,
> 
> On Fri, Dec 1, 2017 at 11:02 PM, Patchwork <
> patchwork@patchwork.openembedded.org> wrote:  
> 
> > == Series Details ==
> >
> > Series: initramfs-framework installation improvements (rev4)
> > Revision: 4
> > URL   : https://patchwork.openembedded.org/series/9783/
> > State : failure
> >
> > == Summary ==
> >
> >
> > Thank you for submitting this patch series to OpenEmbedded Core. This is
> > an automated response. Several tests have been executed on the proposed
> > series by patchtest resulting in the following failures:
> >
> >
> >
> > * Issue             Series does not apply on top of target branch
> > [test_series_merge_on_head]
> >   Suggested fix    Rebase your series on top of targeted branch
> >   Targeted branch  master (currently at addf309165)
> >
> >
> >
> > If you believe any of these test results are incorrect, please reply to the
> > mailing list (openembedded-core@lists.openembedded.org) raising your
> > concerns.
> > Otherwise we would appreciate you correcting the issues and submitting a
> > new
> > version of the patchset if applicable. Please ensure you add/increment the
> > version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> > [PATCH v3] -> ...).
> >
> > ---
> > Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_
> > Guidelines
> > Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> > Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> >
> >  


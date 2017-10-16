Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id EBEA877DAF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 19:03:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Oct 2017 12:03:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,371,1503385200"; 
   d="scan'208";a="823744"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga001.jf.intel.com with SMTP; 16 Oct 2017 12:03:18 -0700
Date: Mon, 16 Oct 2017 14:13:06 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Message-Id: <20171016141306.418e7a6502139ed4c2e180c3@linux.intel.com>
In-Reply-To: <4d40ce95-4159-5197-ebca-af1f30f25a6f@windriver.com>
References: <20171016150045.25323-1-Randy.MacLeod@windriver.com>
	<20171016160029.2787.48040@do.openembedded.org>
	<4d40ce95-4159-5197-ebca-af1f30f25a6f@windriver.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJSRUFETUUucWVtdTogcWVtdXBwYzY0IGlzIG5vdCAuLi4iIGFuZCAxIG1vcmU=?=
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
X-List-Received-Date: Mon, 16 Oct 2017 19:03:21 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Oct 2017 14:39:45 -0400
Randy MacLeod <randy.macleod@windriver.com> wrote:

> On 2017-10-16 12:00 PM, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: "README.qemu: qemuppc64 is not ..." and 1 more
> > Revision: 1
> > URL   : https://patchwork.openembedded.org/series/9358/
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
> > * Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence]
> >    Suggested fix    Add Upstream-Status: <status> to the header of meta/recipes-connectivity/openssl/openssl-1.0.2l/0001-openssl-force-soft-link-to-avoid-rare-race.patch (possible values: Pending, Submitted, Accepted, Backport, Denied, Inappropriate)
> > 
> 
> I have:
>     Upstream-status: Inappropriate [build rules rewrite in progress]
> 
> patchtest rules should be case insensitive most of the time and
> particularly for the first character of words in a labels so
>   [Uu]pstream-[Ss]tatus: is okay but not uPsTrEaM-sTaTuS:

This is a topic what have been discussed before and agreed to be strict and make it case sensitive. One of the reason (perhaps not the strongest) for the latter is that it makes much easier the scripting part but there may be other reasons that I can recall.

> 
> Also is there a list server for privately reviewing a patch by email?
> I looked at setting up patchtest locally but got distracted when the
> setup seemed to take more than a few minutes. Maybe I just need
> to focus for longer...

on your current branch, just run the patchtest script located at scripts/contrib/, that would provide basically the same log as the one gotten from patchwork.

> 
> 
> ../Randy
> 
> > 
> > 
> > If you believe any of these test results are incorrect, please reply to the
> > mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> > Otherwise we would appreciate you correcting the issues and submitting a new
> > version of the patchset if applicable. Please ensure you add/increment the
> > version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> > [PATCH v3] -> ...).
> > 
> > ---
> > Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> > Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> > 
> > 
> 
> 
> -- 
> # Randy MacLeod.  WR Linux
> # Wind River an Intel Company
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>


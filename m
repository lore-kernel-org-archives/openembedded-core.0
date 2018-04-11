Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A926471C07
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 22:11:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Apr 2018 15:11:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,438,1517904000"; d="scan'208";a="50051990"
Received: from laitheng-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.65.72])
	by orsmga002.jf.intel.com with ESMTP; 11 Apr 2018 15:11:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Apr 2018 10:11:06 +1200
Message-ID: <2181952.fkZBnDg1uM@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <CAJTo0LY3uVhbN+97EQSXVmLGzgM-JZm33Sy-Mp11MJFWDmNLMA@mail.gmail.com>
References: <1523387170-30191-1-git-send-email-denis@denix.org>
	<CAJTo0La0UV_6yYzdPsFnBtak0JfX0QQU-24JFN1_N7te8=Mepw@mail.gmail.com>
	<CAJTo0LY3uVhbN+97EQSXVmLGzgM-JZm33Sy-Mp11MJFWDmNLMA@mail.gmail.com>
MIME-Version: 1.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH 2/2] weston: upgrade to 4.0.0
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
X-List-Received-Date: Wed, 11 Apr 2018 22:11:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Yes, this is a bit of a known bug although I didn't actually file one until 
now:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=12674

Cheers,
Paul

On Wednesday, 11 April 2018 11:17:51 AM NZST Burton, Ross wrote:
> Ah presumably this is because the U-S is after the scissors.  Denys,
> when you add it back, can you put it above the ---?
> 
> Ross
> 
> On 11 April 2018 at 00:16, Burton, Ross <ross.burton@intel.com> wrote:
> > On 10 April 2018 at 20:06, Denys Dmytriyenko <denis@denix.org> wrote:
> >> diff --git a/meta/recipes-graphics/wayland/weston/0001-make-error-
portable.patch b/meta/recipes-graphics/wayland/weston/0001-make-error-
portable.patch
> >> index 0671a45..6799254 100644
> >> --- a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
> >> +++ b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
> >> @@ -1,26 +1,25 @@
> >> -From c22e90365d89346258394833cbcad03ff32b2e27 Mon Sep 17 00:00:00 2001
> >> +From ad1d2161c811cff25d1684c33611f300adb753bc Mon Sep 17 00:00:00 2001
> >>  From: Khem Raj <raj.khem@gmail.com>
> >>  Date: Fri, 29 May 2015 20:56:00 -0700
> >> -Subject: [PATCH weston] make error() portable
> >> +Subject: [PATCH] make error() portable
> >>
> >>  error() is not posix but gnu extension so may not be available on all
> >>  kind of systemsi e.g. musl.
> >>
> >>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ----
> >> -Upstream-Status: Submitted
> >
> > Ah, I've seen this before and was wondering if it was a genuine
> > mistake or devtool being bad.
> >
> > devtool refresh is doing A Bad Thing and for some reason dropping the
> > Upstream-Status tag.  Alex, can you see why this is?  Denys, can you
> > edit it back in?
> >
> > Ross
> 


-- 

Paul Eggleton
Intel Open Source Technology Centre




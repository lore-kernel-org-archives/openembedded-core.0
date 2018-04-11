Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 444C1746CA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 01:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0073220B53;
	Wed, 11 Apr 2018 01:07:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id BiODfcCTgO8G; Wed, 11 Apr 2018 01:07:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BC709203A8;
	Wed, 11 Apr 2018 01:07:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4FCC616342E; Tue, 10 Apr 2018 21:07:18 -0400 (EDT)
Date: Tue, 10 Apr 2018 21:07:18 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20180411010718.GF3228@denix.org>
References: <1523387170-30191-1-git-send-email-denis@denix.org>
	<1523387170-30191-2-git-send-email-denis@denix.org>
	<CAJTo0La0UV_6yYzdPsFnBtak0JfX0QQU-24JFN1_N7te8=Mepw@mail.gmail.com>
	<CAJTo0LY3uVhbN+97EQSXVmLGzgM-JZm33Sy-Mp11MJFWDmNLMA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY3uVhbN+97EQSXVmLGzgM-JZm33Sy-Mp11MJFWDmNLMA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 11 Apr 2018 01:07:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 11, 2018 at 12:17:51AM +0100, Burton, Ross wrote:
> Ah presumably this is because the U-S is after the scissors.  Denys,
> when you add it back, can you put it above the ---?

Sure, will do.


> On 11 April 2018 at 00:16, Burton, Ross <ross.burton@intel.com> wrote:
> > On 10 April 2018 at 20:06, Denys Dmytriyenko <denis@denix.org> wrote:
> >> diff --git a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
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


Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6834C701BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 14:42:00 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6PEfEA8026580; Fri, 25 Jul 2014 15:41:14 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id w1m2ggeA9R44; Fri, 25 Jul 2014 15:41:13 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6PEf9s3026576
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 25 Jul 2014 15:41:10 +0100
Message-ID: <1406299264.27697.36.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 25 Jul 2014 15:41:04 +0100
In-Reply-To: <CADkTA4P0fQJjmQ_JwrodNSeYrhpjmTQbf=M9EXGOVMoDwoht1g@mail.gmail.com>
References: <cover.1406234258.git.bruce.ashfield@windriver.com>
	<48ca1900cd8400421948c4a2c33c722b979f3292.1406234258.git.bruce.ashfield@windriver.com>
	<20140725132158.GU2492@jama>
	<CADkTA4PP26gr6PozfYFM3Z6-FB2g+EUsUGXQQ46VCjd6xkG4qA@mail.gmail.com>
	<CADkTA4OG_ddsMBzo54kH_FXRo7bNCL+ZQsTHBhdVcYrBLDGX1Q@mail.gmail.com>
	<20140725134601.GV2492@jama>
	<CADkTA4P0fQJjmQ_JwrodNSeYrhpjmTQbf=M9EXGOVMoDwoht1g@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] lttng-modules: update to 2.5.0
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
X-List-Received-Date: Fri, 25 Jul 2014 14:42:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-07-25 at 09:48 -0400, Bruce Ashfield wrote:
> On Fri, Jul 25, 2014 at 9:46 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Fri, Jul 25, 2014 at 09:36:12AM -0400, Bruce Ashfield wrote:
> >> On Fri, Jul 25, 2014 at 9:23 AM, Bruce Ashfield
> >> <bruce.ashfield@gmail.com> wrote:
> >> > On Fri, Jul 25, 2014 at 9:21 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> >> >> On Thu, Jul 24, 2014 at 04:41:48PM -0400, Bruce Ashfield wrote:
> >> >>> During the uprev of the yocto kernel to 3.16, lttng-modules failed to build.
> >> >>> To grab the latest stable content, we update to 2.5.0, and add two patches
> >> >>> to also make it build against 3.16+.
> >> >>>
> >> >>> We also drop the older 2.3.3 lttng-modules, since it is no longer required
> >> >>> to support ARM builds.
> >> >>>
> >> >>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> >> >>> ---
> >> >>>  ...compaction-instrumentation-to-3.16-kernel.patch | 83 ++++++++++++++++++++++
> >> >>>  ...ate-vmscan-instrumentation-to-3.16-kernel.patch | 70 ++++++++++++++++++
> >> >>>  meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb   | 36 ----------
> >> >>>  ...tng-modules_2.4.1.bb => lttng-modules_2.5.0.bb} |  7 +-
> >> >>>  4 files changed, 157 insertions(+), 39 deletions(-)
> >> >>>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-compaction-instrumentation-to-3.16-kernel.patch
> >> >>>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-vmscan-instrumentation-to-3.16-kernel.patch
> >> >>>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
> >> >>>  rename meta/recipes-kernel/lttng/{lttng-modules_2.4.1.bb => lttng-modules_2.5.0.bb} (85%)
> >> >>>
> >> >>
> >> >> ...
> >> >>
> >> >>> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
> >> >>> similarity index 85%
> >> >>> rename from meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb
> >> >>> rename to meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
> >> >>> index 5e05ffc69853..5a99a5adae8b 100644
> >> >>> --- a/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb
> >> >>> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
> >> >>> @@ -10,14 +10,15 @@ DEPENDS = "virtual/kernel"
> >> >>
> >> >> Is the LICENSE = "LGPLv2.1 & GPLv2" correct?
> >> >
> >> > Let me double check. I was doing an update and test, and didn't notice if
> >> > this had changed.
> >> >
> >> > Even if it did change, and I'm just uprev'ing .. I'll fix it, since it
> >> > being wrong
> >> > in the past doesn't give me a free pass to keep it wrong in an update :)
> >>
> >> Too funny. There have been the three MIT licence files since 2011 .. so I agree
> >> that the recipe's summary is long.  I'll tack a patch onto the end of the series
> >> and wait to hear from RP/Saul about anything else I may have broken.
> >
> > Sorry I thought you're maintainer of lttng-*, it seems like Laurentiu is
> 
> No worries. I just get caught in the blast when lttng blows up during
> kernel uprevs, and I fix the wreckage so I can send out my updates :)
> 
> If we don't hear from Laurentiu, I can still do the update, so I'll hold it
> as a separate patch here.

I'm having fun with email, this thread got split into several different
folders. I've merged the series after seeing the nightly builds pass ok
(nice work Bruce!) so I'll take any follow up patches to fix anything
like the LICENSE fields.

Cheers,

Richard



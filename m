Return-Path: <denis@denix.org>
X-Greylist: delayed 3606 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 21 Jan 2015 21:20:31 UTC
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 7829465C7B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 21:20:31 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NIJ00J1MN5H9ID0@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 21 Jan 2015 14:20:06 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Kc1larcG c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=YNv0rlydsVwA:10	a=sozttTNsAAAA:8 a=x2GZnTqNAAAA:8
	a=voM4FWlXAAAA:8 a=ufeRZ5_ruX5nP2qKaocA:9	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4C4982018E; Wed,
	21 Jan 2015 15:20:05 -0500 (EST)
Date: Wed, 21 Jan 2015 15:20:05 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-id: <20150121202005.GK20639@denix.org>
References: <1421165391-30203-1-git-send-email-denis@denix.org>
	<CAP9ODKoygArG8C+wJm7buqgfnjU_MkvfOxoiFGKNfjhAXYgc9g@mail.gmail.com>
	<20150121191123.GH20639@denix.org>
	<CAP9ODKrsE7aWFdVtMrfns3DhC0XJTP=2umjhsU=EZcMmd4EVUQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAP9ODKrsE7aWFdVtMrfns3DhC0XJTP=2umjhsU=EZcMmd4EVUQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to 2015.01
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
X-List-Received-Date: Wed, 21 Jan 2015 21:20:42 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jan 21, 2015 at 06:11:23PM -0200, Otavio Salvador wrote:
> On Wed, Jan 21, 2015 at 5:11 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > On Wed, Jan 21, 2015 at 11:17:19AM -0200, Otavio Salvador wrote:
> >> On Tue, Jan 13, 2015 at 2:09 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> >> > From: Denys Dmytriyenko <denys@ti.com>
> >> >
> >> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >> ...
> >> > +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils/0001-tools-env-fix-build-error.patch
> >> > @@ -0,0 +1,36 @@
> >> > +From ee2d75513452aa6d5306fd380104adc8a2f6d8f2 Mon Sep 17 00:00:00 2001
> >> > +From: Masahiro Yamada <yamada.m@jp.panasonic.com>
> >> > +Date: Wed, 3 Dec 2014 10:22:50 +0900
> >> > +Subject: [PATCH] tools: env: fix build error
> >> > +
> >> > +Since CONFIG_SYS_ARCH, CONFIG_SYS_CPU, ... were moved to Kconfig,
> >> > +tools/env/fw_printenv fails to build if CONFIG_ENV_VARS_UBOOT_CONFIG
> >> > +is defined.
> >> > +(I do not think this is the right way to fix the problem, but
> >> > +for now I do not have enough time to take a close look.)
> >> > +
> >> > +Upstream-Status: Submitted [http://patchwork.ozlabs.org/patch/417192/]
> >> > +
> >> > +Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> >> > +Reported-by: Denys Dmytriyenko <denys@ti.com>
> >>
> >> Is it necessary? In meta-fsl-arm we don't have this patch and get the
> >> tools built.
> >
> > Really? The patch above is rather self-explanatory. The issue was confirmed by
> > U-boot maintainers and the workaround provided by one of the core developers.
> > I'm not familiar with meta-fsl-arm, but I guess you can grep your platform's
> > defconfig to see if CONFIG_ENV_VARS_UBOOT_CONFIG and others are defined and
> > whether your platforms are affected or not. It does affect our platforms
> > (among many others), including beaglebone.
> 
> I think this is for the cross tool only.

Versus what?

-- 
Denys


Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id F010A71637
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 16:33:10 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NIL003VJ7B4FN60@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 22 Jan 2015 10:33:05 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=b6gFOWC0 c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=YNv0rlydsVwA:10	a=sozttTNsAAAA:8 a=x2GZnTqNAAAA:8
	a=voM4FWlXAAAA:8 a=j1XnMIyHfUAVK-_2JEEA:9	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5F9262018E; Thu,
	22 Jan 2015 11:33:04 -0500 (EST)
Date: Thu, 22 Jan 2015 11:33:04 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-id: <20150122163304.GS20639@denix.org>
References: <1421165391-30203-1-git-send-email-denis@denix.org>
	<CAP9ODKoygArG8C+wJm7buqgfnjU_MkvfOxoiFGKNfjhAXYgc9g@mail.gmail.com>
	<20150121191123.GH20639@denix.org>
	<CAP9ODKrsE7aWFdVtMrfns3DhC0XJTP=2umjhsU=EZcMmd4EVUQ@mail.gmail.com>
	<20150121202005.GK20639@denix.org> <20150122160724.GR20639@denix.org>
	<CAP9ODKp+ERVJOzNswp7OpzE6VuOU6E7mmHg82aAVw+NKbB2JBQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAP9ODKp+ERVJOzNswp7OpzE6VuOU6E7mmHg82aAVw+NKbB2JBQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Thu, 22 Jan 2015 16:33:21 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 22, 2015 at 02:12:30PM -0200, Otavio Salvador wrote:
> On Thu, Jan 22, 2015 at 2:07 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > On Wed, Jan 21, 2015 at 03:20:05PM -0500, Denys Dmytriyenko wrote:
> >> On Wed, Jan 21, 2015 at 06:11:23PM -0200, Otavio Salvador wrote:
> >> > On Wed, Jan 21, 2015 at 5:11 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> >> > > On Wed, Jan 21, 2015 at 11:17:19AM -0200, Otavio Salvador wrote:
> >> > >> On Tue, Jan 13, 2015 at 2:09 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> >> > >> > From: Denys Dmytriyenko <denys@ti.com>
> >> > >> >
> >> > >> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >> > >> ...
> >> > >> > +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils/0001-tools-env-fix-build-error.patch
> >> > >> > @@ -0,0 +1,36 @@
> >> > >> > +From ee2d75513452aa6d5306fd380104adc8a2f6d8f2 Mon Sep 17 00:00:00 2001
> >> > >> > +From: Masahiro Yamada <yamada.m@jp.panasonic.com>
> >> > >> > +Date: Wed, 3 Dec 2014 10:22:50 +0900
> >> > >> > +Subject: [PATCH] tools: env: fix build error
> >> > >> > +
> >> > >> > +Since CONFIG_SYS_ARCH, CONFIG_SYS_CPU, ... were moved to Kconfig,
> >> > >> > +tools/env/fw_printenv fails to build if CONFIG_ENV_VARS_UBOOT_CONFIG
> >> > >> > +is defined.
> >> > >> > +(I do not think this is the right way to fix the problem, but
> >> > >> > +for now I do not have enough time to take a close look.)
> >> > >> > +
> >> > >> > +Upstream-Status: Submitted [http://patchwork.ozlabs.org/patch/417192/]
> >> > >> > +
> >> > >> > +Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> >> > >> > +Reported-by: Denys Dmytriyenko <denys@ti.com>
> >> > >>
> >> > >> Is it necessary? In meta-fsl-arm we don't have this patch and get the
> >> > >> tools built.
> >> > >
> >> > > Really? The patch above is rather self-explanatory. The issue was confirmed by
> >> > > U-boot maintainers and the workaround provided by one of the core developers.
> >> > > I'm not familiar with meta-fsl-arm, but I guess you can grep your platform's
> >> > > defconfig to see if CONFIG_ENV_VARS_UBOOT_CONFIG and others are defined and
> >> > > whether your platforms are affected or not. It does affect our platforms
> >> > > (among many others), including beaglebone.
> >> >
> >> > I think this is for the cross tool only.
> >>
> >> Versus what?
> >
> > Please clarify what exactly you meant with the statement above? Thanks.
> 
> The fw-utils require the machine configuration, right?

Right.


> So it depends on the machine to be setup before running the build.

Correct.


> This is the reason it ends being a cross and not a native tool.

Well, partially correct. There are 2 versions of fw-utils recipe - target and 
cross. There is no native version of fw-utils and logically it doesn't even 
make sense.

Now, for both of the target and cross recipes we need the machine config:

do_compile () {
        oe_runmake ${UBOOT_MACHINE}
        oe_runmake env
}

So, your statement that the patch above is only needed for the cross is 
incorrect or misleading.


> I think your patch does address part of the issue. We now need to
> figure what has been lost when moving to the kbuild system.

The patch above is not mine, but comes from U-boot core developer who was 
instrumental in kbuild migration - Masahiro Yamada. There's currently no 
proper fix for the issue and the suggested workaround is a hack, but it is 
sufficient and safe enough to get the tools built, which is what we need. And 
since it may not be safe for the rest of U-boot, I only apply it to fw-utils 
recipes.


> I can try to help to debug it if you want...

You are more than welcome to lend a hand to U-boot developers in debugging and 
finding a proper fix for the problem... ;)

-- 
Denys


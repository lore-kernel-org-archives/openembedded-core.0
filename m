Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C319CAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 22:42:32 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.2262.1758235348308714664
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 15:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=C6ZV/m3s;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58IMgFqv103582;
	Thu, 18 Sep 2025 17:42:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758235335;
	bh=LbwAQoWb164nUn2edSIX9sgvUPeQ/buHbjU6sr3pCHQ=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=C6ZV/m3s0Wy+riB1L5hkg0k/FRzgzrKoOr71VPEma4KzzfCgawWavajQGeWrJYtxM
	 ZbjN6bycCYWTqBK0A9rXPOX97O0OgYET0ROcGqrPZXGS3JBVebS6frE2bwdWV2ZR/c
	 op96nXQgFt6EMmCMkr/K0owinfmTQiQfR8fD+kxI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58IMgEwK1873432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 18 Sep 2025 17:42:15 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 17:42:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 17:42:14 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58IMgESo1581613;
	Thu, 18 Sep 2025 17:42:14 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 18 Sep 2025 17:42:14 -0500
Message-ID: <DCWAEPXOFEE4.Q4F6GTPJ7TTZ@ti.com>
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>,
        <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv9 0/6] Display manager proposal for x11 and
 wayland
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, Joshua Watt <jpewhacker@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250918214903.341452-1-rs@ti.com>
 <CAJdd5GZFeR4OHG09g8z1RC1PFBzJh72EHUbLx2CPfa5CKK75sA@mail.gmail.com>
 <DCWA6GFPV2UX.3777W4JSPK51A@ti.com>
 <CAJdd5GZFK_1eoHLWSZ2_gf69Mp7Q2er6Q=KAoBHiMAGQpgjTDA@mail.gmail.com>
 <186681957172BF4C.23626@lists.openembedded.org>
In-Reply-To: <186681957172BF4C.23626@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 22:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223707

On Thu Sep 18, 2025 at 5:39 PM CDT, Randolph Sapp via lists.openembedded.or=
g wrote:
> On Thu Sep 18, 2025 at 5:35 PM CDT, Joshua Watt wrote:
>> On Thu, Sep 18, 2025 at 4:31=E2=80=AFPM Randolph Sapp <rs@ti.com> wrote:
>>>
>>> On Thu Sep 18, 2025 at 5:25 PM CDT, Joshua Watt wrote:
>>> > On Thu, Sep 18, 2025 at 3:49=E2=80=AFPM Randolph Sapp via
>>> > lists.openembedded.org <rs=3Dti.com@lists.openembedded.org> wrote:
>>> >>
>>> >> From: Randolph Sapp <rs@ti.com>
>>> >>
>>> >> We've recently run into some issues with weston-init attempting to s=
tart Weston
>>> >> prior to all drm devices being registered. There's not really a good=
, scriptable
>>> >> mechanism to listen in to device registration events that works with=
 the
>>> >> existing weston-init package. Well, at least one that doesn't involv=
e polling
>>> >> files or introducing more dependency on the init system being used.
>>> >
>>> > It's not clear how switching to emptty actually solves that problem; =
I
>>> > don't see anything in my (brief) look at the emptty code that would
>>> > lead me to believe it actually cares about any drm devices being
>>> > present or handles devices showing up dynamically. Can you maybe
>>> > elaborate more on this?
>>>
>>> It doesn't currently have any tests to wait for the DRM device. I still=
 need to
>>> look into adding that, but what it currently does is add a retry event =
counter
>>> and a small delay between retries that is better than the current conso=
le
>>> implementations. Especially considering authentication is handled separ=
ately
>>> from this retry process.
>>>
>>> By centralizing display manager specific code, common checks and fallba=
ck logic
>>> can be more easily implemented in the future. I'm hoping this lays the
>>> groundwork to let me address some other issues I've seen in multi-card
>>> environments as well.
>>
>> For the systemd parts, is it also possible to solve this with e.g.
>>
>> Requires=3Ddev-dri-card0.device
>> After=3Ddev-dri-card0.device
>>
>> (or similar) ? Seems like anything emptty would be doing would be a
>> reimplementation of the logic that already exists in systemd to do
>> that.
>
> It gets messy. A udev rule needs to be made to make systemd track that de=
vice.
> In a multi-card environment a device without an actual display may be pic=
ked.
> Systemd cannot directly solve the issue on it's own.

Additionally, there are more init systems supported here than just systemd.=
..

>>> >> I also see there is also a lot of scripting around starting X11,
>>> >> xserver-nodm-init, that (from my limited review) should experience t=
he same
>>> >> issue.
>>> >>
>>> >> I'd like to introduce the following display manager for oe-core, emp=
tty [1].
>>> >> This display manager is, as described upstream, a "Dead simple CLI D=
isplay
>>> >> Manager on TTY". It supports both x11 and wayland sessions, with tog=
glable build
>>> >> parameters to completely remove x11 and pam dependencies. It's licen=
sed MIT,
>>> >> which shouldn't be an issue for any users. (It is written in Go, if =
you have
>>> >> opinions about that.)
>>> >>
>>> >> With this, both weston-init and the xserver-nodm-init packages can b=
e re-tuned
>>> >> to leverage this display manager and simply add a user and emptty co=
nfig for an
>>> >> autologin session. This can resolve the current behavior across init=
 systems
>>> >> without additional scripting, and move some development out of this =
layer.
>>> >>
>>> >> This lists myself as a maintainer of emptty as well as xserver-nodm-=
init and
>>> >> xuser-account since these are currently unassigned and I've reworked=
 them
>>> >> significantly here.
>>> >>
>>> >> Sorry for the delay on this series. I found a few bugs in emptty tha=
t I wanted
>>> >> to address before submitting this officially.
>>> >>
>>> >> [1] https://github.com/tvrzna/emptty
>>> >>
>>> >> v2:
>>> >>         - Address spelling issues in commit messages
>>> >>         - Attempt to resolve some test related issues with weston
>>> >>         - Add additional logs to X11 related tests
>>> >> v3:
>>> >>         - Reset AUTOLOGIN_MAX_RETRY to the default value of 2. When =
running
>>> >>           under QEMU the first auth attempt almost always fails.
>>> >> v4:
>>> >>         - Add a tmpfile entry for the x11 domain socket directory.
>>> >>         - Remove some scripts associated with weston-init that were =
being
>>> >>           shipped with weston
>>> >> v5:
>>> >>         - Move tmpfile data to individual files
>>> >>         - Add explicit entries for these in the FILES variable
>>> >> v6:
>>> >>         - Do not attempt to ship a tmpfiles.d entry in libx11
>>> >> v7:
>>> >>         - Include a backported fix for go/runtime to address segfaul=
t issues
>>> >>           reported on x86 platforms in previous revisions
>>> >> v8:
>>> >>         - Sign-off backported patch
>>> >> v9:
>>> >>         - Resolve merge conflict in maintainers file
>>> >>
>>> >> Randolph Sapp (6):
>>> >>   libx11: create tmpfile dir for x11 domain socket
>>> >>   go: fix sigaction usage on i386 platforms
>>> >>   emptty: add version 0.14.0
>>> >>   weston-init: convert to virtual-emptty-conf
>>> >>   weston: remove deprecated weston-start scripts
>>> >>   xserver-nodm-init: convert to virtual-emptty-conf
>>> >>
>>> >>  .../conf/distro/include/default-providers.inc |   1 +
>>> >>  meta/conf/distro/include/maintainers.inc      |   6 +-
>>> >>  meta/lib/oeqa/runtime/cases/weston.py         |  18 +-
>>> >>  meta/lib/oeqa/runtime/cases/xorg.py           |   8 +
>>> >>  meta/recipes-devtools/go/go-1.25.0.inc        |   1 +
>>> >>  ...ng-cgo-on-386-call-C-sigaction-funct.patch | 248 ++++++++++++
>>> >>  meta/recipes-graphics/emptty/emptty-conf.bb   |  14 +
>>> >>  meta/recipes-graphics/emptty/emptty.inc       |  26 ++
>>> >>  .../recipes-graphics/emptty/emptty/emptty.tab |   1 +
>>> >>  meta/recipes-graphics/emptty/emptty/pamconf   |  10 +
>>> >>  meta/recipes-graphics/emptty/emptty_0.14.0.bb |  53 +++
>>> >>  meta/recipes-graphics/wayland/weston-init.bb  |  61 +--
>>> >>  .../wayland/weston-init/emptty.conf           |  77 ++++
>>> >>  .../recipes-graphics/wayland/weston-init/init |  54 ---
>>> >>  .../wayland/weston-init/weston-autologin      |  11 -
>>> >>  .../wayland/weston-init/weston-socket.sh      |  20 -
>>> >>  .../wayland/weston-init/weston-start          |  76 ----
>>> >>  .../wayland/weston-init/weston.env            |   0
>>> >>  .../wayland/weston-init/weston.service        |  71 ----
>>> >>  .../wayland/weston-init/weston.socket         |  14 -
>>> >>  .../weston/systemd-notify.weston-start        |   9 -
>>> >>  .../wayland/weston/xwayland.weston-start      |   6 -
>>> >>  .../recipes-graphics/wayland/weston_14.0.2.bb |  10 -
>>> >>  .../x11-common/xserver-nodm-init/X11/Xsession |  38 --
>>> >>  .../X11/Xsession.d/13xdgbasedirs.sh           |  19 -
>>> >>  .../X11/Xsession.d/89xdgautostart.sh          |   7 -
>>> >>  .../X11/Xsession.d/90XWindowManager.sh        |   7 -
>>> >>  .../x11-common/xserver-nodm-init/Xserver      |  25 --
>>> >>  .../xserver-nodm-init/capability.conf         |   2 -
>>> >>  .../xserver-nodm-init/default.desktop         |   5 +
>>> >>  .../xserver-nodm-init/emptty.conf.in          |  77 ++++
>>> >>  .../xserver-nodm-init/gplv2-license.patch     | 355 ---------------=
---
>>> >>  .../x11-common/xserver-nodm-init/xserver-nodm |  75 ----
>>> >>  .../xserver-nodm-init/xserver-nodm.conf.in    |   7 -
>>> >>  .../xserver-nodm-init/xserver-nodm.service.in |  11 -
>>> >>  .../x11-common/xserver-nodm-init_3.0.bb       |  57 +--
>>> >>  meta/recipes-graphics/xorg-lib/libx11/99_x11  |   1 +
>>> >>  .../xorg-lib/libx11_1.8.12.bb                 |  15 +-
>>> >>  .../user-creation/xuser-account_0.1.bb        |   3 +-
>>> >>  39 files changed, 581 insertions(+), 918 deletions(-)
>>> >>  create mode 100644 meta/recipes-devtools/go/go/0001-runtime-when-us=
ing-cgo-on-386-call-C-sigaction-funct.patch
>>> >>  create mode 100644 meta/recipes-graphics/emptty/emptty-conf.bb
>>> >>  create mode 100644 meta/recipes-graphics/emptty/emptty.inc
>>> >>  create mode 100644 meta/recipes-graphics/emptty/emptty/emptty.tab
>>> >>  create mode 100644 meta/recipes-graphics/emptty/emptty/pamconf
>>> >>  create mode 100644 meta/recipes-graphics/emptty/emptty_0.14.0.bb
>>> >>  create mode 100644 meta/recipes-graphics/wayland/weston-init/emptty=
.conf
>>> >>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/init
>>> >>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston=
-autologin
>>> >>  delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston=
-socket.sh
>>> >>  delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston=
-start
>>> >>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston=
.env
>>> >>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston=
.service
>>> >>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston=
.socket
>>> >>  delete mode 100644 meta/recipes-graphics/wayland/weston/systemd-not=
ify.weston-start
>>> >>  delete mode 100644 meta/recipes-graphics/wayland/weston/xwayland.we=
ston-start
>>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-in=
it/X11/Xsession
>>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-in=
it/X11/Xsession.d/13xdgbasedirs.sh
>>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-in=
it/X11/Xsession.d/89xdgautostart.sh
>>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-in=
it/X11/Xsession.d/90XWindowManager.sh
>>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-in=
it/Xserver
>>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-in=
it/capability.conf
>>> >>  create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-in=
it/default.desktop
>>> >>  create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-in=
it/emptty.conf.in
>>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-in=
it/gplv2-license.patch
>>> >>  delete mode 100755 meta/recipes-graphics/x11-common/xserver-nodm-in=
it/xserver-nodm
>>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-in=
it/xserver-nodm.conf.in
>>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-in=
it/xserver-nodm.service.in
>>> >>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11/99_x11
>>> >>
>>> >> --
>>> >> 2.51.0
>>> >>
>>> >>
>>> >>=20
>>> >>
>>>



Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A37CA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 23:13:52 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.2803.1758237223996957625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 16:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ibcuDQbo;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58INDXUv109866;
	Thu, 18 Sep 2025 18:13:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758237213;
	bh=WQrIuK8uZuqP8cimuALFjYMnnHFebeSE77Yb6kQGhrg=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=ibcuDQbolnTn8UFBEBpFSJ7AAPeYr8H4Yi29lEwNnP4Z1xpkf1j+s5n0wxUxrtD0N
	 hZvSlBfX55+JofSYIbR/4gq+DgjLBkKpJzcEGLGzLPOjZya7PzwxCoJNtFKhzIgFkg
	 d8iA6z3fxjDQQeqDk2QVkpMsAveTlRDocyg//HzU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58INDXGn1888311
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 18 Sep 2025 18:13:33 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 18:13:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 18:13:33 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58INDXKi1611614;
	Thu, 18 Sep 2025 18:13:33 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 18 Sep 2025 18:13:33 -0500
Message-ID: <DCWB2OXGZMG7.1H205AVNHSCVT@ti.com>
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>,
        <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv9 0/6] Display manager proposal for x11 and
 wayland
From: Randolph Sapp <rs@ti.com>
To: Joshua Watt <jpewhacker@gmail.com>, Randolph Sapp <rs@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250918214903.341452-1-rs@ti.com>
 <CAJdd5GZFeR4OHG09g8z1RC1PFBzJh72EHUbLx2CPfa5CKK75sA@mail.gmail.com>
 <DCWA6GFPV2UX.3777W4JSPK51A@ti.com>
 <CAJdd5GZFK_1eoHLWSZ2_gf69Mp7Q2er6Q=KAoBHiMAGQpgjTDA@mail.gmail.com>
 <186681957172BF4C.23626@lists.openembedded.org>
 <DCWAEPXOFEE4.Q4F6GTPJ7TTZ@ti.com>
 <CAJdd5GbSE6A4B9c-euprk84Y5Qyn_JwyOksFA+nBhaDM8ZVSYw@mail.gmail.com>
In-Reply-To: <CAJdd5GbSE6A4B9c-euprk84Y5Qyn_JwyOksFA+nBhaDM8ZVSYw@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 23:13:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223711

On Thu Sep 18, 2025 at 6:03 PM CDT, Joshua Watt wrote:
> On Thu, Sep 18, 2025 at 4:42=E2=80=AFPM Randolph Sapp <rs@ti.com> wrote:
>>
>> On Thu Sep 18, 2025 at 5:39 PM CDT, Randolph Sapp via lists.openembedded=
.org wrote:
>> > On Thu Sep 18, 2025 at 5:35 PM CDT, Joshua Watt wrote:
>> >> On Thu, Sep 18, 2025 at 4:31=E2=80=AFPM Randolph Sapp <rs@ti.com> wro=
te:
>> >>>
>> >>> On Thu Sep 18, 2025 at 5:25 PM CDT, Joshua Watt wrote:
>> >>> > On Thu, Sep 18, 2025 at 3:49=E2=80=AFPM Randolph Sapp via
>> >>> > lists.openembedded.org <rs=3Dti.com@lists.openembedded.org> wrote:
>> >>> >>
>> >>> >> From: Randolph Sapp <rs@ti.com>
>> >>> >>
>> >>> >> We've recently run into some issues with weston-init attempting t=
o start Weston
>> >>> >> prior to all drm devices being registered. There's not really a g=
ood, scriptable
>> >>> >> mechanism to listen in to device registration events that works w=
ith the
>> >>> >> existing weston-init package. Well, at least one that doesn't inv=
olve polling
>> >>> >> files or introducing more dependency on the init system being use=
d.
>> >>> >
>> >>> > It's not clear how switching to emptty actually solves that proble=
m; I
>> >>> > don't see anything in my (brief) look at the emptty code that woul=
d
>> >>> > lead me to believe it actually cares about any drm devices being
>> >>> > present or handles devices showing up dynamically. Can you maybe
>> >>> > elaborate more on this?
>> >>>
>> >>> It doesn't currently have any tests to wait for the DRM device. I st=
ill need to
>> >>> look into adding that, but what it currently does is add a retry eve=
nt counter
>> >>> and a small delay between retries that is better than the current co=
nsole
>> >>> implementations. Especially considering authentication is handled se=
parately
>> >>> from this retry process.
>> >>>
>> >>> By centralizing display manager specific code, common checks and fal=
lback logic
>> >>> can be more easily implemented in the future. I'm hoping this lays t=
he
>> >>> groundwork to let me address some other issues I've seen in multi-ca=
rd
>> >>> environments as well.
>> >>
>> >> For the systemd parts, is it also possible to solve this with e.g.
>> >>
>> >> Requires=3Ddev-dri-card0.device
>> >> After=3Ddev-dri-card0.device
>> >>
>> >> (or similar) ? Seems like anything emptty would be doing would be a
>> >> reimplementation of the logic that already exists in systemd to do
>> >> that.
>> >
>> > It gets messy. A udev rule needs to be made to make systemd track that=
 device.
>
> Ya, that's pretty normal.

Udev is dependent on systemd. Eudev exists, but why would we pull that in s=
imply
to manage displays. It's not necessary for anything else at the moment.

>> > In a multi-card environment a device without an actual display may be =
picked.
>> > Systemd cannot directly solve the issue on it's own.
>
> Sure, but isn't that what udev is for? I don't think adding selection
> of a drm device makes sense in emptty. Regardless of init system, it
> really feels like selection of the correct device to use for display
> should be a udev problem.

Udev can track events but it does not report existing states. If a display =
is
already plugged in during boot then we won't know. We can catch the plug ev=
ent
and operate on it, but otherwise it's a guess to see what we can do at boot=
.

For quite some time there has been a service to *manage displays* prior to
starting the desktop environment. GDM is a good example of that. Greetd is
another. Lightdm is another. Emptty is just an example of a useful all-roun=
der
with a permissive license I thought people would appreciate.

>> Additionally, there are more init systems supported here than just syste=
md...
>>
>> >>> >> I also see there is also a lot of scripting around starting X11,
>> >>> >> xserver-nodm-init, that (from my limited review) should experienc=
e the same
>> >>> >> issue.
>> >>> >>
>> >>> >> I'd like to introduce the following display manager for oe-core, =
emptty [1].
>> >>> >> This display manager is, as described upstream, a "Dead simple CL=
I Display
>> >>> >> Manager on TTY". It supports both x11 and wayland sessions, with =
togglable build
>> >>> >> parameters to completely remove x11 and pam dependencies. It's li=
censed MIT,
>> >>> >> which shouldn't be an issue for any users. (It is written in Go, =
if you have
>> >>> >> opinions about that.)
>> >>> >>
>> >>> >> With this, both weston-init and the xserver-nodm-init packages ca=
n be re-tuned
>> >>> >> to leverage this display manager and simply add a user and emptty=
 config for an
>> >>> >> autologin session. This can resolve the current behavior across i=
nit systems
>> >>> >> without additional scripting, and move some development out of th=
is layer.
>> >>> >>
>> >>> >> This lists myself as a maintainer of emptty as well as xserver-no=
dm-init and
>> >>> >> xuser-account since these are currently unassigned and I've rewor=
ked them
>> >>> >> significantly here.
>> >>> >>
>> >>> >> Sorry for the delay on this series. I found a few bugs in emptty =
that I wanted
>> >>> >> to address before submitting this officially.
>> >>> >>
>> >>> >> [1] https://github.com/tvrzna/emptty
>> >>> >>
>> >>> >> v2:
>> >>> >>         - Address spelling issues in commit messages
>> >>> >>         - Attempt to resolve some test related issues with weston
>> >>> >>         - Add additional logs to X11 related tests
>> >>> >> v3:
>> >>> >>         - Reset AUTOLOGIN_MAX_RETRY to the default value of 2. Wh=
en running
>> >>> >>           under QEMU the first auth attempt almost always fails.
>> >>> >> v4:
>> >>> >>         - Add a tmpfile entry for the x11 domain socket directory=
.
>> >>> >>         - Remove some scripts associated with weston-init that we=
re being
>> >>> >>           shipped with weston
>> >>> >> v5:
>> >>> >>         - Move tmpfile data to individual files
>> >>> >>         - Add explicit entries for these in the FILES variable
>> >>> >> v6:
>> >>> >>         - Do not attempt to ship a tmpfiles.d entry in libx11
>> >>> >> v7:
>> >>> >>         - Include a backported fix for go/runtime to address segf=
ault issues
>> >>> >>           reported on x86 platforms in previous revisions
>> >>> >> v8:
>> >>> >>         - Sign-off backported patch
>> >>> >> v9:
>> >>> >>         - Resolve merge conflict in maintainers file
>> >>> >>
>> >>> >> Randolph Sapp (6):
>> >>> >>   libx11: create tmpfile dir for x11 domain socket
>> >>> >>   go: fix sigaction usage on i386 platforms
>> >>> >>   emptty: add version 0.14.0
>> >>> >>   weston-init: convert to virtual-emptty-conf
>> >>> >>   weston: remove deprecated weston-start scripts
>> >>> >>   xserver-nodm-init: convert to virtual-emptty-conf
>> >>> >>
>> >>> >>  .../conf/distro/include/default-providers.inc |   1 +
>> >>> >>  meta/conf/distro/include/maintainers.inc      |   6 +-
>> >>> >>  meta/lib/oeqa/runtime/cases/weston.py         |  18 +-
>> >>> >>  meta/lib/oeqa/runtime/cases/xorg.py           |   8 +
>> >>> >>  meta/recipes-devtools/go/go-1.25.0.inc        |   1 +
>> >>> >>  ...ng-cgo-on-386-call-C-sigaction-funct.patch | 248 ++++++++++++
>> >>> >>  meta/recipes-graphics/emptty/emptty-conf.bb   |  14 +
>> >>> >>  meta/recipes-graphics/emptty/emptty.inc       |  26 ++
>> >>> >>  .../recipes-graphics/emptty/emptty/emptty.tab |   1 +
>> >>> >>  meta/recipes-graphics/emptty/emptty/pamconf   |  10 +
>> >>> >>  meta/recipes-graphics/emptty/emptty_0.14.0.bb |  53 +++
>> >>> >>  meta/recipes-graphics/wayland/weston-init.bb  |  61 +--
>> >>> >>  .../wayland/weston-init/emptty.conf           |  77 ++++
>> >>> >>  .../recipes-graphics/wayland/weston-init/init |  54 ---
>> >>> >>  .../wayland/weston-init/weston-autologin      |  11 -
>> >>> >>  .../wayland/weston-init/weston-socket.sh      |  20 -
>> >>> >>  .../wayland/weston-init/weston-start          |  76 ----
>> >>> >>  .../wayland/weston-init/weston.env            |   0
>> >>> >>  .../wayland/weston-init/weston.service        |  71 ----
>> >>> >>  .../wayland/weston-init/weston.socket         |  14 -
>> >>> >>  .../weston/systemd-notify.weston-start        |   9 -
>> >>> >>  .../wayland/weston/xwayland.weston-start      |   6 -
>> >>> >>  .../recipes-graphics/wayland/weston_14.0.2.bb |  10 -
>> >>> >>  .../x11-common/xserver-nodm-init/X11/Xsession |  38 --
>> >>> >>  .../X11/Xsession.d/13xdgbasedirs.sh           |  19 -
>> >>> >>  .../X11/Xsession.d/89xdgautostart.sh          |   7 -
>> >>> >>  .../X11/Xsession.d/90XWindowManager.sh        |   7 -
>> >>> >>  .../x11-common/xserver-nodm-init/Xserver      |  25 --
>> >>> >>  .../xserver-nodm-init/capability.conf         |   2 -
>> >>> >>  .../xserver-nodm-init/default.desktop         |   5 +
>> >>> >>  .../xserver-nodm-init/emptty.conf.in          |  77 ++++
>> >>> >>  .../xserver-nodm-init/gplv2-license.patch     | 355 ------------=
------
>> >>> >>  .../x11-common/xserver-nodm-init/xserver-nodm |  75 ----
>> >>> >>  .../xserver-nodm-init/xserver-nodm.conf.in    |   7 -
>> >>> >>  .../xserver-nodm-init/xserver-nodm.service.in |  11 -
>> >>> >>  .../x11-common/xserver-nodm-init_3.0.bb       |  57 +--
>> >>> >>  meta/recipes-graphics/xorg-lib/libx11/99_x11  |   1 +
>> >>> >>  .../xorg-lib/libx11_1.8.12.bb                 |  15 +-
>> >>> >>  .../user-creation/xuser-account_0.1.bb        |   3 +-
>> >>> >>  39 files changed, 581 insertions(+), 918 deletions(-)
>> >>> >>  create mode 100644 meta/recipes-devtools/go/go/0001-runtime-when=
-using-cgo-on-386-call-C-sigaction-funct.patch
>> >>> >>  create mode 100644 meta/recipes-graphics/emptty/emptty-conf.bb
>> >>> >>  create mode 100644 meta/recipes-graphics/emptty/emptty.inc
>> >>> >>  create mode 100644 meta/recipes-graphics/emptty/emptty/emptty.ta=
b
>> >>> >>  create mode 100644 meta/recipes-graphics/emptty/emptty/pamconf
>> >>> >>  create mode 100644 meta/recipes-graphics/emptty/emptty_0.14.0.bb
>> >>> >>  create mode 100644 meta/recipes-graphics/wayland/weston-init/emp=
tty.conf
>> >>> >>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/ini=
t
>> >>> >>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/wes=
ton-autologin
>> >>> >>  delete mode 100755 meta/recipes-graphics/wayland/weston-init/wes=
ton-socket.sh
>> >>> >>  delete mode 100755 meta/recipes-graphics/wayland/weston-init/wes=
ton-start
>> >>> >>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/wes=
ton.env
>> >>> >>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/wes=
ton.service
>> >>> >>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/wes=
ton.socket
>> >>> >>  delete mode 100644 meta/recipes-graphics/wayland/weston/systemd-=
notify.weston-start
>> >>> >>  delete mode 100644 meta/recipes-graphics/wayland/weston/xwayland=
.weston-start
>> >>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm=
-init/X11/Xsession
>> >>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm=
-init/X11/Xsession.d/13xdgbasedirs.sh
>> >>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm=
-init/X11/Xsession.d/89xdgautostart.sh
>> >>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm=
-init/X11/Xsession.d/90XWindowManager.sh
>> >>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm=
-init/Xserver
>> >>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm=
-init/capability.conf
>> >>> >>  create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm=
-init/default.desktop
>> >>> >>  create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm=
-init/emptty.conf.in
>> >>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm=
-init/gplv2-license.patch
>> >>> >>  delete mode 100755 meta/recipes-graphics/x11-common/xserver-nodm=
-init/xserver-nodm
>> >>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm=
-init/xserver-nodm.conf.in
>> >>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm=
-init/xserver-nodm.service.in
>> >>> >>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11/99_x11
>> >>> >>
>> >>> >> --
>> >>> >> 2.51.0
>> >>> >>
>> >>> >>
>> >>> >>
>> >>> >>
>> >>>
>>



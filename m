Return-Path: <pespin.shar@gmail.com>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4397A6FF78
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2016 18:16:25 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id h129so14964645lfh.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2016 11:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Zmq/NiFayCismvIAl1a3Of8+ZzKhM+W8K1/TmKsxhL8=;
	b=XX5mnszHTDu3kyvyR2xwRqLL18CFqDmwZUCmzSahQw/30yUpDTlkjKqok6g6iTYD0V
	uw7GS6n3zfzgPJY9g9yKduy7LIme/TEkPi5tplB5lwpsI8Cp2vAgtUqF0FTLyKWo8mwF
	opGZe+iQw/nAAzCiLcpJ8BRmujHhuzEBjowYjbUjOZVLkqeizDL+dB/uPxPVKHi7ikhL
	Po6CZxNeSbD0h5YS/Cd1BnyiWEJ2zdcvnsgsqeuHJLu9p60TCcGP7JPm3CALN+ftct98
	rSCZv/DRs8SKPHvmShCM7/Q+MKDXGWZNsX9EdZyDEWUkvxQyXbd2wnhPpza3yLK7pRaq
	h39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Zmq/NiFayCismvIAl1a3Of8+ZzKhM+W8K1/TmKsxhL8=;
	b=Y9XVAnH15gp+Bt4QVJi3h0JQPD+mBDI0Hah+RYa/e1D3qu+pIsUTSivoKEDvJ5rrBy
	4oAIftbbWe1tVv1iTT8FmQHrNWohaEPGKZIqsuogaI+DVFz2KosT4iOflQtrful00QDH
	NoGyWDcizT9uKykALqX60bCA/xhmKVjlQUP1FdQ7OYOvBd7x/0gkOBLEz8tPTjFIhO4y
	ULBP7pFlYdFwv4vR4i6t1aEXdX1paGF17wK+Age1x3E72l6CsRA31VqtDj1QGx+HsQLJ
	Dlq+lAdmsm6oq/zeSJ1PrmuD2kedcrCYoahlbMRJqayJCkPJHLcohWwSbkGpbOxCZyN6
	YAaA==
X-Gm-Message-State: ALyK8tIS1C+dHgjIVY+Q10Tp4GKZ7krPf4TJjfnX/zO+y7h417HDgVyVL3DPLTkclSJSdNld85AT4JNIhA29MA==
X-Received: by 10.25.89.8 with SMTP id n8mr1799364lfb.225.1466273785339; Sat,
	18 Jun 2016 11:16:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.85.195 with HTTP; Sat, 18 Jun 2016 11:16:24 -0700 (PDT)
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
Date: Sat, 18 Jun 2016 20:16:24 +0200
Message-ID: <CAEGpDuZ+F68oweoNAEgj9o6e046yGAFp=R2cB9n0XiZYAtc3QA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/42] General cleanage of systemd unitdir vars
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
X-List-Received-Date: Sat, 18 Jun 2016 18:16:28 -0000
Content-Type: multipart/alternative; boundary=001a114210b41e70cd0535917887

--001a114210b41e70cd0535917887
Content-Type: text/plain; charset=UTF-8

Hi,

I sent this series of patches around 3 months ago and got no aswer at all,
so just wondering if is it gonna ever be reviewed/merged.

I know maintainers are currently kind of overwhelmed with the big amount of
patches received every day, but I'd like to know if it makes sense for me
to spend more time on this.

Pau Espin Pedrol

2016-03-13 20:12 GMT+01:00 Pau Espin Pedrol <pespin.shar@gmail.com>:

> * These series of patches aim at improving the usage of some systemd
> related variables
>   in several recipes from oe-core. Main aim is to change those recipes to
> use
>   'systemd_system_unitdir' instead of the old 'systemd_unitdir/system'
> variable,
>   which will be marked as deprecated instead of being removed as is may
> still be
>   used in other oe layers. To mark it as deprecated, a comment is added in
> bitbake.conf,
>   but better ideas regarding this are welcome.
>
> * Few recipes have also been changed to use the 'systemd_user_unitdir'
> variable for
>   their systemd user services.
>
> The following changes since commit
> 4be0e15f74cff85edca9de55248939fb438f30ae:
>
>   oeqa/selftest/recipetool: Fix test_recipetool_create_simple (2016-03-13
> 18:15:41 +0000)
>
> are available in the git repository at:
>
>   git://github.com/pespin/openembedded-core systemd-var-fixes
>   https://github.com/pespin/openembedded-core/tree/systemd-var-fixes
>
> Pau Espin Pedrol (42):
>   rootfs-postcommands: Fix usage of systemd unitdir vars
>   acpid: Fix usage of systemd unitdir vars
>   apmd: Fix usage of systemd unitdir vars
>   avahi: Fix usage of systemd unitdir vars
>   bind: Fix usage of systemd unitdir vars
>   connman: Fix usage of systemd unitdir vars
>   dhcp: Fix usage of systemd unitdir vars
>   neard: Fix usage of systemd unitdir vars
>   nfs-utils: Fix usage of systemd unitdir vars
>   openssh: Fix usage of systemd unitdir vars
>   portmap: Fix usage of systemd unitdir vars
>   ppp: Fix usage of systemd unitdir vars
>   wpa-supplicant: Fix usage of systemd unitdir vars
>   busybox: Fix usage of systemd unitdir vars
>   dropbear: Fix usage of systemd unitdir vars
>   glibc-package: Fix usage of systemd unitdir vars
>   systemd-compat-units: Fix usage of systemd unitdir vars
>   systemd-serialgetty: Fix usage of systemd unitdir vars
>   systemd: Fix usage of systemd unitdir vars
>   util-linux: Fix usage of systemd unitdir vars
>   volatile-binds: Fix usage of systemd unitdir vars
>   distcc: Fix usage of systemd unitdir vars
>   run-postints: Fix usage of systemd unitdir vars
>   tcf-agent: Fix usage of systemd unitdir vars
>   at: Fix usage of systemd unitdir vars
>   cronie: Fix usage of systemd unitdir vars
>   lighttpd: Fix usage of systemd unitdir vars
>   rpcbind: Fix usage of systemd unitdir vars
>   sysstat: Fix usage of systemd unitdir vars
>   xinetd: Fix usage of systemd unitdir vars
>   xserver-nodm-init: Fix usage of systemd unitdir vars
>   oprofileui-server: Fix usage of systemd unitdir vars
>   consolekit: Fix usage of systemd unitdir vars
>   alsa-utils: Fix usage of systemd unitdir vars
>   ofono: Fix usage of systemd unitdir vars
>   bluez5: Fix usage of systemd unitdir vars
>   avahi-ui: Fix usage of systemd unitdir vars
>   opkg: Fix usage of systemd unitdir vars
>   dpkg: Fix usage of systemd unitdir vars
>   systemd.bbclass: Remove user services too if systemd is not enabled
>   systemd: Remove usage of systemd_unitdir
>   bitbake.conf: Mark systemd_unitdir as deprecated to avoid future use
>
>  meta/classes/rootfs-postcommands.bbclass           |  4 +-
>  meta/classes/systemd.bbclass                       | 19 ++++--
>  meta/conf/bitbake.conf                             |  3 +
>  meta/recipes-bsp/acpid/acpid.inc                   |  6 +-
>  meta/recipes-bsp/apmd/apmd_3.2.2-15.bb             |  6 +-
>  meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb |  8 +--
>  meta/recipes-connectivity/avahi/avahi.inc          |  2 +-
>  meta/recipes-connectivity/bind/bind_9.10.3-P3.bb   |  6 +-
>  meta/recipes-connectivity/bluez5/bluez5.inc        |  4 +-
>  meta/recipes-connectivity/connman/connman.inc      |  6 +-
>  meta/recipes-connectivity/dhcp/dhcp.inc            | 16 ++---
>  meta/recipes-connectivity/neard/neard_0.15.bb      |  2 +-
>  .../nfs-utils/nfs-utils_1.3.3.bb                   | 20 +++---
>  meta/recipes-connectivity/ofono/ofono.inc          |  4 +-
>  meta/recipes-connectivity/openssh/openssh_7.1p2.bb | 12 ++--
>  meta/recipes-connectivity/portmap/portmap_6.0.bb   |  6 +-
>  meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |  8 +--
>  .../wpa-supplicant/wpa-supplicant_2.5.bb           |  4 +-
>  meta/recipes-core/busybox/busybox.inc              | 12 ++--
>  meta/recipes-core/dropbear/dropbear.inc            | 10 +--
>  meta/recipes-core/glibc/glibc-package.inc          |  6 +-
>  meta/recipes-core/systemd/systemd-compat-units.bb  |  2 +-
>  meta/recipes-core/systemd/systemd-serialgetty.bb   | 16 ++---
>  meta/recipes-core/systemd/systemd_229.bb           | 72
> +++++++++++-----------
>  meta/recipes-core/util-linux/util-linux.inc        |  2 +-
>  meta/recipes-core/volatile-binds/volatile-binds.bb |  6 +-
>  meta/recipes-devtools/distcc/distcc_3.1.bb         |  8 +--
>  meta/recipes-devtools/dpkg/dpkg.inc                |  7 +--
>  meta/recipes-devtools/opkg/opkg_0.3.1.bb           |  9 ++-
>  .../run-postinsts/run-postinsts_1.0.bb             |  6 +-
>  meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |  6 +-
>  meta/recipes-extended/at/at_3.1.18.bb              |  6 +-
>  meta/recipes-extended/cronie/cronie_1.5.0.bb       |  6 +-
>  meta/recipes-extended/lighttpd/lighttpd_1.4.39.bb  |  6 +-
>  meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb     | 10 +--
>  meta/recipes-extended/sysstat/sysstat.inc          |  6 +-
>  meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |  6 +-
>  .../x11-common/xserver-nodm-init.bb                |  8 +--
>  .../oprofile/oprofileui-server_git.bb              |  6 +-
>  meta/recipes-multimedia/alsa/alsa-utils_1.1.0.bb   |  2 +-
>  .../recipes-support/consolekit/consolekit_0.4.6.bb |  4 +-
>  41 files changed, 182 insertions(+), 176 deletions(-)
>
> --
> 2.7.1
>
>

--001a114210b41e70cd0535917887
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br><br></div>I sent this series of patches around=
 3 months ago and got no aswer at all, so just wondering if is it gonna eve=
r be reviewed/merged. <br><br>I know maintainers are currently kind of over=
whelmed with the big amount of patches received every day, but I&#39;d like=
 to know if it makes sense for me to spend more time on this.<br><div class=
=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature">Pau Espin Pedrol<br></div></div>
<br><div class=3D"gmail_quote">2016-03-13 20:12 GMT+01:00 Pau Espin Pedrol =
<span dir=3D"ltr">&lt;<a href=3D"mailto:pespin.shar@gmail.com" target=3D"_b=
lank">pespin.shar@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">* These series of patches aim at improving the usage of some systemd rel=
ated variables<br>
=C2=A0 in several recipes from oe-core. Main aim is to change those recipes=
 to use<br>
=C2=A0 &#39;systemd_system_unitdir&#39; instead of the old &#39;systemd_uni=
tdir/system&#39; variable,<br>
=C2=A0 which will be marked as deprecated instead of being removed as is ma=
y still be<br>
=C2=A0 used in other oe layers. To mark it as deprecated, a comment is adde=
d in bitbake.conf,<br>
=C2=A0 but better ideas regarding this are welcome.<br>
<br>
* Few recipes have also been changed to use the &#39;systemd_user_unitdir&#=
39; variable for<br>
=C2=A0 their systemd user services.<br>
<br>
The following changes since commit 4be0e15f74cff85edca9de55248939fb438f30ae=
:<br>
<br>
=C2=A0 oeqa/selftest/recipetool: Fix test_recipetool_create_simple (2016-03=
-13 18:15:41 +0000)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://github.com/pespin/openembedded-core" rel=3D"=
noreferrer" target=3D"_blank">github.com/pespin/openembedded-core</a> syste=
md-var-fixes<br>
=C2=A0 <a href=3D"https://github.com/pespin/openembedded-core/tree/systemd-=
var-fixes" rel=3D"noreferrer" target=3D"_blank">https://github.com/pespin/o=
penembedded-core/tree/systemd-var-fixes</a><br>
<br>
Pau Espin Pedrol (42):<br>
=C2=A0 rootfs-postcommands: Fix usage of systemd unitdir vars<br>
=C2=A0 acpid: Fix usage of systemd unitdir vars<br>
=C2=A0 apmd: Fix usage of systemd unitdir vars<br>
=C2=A0 avahi: Fix usage of systemd unitdir vars<br>
=C2=A0 bind: Fix usage of systemd unitdir vars<br>
=C2=A0 connman: Fix usage of systemd unitdir vars<br>
=C2=A0 dhcp: Fix usage of systemd unitdir vars<br>
=C2=A0 neard: Fix usage of systemd unitdir vars<br>
=C2=A0 nfs-utils: Fix usage of systemd unitdir vars<br>
=C2=A0 openssh: Fix usage of systemd unitdir vars<br>
=C2=A0 portmap: Fix usage of systemd unitdir vars<br>
=C2=A0 ppp: Fix usage of systemd unitdir vars<br>
=C2=A0 wpa-supplicant: Fix usage of systemd unitdir vars<br>
=C2=A0 busybox: Fix usage of systemd unitdir vars<br>
=C2=A0 dropbear: Fix usage of systemd unitdir vars<br>
=C2=A0 glibc-package: Fix usage of systemd unitdir vars<br>
=C2=A0 systemd-compat-units: Fix usage of systemd unitdir vars<br>
=C2=A0 systemd-serialgetty: Fix usage of systemd unitdir vars<br>
=C2=A0 systemd: Fix usage of systemd unitdir vars<br>
=C2=A0 util-linux: Fix usage of systemd unitdir vars<br>
=C2=A0 volatile-binds: Fix usage of systemd unitdir vars<br>
=C2=A0 distcc: Fix usage of systemd unitdir vars<br>
=C2=A0 run-postints: Fix usage of systemd unitdir vars<br>
=C2=A0 tcf-agent: Fix usage of systemd unitdir vars<br>
=C2=A0 at: Fix usage of systemd unitdir vars<br>
=C2=A0 cronie: Fix usage of systemd unitdir vars<br>
=C2=A0 lighttpd: Fix usage of systemd unitdir vars<br>
=C2=A0 rpcbind: Fix usage of systemd unitdir vars<br>
=C2=A0 sysstat: Fix usage of systemd unitdir vars<br>
=C2=A0 xinetd: Fix usage of systemd unitdir vars<br>
=C2=A0 xserver-nodm-init: Fix usage of systemd unitdir vars<br>
=C2=A0 oprofileui-server: Fix usage of systemd unitdir vars<br>
=C2=A0 consolekit: Fix usage of systemd unitdir vars<br>
=C2=A0 alsa-utils: Fix usage of systemd unitdir vars<br>
=C2=A0 ofono: Fix usage of systemd unitdir vars<br>
=C2=A0 bluez5: Fix usage of systemd unitdir vars<br>
=C2=A0 avahi-ui: Fix usage of systemd unitdir vars<br>
=C2=A0 opkg: Fix usage of systemd unitdir vars<br>
=C2=A0 dpkg: Fix usage of systemd unitdir vars<br>
=C2=A0 systemd.bbclass: Remove user services too if systemd is not enabled<=
br>
=C2=A0 systemd: Remove usage of systemd_unitdir<br>
=C2=A0 bitbake.conf: Mark systemd_unitdir as deprecated to avoid future use=
<br>
<br>
=C2=A0meta/classes/rootfs-postcommands.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 4 +-<br>
=C2=A0meta/classes/systemd.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 ++++--<br>
=C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +<br>
=C2=A0meta/recipes-bsp/acpid/acpid.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +-<br>
=C2=A0meta/recipes-bsp/apmd/<a href=3D"http://apmd_3.2.2-15.bb" rel=3D"nore=
ferrer" target=3D"_blank">apmd_3.2.2-15.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +-<br>
=C2=A0meta/recipes-connectivity/avahi/<a href=3D"http://avahi-ui_0.6.32.bb"=
 rel=3D"noreferrer" target=3D"_blank">avahi-ui_0.6.32.bb</a> |=C2=A0 8 +--<=
br>
=C2=A0meta/recipes-connectivity/avahi/avahi.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta/recipes-connectivity/bind/<a href=3D"http://bind_9.10.3-P3.bb" r=
el=3D"noreferrer" target=3D"_blank">bind_9.10.3-P3.bb</a>=C2=A0 =C2=A0|=C2=
=A0 6 +-<br>
=C2=A0meta/recipes-connectivity/bluez5/bluez5.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 4 +-<br>
=C2=A0meta/recipes-connectivity/connman/connman.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 6 +-<br>
=C2=A0meta/recipes-connectivity/dhcp/dhcp.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 16 ++---<br>
=C2=A0meta/recipes-connectivity/neard/<a href=3D"http://neard_0.15.bb" rel=
=3D"noreferrer" target=3D"_blank">neard_0.15.bb</a>=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
=C2=A0.../nfs-utils/<a href=3D"http://nfs-utils_1.3.3.bb" rel=3D"noreferrer=
" target=3D"_blank">nfs-utils_1.3.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 20 +++---<br>
=C2=A0meta/recipes-connectivity/ofono/ofono.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 4 +-<br>
=C2=A0meta/recipes-connectivity/openssh/<a href=3D"http://openssh_7.1p2.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssh_7.1p2.bb</a> | 12 ++--<br>
=C2=A0meta/recipes-connectivity/portmap/<a href=3D"http://portmap_6.0.bb" r=
el=3D"noreferrer" target=3D"_blank">portmap_6.0.bb</a>=C2=A0 =C2=A0|=C2=A0 =
6 +-<br>
=C2=A0meta/recipes-connectivity/ppp/<a href=3D"http://ppp_2.4.7.bb" rel=3D"=
noreferrer" target=3D"_blank">ppp_2.4.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 8 +--<br>
=C2=A0.../wpa-supplicant/<a href=3D"http://wpa-supplicant_2.5.bb" rel=3D"no=
referrer" target=3D"_blank">wpa-supplicant_2.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
=C2=A0meta/recipes-core/busybox/busybox.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 12 ++--<br>
=C2=A0meta/recipes-core/dropbear/dropbear.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 10 +--<br>
=C2=A0meta/recipes-core/glibc/glibc-package.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 6 +-<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd-compat-units.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd-compat-units.bb</a>=C2=A0 |=C2=
=A0 2 +-<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd-serialgetty.bb" r=
el=3D"noreferrer" target=3D"_blank">systemd-serialgetty.bb</a>=C2=A0 =C2=A0=
| 16 ++---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_229.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_229.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 72 +++++++++++-----------<br>
=C2=A0meta/recipes-core/util-linux/util-linux.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +-<br>
=C2=A0meta/recipes-core/volatile-binds/<a href=3D"http://volatile-binds.bb"=
 rel=3D"noreferrer" target=3D"_blank">volatile-binds.bb</a> |=C2=A0 6 +-<br=
>
=C2=A0meta/recipes-devtools/distcc/<a href=3D"http://distcc_3.1.bb" rel=3D"=
noreferrer" target=3D"_blank">distcc_3.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 8 +--<br>
=C2=A0meta/recipes-devtools/dpkg/dpkg.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 +--<br>
=C2=A0meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.3.1.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.3.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 9 ++-<br>
=C2=A0.../run-postinsts/<a href=3D"http://run-postinsts_1.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">run-postinsts_1.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +-<br>
=C2=A0meta/recipes-devtools/tcf-agent/<a href=3D"http://tcf-agent_git.bb" r=
el=3D"noreferrer" target=3D"_blank">tcf-agent_git.bb</a>=C2=A0 =C2=A0|=C2=
=A0 6 +-<br>
=C2=A0meta/recipes-extended/at/<a href=3D"http://at_3.1.18.bb" rel=3D"noref=
errer" target=3D"_blank">at_3.1.18.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 6 +-<br>
=C2=A0meta/recipes-extended/cronie/<a href=3D"http://cronie_1.5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">cronie_1.5.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 6 +-<br>
=C2=A0meta/recipes-extended/lighttpd/<a href=3D"http://lighttpd_1.4.39.bb" =
rel=3D"noreferrer" target=3D"_blank">lighttpd_1.4.39.bb</a>=C2=A0 |=C2=A0 6=
 +-<br>
=C2=A0meta/recipes-extended/rpcbind/<a href=3D"http://rpcbind_0.2.3.bb" rel=
=3D"noreferrer" target=3D"_blank">rpcbind_0.2.3.bb</a>=C2=A0 =C2=A0 =C2=A0|=
 10 +--<br>
=C2=A0meta/recipes-extended/sysstat/sysstat.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 6 +-<br>
=C2=A0meta/recipes-extended/xinetd/<a href=3D"http://xinetd_2.3.15.bb" rel=
=3D"noreferrer" target=3D"_blank">xinetd_2.3.15.bb</a>=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 6 +-<br>
=C2=A0.../x11-common/<a href=3D"http://xserver-nodm-init.bb" rel=3D"norefer=
rer" target=3D"_blank">xserver-nodm-init.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 +--<br>
=C2=A0.../oprofile/<a href=3D"http://oprofileui-server_git.bb" rel=3D"noref=
errer" target=3D"_blank">oprofileui-server_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +-<br>
=C2=A0meta/recipes-multimedia/alsa/<a href=3D"http://alsa-utils_1.1.0.bb" r=
el=3D"noreferrer" target=3D"_blank">alsa-utils_1.1.0.bb</a>=C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
=C2=A0.../recipes-support/consolekit/<a href=3D"http://consolekit_0.4.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">consolekit_0.4.6.bb</a> |=C2=A0 4 +-<=
br>
=C2=A041 files changed, 182 insertions(+), 176 deletions(-)<br>
<br>
--<br>
2.7.1<br>
<br>
</blockquote></div><br></div></div>

--001a114210b41e70cd0535917887--

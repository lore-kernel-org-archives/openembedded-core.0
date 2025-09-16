Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9129CAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 05:32:31 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.12509.1758000749569012448
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 22:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout01.t-online.de (Postfix) with SMTP id A0BCC1D0A1;
	Tue, 16 Sep 2025 07:32:27 +0200 (CEST)
Received: from [192.168.178.36] ([84.163.32.95]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uyOId-3x1wzA0; Tue, 16 Sep 2025 07:32:19 +0200
Date: Tue, 16 Sep 2025 07:32:12 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH 15/16] xkeyboard-config: update 2.44 -> 2.45
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
Message-Id: <P12O2T.G9TC7LOZ6AEG@t-online.de>
In-Reply-To: <20250911085123.1551425-15-alex.kanavin@gmail.com>
References: <20250911085123.1551425-1-alex.kanavin@gmail.com>
	<20250911085123.1551425-15-alex.kanavin@gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-iJ01enq4X528srYLhlvJ"
X-TOI-EXPURGATEID: 150726::1758000739-537FD921-EF11BE75/0/0 CLEAN NORMAL
X-TOI-MSGID: cd083efd-e32d-4f87-82e7-30a1afdcc4b3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 05:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223528

--=-iJ01enq4X528srYLhlvJ
Content-Type: text/plain; charset=us-ascii; format=flowed

I'm seeing issues with symlink creation:
| Installing symlink pointing to xkeyboard-config-2.pc to 
/home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/pkgconfig/xkeyboard-config.pc
| Installing symlink pointing to base to 
/home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/xkeyboard-config-2/rules/xorg
| Installing symlink pointing to base.lst to 
/home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/xkeyboard-config-2/rules/xorg.lst
| Installing symlink pointing to base.xml to 
/home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/xkeyboard-config-2/rules/xorg.xml
| Installing symlink pointing to xkeyboard-config-2.7 to 
/home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/man/man7/xkeyboard-config.7
| Installing symlink pointing to /usr/share/xkeyboard-config-2 to 
/home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/X11/xkb
| ln: failed to create symbolic link 
'/home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/X11/xkb/symbols/en': 
No such file or directory

On Thu, Sep 11 2025 at 10:51:22 +02:00:00, Alexander Kanavin via 
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org> 
wrote:
> From: Alexander Kanavin <alex@linutronix.de 
> <mailto:alex@linutronix.de>>
> 
> License-update: disclaimer and copyright clarifications per
> <https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/merge_requests/821>
> 
> Replace manual symlink creation with a meson option.
> 
> Drop no-op autoconf options.
> 
> Adjust packaging as this is where upstream installs now.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de 
> <mailto:alex@linutronix.de>>
> ---
>  ...oard-config_2.44.bb => xkeyboard-config_2.45.bb} | 13 
> ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>  rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.44.bb => 
> xkeyboard-config_2.45.bb} (65%)
> 
> diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb 
> b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb
> similarity index 65%
> rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb
> rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb
> index 52d074fd5ed..857ccc75160 100644
> --- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb
> +++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb
> @@ -10,23 +10,18 @@ HOMEPAGE = 
> "http://freedesktop.org/wiki/Software/XKeyboardConfig"
>  BUGTRACKER = 
> "<https://bugs.freedesktop.org/enter_bug.cgi?product=xkeyboard-config>"
> 
>  LICENSE = "MIT & MIT"
> -LIC_FILES_CHKSUM = 
> "file://COPYING;md5=8fc8ae699974c360e2e2e883a63ce264" 
> <file://copying;md5=8fc8ae699974c360e2e2e883a63ce264/>
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=faa756e04053029ddc602caf99e5ef1d" 
> <file://copying;md5=faa756e04053029ddc602caf99e5ef1d/>
> 
>  SRC_URI = 
> "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz"
> -SRC_URI[sha256sum] = 
> "54d2c33eeebb031d48fa590c543e54c9bcbd0f00386ebc6489b2f47a0da4342a"
> +SRC_URI[sha256sum] = 
> "169e075a92d957a57787c199e84e359df2931b7196c1c5b4a3d576ee6235a87c"
> 
>  SECTION = "x11/libs"
>  DEPENDS = "util-macros libxslt-native"
> 
> -EXTRA_OECONF = "--with-xkb-rules-symlink=xorg --disable-runtime-deps"
> -
> -FILES:${PN} += "${datadir}/X11/xkb"
> +FILES:${PN} += "${datadir}/X11/xkb ${datadir}/xkeyboard-config-2"
> 
>  inherit meson pkgconfig gettext python3native
> 
> -do_install:append () {
> -    install -d ${D}${datadir}/X11/xkb/compiled
> -    cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
> -}
> +EXTRA_OEMESON += "-Dxorg-rules-symlinks=true"
> 
>  BBCLASSEXTEND += "native"
> --
> 2.39.5
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223262): 
> <https://lists.openembedded.org/g/openembedded-core/message/223262>
> Mute This Topic: <https://lists.openembedded.org/mt/115184776/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-iJ01enq4X528srYLhlvJ
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>I'm seeing issues with symlink cre=
ation:</div><div>| Installing symlink pointing to xkeyboard-config-2.pc to =
/home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/im=
age/usr/share/pkgconfig/xkeyboard-config.pc</div><div>| Installing symlink =
pointing to base to /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkey=
board-config/2.45/image/usr/share/xkeyboard-config-2/rules/xorg</div><div>|=
 Installing symlink pointing to base.lst to /home/flk/poky/build/tmp/work/c=
orei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/xkeyboard-config-=
2/rules/xorg.lst</div><div>| Installing symlink pointing to base.xml to /ho=
me/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image=
/usr/share/xkeyboard-config-2/rules/xorg.xml</div><div>| Installing symlink=
 pointing to xkeyboard-config-2.7 to /home/flk/poky/build/tmp/work/corei7-6=
4-poky-linux/xkeyboard-config/2.45/image/usr/share/man/man7/xkeyboard-confi=
g.7</div><div>| Installing symlink pointing to /usr/share/xkeyboard-config-=
2 to /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.=
45/image/usr/share/X11/xkb</div><div>| ln: failed to create symbolic link '=
/home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/im=
age/usr/share/X11/xkb/symbols/en': No such file or directory</div></div><di=
v id=3D"geary-quote" dir=3D"auto"><br>On Thu, Sep 11 2025 at 10:51:22 +02:0=
0:00, Alexander Kanavin via lists.openembedded.org &lt;alex.kanavin=3Dgmail=
.com@lists.openembedded.org&gt; wrote:<br><blockquote type=3D"cite"><div cl=
ass=3D"plaintext" style=3D"white-space: break-spaces;">From: Alexander Kana=
vin &lt;<a href=3D"mailto:alex@linutronix.de">alex@linutronix.de</a>&gt;

License-update: disclaimer and copyright clarifications per
<a href=3D"https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config=
/-/merge_requests/821">https://gitlab.freedesktop.org/xkeyboard-config/xkey=
board-config/-/merge_requests/821</a>

Replace manual symlink creation with a meson option.

Drop no-op autoconf options.

Adjust packaging as this is where upstream installs now.

Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de">=
alex@linutronix.de</a>&gt;
---
 ...oard-config_2.44.bb =3D&gt; xkeyboard-config_2.45.bb} | 13 ++++--------=
-
 1 file changed, 4 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.44.bb =3D&gt; xk=
eyboard-config_2.45.bb} (65%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb b/meta=
/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb
similarity index 65%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb
index 52d074fd5ed..857ccc75160 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb
@@ -10,23 +10,18 @@ HOMEPAGE =3D "http://freedesktop.org/wiki/Software/XKey=
boardConfig"
 BUGTRACKER =3D "<a href=3D"https://bugs.freedesktop.org/enter_bug.cgi?prod=
uct=3Dxkeyboard-config">https://bugs.freedesktop.org/enter_bug.cgi?product=
=3Dxkeyboard-config</a>"
=20
 LICENSE =3D "MIT &amp; MIT"
-LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3D8fc8ae699974c360e2e2=
e883a63ce264" "=3D"">file://COPYING;md5=3D8fc8ae699974c360e2e2e883a63ce264"=
</a>
+LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3Dfaa756e04053029ddc60=
2caf99e5ef1d" "=3D"">file://COPYING;md5=3Dfaa756e04053029ddc602caf99e5ef1d"=
</a>
=20
 SRC_URI =3D "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.=
tar.xz"
-SRC_URI[sha256sum] =3D "54d2c33eeebb031d48fa590c543e54c9bcbd0f00386ebc6489=
b2f47a0da4342a"
+SRC_URI[sha256sum] =3D "169e075a92d957a57787c199e84e359df2931b7196c1c5b4a3=
d576ee6235a87c"
=20
 SECTION =3D "x11/libs"
 DEPENDS =3D "util-macros libxslt-native"
=20
-EXTRA_OECONF =3D "--with-xkb-rules-symlink=3Dxorg --disable-runtime-deps"
-
-FILES:${PN} +=3D "${datadir}/X11/xkb"
+FILES:${PN} +=3D "${datadir}/X11/xkb ${datadir}/xkeyboard-config-2"
=20
 inherit meson pkgconfig gettext python3native
=20
-do_install:append () {
-    install -d ${D}${datadir}/X11/xkb/compiled
-    cd ${D}${datadir}/X11/xkb/rules &amp;&amp; ln -sf base xorg
-}
+EXTRA_OEMESON +=3D "-Dxorg-rules-symlinks=3Dtrue"
=20
 BBCLASSEXTEND +=3D "native"
<div>--=20
</div>2.39.5

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#223262): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/223262">https://lists.openembedded.org/g/openembedd=
ed-core/message/223262</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115184776/361=
8223">https://lists.openembedded.org/mt/115184776/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hre=
f=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-iJ01enq4X528srYLhlvJ--



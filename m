Return-Path: <sdliyong@gmail.com>
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7381265C7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 07:56:16 +0000 (UTC)
Received: by mail-qa0-f50.google.com with SMTP id k15so4796990qaq.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 23:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:cc:content-type;
	bh=XZ1vt9fkxhBGROpGToat4Zp1WkiUfBm+Vb/4n/YoZCs=;
	b=YBByesJwUbhjkaUykTDJqvIH3cZytUFA74LDwA7gs1d2NAIQj/ZaZXSsp0I+wnU2Er
	cwn+ZdTGNaMMwk4uJz0XDAWqgHjAD6/0oPqL3N4XS/vOIlqAlbVzfGMiqcggXwuTSyFq
	WNhELfwbWbYhyJwTix15B1QKzv2Phkvvtbv7ZHINdv843tcoi4OwK0ooetlERv0Jdjml
	W8wbrfXiFJBlVLWfpvH97tArma0vrk2OPYZ8eTcesSxW8hQv5lLk0kjwVkKwEwc7r4F0
	A80odGwTamKaZYqhhwuPHgSwGgk9Ah8BfoYqCntofr2UPsleaBlCLAgQTVULUGep1DJs
	wOFQ==
X-Received: by 10.140.19.139 with SMTP id 11mr11200196qgh.14.1421999777470;
	Thu, 22 Jan 2015 23:56:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.96.70.194 with HTTP; Thu, 22 Jan 2015 23:55:57 -0800 (PST)
From: Yong Li <sdliyong@gmail.com>
Date: Fri, 23 Jan 2015 15:55:57 +0800
Message-ID: <CADO9-pf1mA5ykXAnGnArDxTcK3a39zy=VcDMo68k77fNVWs2mw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Yong Li <sdliyong@gmail.com>
Subject: [PATCH 1/1] Add XFCE image build bb file
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
X-List-Received-Date: Fri, 23 Jan 2015 07:56:19 -0000
Content-Type: multipart/alternative; boundary=001a1134f03c9b5e1e050d4d1f28

--001a1134f03c9b5e1e050d4d1f28
Content-Type: text/plain; charset=UTF-8

From 7bd10751abef6c6ac7d28b8d148bdee200d0c6b1 Mon Sep 17 00:00:00 2001
From: Yong Li <sdliyong@gmail.com>
Date: Fri, 23 Jan 2015 15:49:12 +0800
Subject: [PATCH] Add XFCE iamge build file

Signed-off-by: Yong Li <sdliyong@gmail.com>
---
 meta/recipes-graphics/images/core-image-xfce.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/recipes-graphics/images/core-image-xfce.bb

diff --git a/meta/recipes-graphics/images/core-image-xfce.bb
b/meta/recipes-graphics/images/core-image-xfce.bb
new file mode 100644
index 0000000..0b5a0b2
--- /dev/null
+++ b/meta/recipes-graphics/images/core-image-xfce.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A very basic Wayland image with a terminal"
+
+IMAGE_FEATURES += "splash package-management ssh-server-dropbear hwcodecs"
+
+LICENSE = "MIT"
+
+inherit core-image distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+CORE_IMAGE_BASE_INSTALL += "xserver-xorg xserver-xf86-config xinit xauth
xf86-input-evdev \
+xserver-nodm-init mini-x-session  xorg-minimal-fonts \
+xf86-video-fbdev xterm xclock xfwm4 xfce4-session xfdesktop xfce4-settings
\
+xfce4-panel xfce4-appfinder xfconf xfce4-terminal gtk-xfce-engine \
+packagegroup-fonts-truetype packagegroup-xfce-base"
+
--
1.9.1

--001a1134f03c9b5e1e050d4d1f28
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>From 7bd10751abef6c6ac7d28b8d148bdee200d0c6b1 Mon Sep=
 17 00:00:00 2001</div><div>From: Yong Li &lt;<a href=3D"mailto:sdliyong@gm=
ail.com">sdliyong@gmail.com</a>&gt;</div><div>Date: Fri, 23 Jan 2015 15:49:=
12 +0800</div><div>Subject: [PATCH] Add XFCE iamge build file</div><div><br=
></div><div>Signed-off-by: Yong Li &lt;<a href=3D"mailto:sdliyong@gmail.com=
">sdliyong@gmail.com</a>&gt;</div><div>---</div><div>=C2=A0meta/recipes-gra=
phics/images/<a href=3D"http://core-image-xfce.bb">core-image-xfce.bb</a> |=
 16 ++++++++++++++++</div><div>=C2=A01 file changed, 16 insertions(+)</div>=
<div>=C2=A0create mode 100644 meta/recipes-graphics/images/<a href=3D"http:=
//core-image-xfce.bb">core-image-xfce.bb</a></div><div><br></div><div>diff =
--git a/meta/recipes-graphics/images/<a href=3D"http://core-image-xfce.bb">=
core-image-xfce.bb</a> b/meta/recipes-graphics/images/<a href=3D"http://cor=
e-image-xfce.bb">core-image-xfce.bb</a></div><div>new file mode 100644</div=
><div>index 0000000..0b5a0b2</div><div>--- /dev/null</div><div>+++ b/meta/r=
ecipes-graphics/images/<a href=3D"http://core-image-xfce.bb">core-image-xfc=
e.bb</a></div><div>@@ -0,0 +1,16 @@</div><div>+SUMMARY =3D &quot;A very bas=
ic Wayland image with a terminal&quot;</div><div>+</div><div>+IMAGE_FEATURE=
S +=3D &quot;splash package-management ssh-server-dropbear hwcodecs&quot;</=
div><div>+</div><div>+LICENSE =3D &quot;MIT&quot;</div><div>+</div><div>+in=
herit core-image distro_features_check</div><div>+</div><div>+REQUIRED_DIST=
RO_FEATURES =3D &quot;x11&quot;</div><div>+</div><div>+CORE_IMAGE_BASE_INST=
ALL +=3D &quot;xserver-xorg xserver-xf86-config xinit xauth xf86-input-evde=
v \</div><div>+xserver-nodm-init mini-x-session =C2=A0xorg-minimal-fonts \<=
/div><div>+xf86-video-fbdev xterm xclock xfwm4 xfce4-session xfdesktop xfce=
4-settings \</div><div>+xfce4-panel xfce4-appfinder xfconf xfce4-terminal g=
tk-xfce-engine \</div><div>+packagegroup-fonts-truetype packagegroup-xfce-b=
ase&quot;</div><div>+</div><div>--</div><div>1.9.1</div></div>

--001a1134f03c9b5e1e050d4d1f28--

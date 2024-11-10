Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32892D6409B
	for <webhook@archiver.kernel.org>; Sun, 10 Nov 2024 13:24:53 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.35840.1731245086663696772
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Nov 2024 05:24:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout04.t-online.de (Postfix) with SMTP id 948D4602
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Nov 2024 14:24:44 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.174.121]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tA7vo-1yXDDF0; Sun, 10 Nov 2024 14:24:44 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] systemd: add PACKAGECONFIG for sysupdate feature
Date: Sun, 10 Nov 2024 14:27:00 +0100
Message-ID: <20241110132700.2130531-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1731245084-6FFFD5A0-1AEC9129/0/0 CLEAN NORMAL
X-TOI-MSGID: fb271cff-6209-46bf-879a-b387110ab0dc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Nov 2024 13:24:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206918

sysupdate links with libfdisk and depends on libblkid, libfdisk and libop=
enssl

[https://www.freedesktop.org/software/systemd/man/latest/systemd-sysupdat=
e.html]

Additionally add a PACKAGECONFIG for fdisk which can be activated separat=
ely

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-core/systemd/systemd_256.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_256.7.bb b/meta/recipes-co=
re/systemd/systemd_256.7.bb
index af810c0fcd..bf829c4931 100644
--- a/meta/recipes-core/systemd/systemd_256.7.bb
+++ b/meta/recipes-core/systemd/systemd_256.7.bb
@@ -149,6 +149,7 @@ PACKAGECONFIG[default-compression-zstd] =3D "-Dzstd=3D=
true -Ddefault-compression=3Dzst
 PACKAGECONFIG[dbus] =3D "-Ddbus=3Dtrue,-Ddbus=3Dfalse,dbus"
 PACKAGECONFIG[efi] =3D "-Defi=3Dtrue -Dbootloader=3Dtrue,-Defi=3Dfalse -=
Dbootloader=3Dfalse,python3-pyelftools-native"
 PACKAGECONFIG[elfutils] =3D "-Delfutils=3Dtrue,-Delfutils=3Dfalse,elfuti=
ls,,libelf libdw"
+PACKAGECONFIG[fdisk] =3D "-Dfdisk=3Denabled,-Dfdisk=3Ddisabled,util-linu=
x"
 PACKAGECONFIG[firstboot] =3D "-Dfirstboot=3Dtrue,-Dfirstboot=3Dfalse"
 PACKAGECONFIG[repart] =3D "-Drepart=3Dtrue,-Drepart=3Dfalse"
 PACKAGECONFIG[homed] =3D "-Dhomed=3Dtrue,-Dhomed=3Dfalse"
@@ -208,6 +209,7 @@ PACKAGECONFIG[seccomp] =3D "-Dseccomp=3Dtrue,-Dseccom=
p=3Dfalse,libseccomp"
 PACKAGECONFIG[selinux] =3D "-Dselinux=3Dtrue,-Dselinux=3Dfalse,libselinu=
x,initscripts-sushell"
 PACKAGECONFIG[smack] =3D "-Dsmack=3Dtrue,-Dsmack=3Dfalse"
 PACKAGECONFIG[sysext] =3D "-Dsysext=3Dtrue, -Dsysext=3Dfalse"
+PACKAGECONFIG[sysupdate] =3D "-Dopenssl=3Denabled -Dfdisk=3Denabled -Dsy=
supdate=3Denabled,-Dsysupdate=3Ddisabled,util-linux openssl,util-linux op=
enssl"
 PACKAGECONFIG[sysusers] =3D "-Dsysusers=3Dtrue,-Dsysusers=3Dfalse"
 PACKAGECONFIG[sysvinit] =3D "-Dsysvinit-path=3D${sysconfdir}/init.d -Dsy=
svrcnd-path=3D${sysconfdir},-Dsysvinit-path=3D -Dsysvrcnd-path=3D,,system=
d-compat-units update-rc.d"
 # When enabled use reproducible build timestamp if set as time epoch,
--=20
2.47.0



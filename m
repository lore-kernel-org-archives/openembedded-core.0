Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27145.1795549134988047007
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 11:38:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@pengutronix.de header.s=20260414 header.b=Eutoy4wK;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: uol@pengutronix.de)
Received: from dude03.red.stw.pengutronix.de (dude03.red.stw.4.pengutronix.de [10.17.1.7])
	(Authenticated sender: relay-from-dude03.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B524820242C;
	Tue, 24 Nov 2026 20:38:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795549128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zvs5wxCgwANnIEGMONllbo9RhCX4VBmnhOJ7c63Id3w=;
	b=Eutoy4wKXt3W/W1RdV9RzyAI6XQtyZOjitzlaSG81UV5EHjXt366OzPmQ4HA8MF4huPuwa
	S0R7qmT7+BXpAHiSMhb26BTH2nd5Hhnhb74WKyv4VbgRLMUNcQhBhKOE+F1Qu3EVQEpnRw
	oV4t5RPLH+0c/HEvZU4i5uWcYxAn302frC7GXp5/zcsjP4q76NBZNj62W1PtEYEZ23uPcV
	31fsyXtBarQtWxsX17dzBpyJii3mrpCauauevM58AyIiulYEAUqdBLOGWuLms2b+4fNjrc
	aFSt9KQv/4E++bTWdKXaOV9Gv4eIlTK505SDXyfhRrPvvWYjzGAPr/8i3ZiCQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795549128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zvs5wxCgwANnIEGMONllbo9RhCX4VBmnhOJ7c63Id3w=;
	b=T5AMZvnyCe+9J1TCsoz03zZPlIshoAtEFcHlqcm5yvkA1g2G0lqK+zOPbehx6d0zAV7/RI
	HHxXQ2OTuiy1tI3xLTPmvZFioKiRpDsq3CQssIR2pdhep8fOLOqKvJLilsVQ6XfE89NABr
	OpbplILxbwtmJOGD9IFNh4xgQ8XOXRIZXcuQ5xbNjjO5mvLwlxI7ju+GJmFXbgKY8IF9sy
	FXKYPAjS9SZNmJXs/J2wxTjH4Mjfcep2JSPurRSO0yccLK19BaaAGO/iJBCJqMAg84uWQG
	ImbBKEzu2ET9wxhxYQvZBZ6ko7EHvczTfDZp29WiSI4nsRQpBRyavwEH8kXl1g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude03.red.stw.pengutronix.de smtp.mailfrom=uol@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795549128; a=rsa-sha256;
	cv=none;
	b=eA6T7ZLKF7+aQn//Hm+0TU4PpsuZl3Gzk7yDtzH4IxE57kDZJsmNk0ScyIXKhbRtNm0HlL
	UnqdwgTTW2rTAcHeq870j6F+vQ2CTrOhr/lE98XqPSjvM9yx6lmQnPHAnHtYBV9wSGCgwI
	iomFV+ZHFKg24iQvWbnl3eHfWlKupd4XwEcFssN4RWRsKrvUqqkTyED0lmHsXBtIaWITVl
	ylNzK83RMjScN1wU96w8eK7SgmD9XdVsQaI8TTey3rInhH+uFNpj+sdm8BAjkQJKryMHYp
	KF1VsH1XSvdzK0zkA3A+901dDsYJ9NNM11iDF9ascAbfZA+wWOCocVOcwOnhqQ==
Received: by dude03.red.stw.pengutronix.de (Postfix, from userid 1052)
	id 998832CAAB2; Tue, 24 Nov 2026 20:38:48 +0100 (CET)
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: OpenEmbedded Core Developers <openembedded-core@lists.openembedded.org>
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH 2/2] initramfs-framework: add base package summary and order metadata consistently
Date: Tue, 24 Nov 2026 20:38:43 +0100
Message-ID: <20261124193843.3572691-2-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124193843.3572691-1-u.oelmann@pengutronix.de>
References: <20261124193843.3572691-1-u.oelmann@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 19:39:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251077

Add an explicit summary for ${PN}-base, matching the recipe summary, move=
 the
${PN}-base metadata next to the other package-specific metadata and use t=
he same
order as for the recipe's other packages.

Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
---
 .../recipes-core/initrdscripts/initramfs-framework_1.0.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b=
/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 1fe7ec9b5e2c..864ef5feca37 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -1,8 +1,6 @@
 SUMMARY =3D "Modular initramfs system"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
-RDEPENDS:${PN}-base +=3D "${VIRTUAL-RUNTIME_base-utils}"
-RRECOMMENDS:${PN}-base =3D "${VIRTUAL-RUNTIME_base-utils-syslog}"
=20
 SRC_URI =3D "file://init \
            file://exec \
@@ -67,8 +65,9 @@ PACKAGES =3D "${PN}-base \
             initramfs-module-overlayroot \
            "
=20
-FILES:${PN}-base =3D "/init /init.d/99-finish /dev"
-
+SUMMARY:${PN}-base =3D "${SUMMARY}"
+RDEPENDS:${PN}-base +=3D "${VIRTUAL-RUNTIME_base-utils}"
+RRECOMMENDS:${PN}-base =3D "${VIRTUAL-RUNTIME_base-utils-syslog}"
 # 99-finish in base depends on some other module which mounts
 # the rootfs, like 90-rootfs. To replace that default, use
 # BAD_RECOMMENDATIONS +=3D "initramfs-module-rootfs" in your
@@ -76,6 +75,7 @@ FILES:${PN}-base =3D "/init /init.d/99-finish /dev"
 # something that runs earlier (for example, a 89-my-rootfs)
 # and mounts the rootfs. Then 90-rootfs will proceed immediately.
 RRECOMMENDS:${PN}-base +=3D "initramfs-module-rootfs"
+FILES:${PN}-base =3D "/init /init.d/99-finish /dev"
=20
 SUMMARY:initramfs-module-exec =3D "initramfs support for easy execution =
of applications"
 RDEPENDS:initramfs-module-exec =3D "${PN}-base"
--=20
2.47.3


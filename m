Received: from mail.klausen.dk (mail.klausen.dk [157.90.24.29])
 by mx.groups.io with SMTP id smtpd.web11.5612.1631701393267353492
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 03:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@klausen.dk header.s=dkim header.b=YmLIMEsn;
 spf=pass (domain: klausen.dk, ip: 157.90.24.29, mailfrom: kristian@klausen.dk)
From: "Kristian Klausen" <kristian@klausen.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
	t=1631701390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=556ubnFjh+YYkpCYNyCaFOOsoLhHYKido88ctpS7JuE=;
	b=YmLIMEsnBjWph8HJ2+tle6DqFzZ11Wu/CdQJnYqXbR0v4FMUBv4VIWP1wIy7JLb3WKwSP/
	92zcvr9qBId55+OPQzNova+8rFw0z5OPSEUC6rHmiw2/Wm3wIisnTxodIwkwrcM1VfVgVL
	7uZiLpDTTZEvbTSBwGC+LR+zymgXiCI=
To: openembedded-core@lists.openembedded.org
Cc: Kristian Klausen <kristian@klausen.dk>
Subject: [PATCH] systemd: Add tpm2 PACKAGECONFIG
Date: Wed, 15 Sep 2021 12:23:08 +0200
Message-Id: <20210915102308.1892-1-kristian@klausen.dk>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The TPM2 support is used, among other things, for unlocking encrypted
volumes.

Signed-off-by: Kristian Klausen <kristian@klausen.dk>
---
 meta/recipes-core/systemd/systemd_249.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_249.3.bb b/meta/recipes-co=
re/systemd/systemd_249.3.bb
index c027b88fd6..f8c85dabf0 100644
--- a/meta/recipes-core/systemd/systemd_249.3.bb
+++ b/meta/recipes-core/systemd/systemd_249.3.bb
@@ -128,6 +128,7 @@ PACKAGECONFIG[bzip2] =3D "-Dbzip2=3Dtrue,-Dbzip2=3Dfa=
lse,bzip2"
 PACKAGECONFIG[cgroupv2] =3D "-Ddefault-hierarchy=3Dunified,-Ddefault-hie=
rarchy=3Dhybrid"
 PACKAGECONFIG[coredump] =3D "-Dcoredump=3Dtrue,-Dcoredump=3Dfalse"
 PACKAGECONFIG[cryptsetup] =3D "-Dlibcryptsetup=3Dtrue,-Dlibcryptsetup=3D=
false,cryptsetup,,cryptsetup"
+PACKAGECONFIG[tpm2] =3D "-Dtpm2=3Dtrue,-Dtpm2=3Dfalse,tpm2-tss,tpm2-tss =
libtss2 libtss2-tcti-device"
 PACKAGECONFIG[dbus] =3D "-Ddbus=3Dtrue,-Ddbus=3Dfalse,dbus"
 PACKAGECONFIG[efi] =3D "-Defi=3Dtrue,-Defi=3Dfalse"
 PACKAGECONFIG[gnu-efi] =3D "-Dgnu-efi=3Dtrue -Defi-libdir=3D${STAGING_LI=
BDIR} -Defi-includedir=3D${STAGING_INCDIR}/efi,-Dgnu-efi=3Dfalse,gnu-efi"
--=20
2.25.1


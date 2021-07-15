Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8644.1626359581032090541
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 07:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8871C6D
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 07:32:59 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 324253F694
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 07:32:59 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] image_types_wic: pass --debug for verbose logs
Date: Thu, 15 Jul 2021 15:32:57 +0100
Message-Id: <20210715143257.4050923-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The output goes to a log file, so having more information is useful for d=
ebugging.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/image_types_wic.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_ty=
pes_wic.bbclass
index 49be1da77a..143a6a6e4f 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -39,7 +39,7 @@ IMAGE_CMD_wic () {
 	if [ -z "$wks" ]; then
 		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. P=
lease set WKS_FILE or WKS_FILES appropriately."
 	fi
-	BUILDDIR=3D"${TOPDIR}" PSEUDO_UNLOAD=3D1 wic create "$wks" --vars "${ST=
AGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -=
w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
+	BUILDDIR=3D"${TOPDIR}" PSEUDO_UNLOAD=3D1 wic create --debug "$wks" --va=
rs "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build=
_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
 	mv "$build_wic/$(basename "${wks%.wks}")"*.direct "$out${IMAGE_NAME_SUF=
FIX}.wic"
 }
 IMAGE_CMD_wic[vardepsexclude] =3D "WKS_FULL_PATH WKS_FILES TOPDIR"
--=20
2.25.1


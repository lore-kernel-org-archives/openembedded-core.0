Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363F2C433EF
	for <webhook@archiver.kernel.org>; Sat, 22 Jan 2022 22:31:54 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.2539.1642890713240231155
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jan 2022 14:31:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com
 header.s=default header.b=X/aIRs3U;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: alhe@linux.microsoft.com)
Received: from alsamon-xub.lan (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id 2A4AA20B6C61;
	Sat, 22 Jan 2022 14:31:52 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2A4AA20B6C61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1642890712;
	bh=bVOOuFrVHxl41CVrSawBTXyp3T1tchmffgV0Yp2+Mkg=;
	h=From:To:Cc:Subject:Date:From;
	b=X/aIRs3UYHAEpzikA+qWkWQs9uoqWxgN+hsYApSe7zoYnwNIST8ftoiWeGQdWxVoh
	 9hZEZrhT7WC2BDjBkfQOtPVoACF+iEIYcuTCcRKYYHyAnEZ4fc5Vo6ga8GqTX0HXJQ
	 URqPsQToBvZBi7nwlvTxusjj9CfRPAtGF8ZjzI/g=
From: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
Subject: [PATCH 1/1] core-image-tiny-initramfs: Mark recipe as 32 bit ARM
 compatible
Date: Sat, 22 Jan 2022 15:31:36 -0700
Message-Id: <20220122223136.1621206-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jan 2022 22:31:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160860

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsof=
t.com>
---
 meta/recipes-core/images/core-image-tiny-initramfs.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta=
/recipes-core/images/core-image-tiny-initramfs.bb
index 47470849ed..a1883de0eb 100644
--- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
+++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
@@ -27,7 +27,7 @@ IMAGE_ROOTFS_SIZE =3D "8192"
 IMAGE_ROOTFS_EXTRA_SPACE =3D "0"
=20
 # Use the same restriction as initramfs-live-install
-COMPATIBLE_HOST =3D "(i.86|x86_64|aarch64).*-linux"
+COMPATIBLE_HOST =3D "(i.86|x86_64|aarch64|arm).*-linux"
=20
 python tinyinitrd () {
   # Modify our init file so the user knows we drop to shell prompt on pu=
rpose
--=20
2.25.1



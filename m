Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9E5CD8CA8
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 10:53:12 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88939.1781347984234430238
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 03:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Pr7w51hb;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84226d0f1d2so1327388b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 03:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781347983; x=1781952783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TDJRN40gousf+Jk3E6B5Ipy/6Wq/hZkEPeqjLcptYE=;
        b=Pr7w51hbYKoYLFDg/tPG30ImPYmbIbDyM5lIltiieMYCXSfxTkEX4Z3z3/KiTieclc
         lT4J1OchWAuDHT8CKH5K6gJhDrm5nty4774orvt2zulEUn3YwyYOii+8wChDtMpOhOjw
         ehND7Mp8q7P1+wD8s7zK8aZydixvow3KJ05UvYPpcgPeAFOVnfwI2QEEH8lFt73RTCZT
         Xz6vbD+g47DAxXWb71YVZsRuQ7O/5n3JhuuvM2ThpBZ+G2PkZ2wWuOedUpc76TvX3ggL
         FnfipS4/f1rgFd1RC6VBrb8brOWTf0hufta4KYk/ePspxc7TxkkAnvE+HRCktZiZeI0S
         SeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781347983; x=1781952783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4TDJRN40gousf+Jk3E6B5Ipy/6Wq/hZkEPeqjLcptYE=;
        b=r6MrTNAAsYz3LS9o0TQUlkmX0DpKBoQeYY5ep91D/R5jk/LoW5o0pNiu0WAE7bLnEx
         829omgevCdUI6XUTR3lbVYliSjeT2U0uMhVk840912gQV08e8ckt/4WcS6V74zupNa04
         3v6Do/ft8gLbl3QLanDKVO2mH5gtJBrD6x9807w0XZppydejNnj5LGYICtwOEOwMDprd
         HWPss0K2aRNYIhTCLzNFaPuF9xNTjjEfBOlych2IZHZvoWv04GvPeXQqTEJYElBiN+Il
         d9hRPT8qv7QWux77oK+rC3HtKvo2n2RkhIyXWLmsWZMvJd/ji8e64PJ2FiAEf5r+Yh1T
         3jLw==
X-Gm-Message-State: AOJu0YzUIg9hSxuqxiV1P1go75KXYouos1l+ObH5UxJ7/Ixsh4iZyAZu
	6pO8mt6BCfvUOsK3a6m5vZhunIKzBHu8qGiiLXQWTusIwxuczC9eO3oYPfPZxEqv
X-Gm-Gg: Acq92OHmOlrHrX9EKDNoUQFa1Y7c0si1R4pKvZD2APIppH7T5YXlHmOixvxvaYBJFp7
	KuKJvyOYn8c9+K+TnaOkA5hvtsSiQelThR6HLMXGWJVe0yDnga2csucW/q7oEl4zlCWtxPnmtQI
	Dj8SumbmPwfUGlFqqfdv8mMD4eMRN+tcc2rh8olrygX9+00Y2yYmq9wn5lWH/tlGMpY/JJ9MYoe
	zlgPDRCoLke42APjenwyWZ09YKZ6XcInS57zHSPvbi560ikQAwJJQrVnzPyrPYaagDtWuFHrGCC
	/OmCJCNZ6m+r6RmC96BurIJ7AbbMPXCbt6Z1B6BX3klLXMfRKBZvnsD5PyLIyt3XnfU2O+zNi+y
	twuj/Th5UNyYzCdQfd9GXF2g7puKjbCh40b7Z4lSVuTTZ2SFTv3i3T64leNMxPdXXooMc4pBJD7
	m3ARtPnhtdJe4B6dyYRBpA8PHXbMlBeGoYxLv8
X-Received: by 2002:a05:6a00:1993:b0:824:374a:1407 with SMTP id d2e1a72fcca58-8434cd4914bmr7145981b3a.16.1781347983511;
        Sat, 13 Jun 2026 03:53:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd50e6sm4689778b3a.30.2026.06.13.03.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 03:53:03 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta][wrynose][PATCH 2/2] ca-certificates: upgrade 20260223 -> 20260601
Date: Sat, 13 Jun 2026 22:52:49 +1200
Message-ID: <20260613105250.3902916-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613105250.3902916-1-ankur.tyagi85@gmail.com>
References: <20260613105250.3902916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 10:53:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238677

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: ca-certificates-local example removed[1]

[1] https://salsa.debian.org/debian/ca-certificates/-/commit/0ba2e089daf128206b0a13423ceede612bb60270

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...a-certificates_20260223.bb => ca-certificates_20260601.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20260223.bb => ca-certificates_20260601.bb} (94%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb b/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
similarity index 94%
rename from meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
index 41690d1d08..1bc64fe34a 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
@@ -5,7 +5,7 @@ This derived from Debian's CA Certificates."
 HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
 SECTION = "misc"
 LICENSE = "GPL-2.0-or-later & MPL-2.0"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=ae5b36b514e3f12ce1aa8e2ee67f3d7e"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=dab7c7cea776d1a1648deb0052c72647"
 
 # This is needed to ensure we can run the postinst at image creation time
 DEPENDS = ""
@@ -14,7 +14,7 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRC_URI[sha256sum] = "2fa2b00d4360f0d14ec51640ae8aea9e563956b95ea786e3c3c01c4eead42b56"
+SRC_URI[sha256sum] = "7ab6301f7f34eef90a4d278647c260bc0762e0e14561f4649854cf4b0d4bea21"
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \


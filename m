Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB1EAFF8875
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 00:18:31 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1492.1777421905398548985
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 17:18:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g2Gk0VtI;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: festevam@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-651cfaa21e6so434870d50.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 17:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777421904; x=1778026704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kT2DI9GuVwYz3D3YugQWzjI5kgf8Fre9euYiMjPOmiw=;
        b=g2Gk0VtI5MVZdJWWW9l9gTOnKfRFPjc6J7ajv/Sd2bLO9R/wFWN5nT12TV1/iYFbok
         Z5HixQgkm74uwzm93G0VmuxvClGQkMLO665F/K7PZTMxYl4Jpc7BIhR91QDfhYwrgvsN
         4sGeq6oso3P4cxfQ9LjH1IDlcoUVZZNvW2cEiOskBIgJn8X32+NMNHU+nTlGD0i3StsZ
         s2LxdYST0A8oEfjFv/x9mVofVUEnuKr0Qim8eAaR0AW8Cr5Ne9biTVu7sIA61f62YnGt
         /04aPres/YSQsY8Rr7y0d7UAUH0Gp/2IythRA5TWg2X/rzLesP8l4u8gqASgZpRNpzf0
         Oz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777421904; x=1778026704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kT2DI9GuVwYz3D3YugQWzjI5kgf8Fre9euYiMjPOmiw=;
        b=DitjBueDPLZFLmsUogwCsr+Vp2Tond4qkYiKC+FqGqYnlbf34Q/PSmOy1Ij0hcnzoN
         ouQO8XKjKQF/DjTIDG/gbwjD48YqiPeMaYaNeHBqfGZGb+PhdMsNOYIr2G9KBW5C+U/t
         xx74KfD6tXs8R+GTXWlECPdkm5ZY97oqK1z2Mu7KPFi8EVHAnzLSIDlLtp6c7X4Ya2op
         MKThqCYXy3hnEcoWAgpT28kkVl7T+zeTlo1riY+dY/VAghbWL0AJ1JcJ22MNfwSjhQYu
         HTgR3ToQRRfPQZSoc23fima6g9HXpAMxmZ0P/kc9Tc1jhGX/gc/32OGcadkcMJSbKQQw
         CMsg==
X-Gm-Message-State: AOJu0YyZpQ88hsehDSJr9yFwxG6FBte5EWXwjdypju8yGHAoZ53q/K7B
	2omh7tuJxIiuzCwza+ky1lHOSCIdNVWV20W5vaCFEx3awLn3iysLhxq8v99pTA==
X-Gm-Gg: AeBDietg9w2on3vEgn9/KAnk6PbJLoC+vf2S4Lf+w8/Z0QS7vncT48YboJ7Khb/t5SB
	oc9BfPxSaV3mTNkl63lLi3h/J0no06I9wo6T4DgM+7Vh1zXtqd2FO9LtibI0fZHTXc0+G//Wz+G
	UMSyXi9nJOKxNhLfW64rEuYiCPPcSXzfXcLtCFFpxWqf6KgckylaKeDxjeS941wSG9Qckkt7x6Q
	1GQsJFJMOzZsYmYia0UKICcWYKWd6ARKn9TPANycHFO6Dhob2ZqEb1hM9YE85CxSdrYVOOum67N
	lhHmDptuvjf8FXH9PSmY2wwAYJr+WbwTRrM07+z0lkcXmMy4IchcD3pTAt2SS43Y544fDax639p
	6YHHyUnLt3fC0uejRGmhBmwhS7uPZXG2L26LVoFUT1ZlvKafvPeRSnYIyd64KA37EJ4+gMPVXVk
	/8MAZl1Eao8U/fauXWSB2BcrS3N0OOe9TsdIAJoILjpPZjRmEVbOUyu1Ki98qycQA2R5NtlpBf/
	LnrWJo=
X-Received: by 2002:a05:690e:4194:b0:651:d77a:d51c with SMTP id 956f58d0204a3-65bff48cc65mr512630d50.43.1777421903999;
        Tue, 28 Apr 2026 17:18:23 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a801:1ac5:7bb3:66d6:173:36b6])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65bff4befb1sm485208d50.1.2026.04.28.17.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 17:18:23 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: khem.raj@oss.qualcomm.com,
	marek.vasut@mailbox.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] u-boot: Fix u-boot-tools-native build after DTC update
Date: Tue, 28 Apr 2026 21:18:11 -0300
Message-ID: <20260429001811.2723886-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 00:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236075

From: Marek Vasut <marek.vasut@mailbox.org>

Set PKG_CONFIG_SYSROOT_DIR as invalid path, so the host tools
build will surely not find host /usr/include/yaml.h file and
will disable yamltree build. For details, see U-Boot commit
807bcd844afe ("scripts/dtc: Fix pkg-config behavior under sysroot").

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes-bsp/u-boot/u-boot-tools.inc
index a055409c2cb0..071746b64e24 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
@@ -1,5 +1,5 @@
 SUMMARY = "U-Boot bootloader tools"
-DEPENDS += "gnutls openssl util-linux swig-native libyaml-native"
+DEPENDS += "gnutls openssl util-linux swig-native"
 
 inherit python3native
 export STAGING_INCDIR = "${STAGING_INCDIR_NATIVE}"
@@ -88,3 +88,8 @@ RDEPENDS:${PN}:class-native = ""
 
 BBCLASSEXTEND = "native nativesdk"
 
+# Set PKG_CONFIG_SYSROOT_DIR as invalid path, so the host tools
+# build will surely not find host /usr/include/yaml.h file and
+# will disable yamltree build. For details, see U-Boot commit
+# 807bcd844afe ("scripts/dtc: Fix pkg-config behavior under sysroot")
+PKG_CONFIG_SYSROOT_DIR:prepend = "/invalid/"
-- 
2.43.0



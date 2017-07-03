Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D7EB171A62
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 21:57:56 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id y5so22815113wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 14:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6uebA0a3ywOA+2hXSI1bpUryenq1MNcA6ummvZ7k3XM=;
	b=fuioSGZCOhzFWlx8hCqsGk9RJM7dE70M0olN4TAt1eTq944laiPn/zRNgI/VEMq5v4
	ZljkcvmZLgsxKdBC5mB0UscyucftUG2ALOVpqRiegCDVOukEyUQzxN21CBDLANhDzeYD
	H6E1nnvg+npZprTIS2E7D6f/8HwuGEYivsdmdBpDIIjsBivEiI+MO1McAUpJV/GaJdWN
	juPnc4Qf6jmth4JKbdC9Yq7YZy6eq1CI/G//K1wX47E3YhhWMjByOpkWvz9lL/p10trv
	pRRGfb1FFES3oyAJwxRnFzPGvBTLjvpSBpg7w6yH9Y0Qwt6oiPd6zodJI73hfYDMW7pS
	/qAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6uebA0a3ywOA+2hXSI1bpUryenq1MNcA6ummvZ7k3XM=;
	b=KYngCSxw0f2LRWAjJP3WLMQIRMZvUmELBxR/dZVHi9unQmt/NrbnihKmN0KTfsl4o8
	lTpBx2rgF0c9aMJsUnIixaY85iCMqtUnS5yQ9Y1xPmbjgCfaX4c739fWT3ef34BYW4jS
	LodBsBMLBRZ6nvtlNs9dOou03/sI9SQDH3yKJwO73NSO4Jk5uWZxH86M14WGd6rDg2zH
	RUgET89ohjWQUzv4MJrcjBbmZoIZS4czkh1kbA2mtnZe2kc8J7X38oMBjRvNJZJX9vQD
	d7MMi3uNy7m5m/VU5sRQeGXmQtCmSADQT2dpzQTIdjNYuQx3ZwGxJjTrMrj2mn+HfSWR
	GbaQ==
X-Gm-Message-State: AIVw113jpf7yucT76p2zQZ2i8XCQq2fekg0DFywI/jCpyfW76ek7eyru
	SDXYFviKO8DAeUpcPRM=
X-Received: by 10.80.196.79 with SMTP id w15mr7683913edf.124.1499119077902;
	Mon, 03 Jul 2017 14:57:57 -0700 (PDT)
Received: from localhost.localdomain (80-71-134-83.u.parknet.dk.
	[80.71.134.83])
	by smtp.gmail.com with ESMTPSA id g38sm8985515edc.7.2017.07.03.14.57.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jul 2017 14:57:56 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jul 2017 23:57:43 +0200
Message-Id: <20170703215744.19096-3-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170703215744.19096-1-ricardo.ribalda@gmail.com>
References: <20170703215744.19096-1-ricardo.ribalda@gmail.com>
Subject: [PATCH v3 3/4] libgfortran: Add missing fincludes
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
X-List-Received-Date: Mon, 03 Jul 2017 21:57:57 -0000

ERROR: libgfortran-6.3.0-r0 do_package: QA Issue: libgfortran:
Files/directories were installed but not shipped in any package:
/usr/lib/gcc/x86_64-poky-linux/6.3.0/finclude
/usr/lib/gcc/x86_64-poky-linux/6.3.0/finclude/ieee_features.mod
/usr/lib/gcc/x86_64-poky-linux/6.3.0/finclude/ieee_arithmetic.mod
/usr/lib/gcc/x86_64-poky-linux/6.3.0/finclude/ieee_exceptions.mod

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-devtools/gcc/libgfortran.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index 3b94c1b85b70..5f5d4af7589d 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -54,6 +54,7 @@ FILES_${PN}-dev = "\
     ${libdir}/libgfortran.la \
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/libgfortranbegin.* \
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf_single* \
+    ${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude/ \
 "
 FILES_${PN}-staticdev = "${libdir}/libgfortran.a"
 
-- 
2.11.0



Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0FDCC7E01E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 18:03:58 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id e6so1599040pgc.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 11:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bX6F6gWg5H9jufMXZswmkXaTlto2Ph1aO60xu1yhbOY=;
	b=KOQH1w2ny0HWETg+/cjN/4kvbVcDGIQbQvLIZLsSTO4cBnPEdlSyn2Oqyurk8RV4w6
	RTt04PojnEtvvbrIaybd3MEPEcJ+sC/Vu0e5Hs8sigrF6giLEqnEkJZWYBraZtj+j+w9
	aL3XYFwvopEoBUmLOgTos0Z6UlWE/1eyypl7ujn22633635AD2pY2SeUY9bwYb75RbVz
	0FmRpEcafpJ3qaI01aX6fY0dzD1mxKOXCdbR73Q3HzvuPzkyetXfWVyzcHYc1TFi8gXt
	tUudU40nJH0kworhG1cpeSk857xVHWqssExNCVoAnAKnP1+tRUg66Egz3GL/gLEca1sy
	Z71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bX6F6gWg5H9jufMXZswmkXaTlto2Ph1aO60xu1yhbOY=;
	b=XDlUUzFdJdG9KxgyGJpkwED93honTNqdvfoXLivMD+0oZgujqpmI5YrsPUYjmuN9px
	C/mtkrJLytDwMspiHjSLs3V8GV1A+j7EaqqIp29CgNnGWbX1LE8W+kspPp2+uhQoBySW
	oaXQsD9x3cF1qcKIxrgbG96kFAJZfwLrdNRpT8MqUgcyp82KnDi2NOYTXudHDsX1PM1p
	c5SUuGFwm/mKKSQai/ElgOzY66CpOZxrBPpWxAFhQmMRGQtw43w+4dKVWoVm/yyqf4zH
	64V5j1qy8s+wxhaxiCk+VCjaSwYYTWjsKEc8/8cDAH8a30KNKgToUYn/eU3TlBmo8Qxb
	nUpw==
X-Gm-Message-State: APjAAAUOschhKDhAHlYTVFca3RPfkeaqye+P8RNJbv3k4CIAWtB0pf9n
	PuAq3nw61WqroMHRK0886rUuwm0KY4s=
X-Google-Smtp-Source: APXvYqw/2bQEXglzhri1z1pI/sj8Wm9P5CcVPYffQ0Y62rK3zQ3bQ1SCH1PEGToX2tetvbpEk+7lCw==
X-Received: by 2002:a62:1690:: with SMTP id 138mr7125824pfw.28.1557425039435; 
	Thu, 09 May 2019 11:03:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::592a])
	by smtp.gmail.com with ESMTPSA id
	u123sm6461296pfu.67.2019.05.09.11.03.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 11:03:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2019 11:03:51 -0700
Message-Id: <20190509180351.29443-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] libgfortan: Package target gcc include directory to fix
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
X-List-Received-Date: Thu, 09 May 2019 18:03:59 -0000
Content-Transfer-Encoding: 8bit

ERROR: libgfortran-9.1.0-r0 do_package: QA Issue: libgfortran:
Files/directories were installed but not shipped in any package:
  /usr/lib/gcc/x86_64-poky-linux/9.1.0/include
  /usr/lib/gcc/x86_64-poky-linux/9.1.0/include/ISO_Fortran_binding.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/libgfortran.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index 4b7b7b2aca..7543585e6e 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -66,6 +66,7 @@ FILES_${PN}-dev = "\
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/libgfortranbegin.* \
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf_single* \
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude/ \
+    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ \
 "
 FILES_${PN}-staticdev = "${libdir}/libgfortran.a"
 
-- 
2.21.0



Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2C6F97ED17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 10:45:47 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p74so21636130wme.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 03:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=12mPXWn0Ux+VFa5LbGA24ztLa4OMjFK16phSl/qgNHU=;
	b=UCVPmmXpg4fq9oSYWh0lYisN6QWbv97g9cfLXsrDcpS5KIpbSDf9KBKbzifEckstpc
	GZIxuk5cf0ymLE2JaHFq7iZeP+8wwHL99foD07dt7aUs5nmVm7Kkzzvvi+GK6bkcdI1Y
	va/fnyuGJ/foSrD2Io15v0K5Dv47fLSO/09C3WlXrTzIw7qLdEIj7X/jnQwBLGqrO9Dq
	RTijL+Gcn01Bx19lZh4AtPwPZEimaRsDcXhQ0G0rRUcMuLdfCsjYzxDuXYYawVDIjs6Q
	auR2le8QzKb4vdV4Xm1rAyAay/D5nM4MLbOyQRTEAWq//ew+HCsZoNAbaSsV+tDl8hmB
	PbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=12mPXWn0Ux+VFa5LbGA24ztLa4OMjFK16phSl/qgNHU=;
	b=IIeBqwNHSJkrYZn3LlW8EfnMEBcLuV0nTgXXDT315cyLd+Dn3qsLrmeR+qnSBToDzU
	DEq1DvdyADeRMuEOLdNxUUUrR2tx5ZYkqkBEjqGojVgb2c5oiCHnz8yFybzOvMIuWtHn
	UU8krFVxlJgALZPLoDxCoWR0AR7fcc6mgTylpHxJ8nXYlFj2KpnJ1sH/ANz9aSIO6loz
	HvaPTPVqzt4Msk/Wqv74kYATSC36bo2hZETuFBlvfkAZ9pffarhcV1PfHHq5QlYqFPLT
	Po3OUHmEBNVvX4duUxUNthL+foMe6xsClUUoY/yoGmCQe66nqShv6O4f9fcckmFf2Fy9
	AiEw==
X-Gm-Message-State: APjAAAXoc9psUijZrrhHrUo+20toxjn/XlO1rudvXnp8arETeid2tkko
	p19AbcL9SJ+FvSy3S0BsSdJYjpa47CU=
X-Google-Smtp-Source: APXvYqy6UI62UXNwh1DqgNkqeepjSzq+QijlXCKqUGPCZ5TpIunuH1f2u9QR2W+uEgshPqPYorhWuQ==
X-Received: by 2002:a7b:c00b:: with SMTP id c11mr36802040wmb.46.1563360347721; 
	Wed, 17 Jul 2019 03:45:47 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o11sm22822097wmh.37.2019.07.17.03.45.46
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 17 Jul 2019 03:45:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 11:45:37 +0100
Message-Id: <20190717104538.20990-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717104538.20990-1-ross.burton@intel.com>
References: <20190717104538.20990-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] flex: set CVE_PRODUCT to include vendor
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
X-List-Received-Date: Wed, 17 Jul 2019 10:45:47 -0000
Content-Transfer-Encoding: 8bit

There are many projects called Flex and they have CVEs, so also set the vendor
to remove these false positives.

Signed-off-by: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/flex/flex_2.6.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-devtools/flex/flex_2.6.0.bb
index b477cd8c7f2..12ce0cb461e 100644
--- a/meta/recipes-devtools/flex/flex_2.6.0.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.0.bb
@@ -68,3 +68,6 @@ do_install_ptest() {
 	    -e 's/^builddir = \(.*\)/builddir = ./' -e 's/^top_builddir = \(.*\)/top_builddir = ./' \
 	    -i ${D}${PTEST_PATH}/Makefile
 }
+
+# Not Apache Flex, or Adobe Flex, or IBM Flex.
+CVE_PRODUCT = "flex_project:flex"
-- 
2.20.1



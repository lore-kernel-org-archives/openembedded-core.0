Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8DE5660D03
	for <openembedded-core@openembedded.org>;
	Fri, 31 Jan 2020 00:28:02 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id 185so2370724pfv.3
	for <openembedded-core@openembedded.org>;
	Thu, 30 Jan 2020 16:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=whl33y3FI0DVJ/PPEgMMDN5dYsUaKMJwmKWaXrSpNac=;
	b=C5KDcNRd5KYbx/5nDzxKd0MDipLzR3aop9U33bDMvOp8jSecTHSVe7XuiGUp9wkqk4
	0fDZOeInETCE0BSmHfA4bejl5YWi1VA73IecZkWbekxwPgraE01fZ5bJGUprVfJ0kghn
	YGOZm66LnM7nnIQ9BgOmAwbHfbIilJ34222DfhkvgepB1RDwO1CAOqEPxyBRUObb9SZQ
	9gHxq6w5PCTmrKn71t4a0WUsvy/+xmK+ftBBH8irBakwaU5imVGTRS9LUem86s09bszu
	cjJ+x8KPI0NYPWq1gaFgYzsyGOMFN5MElULEEYa6HfFc78BpV0rT5p0yHIS9Jg2NaHn/
	W0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=whl33y3FI0DVJ/PPEgMMDN5dYsUaKMJwmKWaXrSpNac=;
	b=cVLBY6bDjQP/4rEIY6+IKEVlQyQ8ohHy//bMrgT6atv0HPvvZz1yJtPcTk7t7pNd43
	a5eq4L9Dgi9wK7GTsEg5FoTznUesXfYdYLidII+muN14/uU5OyDf6MTgjX/HNeUAdN93
	pWsW8ajXCMH0kjRi6kWxQ5acadD6c3DhTetqc6MLNHwnmamxD0WYaJKRUhonBTEPqMew
	0tZ4xDm60a1sadDOrF6a1P1YojP8vRzjy4o1v8BsLwAJFn1y7KKsQDNYHAZ4+pUDAM2q
	wxC4gIC9MBCt7ZWQgiFOtLqcr4G28h9Bas1Bi/A67acl3+w7diSwvrATnWdaGjN1aEiw
	M8LQ==
X-Gm-Message-State: APjAAAWNIoe41KZxTu2/sPbUE9XGw/K03HlPpBIcx/dFchebWIrHVXzP
	MSdyrA3vOUspNtCPKhT6AwEBdAJX
X-Google-Smtp-Source: APXvYqw3GqC7W9EKTzgo27UGX1C2dkvXsQbfG0xhgMPkxw3xyepixcV8YhRosm/sRKBCojHuI6J6hQ==
X-Received: by 2002:a63:1346:: with SMTP id 6mr7460239pgt.111.1580430483358;
	Thu, 30 Jan 2020 16:28:03 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:9979:cdb6:7624:d076])
	by smtp.gmail.com with ESMTPSA id
	j28sm7949306pgb.36.2020.01.30.16.28.02
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 30 Jan 2020 16:28:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 30 Jan 2020 16:28:00 -0800
Message-Id: <20200131002801.31570-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] bsp-hw.json: remove mpc8315e-rdb manual tests
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:14 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/bsp-hw.json | 52 --------------------------------
 1 file changed, 52 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index 5c5b9b50bb..73cbaaa7c2 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -915,28 +915,6 @@
             "summary": "Check_if_RTC_(Real_Time_Clock)_can_work_correctly"
         }
     },
-    {
-        "test": {
-            "@alias": "bsps-hw.bsps-hw.Check_if_target_can_support_EEPROM",
-            "author": [
-                {
-                    "email": "yi.zhao@windriver.com",
-                    "name": "yi.zhao@windriver.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Check eeprom device exist in /sys/bus/i2c/devices/ ",
-                    "expected_results": "Hexdump can read data from eeprom.\n"
-                },
-                "2": {
-                    "action": "Run \"hexdump eeprom\" commandroot@mpc8315e-rdb:/sys/bus/i2c/devices/1-0051> hexdump eeprom0000000 9210 0b02 0211 0009 0b52 0108 0c00 3c000000010 6978 6930 6911 208c 7003 3c3c 00f0 8381\u2026\n",
-                    "expected_results": ""
-                }
-            },
-            "summary": "Check_if_target_can_support_EEPROM"
-        }
-    },
     {
         "test": {
             "@alias": "bsps-hw.bsps-hw.System_can_boot_up_via_NFS",
@@ -967,34 +945,4 @@
             "summary": "System_can_boot_up_via_NFS"
         }
     },
-    {
-        "test": {
-            "@alias": "bsps-hw.bsps-hw.Boot_from_JFFS2_image",
-            "author": [
-                {
-                    "email": "yi.zhao@windriver.com",
-                    "name": "yi.zhao@windriver.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "First boot the board with NFS root. ",
-                    "expected_results": "The system can boot up without problem\n"
-                },
-                "2": {
-                    "action": "Install mtd-utils package. Erase the MTD partition which will be used as root: $ flash_eraseall /dev/mtd3 ",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "Copy the JFFS2 image to the MTD partition: $ flashcp core-image-minimal-mpc8315e-rdb.jffs2 /dev/mtd3 ",
-                    "expected_results": ""
-                },
-                "4": {
-                    "action": "Then reboot the board and set up the environment in U-Boot: => setenv bootargs root=/dev/mtdblock3 rootfstype=jffs2 console=ttyS0,115200 ",
-                    "expected_results": ""
-                }
-            },
-            "summary": "Boot_from_JFFS2_image"
-        }
-    }
 ]
-- 
2.17.1



Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4F3E66C489
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 01:48:45 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id s5-v6so8007289plq.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 17:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3fnEOOGlF0lxM5YJMV/z9At6IcMggmW+VIShwmG0CQU=;
	b=n2U3flJxOo60xhfYFtTd1J3ncO1rmgd8CjiRRSFdcCB+sGgWTzxbSj2AcOzxyytTB+
	v5WGPzCR/TSh++X+jK7kdWjOrY1bOY2JFtznrL/VXYVy7m7orLYU0IfQx8SSVcF5c1rc
	+GjZJR0uNVvsV7x5pfirVPgj89ErJjQ8sLwO2Ez4W3/0YS+G95kcwJFfRsV4/tNXok+w
	eVeh2OcsqVorAPHSpQNufAVK4TMRbI5oKCJLWvIhH/xAVFjbc5rgBxArnIsUvLfsYSVt
	yD3q9YCbzWzTtDn64hJIiqpqWJBoWydFFIc+yIMxNdNC+nWIIoYiZwsO0yC4i3fIlwru
	YiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3fnEOOGlF0lxM5YJMV/z9At6IcMggmW+VIShwmG0CQU=;
	b=QR5pYb+1owOQQc7IFMwNzNI6IWj1sMJnZAX3Rg0CFjE1Rwj8LjTme900P3LHDcjovW
	AQMPF3lgsJ/uAO/Vyorkq6jFGP+kQ9KBbhfoYCRSSv4v4/E17/P7XlQO1iIpEiwRxVrI
	hZju7GHTpL4hMO0K100J/w+x1BOpZ/pghImm9AiUlg3L1uvSMRTU0/FMiBqDol8U0gPk
	mf/dl0D8ccwIbcrUMbN3UgUx1sOi2VPN3fnF87JgfdMV1zFDNVTeY6J+x6bom8yYsL7d
	cXJSwFeMRCyIPHCskjIQ5fK9qtHDjAL1n6Y9hoIfah2Wck3fvWIwFvXxSMmIah4ekSm2
	I7Kw==
X-Gm-Message-State: AA+aEWaQAqtPyyo+hzgAbv2ARMkAwHZS745vP9rhJD9AE/dO6D+Hy9Jw
	JC5DNeIsS9SHXBaoHrU2UwjOmR0S
X-Google-Smtp-Source: AFSGD/UaIqbnKDmVYENejjXrG31KlOe7lXhi9doquJa90g5FFroztJB5mw+FTlo6b1x1CGw1ps2RlQ==
X-Received: by 2002:a17:902:8b88:: with SMTP id
	ay8mr9317808plb.55.1542851326110; 
	Wed, 21 Nov 2018 17:48:46 -0800 (PST)
Received: from ip-172-31-17-76.ap-northeast-2.compute.internal
	(ec2-52-79-234-68.ap-northeast-2.compute.amazonaws.com.
	[52.79.234.68]) by smtp.gmail.com with ESMTPSA id
	d21sm42216468pgv.37.2018.11.21.17.48.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 17:48:45 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 01:48:30 +0000
Message-Id: <20181122014831.46298-2-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181122014831.46298-1-changhyeok.bae@gmail.com>
References: <20181122014831.46298-1-changhyeok.bae@gmail.com>
Subject: [PATCH 2/3] ethtool: 4.17 -> 4.19
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
X-List-Received-Date: Thu, 22 Nov 2018 01:48:45 -0000

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch                | 2 +-
 .../ethtool/{ethtool_4.17.bb => ethtool_4.19.bb}              | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_4.17.bb => ethtool_4.19.bb} (88%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index d81320a94d..beae5f98c3 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -19,7 +19,7 @@ index e891d91..600f8a8 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 4.17, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 4.19, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu])
diff --git a/meta/recipes-extended/ethtool/ethtool_4.17.bb b/meta/recipes-extended/ethtool/ethtool_4.19.bb
similarity index 88%
rename from meta/recipes-extended/ethtool/ethtool_4.17.bb
rename to meta/recipes-extended/ethtool/ethtool_4.19.bb
index 844a958ed9..74e255c24b 100644
--- a/meta/recipes-extended/ethtool/ethtool_4.17.bb
+++ b/meta/recipes-extended/ethtool/ethtool_4.19.bb
@@ -11,8 +11,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[md5sum] = "4dba0345a4ab9f51b4a4a9739284238d"
-SRC_URI[sha256sum] = "4130142a15f7409d18de3667998f3c99fba52fd7c8d94be7ecdabf8dcab3d6c1"
+SRC_URI[md5sum] = "a533db1d202724822c4ef297643fac12"
+SRC_URI[sha256sum] = "e8e88f5a79c78e542cd84fee60b67dbf29cee63e4760e8d61544fea74c761ad1"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
-- 
2.17.1



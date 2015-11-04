Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 063EA77121
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 19:55:12 +0000 (UTC)
Received: by wimw2 with SMTP id w2so1054719wim.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Nov 2015 11:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=WmoxiN5srtythntnvlIlqdz3J/oDLVVH/yp51NNq72E=;
	b=i8z4HSro3k+M4lrGFQgEU4YPWcqbkq5+mBVIub+DsTogdtdFBBCUevQj6jOUEjCW1T
	pPKTL+f/HDVZ7cd1Fgcp8Kkd4MAZjS7SvUWsV5ZfzaM04yvgY2O4xZVWDLl8v3xynCrz
	OkWMDTjEmAFAcC9rblt9APgumrrDl4KV9YeDxiG6R2ktN8EwevulOFonrKTuTcYRBMuj
	qf3dV3192JsnnosUv6Jn6gwqV3zh3u4Itty9BHVAFNgY9CyGrxmXOWTKL96Gg8DT1TyI
	ZK/rwZ1r3OicYjfFC3lQ0JeHjD7VyDOCv506vDlIgfk8UBYmIF5P0qdFm6LKmGAjbVwG
	/Gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=WmoxiN5srtythntnvlIlqdz3J/oDLVVH/yp51NNq72E=;
	b=Ffij2FjaeJt7lzRoBUs/my0Ei5fWdswaR94ueymW5C8fH/ZyUXXluHXFYdvyGqlgFE
	DZlbvpoeB9TBNha+lYwlIVUO49jKv/+YMglg+5KbDO6YrgF/ZcBfI2MPsdUovmDoxUWm
	bAjRivrdNnbLfsGRKZJrtv6qB3jV4JsGcqgfDZW11nl9dpqQwviudjaRXja1yPWdyWnk
	p08QAvjPK+PShuOMnIqXOY7m6oNI3cQjigRvm9Pgcx5v06Z9vQe16F8Ap0FvpHpqqUt2
	prmlp76txzfM/GzIBWIg1Pf55LuvNNdN1Yo2xc/Yixpsw4DGGhdPM9Llh4h+aW83/Hwv
	wgFA==
X-Gm-Message-State: ALoCoQkSwKRQXpCSCeQBlOb0GCgG0P5VxZtbjhnNQTHIZRb/hIMRS0KCHu2Uoi0D+qOiUtIzjgZB
X-Received: by 10.194.200.233 with SMTP id jv9mr3977245wjc.133.1446666912595; 
	Wed, 04 Nov 2015 11:55:12 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id w9sm3206881wjf.20.2015.11.04.11.55.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Nov 2015 11:55:12 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Nov 2015 19:46:59 +0000
Message-Id: <1446666421-2549-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1446666421-2549-1-git-send-email-ross.burton@intel.com>
References: <1446666421-2549-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/4] unzip: rename patch to reflect CVE fix
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
X-List-Received-Date: Wed, 04 Nov 2015 19:55:13 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../unzip/unzip/{unzip-6.0_overflow3.diff => cve-2014-9636.patch}       | 0
 meta/recipes-extended/unzip/unzip_6.0.bb                                | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/unzip/unzip/{unzip-6.0_overflow3.diff => cve-2014-9636.patch} (100%)

diff --git a/meta/recipes-extended/unzip/unzip/unzip-6.0_overflow3.diff b/meta/recipes-extended/unzip/unzip/cve-2014-9636.patch
similarity index 100%
rename from meta/recipes-extended/unzip/unzip/unzip-6.0_overflow3.diff
rename to meta/recipes-extended/unzip/unzip/cve-2014-9636.patch
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 9e63d3a..b386323 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/unzip60.tgz \
 	file://avoid-strip.patch \
 	file://define-ldflags.patch \
 	file://06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch \
-	file://unzip-6.0_overflow3.diff \
+	file://cve-2014-9636.patch \
 	file://09-cve-2014-8139-crc-overflow.patch \
 	file://10-cve-2014-8140-test-compr-eb.patch \
 	file://11-cve-2014-8141-getzip64data.patch \
-- 
2.1.4



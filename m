Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id A687076FD0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 21:41:06 +0000 (UTC)
Received: by wicfx6 with SMTP id fx6so65051985wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 14:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8CC1OxC/DxlYKr1jNROybnHaktns8Gc9ei4fqUX3V7U=;
	b=P8mRRfRPJJzzQVuyeVbygO80XKmX17HcC6TTuDzT0XoTm1YXeQuOVRrBSEO341nYdj
	MrEITO3F478XxfrJOf/8ZDsO4RlG78qNdzH2Q3oX59iIGy7/jGekTEfRVX2zX2N6PHl8
	IO40MxHk7+rwq+ZNK1P89ckyBYYeYXB0E0CuHqDOtW2Ba/rLvSkTMWaZUesluAIBGqql
	jexqTw46BAp24hSzRB9o8UbTuRi1w9EY6eAezaOXpHJseG7Elhc9AU05/91Mn9Ga49lr
	rWXQ+FBSHi3Hl+meGMRavPgWhPZaHrNS/VskHsprrVS4rRHdr79w2k2sTxI1vs9WAj6G
	2h0g==
X-Gm-Message-State: ALoCoQnOJdIWnTMLKILguB5Sk/eAD2xgEzPmH7H0QrR3zeRIKsyOSTthTnfbCrLeoRUpkw/aLYdX
X-Received: by 10.194.123.2 with SMTP id lw2mr7380619wjb.48.1445377265978;
	Tue, 20 Oct 2015 14:41:05 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	lf10sm6209805wjb.23.2015.10.20.14.41.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Oct 2015 14:41:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 22:33:25 +0100
Message-Id: <1445376809-25202-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH][V3 1/5] bitbake: add file-native to ASSUME_PROVIDED
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
X-List-Received-Date: Tue, 20 Oct 2015 21:41:08 -0000

Various key parts of the core classes (for example, do_package and
do_populate_sysroot) currently require file.  As it's not possible to build a
file-native without invoking do_populate_sysroot mark file-native as
ASSUME_PROVIDED and expect to use the host's binary.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9ddd1c0..06971da 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -166,6 +166,7 @@ DATETIME = "${DATE}${TIME}"
 ASSUME_PROVIDED = "\
     bzip2-native \
     chrpath-native \
+    file-native \
     git-native \
     grep-native \
     diffstat-native \
-- 
2.1.4



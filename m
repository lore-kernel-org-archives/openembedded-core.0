Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 88DDB60069
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 16:04:55 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id u15so2700123ljl.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 09:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=bJYOQktqY95KYX6cxml6q7iNS4FgzfrAdVhiIUWH/8U=;
	b=ESSelW03Tf+7NO9jsIDVGPs2CtRdqcKxBtac4R7mCbaPIYV+9kSBUClYTUWL30cT4r
	scS7xmdgoAdRt+8wpnYeXS4O4FDLn81sJUgJ96Y9pB76LyA+xoRalaaTtdXc76gs80/2
	Tylcy1ITd6IoLnhzm3UD8iAef6kI3IYkdGj4ht674+89kvs2Cevv2s0xir3VNRiyzDKg
	BGzNIezwX56tKs6xbCWY9hgwn7gQURyHFI7zmjxoyZR3wbkxxd0ucKRWn7g7P+FA1QoE
	lRRQaFw6yYCTLo0vbTjzHXx9A2N63nY4TPqVBi/xoOdu34xsVJdU6vYW0I0yJIMRENS8
	8U4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bJYOQktqY95KYX6cxml6q7iNS4FgzfrAdVhiIUWH/8U=;
	b=RtGtzEzRdXGmWTWMfOFR5Gy5G87vy0w14R6WFaO2lOHFsRrXmrZeFEvJC5DnWOc6Z7
	QuGiOJiSa3+p630XrodSlpqTJegLSjLpNjArTgBbUSzuhhb3rgyqFmC0iu+gCYpqQ24d
	Owbw2CM1O98eN0Yux8QfaYv0bEBwkXi3vMWvZyNwTtuJakUUd+C5Skiz4qavTwWaQxg9
	aJfZmqlctNLSt2by325Qni51VrSvJsog4MGLgrPjo7xsdvcYgKrLDV6BHo/eoMfedLfX
	7SbZnhzkU7elmj2TyUkbfqInUVdTpEeDpsocPH2zc0Qi1X1erB2UrcFF5rjN7aBq6hb8
	FklQ==
X-Gm-Message-State: APjAAAUR+vg6a2CZ8unqSHubgjdYIhtZ89EPNbUTKKLrD1usCfTna78U
	vYugQgKQ1g2U3wbGHjFOE2hSvu8Aa4o=
X-Google-Smtp-Source: APXvYqxAlK3YXXfp87XbQ34j2B307NjTOrgSI2lgLTHTMdlV1AcKFb6+sFb5uCU/x0QBFHeUvCgWog==
X-Received: by 2002:a2e:6101:: with SMTP id v1mr3125757ljb.42.1565885095869;
	Thu, 15 Aug 2019 09:04:55 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id w21sm509580lfl.84.2019.08.15.09.04.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 15 Aug 2019 09:04:55 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2019 18:04:53 +0200
Message-Id: <20190815160453.32720-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-scons: update to 3.1.1
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
X-List-Received-Date: Thu, 15 Aug 2019 16:04:56 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...n3-scons-native_3.1.0.bb => python3-scons-native_3.1.1.bb} | 0
 .../python/{python3-scons_3.1.0.bb => python3-scons_3.1.1.bb} | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-scons-native_3.1.0.bb => python3-scons-native_3.1.1.bb} (100%)
 rename meta/recipes-devtools/python/{python3-scons_3.1.0.bb => python3-scons_3.1.1.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-scons-native_3.1.0.bb b/meta/recipes-devtools/python/python3-scons-native_3.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-scons-native_3.1.0.bb
rename to meta/recipes-devtools/python/python3-scons-native_3.1.1.bb
diff --git a/meta/recipes-devtools/python/python3-scons_3.1.0.bb b/meta/recipes-devtools/python/python3-scons_3.1.1.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-scons_3.1.0.bb
rename to meta/recipes-devtools/python/python3-scons_3.1.1.bb
index f1545dade6..0c7aaeaeee 100644
--- a/meta/recipes-devtools/python/python3-scons_3.1.0.bb
+++ b/meta/recipes-devtools/python/python3-scons_3.1.1.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=37bb53a08e6beaea0c90e7821d731284"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
-SRC_URI[md5sum] = "e2fe9d16f81b0285b969238af4b552ff"
-SRC_URI[sha256sum] = "f3f548d738d4a2179123ecd744271ec413b2d55735ea7625a59b1b59e6cd132f"
+SRC_URI[md5sum] = "35b2a3993313bbedd221d4d5758fd2fd"
+SRC_URI[sha256sum] = "4cea417fdd7499a36f407923d03b4b7000b0f9e8fd7b31b316b9ce7eba9143a5"
 
 S = "${WORKDIR}/scons-${PV}"
 
-- 
2.17.1



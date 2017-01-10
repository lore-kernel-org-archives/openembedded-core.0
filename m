Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 60BD171A5E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 17:53:32 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id c206so83106008wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 09:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mdFGW+D4y9xyzo8Dh+RTCYK95/T1WCsmFESOk2q1z3M=;
	b=TORkYd4Q3Ls+8kpn/XYSjRybF9VbgkAbe3rJIfcfDKvhnTvRD9AxabSd4QCatU3KYo
	LhN0FECrGPMs/RfyZf8dZRP6OA45QxgDfKanw61fq1ICNfXoxgorrGRvsjQN8N5RlMLX
	FJ8ugAhiobFRuxwuzM+hgHklPeqmQO6NRkzFX3eT6ValVJT5SV22fhlfi4KS5Wjs2mVl
	H1kM9Pz6/sMtT7hkRBaLTw7PuLtxzg1uPW8pin926uRT9sbsHAYUaiDgbNSB3T1HAwsK
	6Yf57L0WTWPsYZiDB3TAKGRWe2oHmsGt/8HkY0jrW7YW7XHPScsicXHD7KnUjNHTquZi
	3glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mdFGW+D4y9xyzo8Dh+RTCYK95/T1WCsmFESOk2q1z3M=;
	b=HPD2ySR0Vrtdgiko2xkIBwQKiWJi4ZvvT3NRWN+P/wK/jgfbQKK5Cw+71tPvRBKSB4
	Cs5F/CgwXO7DZismlQXZD2POjVlzB1MFdZ6L9tjAQcv5U03Vl9pZ0unx4cXKcYKyEcym
	UnvoDG4LU0ecyfFHps7MHMRLndxAdkancf2Pc+3H/ZoI7eLCqwCOlP/OiSlqptZQfOys
	kVhNljT20J/rW8R9EorKUrflAVCm9NUhigN2hGjw0ZJXUW93QRvM8jQ1l1ipJRlbrwEE
	K4ginaJsM61GCflwEokILBdgJrahEbWWzGGKdvOhlF9PLKPugKL3yggBcIWkEHHxHE74
	ugfw==
X-Gm-Message-State: AIkVDXKixF1sirNoPaXGQziBMxlUFylsyBCZkOH7+K9oBiYckM1U5rAi3V6crctOo5uR9Q==
X-Received: by 10.28.207.70 with SMTP id f67mr2501546wmg.72.1484070812666;
	Tue, 10 Jan 2017 09:53:32 -0800 (PST)
Received: from localhost.localdomain (p579F7DD6.dip0.t-ipconnect.de.
	[87.159.125.214]) by smtp.googlemail.com with ESMTPSA id
	w7sm25607628wmd.24.2017.01.10.09.53.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jan 2017 09:53:32 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 18:53:19 +0100
Message-Id: <1484070799-19031-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH V2] python3-pygobject: add PACKAGECONFIG for cairo - enabled by default
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
X-List-Received-Date: Tue, 10 Jan 2017 17:53:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Have onboard (onscreen-keyboard) in the pipe for meta-oe. For that working
properly we need python3-pygobject build with cairo support.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-devtools/python/python3-pygobject_3.22.0.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.22.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.22.0.bb
index 1c8dc20..5a89544 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.22.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.22.0.bb
@@ -18,8 +18,14 @@ SRC_URI[sha256sum] = "08b29cfb08efc80f7a8630a2734dec65a99c1b59f1e5771c671d2e4ed8
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-BBCLASSEXTEND = "native"
 
-EXTRA_OECONF = "--disable-cairo"
+PACKAGECONFIG ??= "cairo"
+
+# python3-pycairo is checked on configuration -> DEPENDS
+# we don't link against python3-pycairo -> RDEPENDS
+PACKAGECONFIG[cairo] = "--enable-cairo,--disable-cairo,cairo python3-pycairo, python3-pycairo"
 
 RDEPENDS_${PN} += "python3-setuptools python3-importlib"
+
+BBCLASSEXTEND = "native"
+PACKAGECONFIG_class-native = ""
-- 
2.5.5



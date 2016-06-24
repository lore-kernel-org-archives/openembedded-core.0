Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 539E873178
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:54:34 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 187so4003119wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 03:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AWRlat3erUWPJYWJIs1+DUHrVMEsygIIwKlSCw6gHMw=;
	b=SpZI83KqqoIsbCz4tsot7DuQhEFkZ2whCxMOrbiA1m1jxsS5eqNG3mZOU6FHqHJqIO
	XXSe/IsJu2kp2IL0bY4OYoLS3no2Ye2/iQiwlEXg3EQOTncfsF51fYGZuKEQNH7WtrXf
	lnfsvhHlD8kLT+dVLvLQ+Wfr3lnvRjfURAh9ef7m8pAYwgIsw1Ir6t4x7ESeoOjpcd00
	irXHPNT8pw2IcFj01vUV0NmCRd5WsQdJKHesHJluaSy8Z/Imrxw13E/6vTWEs/xOV1So
	AxM+pLH+cNEZjU23hPFePyLvBl8RdFMgWKcjbjh3TjhptDQR4yyWsif+MAN69gBrtBm9
	Ax7Q==
X-Gm-Message-State: ALyK8tIkqU5vNs2rYcHDdyPTKt1P21Y1QuHi/bFA8gEXJk73btfIAc6le1/C6HNhgvRr1g==
X-Received: by 10.28.181.146 with SMTP id e140mr5089145wmf.38.1466765674784;
	Fri, 24 Jun 2016 03:54:34 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.65])
	by smtp.gmail.com with ESMTPSA id b4sm4588563wjd.16.2016.06.24.03.54.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Jun 2016 03:54:33 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 11:54:28 +0100
Message-Id: <1466765671-22371-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 1/4] libidn: fix QA warning (uClibc)
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
X-List-Received-Date: Fri, 24 Jun 2016 10:54:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

WARNING: libidn-1.32-r0 do_package_qa: QA Issue: libidn rdepends on libiconv, but it isn't a build dependency, missing libiconv in DEPENDS or PACKAGECONFIG? [build-deps]

We already have virtual/libiconv which is set appropriately
in all environments, so let's use it to fix the issue.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-extended/libidn/libidn_1.32.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/libidn/libidn_1.32.bb b/meta/recipes-extended/libidn/libidn_1.32.bb
index 4d6e885..565c75d 100644
--- a/meta/recipes-extended/libidn/libidn_1.32.bb
+++ b/meta/recipes-extended/libidn/libidn_1.32.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=df4be47940a91ee69556f5f71eed4aec \
                     file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://lib/idna.h;endline=21;md5=7c0b3828d1b153663be9a04ad4f7975f \
                     file://src/idn.c;endline=20;md5=f4235f2a2cb2b65786b2979fb3cf7fbf"
+DEPENDS = "virtual/libiconv"
 
 inherit pkgconfig autotools gettext texinfo
 
-- 
2.8.1



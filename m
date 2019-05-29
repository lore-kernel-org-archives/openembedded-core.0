Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id AD1B97E28B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 18:43:29 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v22so2281305wml.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 11:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=R0Px6zoVAzMbYKybK2hq01GmrTgrEt8/KlEclj20cKA=;
	b=ihG+K4SIjvGh/0/yF50t4eHhcuewjQ6CVxNwVoUc37SXSk/KJ+JQ2aHxUrTepZ5/R6
	+fJdDN11/fMNj1y5B9mADU0pQYf5CCfufn3Ddwtf8mi/JuXuFXyyRc4epVAfg4HK3bh8
	zEIrXkXJfYRluMkEsIYV4ZYevRndY4ka4Cnnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=R0Px6zoVAzMbYKybK2hq01GmrTgrEt8/KlEclj20cKA=;
	b=f5hevoB7s3UZR6pKL6ReTJlentUgRtYKQ5rI0Aiql0La0bwNzOLWxeIHZazVfscFH+
	AIvLsNHrjuJVx4uMD9U+6UukC7xNVkzIM3g8H1Ouk1CTOxRhnOvg3PXJ9yYhp8F53mRp
	GJ5rYgOuY9MedAB7E+3+49IpUm+zC4yaLo1WIyQDr07PNPi+k4MlG0e15NU3Z5DE3wrL
	KOqayTRQbnKGRP38O868Sp06YaFlAg3NEpW+nOadx3KfX7LfY8ZkuYKcV6HSvkzOiVuc
	cCi95XpL6cRgmh2GkDPcD3k0HkHP+suUjIz3+p4CezFc93O6WFNDKHw2hg1N0rc6zw4x
	emMw==
X-Gm-Message-State: APjAAAX/y6Gxa74hgkRl9SodcnwHyOWnZ31EoEsKE+d0TVAPBWtoWR9w
	0ab9DKzsd7vlvJG+FwIWvAyfdTMbPeY=
X-Google-Smtp-Source: APXvYqyYXqbjc+zjXY5CNFQEOmJcYgCV2G7yOoGt6qZyMHnY+ytklhuU+iCLVZap2wF1Js4tTMAO6Q==
X-Received: by 2002:a7b:cd84:: with SMTP id y4mr7795047wmj.79.1559155410184;
	Wed, 29 May 2019 11:43:30 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u5sm115441wmc.32.2019.05.29.11.43.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 May 2019 11:43:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 19:43:27 +0100
Message-Id: <20190529184328.28470-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] yocto-uninative: Update to 2.5 release
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
X-List-Received-Date: Wed, 29 May 2019 18:43:29 -0000
Content-Transfer-Encoding: 8bit

This includes libstdc++ changes from gcc 9.X.

It also switches uninative from bz2 to xz compression.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 59ccd6931ba..0bb8f7af176 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,7 +8,7 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.29"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.4/"
-UNINATIVE_CHECKSUM[aarch64] ?= "af2e2faf6cf00ff45cc1bcd5e3fb00cee7f79b3ec7c3be15917ad4ff8c154cfe"
-UNINATIVE_CHECKSUM[i686] ?= "fafacfc537a6ce2bd122bd16c146881ab5ac69bd575abf6cb68a0dd33fa70ea2"
-UNINATIVE_CHECKSUM[x86_64] ?= "06f91685b782f2ccfedf3070b3ba0fe4a5ba2f0766dad5c9d1642dccf95accd0"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.5/"
+UNINATIVE_CHECKSUM[aarch64] ?= "ca977ff95c77f983570141908d451ff7d78add2864471605af404302bb36a1fa"
+UNINATIVE_CHECKSUM[i686] ?= "7b5822891c293795faf8a4a80586b36f8cde405387524916a24f9055ea82f7ca"
+UNINATIVE_CHECKSUM[x86_64] ?= "ed0ac07c710b711925cb976685dd855fb1d442dd840d00194751c18bf480c4ed"
-- 
2.20.1



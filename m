Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 81B2077240
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 07:48:01 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 19so22753196pfo.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2017 23:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=BaFTxTBwJCKLKsnQvewqtMXa42h+uSelFiVXzs0hk8Y=;
	b=JmWlfOezHVLw/y8c8YzoNmhPrRy21TbDhD9v9ftEbXr+POFoDUh8OctIBVxjffkOgb
	OhVkCnCWmyw18xLY+X1EBwolBSeeZN2y5SFjtRh+cwKBAd6NMJmCmXfUrHR2P8uviEfJ
	kXDDSjY4MGhGBt8MXNg3u+OpRSLYuKNblXqltLYkAwVdU5M0ZVxKKOvY7Kl5d2QqGoWv
	W3F5mdk9NPWL/LJpdg5shMU6gy40RP1lBBmWm84a/iDrGbfXneSONjVLGkx1YPErHYuP
	1zMLFOvHsEX1+ZuP2QlkuxzNIBTGBX7o60czToY2tpzlgUPBy4z5+JsJy3NUs7xiKHft
	mZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=BaFTxTBwJCKLKsnQvewqtMXa42h+uSelFiVXzs0hk8Y=;
	b=P+2gDJHErtfh1K/2X7DWw0lMckdBWM6fbhQfZtXRjM3KlSPZLxifx5j4GVvYfjP8Ry
	1c3eQxdx7Mu/4rn2EAK6rQrObeCxOIYAkCaiMZMR2Yc0C58MREW/Y1szlc2BCSjVQQiF
	XFaesVUUUyjG8djwdenZy1aYflTFBxvbjoUzrhov7BtrMo6hY4tuDR3/yECVb01QwQIw
	hQUG7PRor9t2J1R0rRyHnLbb+aZJb7EbOUI0S7blwPOhwMUa7gPHWFl1wG3H1Myp/sNq
	fEqwznOkXC9wqpnJjMRAumoi44D/tQatzqhDJrSUbwcgEKQVZoXlzLKn76sEQSeloc3l
	AvCA==
X-Gm-Message-State: AIkVDXI4+77AgL0sklOcSF4OfB1s0C4Oi3vC+oikacmmCgzKWF22NVXSrpFUUWgzPTMEMQ==
X-Received: by 10.84.136.135 with SMTP id 7mr30181346pll.149.1485762482307;
	Sun, 29 Jan 2017 23:48:02 -0800 (PST)
Received: from [127.0.1.1] ([58.165.136.65]) by smtp.gmail.com with ESMTPSA id
	a25sm29724563pgd.26.2017.01.29.23.47.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Jan 2017 23:48:01 -0800 (PST)
Date: Mon, 30 Jan 2017 17:47:45 +1000
Message-Id: <20170130074745.584-2-nathan@nathanrossi.com>
In-Reply-To: <20170130074745.584-0-nathan@nathanrossi.com>
References: <20170130074745.584-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 2/4] libgcrypt.inc: Enable nativesdk
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
X-List-Received-Date: Mon, 30 Jan 2017 07:48:01 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Enable nativesdk on this recipe.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-support/libgcrypt/libgcrypt.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index 15805cd436..c8a48623b4 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -46,4 +46,4 @@ FILES_dumpsexp-dev += "${bindir}/dumpsexp"
 
 ARM_INSTRUCTION_SET = "arm"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0



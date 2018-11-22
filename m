Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id BA53C6BE39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 01:48:40 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id 101so1727792pld.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 17:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qnlEXZ9KCD0N6xr2ope4SRXbLiC3mQrwClJuLxQFkQ8=;
	b=JkMdVr1AUxmzL6bAMi54b7H2VY0BgvHLvVLEye19FEfUqjJPtPWSIkJv775CpGQvsa
	uMb096M+yfL1iDoGtEqAts2jyfM5sY+8fJi2vsxe9CHzzflhTh8s4K9yWBD8GD2oQDqA
	9vhUytQwtNX5geOkKTR4PdAGFw5Kg6diY0WpjhFxFa2cuN8Gxo4DbyZEZs/oIjmfi4RD
	F+sbtmaLvoewxxglu7EKdfdOx+dCHVL/7rQeMDzP5mpM89oKpBq7dbCtJlr3+DNzoG6H
	4PNknw7CfdzVCMvlXVbArxsbWsDHy0bjBiAg2YsTZJ0eUlsu0S5WxKhZK7ILtKiBoe/o
	5Kow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qnlEXZ9KCD0N6xr2ope4SRXbLiC3mQrwClJuLxQFkQ8=;
	b=bVgCDUe3nN0lOM+9P+UxjiUw36UR4Sh7NTozT9ZighBFVnlLxMJw+bpss0Z58UR8vm
	GOMpig3LECEDB7dAXPrXZBVE4X+G4R8ERQtYu5jQ33YPqFmGTTQ/4n7D0pFUnm0K23Of
	odpTRRBAZyzmyig8IW9wAeyqbb66Is3NRVfFlOj929f7Uy0zXkKhIpHeAINqSndE+Sec
	eN0i2k1BaAQKdiqFvfPxoysVevcuIW8p9R+CZBEqv8apHcUJNhMCc5dvzv49O3FCNTgF
	e10NNWX6YCuCNAxWmTP5Tcq+gzRU2WrsowilY50Af3XdHMMmyyNkPCjqkStGtF8+IEJL
	In5A==
X-Gm-Message-State: AA+aEWYIKQ1lxU7aRP1UFW5MtOGZBdUT5B+6nWi1T0fwygcLlQmu6OYH
	MYkVvw1QLniWIeEe5eyb+uGIORYK
X-Google-Smtp-Source: AFSGD/UMPt6YjtcAgJ835qmm/S+3wdaALglCXOE9lE4J3sA7h9h9xX+Z7uNxIwwvgekHOySAHdVsXg==
X-Received: by 2002:a63:5c22:: with SMTP id q34mr8105826pgb.417.1542851321406; 
	Wed, 21 Nov 2018 17:48:41 -0800 (PST)
Received: from ip-172-31-17-76.ap-northeast-2.compute.internal
	(ec2-52-79-234-68.ap-northeast-2.compute.amazonaws.com.
	[52.79.234.68]) by smtp.gmail.com with ESMTPSA id
	d21sm42216468pgv.37.2018.11.21.17.48.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 17:48:40 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 01:48:29 +0000
Message-Id: <20181122014831.46298-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/3] iproute2: 4.18.0 -> 4.19.0
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
X-List-Received-Date: Thu, 22 Nov 2018 01:48:40 -0000

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../iproute2/{iproute2_4.18.0.bb => iproute2_4.19.0.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_4.18.0.bb => iproute2_4.19.0.bb} (72%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.18.0.bb b/meta/recipes-connectivity/iproute2/iproute2_4.19.0.bb
similarity index 72%
rename from meta/recipes-connectivity/iproute2/iproute2_4.18.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_4.19.0.bb
index 8eed377618..6db4062d68 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_4.18.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_4.19.0.bb
@@ -6,8 +6,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-ip-Remove-unneed-header.patch \
           "
 
-SRC_URI[md5sum] = "8b8680e91390c57cab788fbf8e929479"
-SRC_URI[sha256sum] = "a9e6c70c95f513871c5e1f4e452c04fcb3c4d8a05be651bd794cd994a52daa45"
+SRC_URI[md5sum] = "67eeebacaac4515cab73dfd2fc796af3"
+SRC_URI[sha256sum] = "d9ec5ca1f47d8a85416fa26e7dc1cbf5d067640eb60e90bdc1c7e5bdc6a29984"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.17.1



Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 540E774D8C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 00:14:26 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id q22so18606502pff.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 17:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XH50gH3v5Zfcm0YQpiX+2GbtcXf2EsakvQGwlY91Gt8=;
	b=jOQKcXKOnNA1SlrsBrKoePc9D2JA6YNmkD8Pi24paKDuSMAkT6dZ+KQuQPwk4o9WKx
	XnQaLmLjwySXUi2mGqlpZ6AkQUFWgZPO4u5BVPwORz4zBdJ0GlQz+0eJuunSPbbVAzZB
	XmBsx24AuSiXYqe7sqqnc/f0BUqaCRcWO2n93RXCTAdWUzz+8VVyQq8SaWzdF/t8tuwx
	jo4/0OwJWyPLQ7cqC8sPl1nqovu+Vz4qhbOQso/OAPXro/2Y9F5ubqlTblwXDpVkKkmM
	6/W82rpYBnJvS+tv2RgS8RYXthc1CqArcB8Z5CkuvQrZZooM5hIwy/okP1YzqQqBgUYm
	54zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XH50gH3v5Zfcm0YQpiX+2GbtcXf2EsakvQGwlY91Gt8=;
	b=gXG7uw9imZ7MjtGVC1R60bdtJEDRn2EAQdOj8DxaCtkkjBzO3nvvF+jAX6VAoLU3/n
	dBc+siQMJEBC2ksoHQKNKuaTApsq4YrISl68EYmaVjHovlG0E7NQ8tZD0cskZetOdJJs
	Cj+xfbJa3jkh+kpdrWHqme4Ab53NLcVbWYI/iOBY06mjXd4TsapGihTMmFav7NZ8KRgL
	Oych7iJWhCT7hdqGdkpPy6Hxm/SnpkMW/7VSzb4Zj4NbaemT8gYERWYDkGmJzaFLLiNX
	CQLhTbTmk/vnmXkAZEPdp6O42YERA3VGy0sEckhAiIRTQ8JfheijtRh6cQctfQMPN/EY
	lHBg==
X-Gm-Message-State: ALQs6tBa/aMb/j98T11JVAfCo89MmaVUwqsK0un9+4qMZJXlMI9hYCbx
	LZCokoY9nr+xHvL1IuWJJKKAqw==
X-Google-Smtp-Source: AB8JxZpQvU7jmJWnWij9+FDhzZxinG5u1CB8L2+vB9ZJbKauiDHEEh/DemyRGBN5L4nhi1CyPrSU0g==
X-Received: by 10.98.178.208 with SMTP id z77mr28701309pfl.122.1525479267814; 
	Fri, 04 May 2018 17:14:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	o88sm36468559pfa.29.2018.05.04.17.14.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 17:14:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 17:13:58 -0700
Message-Id: <cfb68b2ab35f3046c2c9fee06ae1418e602a6616.1525478935.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525478935.git.raj.khem@gmail.com>
References: <cover.1525478935.git.raj.khem@gmail.com>
Subject: [PATCH 04/27] libunwind: Drop adding libssp to linker flags
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
X-List-Received-Date: Sat, 05 May 2018 00:14:27 -0000

This is no longer needed as gcc provided libssp
is not built

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libunwind/libunwind.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
index b9c532d3ad..36851d07ed 100644
--- a/meta/recipes-support/libunwind/libunwind.inc
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -14,8 +14,6 @@ PACKAGECONFIG[latexdocs] = "--enable-documentation, --disable-documentation, lat
 EXTRA_OECONF_arm = "--enable-debug-frame"
 EXTRA_OECONF_aarch64 = "--enable-debug-frame"
 
-SECURITY_LDFLAGS_append_libc-musl = " -lssp_nonshared -lssp"
-
 do_install_append () {
 	oe_multilib_header libunwind.h
 }
-- 
2.17.0



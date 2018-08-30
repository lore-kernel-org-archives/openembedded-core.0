Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2752D793C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 03:55:51 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id l9-v6so3250581pff.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 20:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fs938AI3aB/zXQUHYI4u8H+5IoUZF2Sd4wQGliBlr8A=;
	b=Sq81a0YZCvLy0FNN87ousk/KGhReS2Qlhnqjpim7gOwIjLOd2jY3K5ePLd7qoe+0cn
	pTsO8Orj4XBYrv5R7QBEIgljHR8+M9mpw6hCjlsTwU+G/nI8MXYzNHCUmRC8bcR2BKsK
	UfuW37g7KI4cZschAWmt95XmFRMqj+X4oZ/HD+DTmxw4OoOLknw6psC49rQh5jZkiUkE
	2+MkGAazWIr4p3wTz8pLv2kGK1JZyRMWRuybt4MonAHeZqiJOZNeMXEY/xlXbSCmA9kW
	v+H6Y6BGPXR1oZFKg1uSxwXiGi/hp4xXWQtjlUBA3HcCvPgVjxv+lnv9AzTpN4aLCshn
	4FLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fs938AI3aB/zXQUHYI4u8H+5IoUZF2Sd4wQGliBlr8A=;
	b=ftxE5QKhNb9DRTQROczUJA0twmaXq8ZFEH32Vl4WTaZM96mzrdF0C5fmhBMmwid5Cn
	hJuVX2tkwBva3RCvKf8qXTFZFxMG5hypz6SuKckc6aHJ93Y10RBRq1BleCwzr2N+5a45
	eIpLt2YoNmeT2qZ5dWdvrlyIcWmeHM+GiFiaFrBV+NhcIyJZBWBNC7JlHB7PUAZPf1XC
	MoPHEMFvMgUDIQSldi24edc4DK2dzdj2hdiDwrkxkTJmNVIkv7FTqEzDD79mU070WevJ
	A6sj4dX10X+eN/1SOd/0f9MOUhRwGlj/bujZyGK4PX3UTWFvdhiVuYOsPoEuJN8uYbQy
	97ug==
X-Gm-Message-State: APzg51D9BnCitFw8z5G1VXf0YLvXywpN7t2N04zgpKneCLOruRukwh7O
	9BBrTWPSKLkFf77c2UflKJsMvwNo
X-Google-Smtp-Source: ANB0VdYiApSNft0WUsO3h1a6hCYHkZsKhFBWFbYH37m7KOZiecJbHLSZtgWEOCNjvkcouNwJxFT3rg==
X-Received: by 2002:a63:ee15:: with SMTP id
	e21-v6mr8123122pgi.421.1535601351878; 
	Wed, 29 Aug 2018 20:55:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	77-v6sm8056381pga.40.2018.08.29.20.55.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Aug 2018 20:55:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2018 20:55:37 -0700
Message-Id: <66a226b3c7f8fddae6418b3175aa141d1c776d66.1535601148.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1535601148.git.raj.khem@gmail.com>
References: <cover.1535601148.git.raj.khem@gmail.com>
Subject: [PATCH 5/7] packagegroup-core-tools-testapps: Exclude gst-examples on riscv64
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
X-List-Received-Date: Thu, 30 Aug 2018 03:55:51 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-core-tools-testapps.bb        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index a35f15e6ce..643219852d 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -17,6 +17,9 @@ KEXECTOOLS_microblaze ?= ""
 KEXECTOOLS_nios2 ?= ""
 KEXECTOOLS_riscv64 ?= ""
 
+GSTEXAMPLES ?= "gst-examples"
+GSTEXAMPLES_riscv64 = ""
+
 X11GLTOOLS = "\
     mesa-demos \
     "
@@ -26,7 +29,7 @@ X11GLTOOLS = "\
     "
 
 X11TOOLS = "\
-    gst-examples \
+    ${GSTEXAMPLES} \
     x11perf \
     xrestop \
     xwininfo \
-- 
2.18.0



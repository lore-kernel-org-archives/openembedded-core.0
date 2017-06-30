Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8A39978247
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 08:51:18 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id g21so9517040lfk.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 01:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xNGzPlnE6ZOSnv3+9QMZdCraxIoLPYCE2gUGGHRyuqE=;
	b=JAT+Oq/xFVWA7YyZANSPvyeANWGJLY3sRPHx47CBkU5V1lyyA8OmC72fWJ0djhdf2m
	LqEgMl6g4cs5elsFcKT/saWLE3HCWoTlz5dxY1z4a9jAn1tzSdb6drYyMc5YbS4odvkp
	fWkZuwfm7tHzow6NryNwZhpAROS7psHsX2Rlxbr590pwVdno04lvn3oaYRJIVMWfNKCc
	SbOdo9tUE3aeiqxFlLFFAD33LNASUnU9ud1D9SOF958R6aHrqYhLGcU/qpx73QYhM6yG
	B00J8dv7iJ8ogEJ04tOPI0VnD+O79oZgpapWIAVdwwXvzxfWH+AcN2GIONL5zK/P/f1o
	VR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xNGzPlnE6ZOSnv3+9QMZdCraxIoLPYCE2gUGGHRyuqE=;
	b=RmNopxZnWXpZtQYf9BvNgANZbToDwkOPdjhuoMr4AXHMHBn8EQYpTtOWRW9sR96G0h
	b1mACYrMrnTOVVN+t5E+IZeIlpzwkYj47Rgvb/Zbr5RMf6X95yZFdPV2p4hMnn0j8ffg
	V81pA0p8Jux1X+oLB7w3zvTUB1pwVKLk7J+fDmztDtUoTzAUypSKUmIeWpmwtYS8cFHJ
	pKNaQP690WBEfG5nTRwb23uL/dTKzBEbYputr+pRI70/83XifabhSGWwCpHM7eUjp29a
	7hsjMpa74NcPXTYDzJAY+1uNMhFqDuBwtMJd+C2x2VKQpHR8pkQm2s6UXiNkck1fosz0
	+dwA==
X-Gm-Message-State: AKS2vOxHO3f5vccJOgytI/Tv7Qjt//CIMBi9of2NHp3EIGtELf1Lpity
	BNULjQ04LLnBmF0CJJU=
X-Received: by 10.25.196.194 with SMTP id u185mr4821763lff.88.1498812679461;
	Fri, 30 Jun 2017 01:51:19 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	f46sm1883560lfh.51.2017.06.30.01.51.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 01:51:18 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jun 2017 10:51:13 +0200
Message-Id: <20170630085114.32050-2-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170630085114.32050-1-ricardo.ribalda@gmail.com>
References: <20170630085114.32050-1-ricardo.ribalda@gmail.com>
Subject: [PATCH 2/3] libgfortran: Add missing dependency gcc-cross
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
X-List-Received-Date: Fri, 30 Jun 2017 08:51:19 -0000

Due to the fact that the recipe uses INHIBIT_DEFAULT_DEPS, we need to
manually add the cross compiler as a dependency.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-devtools/gcc/libgfortran.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index 4846decbb834..3b94c1b85b70 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -37,7 +37,7 @@ do_install () {
 }
 
 INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS = "gcc-runtime"
+DEPENDS = "gcc-runtime gcc-cross-${TARGET_ARCH}"
 
 BBCLASSEXTEND = "nativesdk"
 
-- 
2.11.0



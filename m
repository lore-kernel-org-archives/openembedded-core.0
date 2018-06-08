Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f51.google.com (mail-pl0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 88BC1770FF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 07:28:29 +0000 (UTC)
Received: by mail-pl0-f51.google.com with SMTP id n10-v6so7782679plp.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2018 00:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ur57LD8X8wyjNLKv5ad8Ykkb1F/Jw7IqtXdkqm+7Qe4=;
	b=RJCrrSIJQFk+rAtyddgjx8FiRvRL+e5Wy+zTjUyrToLReTcUD6Gm17AjAPI3W9tdNM
	UzlFocdEY7qG7NidNbGmJb0qPXKheZkMTaY97HEk7OE3tj/JSJsQeqeWpVZxeGrzY2mu
	/tZFcsvW7YezzwjhPvaFA1WmIJT6SCSLp8S/2r2Cbesya5vY7HPzjHJU3aZjq1Z3mT6W
	ouUKO0JsPF40h8gMwNPUFvT2c3iFGr16Czkmqm86viXL0xpOmrQu9eYBED3bGtrOX7u7
	TbBKkN5ovFiC1yEzOCuM8wfUqwjBSZJ0HqTlsmbweRyOwsYQf8JtMaeOE5yQ95MRAwL8
	gFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ur57LD8X8wyjNLKv5ad8Ykkb1F/Jw7IqtXdkqm+7Qe4=;
	b=BSNlFB760Ww7zLr6HHSvhmASe8HQGcUwX2nxTu2XqGZ6ZwOL9AZrZ7v3SxOzxGIJ8J
	SmISYF2iEZnLk/WcG6H78y0oDRBwIRXlhBDki2iQTFHqWJ5u3OlKyoBHGhd2u/tWOrBX
	zpqYlAlHAvD//IFke8jMsd6A5UDN/8kpTiLTRren7ElTdX1RhchyveJrj0e5L5aEl/Ey
	Xu2q9NeZnxbDX93uMVvvABDPy7aODotmB7wXyS+xoYYO0TixaeP2jMPhNSXz/FAzfpTc
	VYsS4NafMIZSVeXEGjUOhVERCHNxuBSED999KdHtR7A/VTSn7W2A0/rdQXCGyXXLQ7H7
	iXrg==
X-Gm-Message-State: APt69E1wIc3HrKBpQBpdglZ5Jjqr2pZaMqtJfCLPt0skSw6T6UvVyG4g
	b4GCtvpunhrynhPJcXYBorApbw==
X-Google-Smtp-Source: ADUXVKIA9+cUm7U4ai8TNQMaq9CAmtDm5Nt7D39EvmRgmVGnT+RhwoMinlS5BGWoDnG4AycrCwMuPQ==
X-Received: by 2002:a17:902:22a:: with SMTP id
	39-v6mr5327668plc.146.1528442910388; 
	Fri, 08 Jun 2018 00:28:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	v15-v6sm33935578pfk.12.2018.06.08.00.28.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 00:28:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jun 2018 00:28:23 -0700
Message-Id: <1e975840278577297179007b597da53dc7323d8a.1528442551.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1528442551.git.raj.khem@gmail.com>
References: <cover.1528442551.git.raj.khem@gmail.com>
Subject: [PATCH 3/7] gcc-8: Disable float128 for ppc/musl
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
X-List-Received-Date: Fri, 08 Jun 2018 07:28:29 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index aa3b53e64c..00fec0bb6e 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -46,7 +46,7 @@ def get_long_double_setting(bb, d):
     if d.getVar('TRANSLATED_TARGET_ARCH') in [ 'powerpc', 'powerpc64' ] and d.getVar('TCLIBC') in [ 'glibc' ]:
         return "--with-long-double-128"
     else:
-        return "--without-long-double-128"
+        return "--without-long-double-128 libgcc_cv_powerpc_float128=no"
     return ""
 
 def get_gcc_multiarch_setting(bb, d):
-- 
2.17.1



Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 867B97317D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:03 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id r187so5033078pfr.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=jl6eFa9DUHyb0NHxFf0kPgcEEA9qPhB5CB+aj+x0I9I=;
	b=qs3jKGfZljp6yzRVeDofhUSTmi4bo/zxRhiM6Ov7LCZhXj/YxltUw5/I/zVbHSgQdj
	Y+KWV5mzMRDIGIKXcgavPyJal2upBzOKzAQa4m3vRed+QV+2bm7OmYGori62xl7GlPay
	ttGLi+AfMvOFrYDHi62NczOWWTtGTUN7ZXEdRQ11mVQQuxavIFSjlixYyWKRI/Vg43b9
	Hssh3nOs9JfrIWjwYk7AREf5cYi6c0tzknMe7ijfhuSqj5BwlhMm0uZnlie8uyjttmei
	KcK5Uo4ouKFe6lwmDAAo9c8F+snEmEKr06zQGgNgtMyS4Jy4JqzG6ybAV39BX71AH+Cv
	ezKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=jl6eFa9DUHyb0NHxFf0kPgcEEA9qPhB5CB+aj+x0I9I=;
	b=j1WDtsgqoEJ+G1wc6GLOGzftZ//v4ljI/KCIyp/zjzjXfYcz0E75CEYvE1Izy/2usM
	5mv6iaqdgAWrflafhBxyH6PU0TLx5jVLehYR3jZgjRFAmN4dw5nprnPKDNfC7N9zfrTW
	qp2iPbWoRTfz8Bl5IsGX+IDSqzw1XR98phgKkZQ1BP5o389rXF/fUuyXphUxDXPQ4quB
	Yl6rv37JHUfVTlfc+mPz/BbqNcBnt89Q4qO7VFVzPNvJ22PRk95xR5ihMGMQRV9ZPdP1
	i8i1MBzljQk0Vrk1qSxaLubuD/bbbRRGm0WEr8AffOFe9agWA/NKCSpyz/u4osB/OVeu
	Pwig==
X-Gm-Message-State: AOPr4FUaiXXkt7MW0+44yB1M4Dj9C+UNysqdFa1HLmDKLyv0eEjZAb2+VfxUr5r/9YnTzA==
X-Received: by 10.98.10.202 with SMTP id 71mr6658035pfk.143.1462988164589;
	Wed, 11 May 2016 10:36:04 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:13 -0700
Message-Id: <cb4da2951062f943f2a814f97e3145c1cb3e560b.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 10/42] mdadm: Fix gcc 6 warnings
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
X-List-Received-Date: Wed, 11 May 2016 17:36:04 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-raid6check-Fix-if-else-indentation.patch  | 37 ++++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_3.4.bb           |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-raid6check-Fix-if-else-indentation.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-raid6check-Fix-if-else-indentation.patch b/meta/recipes-extended/mdadm/files/0001-raid6check-Fix-if-else-indentation.patch
new file mode 100644
index 0000000..0b34b84
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-raid6check-Fix-if-else-indentation.patch
@@ -0,0 +1,37 @@
+From 1b0aa1debf6fbe9923c9aac671d2894f76c32f9d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 20 Apr 2016 16:38:13 +0000
+Subject: [PATCH] raid6check: Fix if-else indentation
+
+gcc 6 warns about ambiguity due to this indentation
+| raid6check.c: In function 'manual_repair':
+| raid6check.c:267:4: error: this 'else' clause does not guard... [-Werror=misleading-indentation]
+|     else
+|     ^~~~
+| raid6check.c:269:5: note: ...this statement, but the latter is misleadingly indented as if it is guarded by the 'else'
+|      printf("Repairing D(%d) and P\n", failed_data);
+|      ^~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ raid6check.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/raid6check.c b/raid6check.c
+index ad7ffe7..409b1b6 100644
+--- a/raid6check.c
++++ b/raid6check.c
+@@ -266,7 +266,7 @@ int manual_repair(int chunk_size, int syndrome_disks,
+ 				failed_data = failed_slot2;
+ 			else
+ 				failed_data = failed_slot1;
+-				printf("Repairing D(%d) and P\n", failed_data);
++			printf("Repairing D(%d) and P\n", failed_data);
+ 			raid6_datap_recov(syndrome_disks+2, chunk_size,
+ 					  failed_data, (uint8_t**)blocks, 1);
+ 		} else {
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_3.4.bb b/meta/recipes-extended/mdadm/mdadm_3.4.bb
index 142dfdd..0e55de4 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.4.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.4.bb
@@ -19,7 +19,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-Fix-some-type-comparison-problems.patch \
            file://0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch \
            file://run-ptest \
-	  "
+           file://0001-raid6check-Fix-if-else-indentation.patch \
+           "
 SRC_URI[md5sum] = "04b8b21f637540350f8517c7e68d3c63"
 SRC_URI[sha256sum] = "27d0be4627d38a12ddcd1c1c3721d649d4e89e1093914497e22b57245cda8808"
 
-- 
2.8.2



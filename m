Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 073C26E666
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 17:08:05 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 4so15687391pge.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 09:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1WauSwO3USMEHkqu7mzu01gAi3676O8YA7myjI3vaRQ=;
	b=KklSDwEm2Q6wqPnYzN/isrwfpgPlBO2T9YY3B464NS073/Fp9BsWIM4VWqVsSPCHQ3
	bLvQkI82UWfsDjaE6KaWwBcLfFtlVWqVaawzV8jnvUEGhXcDXoNuP8q8CeLuuKAwykth
	2ysQb/+MmZntLct7tXhXWE7j0XQeihl0QBsZBztWiu3nyiDJEreH5n5N4Sdw9QyOl9Uu
	DI0F3/bVGJnzEy3cX6J9BUiGmavwjvVdNNMz6q6PWzp66cDKwNR3ez68EbX9QFiPa1Ld
	GDzYRrWp/MBLPWqyNJT50nFHPpEl1FShen1697jicitoaMGUW6KM7EqN8QQuQE3oIwtF
	/8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1WauSwO3USMEHkqu7mzu01gAi3676O8YA7myjI3vaRQ=;
	b=hlcuwBmZxdfSMytmWJYOwwN2seNcb/CxLoNhLcjS3luuwxx+CbTwzZdVak0x9r0b8d
	avcUYHUO90bg4xOrg7dD9Gv36gY5NpRH4RtiIktFexrDVe7LfyM6Wc4dh6WxIDmU2925
	Zta0wqFJoE+gGamiefJBj9mZYSLPWYWfLa5bKFVqJuSgGwR2ZdAwbarPJFwDQnhVGuIy
	Pngz+FczErRkuMjYNnzXiFDFW248erH2qV6/w69GP13IIaHE8apb3QdS6qsFS0Cxb9zW
	NmnKJRyTJFQg7FoNX4PQjrnQYmiZJbXY8kcDLHQ8JsSj5E/lz0S3tbB9vIvUnGFXm0LR
	TxjQ==
X-Gm-Message-State: AJaThX7sDitFQinDBr2goDkCvk/jMwD9tr77VeYrwlLgWx+eEIVdrmHi
	HASpGXzwPZI4S3IHFcZsJ1k=
X-Google-Smtp-Source: AGs4zMbL6SS7s5SAakDGwZlnSPY/Ml8+Hj4It7KjNmfBrXJ+KMzImrVkkleoqHRfWXjmO7E+jTjZww==
X-Received: by 10.99.112.23 with SMTP id l23mr28135723pgc.277.1511543286613;
	Fri, 24 Nov 2017 09:08:06 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:2178:58dc:281c:c010])
	by smtp.gmail.com with ESMTPSA id
	b8sm15263394pff.26.2017.11.24.09.08.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Nov 2017 09:08:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 24 Nov 2017 09:08:04 -0800
Message-Id: <1511543284-19280-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511543284-19280-1-git-send-email-akuster808@gmail.com>
References: <1511543284-19280-1-git-send-email-akuster808@gmail.com>
Cc: Thiruvadi Rajaraman <trajaraman@mvista.com>
Subject: [morty][PATCH 2/2] glibc: CVE-2017-15670
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
X-List-Received-Date: Fri, 24 Nov 2017 17:08:05 -0000

From: Thiruvadi Rajaraman <trajaraman@mvista.com>

Source: git://sourceware.org/git/glibc.git
MR: 76647
Type: Security Fix
Disposition: Backport from glibc-2.27
ChangeID: f4494e472d36748c2b3171a91640b26c638f6e0b
Description:

CVE-2017-15670: glob: Fix one-byte overflow [BZ #22320]
Affects: glibc < 2.27

Signed-off-by: Thiruvadi Rajaraman <trajaraman@mvista.com>
Reviewed-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/glibc/glibc/CVE-2017-15670.patch | 38 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.24.bb              |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-15670.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2017-15670.patch b/meta/recipes-core/glibc/glibc/CVE-2017-15670.patch
new file mode 100644
index 0000000..b606cc2
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2017-15670.patch
@@ -0,0 +1,38 @@
+commit a76376df7c07e577a9515c3faa5dbd50bda5da07
+Author: Paul Eggert <eggert@cs.ucla.edu>
+Date:   Fri Oct 20 18:41:14 2017 +0200
+
+    CVE-2017-15670: glob: Fix one-byte overflow [BZ #22320]
+    
+Upstream-Status: Backport
+
+CVE: CVE-2017-15670
+Signed-off-by: Thiruvadi Rajaraman <trajaraman@mvista.com>
+
+Index: git/ChangeLog
+===================================================================
+--- git.orig/ChangeLog	2017-11-16 18:12:32.457928327 +0530
++++ git/ChangeLog	2017-11-16 18:18:24.423642908 +0530
+@@ -1,3 +1,9 @@
++2017-10-20  Paul Eggert <eggert@cs.ucla.edu>
++
++       [BZ #22320]
++       CVE-2017-15670
++       * posix/glob.c (__glob): Fix one-byte overflow.
++
+ 2017-05-05  Florian Weimer  <fweimer@redhat.com>
+ 
+ 	[BZ #21461]
+Index: git/posix/glob.c
+===================================================================
+--- git.orig/posix/glob.c	2017-11-16 18:12:14.833843602 +0530
++++ git/posix/glob.c	2017-11-16 18:16:39.511127432 +0530
+@@ -856,7 +856,7 @@
+ 		  *p = '\0';
+ 		}
+ 	      else
+-		*((char *) mempcpy (newp, dirname + 1, end_name - dirname))
++		*((char *) mempcpy (newp, dirname + 1, end_name - dirname - 1))
+ 		  = '\0';
+ 	      user_name = newp;
+ 	    }
diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
index 966be34..6ea4585 100644
--- a/meta/recipes-core/glibc/glibc_2.24.bb
+++ b/meta/recipes-core/glibc/glibc_2.24.bb
@@ -57,6 +57,7 @@ SRC_URI += "\
            file://generate-supported.mk \
            file://0001-locale-fix-hard-coded-reference-to-gcc-E.patch \
            file://CVE-2017-8804.patch \
+           file://CVE-2017-15670.patch \
            "
 
 SRC_URI_append_class-nativesdk = "\
-- 
2.7.4



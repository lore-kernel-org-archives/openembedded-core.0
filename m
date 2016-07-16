Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8C03D6067C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jul 2016 23:04:21 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id q2so8382073pap.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jul 2016 16:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZXkk/G9G8wz9OIt6G27V2RFmNN+WwE33E7Xfppc99Y4=;
	b=WXRdt4qzzOA/tjlWyp5sK4Cnexi0UHUNxAM/nZIJXkuhUFL+WUYjPpSbhprarRyj8a
	U/ygYQy77EV9e7f+AKHLpdfUEUWxWJ4qRsoutjVLe64wkZlijvbVytEJaFL2onhBfm31
	LunNJ96Q3SVXHJ3CQqrjrZtLlcb7T+eI1aV7mR331rKYz4ROWE4nETBFUUZuMJ1M+TS2
	3A3MqH6mpAZH1fbEnYqgh507wrO7g5/XPkQoIhmxdCW7//+cYJV77gKdnLR/QeGyBay9
	W+gqLIBjWWHO6gb/rrhkfkVdI4dwzDeVF2US/x1L6U7JcxzejMAZ+csg4za35FX5yxnz
	nUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZXkk/G9G8wz9OIt6G27V2RFmNN+WwE33E7Xfppc99Y4=;
	b=P9P8ACjKUbEcbRe3Uo1wA1+5UUP/aXtjMnEnsEyI0D525t9qfv2L6X8s5BDyTPkrJ0
	uvXfgKZvDXeFuZVI/V3RvQDqzto+Rd2Ynx5zdkZV67aa1JE/uc+SNvgKOxFq5G5NNnk+
	N+xadrtOgPdmtkTz10clqU/Lh3UBi1yDSNKQq69BmNrLLrLaHjaWCYs8JY5xN9uxzmIx
	jzUsDv8Sbdq7EAel5jWUizG0hO0VmoZLSGxqqaEDfLfEHtvBGiq4WrZQ8BwkAPBC2CRt
	VBkbwP8UBvvGA9eSfTQ91F2MX6WmWTNyjiKUsrjv7xDoEo7Wv40S+lNup9XsP23CI2bX
	voag==
X-Gm-Message-State: ALyK8tLhTxv9TMMlKDDiz401jiJKLDcqoq2gs9Etz2IbeNVgKDgrocN596INaxf0FkcDDQ==
X-Received: by 10.66.138.74 with SMTP id qo10mr43468676pab.135.1468710262115; 
	Sat, 16 Jul 2016 16:04:22 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id 84sm2346368pfp.59.2016.07.16.16.04.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Jul 2016 16:04:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Sat, 16 Jul 2016 16:04:13 -0700
Message-Id: <1468710255-5030-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1468710255-5030-1-git-send-email-akuster808@gmail.com>
References: <1468710255-5030-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [master][PATCH] 3/5] bzip2: Security fix CVE-2016-3189
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
X-List-Received-Date: Sat, 16 Jul 2016 23:04:21 -0000

From: Armin Kuster <akuster@mvista.com>

Affects bzip2 <= 1.0.6
CVSS v2 Base Score: 4.3 MEDIUM

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../bzip2/bzip2-1.0.6/CVE-2016-3189.patch              | 18 ++++++++++++++++++
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb             |  4 +++-
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2016-3189.patch

diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2016-3189.patch b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2016-3189.patch
new file mode 100644
index 0000000..1d0c3a6
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2016-3189.patch
@@ -0,0 +1,18 @@
+Upstream-Status: Backport
+https://bugzilla.suse.com/attachment.cgi?id=681334
+
+CVE: CVE-2016-3189
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: bzip2-1.0.6/bzip2recover.c
+===================================================================
+--- bzip2-1.0.6.orig/bzip2recover.c
++++ bzip2-1.0.6/bzip2recover.c
+@@ -457,6 +457,7 @@ Int32 main ( Int32 argc, Char** argv )
+             bsPutUChar ( bsWr, 0x50 ); bsPutUChar ( bsWr, 0x90 );
+             bsPutUInt32 ( bsWr, blockCRC );
+             bsClose ( bsWr );
++            outFile = NULL;
+          }
+          if (wrBlock >= rbCtr) break;
+          wrBlock++;
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index f717d85..ef7bc89 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -12,7 +12,9 @@ SRC_URI = "http://www.bzip.org/${PV}/${BP}.tar.gz \
            file://fix-bunzip2-qt-returns-0-for-corrupt-archives.patch \
            file://configure.ac;subdir=${BP} \
            file://Makefile.am;subdir=${BP} \
-           file://run-ptest"
+           file://run-ptest \
+           file://CVE-2016-3189.patch \
+           "
 
 SRC_URI[md5sum] = "00b516f4704d4a7cb50a1d97e6e8e15b"
 SRC_URI[sha256sum] = "a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd"
-- 
2.3.5



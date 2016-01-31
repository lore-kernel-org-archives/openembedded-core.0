Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9F34577259
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 19:53:38 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id uo6so70789289pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 11:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=naDeNIr4kOo6JC8P7VThnP00Z4jBe9+x+fWEdZXFIj4=;
	b=i8LUHO1L4W2qYQ10wJ3BxX5GsyzcwF8yOyFvoRqVqWzNZSQV87ZwhufP9dednuTCym
	aU4fL16nlHoJDJtVGL8jsqhQ4bgfGTOAfE0Tr6UFoMxT6cLtROngQ011vI2s6463hsp9
	FhL3IZICw3CYKQaAdGSyuszpGK/KaOdvgXJpADycHkpdP9rALu+YpzsWm1KvsEGRN/vr
	EftTchtQhIXmfJQadubMvjkE2thklMBnzC6EVZEI9TpktW+lOTvcRbRxRQdRGTZqkGGm
	TUXVKNdn9OQfpJszJs1M0DQQRoMHjZ40OFg2O+wydq3xo2ZMEZV2av8DrXBwD+seYdR0
	KG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=naDeNIr4kOo6JC8P7VThnP00Z4jBe9+x+fWEdZXFIj4=;
	b=gMSVfUzUu8ddRhAXBCbyCVXZQAH1lu/h/Z8CPdubKaRH7ywQc52Z00P5UEIhH1bE1U
	v4sXT8ODD8c3ABmq0kCduYoAOs9NNyG07UvxQtpteLWKVv8wjYeaZij56haeRHr1OLjJ
	0nuclNVxmCUvtfDeAdPi4dfOALLN6PqK8lRVWn9KH5PBvL4Mo66KP6nDrP6mBFWaWeyX
	pbeT4vAJhUgn8kMNm2vZ2PvTjODplCUl6gt9BstHBohf6EnFSBhbBBvElvmlkrQyksC/
	5Uhv9IL7vCUvrHz8wIVK49dLrxAvD5ivQeDGwYM77KROCG+E92bdMQbFvI5bn24rZjgm
	JhEQ==
X-Gm-Message-State: AG10YOQDUfR/+VJOYFsM6yFvmsruQdQGXWUgtX/kHz/FuUrykgLnqX5B2nfVjanGs579Iw==
X-Received: by 10.66.180.48 with SMTP id dl16mr31990143pac.39.1454270019221;
	Sun, 31 Jan 2016 11:53:39 -0800 (PST)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	q136sm37670536pfq.66.2016.01.31.11.53.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 11:53:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Sun, 31 Jan 2016 11:53:14 -0800
Message-Id: <f4ae670a83b98d28635815b78fe89f3ab6ad562f.1454255704.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454255704.git.akuster@mvista.com>
References: <cover.1454255704.git.akuster@mvista.com>
In-Reply-To: <cover.1454255704.git.akuster@mvista.com>
References: <cover.1454255704.git.akuster@mvista.com>
Subject: [jethro-next 8/8] grub: Security fix CVE-2015-8370
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
X-List-Received-Date: Sun, 31 Jan 2016 19:53:38 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-8370 grub2: buffer overflow when checking password entered during bootup

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-bsp/grub/files/CVE-2015-8370.patch | 59 +++++++++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc                 |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2015-8370.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2015-8370.patch b/meta/recipes-bsp/grub/files/CVE-2015-8370.patch
new file mode 100644
index 0000000..78f514e
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2015-8370.patch
@@ -0,0 +1,59 @@
+From 451d80e52d851432e109771bb8febafca7a5f1f2 Mon Sep 17 00:00:00 2001
+From: Hector Marco-Gisbert <hecmargi@upv.es>
+Date: Wed, 16 Dec 2015 07:57:18 +0300
+Subject: [PATCH] Fix security issue when reading username and password
+
+This patch fixes two integer underflows at:
+  * grub-core/lib/crypto.c
+  * grub-core/normal/auth.c
+
+CVE-2015-8370
+
+Signed-off-by: Hector Marco-Gisbert <hecmargi@upv.es>
+Signed-off-by: Ismael Ripoll-Ripoll <iripoll@disca.upv.es>
+Also-By: Andrey Borzenkov <arvidjaar@gmail.com>
+
+Upstream-Status: Backport
+
+http://git.savannah.gnu.org/cgit/grub.git/commit/?id=451d80e52d851432e109771bb8febafca7a5f1f2
+
+CVE: CVE-2015-8370
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ grub-core/lib/crypto.c  | 3 ++-
+ grub-core/normal/auth.c | 7 +++++--
+ 2 files changed, 7 insertions(+), 3 deletions(-)
+
+Index: git/grub-core/lib/crypto.c
+===================================================================
+--- git.orig/grub-core/lib/crypto.c
++++ git/grub-core/lib/crypto.c
+@@ -458,7 +458,8 @@ grub_password_get (char buf[], unsigned
+ 
+       if (key == '\b')
+ 	{
+-	  cur_len--;
++	  if (cur_len)
++	    cur_len--;
+ 	  continue;
+ 	}
+ 
+Index: git/grub-core/normal/auth.c
+===================================================================
+--- git.orig/grub-core/normal/auth.c
++++ git/grub-core/normal/auth.c
+@@ -174,8 +174,11 @@ grub_username_get (char buf[], unsigned
+ 
+       if (key == '\b')
+ 	{
+-	  cur_len--;
+-	  grub_printf ("\b");
++	  if (cur_len)
++	    {
++	      cur_len--;
++	      grub_printf ("\b");
++	    }
+ 	  continue;
+ 	}
+ 
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 312771b..fe2407c 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -27,6 +27,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch \
            file://grub2-fix-initrd-size-bug.patch \
+           file://CVE-2015-8370.patch \
             "
 
 DEPENDS = "flex-native bison-native xz"
-- 
2.3.5



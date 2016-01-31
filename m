Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 96F816080F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 19:53:25 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id n128so70519113pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 11:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:in-reply-to:references:content-type:content-transfer-encoding;
	bh=Nqg7KarPY2AZg9aP22Cp1GM8v45y1iVfNEnWdEiR/UM=;
	b=e+X/nQ+Ar2S+zTULJXsf+TV3gTIrNaqGovgj/mZ+0drgB0sZ6CpVnwqAx296AcKMVz
	au+ghXNeCvqAFMANOl5bk6HduRwjfF3XtPK5sSsvKeo3DHY34HElKpe763QWJGaltiaU
	detsUpWGHcG3r/fgiFgT1oMlQIiRWDoayM65ISEYe88tjlrM5GWo4eaF8t8bcDP4khuA
	AjEqxUZWuVv+0dYoHpChTIa2/9Kj6WZWL+cJAuOxRQ3w2Z75S/hkQIKcBHa/9dZoYnER
	dba/rLp3MQf8F8qqcpS6NTX8mB1ojSESctosJ0dAE5FxMPGNWi+OSIQHikvjIkthM2V2
	UVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:in-reply-to:references:content-type
	:content-transfer-encoding;
	bh=Nqg7KarPY2AZg9aP22Cp1GM8v45y1iVfNEnWdEiR/UM=;
	b=dW+nHyUolJ4qXJfs86Qp6YWeObkIeuDSRcsTvXsQrHh6uCvtLCh/P8Ei3qy0Cvsf46
	//Ip9iHskpbBLBFquTOI3CW9TujdBvFaGFp3bQpm7ZeMUg0so9CmqOO5bzxDd4cTFoGm
	hTB7K4lphE3pbTKDAhnb8uZMlh0aCvVeM+9OfFeZBOCfyS5tzhhhZz0pfSKnnHMV77lq
	MEBglRKDzAy4LGLWcbScHvmMTPrAXAfH3zQRQ4Ddwc0H3e6+7RkPtTbPKSg5cckNdEWC
	riS99cnzKge+Wzf/fF3mDxx/GYfEJ/J/O8vriEQL2uOr7GzYNCC7p14BnVBaY5X+2BSW
	k8lw==
X-Gm-Message-State: AG10YOTRcWvB8LjMi0Zb0GXnSgLOtona1R6wJCr0QumLyLSnlHMi3VK+6xhI3UbU0Jv0kA==
X-Received: by 10.98.16.86 with SMTP id y83mr4513411pfi.45.1454270005077;
	Sun, 31 Jan 2016 11:53:25 -0800 (PST)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	q136sm37670536pfq.66.2016.01.31.11.53.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 11:53:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Sun, 31 Jan 2016 11:53:07 -0800
Message-Id: <12691e655f71ca78b603fc6009d8dccd5b0ae7bf.1454255704.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454255704.git.akuster@mvista.com>
References: <cover.1454255704.git.akuster@mvista.com>
MIME-Version: 1.0
In-Reply-To: <cover.1454255704.git.akuster@mvista.com>
References: <cover.1454255704.git.akuster@mvista.com>
Subject: [jethro-next 1/8] dpkg: Security fix CVE-2015-0860
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
X-List-Received-Date: Sun, 31 Jan 2016 19:53:26 -0000
Content-Type: text/plain; charset=a
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

CVE-2015-0860 dpkg: stack overflows and out of bounds read

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-devtools/dpkg/dpkg/CVE-2015-0860.patch | 52 ++++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.18.2.bb          |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/CVE-2015-0860.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/CVE-2015-0860.patch b/meta/recipes-devtools/dpkg/dpkg/CVE-2015-0860.patch
new file mode 100644
index 0000000..1f259d3
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/CVE-2015-0860.patch
@@ -0,0 +1,52 @@
+From f1aac7d933819569bf6f347c3c0d5a64a90bbce0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Hanno=20B=C3=B6ck?= <hanno@hboeck.de>
+Date: Thu, 19 Nov 2015 20:03:10 +0100
+Subject: [PATCH] dpkg-deb: Fix off-by-one write access on ctrllenbuf variable
+
+This affects old format .deb packages.
+
+Fixes: CVE-2015-0860
+Warned-by: afl
+Signed-off-by: Guillem Jover <guillem@debian.org>
+
+Upstream-Status: Backport
+
+https://anonscm.debian.org/cgit/dpkg/dpkg.git/commit/?h=wheezy&id=f1aac7d933819569bf6f347c3c0d5a64a90bbce0
+
+CVE: CVE-2015-0860
+
+hand merge Changelog
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ debian/changelog   | 3 +++
+ dpkg-deb/extract.c | 2 +-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+Index: dpkg-1.18.2/dpkg-deb/extract.c
+===================================================================
+--- dpkg-1.18.2.orig/dpkg-deb/extract.c
++++ dpkg-1.18.2/dpkg-deb/extract.c
+@@ -247,7 +247,7 @@ extracthalf(const char *debar, const cha
+     if (errstr)
+       ohshit(_("archive has invalid format version: %s"), errstr);
+ 
+-    r = read_line(arfd, ctrllenbuf, 1, sizeof(ctrllenbuf));
++    r = read_line(arfd, ctrllenbuf, 1, sizeof(ctrllenbuf) - 1);
+     if (r < 0)
+       read_fail(r, debar, _("archive control member size"));
+     if (sscanf(ctrllenbuf, "%jd%c%d", &ctrllennum, &nlc, &dummy) != 2 ||
+Index: dpkg-1.18.2/ChangeLog
+===================================================================
+--- dpkg-1.18.2.orig/ChangeLog
++++ dpkg-1.18.2/ChangeLog
+@@ -1,3 +1,8 @@
++[ Guillem Jover ]
++  * Fix an off-by-one write access in dpkg-deb when parsing the old format
++    .deb control member size. Thanks to Hanno Böck <hanno@hboeck.de>.
++    Fixes CVE-2015-0860.
++
+ commit 5459d330c73cdcfd1327bc93c0ebddc2da4a3a3a (HEAD -> master, tag: 1.18.2)
+ Author: Guillem Jover <guillem@debian.org>
+ Date:   Mon Aug 3 15:41:05 2015 +0200
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.18.2.bb b/meta/recipes-devtools/dpkg/dpkg_1.18.2.bb
index 4c3fa4f..2fc096d 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.18.2.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.18.2.bb
@@ -12,6 +12,7 @@ SRC_URI += "file://noman.patch \
 	    file://0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch \
 	    file://0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch \
 	    file://0005-dpkg-compiler.m4-remove-Wvla.patch \
+        file://CVE-2015-0860.patch \
            "
 
 SRC_URI[md5sum] = "63b9d869081ec49adeef6c5ff62d6576"
-- 
2.3.5



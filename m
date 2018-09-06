Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail.openembedded.org (Postfix) with ESMTP id 37E66795D8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:29:54 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id s10-v6so8445857edb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=O5W12mmTflysT0eNumfNv8Van7tWECClZ2HSXknHFbs=;
	b=TC/m2P8Grl4iXGvq77dY3KChplYc5IXXYFz1xFS+joMlzhXQSaGCAKwxRljJjAUoIQ
	oHAPz6t8hdeZhepfSOqH7sN61lod02qIqwjquiong7gKq1xde65EJ35evX7rNvakVp0b
	XRqLJI/s7N90U409duzvhMFpduWbXB/k3hDuNbV7UOj7ODqd5mYci1hbNzMIzYg1eg2I
	v7OQthg0H8aH8xke1RThBGa3RrROLxRg1jRX4LtVa/7uHO5RpJL+gtnEXblT7esD6XgP
	wElHi68yVYu3Loo0lGiZ0izN/n7WQ9S3nEujqH9UxFx8NIQ0CAbuInk/zEeynLCwlqji
	ID2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=O5W12mmTflysT0eNumfNv8Van7tWECClZ2HSXknHFbs=;
	b=B2WR8ovq9gcA7ZHdsUEfuwUR916NgAfrl0KDeQySquJvn4hA6ekbEKKxuIAYHZkskJ
	6B0ML4WwQQKkPVOWyj8cR7iiHwjRVDYC2BUjdVw6GBHZxuJ4D5VhjL3z9SxPHNpGgoyq
	D0CpMXjC+jLzU/7OSvANGRsWTDZ8BF+WXoFJ7Gx+FqDGzvXUvu5FTDWQwIYXYVetA1ZR
	AuKo0AkkxUoX7Y6ZwhiInS4m0Mex3zZoeDZ2A1XiJnVODarm9+movA65+0JIeD8NC3Uv
	hI3vrUKKTKOITRnnl9EWaNmxdtCMOxW7qpoP31zAPdIcg0sj/LjZiB8VbdlvLWzIjvLE
	SseQ==
X-Gm-Message-State: APzg51BLtb9tLxObYzIPgeaETPwKH/NHqVXB+RbfEP1NWXnLMtzaIZen
	yi3oSoAH4BlOxiYDYc9uJOiCJZdRvHo=
X-Google-Smtp-Source: ANB0VdZTjttTc+VnnfvyMrY6qljXdMPxynpgOXEji/zVpa4yq1a7eGfQRruR9PLnNMOLDst6DX+0XA==
X-Received: by 2002:a50:d6cd:: with SMTP id
	l13-v6mr2738308edj.213.1536229794885; 
	Thu, 06 Sep 2018 03:29:54 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	d3-v6sm2495886edi.80.2018.09.06.03.29.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:29:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:29:25 +0200
Message-Id: <1536229770-29600-16-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
References: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCH 16/21] dtc: update to 1.4.7
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
X-List-Received-Date: Thu, 06 Sep 2018 10:29:54 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-kernel/dtc/dtc/make_install.patch | 23 ++++++++++++++++-------
 meta/recipes-kernel/dtc/dtc_1.4.6.bb           | 10 ----------
 meta/recipes-kernel/dtc/dtc_1.4.7.bb           | 10 ++++++++++
 3 files changed, 26 insertions(+), 17 deletions(-)
 delete mode 100644 meta/recipes-kernel/dtc/dtc_1.4.6.bb
 create mode 100644 meta/recipes-kernel/dtc/dtc_1.4.7.bb

diff --git a/meta/recipes-kernel/dtc/dtc/make_install.patch b/meta/recipes-kernel/dtc/dtc/make_install.patch
index ccf17b3..ea9359e 100644
--- a/meta/recipes-kernel/dtc/dtc/make_install.patch
+++ b/meta/recipes-kernel/dtc/dtc/make_install.patch
@@ -1,17 +1,26 @@
+From e9852b9d206df1e42aa4c8afec55a0f5e099b533 Mon Sep 17 00:00:00 2001
+From: Saul Wold <sgw@linux.intel.com>
+Date: Thu, 3 Nov 2011 08:35:47 -0700
+Subject: [PATCH] dtc: Add patch to correctly install shared libraries and
+
 Upstream-Status: Inappropriate [configuration]
 
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile
-+++ git/Makefile
-@@ -168,8 +168,8 @@ install-bin: all $(SCRIPTS)
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index d8ebc4f..f5e01be 100644
+--- a/Makefile
++++ b/Makefile
+@@ -205,8 +205,8 @@ install-bin: all $(SCRIPTS)
  install-lib: all
  	@$(VECHO) INSTALL-LIB
  	$(INSTALL) -d $(DESTDIR)$(LIBDIR)
--	$(INSTALL) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
+-	$(INSTALL_LIB) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
 -	ln -sf $(notdir $(LIBFDT_lib)) $(DESTDIR)$(LIBDIR)/$(LIBFDT_soname)
 +	$(INSTALL) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)/$(LIBFDT_soname)
 +	ln -sf $(LIBFDT_soname) $(DESTDIR)$(LIBDIR)/$(notdir $(LIBFDT_lib))
  	ln -sf $(LIBFDT_soname) $(DESTDIR)$(LIBDIR)/libfdt.$(SHAREDLIB_EXT)
- 	$(INSTALL) -m 644 $(LIBFDT_archive) $(DESTDIR)$(LIBDIR)
+ 	$(INSTALL_DATA) $(LIBFDT_archive) $(DESTDIR)$(LIBDIR)
  
diff --git a/meta/recipes-kernel/dtc/dtc_1.4.6.bb b/meta/recipes-kernel/dtc/dtc_1.4.6.bb
deleted file mode 100644
index 78c5736..0000000
--- a/meta/recipes-kernel/dtc/dtc_1.4.6.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require dtc.inc
-
-LIC_FILES_CHKSUM = "file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
-		    file://libfdt/libfdt.h;beginline=3;endline=52;md5=fb360963151f8ec2d6c06b055bcbb68c"
-
-SRCREV = "e54388015af1fb4bf04d0bca99caba1074d9cc42"
-
-S = "${WORKDIR}/git"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-kernel/dtc/dtc_1.4.7.bb b/meta/recipes-kernel/dtc/dtc_1.4.7.bb
new file mode 100644
index 0000000..6ce462a
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc_1.4.7.bb
@@ -0,0 +1,10 @@
+require dtc.inc
+
+LIC_FILES_CHKSUM = "file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
+		    file://libfdt/libfdt.h;beginline=3;endline=52;md5=fb360963151f8ec2d6c06b055bcbb68c"
+
+SRCREV = "88f18909db731a627456f26d779445f84e449536"
+
+S = "${WORKDIR}/git"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4



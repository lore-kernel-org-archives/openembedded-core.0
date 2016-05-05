Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f195.google.com (mail-ig0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id D6BA16010B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 May 2016 19:31:01 +0000 (UTC)
Received: by mail-ig0-f195.google.com with SMTP id rc4so3004246igc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2016 12:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wNkMWKNvbFocluRFEPy32vzuQTPMeUT/a4fqewWZP5E=;
	b=PWf7A0dHyVr5iP/XJTEfOX1I3cFXSwcpZRsFNsXXFOlTSeSXqpKg1jMYHa8guRZljm
	CeAYQV+8BrMNvYzqupn7gpPgGLEIZWh6srR/vtf3NQb1jADLrzOfUngG/MGCM3FKo36l
	zCruY629ABTZGEOJAewqzOB0OZUMpaJAMOonEHG3ao/KzTPA4RbcpLrutpzLtRYn4bHC
	7kBNbWmIWgu15TbJyf28Md0ZmldfTiXNW15zVd+ffdj1iCJso//5jqHDsh8VJuz4287G
	fjTDOGJfGPkBjSFU+wa/eefYJ4b0fh00+huqMdZrL78s7AESVyedMcCvR7YSy2CQUotF
	GyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wNkMWKNvbFocluRFEPy32vzuQTPMeUT/a4fqewWZP5E=;
	b=U0yUg7Zj5jnYD0fMJBL3q1tqDPbcefi9IOfcJUJjsc6hAMQQ5uOwhZymJkdPq5GP/1
	VDyeSSye6SdteiT/jjzeT/JQQB1th7Ga4Jae1ychd42ra8Ut+XcwjyYzdP3t8yp5NPfZ
	YYtXs8GIPHTuRm5keoauqZtWPLW+f1NuqqdvXhF1WSbgRHpS0H1NIQdnZ7yB6JW88xZg
	+Jwo+T5QuNe5EsGBv4ljtVnUWAxcFrBmfrdrqMN33jtR9iKJLQNhqr+b78tS8jYsbs7+
	9vo+xETudrvPQJzUGrIcnbmS4HpWSeDS3zIJfG40IJdUTKjcpQI7+y8ylH6TcfOym2Md
	2nlw==
X-Gm-Message-State: AOPr4FWR9XB6LLqLUsB/2MfZA1G4HamY3p8QXn8xiRLrj1NmUbMHjr42c6PKAXU0flpalw==
X-Received: by 10.50.116.169 with SMTP id jx9mr5975562igb.21.1462476662162;
	Thu, 05 May 2016 12:31:02 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	g186sm4660680iof.27.2016.05.05.12.31.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 May 2016 12:31:00 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 May 2016 12:30:54 -0700
Message-Id: <e944ff3a1104badb75b034a6ec399805d1796c38.1462476586.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1462476586.git.chris_larson@mentor.com>
References: <cover.1462476586.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [master][PATCH 1/3] ruby: obey LDFLAGS for the link of libruby
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
X-List-Received-Date: Thu, 05 May 2016 19:31:02 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-devtools/ruby/ruby.inc                |  3 ++-
 ...0002-Obey-LDFLAGS-for-the-link-of-libruby.patch | 28 ++++++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index 313e752..fde67e9 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -20,7 +20,8 @@ DEPENDS_class-native = "openssl-native libyaml-native"
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://extmk.patch \
-"
+           file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch \
+           "
 
 inherit autotools
 
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
new file mode 100644
index 0000000..b0114ba
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Pending
+
+From 306e95a9818d39d3349075aac9609e062b0f19ce Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Thu, 5 May 2016 10:59:07 -0700
+Subject: [PATCH 2/2] Obey LDFLAGS for the link of libruby
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 7da2488..5b4aea1 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -75,7 +75,7 @@ EXTLIBS =
+ LIBS = @LIBS@ $(EXTLIBS)
+ MISSING = @LIBOBJS@ @ALLOCA@
+ LDSHARED = @LIBRUBY_LDSHARED@
+-DLDFLAGS = @LIBRUBY_DLDFLAGS@ $(XLDFLAGS) $(ARCH_FLAG)
++DLDFLAGS = @LIBRUBY_DLDFLAGS@ @LDFLAGS@ $(XLDFLAGS) $(ARCH_FLAG)
+ SOLIBS = @SOLIBS@
+ MAINLIBS = @MAINLIBS@
+ ARCHMINIOBJS = @MINIOBJS@
+-- 
+2.8.0
+
-- 
2.8.0



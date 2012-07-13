Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sphlh-0001p6-Pk
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 17:26:57 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 13 Jul 2012 08:15:38 -0700
Received: by wibhr14 with SMTP id hr14so579603wib.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 08:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=HNWZ1KfUZ08lhYkS3n7nLgQgBPd7SPipSHAz/uXpSzU=;
	b=nXwXAGgdwVf/DR2ApjziRU95ZtgOXoQQNYk1lCZ/SbMBEo1pXz91x5G5i4WcMUGgjb
	ExBBFj5dvdZTvDyzgzlLv2wAZ9QVy0umBdIERDRvG3ykQuH29KJkaZlnJubj5sGY6ZGW
	vgNI0GMDqeQYAy5QiDv3RxtAOsQJU0QqN3Z/+YMP1IHj5AXHfyCt/qaMK6RJ0KYyI/CJ
	p9XPyhQuuBsm02Hxrfq1wLXUezfMYs/QHdMsce78KCGzRKuknUssOQN46/S1jyH/0dxv
	zEHKVsjJznqiIWjUecsIqP1r8fE5vBMFDrwtHUKIxAwJnBJIR2n8w8ZI26jErwEWFvly
	2d2w==
Received: by 10.216.101.68 with SMTP id a46mr820033weg.120.1342192536300;
	Fri, 13 Jul 2012 08:15:36 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id el6sm3780926wib.8.2012.07.13.08.15.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 08:15:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jul 2012 16:15:19 +0100
Message-Id: <43cc19fa4a390ca22aa64d8fd549dae68e680a06.1342192478.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342192478.git.ross.burton@intel.com>
References: <cover.1342192478.git.ross.burton@intel.com>
In-Reply-To: <cover.1342192478.git.ross.burton@intel.com>
References: <cover.1342192478.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkcsK/Hq/wmik0aGwJxVCkdqr40BDrOC3UZUhhSSb9AirUmLJiTCvhVgd9W+AFJ3B1Z5zHW
Subject: [PATCH 2/3] web-webkit: push make whitespace fix upstream
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jul 2012 15:26:58 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/web/web-webkit/make-382.patch |   17 -----------------
 meta/recipes-sato/web/web-webkit_git.bb         |    7 +++----
 2 files changed, 3 insertions(+), 21 deletions(-)
 delete mode 100644 meta/recipes-sato/web/web-webkit/make-382.patch

diff --git a/meta/recipes-sato/web/web-webkit/make-382.patch b/meta/recipes-sato/web/web-webkit/make-382.patch
deleted file mode 100644
index 3689435..0000000
--- a/meta/recipes-sato/web/web-webkit/make-382.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Make 3.82 does not allow 8 spaces instead of a tab
-
-JL - 15/12/10
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: webkit/Makefile.am
-===================================================================
---- webkit.orig/Makefile.am
-+++ webkit/Makefile.am
-@@ -5,5 +5,5 @@ SUBDIRS = src data
- MAINTAINERCLEANFILES = aclocal.m4 compile config.guess config.sub configure depcomp install-sh ltmain.sh Makefile.in missing
- 
- snapshot:
--        $(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
-+	$(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
- 
diff --git a/meta/recipes-sato/web/web-webkit_git.bb b/meta/recipes-sato/web/web-webkit_git.bb
index 57cd545..dae7faf 100644
--- a/meta/recipes-sato/web/web-webkit_git.bb
+++ b/meta/recipes-sato/web/web-webkit_git.bb
@@ -11,13 +11,12 @@ DEPENDS = "glib-2.0 gtk+ webkit-gtk libowl"
 # To access https web pages
 RRECOMMENDS_${PN} += "glib-networking"
 
-SRCREV = "0f7019acd9db5383c732d0524c7c3a5eaec9be2b"
+SRCREV = "b0676c190f876cbdb1df202fbcec42f212374503"
 PV = "0.1+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
-           file://link-with-g++.patch \
-	   file://make-382.patch"
+           file://link-with-g++.patch"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.10




Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TjWrk-0001BB-Kl
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 16:08:22 +0100
Received: from mail-bk0-f69.google.com ([209.85.214.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 14 Dec 2012 06:53:15 -0800
Received: by mail-bk0-f69.google.com with SMTP id jg9so2422927bkc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 06:53:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=9nBB68KWFCS/4GUUlGO/ERvrGzUCrFss/e7Gw0xOI5s=;
	b=BPPXfayN0U1v4RtWllAm0P3+nz5CTyFMNm4ldtHEvlugO1eVHG+LucLXb3FOhJHRdf
	0QueX9V8QiWIHNVeh4RaH0TX35EU4D5kRrUxxA7VnZTPj2rCZuUUs7KK7JUWJ50SvEjm
	hXQ4zOtHDH8CebobZSrXj2LopOhW9AjBpqCpM2BqxFN6RdUHfiBUGkrra4tAt0GdPsXZ
	LGnQMN/ZnpzAxIgGgkZ5ajLWuQjA9beTiI0tUT20DzFRcqc/YoUVpUxzgcP71Ay0JCp/
	zDTi/jZLS/Wk0w+XO0b2r0zgNeNS+0JxDv7CD8qfsgp/x1YG9Pko+yWNyq3NZ2dUSCEU
	/VMg==
Received: by 10.180.103.106 with SMTP id fv10mr3099095wib.19.1355496792956;
	Fri, 14 Dec 2012 06:53:12 -0800 (PST)
Received: by 10.180.103.106 with SMTP id fv10mr3099074wib.19.1355496792724;
	Fri, 14 Dec 2012 06:53:12 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm3sm12612555wib.9.2012.12.14.06.53.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 06:53:11 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2012 14:51:19 +0000
Message-Id: <1355496684-1498-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1355496684-1498-1-git-send-email-ross.burton@intel.com>
References: <1355496684-1498-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnO5laErVHUY/qMf4WaY8TyqDKib265Z4EwffIBI5yk1hXu/osChUZhkFNqgQXrV7Rw+GcrChPdLN4FjGryUV5xhoy82j7/6h+DMiY8E5+qadtEt7endKoBwAJ8DB9egVN8WXr/IM/RO5019Lesbh6DnhylwRbzp7BLLpeVD0Yp2Pqq/JWEwoNODRfhtxPANUmb3IJh
Subject: [PATCH 4/9] ossp-uuid: fix out-of-tree builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2012 15:08:31 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../ossp-uuid/ossp-uuid/install-pc.patch            |   19 +++++++++++++++++++
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb  |   13 ++++++-------
 2 files changed, 25 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/install-pc.patch

diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid/install-pc.patch b/meta/recipes-devtools/ossp-uuid/ossp-uuid/install-pc.patch
new file mode 100644
index 0000000..04222cb
--- /dev/null
+++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid/install-pc.patch
@@ -0,0 +1,19 @@
+uuid.pc is generated at build time so should be installed from the current
+directory, and not $S.
+
+Upstream-Status: Pending [should be submitted]
+Signed-Off-By: Ross Burton <ross.burton@intel.com>
+
+Index: uuid-1.6.2/Makefile.in
+===================================================================
+--- uuid-1.6.2.orig/Makefile.in	2012-11-13 16:58:28.624156000 +0000
++++ uuid-1.6.2/Makefile.in	2012-11-13 17:05:24.224158670 +0000
+@@ -232,7 +232,7 @@
+ 	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(mandir)/man1
+ 	$(SHTOOL) install -c -m 755 uuid-config $(DESTDIR)$(bindir)/
+ 	$(SHTOOL) install -c -m 644 $(S)/uuid-config.1 $(DESTDIR)$(mandir)/man1/
+-	$(SHTOOL) install -c -m 644 $(S)/uuid.pc $(DESTDIR)$(libdir)/pkgconfig/
++	$(SHTOOL) install -c -m 644 uuid.pc $(DESTDIR)$(libdir)/pkgconfig/
+ 	$(SHTOOL) install -c -m 644 uuid.h $(DESTDIR)$(includedir)/
+ 	-@if [ ".$(WITH_DCE)" = .yes ]; then \
+ 	    echo "$(SHTOOL) install -c -m 644 $(S)/uuid_dce.h $(DESTDIR)$(includedir)/"; \
diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
index 7de0a58..b6304f0 100644
--- a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
+++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
@@ -15,7 +15,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://README;beginline=30;endline=55;md5=b394fadb039bbfca6ad9d9d769ee960e \
 	   file://uuid_md5.c;beginline=1;endline=28;md5=9c1f4b2218546deae24c91be1dcf00dd"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.ossp.org/pkg/lib/uuid/uuid-1.6.2.tar.gz \
 	   file://0001-Change-library-name.patch \
@@ -24,6 +24,7 @@ SRC_URI = "ftp://ftp.ossp.org/pkg/lib/uuid/uuid-1.6.2.tar.gz \
 	   file://0004-fix-data-uuid-from-string.patch \
 	   file://uuid-libtool.patch \
 	   file://uuid-nostrip.patch \
+           file://install-pc.patch \
 	  "
 SRC_URI[md5sum] = "5db0d43a9022a6ebbbc25337ae28942f"
 SRC_URI[sha256sum] = "11a615225baa5f8bb686824423f50e4427acd3f70d394765bdff32801f0fd5b0"
@@ -36,14 +37,12 @@ EXTRA_OECONF = "--without-dce --without-cxx --without-perl --without-perl-compat
 EXTRA_OECONF = "--includedir=${includedir}/ossp"
 
 do_configure_prepend() {
-  # This package has a completely custom aclocal.m4
-  # so we need to back it up and make it usable...
-  if [ ! -e m4/ossp.m4 ]; then
-    mkdir m4
-    mv aclocal.m4 m4/ossp.m4
+  # This package has a completely custom aclocal.m4, which should be acinclude.m4.
+  if [ ! -e ${S}/acinclude.m4 ]; then
+    mv ${S}/aclocal.m4 ${S}/acinclude.m4
   fi
 
-  rm -f libtool.m4
+  rm -f ${S}/libtool.m4
 }
 
 do_install_append() {
-- 
1.7.10




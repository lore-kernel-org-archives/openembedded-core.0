Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrAig-0002Fr-4s
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:33:54 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 17 Jul 2012 09:22:33 -0700
Received: by wibhr14 with SMTP id hr14so478390wib.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 09:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=HNWZ1KfUZ08lhYkS3n7nLgQgBPd7SPipSHAz/uXpSzU=;
	b=aEf+fqKmk//JAeVI7jbuRNiD9UfU4qM+KJezVrrXCAP3NC5B5lK15tNe1pNyn13mv9
	Y/7XVDVGf56MTRCW/mZVILKtfGA+CQiwXSd4OIPRy7RaM1Zo5Xufr4sAejI2Wpuf1T98
	FUWzIurAb72vyG+s+TILlwuWrydct6uc9H6gzdlFn8w3+Ji7BwqV8hneks98iF6/p2So
	Rz+4gE2SDT+nAsYwTbjoDn954pfFGqNNzP7y8+Pi7qir4C1KZiv4IHVa7zEKeO82rttf
	G8X1E5RTRfo1M863WDK5IXNg0J6RYBi+cy2KE3jaqvtFTMKmVWqnKRN3N4csjUnYJaCL
	nZuA==
Received: by 10.180.81.165 with SMTP id b5mr5508974wiy.17.1342542151473;
	Tue, 17 Jul 2012 09:22:31 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm27732790wib.10.2012.07.17.09.22.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 09:22:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 17:22:09 +0100
Message-Id: <6343e5717bfa734d8bfc9308d075a26e5f587468.1342542040.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342542040.git.ross.burton@intel.com>
References: <cover.1342542040.git.ross.burton@intel.com>
In-Reply-To: <cover.1342542040.git.ross.burton@intel.com>
References: <cover.1342542040.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmHnfTxjK+xPQ2uEjYFS1ciQqJd28u4+tDg8aniMOJIjmVlDKn1LoUIGD2mFQNcTnV0/4er
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
X-List-Received-Date: Tue, 17 Jul 2012 16:33:54 -0000

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




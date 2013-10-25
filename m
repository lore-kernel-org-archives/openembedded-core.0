Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6F31A6D404
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2013 07:39:27 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id o14so435057lbi.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2013 00:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=nmgjqXREtrtt3AsXq+XvMCXaptGDfwWtU+5VP+cApb8=;
	b=ojcVz14Rj/nS5uo5HVPy3Ut1gEE/flyz7Kvi4R9RypkeYwiDSz3ZKOgwoNQmzsqNjD
	vVhTBB21df7M6W7bOag8sAxRPa4FX8pFrbb4B0CpdCwMcQAcg+INJYE0cB/N8PIgDZZH
	O0/+jqG5tG18rEAs6c8QdKWRdI+yRqLXqt6mY7YH136wTR0NG8gPN6UUw32wYb/aNESM
	no5LlzkGiO4hKwejQjfb6tiNH6LT9eV1TMjMLZm4+PJlPPGQlnonm+jX6ZOMuyNQ2xJ6
	uqq+R2bmWKcRNbA3AYDYlWyVr+KtcFN5qCquHEBHOK6epwQUfYY+zVL8GjT+MbFNAmfC
	2WGA==
X-Received: by 10.152.26.201 with SMTP id n9mr228678lag.52.1382686768815;
	Fri, 25 Oct 2013 00:39:28 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id u18sm1617498lbp.4.2013.10.25.00.39.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 25 Oct 2013 00:39:27 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VZbzR-000845-Og; Fri, 25 Oct 2013 10:39:25 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2013 10:39:24 +0300
Message-Id: <6ea9e9fe207b9c3b84a4450268ea289246b83055.1382686685.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <b4d752157bb874d686fb25ae43e4dc499596c22c.1382686685.git.cazfi74@gmail.com>
References: <b4d752157bb874d686fb25ae43e4dc499596c22c.1382686685.git.cazfi74@gmail.com>
In-Reply-To: <cover.1382686685.git.cazfi74@gmail.com>
References: <cover.1382686685.git.cazfi74@gmail.com>
Subject: [PATCH 4/4] libfm: allow build with automake-1.14
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
X-List-Received-Date: Fri, 25 Oct 2013 07:39:28 -0000

Do not consider automake warnings about future incompatibility
errors.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../libfm/libfm-1.1.2.2/ignore_automake_warnings.patch     | 14 ++++++++++++++
 meta/recipes-support/libfm/libfm_1.1.2.2.bb                |  1 +
 2 files changed, 15 insertions(+)
 create mode 100644 meta/recipes-support/libfm/libfm-1.1.2.2/ignore_automake_warnings.patch

diff --git a/meta/recipes-support/libfm/libfm-1.1.2.2/ignore_automake_warnings.patch b/meta/recipes-support/libfm/libfm-1.1.2.2/ignore_automake_warnings.patch
new file mode 100644
index 0000000..58a2f09
--- /dev/null
+++ b/meta/recipes-support/libfm/libfm-1.1.2.2/ignore_automake_warnings.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd libfm-1.1.2.2/configure.ac libfm-1.1.2.2/configure.ac
+--- libfm-1.1.2.2/configure.ac	2013-08-22 23:16:09.000000000 +0300
++++ libfm-1.1.2.2/configure.ac	2013-10-25 01:35:18.110323079 +0300
+@@ -3,7 +3,7 @@
+
+ AC_PREREQ([2.63])
+ AC_INIT([libfm], [1.1.2.2], [http://pcmanfm.sourceforge.net/])
+-AM_INIT_AUTOMAKE([-Wall -Werror foreign])
++AM_INIT_AUTOMAKE([-Wall foreign])
+ AC_CONFIG_MACRO_DIR(m4)
+ AC_CONFIG_HEADERS([config.h])
diff --git a/meta/recipes-support/libfm/libfm_1.1.2.2.bb b/meta/recipes-support/libfm/libfm_1.1.2.2.bb
index 1146d16..8460223 100644
--- a/meta/recipes-support/libfm/libfm_1.1.2.2.bb
+++ b/meta/recipes-support/libfm/libfm_1.1.2.2.bb
@@ -12,6 +12,7 @@ DEPENDS = "glib-2.0 pango gtk+ menu-cache intltool-native libexif"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.gz \
            file://fix-make-parallelism-issue.patch \
+           file://ignore_automake_warnings.patch \
            "
 
 SRC_URI[md5sum] = "ea3d09b23ef4c37cb84ae57ea16b8f08"
-- 
1.8.4.rc3



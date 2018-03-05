Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8654378A8C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:20:54 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id t6so17111791wmt.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=x9u7zZmUOhVuaWNS6cNQosqJd9ycX958uOVgDziWFew=;
	b=tkbpJSLDwwIMOoYZNjGSd9dESFPtO2wVRjZVN4ojtp4TiYEm9yvakQOZiS3qn24dbs
	Oww8Mg1cHsfwHkuTVg+WORRk1UNj3mT5rj11AdqQcHoB871WBArfgXvq4rkTrdesQhHT
	oUzKr44Zt88Rm7hHnJ4z2f20VV6qFvVbXhE3nlWCBEHEMyWRm+WTQ+IvdxN0VuardYpH
	EBJK8FAkeRfLQ0APOBConjWda1NJ0HUMJQxPnqV8i5fSJJlwIVvVHq+KbG/FwpE8ojr1
	VF6uGBlCRNB71PvajdPxBtUTaiajZAOmID1s+i6apT4ObrlfQ6tu++1GnoYuKhtNaZQF
	RkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=x9u7zZmUOhVuaWNS6cNQosqJd9ycX958uOVgDziWFew=;
	b=QnLWCrIFZbBKye6hRDRy6RNKrhC6XR3uSLMgjdSGCUsgpVd1wqEBNXSdXEG4nXijFW
	kqnBX1gDn4p1stBtMwR5yRUjRVrt8iLS8krIRD2mB25vUPpx+7PzQlzEdLaBMppb6WNS
	b+EHigSJnpsTCU9Chx7EdeK0mDjCU6YP2DTq1k+rWeRDUmC97WlHsJ8ja2988TqaO/hD
	8lIaVyydSlUGsxWros74lWtfxFJrRWKDG+cCRf7By9HSvrhMR4FSJylq5cgyvCWvdJ6M
	nTQYPomU4tS13mGChBBeBp3Z6kiEtWJmzuejl4AuHdQcuZg/TlVHB5MIEvp4ZVdAK+KI
	ezYQ==
X-Gm-Message-State: AElRT7GeM1O7n8L5/eduAQNGgiuyNnUrU/VBMCznU6nDXjlzr4TwiH/H
	SZ7c9bxJph58Q1VYPpMz0jFmh+cC
X-Google-Smtp-Source: AG47ELvnZUmtLePzbczcmC+wMNiME3aGVQADXnkooaGlrI/1aurOWo3EpmJ8eZEnonX0nCwUJQ1x7w==
X-Received: by 10.28.111.198 with SMTP id c67mr8792794wmi.83.1520270454979;
	Mon, 05 Mar 2018 09:20:54 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.20.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:20:54 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:21 +0000
Message-Id: <20180305172046.21729-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 04/29] gtk+: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:20:54 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+/hardcoded_libtool.patch | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+/hardcoded_libtool.patch b/meta/recipes-gnome/gtk+/gtk+/hardcoded_libtool.patch
index 1ae728e70d6..9eb7f6bf5c7 100644
--- a/meta/recipes-gnome/gtk+/gtk+/hardcoded_libtool.patch
+++ b/meta/recipes-gnome/gtk+/gtk+/hardcoded_libtool.patch
@@ -3,19 +3,20 @@ Upstream-Status: Inappropriate [embedded specific]
 Updated to apply to gtk+-2.24.15
 
 Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd gtk+-2.24.15/configure.ac gtk+-2.24.15/configure.ac
---- gtk+-2.24.15/configure.ac	2013-01-12 20:52:54.000000000 +0200
-+++ gtk+-2.24.15/configure.ac	2013-02-12 21:33:30.689925967 +0200
-@@ -415,7 +415,7 @@
+Index: gtk+-2.24.31/configure.ac
+===================================================================
+--- gtk+-2.24.31.orig/configure.ac
++++ gtk+-2.24.31/configure.ac
+@@ -415,7 +415,7 @@ AC_MSG_CHECKING([Whether to write depend
  case $enable_explicit_deps in
    auto)
      export SED
 -    deplibs_check_method=`(./libtool --config; echo 'eval echo \"$deplibs_check_method\"') | sh`
 +    deplibs_check_method=`(./$host_alias-libtool --config; echo 'eval echo \"$deplibs_check_method\"') | sh`
      if test "x$deplibs_check_method" '!=' xpass_all || test "x$enable_static" = xyes ; then
-       enable_explicit_deps=yes
+       enable_explicit_deps=yes  
      else
-@@ -774,7 +774,7 @@
+@@ -772,7 +772,7 @@ else
      dnl Now we check to see if our libtool supports shared lib deps
      dnl (in a rather ugly way even)
      if $dynworks; then
@@ -24,7 +25,7 @@ diff -Nurd gtk+-2.24.15/configure.ac gtk+-2.24.15/configure.ac
          module_deplibs_check=`$module_libtool_config | \
              grep '^[[a-z_]]*check[[a-z_]]*_method=[['\''"]]' | \
              sed 's/.*[['\''"]]\(.*\)[['\''"]]$/\1/'`
-@@ -1574,7 +1574,7 @@
+@@ -1579,7 +1579,7 @@ fi
  # We are using gmodule-no-export now, but I'm leaving the stripping
  # code in place for now, since pango and atk still require gmodule.
  export SED
-- 
2.11.0



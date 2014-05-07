Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2FA7365EC9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 16:05:42 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id l18so1197302wgh.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 May 2014 09:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=x4mf0vtBp7psU1KIKw6tR3X8AbzZPMUbQsoLIw32YL8=;
	b=eQYafwXBuFusG17iXAbd7hk3L3Y9iLUpJ/izFFL6cogvIhBNqIWisFjm/UbG5kF5Jt
	Gqzh4WyRwqUYLAwr1jRvhT9+/ufsdZcXns2Gf3fh/x2rR7w+idFSCnZbG9CaOyJZ9Wyn
	bPzIrVtLjL6t00vSgHymaPXJmublWP2Cera3cnw/jOCrOyc61HAXcya4llLNLhPsg/0i
	5XkogQGwpnfCqO5vexSFyYBZayYWGz7orsNPkpC4VAknlAe3/1HXQUZb7ib2XCATlQ1C
	9XLHR0N4txIw8gXKvxSW53K/1Bx8PtcSO1gdCofqL01WPV47Lic4eFssMO+RUt4CwTV6
	u40A==
X-Gm-Message-State: ALoCoQnkvfMhfCMHa/VG7IYifWzvvmQB2sqc31/0cQcjm8JGFpfYTPx/8BFVmbBkjyEAGS96ts28
X-Received: by 10.194.48.100 with SMTP id k4mr14385431wjn.49.1399478742722;
	Wed, 07 May 2014 09:05:42 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	cd10sm32480474wib.0.2014.05.07.09.05.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 May 2014 09:05:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 May 2014 17:05:31 +0100
Message-Id: <1399478735-27819-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/5] librsvg: upgrade to 2.40.2
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
X-List-Received-Date: Wed, 07 May 2014 16:05:46 -0000

Also add Upstream-Status to gtk-option.patch

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/librsvg/librsvg/gtk-option.patch                |    3 +++
 .../recipes-gnome/librsvg/{librsvg_2.40.1.bb => librsvg_2.40.2.bb} |    4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.1.bb => librsvg_2.40.2.bb} (92%)

diff --git a/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch b/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch
index 9185041..d44bdd3 100644
--- a/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch
+++ b/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch
@@ -1,3 +1,6 @@
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=712693]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
 From 18917f7fd3160afe06019f4b6234aeb78a3fdb4e Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 19 Nov 2013 16:00:29 +0000
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb
similarity index 92%
rename from meta/recipes-gnome/librsvg/librsvg_2.40.1.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.40.2.bb
index 7b97df5..34d8ca1 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb
@@ -17,8 +17,8 @@ GNOME_COMPRESS_TYPE = "xz"
 SRC_URI += "file://gtk-option.patch \
             file://vapigen.m4"
 
-SRC_URI[archive.md5sum] = "a31eb5d66c3fe94d888a6b17a287ea42"
-SRC_URI[archive.sha256sum] = "8813b4fe776d5e7acbce28bacbaed30ccb0cec3734eb3632c711a16ebe2961d7"
+SRC_URI[archive.md5sum] = "acdecdb9f08f3bf662a68bf7dafb8b82"
+SRC_URI[archive.sha256sum] = "48049b643294636df7de1a4b997414d699666f5dc44776945c218a257d2a291c"
 
 EXTRA_OECONF = "--disable-introspection --disable-vala"
 
-- 
1.7.10.4



Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f42.google.com (mail-pl0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4231878830
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 May 2018 00:02:09 +0000 (UTC)
Received: by mail-pl0-f42.google.com with SMTP id 59-v6so4098591plc.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 17:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=F33tvVd7jOS9o++B8pTSjE2NsczDJ61LsaJrYSxkWXI=;
	b=RoGqMoBKbrgD9g3IdxvpvVS9814CQGZhJ9g5AlISEqSsvZs9zoCA3sceTGaJ6HjL0A
	Jc7LQBN0RBRuDZKu1QtDYUjGfohxYGmYzXPA9DPX3OeQqyOkqB2uziHsMqQZOPozvOTd
	O3QSHcTsDbKdlWV1RR7oKe6+YL+uHD2tjfhpwCGIwL5ybJR9c/5CpYeGGA0c24RR1cEM
	LGFq4HXMW24H7b5i3RVWKp68WPxFTBA4O7WeYrZNqL5pyUzJh6rlBs/10KJ+YR64tjKz
	RZQQr63ZRUdspclB8kh3874ZR79wtPpEZQ9nfez0AqKtMuSg2wSn7219MP1h1cTk0XUy
	bMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=F33tvVd7jOS9o++B8pTSjE2NsczDJ61LsaJrYSxkWXI=;
	b=nBJdZZMeJFszmXnNs+fPY758J2pjJ4eYzVbUJGoQ6Bnc5BkFt6Y5yE4NyJmlEtvUH9
	muLriYpGnf6/7FBbcXMn4EfS4FQ+4U8RvmvuL9bLmMLsrte9+HOYaJ5x8iz6cEKEjqfF
	6biLGVVodV2VytlIl1v6FnQT0go+QaUhAzIcNGRyCznvPUeP5/TOzOeo+dcDRkgnykbO
	WBY/o8vSntVSKA6wiYGAfMvERgHRxcueaVrvWmcGseFZ2c81894PbyFeYqbkeC0Sp1B5
	8C7rVhcbFBQwtI35ij3Zcl7sADLKiQIi6M4kK5hLwo+nSvH1uE30bIaMKUu5uuYjWrA/
	Y1tA==
X-Gm-Message-State: ALKqPwciLhJC718Vsi68fnmgf+FxVreLUmigx/7FjN+yonJw4WeG7Bf8
	rI1DGt2Ox8qCFQh3dL5yBDWIeg==
X-Google-Smtp-Source: AB8JxZqsVzmhDFHq22BlNxHaF+zMoixOFWDoHWb831Xi9Ak0NBQ34aX7iiARlXL/nkfgbb5TGF4qyw==
X-Received: by 2002:a17:902:b08f:: with SMTP id
	p15-v6mr187071plr.36.1526083330927; 
	Fri, 11 May 2018 17:02:10 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	g20-v6sm7609805pfi.163.2018.05.11.17.02.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 May 2018 17:02:10 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 17:02:04 -0700
Message-Id: <1526083324-13743-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] default-distrovars.inc: drop obsolete LGPLv2_WHITELIST_GPL-3.0
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
X-List-Received-Date: Sat, 12 May 2018 00:02:10 -0000

There doesn't seem to be a clear reason to have two separate
variables to hold whitelisted GPLv3 recipes. Both variables are
treated the same, so adding a recipe to LGPLv2_WHITELIST_GPL-3.0 is
already equivalent to adding it to WHITELIST_GPL-3.0.

Anyone needing to whitelist a GPLv3 recipe should now just use
WHITELIST_GPL-3.0.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/base.bbclass                       | 25 ++++++++++++-------------
 meta/classes/multilib.bbclass                   | 12 +++++-------
 meta/conf/distro/include/default-distrovars.inc |  1 -
 3 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index bd0d6e3..68626d5 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -529,19 +529,18 @@ python () {
             incompatwl = []
             for lic in bad_licenses:
                 spdx_license = return_spdx(d, lic)
-                for w in ["LGPLv2_WHITELIST_", "WHITELIST_"]:
-                    whitelist.extend((d.getVar(w + lic) or "").split())
-                    if spdx_license:
-                        whitelist.extend((d.getVar(w + spdx_license) or "").split())
-                    '''
-                    We need to track what we are whitelisting and why. If pn is
-                    incompatible we need to be able to note that the image that
-                    is created may infact contain incompatible licenses despite
-                    INCOMPATIBLE_LICENSE being set.
-                    '''
-                    incompatwl.extend((d.getVar(w + lic) or "").split())
-                    if spdx_license:
-                        incompatwl.extend((d.getVar(w + spdx_license) or "").split())
+                whitelist.extend((d.getVar("WHITELIST_" + lic) or "").split())
+                if spdx_license:
+                    whitelist.extend((d.getVar("WHITELIST_" + spdx_license) or "").split())
+                '''
+                We need to track what we are whitelisting and why. If pn is
+                incompatible we need to be able to note that the image that
+                is created may infact contain incompatible licenses despite
+                INCOMPATIBLE_LICENSE being set.
+                '''
+                incompatwl.extend((d.getVar("WHITELIST_" + lic) or "").split())
+                if spdx_license:
+                    incompatwl.extend((d.getVar("WHITELIST_" + spdx_license) or "").split())
 
             if not pn in whitelist:
                 pkgs = d.getVar('PACKAGES').split()
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 816f54e..4636c20 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -49,7 +49,6 @@ python multilib_virtclass_handler () {
     if bb.data.inherits_class('allarch', e.data) and not bb.data.inherits_class('packagegroup', e.data):
         raise bb.parse.SkipPackage("Don't extend allarch recipes which are not packagegroups")
 
-
     # Expand this since this won't work correctly once we set a multilib into place
     e.data.setVar("ALL_MULTILIB_PACKAGE_ARCHS", e.data.getVar("ALL_MULTILIB_PACKAGE_ARCHS"))
  
@@ -65,12 +64,11 @@ python multilib_virtclass_handler () {
     e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
     e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
 
-    # Expand the WHITELISTs with multilib prefix
-    for whitelist in ["WHITELIST_GPL-3.0", "LGPLv2_WHITELIST_GPL-3.0"]:
-        pkgs = e.data.getVar(whitelist)
-        for pkg in pkgs.split():
-            pkgs += " " + variant + "-" + pkg
-        e.data.setVar(whitelist, pkgs)
+    # Expand WHITELIST_GPL-3.0 with multilib prefix
+    pkgs = e.data.getVar("WHITELIST_GPL-3.0")
+    for pkg in pkgs.split():
+        pkgs += " " + variant + "-" + pkg
+    e.data.setVar("WHITELIST_GPL-3.0", pkgs)
 
     # DEFAULTTUNE can change TARGET_ARCH override so expand this now before update_data
     newtune = e.data.getVar("DEFAULTTUNE_" + "virtclass-multilib-" + variant, False)
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 76d09af..2f46e13 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -24,7 +24,6 @@ DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
 IMAGE_FEATURES ?= ""
 
 WHITELIST_GPL-3.0 ?= ""
-LGPLv2_WHITELIST_GPL-3.0 ?= ""
 
 COMMERCIAL_AUDIO_PLUGINS ?= ""
 # COMMERCIAL_AUDIO_PLUGINS ?= "gst-plugins-ugly-mad gst-plugins-ugly-mpegaudioparse"
-- 
1.9.1



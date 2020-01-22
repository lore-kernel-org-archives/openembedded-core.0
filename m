Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 388387FD7A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 17:40:01 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y17so8256860wrh.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 09:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GVMjwk8KrbhUhzkUijbLLNG/NtQQ7AD9k+T6Ts+MA58=;
	b=LQtxq8B+38i2VS+zeEHtip3RXDNlxbe4GY9smdsRnk/XDF4PRMVO55kaG6B2xGXdBv
	SSrxdfMJnx6vhbw0WLCCfRbSw9IikvBnhrCA8iYmYtuegXEQENue4Kv3zNHh2xOkjQlM
	dIuIfCBcgti+YHfYQEgIDl+AHtf8UW6vJ7SPHVs+nE5iJ6en2RPTR9mHN8UIz62QvRRO
	vNFHpDJkBoVuH9+NHNOmfWjikOzxG8ynRnjbE33ghmv2uvp2CLgOiUd0O9QHICdZ3sot
	cNB0bTjrfe6JlAtD9ABmDJXdmMkMF5zL77iQlrjQYPxKixd07np1yn0+Aq0e9IcwXXYY
	nDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GVMjwk8KrbhUhzkUijbLLNG/NtQQ7AD9k+T6Ts+MA58=;
	b=rjsVRWvkyOdoDEDL/j2CNFiy1TzHsLy7wf2+UP50TK9VGZdi97iFywJZmnuglxZ3qm
	vjkPkQjCvvf5kpa6oncwW0bBZKL9ivrrcAXCxiE0aTRyJiFnKFZYyrC7YENMAt0+uVGe
	wQtox9Jk3DPR+T8YU5ATclr18N4GmQafQhUkGBgwuWG982ItfFupyDzfMp7bPambl7qr
	ejYCrqYZ05fXCL3fxC600rbmOeYSKLe7IXop+pdCiIPc9cpGtZba0PgnAlCt0hfj3E4K
	xPYlBlCF9pjsHkvuTWY5mxuLUCRRTN+0Lyy+cFnhJ4Jr+WWhRjorOr+qUbTC31GQo+32
	qamw==
X-Gm-Message-State: APjAAAVOcAoJM0AWoGMOkz9Sx+6GzhoUNcNcxuy62lfmzRL9m20G4jXC
	rNgYGUisz5tQd/wAIcX8/9tLoOQWdbM=
X-Google-Smtp-Source: APXvYqzQ4/vJJNBc8aSh//NoVkzZKMrEZJ8GQp6BW1W/HjPDU/1gaO8lxqJZqNHt0i7/CxsPlg30/A==
X-Received: by 2002:a5d:5487:: with SMTP id h7mr12353986wrv.18.1579714801583; 
	Wed, 22 Jan 2020 09:40:01 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b16sm4543371wmj.39.2020.01.22.09.39.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 09:40:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2020 17:39:58 +0000
Message-Id: <20200122173958.14881-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libx11: squash whitespace in generated files
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
X-List-Received-Date: Wed, 22 Jan 2020 17:40:01 -0000
Content-Transfer-Encoding: 8bit

The locale data in the recipe is generated using cpp, which results in
differing amounts of whitespace depending on what compiler is used.
This means that the files may differ in just whitespace, which is
sufficient for RPM's multilib code to consider them different and not
allow lib32-libx11-locale and lib64-libx11-locale to be installed at the
same time.

[ YOCTO #13647 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-lib/files/libx11-whitespace.patch    | 56 +++++++++++++++++++
 .../xorg-lib/libx11-compose-data_1.6.8.bb     |  3 +-
 .../recipes-graphics/xorg-lib/libx11_1.6.9.bb |  3 +-
 3 files changed, 60 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/files/libx11-whitespace.patch

diff --git a/meta/recipes-graphics/xorg-lib/files/libx11-whitespace.patch b/meta/recipes-graphics/xorg-lib/files/libx11-whitespace.patch
new file mode 100644
index 00000000000..3f971430820
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/files/libx11-whitespace.patch
@@ -0,0 +1,56 @@
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/xorg/lib/libx11/merge_requests/33]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From b41469c5f08b1f3365667ff3c430b104c9b8e25f Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 22 Jan 2020 17:11:23 +0000
+Subject: [PATCH libX11] cpprules.in: squash whitespace in generated files
+
+CPP is used to generate files, but as cpp reads files from the build host the
+output has a number of blank lines at the beginning which varies depending on
+what GCC and friends is used.
+
+Pathalogical example:
+
+ $ cpp -undef -traditional /dev/null
+ # 1 "/dev/null"
+ # 1 "<built-in>"
+ # 1 "<command-line>"
+ # 31 "<command-line>"
+ # 1 "/usr/include/stdc-predef.h" 1 3 4
+
+ # 17 "/usr/include/stdc-predef.h" 3 4
+
+ [ 40 blank line ]
+
+ # 32 "<command-line>" 2
+ # 1 "/dev/null"
+
+So depending on the content of stdc-predef.h and what other headers CPP will
+load, the amount of whitespace in the generates files varies. This can result in
+differences in reproducible environments, and file conflicts in multilib
+environments.
+
+As whitespace is irrelevant to these machine-readable files, extend the sed to
+just delete blank lines.
+---
+ cpprules.in | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/cpprules.in b/cpprules.in
+index 03d6701e..ce6b3c98 100644
+--- a/cpprules.in
++++ b/cpprules.in
+@@ -23,7 +23,8 @@ CPP_SED_MAGIC = $(SED) -e '/^\#  *[0-9][0-9]*  *.*$$/d' \
+                        -e '/^[	 ]*XCOMM[^a-zA-Z0-9_]/s/XCOMM/\#/' \
+                        -e '/^[	 ]*XHASH/s/XHASH/\#/' \
+                        -e 's,X11_LOCALEDATADIR,$(X11_LOCALEDATADIR),g' \
+-                       -e '/\@\@$$/s/\@\@$$/\\/'
++                       -e '/\@\@$$/s/\@\@$$/\\/' \
++                       -e '/^$$/d'
+ 
+ .pre:
+ 	@$(MKDIR_P) $(@D)
+-- 
+2.20.1
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
index cabb84e686d..3d97ad78d2a 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
@@ -14,7 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 SRC_URI[md5sum] = "c5fa5a86a20e3591bed6c046498d4b8f"
 SRC_URI[sha256sum] = "b289a845c189e251e0e884cc0f9269bbe97c238df3741e854ec4c17c21e473d5"
 
-SRC_URI += "file://0001-Drop-x11-dependencies.patch"
+SRC_URI += "file://0001-Drop-x11-dependencies.patch \
+            file://libx11-whitespace.patch"
 
 XORG_PN = "libX11"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
index 8c2a57c6744..ff60a4240c6 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
@@ -11,7 +11,8 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/libx11:"
 PE = "1"
 
 SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
-            file://disable_tests.patch"
+            file://disable_tests.patch \
+            file://libx11-whitespace.patch"
 
 SRC_URI[md5sum] = "55adbfb6d4370ecac5e70598c4e7eed2"
 SRC_URI[sha256sum] = "9cc7e8d000d6193fa5af580d50d689380b8287052270f5bb26a5fb6b58b2bed1"
-- 
2.20.1



Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 396227C3B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 19:48:05 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id m19so8684542ioh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 11:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=q11P8ZHgqHSCXEn0NbFFsNO1WTHt35msNd/Df33dYm4=;
	b=sxlsal2xMHnAKVaH+XAcTi88Nhf0wpv1zUiLEKxigVsmEWZ20VfRQgb5+sVerlZFIP
	2GKOJxF7DJmzeJO4xt57rRLOrG9gVFWI1P77HnClf3qoTnXGRsrp6bL+KXZ3kBEKYa4h
	VDntnGQGMRbvWq4q4VHbqsNWjdYjL/UIsN1uqcy4YK0f4CGBNLdRLmXfgc+JLq7/hsQE
	BjrNF/qRdcZ89tiCcNB2ai8InRdH6W3Jg8il9sTRZVExzysWPPuKXkO97LfIjyw+Qu7R
	6eTb/X9gWxw1MThf6BzflX/o2EUZePUyXjARpYq2selS+VVA5gQKMdckl821tFy20qGk
	x8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=q11P8ZHgqHSCXEn0NbFFsNO1WTHt35msNd/Df33dYm4=;
	b=gpaGycf8FPrTMuCCQe9DsJq01Jot+I5MqMwfLFY1G7r7ny4kE2/mjWq/wWrGXQsbXH
	abxyLxpDIPFP5KpBZUKP1OM7Ol1WZklvY6A8LAITJe9eoN5Q4Lhuhm0S2yzzok912lQW
	/61PsMwB8JIe7+XyGNtWgOCtzpi0J/eufxvF0twUDN71aSb0hW7D2pG2b0dAhsSKd3Nx
	VlxPDb3cFSidLhQAT12MH2Rh+iECbdGLclgJ09mIIRQf75pX+ou6Fy5amsH2EUkTi6Hd
	z0uLslUI3pj26QAQWqLlA4YfUndvRBND3FyBVjS0AljbjVYTlqKiDCdJi/ohr1oGMPRY
	Ns5Q==
X-Gm-Message-State: AJcUukeDUIj+Wtz2NUrQ4UEtbzOtnHBi5CA+5oY+qCPujkyc8Za++5+x
	qhdz3BtKfWOMG6l1MKK3Eu4xNECUrlc=
X-Google-Smtp-Source: AHgI3IZvskRMrAqmJsT4W57Dkwx+TkD7T16/Kew2ltP4LsQOZtyOeMAv4Rxt3kjTEPdXkAoRwECfPg==
X-Received: by 2002:a5d:9459:: with SMTP id x25mr7287909ior.293.1548445685858; 
	Fri, 25 Jan 2019 11:48:05 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	s184sm5000467itb.44.2019.01.25.11.48.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 25 Jan 2019 11:48:05 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2019 13:47:45 -0600
Message-Id: <20190125194745.32058-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190124210227.25029-1-JPEWhacker@gmail.com>
References: <20190124210227.25029-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2] Change default debug split to make separate source packages
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
X-List-Received-Date: Fri, 25 Jan 2019 19:48:05 -0000
Content-Transfer-Encoding: 8bit

Changes the default PACKAGE_DEBUG_SPLIT_STYLE to generate separate
source and debug packages. SDKIMAGE_FEATURES is updated to include the
source packages so that there is not change for the SDK contents.

[YOCTO #12931]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/populate_sdk_base.bbclass  | 2 +-
 meta/conf/bitbake.conf                  | 2 ++
 meta/lib/oeqa/selftest/cases/pkgdata.py | 4 ++--
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index f2c934aaebb..80fa443e4ca 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -18,7 +18,7 @@ def complementary_globs(featurevar, d):
             globs.append(glob)
     return ' '.join(globs)
 
-SDKIMAGE_FEATURES ??= "dev-pkgs dbg-pkgs ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'doc-pkgs', '', d)}"
+SDKIMAGE_FEATURES ??= "dev-pkgs dbg-pkgs src-pkgs ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'doc-pkgs', '', d)}"
 SDKIMAGE_INSTALL_COMPLEMENTARY = '${@complementary_globs("SDKIMAGE_FEATURES", d)}'
 
 PACKAGE_ARCHS_append_task-populate-sdk = " sdk-provides-dummy-target"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9a095e3ed04..ca9ce2d7bc0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -282,6 +282,8 @@ SOLIBSDEV = ".so"
 # at least means builds aren't completely broken and symlinks don't take up much space.
 SOLIBSDEV_darwin = ".dylibbroken"
 
+PACKAGE_DEBUG_SPLIT_STYLE ?= "debug-with-srcpkg"
+
 PACKAGE_BEFORE_PN ?= ""
 PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
 PACKAGES_DYNAMIC = "^${PN}-locale-.*"
diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
index 0b4caf1b2c2..38776403496 100644
--- a/meta/lib/oeqa/selftest/cases/pkgdata.py
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
@@ -82,7 +82,7 @@ class OePkgdataUtilTests(OESelftestTestCase):
             pkglist.remove('zlib-ptest') # in case ptest is disabled
         except ValueError:
             pass
-        self.assertEqual(pkglist, ['zlib', 'zlib-dbg', 'zlib-dev', 'zlib-doc', 'zlib-staticdev'], "Packages listed after remove: %s" % result.output)
+        self.assertEqual(pkglist, ['zlib', 'zlib-dbg', 'zlib-dev', 'zlib-doc', 'zlib-src', 'zlib-staticdev'], "Packages listed after remove: %s" % result.output)
         # With recipe specified, runtime
         result = runCmd('oe-pkgdata-util list-pkgs -p zlib -r')
         pkglist = sorted(result.output.split())
@@ -90,7 +90,7 @@ class OePkgdataUtilTests(OESelftestTestCase):
             pkglist.remove('libz-ptest') # in case ptest is disabled
         except ValueError:
             pass
-        self.assertEqual(pkglist, ['libz-dbg', 'libz-dev', 'libz-doc', 'libz-staticdev', 'libz1'], "Packages listed after remove: %s" % result.output)
+        self.assertEqual(pkglist, ['libz-dbg', 'libz-dev', 'libz-doc', 'libz-src', 'libz-staticdev', 'libz1'], "Packages listed after remove: %s" % result.output)
         # With recipe specified and unpackaged
         result = runCmd('oe-pkgdata-util list-pkgs -p zlib -u')
         pkglist = sorted(result.output.split())
-- 
2.20.1



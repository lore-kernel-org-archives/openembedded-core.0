Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id BCDF26E3DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 15:19:49 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id d13so854572wiw.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 07:19:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=YE0ynjrwe1CbIYOLge1ILllTdG0YDQKfNNkMzvoZxOI=;
	b=f+0x2Z3aWRJQMKz0ODn/abx6ORvfFqOxBBEXqpfgjeK0FPVPZZ2PDKULuOiV8GNLj4
	AzhEwxx3juQnCAezWJv6C05OUqUIbxmXb1gcS1M1OaRofDAXFApDJymYkxz5d1H0pgEf
	1DFs3kl5xH+fhuPmkhv/q/u5VtrdksgVXPbF/MxuQglMDCAD48HQtMKDdkvRPV/6fyft
	ZbX9QjT6mRZ91X/YoUrqbmbDXfZATj9Z/4Z6dB8tYlkz5Lr3U30p9C6Hvzj7j4tGLJlE
	CkozQ3mSsfSKWACXuq6gbI2//zmTaG6ZuPiVFu6jxU6AABfI6fhmm0uObjwV0PwntLwl
	8f9g==
X-Gm-Message-State: ALoCoQl09GpGuL0JP3Vr1FFjtei5+RZUGBqYjl4HOyJTWqVIqXdxB6hjPLbSDwy9qUDn+RMhirV3
X-Received: by 10.180.94.67 with SMTP id da3mr3561274wib.38.1389712790382;
	Tue, 14 Jan 2014 07:19:50 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e1sm1923314wij.7.2014.01.14.07.19.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jan 2014 07:19:49 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2014 15:19:32 +0000
Message-Id: <f0636fc5fd95fc5f9f1271ccbaf347d06489d3e7.1389712683.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1389712683.git.ross.burton@intel.com>
References: <cover.1389712683.git.ross.burton@intel.com>
In-Reply-To: <cover.1389712683.git.ross.burton@intel.com>
References: <cover.1389712683.git.ross.burton@intel.com>
Subject: [PATCH][V3 7/7] packagegroup-core-tools-testapps: add Piglit
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
X-List-Received-Date: Tue, 14 Jan 2014 15:19:50 -0000

Respect the OpenGL distro feature and if it's enabled, pull in piglit and
mesa-tools.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../packagegroups/packagegroup-core-tools-testapps.bb           |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 1861ebe..4b8f99b 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -24,10 +24,14 @@ KEXECTOOLS_powerpc ?= ""
 KEXECTOOLS_e5500-64b ?= ""
 KEXECTOOLS_aarch64 ?= ""
 
+GLTOOLS = "\
+    mesa-demos \
+    piglit \
+    "
+
 X11TOOLS = "\
     fstests \
     owl-video \
-    mesa-demos \
     x11perf \
     xrestop \
     xwininfo \
@@ -48,4 +52,5 @@ RDEPENDS_${PN} = "\
     ltp \
     connman-client \
     ${@base_contains('DISTRO_FEATURES', 'x11', "${X11TOOLS}", "", d)} \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', "${GLTOOLS}", "", d)} \
     "
-- 
1.7.10.4



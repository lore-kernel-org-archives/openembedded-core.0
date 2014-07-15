Return-Path: <rpjday@crashcourse.ca>
X-Greylist: delayed 397 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 15 Jul 2014 15:18:43 UTC
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 7F1247061A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:18:43 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20140715151206091
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:12:06 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [69.196.158.250] (port=53482 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X74Od-0006sK-Qw for openembedded-core@lists.openembedded.org;
	Tue, 15 Jul 2014 11:11:59 -0400
Date: Tue, 15 Jul 2014 11:11:51 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1407151108080.5743@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: [PATCH] Document all five "*-pkgs" valid image features.
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
X-List-Received-Date: Tue, 15 Jul 2014 15:18:48 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Make sure both bitbake.conf and local.conf,sample list all five valid
"*-pkgs" forms of IMAGE_FEATURES.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  given this at the top of populate_sdk_base.bbclass:

COMPLEMENTARY_GLOB[dev-pkgs] = '*-dev'
COMPLEMENTARY_GLOB[staticdev-pkgs] = '*-staticdev'
COMPLEMENTARY_GLOB[doc-pkgs] = '*-doc'
COMPLEMENTARY_GLOB[dbg-pkgs] = '*-dbg'
COMPLEMENTARY_GLOB[ptest-pkgs] = '*-ptest'

i thought it would be worth adding the missing entries to the lists
below.

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 1b36cba..0972d1a 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -28,8 +28,10 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
 # - package-management  - installs package management tools and preserves the package manager database
 # - debug-tweaks        - makes an image suitable for development, e.g. allowing passwordless root logins
 # - dev-pkgs            - development packages (headers, etc.) for all installed packages in the rootfs
+# - staticdev-pkgs      - static versions of development packages
 # - dbg-pkgs            - debug symbol packages for all installed packages in the rootfs
 # - doc-pkgs            - documentation packages for all installed packages in the rootfs
+# - ptest-pkgs          - package test files for ptest-enabled packages
 # - read-only-rootfs    - tweaks an image to support read-only rootfs
 #
 FEATURE_PACKAGES_x11 = "packagegroup-core-x11"
diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index d64ba7f..61db873 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -123,6 +123,8 @@ PACKAGE_CLASSES ?= "package_ipk"
 #                     (adds symbol information for debugging/profiling)
 #  "dev-pkgs"       - add -dev packages for all installed packages
 #                     (useful if you want to develop against libs in the image)
+#  "staticdev-pkgs" - add -staticdev packages for all installed packages
+#  "doc-pkgs"       - add -doc packages for all installed packages
 #  "ptest-pkgs"     - add -ptest packages for all ptest-enabled packages
 #                     (useful if you want to run the package test suites)
 #  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



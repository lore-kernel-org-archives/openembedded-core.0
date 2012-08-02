Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwymK-0006J7-AO
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 19:01:40 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 02 Aug 2012 09:50:02 -0700
Received: by wibhm11 with SMTP id hm11so4187482wib.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 09:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=SRXOGsvd5G6gIhUeyTJg2eINWsAqNXqF/SiaYqzjMWE=;
	b=cNM/CVZ63oOixkU3Amlgf8hJhxEP9j873U9Wc/yoi794IcLg259ZY3mYWL0+rHCbl/
	IbjN+3TBnWidBjBzF5YkfJI9lNeH229qr//27AAJ0vfUZTL3yNUCdtPQrtVWNNjcqA+b
	0plaxKEh1U4Qcog9hI3gTjnU0DcGwsSzXMaLQXgCzNbp7kSNb3Yipp/XRY7PnHobRt7B
	Q66FtpY1kyXaDpJh0HY0A6YRaTrx7hjT12hvVYn0vJGqYtMIE748dSnresT44mw+n4se
	+rnmYSHPhhHQH6+lQBMHDRl9PTlOQtmr7MDekwGx20LzwglgGSC02JfNYjjRQRAysDHG
	1yHQ==
Received: by 10.216.139.196 with SMTP id c46mr10991364wej.220.1343926200399;
	Thu, 02 Aug 2012 09:50:00 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id z11sm18460713wiv.10.2012.08.02.09.49.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 09:49:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 17:49:01 +0100
Message-Id: <e00dc8cb6a5aa62814b58fcf4263023add87d175.1343926021.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
References: <cover.1343926021.git.ross.burton@intel.com>
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
References: <cover.1343926021.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnQqY2oX4rvdBqb1nnreQzDiPcH91bgEmqorbYrbYN4GTT6RIpgHX1kOPPfgYhQMSBVfXrk
Subject: [PATCH V3 07/11] mesa: Use 'require' instead of 'include'
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
X-List-Received-Date: Thu, 02 Aug 2012 17:01:41 -0000

From: Damien Lespiau <damien.lespiau@intel.com>

These include files are really required, not optional.

Signed-off-by: Damien Lespiau <damien.lespiau@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb  |    6 +++---
 meta/recipes-graphics/mesa/mesa-dri_git.bb    |    6 +++---
 meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb |    6 +++---
 meta/recipes-graphics/mesa/mesa-xlib_git.bb   |    6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb b/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
index 219e555..bd62c98 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
@@ -1,4 +1,4 @@
-include mesa-common.inc
-include mesa-${PV}.inc
-include mesa-dri.inc
+require mesa-common.inc
+require mesa-${PV}.inc
+require mesa-dri.inc
 PR = "${INC_PR}.1"
diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-graphics/mesa/mesa-dri_git.bb
index a0e1945..4b36f20 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_git.bb
@@ -1,6 +1,6 @@
-include mesa-common.inc
-include mesa-git.inc
-include mesa-dri.inc
+require mesa-common.inc
+require mesa-git.inc
+require mesa-dri.inc
 
 # this needs to be lower than -1 because all mesa-dri have -1 and git version has highest PV, but shouldn't be default
 DEFAULT_PREFERENCE = "-2"
diff --git a/meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb b/meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb
index 7547b22..a89640e 100644
--- a/meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb
+++ b/meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb
@@ -1,5 +1,5 @@
-include mesa-common.inc
-include mesa-${PV}.inc
-include mesa-xlib.inc
+require mesa-common.inc
+require mesa-${PV}.inc
+require mesa-xlib.inc
 PR = "${INC_PR}.2"
 
diff --git a/meta/recipes-graphics/mesa/mesa-xlib_git.bb b/meta/recipes-graphics/mesa/mesa-xlib_git.bb
index be2f5d3..6647120 100644
--- a/meta/recipes-graphics/mesa/mesa-xlib_git.bb
+++ b/meta/recipes-graphics/mesa/mesa-xlib_git.bb
@@ -1,6 +1,6 @@
-include mesa-common.inc
-include mesa-git.inc
-include mesa-xlib.inc
+require mesa-common.inc
+require mesa-git.inc
+require mesa-xlib.inc
 
 # this needs to be lower than -1 because all mesa-dri have -1 and git version has highest PV, but shouldn't be default
 DEFAULT_PREFERENCE = "-2"
-- 
1.7.10




Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwbAG-0001q3-Ks
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:48:48 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 08:37:10 -0700
Received: by mail-we0-f180.google.com with SMTP id t11so4667579wey.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 08:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=SRXOGsvd5G6gIhUeyTJg2eINWsAqNXqF/SiaYqzjMWE=;
	b=T69n2ke28RpWIr1/fR1/xU645CHODkbed+dO/IQ2LmzxefciPpEou18KG/qkaGYNNs
	7+3OlHHwZeRAT0MRCEM8RYcEUDp2lmz7NrnDPX5BaKcMEDNtNjWypDwGBO33aLfKZHPX
	w/EGvQ9UilrOkdM3FIJZkCzllRj8Ly51nGmIRitKN/mF0CwwcDWoAze3IOLxI12ROhQO
	yiigYSpt2Rh+z9WNgCosLYVFp2DYvWqURZSdOiMGa9FKoVRSrOzJY1Cf7rLY//j4OE93
	zkfi/L4Q7v5WmV9/Vbhd3wkstmFTTcZLo/fBKqdyMrclgeGRyc6OhIphU0hte//uERW+
	Eowg==
Received: by 10.216.139.196 with SMTP id c46mr9010136wej.220.1343835430611;
	Wed, 01 Aug 2012 08:37:10 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id z11sm9489001wiv.10.2012.08.01.08.37.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 08:37:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 16:36:33 +0100
Message-Id: <93e5a337b800d309e1a141a073015dedf824738b.1343835237.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343835237.git.ross.burton@intel.com>
References: <cover.1343835237.git.ross.burton@intel.com>
In-Reply-To: <cover.1343835237.git.ross.burton@intel.com>
References: <cover.1343835237.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmKCjj0slwnwi7MdYRDJKJ/gAcT0XLplZVInOYEaY+Ui5Cj1EF8QUZhveHjMdZ4tPAmqxCJ
Subject: [PATCH 06/11] mesa: Use 'require' instead of 'include'
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
X-List-Received-Date: Wed, 01 Aug 2012 15:48:48 -0000

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




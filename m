Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBWBT-0001kd-MU
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:31:43 +0200
Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 12:18:54 -0700
Received: by wibhq4 with SMTP id hq4so3527991wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=pchqT/Rx5EJCbxNL3yMIVAMVzxY2MpEm0yfbNLb2EKM=;
	b=Rik0ku0S0Jr+EAJpDQ6kxGW4IUai11XwEwE2G814gVv5wo25pwAc9yZunbtVIW6AGM
	9Z/1+Vcje0CemUkD8sDARiqnBDG9HFn28FDYcPxosqVIazy3wIMQeXSIA/es7p/aZEpJ
	LVCXJifER4LCPnUSacjMHEus6OEPpoU8nVGkehiOzeyjQzoGfXDJuCrmVH1rfER/8FcS
	vUjOiGmfoukW1MfFpItBZK/h8gq84lNgpls54ckeUCCGMENEftEnqyVEVqF8ibI2hKp8
	wIgFJWta3n8Q/KcX+WuYaXzElPf4D25rtq8BC8xnsn8GRwx2eMykjWUzBLpl3qNrmCwI
	dpyw==
Received: by 10.180.108.45 with SMTP id hh13mr27127402wib.15.1347391140688;
	Tue, 11 Sep 2012 12:19:00 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm5953150wix.6.2012.09.11.12.18.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 12:18:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 20:17:53 +0100
Message-Id: <1347391088-30390-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
References: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlvOWGB7EsH3YPOISIs11xbnY9QBy+qAF4AiR8jrqnHhSJsTIK/rhqUj9Wx5a+3UaBHON2t
Subject: [RFC 03/18] libx11-diet: you can't disable UDC, because it's always disabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 19:31:43 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
index d821744..e6aa63f 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
@@ -1,11 +1,11 @@
 require libx11.inc
 
-DESCRIPTION += " Support for UDC, XCMS and XLOCALE is disabled in \
+DESCRIPTION += " Support for XCMS and XLOCALE is disabled in \
 this version."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI += "file://x11_disable_makekeys.patch \
             file://X18NCMSstubs.diff \
@@ -25,6 +25,6 @@ DEPENDS += "libxcb bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
 
 FILESDIR = "${@os.path.dirname(d.getVar('FILE', True))}/libx11"
 
-EXTRA_OECONF += "--disable-udc --disable-xcms --disable-xlocale --with-keysymdefdir=${STAGING_INCDIR}/X11"
+EXTRA_OECONF += "--disable-xcms --disable-xlocale --with-keysymdefdir=${STAGING_INCDIR}/X11"
 CFLAGS += "-D_GNU_SOURCE"
 
-- 
1.7.10




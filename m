Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TSncl-0005Mb-E9
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 12:35:21 +0100
Received: from mail-lb0-f197.google.com ([209.85.217.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 29 Oct 2012 04:21:14 -0700
Received: by mail-lb0-f197.google.com with SMTP id b5so3591262lbd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2012 04:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=MG4HnpmpKfmZ/uCfSFnATAUCTb6smfJh/HGq0Tq/G20=;
	b=exjfpaAk4UQCB6ed5jRR75rWqDHlpy9HT2dZkVLPtghVQcfDiXwN1oPO+FwdpOG8P4
	GdI3VACFP+Hnm0ATDMuY8APed9aoCKxnL9HqwAEpGC4GruTROUWnbzMjao7pjM3r4tN/
	o5c3H4likqyjUTskJKcsTuG5LbsKh4D470SP7eAVnAJJDHXXV4U7mqcG9UwM8oJMBGVh
	wTo69u2t+0RYkrNuYxh/HsnjUW1aXSM/ne/MeRZZYAYRM+ZilLu8TzGoDQS3KJo/IKlh
	9+RVl08s+6kzsIoRWiCBb02tPDW7+QoWZr2PuXbVEO/+AEV1OkEBs+OHQ/oTrAefzkLg
	oZCQ==
Received: by 10.180.8.134 with SMTP id r6mr14554547wia.18.1351509701181;
	Mon, 29 Oct 2012 04:21:41 -0700 (PDT)
Received: by 10.180.8.134 with SMTP id r6mr14554527wia.18.1351509701053;
	Mon, 29 Oct 2012 04:21:41 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bn7sm10844252wib.8.2012.10.29.04.21.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Oct 2012 04:21:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Oct 2012 11:20:28 +0000
Message-Id: <1351509628-12898-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlfcq0CW23nlf+ORrGoYf6QkJSS7uy2fcQUfVx8mgJrnSrXTLdzXYPibX5cmXIjuysQgmJHcysNeTDNQPpBUSOfR9Vmts2FGzg2crSRWGcaJiMmyVPhHkg8CbMVXDBgkwBGyXxzhNhGcX4rUZdadzpLFarx3/VRhs7xySVMYem5rLoMt6f8C4m4WOGJGaL5XAfxtFpz
Subject: [PATCH] clutter-box2d: add missing glib-2.0 build dependency
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
X-List-Received-Date: Mon, 29 Oct 2012 11:35:29 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/clutter/clutter-box2d_git.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-box2d_git.bb b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
index d256a28..86e0711 100644
--- a/meta/recipes-graphics/clutter/clutter-box2d_git.bb
+++ b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
@@ -4,11 +4,11 @@ LIC_FILES_CHKSUM = "file://box2d/License.txt;md5=e5d39ad91f7dc4692dcdb1d85139ec6
 
 SRCREV = "de5452e56b537a11fd7f9453d048ff4b4793b5a2"
 PV = "0.12.1+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://git.gnome.org/clutter-box2d.git"
 
 S = "${WORKDIR}/git"
 
-DEPENDS += "clutter-1.8"
+DEPENDS += "glib-2.0 clutter-1.8"
 PROVIDES = "clutter-box2d-1.6"
-- 
1.7.10




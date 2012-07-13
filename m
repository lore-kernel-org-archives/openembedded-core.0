Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sphld-0001nu-8C
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 17:26:53 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 13 Jul 2012 08:15:36 -0700
Received: by wibhm11 with SMTP id hm11so576904wib.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 08:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=sK/VdW0bNRpOE+4xj+pIEJ3S+khGhGgrYd2LPHd1oVE=;
	b=byuhs9d5BNp/MzWu0p5Cb7k5iHOS1hFaxnALEm4vwrq04OXytX4QayYsQ6fp/0VIZc
	F4zQqxEVrdeAuTlqpGU5BzVmLz6fXK9G9emBgg6MZFCESg1fQz87ipvh5FrqnmgGQeyJ
	qpnPEV1zZ9JOvyJkJdVEUOgh3wweOiQKafsFtvuSSgV2XNCyTiZm4GokGwNa0XO4U1Eg
	SykkIrhwImO5fEdx9j3seJ0K0YSQv+gXHSq8jKIX8wVYxSgO6RpyAjAtDX82HNl/F9im
	YSjs2RERxOTRudX7ohAMVbV1aeKCXM8Yeqj9F2ypvNlZW516T/o5SdfqS/P7RbYdo6F6
	wSlA==
Received: by 10.180.98.200 with SMTP id ek8mr3538129wib.0.1342192535073;
	Fri, 13 Jul 2012 08:15:35 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id el6sm3780926wib.8.2012.07.13.08.15.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 08:15:34 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jul 2012 16:15:18 +0100
Message-Id: <241fc978817b8b9a527e41a2102c9669701573de.1342192478.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342192478.git.ross.burton@intel.com>
References: <cover.1342192478.git.ross.burton@intel.com>
In-Reply-To: <cover.1342192478.git.ross.burton@intel.com>
References: <cover.1342192478.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnuBsfzk+SsUUcVRkDyeYp35Leh2TqwG4iumZlWOFcMWimSQimAy6/O7a+/Q6hyBjaUU0Te
Subject: [PATCH 1/3] web-webkit: remove unused dependencies (taken from the gecko-based recipe)
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
X-List-Received-Date: Fri, 13 Jul 2012 15:26:53 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/web/web-webkit_git.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/web/web-webkit_git.bb b/meta/recipes-sato/web/web-webkit_git.bb
index 2af12bc..57cd545 100644
--- a/meta/recipes-sato/web/web-webkit_git.bb
+++ b/meta/recipes-sato/web/web-webkit_git.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SECTION = "x11"
-DEPENDS = "libxml2 glib-2.0 gtk+ libglade webkit-gtk curl gconf js libowl"
+DEPENDS = "glib-2.0 gtk+ webkit-gtk libowl"
 
 # To access https web pages
 RRECOMMENDS_${PN} += "glib-networking"
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--enable-libowl"
 
-inherit autotools pkgconfig gconf
+inherit autotools pkgconfig
 
 do_configure_prepend() {
     touch ${S}/src/dummy.cpp
-- 
1.7.10




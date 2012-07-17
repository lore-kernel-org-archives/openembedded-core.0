Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrAie-0002Fq-By
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:33:52 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 17 Jul 2012 09:22:31 -0700
Received: by weyt11 with SMTP id t11so361057wey.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 09:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=sK/VdW0bNRpOE+4xj+pIEJ3S+khGhGgrYd2LPHd1oVE=;
	b=i2phekUVeFaldUtUjUzlKeWGNlguW/6vz7+1xsrgAGU2zVdoC1jcMXE8qoCI03I9Q/
	Szzs5lnZyMbhyPJj0Itt+UUGy1lMxCAajSkCzrXuZWatqPuMEDy78SMMCqcGxdXEchf2
	OylvWjpmzfDWIH7oQqg9DDu+BG56iaNt+LOnccmvfKaTJiJhR0USEftvle06O+c1URG/
	oBTKdMqzDY+nk0vF94d8R44csLrOQeyk2Dn3GX7nLokLOVGVh1GQIp3OOYh6yQHqLeD8
	ILrii0BDaMrNHC9NCK2UrIfqWyNP+la7tWpC/dvlyscDg5/SeAZaA8QwmDE9EiV42Hox
	qQkA==
Received: by 10.216.62.204 with SMTP id y54mr1889332wec.31.1342542150127;
	Tue, 17 Jul 2012 09:22:30 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm27732790wib.10.2012.07.17.09.22.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 09:22:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 17:22:08 +0100
Message-Id: <7a6794bfa273de23aa91c4e39f0184227f4692c7.1342542040.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342542040.git.ross.burton@intel.com>
References: <cover.1342542040.git.ross.burton@intel.com>
In-Reply-To: <cover.1342542040.git.ross.burton@intel.com>
References: <cover.1342542040.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmqJ26q0Y2WoQf7SuyiqYF8sLbVEJOw+Kct5KutP8q+Sd0kvP1Fv1+N3wPXw6lptFZdJItZ
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
X-List-Received-Date: Tue, 17 Jul 2012 16:33:52 -0000

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




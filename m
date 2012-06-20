Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1ShJEz-0001Bf-5X
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 13:38:29 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 20 Jun 2012 04:27:43 -0700
Received: by weyt11 with SMTP id t11so4823236wey.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 04:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=j8PmWgDEbhRJEPvSCVPkOcs1/rPQp9zPHafNIykovKk=;
	b=kN93g9RWWhikd4/m49ybjqyM9jvC8cVUJZ0lQUcxBybfQ2FHkBhx1nZ/dSFKFoOrBF
	aK76atL5Xe2HSMV8/InoiGB1LdyOVrv/B/uAO49bxhIkYyZrasYjhnoMhTxAoEAEWvtm
	0QqfT7FhN3WonYwo9rarGPV+HS1PMrajshR+5J+KFcocDqeutGuf/Rjww7gkET2qC5O7
	b53dOBqzA2YbGgeXr92jla/2M/95TN0frw1u8zSBZiL3X2rXnOhFjbOltO/uYmF0GaXX
	dORjYyRR3WP0na4mSMFe38cncT7ebWzBL1WRuIHWGJAocGUrQgJBswLAQ+WBoN0rOlbV
	h1OQ==
Received: by 10.180.82.42 with SMTP id f10mr11277377wiy.22.1340191661022;
	Wed, 20 Jun 2012 04:27:41 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id
	fo7sm38528660wib.9.2012.06.20.04.27.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 04:27:40 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 12:27:22 +0100
Message-Id: <4cde24fe5e948f2dd62aab539caed92d35b9eabc.1340191527.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <715f2b8f8d165641f28a3eceea55570491e2f9b5.1340191527.git.ross.burton@intel.com>
References: <cover.1340191527.git.ross.burton@intel.com>
	<715f2b8f8d165641f28a3eceea55570491e2f9b5.1340191527.git.ross.burton@intel.com>
In-Reply-To: <cover.1340191527.git.ross.burton@intel.com>
References: <cover.1340191527.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkHNUOHfjs98aEEtezhF3jFYvckf/QGiHjxTmJekr3T5//QbNLQIauCZYFOEPnnRUebZAnI
Subject: [PATCH 5/6] connman-gnome: clean up runtime dependencies
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
X-List-Received-Date: Wed, 20 Jun 2012 11:38:30 -0000

There is no need to recommend Python as it isn't used, and specifying the connman plugins should be done by the image.

Add a dependency on connman itself as otherwise connman-gnome doesn't do much.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../connman/connman-gnome_0.5.bb                   |   15 ++-------------
 1 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb b/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
index a4327f5..8a6878c 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 DEPENDS = "gtk+ dbus-glib"
 
-PR = "r11"
+PR = "r12"
 
 SRCREV = "42c652d123ea133d0a0930b96e8e39dbd0c597b5"
 SRC_URI = "git://git.kernel.org/pub/scm/network/connman/connman-gnome.git \
@@ -24,15 +24,4 @@ S = "${WORKDIR}/git"
 
 inherit autotools gtk-icon-cache
 
-RRECOMMENDS_${PN} = "python  \
-                     python-dbus \
-                     connman \
-                     connman-plugin-ethernet \
-                     connman-plugin-loopback \
-                     connman-plugin-udhcp \
-                     connman-plugin-wifi \
-                     connman-plugin-fake \
-                     connman-plugin-bluetooth \
-                     connman-plugin-dnsproxy \
-                     connman-plugin-ofono \
-                    "
+RDEPENDS_${PN} = "connman"
-- 
1.7.7.6




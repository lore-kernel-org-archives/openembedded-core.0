Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1REMZD-0001Ig-Ni
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 16:47:28 +0200
Received: by mail-gy0-f175.google.com with SMTP id 15so82885gyc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 07:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=PU11RgeQiEmIptBEUg0RJOsOT2wM937on/FAG+mf6Pc=;
	b=DxfMWZHs7id0TTQ51SZzkr39lvkSbjx6IiVezD/M5bhcRmZKErZAQr/v1DJG8nspFd
	A4i01BZ9+QjdjkdYTG/iX3GhImz73h5uTXTsBsAtS28dIwvDxOinfJ7V9R4oZg2+Rk8C
	mQhFHwSv7pkCf552UiRTcdKTWGO55XZea8IkA=
Received: by 10.101.175.35 with SMTP id c35mr811855anp.15.1318516905868;
	Thu, 13 Oct 2011 07:41:45 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id v20sm122509anv.17.2011.10.13.07.41.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 07:41:44 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 14:41:19 +0000
Message-Id: <640b4887602a9d44bed5449fca4d28669e5ffd51.1318516840.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1318516840.git.otavio@ossystems.com.br>
References: <cover.1318516840.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1318516840.git.otavio@ossystems.com.br>
References: <cover.1318516840.git.otavio@ossystems.com.br>
Subject: [PATCH 4/4] distro_tracking_fields.inc: update qt4 related entries
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
X-List-Received-Date: Thu, 13 Oct 2011 14:47:28 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../conf/distro/include/distro_tracking_fields.inc |   32 ++++++++++----------
 1 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index b07209e..95bdda1 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -3445,34 +3445,34 @@ RECIPE_MAINTAINER_pn-imake = "Yu Ke <ke.yu@intel.com>"
 DISTRO_PN_ALIAS_pn-imake = "Mandriva=xutils Ubuntu=xutils"
 
 RECIPE_STATUS_pn-qt4-tools-native = "green" # no update needed
-RECIPE_LATEST_VERSION_pn-qt4-tools-native = "4.7.3"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-native = "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-native = "2011/05/04"
-RECIPE_LAST_UPDATE_pn-qt4-tools-native = "May 12, 2011"
+RECIPE_LATEST_VERSION_pn-qt4-tools-native = "4.7.4"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-native = "4 months"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-native = "2011/09/01"
+RECIPE_LAST_UPDATE_pn-qt4-tools-native = "September 10, 2011"
 RECIPE_MAINTAINER_pn-qt4-tools-native = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-qt4-tools-native = "Mandriva=libqt4-devel Ubuntu=libqt4-dev"
 
 RECIPE_STATUS_pn-qt4-tools-nativesdk = "green"
-RECIPE_LATEST_VERSION_pn-qt4-tools-nativesdk = "4.7.3"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-nativesdk = "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-nativesdk = "2011/05/04"
-RECIPE_LAST_UPDATE_pn-qt4-tools-nativesdk = "May 12, 2011"
+RECIPE_LATEST_VERSION_pn-qt4-tools-nativesdk = "4.7.4"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-nativesdk = "4 months"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-nativesdk = "2011/09/01"
+RECIPE_LAST_UPDATE_pn-qt4-tools-nativesdk = "September 10, 2011"
 RECIPE_MAINTAINER_pn-qt4-tools-nativesdk = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-qt4-tools-nativesdk = "Mandriva=libqt4-devel Ubuntu=libqt4-dev"
 
 RECIPE_STATUS_pn-qt4-embedded = "green"
-RECIPE_LATEST_VERSION_pn-qt4-embedded = "4.7.3"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-embedded = "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-embedded = "2011/05/04"
-RECIPE_LAST_UPDATE_pn-qt4-embedded = "May 12, 2011"
+RECIPE_LATEST_VERSION_pn-qt4-embedded = "4.7.4"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-embedded = "4 months"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-embedded = "2011/09/01"
+RECIPE_LAST_UPDATE_pn-qt4-embedded = "September 10, 2011"
 RECIPE_MAINTAINER_pn-qt4-embedded = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-qt4-embedded = "OSPDT"
 
 RECIPE_STATUS_pn-qt4-x11-free = "green"
-RECIPE_LATEST_VERSION_pn-qt4-x11-free = "4.7.3"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-x11-free = "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-x11-free = "2011/05/04"
-RECIPE_LAST_UPDATE_pn-qt4-x11-free = "May 12, 2011"
+RECIPE_LATEST_VERSION_pn-qt4-x11-free = "4.7.4"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-x11-free = "4 months"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-x11-free = "2011/09/01"
+RECIPE_LAST_UPDATE_pn-qt4-x11-free = "September 10, 2011"
 RECIPE_MAINTAINER_pn-qt4-x11-free = "Paul Eggleton <paul.eggleton@linux.intel.com"
 DISTRO_PN_ALIAS_pn-qt4-x11-free = "Ubuntu=qt-x11-free Debian=qt-x11-free"
 
-- 
1.7.2.5




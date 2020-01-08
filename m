Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 9DD857FC36
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 03:45:08 +0000 (UTC)
IronPort-SDR: jkT3UZqL7ttLx8jUFo/cAsv5aHM0ov4KTbLhsdptj2EPaKp2uimVDG3klb1xk8vR0r+DuqZhsb
	nfSPdHLT2uPt1ZJADOe0TrXt3rGaMaS3zYjcoRCTQL6SRWjO7KPOyevvvAIX7dqLbpB1MP1oDt
	I3W2dLgOUlguH/ZUyb2EkY4WuJY5EnQTAW1nkX0H0CVWrYQ6PNzCmXRk0MOoeUCdYrGCELa1xE
	5XIyYxO2tAAfWRn47xocyznTUzm3G9DgGBoCW/NV3FSdZAVLIKHMjuDPo513Zee4Ubps87+Jy7
	BkQ=
X-IronPort-AV: E=Sophos;i="5.69,408,1571695200"; d="scan'208,217";a="4038284"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@intel.com>
Date: Wed,  8 Jan 2020 04:44:55 +0100
Message-Id: <20200108034455.10101-7-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200108034455.10101-1-pkj@axis.com>
References: <20200108034455.10101-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH 7/7] oe-pkgdata-browser: Make the window 1200x900 by default
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
X-List-Received-Date: Wed, 08 Jan 2020 03:45:09 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/oe-pkgdata-browser.glade | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-pkgdata-browser.glade b/scripts/oe-pkgdata-browser.glade
index a6aae60bdd..0d06c825ff 100644
--- a/scripts/oe-pkgdata-browser.glade
+++ b/scripts/oe-pkgdata-browser.glade
@@ -35,6 +35,8 @@
   <object class="GtkWindow" id="window">
     <property name="can_focus">False</property>
     <property name="title" translatable="yes">Package Data Browser</property>
+    <property name="default_width">1200</property>
+    <property name="default_height">900</property>
     <property name="icon_name">accessories-dictionary</property>
     <property name="has_resize_grip">True</property>
     <child>
@@ -69,7 +71,7 @@
           <object class="GtkPaned" id="paned1">
             <property name="visible">True</property>
             <property name="can_focus">True</property>
-            <property name="position">200</property>
+            <property name="position">400</property>
             <property name="position_set">True</property>
             <child>
               <object class="GtkScrolledWindow" id="scrolledwindow1">
@@ -112,7 +114,7 @@
               <object class="GtkPaned" id="paned2">
                 <property name="visible">True</property>
                 <property name="can_focus">True</property>
-                <property name="position">200</property>
+                <property name="position">400</property>
                 <property name="position_set">True</property>
                 <child>
                   <object class="GtkScrolledWindow" id="scrolledwindow2">
-- 
2.21.1



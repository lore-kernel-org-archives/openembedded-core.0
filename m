Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id D1C597FC39
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 03:45:09 +0000 (UTC)
IronPort-SDR: 5u3S8de14hfDXbnhKyLCSnEnswln1OWulHRE/iXB22X6S0eTs7HiVZg/0IYABrYKyXw6K9teuE
	kMiOaEnqr88XKEd52U90dcVm8IwpHPCBS4LQGTzOLnaZhs4PIosXFaxRhczI+plgnfrCqBiR0I
	5Rn7yxz0A1mwoq48399fbsNDiH+z54wWLNSoXLbfmN/ZlIgKysMdhx6gPHVPpvbkGdDxsGe4vI
	i84mlDKZhNYE9sRMhKANgW61SaaKaOpeT8DAtdRW7dAfC2R7WRrc1xABUX77WjGWAXyQvyZ+1I
	pWQ=
X-IronPort-AV: E=Sophos;i="5.69,408,1571695200"; 
   d="scan'208";a="4160258"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@intel.com>
Date: Wed,  8 Jan 2020 04:44:49 +0100
Message-Id: <20200108034455.10101-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH 1/7] oe-pkgdata-browser: Rename from pkgdataui.py
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
X-List-Received-Date: Wed, 08 Jan 2020 03:45:10 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/{pkgdataui.py => oe-pkgdata-browser}          | 2 +-
 scripts/{pkgdataui.glade => oe-pkgdata-browser.glade} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename scripts/{pkgdataui.py => oe-pkgdata-browser} (99%)
 rename scripts/{pkgdataui.glade => oe-pkgdata-browser.glade} (100%)

diff --git a/scripts/pkgdataui.py b/scripts/oe-pkgdata-browser
similarity index 99%
rename from scripts/pkgdataui.py
rename to scripts/oe-pkgdata-browser
index f6b23fc0be..09544fff82 100755
--- a/scripts/pkgdataui.py
+++ b/scripts/oe-pkgdata-browser
@@ -99,7 +99,7 @@ class PkgUi():
         self.package_iters = {}
 
         builder = Gtk.Builder()
-        builder.add_from_file(os.path.join(os.path.dirname(__file__), "pkgdataui.glade"))
+        builder.add_from_file(os.path.join(os.path.dirname(__file__), "oe-pkgdata-browser.glade"))
 
         self.window = builder.get_object("window")
         self.window.connect("delete-event", Gtk.main_quit)
diff --git a/scripts/pkgdataui.glade b/scripts/oe-pkgdata-browser.glade
similarity index 100%
rename from scripts/pkgdataui.glade
rename to scripts/oe-pkgdata-browser.glade
-- 
2.21.1



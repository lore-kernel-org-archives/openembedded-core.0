Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 04D0F6B346
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 15:50:36 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Jul 2013 08:50:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,752,1367996400"; d="scan'208";a="273784730"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Jul 2013 08:50:33 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2013 18:58:18 +0300
Message-Id: <1374854298-30941-2-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1374854298-30941-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
References: <1374854298-30941-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH v2 2/2] distrodata.bbclass: Remove whitespaces
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
X-List-Received-Date: Fri, 26 Jul 2013 15:50:38 -0000

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 meta/classes/distrodata.bbclass |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 5f182ac..aef7973 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -71,7 +71,7 @@ python do_distrodata_np() {
         rstatus = localdata.getVar('RECIPE_COLOR', True)
         if rstatus is not None:
                 rstatus = rstatus.replace(',','')
-                
+
         pupver = localdata.getVar('RECIPE_UPSTREAM_VERSION', True)
         if pcurver == pupver:
                 vermatch="1"
@@ -157,7 +157,7 @@ python do_distrodata() {
         rstatus = localdata.getVar('RECIPE_COLOR', True)
         if rstatus is not None:
                 rstatus = rstatus.replace(',','')
-                
+
         pupver = localdata.getVar('RECIPE_UPSTREAM_VERSION', True)
         if pcurver == pupver:
                 vermatch="1"
@@ -408,7 +408,7 @@ python do_checkpkg() {
                                 s = "%s[^\d\"]*?(\d+[\.\-_])+\d+/?" % m.group()
                         else:
                                 s = "(\d+[\.\-_])+\d+/?"
-                                
+
                         searchstr = "[hH][rR][eE][fF]=\"%s\">" % s
 
                         reg = re.compile(searchstr)
@@ -609,17 +609,17 @@ python do_checkpkg() {
                 altpath = path
                 dirver = "-"
                 curname = "-"
-        
+
                 """
                 match version number amid the path, such as "5.7" in:
-                        http://download.gnome.org/sources/${PN}/5.7/${PN}-${PV}.tar.gz        
+                        http://download.gnome.org/sources/${PN}/5.7/${PN}-${PV}.tar.gz
                 N.B. how about sth. like "../5.7/5.8/..."? Not find such example so far :-P
                 """
                 m = re.search(r"[^/]*(\d+\.)+\d+([\-_]r\d+)*/", path)
                 if m:
                         altpath = path.split(m.group())[0]
                         dirver = m.group().strip("/")
-        
+
                         """use new path and remove param. for wget only param is md5sum"""
                         alturi = bb.encodeurl([type, host, altpath, user, pswd, {}])
                         my_uri = d.getVar('REGEX_URI', True)
@@ -637,7 +637,7 @@ python do_checkpkg() {
                 """Now try to acquire all remote files in current directory"""
                 if not re.match("Err", newver):
                         curname = altpath.split("/")[-1]
-        
+
                         """get remote name by skipping pacakge name"""
                         m = re.search(r"/.*/", altpath)
                         if not m:
@@ -663,7 +663,7 @@ python do_checkpkg() {
                                 pstatus = "UPDATE"
                         else:
                                 pstatus = "MATCH"
-        
+
                 if re.match("Err", newver):
                         pstatus = newver + ":" + altpath + ":" + dirver + ":" + curname
         elif type == 'git':
@@ -809,7 +809,7 @@ python do_checkpkg() {
                         pmstatus = "MATCH"
                 else:
                         pmstatus = "UPDATE"
-        
+
         psrcuri = psrcuri.split()[0]
         pdepends = "".join(pdepends.split("\t"))
         pdesc = "".join(pdesc.split("\t"))
-- 
1.7.9.5



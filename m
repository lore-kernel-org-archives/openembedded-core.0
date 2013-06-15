Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CD8B261957
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Jun 2013 12:20:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Jun 2013 05:18:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,871,1363158000"; d="scan'208";a="353959706"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 15 Jun 2013 05:17:47 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Jun 2013 15:17:36 +0300
Message-Id: <1371298656-20346-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] distrodata.bbclass: fix syntax errors
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
X-List-Received-Date: Sat, 15 Jun 2013 12:20:56 -0000

Thes were added by the recent event handler changes.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/distrodata.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 3ff6268..907f78d 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -196,7 +196,7 @@ do_distrodataall() {
 }
 
 addhandler checkpkg_eventhandler
- checkpkg_eventhandler[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted"
+checkpkg_eventhandler[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted"
 python checkpkg_eventhandler() {
     def parse_csv_file(filename):
         package_dict = {}
@@ -793,7 +793,7 @@ do_checkpkgall() {
 }
 
 addhandler distro_check_eventhandler
-distro_check_eventhandler bb.event.BuildStarted
+distro_check_eventhandler[eventmask] = "bb.event.BuildStarted"
 python distro_check_eventhandler() {
     """initialize log files."""
     import oe.distro_check as dc
-- 
1.7.9.5



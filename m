Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SBEQY-0000au-Ou
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 01:01:50 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Mar 2012 16:51:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144370023"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.15.233])
	by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2012 16:51:48 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 16:51:41 -0700
Message-Id: <f8e68e8fdc52aa91ef2d47542641c81f5e7c2b30.1332546190.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <f0393ed61291561b5823079b9528e8df24d56a3f.1332546190.git.elizabeth.flanagan@intel.com>
References: <f0393ed61291561b5823079b9528e8df24d56a3f.1332546190.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1332546190.git.elizabeth.flanagan@intel.com>
References: <cover.1332546190.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 2/8] license.bbclass: Whitespace standardization
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
X-List-Received-Date: Sat, 24 Mar 2012 00:01:51 -0000

From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

Removing tabs within check_license_flags to standardize to
4 space tabbing

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/license.bbclass |   31 +++++++++++++++----------------
 1 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 40dcbeb..4b392ce 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -266,23 +266,23 @@ def incompatible_license(d,dont_want_license):
     dont_want_licenses = []
     dont_want_licenses.append(d.getVar('INCOMPATIBLE_LICENSE', True))
     if d.getVarFlag('SPDXLICENSEMAP', dont_want_license):
-	dont_want_licenses.append(d.getVarFlag('SPDXLICENSEMAP', dont_want_license))
+        dont_want_licenses.append(d.getVarFlag('SPDXLICENSEMAP', dont_want_license))
 
     def include_license(license):
-	if any(fnmatch(license, pattern) for pattern in dont_want_licenses):
-	    return False
-	else:
-	    spdx_license = d.getVarFlag('SPDXLICENSEMAP', license)
-	    if spdx_license and any(fnmatch(spdx_license, pattern) for pattern in dont_want_licenses):
-		return False
-	    else:
-		return True
+        if any(fnmatch(license, pattern) for pattern in dont_want_licenses):
+            return False
+    else:
+        spdx_license = d.getVarFlag('SPDXLICENSEMAP', license)
+        if spdx_license and any(fnmatch(spdx_license, pattern) for pattern in dont_want_licenses):
+            return False
+        else:
+            return True
 
     def choose_licenses(a, b):
         if all(include_license(lic) for lic in a):
-		return a
+            return a
         else:
-		return b
+            return b
 
     """
     If you want to exlude license named generically 'X', we surely want to exlude 'X+' as well.
@@ -290,13 +290,13 @@ def incompatible_license(d,dont_want_license):
     is not a 'X+' license.
     """
     if not re.search(r'[+]',dont_want_license):
-	licenses=oe.license.flattened_licenses(re.sub(r'[+]', '', d.getVar('LICENSE', True)), choose_licenses)
+        licenses=oe.license.flattened_licenses(re.sub(r'[+]', '', d.getVar('LICENSE', True)), choose_licenses)
     else:
-	licenses=oe.license.flattened_licenses(d.getVar('LICENSE', True), choose_licenses)
+        licenses=oe.license.flattened_licenses(d.getVar('LICENSE', True), choose_licenses)
 
     for onelicense in licenses:
-	if not include_license(onelicense):
-		return True
+        if not include_license(onelicense):
+            return True
     return False
 
 
@@ -361,7 +361,6 @@ def check_license_flags(d):
             return unmatched_flag
     return None
 
-
 SSTATETASKS += "do_populate_lic"
 do_populate_lic[sstate-name] = "populate-lic"
 do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
-- 
1.7.1




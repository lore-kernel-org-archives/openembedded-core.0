Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1TavvH-0004g3-GK
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 23:04:07 +0100
Received: from mail-gh0-f197.google.com ([209.85.160.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 20 Nov 2012 13:49:57 -0800
Received: by mail-gh0-f197.google.com with SMTP id f16so12541129ghb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2012 13:49:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=+Cw6g5CQPt2btb2rqZYvulAKg5421ySzgToREVcAht8=;
	b=BPA6oFOxLiQoM01g937aQzt10pqCPrmDzcAi+IIEEZAloFhZ3tlmSiHClt0goz1lZL
	wTrVDPrutFR88LZEyPeg9IqdSUyX2CT9fAx+qN65dbF6sXsrJGKAunVoq476y322Fg+G
	uFtxCMPq6Qk9F0E9B4wX4EuytcJZmqv2lpISnr3TzwgSWX/jibZWDGhGOlAujUeLa9NO
	s1tHiyirartbofHyQq3K6nfc6sdrrIJOi++UPhI7Tgy76hrWC7na3pEuneLbKPmgkGmg
	9kUczRc3NYYRkBjn6mRcDFMfkwheKZytYCUDF1IuZIhDgXmVGEUq9dylonapBAfe3blr
	PA7w==
Received: by 10.224.60.18 with SMTP id n18mr16523499qah.36.1353448196869;
	Tue, 20 Nov 2012 13:49:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.224.60.18 with SMTP id n18mr16523492qah.36.1353448196681; Tue,
	20 Nov 2012 13:49:56 -0800 (PST)
Received: by 10.49.15.193 with HTTP; Tue, 20 Nov 2012 13:49:56 -0800 (PST)
Date: Tue, 20 Nov 2012 13:49:56 -0800
Message-ID: <CAPhnLPAx0bgPRk-YT3uWLfETOhE9ECu0Akxv5i8UGDU+L3-hKg@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkV6PNZL13PFeE80kS1dXC5+kxqV0XPlrP1Z+UFFhkMTXZtqp0wH3VVl9aXaQJeH4VGWyx5TZu11Kjb3D0y/ByCCMYRxkaD260bzYVQqq5bVj3Wa4dZoBVPTPbZ8B6fWJqlEHENUfrhXtTbp6F4b41Y2NDo99hzuTLaqaQIKmiN7wOEpCf5n5IT/bKVRwVfg5NGDtBA
Subject: [PATCH 1/1] license.bbclass: Collect LICENSE level packages
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
X-List-Received-Date: Tue, 20 Nov 2012 22:04:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Some bad logic in license.bbclass misses certain package level
LICENSEs.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/license.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 7e1c23f..c7ca4a6 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -97,9 +97,9 @@ python do_populate_lic() {

     pn = d.getVar('PN', True)
     for package in d.getVar('PACKAGES', True):
-        if d.getVar('LICENSE_' + pn + '-' + package, True):
+        if d.getVar('LICENSE_' + package, True):
             license_types = license_types + ' & ' + \
-                            d.getVar('LICENSE_' + pn + '-' + package, True)
+                            d.getVar('LICENSE_' + package, True)

     #If we get here with no license types, then that means we have a recipe
     #level license. If so, we grab only those.
-- 
1.7.9.5



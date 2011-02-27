Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ptcyj-0007FI-SN
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:50 +0100
Received: by mail-wy0-f175.google.com with SMTP id 38so2800700wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:30:28 -0800 (PST)
Received: by 10.227.24.69 with SMTP id u5mr3771215wbb.223.1298799028545;
	Sun, 27 Feb 2011 01:30:28 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o6sm2267562wbo.15.2011.02.27.01.30.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:30:28 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:30:02 +0100
Message-Id: <b1940c84ce3108ffc2fee3b42ec8f457cb4cd5bd.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 48/50] Fixing type: license.bbclass
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
X-List-Received-Date: Sun, 27 Feb 2011 09:31:50 -0000

From: Beth Flanagan <elizabeth.flanagan@intel.com>

Munged a tab. Fixing

Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/license.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 9c4ccb3..5e9ebe5 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -69,7 +69,7 @@ python do_populate_lic() {
     for license_type in ((license_types.replace('+', '').replace('|', '&')
                           .replace('(', '').replace(')', '').replace(';', '')
                           .replace(',', '').replace(" ", "").split("&"))):
-if os.path.isfile(os.path.join(generic_directory, license_type)):
+        if os.path.isfile(os.path.join(generic_directory, license_type)):
             gen_lic_dest = os.path.join(bb.data.getVar('LICENSE_DIRECTORY', d, True), "common-licenses")
             try:
                 bb.mkdirhier(gen_lic_dest)
-- 
1.6.6.1




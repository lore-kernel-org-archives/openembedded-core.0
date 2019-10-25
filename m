Return-Path: <ftoth@exalondelft.nl>
X-Greylist: delayed 963 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 25 Oct 2019 19:28:50 UTC
Received: from mailfilter03-out40.webhostingserver.nl
	(mailfilter03-out40.webhostingserver.nl [195.211.72.99])
	by mail.openembedded.org (Postfix) with ESMTP id 2157D7FA7C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 19:28:49 +0000 (UTC)
X-Halon-ID: 6dcd0ab6-f75b-11e9-b1df-001a4a4cb9a5
Received: from s198.webhostingserver.nl (unknown [195.211.72.171])
	by mailfilter03.webhostingserver.nl (Halon) with ESMTPSA
	id 6dcd0ab6-f75b-11e9-b1df-001a4a4cb9a5;
	Fri, 25 Oct 2019 21:12:46 +0200 (CEST)
Received: from cust-178-250-146-69.breedbanddelft.nl ([178.250.146.69]
	helo=kalamata.fritz.box)
	by s198.webhostingserver.nl with esmtpa (Exim 4.92.3)
	(envelope-from <ftoth@exalondelft.nl>) id 1iO50w-002wt8-Lm
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Oct 2019 21:12:46 +0200
From: Ferry Toth <ftoth@exalondelft.nl>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 21:12:33 +0200
Message-Id: <20191025191233.18461-1-ftoth@exalondelft.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SendingUser: hidden
X-SendingServer: hidden
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus
X-Authenticated-Id: hidden
X-SendingUser: hidden
X-SendingServer: hidden
Subject: [PATCH] sudo: Fix fetching sources
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
X-List-Received-Date: Fri, 25 Oct 2019 19:28:50 -0000
Content-Transfer-Encoding: 8bit

It looks like https://www.sudo.ws/download.html changed certificate
and directory structure. This breaks fetching sources.

Signed-off-by: Ferry Toth <ftoth@exalondelft.nl>
---
 meta/recipes-extended/sudo/sudo_1.8.23.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.23.bb b/meta/recipes-extended/sudo/sudo_1.8.23.bb
index ce32bd187e..da184be058 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.23.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.23.bb
@@ -1,6 +1,6 @@
 require sudo.inc
 
-SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
+SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-Include-sys-types.h-for-id_t-definition.patch \
            "
-- 
2.20.1



Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Florin.Sarbu@windriver.com>) id 1TtCNW-0003v7-VY
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 08:16:54 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0A71Qdc007872
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Jan 2013 23:01:28 -0800 (PST)
Received: from otp-fsarbu-l1.corp.ad.wrs.com (128.224.171.150) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 9 Jan 2013 23:01:25 -0800
From: Florin Sarbu <florin.sarbu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Jan 2013 09:01:09 +0200
Message-ID: <1357801270-3793-1-git-send-email-florin.sarbu@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
X-Originating-IP: [128.224.171.150]
Subject: [PATCH] alsa-utils: add bash as a dependency of the alsa-utils-alsaconf rpm.
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
X-List-Received-Date: Thu, 10 Jan 2013 07:17:04 -0000
Content-Type: text/plain

alsa-utils-alsaconf rpm contains the bash script alsaconf. In order
to have the do_rootfs not error when bash is not brought along in
the rootfs as an explicit dependency, we add it as a dependency
of alsa-utils.

Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
index 4990eb0..a76985c 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
@@ -47,6 +47,7 @@ ALSA_UTILS_PKGS = "\
 
 PACKAGES += "${ALSA_UTILS_PKGS}"
 RDEPENDS_${PN} += "${ALSA_UTILS_PKGS}"
+RDEPENDS_alsa-utils-alsaconf += "bash"
 
 # We omit alsaconf, because
 # a) this is a bash script
-- 
1.7.10.4




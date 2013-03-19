Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UI2eX-0006Ro-IZ
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 20:56:59 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2JJe5bI004020
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 12:40:05 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 19 Mar 2013 12:40:06 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Mar 2013 15:16:47 -0500
Message-ID: <1363724207-31476-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH] core-image-multilib-example: Location of core-image-sato.bb changed
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
X-List-Received-Date: Tue, 19 Mar 2013 19:57:00 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb b/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb
index 7703731..f13186f 100644
--- a/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb
+++ b/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb
@@ -7,7 +7,7 @@
 #
 
 # First include a base image to base things off
-require recipes-core/images/core-image-sato.bb
+require recipes-sato/images/core-image-sato.bb
 
 # Now add the multilib packages we want to install
 IMAGE_INSTALL += "lib32-bash"
-- 
1.8.1.2.545.g2f19ada




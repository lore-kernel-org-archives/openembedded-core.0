Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TfyUn-0003s8-OT
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 20:49:34 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB4JZ95A005820
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 11:35:09 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 11:35:09 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 13:49:50 -0600
Message-ID: <f311fa1c067064e2d4b929f992f8bfcc715d49e8.1354650148.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1354650148.git.mark.hatle@windriver.com>
References: <cover.1354650148.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/6] rootfs_rpm.bbclass: Revert to default shell logging behavior
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
X-List-Received-Date: Tue, 04 Dec 2012 19:49:34 -0000
Content-Type: text/plain

Remove the set +x, and revert to the normal logging behavior.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/rootfs_rpm.bbclass |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index c4fb470..2bb1b08 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -40,8 +40,6 @@ RPM="rpm ${RPMOPTS}"
 do_rootfs[lockfiles] += "${DEPLOY_DIR_RPM}/rpm.lock"
 
 fakeroot rootfs_rpm_do_rootfs () {
-	set +x
-
 	${RPM_PREPROCESS_COMMANDS}
 
 	#createrepo "${DEPLOY_DIR_RPM}"
-- 
1.7.3.4




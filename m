Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1ROZQF-0002NM-EN
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 19:32:23 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAAIQ6Oe024448
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 10:26:06 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 10 Nov 2011 10:26:05 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Nov 2011 12:30:39 -0600
Message-ID: <30456dbe49e882d945bfecfcf5180cfb5ae306af.1320949721.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1320949721.git.mark.hatle@windriver.com>
References: <cover.1320949721.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/5] rootfs_rpm.bbclass: Turn off script debugging
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
X-List-Received-Date: Thu, 10 Nov 2011 18:32:23 -0000
Content-Type: text/plain

Disable script debugging, as the log files become huge and take a
long time to process during the log check step.  This results in a
performance improvement.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/rootfs_rpm.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index b3875a4..6973008 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -44,7 +44,7 @@ RPM="rpm ${RPMOPTS}"
 do_rootfs[lockfiles] += "${DEPLOY_DIR_RPM}/rpm.lock"
 
 fakeroot rootfs_rpm_do_rootfs () {
-	#set +x
+	set +x
 
 	${RPM_PREPROCESS_COMMANDS}
 
-- 
1.7.3.4




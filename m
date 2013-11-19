Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 822EA6D433
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 08:08:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAJ88UCF017473
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 00:08:30 -0800 (PST)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Tue, 19 Nov 2013 00:08:30 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Nov 2013 16:08:17 +0800
Message-ID: <8b288c53743a6cf409ae1c94f6e931cc405dd984.1384848334.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1384848334.git.kai.kang@windriver.com>
References: <cover.1384848334.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 1/1] LSB_Test.sh: update rpm platform file when enable multilib
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
X-List-Received-Date: Tue, 19 Nov 2013 08:08:30 -0000
Content-Type: text/plain

When enable multilib for x86_64, lsb rpm packages both for archs x86_64
and i486 will be installed. But i486 target packages could not be
installed that no such pattern in rpm platform file. Update platform
file to enable install i486 rpm packages.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
index af1d61c..19116e2 100644
--- a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
+++ b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
@@ -277,6 +277,14 @@ if ! `grep -F -q "noarch-suse" ${PLATFORM_FILE}`; then
 		echo "i486-noarch" >> ${PLATFORM_FILE}
 		echo "i486-pc" >> ${PLATFORM_FILE}
 		echo "noarch-suse" >> ${PLATFORM_FILE}
+	elif [ ${ARCH} == x86_64 ]; then
+		echo "i486-suse" >> ${PLATFORM_FILE}
+		echo "i486-noarch" >> ${PLATFORM_FILE}
+		echo "i486-pc" >> ${PLATFORM_FILE}
+		echo "noarch-suse" >> ${PLATFORM_FILE}
+		echo "${ARCH}-suse" >> ${PLATFORM_FILE}
+		echo "${ARCH}-noarch" >> ${PLATFORM_FILE}
+		echo "${ARCH}-pc" >> ${PLATFORM_FILE}
 	else
 		echo "${ARCH}-suse" >> ${PLATFORM_FILE}
 		echo "${ARCH}-noarch" >> ${PLATFORM_FILE}
-- 
1.8.1.2



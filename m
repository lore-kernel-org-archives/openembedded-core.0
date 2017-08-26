Return-Path: <jose.alarcon@ge.com>
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com
	[67.231.149.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9984977FC7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Aug 2017 11:26:09 +0000 (UTC)
Received: from pps.filterd (m0048274.ppops.net [127.0.0.1])
	by m0048274.ppops.net-00176a03. (8.16.0.21/8.16.0.21) with SMTP id
	v7QBQAEv040096 for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Aug 2017 07:26:10 -0400
From: Jose Alarcon <jose.alarcon@ge.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 26 Aug 2017 14:26:01 +0300
Message-Id: <20170826112602.15344-1-jose.alarcon@ge.com>
X-Mailer: git-send-email 2.10.1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-26_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 impostorscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx scancount=1 engine=8.0.1-1707230000
	definitions=main-1708260185
Subject: [PATCH 1/2] rootfs-postcommands: remove empty line
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
X-List-Received-Date: Sat, 26 Aug 2017 11:26:09 -0000

Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
---
 meta/classes/rootfs-postcommands.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index e7999d4..fb36bad 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -291,7 +291,6 @@ rootfs_sysroot_relativelinks () {
 	sysroot-relativelinks.py ${SDK_OUTPUT}/${SDKTARGETSYSROOT}
 }
 
-
 # Generated test data json file
 python write_image_test_data() {
     from oe.data import export2json
-- 
2.10.1



Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BF37060034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 02:19:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2P2JMTO000692
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 19:19:22 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 24 Mar 2015 19:19:22 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Mar 2015 10:19:15 +0800
Message-ID: <1427249955-23047-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] nss: improve the script signlibs.sh
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
X-List-Received-Date: Wed, 25 Mar 2015 02:19:21 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The *.chk files are installed in ${libdir} by nss,
which is already known, no need to 'find' to get the
file list, and 'ls' is more faster than 'find'.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-support/nss/nss/signlibs.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/nss/nss/signlibs.sh b/meta/recipes-support/nss/nss/signlibs.sh
index 1ec79f4..a74e499 100644
--- a/meta/recipes-support/nss/nss/signlibs.sh
+++ b/meta/recipes-support/nss/nss/signlibs.sh
@@ -9,7 +9,7 @@
 # calculated on the host where they really need to be done on the
 # target
 
-CHK_FILES=`find /lib* /usr/lib* -name "*.chk"`
+CHK_FILES=`ls /lib*/*.chk /usr/lib*/*.chk 2>/dev/null`
 SIGN_BINARY=`which shlibsign`
 for I in $CHK_FILES
 do
-- 
1.9.1



Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D34C178635
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 13:22:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAADMjnR018025
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 05:22:45 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Fri, 10 Nov 2017 05:22:44 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Nov 2017 14:27:02 +0800
Message-ID: <c3d32e2e275a34f57571820cd37860192115b6e1.1510275834.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510275834.git.liezhi.yang@windriver.com>
References: <cover.1510275834.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/23] testsdk.bbclass: add a newline after own-mirrors
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
X-List-Received-Date: Fri, 10 Nov 2017 13:22:45 -0000
Content-Type: text/plain

Otherwise it would generate lines like the following when multilib:
INHERIT += "own-mirrors"SSTATE_MIRRORS += " \n file://.* file:///path/to/../share/sstate-cache/PATH"

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/testsdk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 9fe8c34..2e43343 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -156,7 +156,7 @@ def testsdkext_main(d):
         with open(os.path.join(sdk_dir, 'conf', 'auto.conf'), 'a+') as f:
             f.write('SSTATE_MIRRORS += " \\n file://.* file://%s/PATH"\n' % test_data.get('SSTATE_DIR'))
             f.write('SOURCE_MIRROR_URL = "file://%s"\n' % test_data.get('DL_DIR'))
-            f.write('INHERIT += "own-mirrors"')
+            f.write('INHERIT += "own-mirrors"\n')
 
         # We need to do this in case we have a minimal SDK
         subprocess.check_output(". %s > /dev/null; devtool sdk-install meta-extsdk-toolchain" % \
-- 
2.7.4



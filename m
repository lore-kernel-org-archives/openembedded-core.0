Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 10C686B516
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 07:09:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7D79DTn025698
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 00:09:13 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 13 Aug 2013 00:09:12 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Aug 2013 03:09:09 -0400
Message-ID: <27b0ee9bd74b6c95c3ddd11b673a56d8543cd5d6.1376377523.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1376377523.git.wenzong.fan@windriver.com>
References: <cover.1376377523.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] oe/path.py: call /bin/cp directly
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
X-List-Received-Date: Tue, 13 Aug 2013 07:09:12 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

This avoids running cp with interactive mode if defined:

    alias cp='cp -i'

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/lib/oe/path.py |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index da044ba..6933977 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -97,7 +97,7 @@ def copyhardlinktree(src, dst):
         check_output(cmd, shell=True, stderr=subprocess.STDOUT)
         if os.path.isdir(src):
             src = src + "/*"
-        cmd = 'cp -afl %s %s' % (src, dst)
+        cmd = '/bin/cp -afl %s %s' % (src, dst)
         check_output(cmd, shell=True, stderr=subprocess.STDOUT)
     else:
         copytree(src, dst)
-- 
1.7.9.5



Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 44DBC767DE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 03:17:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7A3HxmT021536
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Aug 2015 20:17:59 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Sun, 9 Aug 2015 20:17:59 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Aug 2015 11:18:05 +0800
Message-ID: <05ec4fa33139b03073c3b498262da4ded30b2953.1438667914.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1438667914.git.Qi.Chen@windriver.com>
References: <cover.1438667914.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] populate_sdk_ext: record SDK_TARGETS in devtool.conf
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
X-List-Received-Date: Mon, 10 Aug 2015 03:17:59 -0000
Content-Type: text/plain

Record the value of SDK_TARGETS for later use of devtool's sdk plugin
for updating SDK.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 3e36890..5e60dbf 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -84,6 +84,8 @@ python copy_buildsystem () {
     config.set('General', 'bitbake_subdir', conf_bbpath)
     config.set('General', 'init_path', conf_initpath)
     config.set('General', 'core_meta_subdir', core_meta_subdir)
+    config.add_section('SDK')
+    config.set('SDK', 'sdk_targets', d.getVar('SDK_TARGETS', True))
     bb.utils.mkdirhier(os.path.join(baseoutpath, 'conf'))
     with open(os.path.join(baseoutpath, 'conf', 'devtool.conf'), 'w') as f:
         config.write(f)
-- 
1.9.1



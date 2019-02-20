Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 303087C9FF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 01:31:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1K1VbDF000947
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:31:37 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Tue, 19 Feb 2019 17:31:36 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2019 09:40:36 +0800
Message-ID: <90f3bd3bdd935f1686b5a05dd258c505cfb8fbe5.1550626729.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1550626729.git.Qi.Chen@windriver.com>
References: <cover.1550626729.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] sysstat: upgrade to 12.1.3
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
X-List-Received-Date: Wed, 20 Feb 2019 01:31:36 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-extended/sysstat/{sysstat_12.1.1.bb => sysstat_12.1.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.1.1.bb => sysstat_12.1.3.bb} (53%)

diff --git a/meta/recipes-extended/sysstat/sysstat_12.1.1.bb b/meta/recipes-extended/sysstat/sysstat_12.1.3.bb
similarity index 53%
rename from meta/recipes-extended/sysstat/sysstat_12.1.1.bb
rename to meta/recipes-extended/sysstat/sysstat_12.1.3.bb
index 027e710..5daf3f4 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.1.1.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.1.3.bb
@@ -4,5 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
 
-SRC_URI[md5sum] = "43e27a92ebb4e6650cb2362b32b9d7d0"
-SRC_URI[sha256sum] = "64a286cabbf7939c32db5ca46009ae96509c85a2730905dc2f8f98ecc4a63937"
+SRC_URI[md5sum] = "0f9b73f60aba6fd49de346bc384902c3"
+SRC_URI[sha256sum] = "55498bf82755ba9fed3e7df61fd26f8f50dd3e7b3b229c731029a4c8ab51a1aa"
-- 
1.9.1



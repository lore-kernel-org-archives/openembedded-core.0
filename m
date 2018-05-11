Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D80075456
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 02:19:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4B2JI6k011243
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 19:19:19 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 10 May 2018 19:19:18 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 May 2018 10:20:17 +0800
Message-ID: <472b98af10aa95b57791961d543c677fa34f0af1.1526004301.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1526004301.git.Qi.Chen@windriver.com>
References: <cover.1526004301.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] sysstat: upgrade to 11.7.3
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
X-List-Received-Date: Fri, 11 May 2018 02:19:18 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-extended/sysstat/{sysstat_11.7.1.bb => sysstat_11.7.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_11.7.1.bb => sysstat_11.7.3.bb} (53%)

diff --git a/meta/recipes-extended/sysstat/sysstat_11.7.1.bb b/meta/recipes-extended/sysstat/sysstat_11.7.3.bb
similarity index 53%
rename from meta/recipes-extended/sysstat/sysstat_11.7.1.bb
rename to meta/recipes-extended/sysstat/sysstat_11.7.3.bb
index 86738e7..8c89748 100644
--- a/meta/recipes-extended/sysstat/sysstat_11.7.1.bb
+++ b/meta/recipes-extended/sysstat/sysstat_11.7.3.bb
@@ -4,5 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
 
-SRC_URI[md5sum] = "bdcda7c9048c7c22fb1f30f75285d13d"
-SRC_URI[sha256sum] = "303a595b1af0330b183a0f1febfccf89f183b9575ae0562b91fdb876f3ef1feb"
+SRC_URI[md5sum] = "c40cefdc7649c7554ecf1d56bf485d09"
+SRC_URI[sha256sum] = "8ea4ffcce8dae68a1cbb6acaa131ae7e3e6c5765134e670aa9baa38c1bcc66ea"
-- 
1.9.1



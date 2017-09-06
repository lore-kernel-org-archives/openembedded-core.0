Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 468A477CF1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 04:49:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v864nc14017940
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Sep 2017 21:49:39 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 5 Sep 2017 21:49:38 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Sep 2017 12:54:45 +0800
Message-ID: <b665e377a05878c26284372e7dc4c2892bc94801.1504673600.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1504673600.git.Qi.Chen@windriver.com>
References: <cover.1504673600.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] python3-pip: extend to nativesdk
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
X-List-Received-Date: Wed, 06 Sep 2017 04:49:38 -0000
Content-Type: text/plain

Extend python3-pip to nativesdk because some nativesdk python3 packages
need it, e.g. nativesdk-python3-django from meta-python layer.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/python/python3-pip_9.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pip_9.0.1.bb b/meta/recipes-devtools/python/python3-pip_9.0.1.bb
index 4456b9b..9b907a2 100644
--- a/meta/recipes-devtools/python/python3-pip_9.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_9.0.1.bb
@@ -53,4 +53,4 @@ RDEPENDS_${PN} = "\
   python3-xmlrpc \
 "
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1



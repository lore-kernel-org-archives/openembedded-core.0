Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E13A26CB91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 03:39:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8Q3dQKs004513
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 20:39:26 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 25 Sep 2013 20:39:25 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Sep 2013 11:39:22 +0800
Message-ID: <3838a4b9743a12245800f174233a334dd22edf82.1380166692.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1380166692.git.jackie.huang@windriver.com>
References: <cover.1380166692.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] packagegroup-self-hosted: add xz to enable bootstrap
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
X-List-Received-Date: Thu, 26 Sep 2013 03:39:25 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

xz is required on the target filesystem since it's needed
to unpack some of the bootstrap packages.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../packagegroups/packagegroup-self-hosted.bb      |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 90ec74e..f499b4a 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -205,6 +205,7 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
     xinetd \
     zip \
     zlib \
+    xz \
     "
 
 
-- 
1.7.4.1



Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A2D3D6D2D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 06:04:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9M649LD016289
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 23:04:09 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 21 Oct 2013 23:04:09 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Oct 2013 14:04:05 +0800
Message-ID: <58deef15f737352489f007488ec2e24bd76be058.1382421718.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1382421718.git.jackie.huang@windriver.com>
References: <cover.1382421718.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] midori: exclude from self-hosted for mips64
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
X-List-Received-Date: Tue, 22 Oct 2013 06:04:07 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

midori depends on webkit-gtk which could not build for mips64.

[YOCTO #5141]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../packagegroups/packagegroup-self-hosted.bb      |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 61c99bc..108e678 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -26,6 +26,10 @@ RDEPENDS_packagegroup-self-hosted = "\
     packagegroup-self-hosted-host-tools \
     "
 
+# midori depends on webkit-gtk which could not build for mips64
+MIDORI = "midori"
+MIDORI_mips64 = ""
+
 RDEPENDS_packagegroup-self-hosted-host-tools = "\
     connman \
     connman-plugin-ethernet \
@@ -45,7 +49,7 @@ RDEPENDS_packagegroup-self-hosted-host-tools = "\
     mc-helpers-perl \
     mc-helpers-python \
     leafpad \
-    midori \
+    ${MIDORI} \
     pcmanfm \
     parted \
     pseudo \
-- 
1.7.4.1



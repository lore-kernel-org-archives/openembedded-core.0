Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UMrGH-0007gN-Pz
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 04:47:50 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r322UcoJ012121
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Apr 2013 19:30:39 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 1 Apr 2013 19:30:39 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Apr 2013 10:30:48 +0800
Message-ID: <be55160b84e74f803f6dce4ba755225538a76651.1364793033.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1364793033.git.Qi.Chen@windriver.com>
References: <cover.1364793033.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/1] core-image-sato.bb: increase free space size
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2013 02:47:50 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Sato images, by default, have about 100M free space. This is not enough
and it blocks automatic testing.

This patch fixes this problem by overriding the IMAGE_OVERHEAD_FACTOR
in the sato image recipe.

[YOCTO #4109]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-sato/images/core-image-sato.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index e3246d2..8df1d08 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -9,3 +9,6 @@ LICENSE = "MIT"
 inherit core-image
 
 IMAGE_INSTALL += "packagegroup-core-x11-sato-games"
+
+# Override IMAGE_OVERHEAD_FACTOR to increase the free space size on sato images.
+IMAGE_OVERHEAD_FACTOR = "2.0"
-- 
1.7.9.5




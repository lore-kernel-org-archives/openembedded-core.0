Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1StEKk-0005Xa-IO
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 10:49:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6N8cEwe005666
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 01:38:14 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 23 Jul 2012 01:38:14 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Jul 2012 16:38:09 +0800
Message-ID: <5e873b2c99606b089ed82777f64049837a30beb0.1343032359.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <cover.1343032359.git.jackie.huang@windriver.com>
References: <cover.1343032359.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] quota 4.00: add DEPENDS gettext-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jul 2012 08:49:42 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

do_install needs command 'msgfmt', it would fail if the command
doesn't exist on the host, add DEPENDS gettext-native to fix this.

[YOCTO #2811]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-extended/quota/quota_4.00.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/quota/quota_4.00.bb b/meta/recipes-extended/quota/quota_4.00.bb
index 5fef9cb..25f6381 100644
--- a/meta/recipes-extended/quota/quota_4.00.bb
+++ b/meta/recipes-extended/quota/quota_4.00.bb
@@ -15,6 +15,8 @@ SRC_URI[sha256sum] = "eb2b045f58b98299edc568b8607b95b10735b4a131fa5196f41c89b51f
 
 S = "${WORKDIR}/quota-tools"
 
+DEPENDS = "gettext-native"
+
 inherit autotools
 
 EXTRA_OEMAKE += 'STRIP=""'
-- 
1.7.4




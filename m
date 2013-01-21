Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1Tx7Ue-00048E-3s
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 03:52:16 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0L2akAd005153
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 20 Jan 2013 18:36:46 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Sun, 20 Jan 2013 18:36:46 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Jan 2013 10:36:39 +0800
Message-ID: <cd18cbf10a7af6691e6b6bd8c16dcca78ec39275.1358735456.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358735456.git.rongqing.li@windriver.com>
References: <cover.1358735456.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Cc: joe.macdonald@windriver.com, martin.jansa@gmail.com
Subject: [PATCH 2/2] bitbake.conf: add tcp-wrappers to default DISTRO_FEATURES_BACKFILL
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
X-List-Received-Date: Mon, 21 Jan 2013 02:52:17 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

tcp-wrappers DISTRO_FEATURES only is used in xinetd currently, but other
packages maybe need it to enable tcp-wrapper support, like vsftpd.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2dc50ca..8894bf8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -738,7 +738,7 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
-DISTRO_FEATURES_BACKFILL = "pulseaudio"
+DISTRO_FEATURES_BACKFILL = "pulseaudio tcp-wrappers"
 DISTRO_FEATURES_append = "${@oe.utils.features_backfill("DISTRO_FEATURES",d)}"
 
 MACHINE_FEATURES_BACKFILL = "rtc"
-- 
1.7.10.4




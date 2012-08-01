Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1SwZqJ-0000TK-8U
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 16:24:07 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q71ECSFe010025
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 07:12:28 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 1 Aug 2012 07:12:28 -0700
From: Morgan Little <morgan.little@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2012 10:12:11 -0400
Message-ID: <1343830340-25351-11-git-send-email-morgan.little@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
References: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/19] time: use new update-alternatives
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
X-List-Received-Date: Wed, 01 Aug 2012 14:24:08 -0000
Content-Type: text/plain


Signed-off-by: Morgan Little <morgan.little@windriver.com>
---
 meta/recipes-extended/time/time.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/time/time.inc b/meta/recipes-extended/time/time.inc
index 8e35843..b7cedac 100644
--- a/meta/recipes-extended/time/time.inc
+++ b/meta/recipes-extended/time/time.inc
@@ -12,7 +12,7 @@
 do_install_append () {
         mv ${D}${bindir}/time ${D}${bindir}/time.${BPN}
 }
 
-ALTERNATIVE_NAME = "time"
-ALTERNATIVE_LINK = "${bindir}/time"
-ALTERNATIVE_PATH = "${bindir}/time.${BPN}"
+ALTERNATIVE_${PN} = "time"
+ALTERNATIVE_LINK_NAME[time] = "${bindir}/time"
+ALTERNATIVE_TARGET[time] = "${bindir}/time.${BPN}"
 ALTERNATIVE_PRIORITY = "100"
-- 
1.7.0.4




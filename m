Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1SwZqH-0000TI-T3
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 16:24:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q71ECR5o008519
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 07:12:27 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 1 Aug 2012 07:12:27 -0700
From: Morgan Little <morgan.little@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2012 10:12:09 -0400
Message-ID: <1343830340-25351-9-git-send-email-morgan.little@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
References: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/19] msmtp: use new update-alternatives
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
X-List-Received-Date: Wed, 01 Aug 2012 14:24:07 -0000
Content-Type: text/plain


Signed-off-by: Morgan Little <morgan.little@windriver.com>
---
 meta/recipes-extended/msmtp/msmtp_1.4.24.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.4.24.bb b/meta/recipes-extended/msmtp/msmtp_1.4.24.bb
index 2d2ee52..08566ca 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.4.24.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.4.24.bb
@@ -5,7 +5,7 @@
 SECTION = "console/network"
 
 LICENSE = "GPLv3"
 DEPENDS = "zlib gnutls"
-PR = "r2"
+PR = "r3"
 
 
 #COPYING or Licence
@@ -21,7 +21,7 @@
 inherit gettext autotools update-alternatives
 
 EXTRA_OECONF += "--without-gnome-keyring"
 
-ALTERNATIVE_NAME = "sendmail"
-ALTERNATIVE_PATH = "${bindir}/msmtp"
-ALTERNATIVE_LINK = "${sbindir}/sendmail"
+ALTERNATIVE_${PN} = "sendmail"
+ALTERNATIVE_TARGET[sendmail] = "${bindir}/msmtp"
+ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
 ALTERNATIVE_PRIORITY = "100"
-- 
1.7.0.4




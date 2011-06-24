Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QaBMI-0008Cf-AW
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 20:44:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5OIeOG3007291
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 11:40:25 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 24 Jun 2011 11:40:24 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jun 2011 13:40:17 -0500
Message-ID: <228c5ed8354ff8554483f9ad4efd75701c4fba92.1308940765.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308940765.git.mark.hatle@windriver.com>
References: <cover.1308940765.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 3/4] msmtp: Disable gnome keyring
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
X-List-Received-Date: Fri, 24 Jun 2011 18:44:02 -0000
Content-Type: text/plain

Unless we explicitly disable the gnome keyring support, the system
will attemp to discover if it's available which changes the package
output.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/msmtp/msmtp_1.4.24.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.4.24.bb b/meta/recipes-extended/msmtp/msmtp_1.4.24.bb
index 39a7eea..7f646f8 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.4.24.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.4.24.bb
@@ -6,7 +6,7 @@ SECTION = "console/network"
 PRIORITY = "required"
 LICENSE = "GPLv3"
 DEPENDS = "zlib gnutls"
-PR = "r1"
+PR = "r2"
 
 
 #COPYING or Licence
@@ -20,6 +20,8 @@ SRC_URI[sha256sum] = "f19f3fcc67da448420b3adbd5add09f8fe110664dd64f3c2cd693ef0cb
 
 inherit gettext autotools update-alternatives
 
+EXTRA_OECONF += "--without-gnome-keyring"
+
 ALTERNATIVE_NAME = "sendmail"
 ALTERNATIVE_PATH = "${bindir}/msmtp"
 ALTERNATIVE_LINK = "${sbindir}/sendmail"
-- 
1.7.3.4




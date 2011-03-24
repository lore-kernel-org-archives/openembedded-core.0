Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q2gze-0001LU-38
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Mar 2011 10:38:14 +0100
Received: by wwi18 with SMTP id 18so6687040wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2011 02:36:22 -0700 (PDT)
Received: by 10.216.90.79 with SMTP id d57mr465755wef.65.1300959381891;
	Thu, 24 Mar 2011 02:36:21 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id b20sm4224420wbb.67.2011.03.24.02.36.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2011 02:36:21 -0700 (PDT)
From: koen@dominion.thruhere.net
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Mar 2011 10:36:12 +0100
Message-Id: <1300959372-27675-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] gnutls: add BBCLASSEXTEND = native
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
X-List-Received-Date: Thu, 24 Mar 2011 09:38:14 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

This is needed for the native recipes in meta-efl

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-support/gnutls/gnutls.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 76f4ca6..a795585 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -3,6 +3,8 @@ HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
 DEPENDS = "zlib lzo gettext libtasn1 libgcrypt (>= 1.4.2)"
 
+BBCLASSEXTEND = "native"
+
 LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN} = "LGPLv2.1+"
 LICENSE_${PN}-xx = "GPLv2.1+"
-- 
1.6.6.1




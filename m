Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3b7g-0004Dd-Hh
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:43:20 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r17NRSq4006203
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:27:28 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:27:25 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:54:22 -0600
Message-ID: <1360281263-23608-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1360281263-23608-1-git-send-email-mark.hatle@windriver.com>
References: <1360281263-23608-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [WR PATCH 1/2] Require git 1.7.7
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
X-List-Received-Date: Thu, 07 Feb 2013 23:43:21 -0000
Content-Type: text/plain

From: Jeff Polk <jeff.polk@windriver.com>

Due to some unique processes that we use, outside of OE-Core, we need
to mandate git 1.7.7 as the older allowed version.  This version contains
a fix that correctly handles reference clones which we use for our
RCPL updates.

Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 scripts/bitbake |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/scripts/bitbake b/scripts/bitbake
index 79a81ea..568a998 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -73,7 +73,8 @@ version_compare() {
 float_test "$TARVERSION > 1.23" && needtar="0"
 
 # Need git >= 1.7.5 for git-remote --mirror=xxx syntax
-version_compare $GITVERSION ">=" 1.7.5 && needgit="0"
+# WR: need git >= 1.7.7 for correct alternates handling
+version_compare $GITVERSION ">=" 1.7.7 && needgit="0"
 
 
 buildpseudo="1"
-- 
1.7.3.4




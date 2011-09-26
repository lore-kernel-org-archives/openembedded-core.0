Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R8Dig-0000hI-Dr
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 18:07:50 +0200
Received: by iadx2 with SMTP id x2so5308614iad.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 09:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=hJa/u3pSRGp7Q050oTz/EnCsQ1CnsISxQcmUJxZBSsA=;
	b=XN/g00or/K5TKyu2qbRHXhwwX5AinijDYdKYSvgcPC7+bg3tZe59OPEe2aO4gv7Lav
	ezv0pigHGN0NCwRSke5cpBZvQfHnBLzXx+SPfHEftt7+SmLcb9eO0vWeZli3x4wc0MaB
	/EoTIY1XdkIPItK5vok/+qxF+6d7+EAs5u4kk=
Received: by 10.42.167.72 with SMTP id r8mr7667094icy.20.1317052932551;
	Mon, 26 Sep 2011 09:02:12 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id t9sm1106839ibq.11.2011.09.26.09.02.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Sep 2011 09:02:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2011 09:01:54 -0700
Message-Id: <1317052914-15572-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] tcp-wrappers: Bump PR to make meta-oe merge upgradable
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
X-List-Received-Date: Mon, 26 Sep 2011 16:07:50 -0000

meta-oe has a version of tcp-wrappers 7.6 recipe
which has virtually no differences with the one from
oe-core. So with this patch we can remove the recipe
from meta-oe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index 3eecd4d..46d9675 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 
 LICENSE = "tcp-wrappers"
 LIC_FILES_CHKSUM = "file://DISCLAIMER;md5=071bd69cb78b18888ea5e3da5c3127fa"
-PR ="r0"
+PR ="r7"
 
 
 PACKAGES = "${PN}-dbg libwrap libwrap-doc libwrap-dev ${PN} ${PN}-doc"
-- 
1.7.5.4




Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7D8737FA1C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 20:55:13 +0000 (UTC)
Received: by p910.zcs.saftware.de (Postfix, from userid 1000)
	id 01837BE4811; Thu,  7 Nov 2019 21:49:52 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 21:49:43 +0100
Message-Id: <20191107204943.17467-3-obi@opendreambox.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191107204943.17467-1-obi@opendreambox.org>
References: <20191107204943.17467-1-obi@opendreambox.org>
Subject: [PATCH 3/3] systemd: Add runtime dependency on new ldconfig package
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
X-List-Received-Date: Thu, 07 Nov 2019 20:55:13 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-core/systemd/systemd_243.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_243.bb b/meta/recipes-core/systemd/systemd_243.bb
index 6e7f95693b..54fcc6a5d1 100644
--- a/meta/recipes-core/systemd/systemd_243.bb
+++ b/meta/recipes-core/systemd/systemd_243.bb
@@ -139,7 +139,7 @@ PACKAGECONFIG[importd] = "-Dimportd=true,-Dimportd=false"
 PACKAGECONFIG[iptc] = "-Dlibiptc=true,-Dlibiptc=false,iptables"
 PACKAGECONFIG[journal-upload] = "-Dlibcurl=true,-Dlibcurl=false,curl"
 PACKAGECONFIG[kmod] = "-Dkmod=true,-Dkmod=false,kmod"
-PACKAGECONFIG[ldconfig] = "-Dldconfig=true,-Dldconfig=false"
+PACKAGECONFIG[ldconfig] = "-Dldconfig=true,-Dldconfig=false,,ldconfig"
 PACKAGECONFIG[libidn] = "-Dlibidn=true,-Dlibidn=false,libidn"
 PACKAGECONFIG[localed] = "-Dlocaled=true,-Dlocaled=false"
 PACKAGECONFIG[logind] = "-Dlogind=true,-Dlogind=false"
-- 
2.17.1



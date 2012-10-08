Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TLGS5-0004lf-RG
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 18:45:09 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 598A9D22BA;
	Mon,  8 Oct 2012 18:32:06 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Oct 2012 18:31:59 +0200
Message-Id: <1349713919-30722-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 2/4] pcmanfm: mark AArch64 as compatible
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
X-List-Received-Date: Mon, 08 Oct 2012 16:45:10 -0000

---
 meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb b/meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb
index 576b4ba..1780764 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb
@@ -13,7 +13,7 @@ DEPENDS_append_poky = " libowl"
 
 PR = "r1"
 
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|mips.*|powerpc.*|sh.*)-(linux|freebsd.*)'
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|aarch64.*|arm.*|mips.*|powerpc.*|sh.*)-(linux|freebsd.*)'
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.gz \
 	   file://gnome-fs-directory.png \
-- 
1.7.10.4




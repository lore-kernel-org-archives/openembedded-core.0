Return-Path: <petter@technux.se>
Received: from vsp-authed-04-02.binero.net (vsp-authed02.binero.net
	[195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id 36FC561FE4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 21:20:26 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-04-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Wed,  7 May 2014 23:20:20 +0200 (CEST)
Received: from eldbvzzwp1-7x.lan (81-229-90-163-no67.tbcn.telia.com
	[81.229.90.163]) (Authenticated sender: petter@technux.se)
	by smtp-10-01.atm.binero.net (Postfix) with ESMTPSA id B638F3A145;
	Wed,  7 May 2014 23:20:15 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 May 2014 23:19:57 +0200
Message-Id: <e084b39c02b2aae6834a69a0396cd557722f33cf.1399497346.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <b481b46603ad2ee97a9cc55890293e24db85b8e7.1399497346.git.petter@technux.se>
References: <b481b46603ad2ee97a9cc55890293e24db85b8e7.1399497346.git.petter@technux.se>
In-Reply-To: <cover.1399497346.git.petter@technux.se>
References: <cover.1399497346.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCH 11/13] u-boot: remove unused FILESPATH
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
X-List-Received-Date: Wed, 07 May 2014 21:20:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes [YOCTO #4497]

Usage of FILESPATH is discouraged, since it can make recipes harder to
bbappend. Instead FILESEXTRAPATHS should be used to extend the path.
However in u-boot no FILESPATH additions are currently needed so
instead it should be removed.

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 meta/recipes-bsp/u-boot/u-boot.inc |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index cb50949..d826a40 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -65,7 +65,6 @@ do_install () {
 }
 
 FILES_${PN} = "/boot ${sysconfdir}"
-FILESPATH =. "${FILE_DIRNAME}/u-boot-git/${MACHINE}:"
 
 do_deploy () {
     install -d ${DEPLOYDIR}
-- 
1.7.9.5



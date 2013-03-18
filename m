Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UHPiQ-0007Lq-GS
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 03:22:44 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I2EYqi024771; Mon, 18 Mar 2013 02:14:36 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QZeRf81D95TS; Mon, 18 Mar 2013 02:14:36 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I2ETgp024753
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 18 Mar 2013 02:14:31 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UHPRv-0003VZ-JF; Mon, 18 Mar 2013 02:05:19 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2013 02:05:08 +0000
Message-Id: <1363572312-13399-10-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363572312-13399-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1363572312-13399-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 10/13] libfakekey: Update to new revision to fix ${B} != ${S} issues
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
X-List-Received-Date: Mon, 18 Mar 2013 02:22:59 -0000

Upgrade to new upstream revision which includes out of tree build
fixes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/libfakekey/libfakekey_git.bb |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/libfakekey/libfakekey_git.bb b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
index 6109ea0..b72f911 100644
--- a/meta/recipes-graphics/libfakekey/libfakekey_git.bb
+++ b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
@@ -10,9 +10,8 @@ LIC_FILES_CHKSUM = "file://src/libfakekey.c;endline=30;md5=602b5ccd48f6440751086
 DEPENDS = "libxtst"
 SECTION = "x11/wm"
 
-SRCREV = "e8c2e412ea4a417afc1f30e32cb7bdc508b1dccc"
+SRCREV = "e327ff049b8503af2dadffa84370a0860b9fb682"
 PV = "0.0+git${SRCPV}"
-PR = "r0"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
 
-- 
1.7.10.4




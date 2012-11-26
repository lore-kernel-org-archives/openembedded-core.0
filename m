Received: from nat-lmt.mentorg.com ([139.181.28.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <noor_ahsan@mentor.com>) id 1TcvaS-00068m-BC
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 11:06:48 +0100
Received: from pkl-ahsann-ubuntu.mgc.mentorg.com ([137.202.157.70])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id qAQ8NUFE012285;
	Mon, 26 Nov 2012 02:23:32 -0600
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Nov 2012 13:23:17 +0500
Message-Id: <1353918197-17776-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: =?UTF-8?B?W1BBVENIXSBzeXNwcm9mOiBGaXhlcyB1bmRlZmluZWTigIIgcmVmZXJlbmNlIHRv4oCCYHJtYic=?=
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
X-List-Received-Date: Mon, 26 Nov 2012 10:06:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Noor Ahsan <noor_ahsan@mentor.com>

* Recipe already contains a patch for mips arch but not for mips64.
For mips64 arch 'mips' was not available in OVERRIDES, rather mips64
was there. So added the same patch for mips64 arch using mips64.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 meta/recipes-kernel/sysprof/sysprof_git.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
index bd34f00..64414c0 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://git.gnome.org/sysprof;protocol=git \
 
 SRC_URI_append_arm  = " file://rmb-arm.patch"
 SRC_URI_append_mips = " file://rmb-mips.patch"
+SRC_URI_append_mips64 = " file://rmb-mips.patch"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5




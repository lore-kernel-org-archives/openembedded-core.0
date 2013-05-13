Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1Ubp2f-0006oW-HI
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 11:27:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4D99QVT011951
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 02:09:26 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 13 May 2013 02:09:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 May 2013 05:09:20 -0400
Message-ID: <94a28fe791cf7f0f1337d439e970c939632cc501.1368425946.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1368425946.git.liezhi.yang@windriver.com>
References: <cover.1368425946.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] defaultsetup.conf: remove INHERIT_INSANE
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
X-List-Received-Date: Mon, 13 May 2013 09:27:41 -0000
Content-Type: text/plain

The insane has been inherited by package.bbclass and becomes a
requirement, so we can remove it from defaultsetup.conf.

Note:
You can decide whether to take this patch or not.

[YOCTO #3190]
[YOCTO #4396]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/distro/defaultsetup.conf |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index be28510..5557350 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -17,7 +17,6 @@ CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE'
 
 USER_CLASSES ?= ""
 PACKAGE_CLASSES ?= "package_ipk"
-INHERIT_INSANE ?= "insane"
 INHERIT_DISTRO ?= "debian devshell sstate license"
-INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_INSANE} ${INHERIT_DISTRO}"
+INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO}"
 
-- 
1.7.10.4




Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UAGz8-0000z1-La
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 10:38:07 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q9Ll5J024723
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 01:21:47 -0800 (PST)
Received: from pek-usp-3.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.328.9;
	Tue, 26 Feb 2013 01:21:46 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 17:24:39 +0800
Message-ID: <15dffc97a79d24f6f7b60c986dfe1e9e708990f4.1361862860.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1361862860.git.liezhi.yang@windriver.com>
References: <cover.1361862860.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH 6/7] e2fsprogs: ship mkfsdebug.sh
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
X-List-Received-Date: Tue, 26 Feb 2013 09:38:10 -0000
Content-Type: text/plain

Ship mkfsdebug.sh, it will be installed to /usr/bin/mkfsdebug.sh and
used for replacing the genext2fs in image_types.bbclass.

[YOCTO #3848]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
index 70255ce..1609d42 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
@@ -4,6 +4,7 @@ PR = "r0"
 
 SRC_URI += "file://acinclude.m4 \
             file://remove.ldconfig.call.patch \
+            file://mkdebugfs.sh \
 "
 
 SRCREV = "fca8b1b2416c384b91b4fe00d6d37cfccb8fb3d5"
@@ -41,6 +42,7 @@ do_install_append () {
 		mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
 		mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
 	fi
+	install -m 0755 ${WORKDIR}/mkdebugfs.sh ${D}${bindir}
 }
 
 RDEPENDS_e2fsprogs = "e2fsprogs-badblocks"
-- 
1.7.11.2




Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2331071E63
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 03:23:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0J3N5dD028186
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 19:23:05 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Jan 2016 19:23:04 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jan 2016 19:23:02 -0800
Message-ID: <e7e5a178e659e50d3d611a9b3c45259afc14de3e.1453173729.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1453173729.git.liezhi.yang@windriver.com>
References: <cover.1453173729.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] e2fsprogs: add PACKAGECONFIG for fuse
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
X-List-Received-Date: Tue, 19 Jan 2016 03:23:05 -0000
Content-Type: text/plain

Fixed:
e2fsprogs-1.42+1.43-gitAUTOINC+0f26747167: e2fsprogs rdepends on fuse, but it isn't a build dependency? [build-deps]

The fuse is in meta-filesystems layer.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
index 0aab8ae..b1b7931 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
@@ -17,6 +17,9 @@ EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
 
 EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[fuse] = '--enable-fuse2fs,--disable-fuse2fs,fuse'
+
 do_configure_prepend () {
 	cp ${WORKDIR}/acinclude.m4 ${S}/
 }
-- 
1.7.9.5



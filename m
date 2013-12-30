Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D29C16B0E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 03:35:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBU3ZElr018270
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2013 19:35:15 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 29 Dec 2013 19:35:14 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 29 Dec 2013 22:34:54 -0500
Message-ID: <572fdf2a983c4f51e67242e3e4c1cc06e7d35545.1388369850.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1388369850.git.liezhi.yang@windriver.com>
References: <cover.1388369850.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/14] libid3tag: remove unrecognised option
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
X-List-Received-Date: Mon, 30 Dec 2013 03:35:14 -0000
Content-Type: text/plain

There is no --enable-speed in libid3tag's configure, but in libmad, and
it's already there, so remove it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
index d81f58b..38d42b0 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
+++ b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
@@ -20,5 +20,3 @@ SRC_URI[sha256sum] = "63da4f6e7997278f8a3fef4c6a372d342f705051d1eeb6a46a86b03610
 S = "${WORKDIR}/libid3tag-${PV}"
 
 inherit autotools pkgconfig
-
-EXTRA_OECONF = "-enable-speed"
-- 
1.7.10.4



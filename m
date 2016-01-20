Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AF7157316D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 02:27:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0K2RLp3015518
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 18:27:21 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Jan 2016 18:27:21 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jan 2016 18:27:20 -0800
Message-ID: <4b7c55bccc71648ef3c78ae4a934e05b423e78ea.1453255442.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1453255442.git.liezhi.yang@windriver.com>
References: <cover.1453255442.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] e2fsprogs: set PV to 1.42.99+1.43+git${SRCPV}
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
X-List-Received-Date: Wed, 20 Jan 2016 02:27:23 -0000
Content-Type: text/plain

As Martin and Ross suggested.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
index 60b2854..ea26145 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
@@ -9,7 +9,7 @@ SRC_URI += "file://acinclude.m4 \
 "
 
 SRCREV = "0f26747167cc9d82df849b0aad387bf824f04544"
-PV = "1.42.13+git${SRCPV}"
+PV = "1.42.99+1.43+git${SRCPV}"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
                 --enable-elf-shlibs --disable-libuuid --disable-uuidd \
-- 
1.7.9.5



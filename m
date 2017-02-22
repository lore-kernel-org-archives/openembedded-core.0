Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7BA9572FD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 01:44:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1M1iYo6012165
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 17:44:35 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 21 Feb 2017 17:44:34 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Feb 2017 17:44:28 -0800
Message-ID: <24948f202577694893cff35a87c29dc11a06a561.1487727826.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1487727826.git.liezhi.yang@windriver.com>
References: <cover.1487727826.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] slang: 2.3.1 -> 2.3.1a
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
X-List-Received-Date: Wed, 22 Feb 2017 01:44:33 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/slang/{slang_2.3.1.bb => slang_2.3.1a.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/slang/{slang_2.3.1.bb => slang_2.3.1a.bb} (93%)

diff --git a/meta/recipes-extended/slang/slang_2.3.1.bb b/meta/recipes-extended/slang/slang_2.3.1a.bb
similarity index 93%
rename from meta/recipes-extended/slang/slang_2.3.1.bb
rename to meta/recipes-extended/slang/slang_2.3.1a.bb
index 7bf3af6836f..9326205f068 100644
--- a/meta/recipes-extended/slang/slang_2.3.1.bb
+++ b/meta/recipes-extended/slang/slang_2.3.1a.bb
@@ -22,8 +22,8 @@ SRC_URI = "http://www.jedsoft.org/releases/${BPN}/${BP}.tar.bz2 \
            file://no-x.patch \
           "
 
-SRC_URI[md5sum] = "bd46d1dc17a50c72004ad842829d7b1f"
-SRC_URI[sha256sum] = "a810d5da7b0c0c8c335393c6b4f12884be6fa7696d9ca9521ef21316a4e00f9d"
+SRC_URI[md5sum] = "c5235313042ed0e71ec708f7b85ec241"
+SRC_URI[sha256sum] = "54f0c3007fde918039c058965dffdfd6c5aec0bad0f4227192cc486021f08c36"
 
 UPSTREAM_CHECK_URI = "http://www.jedsoft.org/releases/slang/"
 PREMIRRORS_append = "\n http://www.jedsoft.org/releases/slang/.* http://www.jedsoft.org/releases/slang/old/ \n"
-- 
2.11.0.rc2.dirty



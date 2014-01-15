Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 02D786B4F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 06:51:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0F6paql000190
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 22:51:36 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 14 Jan 2014 22:51:35 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Jan 2014 14:51:34 +0800
Message-ID: <88e97c2d22d5289b4be49c0b7bb57295d959bfa7.1389768606.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1389768606.git.Qi.Chen@windriver.com>
References: <cover.1389768606.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libtool: remove the unrecognized configure option
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
X-List-Received-Date: Wed, 15 Jan 2014 06:51:35 -0000
Content-Type: text/plain

Remove the unrecognized configure option '--with-sysroot' to avoid
build time warnings.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/libtool/libtool-2.4.2.inc |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
index 5a67eeb9..d26982d 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
@@ -49,5 +49,3 @@ FILES_libltdl = "${libdir}/libltdl${SOLIBS}"
 FILES_libltdl-dev = "${libdir}/libltdl${SOLIBSDEV} ${includedir}"
 FILES_libltdl-staticdev = "${libdir}/libltdl.a"
 FILES_libltdl-dbg = "${libdir}/.debug/"
-
-EXTRA_OECONF = "--with-sysroot"
-- 
1.7.9.5



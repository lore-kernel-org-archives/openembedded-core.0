Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FC7472603
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 09:20:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0E9Kgkq007581
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 01:20:42 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 01:20:41 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 01:20:37 -0800
Message-ID: <774aa51b8032c4e609ecd4e8cd07890912cd1a20.1421227202.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421227202.git.liezhi.yang@windriver.com>
References: <cover.1421227202.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] quilt: set CLEANBROKEN
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
X-List-Received-Date: Wed, 14 Jan 2015 09:20:48 -0000
Content-Type: text/plain

Fix when rebuild:
| DEBUG: Executing shell function autotools_preconfigure
| Please run ./configure
| make: *** [Makefile] Error 1

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/quilt/quilt-0.63.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/quilt/quilt-0.63.inc b/meta/recipes-devtools/quilt/quilt-0.63.inc
index 433d6b4..220a3bc 100644
--- a/meta/recipes-devtools/quilt/quilt-0.63.inc
+++ b/meta/recipes-devtools/quilt/quilt-0.63.inc
@@ -19,6 +19,8 @@ EXTRA_OECONF_darwin += "--without-date \
                         --without-getopt \
                         "
 
+CLEANBROKEN = "1"
+
 PACKAGES += "guards guards-doc"
 FILES_${PN} = "${sysconfdir} ${datadir}/quilt \
                ${bindir}/quilt ${libdir}/quilt"
-- 
1.7.9.5



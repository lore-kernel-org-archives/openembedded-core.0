Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E916E72D84
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 06:52:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0S6qVNm008462
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 22:52:31 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 27 Jan 2015 22:52:31 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Jan 2015 22:52:25 -0800
Message-ID: <4c52f4300a23288914a6a069ca05a0d19adf12fa.1422427700.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422427700.git.liezhi.yang@windriver.com>
References: <cover.1422427700.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/12] latencytop: fix SRC_URI and HOMEPAGE
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
X-List-Received-Date: Wed, 28 Jan 2015 06:52:31 -0000
Content-Type: text/plain

Fixed:
WARNING: Failed to fetch URL http://www.latencytop.org/download/latencytop-0.5.tar.gz, attempting MIRRORS if available

Its homepage is also down, but can't find a proper one atm.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/latencytop/latencytop_0.5.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/latencytop/latencytop_0.5.bb b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
index e910a96..cb0a3c5 100644
--- a/meta/recipes-kernel/latencytop/latencytop_0.5.bb
+++ b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
@@ -8,7 +8,7 @@ DEPENDS = "virtual/libintl ncurses glib-2.0"
 
 PR = "r3"
 
-SRC_URI = "http://www.latencytop.org/download/latencytop-${PV}.tar.gz \
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.tar.gz/73bb3371c6ee0b0e68e25289027e865c/${BP}.tar.gz \
             file://latencytop-makefile.patch \
             file://latencytop-fsync.patch"
 
-- 
1.7.9.5



Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RHAOk-0003FZ-Tj
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 10:24:14 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so4820551bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 01:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=LMaZGZK1PYgJIZ84qpCIVQ52rsn2HeZ7/vZL02RuvgU=;
	b=nhl4EvURTbBi+r2D3hcWtgDDyCbIPVr5Nak69JUf2PpC5xXnFtfN9CIK0qmthvyOBU
	d0m2OqEyzXbr32YR/hWhAisc+5lJ517WIojSbHOnTmp1nqhlA1hrw8LIr/13NvcDgIMZ
	sGPJrToJj6orHp8Bd9Aizwq3JV0m6fLrTfXP0=
Received: by 10.204.141.219 with SMTP id n27mr9785443bku.70.1319185097004;
	Fri, 21 Oct 2011 01:18:17 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u10sm12536337bkv.3.2011.10.21.01.18.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 01:18:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2011 10:17:29 +0200
Message-Id: <8e72dc599ba79e6d6b289865f8458fe69d88ec7b.1319184832.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bfd27053f71157d3f3d3c0bf523015347714d3f8.1319184832.git.Martin.Jansa@gmail.com>
References: <bfd27053f71157d3f3d3c0bf523015347714d3f8.1319184832.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1319184832.git.Martin.Jansa@gmail.com>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
Subject: [PATCH 6/8] neon: add native support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Oct 2011 08:24:15 -0000

* needed for native subversion

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/neon/neon_0.29.5.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/neon/neon_0.29.5.bb b/meta/recipes-support/neon/neon_0.29.5.bb
index 8201ffe..34c7253 100644
--- a/meta/recipes-support/neon/neon_0.29.5.bb
+++ b/meta/recipes-support/neon/neon_0.29.5.bb
@@ -5,9 +5,12 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://src/COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a \
                     file://src/ne_utils.h;beginline=1;endline=20;md5=2caca609538eddaa6f6adf120a218037"
 DEPENDS = "zlib libxml2 expat time gnutls libproxy"
+DEPENDS_virtclass-native = "zlib-native libxml2-native expat-native gnutls-native"
 
 PR = "r1"
 
+BBCLASSEXTEND = "native"
+
 SRC_URI = "http://www.webdav.org/${BPN}/${BPN}-${PV}.tar.gz \
            file://pkgconfig.patch"
 
-- 
1.7.7




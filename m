Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RHAOV-0003FZ-J1
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 10:23:59 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so4820551bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 01:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=BL4dkXkb/0DxDQ+eL4pZbYTGWz8EeukKNCr/a7R4JAw=;
	b=SmhTGJXef7AFieDedgNOpHMc/+aJhGjWTEYHTcZkRiyd0/MmGTnQqHRGgUMWZ3JR9S
	2sA+VHy2EyzeA7csCtIdpNE7co7qF+2lB9MGJwL+FAges+zQedzQTHuTcesxMLAPNqSn
	fm5zcZrnGeLA7wHlV8pTSAhLsZsrFkDtx2sew=
Received: by 10.204.130.208 with SMTP id u16mr10032775bks.47.1319185088673;
	Fri, 21 Oct 2011 01:18:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r12sm12528230bkw.5.2011.10.21.01.18.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 01:18:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2011 10:17:28 +0200
Message-Id: <b086549eaf7eaa2ed59f40fee7c5b0d9c10f3ff9.1319184832.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bfd27053f71157d3f3d3c0bf523015347714d3f8.1319184832.git.Martin.Jansa@gmail.com>
References: <bfd27053f71157d3f3d3c0bf523015347714d3f8.1319184832.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1319184832.git.Martin.Jansa@gmail.com>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/8] apr: add native support
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
X-List-Received-Date: Fri, 21 Oct 2011 08:23:59 -0000

* needed for native subversion

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/apr/apr_1.4.5.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/apr/apr_1.4.5.bb b/meta/recipes-support/apr/apr_1.4.5.bb
index 173402a..be465b4 100644
--- a/meta/recipes-support/apr/apr_1.4.5.bb
+++ b/meta/recipes-support/apr/apr_1.4.5.bb
@@ -6,6 +6,8 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0c35ff3c4c83b89d2f076e315caac28b \
                     file://include/apr_lib.h;endline=17;md5=ee42fa7575dc40580a9e01c1b75fae96"
 
+BBCLASSEXTEND = "native"
+
 PR = "r1"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
-- 
1.7.7




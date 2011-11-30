Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVtC7-00031I-MY
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 00:04:03 +0100
Received: by mail-bw0-f47.google.com with SMTP id zv15so839230bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 14:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=rbAsl3m6qU90R8UtQqAA/6auaU6MBCD959Xu0XC/AcA=;
	b=WmQoJMUTby1Rs42HXv9zbWl2NPd+VXCwUnymHer9BvMRqxpF/ZniM7rmfDy4SI3ycL
	nL/1/9PIZVSXxtJrYk0dJw+j//g3Nla3fNnpfkuo01OmltgKAX8UnW7u9mLhGGarvaQm
	qbqiys633PVA2/3g3UbKIlyRfnyMC6Q6tnydM=
Received: by 10.204.10.81 with SMTP id o17mr4317020bko.65.1322693844725;
	Wed, 30 Nov 2011 14:57:24 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e18sm7115197bkr.15.2011.11.30.14.57.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 14:57:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 23:57:00 +0100
Message-Id: <7c47d742cb8a5caeac9ac4488ba2965be9169451.1322693708.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <6d1a17a6a97b72caa8790538af19ba2c942c91ff.1322693708.git.Martin.Jansa@gmail.com>
References: <6d1a17a6a97b72caa8790538af19ba2c942c91ff.1322693708.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322693708.git.Martin.Jansa@gmail.com>
References: <cover.1322693708.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 2/3] squashfs-tools: fix PR, those should start with 'r'
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
X-List-Received-Date: Wed, 30 Nov 2011 23:04:03 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../squashfs-tools/squashfs-tools_4.2.bb           |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
index 6691797..a2ed8ba 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://../../7zC.txt;beginline=12;endline=16;md5=2056cd6d919ebc3807602143c7449a7c \
                    "
 DEPENDS = "attr zlib xz"
-PR = "0"
+PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/squashfs/squashfs${PV}.tar.gz;name=squashfs \
            http://downloads.sourceforge.net/sevenzip/lzma465.tar.bz2;name=lzma \
-- 
1.7.8.rc4




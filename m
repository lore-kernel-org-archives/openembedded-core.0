Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 156F8719A1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 05:54:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u935sjKB014703
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 2 Oct 2016 22:54:45 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 2 Oct 2016 22:54:44 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 3 Oct 2016 01:54:34 -0400
Message-ID: <06d20117c2c18d34adcd5b8d1da244d25decacd2.1475473494.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1475473494.git.bruce.ashfield@windriver.com>
References: <cover.1475473494.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] linux-libc-headers: update to 4.8 final
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
X-List-Received-Date: Mon, 03 Oct 2016 05:54:45 -0000
Content-Type: text/plain

We've been using a -rc4 variant of the libc-headers, now that
4.8 has been released, we switch to the final tgz of the headers.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb
index f80f02cb1896..77e0870d326f 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb
@@ -1,7 +1,6 @@
 require linux-libc-headers.inc
 
-SRC_URI_forcevariable = "${KERNELORG_MIRROR}/linux/kernel/v${HEADER_FETCH_VER}/testing/linux-4.8-rc4.tar.${KORG_ARCHIVE_COMPRESSION}"
-PV = "4.8-rc4"
+PV = "4.8"
 
 SRC_URI_append_libc-musl = "\
     file://0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch \
@@ -9,5 +8,5 @@ SRC_URI_append_libc-musl = "\
     file://0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch \
    "
 
-SRC_URI[md5sum] = "269067213995c7742730ce53b8140c90"
-SRC_URI[sha256sum] = "8f07a0d76a7d1a30490582ba9642b7f28370102bc4acc4bb4b2586c8eabf4447"
+SRC_URI[md5sum] = "c1af0afbd3df35c1ccdc7a5118cd2d07"
+SRC_URI[sha256sum] = "3e9150065f193d3d94bcf46a1fe9f033c7ef7122ab71d75a7fb5a2f0c9a7e11a"
-- 
2.5.0



Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 08E3C6FFEA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 09:23:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 587A4264C4C
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Dec 2015 09:23:47 +0000
Message-Id: <81ce23956c7c609f6e6c2f264236970a5c2d9e6b.1449134546.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <cover.1449134546.git.joshua.lock@collabora.co.uk>
References: <cover.1449134546.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1449134546.git.joshua.lock@collabora.co.uk>
References: <cover.1449134546.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v2 2/3] connman-conf: mark as allarch
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
X-List-Received-Date: Thu, 03 Dec 2015 09:23:53 -0000

This recipe just installs some data files and thus is architecture
independent and doesn't require a compiler and libc in its DEPENDS.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-connectivity/connman/connman-conf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
index bef9237..4c6a2d2 100644
--- a/meta/recipes-connectivity/connman/connman-conf.bb
+++ b/meta/recipes-connectivity/connman/connman-conf.bb
@@ -4,7 +4,7 @@ network interface for a qemu machine."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
-inherit systemd
+inherit systemd allarch
 
 SRC_URI_append_qemuall = " file://wired.config \
                            file://wired-setup \
-- 
2.4.3



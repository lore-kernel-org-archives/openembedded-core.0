Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 21DA760043
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 08:44:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4B8i4tC003545
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 01:44:04 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 11 May 2015 01:44:04 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 May 2015 01:44:03 -0700
Message-ID: <dfce4dd86f9146f5fa403110b2c3c7848a0d0042.1431333353.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1431333353.git.liezhi.yang@windriver.com>
References: <cover.1431333353.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] alsa-tools: set CLEANBROKEN
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
X-List-Received-Date: Mon, 11 May 2015 08:44:04 -0000
Content-Type: text/plain

Fixed:
make[1]: Entering directory `alsa-tools-1.0.28/envy24control'
make[1]: *** No rule to make target `clean'.  Stop.

There is no "make clean" in envy24control when DISTRO_FEATURES is
changed from no-x11 to x11.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-multimedia/alsa/alsa-tools_1.0.28.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.28.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.28.bb
index 4b9509e..d684225 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.28.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.28.bb
@@ -18,6 +18,8 @@ SRC_URI[sha256sum] = "76e59711c6d0f39cbddce83ce1ed8da00bad112fee021f94fa990d8685
 
 inherit autotools-brokensep pkgconfig
 
+CLEANBROKEN = "1"
+
 EXTRA_OEMAKE += "GITCOMPILE_ARGS='--host=${HOST_SYS} --build=${BUILD_SYS} --target=${TARGET_SYS} --with-libtool-sysroot=${STAGING_DIR_HOST} --prefix=${prefix}'"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
-- 
1.7.9.5



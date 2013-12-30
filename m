Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A8C06B0E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 03:35:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBU3ZAFJ025952
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2013 19:35:10 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 29 Dec 2013 19:35:08 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 29 Dec 2013 22:34:51 -0500
Message-ID: <e9fa1626d94e6c65471dbdfd2fbe694afd24c960.1388369850.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1388369850.git.liezhi.yang@windriver.com>
References: <cover.1388369850.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/14] alsa-lib: remove unrecognised options
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
X-List-Received-Date: Mon, 30 Dec 2013 03:35:10 -0000
Content-Type: text/plain

Remove --with-cards and --with-oss, they are never in alsa-lib, but in
alsa-driver, and the --with-cards had also been dropped from
alsa-driver.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
index 0e1ea76..0087faf 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
@@ -27,7 +27,7 @@ inherit autotools pkgconfig
 require alsa-fpu.inc
 EXTRA_OECONF += "${@get_alsa_fpu_setting(bb, d)} "
 
-EXTRA_OECONF = "--with-cards=pdaudiocf --with-oss=yes --disable-python"
+EXTRA_OECONF = "--disable-python"
 
 EXTRA_OECONF_append_libc-uclibc = " --with-versioned=no "
 
-- 
1.7.10.4



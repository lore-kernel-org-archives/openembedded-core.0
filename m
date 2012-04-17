Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SKAkK-0002aH-EB
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 17:55:12 +0200
Received: by mail-ob0-f175.google.com with SMTP id eq6so2643545obc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 08:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=V7JDd74SztfEU5QlIBC88q4izoKOtRxBQn6QT5q3HjI=;
	b=wB4Ox09PKBiOXrdviTwNqmZSbNixUvKz2RqHNqOAM8/PtYHghfYM3QwghGt13p+hs1
	9DB2tvnoG40xay6Wm+6a2exvUmVsFuBhJxYAUstiAWSNI3jgbMUxTZWZ/tQ14wSmx8eK
	Y4O4hPXakZEu/SRvyst2qr9FT+g16nO8Jm/enTJ8XRSmRQQ5adNMRs2F5CraLwyFER6r
	EqKD2hxO567sd4RzDra0w0J5MvxJ061abBbglvafw4GrJZ4LJhQBegwa+vcvx3CDO+Zk
	152//0GlvsEj5FBtnvLkJ5vDVn31fJu8D9R3eSU+CHXapAq8oA7zavPIpX6uSjGsHpjD
	SZSA==
Received: by 10.182.36.3 with SMTP id m3mr22224527obj.8.1334677548227;
	Tue, 17 Apr 2012 08:45:48 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id w4sm18810371oeg.12.2012.04.17.08.45.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 08:45:47 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2012 10:45:15 -0500
Message-Id: <2d145b6d4107366ab4321e5470eadabb68676df5.1334677440.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1334677440.git.kergoth@gmail.com>
References: <cover.1334677440.git.kergoth@gmail.com>
In-Reply-To: <cover.1334677440.git.kergoth@gmail.com>
References: <cover.1334677440.git.kergoth@gmail.com>
Subject: [PATCH 5/6] external-csl-toolchain: silence .a/.debug QA warnings
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
X-List-Received-Date: Tue, 17 Apr 2012 15:55:12 -0000

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-core/meta/external-csl-toolchain.bb |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/meta/external-csl-toolchain.bb b/meta/recipes-core/meta/external-csl-toolchain.bb
index bafa331..fb553ab 100644
--- a/meta/recipes-core/meta/external-csl-toolchain.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain.bb
@@ -90,9 +90,8 @@ external_toolchain_sysroot_adjust() {
 
 PACKAGES =+ "libgcc libgcc-dev libstdc++ libstdc++-dev libstdc++-staticdev linux-libc-headers linux-libc-headers-dev gdbserver gdbserver-dbg"
 
-INSANE_SKIP_libgcc = "1"
-INSANE_SKIP_libstdc++ = "1"
-INSANE_SKIP_gdbserver = "1"
+# This test should be fixed to ignore .a files in .debug dirs
+INSANE_SKIP_${PN}-dbg = "staticdev"
 
 PKG_${PN} = "eglibc"
 PKG_${PN}-dev = "eglibc-dev"
-- 
1.7.7




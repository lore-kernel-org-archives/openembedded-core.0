Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SJsvd-00057o-GA
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 22:53:42 +0200
Received: by yenm3 with SMTP id m3so2778285yen.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 13:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=V7JDd74SztfEU5QlIBC88q4izoKOtRxBQn6QT5q3HjI=;
	b=tBymRjFF4ceuiZPrr7370TlxX85A48TW9hY/fx6xtpw73vDYbbVg5qpTSkHb5maZsb
	zPNTesS+Tcmrbu8T7+VeAvnPoZUIUUbvuV9xni8j/JXdCh7ozyEbfO3caUjqdxwk4AXr
	R+a6pG4qgg7uQSsitvmv2JhQzxzT8m20P+46kjFGYHmY68zKh0TLOoiDJ4zOIeExcLzf
	pDTwdK/9HVh2b/7XdenbZ0LUJ3YpmVVCz5XYO9IcUJCOiknH/KjPy0Vi1pNJ0qXPsKn1
	YoLrr7gvbKqg3SefcIheV56em60UP5Gs9yRsSlb4uzMrOjOWUe4sF0WdNK8dWM2ko9Jp
	2oKg==
Received: by 10.60.10.137 with SMTP id i9mr18903948oeb.23.1334609054596;
	Mon, 16 Apr 2012 13:44:14 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id hh2sm20659762obb.1.2012.04.16.13.44.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 13:44:14 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2012 15:44:02 -0500
Message-Id: <2d145b6d4107366ab4321e5470eadabb68676df5.1334608810.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <ce2d88eb2d575a0459aa2c7cf725b6f890909515.1334608810.git.kergoth@gmail.com>
References: <ce2d88eb2d575a0459aa2c7cf725b6f890909515.1334608810.git.kergoth@gmail.com>
In-Reply-To: <cover.1334608810.git.kergoth@gmail.com>
References: <cover.1334608810.git.kergoth@gmail.com>
Subject: [PATCH 5/7] external-csl-toolchain: silence .a/.debug QA warnings
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
X-List-Received-Date: Mon, 16 Apr 2012 20:53:44 -0000

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




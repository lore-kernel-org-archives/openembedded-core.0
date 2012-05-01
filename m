Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SPFcB-0000k0-Js
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 18:07:47 +0200
Received: by qabg1 with SMTP id g1so2420088qab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 08:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=V7JDd74SztfEU5QlIBC88q4izoKOtRxBQn6QT5q3HjI=;
	b=U48vHywgW3gIQY1sHiUc5rK563DT/Qh+UrHoRVoi+B3xP3Cm3gbbn585ZV54gQ72Yy
	sjX1TkMSeDHs4x5rYbmCPFYLAv1Qd5zDnZK5XlcewBehxCbcggmHZYjNGutpfrlnevTl
	oliBlry1YbwDsFq6GRpDWIrCtFSCw+1A4SZyTBbsggUIG0dEgbVaM50/mgYjaB7RqKEi
	e7XPw5+dL6usk1Q4tfrKlp0qplAkno5SIUZvCU+i3ksccZZ2/W81lJqLKjkmuTr5GiP5
	3Mcqb9aYfKDvW6kcg0YH+xQlq0kvnPIIXcwDhIgVomp0d3njOdyLFKTGUskBJ7QzrqTM
	nU9w==
Received: by 10.60.4.199 with SMTP id m7mr33461090oem.65.1335887884072;
	Tue, 01 May 2012 08:58:04 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id h7sm16733267oeh.9.2012.05.01.08.58.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 08:58:03 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 May 2012 10:58:21 -0500
Message-Id: <d7ac0d8eb3c97638933bb4704e705c1865eb03f6.1335887732.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1335887732.git.kergoth@gmail.com>
References: <cover.1335887732.git.kergoth@gmail.com>
In-Reply-To: <cover.1335887732.git.kergoth@gmail.com>
References: <cover.1335887732.git.kergoth@gmail.com>
Subject: [PATCH 3/8] external-csl-toolchain: silence .a/.debug QA warnings
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
X-List-Received-Date: Tue, 01 May 2012 16:07:47 -0000

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




Received: from mail-bk0-f50.google.com ([209.85.214.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U2l7e-0003zp-FT
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 17:11:51 +0100
Received: by mail-bk0-f50.google.com with SMTP id jg9so152977bkc.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 07:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=rue3fZbrxasmekOH7NXd/xIQsZDmPDV2qg/tZdFJHIs=;
	b=0HMdvFJX1kM2r4bnCENNPiZttRJQ0HPhgZOfTyqMYsZanlFNFllGUJPn7BJlxuo9p5
	u6lR2RSziZG9f6pm8Rp/gBm5wKsqDeQcfqIW7glo7nm1p6DmkxuVE/e5D/dHDWMq30b7
	oULGshBa4Wte9LF+k4mnI/oK6Ayw8WIF5U+S/nd/2aBSyJKDtD/TQKhcHaunoabPgCVL
	3x1o771STgetOiBMXXAxCvMgxobu9T+P38CduM1bHCciFzax7XyoEZf7VL9cK/hNKWUQ
	jqjXYDZ+LhzqjIqOzJRLIEpmO/NVGpA3DJHRQ4eSJs066195eYOx2JV9vF/r4/ojQqHg
	FB+A==
X-Received: by 10.204.156.8 with SMTP id u8mr698266bkw.78.1360079760848;
	Tue, 05 Feb 2013 07:56:00 -0800 (PST)
Received: from s42.loc (91-119-139-175.dynamic.xdsl-line.inode.at.
	[91.119.139.175])
	by mx.google.com with ESMTPS id hc16sm6744890bkc.2.2013.02.05.07.55.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 07:55:59 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.80)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1U2ksG-0004XP-N5; Tue, 05 Feb 2013 16:55:56 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 16:55:43 +0100
Message-Id: <e862de06d6777428168c6091dbbedd87689d9d11.1360079373.git.rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360079373.git.rep.dot.nop@gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
In-Reply-To: <cover.1360079373.git.rep.dot.nop@gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
Subject: [PATCH 3/8] uclibc: turn on kernel module support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 16:11:57 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
index 5affb5a..c309e6f 100644
--- a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
+++ b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
@@ -157,6 +157,8 @@ WARNINGS="-Wall"
 DO_C99_MATH=y
 UCLIBC_HAS_LONG_DOUBLE_MATH=y
 UCLIBC_HAS_FENV=y
+UCLIBC_LINUX_MODULE_26=y
+# UCLIBC_LINUX_MODULE_24 is not set
 UCLIBC_LINUX_SPECIFIC=y
 UCLIBC_HAS_REALTIME=y
 UCLIBC_HAS_ADVANCED_REALTIME=y
-- 
1.7.10.4




Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 325B0745CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 13:35:59 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id r7-v6so5231475lfr.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 06:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=F4RxLzqxbHeLRlHM9uVTaVxRxi4JQ3ZcYyBogJUdpJI=;
	b=d10G7qEGkxX6LFCR9nh583jeLoOS4SxNv5NCCgf1HuEAyFs48nwpwiExzSDXBW5X4w
	h3puzblmsUI1kGSRsQqRZT37ucGGEEDeSJqmhkpzorr4iRzZGw0qux42If7E7ZviCfQp
	9FVN/rwsOsh58PLFL2cXz5DmfloZjEfNGCcTYudlkoFjfHLweTD7sowYntOtinfce5uF
	Pc17F0U0VzrC3WbSE6SW0uNjD3FciVriRsfHNzkdkjOeZS07PGDxeUhBs7lbBN7prlIf
	IVsxlWHtHlgId9XBU6MAoB8fsUZJL5VZ3XFUQ1vwfl5lqI2tut2AHc2gIg03sK47fbOi
	2jew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=F4RxLzqxbHeLRlHM9uVTaVxRxi4JQ3ZcYyBogJUdpJI=;
	b=EdlzAm3OnxNFnR/gC59UNIWeLZiIOjekeIgs0WHkre+BGkoMAeaNCD/r/p8gbfz7bU
	PyM4DREjG/91tIGqsQY2CbBl/39mlueGzavsHbJ31tTCiqMNavn0LxX0jRGOgVTMMT9s
	WeaKURAs5FESlYh/UOmlFfoPcxmOApH+ETAWq3ZJMzPv3+2HZeUURGu+/DrCxgjtfog5
	cb13nUfn9W/n8kN6Q/cyM32jweNAvvn+SxgH9hAG26YJqrnODAAjbLi+UeuFdaYXfsqm
	oKuZGGJVefhRsA3gSD5ChsVTAE6Ts1JuqsMEdC06Xz0Vy88QOQ97Pr9oJ1yGvpYGdQvF
	XOqA==
X-Gm-Message-State: ALQs6tC2BNgWb8j7bv+q/imLYlCQ0XNogL2E5gSehtNr3PilSIY059yU
	QvNKu2LLXmgYSVUtrJwpbYkccLZq
X-Google-Smtp-Source: AIpwx491auHJV2bHnEZ8paZ71iKcdjJ0yhsQjv1L3if//BXoBeRZMEba5Y+240Bpa19k7pjY9fEcSw==
X-Received: by 10.46.155.202 with SMTP id w10mr7108623ljj.76.1524231360042;
	Fri, 20 Apr 2018 06:36:00 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	(m77-218-248-233.cust.tele2.se. [77.218.248.233])
	by smtp.gmail.com with ESMTPSA id
	c89-v6sm1356830lfb.57.2018.04.20.06.35.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Apr 2018 06:35:59 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2018 15:35:55 +0200
Message-Id: <1524231355-17085-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] mtd-utils: add nanddump and nandwrite to ALTERNATIVE
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
X-List-Received-Date: Fri, 20 Apr 2018 13:36:00 -0000

From: Ming Liu <liu.ming50@gmail.com>

They are also being provided by busybox when CONFIG_NANDWRITE is
chosen.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index d09d633..d4ee999 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -28,10 +28,11 @@ CPPFLAGS_append_riscv64  = " -pthread -D_REENTRANT"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} ${@bb.utils.contains('PACKAGECONFIG', 'xattr', '', '-DWITHOUT_XATTR', d)} -I${S}/include' 'BUILDDIR=${S}'"
 
-ALTERNATIVE_${PN} = "flash_eraseall"
+ALTERNATIVE_${PN} = "nanddump nandwrite flash_eraseall"
+ALTERNATIVE_LINK_NAME[nanddump] = "${sbindir}/nanddump"
+ALTERNATIVE_LINK_NAME[nandwrite] = "${sbindir}/nandwrite"
 ALTERNATIVE_LINK_NAME[flash_eraseall] = "${sbindir}/flash_eraseall"
-# Use higher priority than busybox's flash_eraseall (created when built with CONFIG_FLASH_ERASEALL)
-ALTERNATIVE_PRIORITY[flash_eraseall] = "100"
+ALTERNATIVE_PRIORITY = "100"
 
 do_install () {
 	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
-- 
2.7.4



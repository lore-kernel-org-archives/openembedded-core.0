Return-Path: <trevor@toganlabs.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7DDF07943F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 13:56:04 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id h20-v6so14224963itf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 06:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=DSHlPp5RMdcub9WOe3/coUYFGKoXmZwkRBKDH5l4TaY=;
	b=HAXXWjGVoEh5TbDbdTAqLRoffC+nczuBMJyHF18qSyulr5jsQqwaCV7ptAWCyvCI8o
	BOkl3jz+tvIIKt+a8i6K6Q/Qrx6EWoQOIaGEOHf0hezYradMPL8wyq66Qnn/ckTXV4iI
	+l3C6wS6zwEOPiRwPUdCmqN3CsEbFcGwi/DjEhWALd45eeiWNL4eJefTqa4DBXZtqgbK
	JElCHUpR8GM4XlOs3LK8VWeK2iu2orOKtRW3xBO7g8UBKo6dEtYFewDZqHkQn9DjZyKp
	31eeiD0ML8lVqvla1+7iXTKwJKjKpRitd9i5JTJPH86uGmui6+573OwoNlXVlu2X6WA7
	Ffzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DSHlPp5RMdcub9WOe3/coUYFGKoXmZwkRBKDH5l4TaY=;
	b=XrKtcQ+tZ9rztX3atraZ1qLB7mqvBEn3BvVS72DFa6fEZ2CwSID9RhdgxcALoFOiK5
	gJPoL2WKpwm9uerX3lOlPxj50njMKg3r7tPJIu0OebG2dJ3Ehty03EUi72b0BZfTUbQH
	tcFZ4Ef7Gjy/lfQ2Paf0EPXqJetEK9bgyDb03O9ztZyvYPLMfZW4nF0kY/twnZuaA+8J
	giP1luGFP/OCHR00+7EN/zL9dSVbmoIb1Uzu0ssAtquqG91gikaOyxa6Y9ur58VgpJNx
	jXXfTN2bgW1mPmgACvrUSsrKySYAdypOxBVJkz/GPBw0iI59qnVJl4LyutGUqjXTjcGA
	4r0Q==
X-Gm-Message-State: APzg51DCo6lcLsF3msRAJZRPILun6GM0hOaRsadwpYIbjETioP13Z+y6
	GGKCbTWT5M5zDg6ISFcDtUlN91GkSXo=
X-Google-Smtp-Source: ANB0VdbkDuF/aIxXO+2gbvm9Cea6iMOD2Ty59YiDhHc8/LnAMxkoLX4P///oqmzluCFqsoWEoSzlKQ==
X-Received: by 2002:a24:d3ce:: with SMTP id
	n197-v6mr2690010itg.97.1536242165375; 
	Thu, 06 Sep 2018 06:56:05 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	n187-v6sm2470959iod.66.2018.09.06.06.56.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 06:56:04 -0700 (PDT)
From: Trevor Woerner <trevor@toganlabs.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 09:55:33 -0400
Message-Id: <20180906135533.18664-1-trevor@toganlabs.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
Subject: [PATCH] gdb: PACKAGECONFIG for tui
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
X-List-Received-Date: Thu, 06 Sep 2018 13:56:04 -0000

Allow the tui (Terminal User Interface) option to be set via a PACKAGECONFIG.

Signed-off-by: Trevor Woerner <trevor@toganlabs.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 039577b8e2..52476b6146 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -20,7 +20,7 @@ EXTRA_OEMAKE = "'SUBDIRS=intl mmalloc libiberty opcodes bfd sim gdb etc utils'"
 
 EXPAT = "--with-expat --with-libexpat-prefix=${STAGING_DIR_HOST}"
 
-EXTRA_OECONF = "--disable-gdbtk --disable-tui --disable-x --disable-werror \
+EXTRA_OECONF = "--disable-gdbtk --disable-x --disable-werror \
                 --with-curses --disable-multilib --disable-sim \
                 --without-lzma --without-guile \
                 ${GDBPROPREFIX} ${EXPAT} \
@@ -36,6 +36,8 @@ PACKAGECONFIG ??= "readline"
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline"
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python3,python3 python3-codecs"
 PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
+# ncurses is already a hard DEPENDS, but would be added here if it weren't
+PACKAGECONFIG[tui] = "--enable-tui,--disable-tui"
 
 GDBPROPREFIX = "--program-prefix=''"
 
-- 
2.17.0.582.gccdcbd54c



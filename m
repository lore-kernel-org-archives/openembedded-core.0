Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3BF4F7F7C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:44 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id q22so1609651pgk.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=32EZqbdwQr21NXzJlqZNdwpehsrvsihsInbOWtYAYiI=;
	b=ZfyoJwLRHoyIWZj+/uvmMb1s22aRKiVDHfLunDU93thXUJzPLQon14lZqkQNixDfxp
	H1ZrcleTcRuuQOwCyz2mxScwz5shVShQS6DNi6RjrG3izfABJynACwbkgHgUAqQes6DE
	Pjoo7E3v7QpbyYFgU4mRRqNG9pW1uFQQBbJ54mIylgiowg/0ZRxy+mx0dr9i7lZCjqhv
	lFEf/htxdJN8kUs+o4Qm+gKvG7VproalwH+6Bj3JyWmfYG4Ddu6MrJuec4B9PmRRsu9v
	e/XdmVEJZ7Lqp0cc2gR80+IOMYnUmWsEIhHxF8yYowcGb1EMP4cDd6D1MpziLPZYHD2E
	HmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=32EZqbdwQr21NXzJlqZNdwpehsrvsihsInbOWtYAYiI=;
	b=X8z/AcpcHNMSQykMbKypv5ZvxpmSwYraTZ5Vyh3HXENBfYiXn4hpfM8Nmt3UnaA/Ib
	JQxcTei4kXUBsgFIxR9dXlqD3w1LCVJtJ9NsGq3QTwUfYId/dHZ0mZxeE7O08830Q1d2
	3F3T7xwlw2p94/R2Y/WMNO3T9UjG0Nj3bgU1wkVxtGkpJSfG1diIHp/6SyCg0AEPqffb
	OWDymnW9XnUi3oGfP2TIUeC0eoq8yg4x6i7e4q3gqjh45wdoOnU81+glLkFuFGSy7Xqp
	9bdO86QiVQhBz76kuWAiLHkhcoXbXGMhN/WLh5c64t2quy7jcOxc9BsfrjHZmEBYuzUD
	CClQ==
X-Gm-Message-State: APjAAAW72JK+RJ91TheG703tsVoqtZ0cuLYuU6jp+kaGtePnflQN/lrN
	BIrE9YMB+DDx0OQdtw9exZ9/quqa
X-Google-Smtp-Source: APXvYqy+sA6QdT06nfAF/L7/zdISXhbb5Cn9aqhXQS/vOHHiNKwpwAA4BtmGic6L246+AUkufR3OMQ==
X-Received: by 2002:a17:90a:d78b:: with SMTP id
	z11mr5802126pju.36.1573659165107; 
	Wed, 13 Nov 2019 07:32:45 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:32:02 -0800
Message-Id: <b5f8274d75cb61beaf7dab3420bda206e45697ae.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 20/31] qemu-helper-native: pass compiler flags
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:44 -0000

From: Ross Burton <ross.burton@intel.com>

Pass all of the compiler and linker flags so the build is correctly configured.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
index d9d9da0..372eebd 100644
--- a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
@@ -12,7 +12,7 @@ S = "${WORKDIR}"
 inherit native
 
 do_compile() {
-	${CC} tunctl.c -o tunctl
+	${CC} ${CFLAGS} ${LDFLAGS} -Wall tunctl.c -o tunctl
 }
 
 do_install() {
-- 
2.7.4



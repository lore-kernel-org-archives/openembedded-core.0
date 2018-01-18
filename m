Return-Path: <alistair23@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id A2C5C78748
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 19:17:11 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 136so14526420pgd.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 11:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=A1ztKrvgGP9CsZKJiylcxL7pL8x3/i/4xxj3Y6FmrT4=;
	b=O47szP4cUBrkm5ZKxLo0TWYcCvFD9URbsuqQbyvLulQWSebMHAINqrfdkYJUHvzBlI
	Q5qXJSJCtCKs9PlMxW/P5UoPEFrbTu8W1CR1/0VGM4BUZa3HmYXkUTaiQQ6ob3ZChAfW
	dww1jYhPUrzSEkdP8fXw8fMLxfuYjyffhIs2fbBkuTMkXvXekB6Ar9vuRAEaoBHikqYD
	/gtuWqS9EFsS/K4YS+uhOUflSHBE3F6lCxes0y5HdVoji/5fzUE15GoE4Hibrn7ioS1x
	JsbeuOoGjBu6Uru79VVwBhCsd6aNzaRAICkSTfEabt4TNgL5+TkRS+NNKyXJXQrsqGAG
	yhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=A1ztKrvgGP9CsZKJiylcxL7pL8x3/i/4xxj3Y6FmrT4=;
	b=WIWLEth7l658QpKQ8S1jxNEYAuT3RWp4Ih6OSKwdLgydhO7X5wRwPtARDfgDgtV//w
	RDdyWh0UWAudV68CWU56v26qsin3MwTb6GvGbMrXy6QLWLS6PgJfgBU2+bwbHYwr0zP5
	eBK/HoONrKaxBUJmi24T+RJES0xZvAwFKr1dzTBSXs/q/cvWipMtC/pD3Gv4GVPG7qSM
	qATPowMJIWb8CgioTD9QYWR4yI1d4MNe9OWtBlnuNphPHMEOPi949vaEyZxo9Llg2HFh
	FugKSyl3uuWi1Yfjqdfnv+gubP8+rf1VlNHA/vkMQ9yQeogGCniVJv/35JxLJSJOGqs+
	Rkkw==
X-Gm-Message-State: AKwxytfYB601rndvt57DG0NPTWxN7NiI6x7sgN6w7JE5d+t6QlOSQY9Q
	7mqeQpqhqefjF8nno5WK3Bmjw7/2cA0=
X-Google-Smtp-Source: ACJfBovLyfz4PqhXjay9VIpqCfTQcXb6GE86Depntvzue0mYfnUpHtSPK/NXv0fczDDzLpG7AfELaQ==
X-Received: by 10.99.182.6 with SMTP id j6mr20853686pgf.221.1516303032173;
	Thu, 18 Jan 2018 11:17:12 -0800 (PST)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	l10sm11312667pfj.6.2018.01.18.11.17.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Jan 2018 11:17:11 -0800 (PST)
Sender: Alistair Francis <alistair23@gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jan 2018 11:12:45 -0800
Message-Id: <20180118191245.9490-1-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] glib-2.0: Re-add the gettext depend
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
X-List-Received-Date: Thu, 18 Jan 2018 19:17:11 -0000

Commit "glib-2.0: rationalise build dependencies"
(8b0ca0cb54c91611213556bdb99316d5e7ac5b3b) broke mingw glib builds with
the following error:

This patch fixes the issue by re-adding the gettext dependency.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 354d95cfe3..e6997ae88f 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -24,6 +24,7 @@ DEPENDS = "glib-2.0-native \
            virtual/libiconv \
            libffi \
            zlib \
+           gettext \
            ${@bb.utils.contains('PTEST_ENABLED', '1', 'dbus', '', d)}"
 
 PACKAGES += "${PN}-codegen ${PN}-utils"
-- 
2.14.1



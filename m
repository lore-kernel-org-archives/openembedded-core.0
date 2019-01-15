Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5E2D47C151
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:39:19 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id s12so3726864wrt.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 08:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Fi2g8TXakWAZKb5VH9wHZ8I5eAUnNJYCsuBMH+8sRg0=;
	b=iOTEhsYFsxAAZGfVuTRjrERuCr3gpRDnW/eervrzmAjYzUo/ySh5qBde4iw2IUUJzS
	hP6PaLAKMMPs3aAOwQd7ScC9VO/xh6Ye0IIGYBzXbrF/8yAnrCFAKkzCwnvD7oRh70MP
	66Bzd+BgCMw6bDbpF+Sjx8bPk65LrImjthzGj20RtX6cilnDi5Jq7uB2qEJMFLefUFkr
	9M6vvgN3dhmsD6WSgxseQ6lVqWAEW73WoL+G6HKIZDiBstDO02B8HU/gNdPnp+7yKcAS
	wdkZ83epb4xfQWuqTHfDWO7teovXwSpZBvaxVjafTEBX2eW0eajHO3rjVIDXQMSI74Vx
	xuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Fi2g8TXakWAZKb5VH9wHZ8I5eAUnNJYCsuBMH+8sRg0=;
	b=q6XxtpoH/tuIatgnEAM1NUIfkedkJNQIFnhSPXQ78uGEcVTWc+MUVXqbKZb0exAEjT
	mrcphW2CdD+Djy4bdsUUvG0m7dYk5bXGgcMeLSVWJQjPJ1OOMi0oGga1GViTZLeO2LLl
	jif+MoZt+i5vg0zi8xew6Me26f2+trRsR11x31rWeahNCZy+MGIzaCndHJzHVEqqM93K
	T5FUTsUZiyiNkIZk+W7EJ/GiD9SuBL0l4bbaXJbDQuKW0eEIf8F9DeoQkX7gDvQfk+TQ
	Sgx0DJn6e3wTSYGTVES54tZpcloK8HHW5tFqZZLMqw4thcXeP3NJV9xHGZPw/jkxUE/8
	dfFw==
X-Gm-Message-State: AJcUukdOz+idug1ZnJi3Z8IA3QvVgbB71bs7+RgUprsQjVUtCYz62p/o
	Zium2I47UN6h6PiMZDSjV7vbN+F/dKM=
X-Google-Smtp-Source: ALg8bN40hikpYOTGmWSAXlqUBwfmY7Kih7pKn3UIAge43H+2gCB1F6QtZa+X/O5ryJene0SsnKAfFw==
X-Received: by 2002:adf:8001:: with SMTP id 1mr3697525wrk.23.1547570359888;
	Tue, 15 Jan 2019 08:39:19 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f15sm77594927wrt.10.2019.01.15.08.39.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 08:39:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 17:38:51 +0100
Message-Id: <a27378deebaf4f2293347ba6b898968da9494cdc.1547570285.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547570285.git.alex.kanavin@gmail.com>
References: <cover.1547570285.git.alex.kanavin@gmail.com>
Subject: [PATCHv2 16/22] qemu: add a gettext-native dependency to gtk option
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
X-List-Received-Date: Tue, 15 Jan 2019 16:39:19 -0000

xgettext/msgmerge is used during do_install() when gtk is enabled:
https://github.com/qemu/qemu/blob/master/Makefile#L743

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index db9c2245df9..08ae9eca2bd 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -87,7 +87,7 @@ PACKAGECONFIG[vnc-png] = "--enable-vnc --enable-vnc-png,--disable-vnc-png,libpng
 PACKAGECONFIG[libcurl] = "--enable-curl,--disable-curl,libcurl,"
 PACKAGECONFIG[nss] = "--enable-smartcard,--disable-smartcard,nss,"
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
-PACKAGECONFIG[gtk+] = "--enable-gtk --enable-vte,--disable-gtk --disable-vte,gtk+3 vte"
+PACKAGECONFIG[gtk+] = "--enable-gtk --enable-vte,--disable-gtk --disable-vte,gtk+3 vte gettext-native"
 PACKAGECONFIG[libcap-ng] = "--enable-cap-ng,--disable-cap-ng,libcap-ng,"
 PACKAGECONFIG[ssh2] = "--enable-libssh2,--disable-libssh2,libssh2,"
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt,"
-- 
2.17.1



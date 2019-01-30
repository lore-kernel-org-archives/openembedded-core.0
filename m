Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 440FD7C314
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 11:00:03 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id l9so25460304wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 03:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=NxZvp+ChsdE3xEez1g19uz+efPo6j3TgearBPtjxncQ=;
	b=tL208YrFbBv2JVjv2QSC10qH+u48FeSVhNRGyRgy68VvNdcNw8OBrE5LAdff48efi+
	+6/IVLyW54ClNN7X9CaVn2EGwyu4h+Yqu9UedUjJVzwAHY15ZqEY5jIfI9XqZaTiOC3Q
	qtGqwrZX3j6pn4qRu6yR2z6xDfWOrI8gh+3iqk1rR9k7IkuJLOzDOkoxyHyFuHaqPIcI
	q2iQUeCCcQOMSAvuDd/0Ivo7WaLCx9rqMJqJDr6XccdOSdQFyRIOyGGd4nMXZreY3hcc
	zgtdasBMRycsRL6eRAqU8JMHEdjnyOcVI30pgKZ53m7UnAQreLObBQOv1qwpNHh2CKfR
	LYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=NxZvp+ChsdE3xEez1g19uz+efPo6j3TgearBPtjxncQ=;
	b=csCx9jAE8vQYC5KE4R3uYmju5w5HBrHcJHO+TeUp4szeqWUmtk9AMPn3lJGc9aKRFx
	CYGHLkB1zCgP3h+Gpv3trbpKjFxWKZ1EkqI/YgONFXkBYwnyuLXQ6hX6MdsSLhLg9qAg
	WMAAW6HqLr2hKf/mktlTfEUI3GoF7LkrThA5PylHpaEeH8K8yNyst7pZT4pELQS7UoFH
	Iyn5bdD6fPjGO4qLjnJmxjxA/mJD2iknyo6BAlPfNpPAEVJ8JHjYqI1B8txSIwQWQTg7
	I0peTUdVj+gN+j3HZJLp19opkLKoQ67hhp65kMHX6Ap1iy6u4PQbgxoDE5pIO/VwVdAK
	iXvQ==
X-Gm-Message-State: AJcUukdTIQ7cN5vz0cK40WpCNLeyfsWc+koU7NckRoxCjaLXrzgm+HXg
	epdXjVSMCU8c0tKWI9RpZDl2tN2o
X-Google-Smtp-Source: ALg8bN6BlncNQ+WICkeCG9UuW7XFrWoU92Y681cOi23wS960gk0vCCAA1LWSp0TYHWzJVWXadOaH4A==
X-Received: by 2002:a5d:4dc8:: with SMTP id f8mr30380491wru.45.1548846003582; 
	Wed, 30 Jan 2019 03:00:03 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a18sm1127705wrp.13.2019.01.30.03.00.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 03:00:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:59:35 +0100
Message-Id: <f2e70d745b1502459c3fcc3253bae75ea660f5aa.1548845917.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548845917.git.alex.kanavin@gmail.com>
References: <cover.1548845917.git.alex.kanavin@gmail.com>
Subject: [PATCH 12/20] qemu: add a gettext-native dependency to gtk option
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
X-List-Received-Date: Wed, 30 Jan 2019 11:00:03 -0000

xgettext/msgmerge is used during do_install() when gtk is enabled:
https://github.com/qemu/qemu/blob/master/Makefile#L743

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index dccf9dcb00c..b80b9e131a1 100644
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



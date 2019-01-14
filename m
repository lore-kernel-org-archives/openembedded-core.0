Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 291517C078
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:03:35 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id t6so23169552wrr.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 07:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=e47//lSC7gbKWbgxZJQTNOKuuu847nE+6NKINKVbskw=;
	b=E0BmwuOLUPSkNi96hiLvpj+V/kcOAK45NCQoIiTWHPLiQikxw33zgp0iaIp3mRe4Is
	OTD3QwiJVT0l+2Ztu0dcHtob8Jr5PpW9EdeQizW5RnjCF+RxjQSRNU71JvRDZf+YAzKV
	HUKEN8p3OZLzpdOMvCd85pH6vuG4tfHdys+g9Yt0ENR65wbHGBXYgy82FO5LI+CtlJp+
	mMp5SsILpBmX0F1LioFSg+9kZ2o+HhRx6cBSJnyiGqqzZc8Q3HW5F6rbcl+T77NvtPuI
	7pZ+paTaIK1qYnWKqpnEGxozA7Xbni6wdGI8p+eXiG4CNdSvknfIRJh6liHV+1aJSBCq
	ZCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=e47//lSC7gbKWbgxZJQTNOKuuu847nE+6NKINKVbskw=;
	b=Dze23JHsKOiQwUfRe6PPOEJpJAWAjbPrX7Wau5pI09w3m7ABAGH+GbyGMTZ2jSKgPZ
	ni4wcLeaEbdZeWwQ781nJ3CSAUZ0VaBeyNNxjc2uGXh2bZBu/JtwLOrRLliSeY/yQUsb
	0cUehQ3NjMzWE6MROjdqSunUgmqqGUTilVQQOrwbc8HGJyIbz5wSkZUMSCRpWTpCzMtd
	NotFtdC04kMJeA4HaEnaciR7A+tTIdN3JZqknlcRqe2v5nf00kqMnRJJTjZ1PYSjV9Mx
	idcVp+5WTXj6dWj9fuARRq4a1qUd+xCJP1Ow1xntxcgFShBUDAYAPLyNhb50RHKdIVxo
	tQMQ==
X-Gm-Message-State: AJcUukcZNMFgdfb8NKk4/GySCtsleIoM+nND1FUq4ktm8EB9K01CbMUt
	DFYsQ8U+oi+ckQw7FJ/qm/E93pXW
X-Google-Smtp-Source: ALg8bN71pMwx00oVhPk8h67tEinABS31O0olD6pzJcmbxD3n+nOyo+jpUynqzLo8tyBRbaoF30OdCQ==
X-Received: by 2002:adf:b102:: with SMTP id l2mr23978135wra.296.1547478215568; 
	Mon, 14 Jan 2019 07:03:35 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y34sm201725236wrd.68.2019.01.14.07.03.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 07:03:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 16:03:07 +0100
Message-Id: <00d025b9b5da962ce5b05715886e0b4994170537.1547477793.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547477793.git.alex.kanavin@gmail.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
Subject: [PATCH 11/23] qemu: drop --with-gtkabi option, as it is no longer supported
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
X-List-Received-Date: Mon, 14 Jan 2019 15:03:35 -0000

Recent qemu versions support gtk+3 only.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f943b9ee5a2..6db1facc9a5 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -95,7 +95,7 @@ PACKAGECONFIG[vnc-png] = "--enable-vnc --enable-vnc-png,--disable-vnc-png,libpng
 PACKAGECONFIG[libcurl] = "--enable-curl,--disable-curl,libcurl,"
 PACKAGECONFIG[nss] = "--enable-smartcard,--disable-smartcard,nss,"
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
-PACKAGECONFIG[gtk+] = "--enable-gtk --with-gtkabi=3.0 --enable-vte,--disable-gtk --disable-vte,gtk+3 vte"
+PACKAGECONFIG[gtk+] = "--enable-gtk --enable-vte,--disable-gtk --disable-vte,gtk+3 vte"
 PACKAGECONFIG[libcap-ng] = "--enable-cap-ng,--disable-cap-ng,libcap-ng,"
 PACKAGECONFIG[ssh2] = "--enable-libssh2,--disable-libssh2,libssh2,"
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt,"
-- 
2.17.1



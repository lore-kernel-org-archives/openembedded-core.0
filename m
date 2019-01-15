Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id D35C87C12B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:39:13 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id y139so3920984wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 08:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=e47//lSC7gbKWbgxZJQTNOKuuu847nE+6NKINKVbskw=;
	b=Sir56U3aIYQOqP6kv8d5HIckVGQ2PV0nvyDFjz8ZMNfQbKi7t8x9ZXdyinIIc4+A9K
	MZ/sSoIhIK2/tF+9SZSdaZLpdizhVya2l3VQlqTqsQIwAC2SUfP5s56tNJNvpjS4fkm6
	CcFQPPTau05bfhzSd891oihUrvQOtquYBYejdq3lglrZc3zbn9cylkMA7MpCoNTTrr4k
	i7SZ9322JOR4cKrHHpDYeHQRoivif8ULbdqTVvlYhjFqcWO/5q7LyKlpBXUqIgMwViPn
	5ftliDU61ATSMbX3tnDai8yCKSy62ZRuIXeptONgLQfkOqgSUtfUar3KO/dbgFpfCOKG
	GEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=e47//lSC7gbKWbgxZJQTNOKuuu847nE+6NKINKVbskw=;
	b=KRVTWd7UCwpQ27yhn5wHctxGBis23p0H57xfbZXK6ocPz9k3n0gnN3mpV5rJ6pDOyz
	Df4E0UXK2gW5945UjvKoqwGyvjjEoZxh+7gWr0+ndqMBLMB1tfSE+zQ0cqbG7taVx+OL
	UlP7TZ+jAOZFI9Ts7jk9L0ezgJ7OfoR5MUqWedd8WFHvWLwU/3m1Ty6AvSN2ly1JibDf
	GIp96gt8HX9Qf+i2dzh2eYO2WTosK6n5BksVx2XEszpdQGgyuj/usQGZUUlhjc2y7AZs
	DuIzQsRUvBnWIy/QkQRaulkVKYVt7NoWB1CrJ8QODxIvBJNUYUYQv+AFUwVALFgAJTJ9
	eG5Q==
X-Gm-Message-State: AJcUukeJFBPvUAGmxNWC2uCJUmHrA+B1FzibaoTY/FR98JOVbNxemKdK
	wrP9WeXa2XPpuctEPP1tClurHIb3IZs=
X-Google-Smtp-Source: ALg8bN6AOlIAjZeenQy9S+ilhpREKA0XEOdFZy+zH+R2wVNfp1+0MGISf+Gw7I1z7Iw+SPGiaOjtvw==
X-Received: by 2002:a7b:cf0f:: with SMTP id l15mr4333036wmg.30.1547570354293; 
	Tue, 15 Jan 2019 08:39:14 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f15sm77594927wrt.10.2019.01.15.08.39.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 08:39:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 17:38:45 +0100
Message-Id: <0efb49bd026217656737a6a4ffd70690ad81122d.1547570285.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547570285.git.alex.kanavin@gmail.com>
References: <cover.1547570285.git.alex.kanavin@gmail.com>
Subject: [PATCHv2 10/22] qemu: drop --with-gtkabi option, as it is no longer supported
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
X-List-Received-Date: Tue, 15 Jan 2019 16:39:14 -0000

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



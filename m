Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0ABA47CBDA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 14:33:59 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id m1so2174070wml.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 06:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=NxZvp+ChsdE3xEez1g19uz+efPo6j3TgearBPtjxncQ=;
	b=Pa0S9wPI/N1kx86q+IxTVaKQjf3rtRxPjp8KzET4fEVmDiLW4PaRFWW6sjMEVZcENf
	Mo3R5JLnoYiDF+YCfGZN0lK5i8ZyanLBHCxqT8AsTMO/ESHMzq8ln5zmfa+nNyJVA3WA
	GToS2kEg3bHJDqX7Pv7Q2v2nVLQwYNiT4NW7Vs58pvXkTzyITI9JhHKSHaqSpSGVPzqL
	A4oSYojjS6H2emggg6EifrAIesLCkBQzd4+a6sxC4TJHRGbWCcN96ZQaGpUnvHeuTxpZ
	HWyXhhulhqieeCXqQlh2FyMNKQc68guS0UNjdWlSSMkdF9W3Ic/6OAABhoGYaFblAYPK
	eNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=NxZvp+ChsdE3xEez1g19uz+efPo6j3TgearBPtjxncQ=;
	b=ANeTG0l6sPzQipu0+fKa8F4rKLYE3kt8hgsrVAPP1ayUnm1UBxhUS0yjjKRnMmn4Uz
	W2c2ZFlm7SskL+YXUHFfvR0GfmRw44WFknwO4XMUu9XSZKdU0KD7gpGZthKZtwaTy02C
	/UaiLacwP1WcF/oLXWk524jw830bczrVuSJzffi6LsmEYVHJ02vBozgsIGnSlXro3G4s
	FEOg7vBfE/NxmK0C+JVpyVJVXeyCOpa+clXnkiFdJsWU6Kuf3zHFlNZ2AKXitVnwuwNK
	RrDg1Q2pV3TZLoVwVAuS1OTcuKl/29SYicoJRK8ilfZg5QnwPhptMviu9oaUzXwUmV1F
	8c3Q==
X-Gm-Message-State: AHQUAubiI4HFdMbdT2lNluYD1IAbHWMgAMjEsQRsX79r6K4xNsBplRP6
	yJiG6MG3QsBk5XHf8IBb+XzBV2EB
X-Google-Smtp-Source: AHgI3IYhKykbu92adXfXtNFzk/UhW4+XozpqR66gSuBo92CMYwOnW/zijJ9+ccSg0Lc5Kj3XbfqyPQ==
X-Received: by 2002:a05:600c:2143:: with SMTP id
	v3mr1912299wml.14.1550846040524; 
	Fri, 22 Feb 2019 06:34:00 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id p1sm2085184wrx.50.2019.02.22.06.33.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 06:33:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 15:33:41 +0100
Message-Id: <a4e17848a1d0d720c605f0b001f9372a2fc935fb.1550845989.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1550845989.git.alex.kanavin@gmail.com>
References: <cover.1550845989.git.alex.kanavin@gmail.com>
Subject: [PATCH 06/12] qemu: add a gettext-native dependency to gtk option
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
X-List-Received-Date: Fri, 22 Feb 2019 14:34:00 -0000

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



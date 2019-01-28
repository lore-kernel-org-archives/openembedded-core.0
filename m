Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2EDBA7C476
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:47:24 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id t27so17889552wra.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 04:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=NxZvp+ChsdE3xEez1g19uz+efPo6j3TgearBPtjxncQ=;
	b=dfrh8xQhIXK3SbGdVJlxr6/jBxgdTDnNxvtvYhAOprwBRJKcozdc5RfH+w7HHL/Xo/
	mG8ZAyLuenGY/c4xFjCI0NmmvMJj6ER+B9Xy8csk2S6B8Y65Z/dFufGVDT24FhgcAU90
	XsTZIBu2MHlgB0uNTAmaMgzQCYliyenwU5lD+AeAoONwcPOJDl0dpnyR03+kVH3JzF8w
	yVnNh9XbwlCeT2Kur0b+Q1j55uJt0mQNYseqtSQ4M+6m2URwDDRN129P4Y/kPM3rlQwb
	yjfbw488l3/lIN0apKML2zjJC1rpkbVIuN223Nazzv5XcmuaDeychVHUkVsFL+nIEVcY
	gHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=NxZvp+ChsdE3xEez1g19uz+efPo6j3TgearBPtjxncQ=;
	b=HgvYn4f6m57eGqufLY4oUd/DDE7gBRzMwwQi/le25ldFfTcQjZV5c1MUZBvgSdtrv1
	j4Vs9J15mONgPbuAIIjSSnbvpp19VZXVsROGr1/wEjFvUytWQUT8QNAOrRPIo9ypzAr+
	ud0ffO2HWCUG+a3KGeSR/YYBUW4yyiik7QTP/7RlR7ent7ZhNoFUOV+oNQJUDPhkGD1O
	SXKF/ggjYCPTuNVrHnZcg960OTt5sgz1oH1s7RnEmCiaV2N8O1yLTpJKHpYuEY00fnzr
	97c9m/qCN3mHgqQ/IAE1E/KzLAdRuSPY4ducxF0kjJCUhY4IMJ/1LRj3Yl7K22QWtT/r
	AcHg==
X-Gm-Message-State: AJcUukeWk+d98s9ZFoW4N6Ipj3asiKDUgsolO3cVs2sht/Pdu+x35V4F
	PTPzRfy2RSbNh07f/I0Wn8cYDGTW
X-Google-Smtp-Source: ALg8bN6m76lB7504zGZh2fEKOjFglFUauw1QcVA2t0bWMItumVBm6o0rzjl2pKznoK6ssbNUTwT69g==
X-Received: by 2002:adf:b3c3:: with SMTP id x3mr21733378wrd.294.1548679644605; 
	Mon, 28 Jan 2019 04:47:24 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm186026218wre.91.2019.01.28.04.47.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 04:47:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:46:47 +0100
Message-Id: <e6f079d857c601203c33fdb3b1ed4938f3a5d049.1548679462.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548679462.git.alex.kanavin@gmail.com>
References: <cover.1548679462.git.alex.kanavin@gmail.com>
Subject: [PATCH 16/24] qemu: add a gettext-native dependency to gtk option
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
X-List-Received-Date: Mon, 28 Jan 2019 12:47:24 -0000

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



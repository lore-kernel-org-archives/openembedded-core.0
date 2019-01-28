Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id E011F7C479
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:47:17 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id s12so17887862wrt.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 04:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=yhflArXU7zC3e8OxN0XEo57eWonMExFZT4mpcmTmBMU=;
	b=m/gnGmcCe0knuflCuD4f33QShqR/XPGz0dh+QETCj1FkzkJGLtLJWzjS9wTkONHQ4v
	fVl+44+SdRItKNgQfeBV9w2S2GL0QwDDDcVhXx4FoQFRSF78TaEALo6QYvZxcO04YqJ9
	DzI2MPcgpz3cN+K18HQvW2KQ0n+48wYsq9gpbl3ctJdqDTVeJNksVWH0+ngM06yEBtwc
	MJD3U3AK2L6vlZPulK+UJKifsw3hc6TuB3S1QBGQBWAo1rUJaFMQOSXunb8eA8g/AQEp
	dmZbsgF2Avr5MlZJAPfEAj+Z8kCXcmdovg+juYXFAZfbn1+cew0haC7GSEpjrNTJx7zY
	UUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=yhflArXU7zC3e8OxN0XEo57eWonMExFZT4mpcmTmBMU=;
	b=pex9ZKZOxQgzF1zL42Uj37fOr7/ocLbCm3fodfbJg4K2PMmfDJf07jv2EnOu2DS1un
	X3k4iZJeREiZw4x7RZ5d87ddET/4cmrIkPpdYLrsLAiAf/ed5hcGLqCnGoBuAUaMQUdZ
	IsHwxXwvGK6QocwSjExH30AXLUtaE3CHlwIqV5Y5DlxKgDxTfZe+ne9X794mjQNmOeIQ
	b94WB6slsbdrnzMl2coXP83WOKDat5fOiQlVjrlhkFhlgeiQJaBYldU2HMD30nIlbYXq
	Yet3rRkUML/jw1zFlbm/XxYu+QG/UmtTj8E2demmL/A7M1ElTTnwAJ7ecxRH5+Eob2/y
	nZEQ==
X-Gm-Message-State: AJcUukfi/p9pgGB/Gj+ROWxAGvdOn/vqaLxnG63boImSxtDHPlWs3/zg
	+hqDOxUKcYsvIpUVMNvjRQBv2TSt
X-Google-Smtp-Source: ALg8bN6tvUb02FmIVaOJquWIyltguoPCNJRJOIqW72VxT1vl2eNPP39M3+X5iNV2IWE5/Uqk7Qh5kA==
X-Received: by 2002:a5d:60cc:: with SMTP id x12mr20872305wrt.193.1548679638398;
	Mon, 28 Jan 2019 04:47:18 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm186026218wre.91.2019.01.28.04.47.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 04:47:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:46:41 +0100
Message-Id: <8e8bbaba239cf35dbb29da16966fa6653023f276.1548679462.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548679462.git.alex.kanavin@gmail.com>
References: <cover.1548679462.git.alex.kanavin@gmail.com>
Subject: [PATCH 10/24] qemu: drop --with-gtkabi option, as it is no longer supported
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
X-List-Received-Date: Mon, 28 Jan 2019 12:47:18 -0000

Recent qemu versions support gtk+3 only.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b6c98a4923b..95e9e0ede77 100644
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



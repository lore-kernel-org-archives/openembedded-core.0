Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6E6D57C4A7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 13:06:09 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id y8so6114869wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 05:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NxZvp+ChsdE3xEez1g19uz+efPo6j3TgearBPtjxncQ=;
	b=QYWBSr84Pq5wgVjL89t0H3VNXtYc2Z/L9nU2jM/I4OKY5rpdLet8x/o2Mb6iB5smqU
	SbFtBrcFzV2coMm9nsGupE9f2LHRCesq8LUcgZhExD44n/GycgGtE2LkXFaCH1n2UqqQ
	32FPBqI9GFJdTsevAkQOonsZeqr6FEnTkhZtwWxfWn0QLZ24tubC4iVoO5FXVVHkRB2E
	LeoDQa+vJXVs0siPEz0wLhfTiAnch7O/Epyksj/8ECxwVDsrZEinWn/DOTUsBkOZkaOY
	XmwKmVP3qY+MgXVnDV5yok+5g/V3lssjdS6IX4KwR7ZoksLofRwcLRkIkxOWNgJ37NMs
	9W0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NxZvp+ChsdE3xEez1g19uz+efPo6j3TgearBPtjxncQ=;
	b=HGs34qwCgvCy4K4Nq1IJr88B0kCr2maHeOz3mgfjVYsB7+5mNo3z0L9KcKH/QLpSq4
	BK6DY/FQ6Ytl6y2Rb0V69Wx8Dsf2wVKk5COawLu4iMILXI20VhmHg87fCKEW+kB8aa5n
	DTzQ6wjBGp5hbC0FMNuPM8PIc9lIVZNFkKQ+NslorJbhLaC+9MWpbtfjY7ZaYutK+wIl
	vHiF6RK6RFgKxJkzpDnYF4GIZ+TuMr6LPmo8yYL+opEA1fiZO74awXJOyFiye8B3rgyD
	0vM6XaNd+dyRzs7WYHNkMxZ+Fc/8NFWvtRWeOqISgi69BITklybzDgFKtqdC8NurQLpK
	38Bg==
X-Gm-Message-State: AHQUAuZuEAjJ1qTvKvvjEUc8d50sUnBhQH+WgI3/mrvEGJ+dwb7V0LCN
	nlmWRU9xov02LWqvZ4Hgbtg5D7+J
X-Google-Smtp-Source: AHgI3IYVC0KKTJC7vgCETPHl4XRzXRh+4B0MAamT7hY85iRjKUqdBvFyXQsgF6P+jjluCvpbNOT8Lw==
X-Received: by 2002:a7b:c76b:: with SMTP id x11mr2299580wmk.37.1549026369843; 
	Fri, 01 Feb 2019 05:06:09 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a14sm1273972wrr.13.2019.02.01.05.06.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 05:06:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2019 14:05:48 +0100
Message-Id: <20190201130554.90094-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190201130554.90094-1-alex.kanavin@gmail.com>
References: <20190201130554.90094-1-alex.kanavin@gmail.com>
Subject: [PATCH 07/13] qemu: add a gettext-native dependency to gtk option
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
X-List-Received-Date: Fri, 01 Feb 2019 13:06:09 -0000

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



Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44])
	by mail.openembedded.org (Postfix) with ESMTP id 29B6C7C233
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:42 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id c16so8292731lfj.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Fi2g8TXakWAZKb5VH9wHZ8I5eAUnNJYCsuBMH+8sRg0=;
	b=ecN3f3Ra1uiHjti+zfvxMj1Tod/TPEINn5phZiNZxeUysRxOfH0TZECWcT3WBuENGE
	4d2VJxE0DNO3WTvT1CNbWP/QvsMhxt+cUz9InufqJ4FlMHw9vC5griEUkF9sqwOHpEeM
	HYPK9+vtkrDSvZsSJEzguuWWgVOifiOni0hXygu7n+4XlXkzp7HE5SFzy3tCKWPpCDfF
	THNcXjj/9Ny4nVRYWPuYvwPQyvWMkKTW5x9u3+eZnc2cxUMSdYTydJORYFc5xqyTF3iG
	IY9gwCEVwzYKkpbv5fTLWyjBav9nTXd1G57RCxEV/ElTIkF3S1NZu4QVgjXgPQqmNMns
	RRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Fi2g8TXakWAZKb5VH9wHZ8I5eAUnNJYCsuBMH+8sRg0=;
	b=amVOF0H+nbIJL+ElZya2wBzrYPFnapvc79l3/x6L/uASqwxuORR/2XNGKcbDVxfhrc
	hli8ZsqwkvImhBlA6fP+ReZV9Kua0Ipxm8SLooWK+FTu6JPXMteQgTaTClbcGHYurRuO
	uR7KNPZ53WIObfrU+aodanKEQkrlJJIILGJ05L58/7tFRCMFSNj7pd6txP6jXb7A5FF8
	/OQt1Jd43D37fRW0w2qfxbuxBHN/CmnyA2D1sfdjd71V8oq/W0CStmafHvIveoAn3qWN
	ZIuWX7Q01uZl9QYNOZ1y4vPyVDzmdNpGjS5kZy6SpEId7op07r32i1hnYcORSE5W7QLf
	yzlA==
X-Gm-Message-State: AJcUukd5FDeKXYCzh3a8QrRL337uxfVOgSnsiDB0uBnzvQRG6Qkae8Y+
	myPyMu+OXnFj4z8jTErBJjE1X+ZI
X-Google-Smtp-Source: ALg8bN4djaS80ZAmjIrJLH5nfFji/R+fY6vbQyrZeLGrziuQzCdmQv4kxM2aEfJgfG1ToB8x4QRspQ==
X-Received: by 2002:ac2:554b:: with SMTP id l11mr10523581lfk.92.1547743242501; 
	Thu, 17 Jan 2019 08:40:42 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:40:01 +0100
Message-Id: <da93bf8db02618eb43691ce0dbf5bd70d6eb6164.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 16/27] qemu: add a gettext-native dependency to gtk option
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:42 -0000

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



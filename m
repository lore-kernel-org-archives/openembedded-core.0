Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6DBF578280
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 16:15:11 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id n23so3782369pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 09:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8Uva9W7Pv7myl5krzIH+ih3BEHnzvIaOL3fwhyeaE+I=;
	b=QM56B9X00gSbWGXMvOBDVbVGZfG6YHYRzI5BjBifDToA5Fi6LAarM+0xIwpdHF6Uwd
	g73sQnmgq9LL+4hgXS41fCuwrAUTC9F9sg6/peijwMNLMeWp72pMjPX29wtQdUuk5TgX
	H40FZqP3SfhM78q5ryIzWDrJN2TRepjsoAfExiWQNFtvWlcOQ8bDIy85Z4lw0A+4uvdx
	1OEU9lH8C5NxLKDc62kssr8ml9w2pODpXFZnt9y84rnYojQG1OGhWXHDQpcCvTw9OOh7
	h0S71MNyQYCAIcXS44UxPRrCUkrwVj2/tBkqLngpEUNtoT8P8AAtk3BjVb5rgfGucBBU
	Q68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8Uva9W7Pv7myl5krzIH+ih3BEHnzvIaOL3fwhyeaE+I=;
	b=JFgX7TIsDgEZQLiSwFJiuV1kCHXLgOPfuZShBZ8QnUTGzmrtP4ZxeYi3/smNds4vUM
	lzoCTm9hjBH+STaV1yraHdUUmS972RdszhhCWupUK1k6w6zORDVMyalrYLu7yHe1scw6
	aPP8nmsfqlwbQBil/wQlG4IGaNl0OlL1KhGWYp6NmiS7uajgy1mkC4e2wc7m+q/Y5ciE
	eVVkSpM4UUctb3igc5+w5+gHsxyPK9GnCkD+64ZHszLOoz1Ti6AeHHND0SN190Tb1UEX
	lTdv7/g794VfrObV7DL7B6nmgPZYzdk0VZLdIjRveaXpSaXZYvkqSMwTpQgONouIlVRF
	P0PA==
X-Gm-Message-State: AODbwcBwoORrByocTDvtfP2lea8ykmppsWY7oCjqn+ylb3ZUsWGE9qix
	QggiXmQBUSA3CQ==
X-Received: by 10.84.217.218 with SMTP id d26mr60031802plj.47.1495815312645;
	Fri, 26 May 2017 09:15:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::63fb])
	by smtp.gmail.com with ESMTPSA id
	f72sm2723752pfe.62.2017.05.26.09.15.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 May 2017 09:15:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 09:15:01 -0700
Message-Id: <20170526161501.30122-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170526161501.30122-1-raj.khem@gmail.com>
References: <20170526161501.30122-1-raj.khem@gmail.com>
Subject: [PATCH 2/2] glibc: Configure with extra hardening options
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
X-List-Received-Date: Fri, 26 May 2017 16:15:11 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.25.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc_2.25.bb b/meta/recipes-core/glibc/glibc_2.25.bb
index ab6fbbea2a..83a1249b8c 100644
--- a/meta/recipes-core/glibc/glibc_2.25.bb
+++ b/meta/recipes-core/glibc/glibc_2.25.bb
@@ -77,6 +77,10 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --with-headers=${STAGING_INCDIR} \
                 --without-selinux \
                 --enable-obsolete-rpc \
+                --enable-tunables \
+                --enable-bind-now \
+                --enable-stack-protector=strong \
+                --enable-stackguard-randomization \
                 ${GLIBC_EXTRA_OECONF}"
 
 EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
-- 
2.13.0



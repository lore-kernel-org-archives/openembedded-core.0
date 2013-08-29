Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 14CB86BEF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:02:21 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so349881eek.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=E2VwCVh7Oynim10Fk89w1D51Zf+iog+YMR29hbjDXRo=;
	b=Y3ZD8ZAkDflYP2usSdjBNiDDCEw4twldjqM08/i5uN9mPgOxkebZdNs9nYYziPE8Zv
	qbrjgkJgvbO7M+0RY4XAa5wEvtv+SwXfwWYhC2foJwUoTy279qLWCQUvbkMli0OWsJ8F
	u6pGqUw5/dvz6/bAsNYruaAC8brdPyRHgImO9RUK1M8fIbms+tMRM7aKjpx6ycjOj/zj
	Wj1cqEZ//ed4JgTyGe6Cx7bw42lMzQBhlF8NJilhx9Wj+6qopNZNXybjUMT7IO48JgQZ
	MHBg9J9fCmVeFrbrYgI2+rMJ8MJlLfhhXon55MySnKXavbTgHtm3j2PZ6ZPKQXJ5zp93
	Bo1Q==
X-Received: by 10.14.88.65 with SMTP id z41mr5374681eee.38.1377792142532;
	Thu, 29 Aug 2013 09:02:22 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b45sm47234473eef.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:02:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 18:03:07 +0200
Message-Id: <74f2ba0c425e39034d7d27e27fb5b89394b3ddf9.1377792006.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 20/20] qemu: Add PACKAGECONFIG for nss, uuid, tls and curses
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
X-List-Received-Date: Thu, 29 Aug 2013 16:02:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 97e9b7b..c8a2182 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -82,6 +82,10 @@ do_install_append() {
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap attr,"
 PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
+PACKAGECONFIG[nss] = "--enable-smartcard-nss,--disable-smartcard-nss,nss,"
+PACKAGECONFIG[uuid] = "--enable-uuid,--disable-uuid,util-linux,"
+PACKAGECONFIG[tls] = "--enable-vnc-tls,--disable-vnc-tls,gnutls,"
+PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
 
 # Qemu target will not build in world build for ARM or Mips
 BROKEN_qemuarm = "1"
-- 
1.8.3.2



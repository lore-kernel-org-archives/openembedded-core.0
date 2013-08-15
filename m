Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1103A6B906
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:18 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b15so185823eek.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=t1QVIbPq7KKZaTkdqFektVV2UbVyShAj3IH40bh1v1g=;
	b=QWxT4vr5dSPieTXDtaArxA/b/drJw/e/OacPJlyitPuJP/8pfR4wJPwdaKW1I9SaVL
	1f7NWKV/kCfk7IAekL+Xl7hp16w2xAWWZndIG3uO/1WEhPYZQOWsCr0lkO4qZaZfu2eh
	sV1pQLQa7f3l0wzr7la1W2aMnhBYUzlr5bQoxKFGY4JBmBY7U4vPrSjHT51bkOyv1Js+
	xSYrU3K8hPu4q1Bwq8WIUYoMG4uoxPa++/c/moJE/liWROtIsqJZf/cVJ7fk6BiaKSC8
	ojl2c6mJp3uf4/tnY7IebTy3KrA7fwTvDtcynwg+x6I37xqUEGR1+elgbp1D75roKPDV
	6K0Q==
X-Received: by 10.15.21.142 with SMTP id d14mr141779eeu.90.1376551399518;
	Thu, 15 Aug 2013 00:23:19 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm81970433eeb.11.2013.08.15.00.23.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:32 +0200
Message-Id: <bd69b08a7415d3401152801dc9d7fc360eb6a69d.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 21/33] grub: add PACKAGECONFIG for grub-mount
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:19 -0000

* fuse is autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-bsp/grub/grub_2.00.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.00.bb
index 8d224242..5153b6a 100644
--- a/meta/recipes-bsp/grub/grub_2.00.bb
+++ b/meta/recipes-bsp/grub/grub_2.00.bb
@@ -33,6 +33,9 @@ FILES_${PN}-dbg += "${libdir}/${BPN}/i386-pc/.debug"
 inherit autotools
 inherit gettext
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[grub-mount] = "--enable-grub-mount,--disable-grub-mount,fuse"
+
 EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont --program-prefix="" \
                --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
 
-- 
1.8.3.2



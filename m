Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8D1397E661
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 10:25:36 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id m3so8104290wrv.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jun 2019 03:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=B5+PXoibgfi0AKDdLdS+26KCUfjga486LD/0mnQpfXM=;
	b=GxHrk3DX+S3phWtPSkJRpTYItJX4qCKJIC09BGImDQRjDTldBK9dbfLC+FM8qfkelF
	CfsxAt5pxLksHym+jtitn8vMBmFvWu1E/XEHYiDO8j2FBxytmnnIHPJ5FY/xFkUMiY0o
	hBRDd9yMQUFENDF37YUqunekj3V7xJ0x2S1k8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=B5+PXoibgfi0AKDdLdS+26KCUfjga486LD/0mnQpfXM=;
	b=X2PI1em9J0WXKcby4iNi3uXt0XX6oynytw8Xx95lh65HsCr0dMGNUoMR/ZF059892g
	m0s0d89f1rsxoewzuP3qbjEIp/On79wn6isCOtI11DNfdrhjlM0KKIoPGhEHPzhe/wsD
	46Iu7ptl3wo6zBJy5OAnEjB6+sRkM3HTZZKy1+xdQAAI8OwPvsMUAGtRyVN9wZlLatE9
	q8rshKNa6tB6i6w9KJg0JKa4JdbxvUbE/n5zXESi/UhIYPoGu6BkYdt4epzzXRjX12xJ
	pDXgPjgnFwEm96tZY6QZusC1fjZxL2ns630hGNRqb69hQmblojgsD4f11msrHorDA2DU
	LUXQ==
X-Gm-Message-State: APjAAAUPzwGO76kcubYN6t/qZwq821Vfd5nSyy+j8hcbWkOPX+AxsvkC
	OzpjZqP2VFv7RGsfZGD2qsy2pWDoJz8=
X-Google-Smtp-Source: APXvYqyzsrwsVwFggRV27tqkcTvdJ6/Y1nCNSv+7xxGP//cKOFCsLjK/lnDvk7xgQxA/kn8CxIqwbQ==
X-Received: by 2002:a05:6000:1150:: with SMTP id
	d16mr10227998wrx.63.1559384737332; 
	Sat, 01 Jun 2019 03:25:37 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a124sm11912234wmh.3.2019.06.01.03.25.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 01 Jun 2019 03:25:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jun 2019 11:25:30 +0100
Message-Id: <20190601102530.5995-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601102530.5995-1-richard.purdie@linuxfoundation.org>
References: <20190601102530.5995-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 8/8] libxml-perl: Fix module and ptest dependencies
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
X-List-Received-Date: Sat, 01 Jun 2019 10:25:36 -0000
Content-Transfer-Encoding: 8bit

This fixes runtime errors when running the ptest in a minimal image.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/perl/libxml-perl_0.08.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/libxml-perl_0.08.bb b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
index a2eee9aa6e4..818ae3d5713 100644
--- a/meta/recipes-devtools/perl/libxml-perl_0.08.bb
+++ b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
@@ -26,4 +26,5 @@ do_compile() {
 	cpan_do_compile
 }
 
-RDEPENDS_${PN}-ptest += "libxml-parser-perl"
+RDEPENDS_${PN} += "perl-module-carp perl-module-overload perl-module-universal perl-module-io-handle"
+RDEPENDS_${PN}-ptest += "libxml-parser-perl perl-module-file-glob"
-- 
2.20.1



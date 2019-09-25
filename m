Return-Path: <george.mccollister@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9D1E97D5C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 11:53:37 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id h144so12985318iof.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 04:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=diDV/8f2ehkwVzunejyP5d/dssqKJM/1HWHkznm4fsE=;
	b=nJX8z9PynKqGw45lX5E9pTivU1Q9GD9L8tA2Q/NpmQK4y2GvOjTmmHtF4K0lG/CGoW
	3CxZy37FyiukYKS6nHqbvxuWkwJJ3k82P8onDecstcbHgwvpy7ToViaS9VI81sw2Gkz1
	pJVf3tDp/1MHYyXP1cFL3HHTxlVOCjMcBrd/F88Y3Wpekppmqdui5m9+W1Ej+IZmDSBz
	faS0uwCc42ra3IJkvAHPUPScDEJSpS8lcpZSenr61CUJJz11CgrPpGYDF4jA5ueNRqbh
	yWEFxO6r8u8sUR6WUF5EWbCZWpBIZRzh+MYpgRTH2my8UqYYh+O13anXLB5ugG29sb+Z
	Gjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=diDV/8f2ehkwVzunejyP5d/dssqKJM/1HWHkznm4fsE=;
	b=J7BakegVT+vqazmoxlKxIT+AKI9X1S/lFlG/i/d5dlnHQERMOwINsfdHspq12dGUGG
	DzQjV7pKzMz665ShGJ+WZbAQ+37yi738woEZeI8RYUEfgJXZZ0fYSfhUXcbxQnq/U8C/
	OsmmtOveaXqleVcjAn5JpwXieasA8ZxOFKyQNvdR+7y3nb4yW8NZisnwYH3KBsYejd0v
	f/OCnvz3Fy9E2E153lcWqS7mvMSn9oePy2ZEdowzHFeDygM8OXyeGzc29IhHP0wsUAZ1
	0E4ZpGKtgK2nBBdFEyEllFUUzqgrS0aK3JKnvJCjaN6L17LQhstcUzZq0uLt1uC1IAVp
	QGzw==
X-Gm-Message-State: APjAAAWaQZIkNUgVGBZlDe4FuGE+l9nfaJ8O3hEW4q06e3AKRpdiXuJ2
	kFxZvCczuL4TmgdiveaQmJLWyY4=
X-Google-Smtp-Source: APXvYqxjxJKNarLpzQv1GHNiRwmnOuEFGGL166PK0Do/0924yjA7maok1BQ/zHke+ynCjL4LTZY0Ig==
X-Received: by 2002:a6b:c302:: with SMTP id t2mr9250938iof.217.1569412418537; 
	Wed, 25 Sep 2019 04:53:38 -0700 (PDT)
Received: from george-i7.novatech-llc.com ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id
	x12sm4441332ioh.76.2019.09.25.04.53.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 04:53:37 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Sep 2019 06:52:59 -0500
Message-Id: <20190925115259.26437-2-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190925115259.26437-1-george.mccollister@gmail.com>
References: <20190925115259.26437-1-george.mccollister@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] openssl: make OPENSSL_ENGINES match install path
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
X-List-Received-Date: Wed, 25 Sep 2019 11:53:37 -0000
Content-Transfer-Encoding: 8bit

Set OPENSSL_ENGINES to the path where engines are actually installed.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
index 072f727e0b..8819e19ec4 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
@@ -148,7 +148,7 @@ do_install_append_class-native () {
 	    OPENSSL_CONF=${libdir}/ssl-1.1/openssl.cnf \
 	    SSL_CERT_DIR=${libdir}/ssl-1.1/certs \
 	    SSL_CERT_FILE=${libdir}/ssl-1.1/cert.pem \
-	    OPENSSL_ENGINES=${libdir}/ssl-1.1/engines
+	    OPENSSL_ENGINES=${libdir}/engines-1.1
 }
 
 do_install_append_class-nativesdk () {
-- 
2.22.0



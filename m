Return-Path: <liu.ming50@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5EEBF7F1E4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 14:20:05 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id r12so18638441edo.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 07:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oXVJX+CQPnSjeRjHDX3yxC8xOGU6bElaOeT6xRRnH7Q=;
	b=hYF1c+W75LoNUdRuyGcGpEi6T2R4hTCXGPthVqmmboiOeRcMRohuENz1vwpv/rpDyj
	7LjsAKsMYO7d/yDUaGa29+mXDWzt/5XvWTD/kuWUJenJYbof8kJxwKahvV/rEwE7kPmN
	63uukBrPnxLwOdV8jgOLO0wuxsDWYyTtn5nVVIA8XJj0HewTspxjVa7Iy0uXflltCwdZ
	J4Vw8s5FwW28pBoBJcBNtRYeAJrm0L+BEvfPZ97ax5mbQZf6LdbFKoGA76T1RxXfBgTR
	5IEsEkKh7iQqeKbgS96l1/TVpMj1IasE0SlRS3kP6Qo9jKvB3ASxJoAYkFY7tdC9RT26
	ivIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oXVJX+CQPnSjeRjHDX3yxC8xOGU6bElaOeT6xRRnH7Q=;
	b=s/oSWZKjroPrVD7AgEj4Tyka01SWdACPRYCwXCPYl6HsZQ1tu5+C9+ANXg04rPlTxc
	NuYBBNrhNjkPGr+ZHY7zPXflTx9sUErWfNXSx4NZ23lkv247k3TSyggu4F9TlpGtbQ7Q
	UJEOXQtN/6NZVCOySod90sHQAGGDbQ4f412gZge9DFL5gu1q/Eogt22ydJS8S98a/TA4
	SgkijLTxoQGp8cdoB7lEI+S3XQ5n+OB+C3yXooR1nEyqwMqZxIrBT9gC+PR/EkxHoTY3
	WTLjaxVh3IaCyZ8eHah7kHy1sqRuMoPP5Bm4hKI5E0NCr2Hh8TaCZN2LNHgw4O9wJsUA
	QA7A==
X-Gm-Message-State: APjAAAWCfAERXXywkcEL6aEkA6pMsVB+I4emqP+HMz6OAXvaBKgdX+d9
	sMwKDIlDZDLx2GDAb80zdkTZGUBO4so=
X-Google-Smtp-Source: APXvYqzaYqW85RKxKuVuGdtdLsUKqPcPu2u2BPt9rcE0ZI/jQ3o06n6fWJzjWt3gHmmprRbtF0fmkg==
X-Received: by 2002:a17:906:6492:: with SMTP id
	e18mr26495661ejm.133.1564150806037; 
	Fri, 26 Jul 2019 07:20:06 -0700 (PDT)
Received: from peterliu-Precision-7530.toradex.int ([27.191.203.138])
	by smtp.gmail.com with ESMTPSA id
	x10sm14225727edd.73.2019.07.26.07.20.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jul 2019 07:20:05 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2019 22:19:40 +0800
Message-Id: <1564150780-18125-3-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564150780-18125-1-git-send-email-liu.ming50@gmail.com>
References: <1564150780-18125-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <ming.liu@toradex.com>, stefan.agner@toradex.com,
	luka.pivk@toradex.com
Subject: [PATCH V3 2/2] libxkbcommon: RDEPENDS on libx11 compose data
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
X-List-Received-Date: Fri, 26 Jul 2019 14:20:05 -0000

From: Ming Liu <ming.liu@toradex.com>

This fixes a following runtime error:
| xkbcommon: ERROR: couldn't find a Compose file for locale "C"

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb
index 8fcae12..0608fd5 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb
@@ -20,3 +20,7 @@ EXTRA_OECONF = "--disable-docs"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,libxcb xkeyboard-config,"
+
+# Fix a following runtime error:
+# xkbcommon: ERROR: couldn't find a Compose file for locale "C"
+RDEPENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', 'libx11-compose-data', d)}"
-- 
2.7.4



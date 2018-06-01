Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id CE94D75065
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 22:15:11 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id z6-v6so6824108wma.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 15:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9c4vATChEIJ7yxgif6JxaWl9DNjvjXAmy3YywuNA4vQ=;
	b=S58KylEgNctUTbwrOO5tkTUIaru3wHCSK/bmYWIBLguVCv/2vx3wyW6ptBw9UZo1l+
	0/UzKUAaW12HryUfQgpfh5gU7q2KmsXA4A5C9cM1vwNWmYPJWow8/X699Gkng/MHxDnX
	Gw3CffXkliwOsaPDi8O01X+SL+BQaGHbtUsHJx/P9zNbS6PHIe+Iq9Bei2NLnnOhjScB
	osJF/1gshoL/EBgdByV2+XRZjFbJ/VzxXG5OeECXmblKLrl1NfNaZ6iv5XnkDwe81qIF
	wpzY5nVfkLUDIzLSJgZ1jtqIjO1Tm4usYJvthiMPzB7WEKR3UMIihC8Cg5nYOXSkdsPV
	PSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9c4vATChEIJ7yxgif6JxaWl9DNjvjXAmy3YywuNA4vQ=;
	b=A367GdeTKTMiEcdheKsAZoiFiJke3Llt9ZXLILdSFY4O5yNRG/w6t/rxr9nSbef6JN
	J9sENLhhRnltD7q10P+UcOJurG54wAEqUCoAk+P2+wHJDLz39o3VBakyP1vFTITU6Hsm
	IiiRJNDA7rMsGPCwespX6oMyQPmjS0ORP1rYicsmaR7/Go3KeEnToq6Unp7GJGL3bO2P
	qfPSjzGe/sCletToPZWaNUcTb3pNwuqSZAkEqGqKyr5+4X6GGSDN1xDmCvs7n8niD0Bv
	5QCa6O07VySQjtfh9rIfokntQmi6+09t6h4UCcmmodSFr1OZpBELiOt1Ove2uDmWjRk8
	DoBA==
X-Gm-Message-State: ALKqPwdR76lWYMz7HCsKBLgfI88eP9SbIScdf1XJ+1KBbgxlVAOykAoC
	5Qi2OG32JOaAGFLIsj4mJyveUxqC
X-Google-Smtp-Source: ADUXVKIlD/pxaGUxcaDMKl/LzeUGDXDyN64Cp+JZQQtYuajom5CuF4Bu/rsgF0Colgh3Prvtdp3H+g==
X-Received: by 2002:a50:ba6e:: with SMTP id
	43-v6mr14390216eds.194.1527891312110; 
	Fri, 01 Jun 2018 15:15:12 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ae08:1403:ff00:489:7961:466d:7cf7])
	by smtp.gmail.com with ESMTPSA id
	t1-v6sm21902962edq.84.2018.06.01.15.15.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jun 2018 15:15:11 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Jun 2018 00:14:40 +0200
Message-Id: <20180601221440.29992-2-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180601221440.29992-1-dev@sashko.rv.ua>
References: <20180601221440.29992-1-dev@sashko.rv.ua>
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-oe][PATCH 2/2] iso-codes: fix SRC_URI
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
X-List-Received-Date: Fri, 01 Jun 2018 22:15:12 -0000

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 meta/recipes-support/iso-codes/iso-codes_3.77.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/iso-codes/iso-codes_3.77.bb b/meta/recipes-support/iso-codes/iso-codes_3.77.bb
index bd613ac573..d899a7fa82 100644
--- a/meta/recipes-support/iso-codes/iso-codes_3.77.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_3.77.bb
@@ -3,6 +3,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://pkg-isocodes.alioth.debian.org/downloads/iso-codes-${PV}.tar.xz"
+SRC_URI = "https://ftp.osuosl.org/pub/blfs/conglomeration/iso-codes/iso-codes-${PV}.tar.xz"
 SRC_URI[md5sum] = "9d0d06cfb4634428b300845edcd7140a"
 SRC_URI[sha256sum] = "21cd73a4c6f95d9474ebfcffd4e065223857720f24858e564f4409b19f7f0d90"
 
-- 
2.17.0



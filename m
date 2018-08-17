Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 505F2792B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 04:43:48 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id g23-v6so169648plq.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 21:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=svHM4ptvmCQUy2BSeg4a9cHbFtRX1qx8quXbDUeLdJc=;
	b=DlHKTnM/+jZwTxkAgWI8gmSb2ayDXHfmHFYTOIXqPTf1cHRcd8Mz/AkZa7fu7zTS1h
	oQS55wQ75GYnt1Xygab06k7BtBhwxt+zP/WTLUiJw6+wbXxR3xY2J5HPWVh/TXBS2OBD
	vR3DUKqDqFOIvOWv3kInypQgTgtbKEZkujJ0I+4VxobUJ4f1syUcA8va1BeXHLoezbp0
	nBwAkY6lYABn8b7/ZUTFN+NEoCA0/I4w3FRs18Kesb+rQ962DA6kCgfhth9BUBM2oVGP
	d2Z5NF/RPgtKZw5yMqlUy/HcQWfTgTCjHY+HgBCQ1MFckkUq1NGiAZ6iX5LPoALtRdqT
	37lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=svHM4ptvmCQUy2BSeg4a9cHbFtRX1qx8quXbDUeLdJc=;
	b=Not3AYggklZWBp7nRX7WRI1andHPPw5O8cihLBdCkGkgGVEV62IMq+W6hPNr0NqmDV
	1JUzAibIfKc8XeyxeDw9FmaEQrV6Da6mwp/ASg/bIbM9RKHLLnOnoj6UMvxgI83Vv3aE
	yv3Lkulj6Vf/J3WRZvSJflg7h1iue+myntFRglFu6IO1ssK8+x8fV/GofGI4QDhKuSNM
	9t2Bb7EYWW4YsCZIbWrkhOWPwURlpGbWA2/Zf2DajyEspaONswQkWzew8dMUzZeiA6V/
	cxW7aH2I/lcZvAlcVduHw1iEno9p+AEa/86fPSPuTGRiW4xTwoWdBrYTihQkBIaHBgig
	w6iQ==
X-Gm-Message-State: AOUpUlEMizkrTSLJl88104Oh5lMZ0YqzOKvNyL8Q2eeiLH9bsxnI9NAk
	EGo7S6G3B/Rp77TaHyXVgcnGrAeg
X-Google-Smtp-Source: AA+uWPz+LdbOn1SotnvE1z6JakbhSNEeaAGCnzqiWaShshovIS0U0jRe2I5sQM8LLF9iQPNubZfOxg==
X-Received: by 2002:a17:902:8bc4:: with SMTP id
	r4-v6mr31396611plo.257.1534481029438; 
	Thu, 16 Aug 2018 21:43:49 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	r64-v6sm1157526pfk.157.2018.08.16.21.43.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Aug 2018 21:43:49 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2018 21:43:34 -0700
Message-Id: <1534481017-17310-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1534481017-17310-1-git-send-email-armccurdy@gmail.com>
References: <1534481017-17310-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/7] openssl: openssl-misc dependency on perl should be unconditional
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
X-List-Received-Date: Fri, 17 Aug 2018 04:43:48 -0000

The openssl 1.1 recipe doesn't have a PACKAGECONFIG option for perl,
so the RDEPENDS for openssl-misc shouldn't be conditional on it.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.0i.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
index 3d4b7ee..d9c19eb 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
@@ -163,7 +163,7 @@ CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
 
 RRECOMMENDS_libcrypto += "openssl-conf"
 RDEPENDS_${PN}-bin = "perl"
-RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
+RDEPENDS_${PN}-misc = "perl"
 RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions bash python"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1



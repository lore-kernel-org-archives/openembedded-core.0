Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
	[209.85.167.50])
	by mail.openembedded.org (Postfix) with ESMTP id F366A7D1AC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 22:13:06 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id 10so7460538lfr.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 15:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=gwxs4UGKvJfF8QfdxjHbXFT+Es6RKiAa/9Vv4wEXh9k=;
	b=r9SnwH1pyHUtCv4/LeZnjSNmEkoabQ91YrSwC24g6eBnh0BcD4bfMk88qAtFP63Gm8
	pMCxBkpeIlUieecPnpMj8imhR9XvVNpTYz90g3QKiNVJqTalyWFoHgfe9VE2LyVDjwdl
	HuH9mFvXh+0X96KXBrKHY7oDsTxANRE/3/p2izK65Dg8Nxf28iQAWzdFWXdwB17L/Au4
	zqm8bwJjwRIsRF+GQjkKI3AZsI0v9HVTF/TfUvFioWyBq9eIPSqkn6n+IEhGaYdDWI2E
	JxKybTBDrGPzW7ZsywEDFlzsz/oQLwK0exqwYCrcOQuyFDVGMkSNoowwra5g7So4cvot
	heZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gwxs4UGKvJfF8QfdxjHbXFT+Es6RKiAa/9Vv4wEXh9k=;
	b=oG9/XZmQFvKwp5fIzJOsICb5Nd1cphLTOtHM6GqIBOHeC1xZ+Of5J6yfo54MQlJDPD
	GKZQnsiROLf9kXphee+hTcMgqKN5gw2qkyUUEuPlVQTPpU/RCKYkT8vzk5cvbJrirMMN
	Tg6vDakWGZllbZGbCdeuVgafIwMouFchjI+sAx5KGab+b4xAC5EK2v7pCZ89lTLxG0Iz
	rBymQsfofTYsST2UJWqtjbDUd3+4oofyTdRV94qLIjuXg+jvCEP/Pb7ry9/vaRWF8c2n
	UJX5PurXMSV8QEg2JSBC2ITdY1Duxs0W0Ezk0cS0oK4o3JnjYwHM/b//pJIEx6knC+7y
	l5EA==
X-Gm-Message-State: APjAAAVPxLnF2akxtAE5qgt4hLOe2p7zC3p/Avoq6xmavnyEfR2LrwkG
	ok2zvZpNKnMYnZC9MyjmMde0Zj2OW+8=
X-Google-Smtp-Source: APXvYqw2s0zMF81fWPP0Ch3kcGpn/Q8IWUHnwnCLSVFK2fxB7d2HmMxEriwG8Y/5NiIVkSgg5FIATg==
X-Received: by 2002:a19:48d5:: with SMTP id v204mr35578286lfa.70.1554156786869;
	Mon, 01 Apr 2019 15:13:06 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	s26sm2421443ljj.52.2019.04.01.15.13.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 15:13:06 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2019 00:13:03 +0200
Message-Id: <20190401221303.7192-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] dropbear: update to 2019.78
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
X-List-Received-Date: Mon, 01 Apr 2019 22:13:07 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-core/dropbear/dropbear_2019.77.bb | 4 ----
 meta/recipes-core/dropbear/dropbear_2019.78.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2019.77.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2019.78.bb

diff --git a/meta/recipes-core/dropbear/dropbear_2019.77.bb b/meta/recipes-core/dropbear/dropbear_2019.77.bb
deleted file mode 100644
index d2a71ba647..0000000000
--- a/meta/recipes-core/dropbear/dropbear_2019.77.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require dropbear.inc
-
-SRC_URI[md5sum] = "5d4f0256c5d13820b0a3eaadb1a0bc1a"
-SRC_URI[sha256sum] = "d91f78ebe633be1d071fd1b7e5535b9693794048b019e9f4bea257e1992b458d"
diff --git a/meta/recipes-core/dropbear/dropbear_2019.78.bb b/meta/recipes-core/dropbear/dropbear_2019.78.bb
new file mode 100644
index 0000000000..d2cd8161bf
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2019.78.bb
@@ -0,0 +1,4 @@
+require dropbear.inc
+
+SRC_URI[md5sum] = "a972c85ed678ad0fdcb7844e1294fb54"
+SRC_URI[sha256sum] = "525965971272270995364a0eb01f35180d793182e63dd0b0c3eb0292291644a4"
-- 
2.17.1



Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id F39956C60B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 20:25:13 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y185so8883461wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 12:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IF4cGuP/gOPqs7dMCWeh0bdsYERD004jreaGbFWZIBM=;
	b=HyZQOt9eVt+qVMz08TpIA0Dlce+qPaNWQXXX46ReSF1P/IypfCrqylaWVsZ/A0Z8ri
	mC/E4kFDkfVJ9eohNDsTSa6KK0uI7ha8NfCHVon8yCh4jmwELxPy2o2Sn88rX0hMYm0o
	3KnktKaBIoq23BdIqegpJ96hzvpbvLwJcOE5nkvmyp20oNQCIVu+ZX8E0XnSmZy821JS
	jYraLPaoMrnpfjLODpgIsehmKHH5faQrHyFT23u/pZaMN51Bfpl6PJ/tRrQZ+I5LH1vp
	AFMLnxW8Huha8IUTXFFEECPg62nxf79hB3KYr1Z6CEsaEllM5zBkelIu0g1Q3UaIPNmJ
	ltBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IF4cGuP/gOPqs7dMCWeh0bdsYERD004jreaGbFWZIBM=;
	b=PszWlwlHlZgHpk5oXTm659E+7oTk360JW+bzZYSiGZumcBPnemjgIodrybJk0/Rgbs
	Je82ka2btmOBksEhjHiAYFZu5jMB4c1fQYVPJdE695MkLkG4TzCnhjPr5mqHUcaQkGjy
	0IfdoyOaA+J3dfx4UzfPaTx0zwjLQ7930lv2uAE05bIU1ULeh4f7CbZqDI67yYnDnDs1
	vpUnIVdWsMFVeCtZOooaCCTihIH4U1++w0mVIOiTRbJRHtSm2pahG7NH329Eicw623FX
	TDRYB37SIj888bSw2xv2N2iNkg0/oOAzaZSAfuwd8TKBK5sxI58rXtq/jUmd0JXXbRl3
	Ed6Q==
X-Gm-Message-State: AJcUukdtKGd88CteiSLzcMnUAdCXXhGPnWZG9eSmf7RC1iuUFc06WAbm
	GA3r5vjQ83WQma74563s+WVgViUk
X-Google-Smtp-Source: ALg8bN4EMu0IzQMjzQLxN8yzVMIlUuEdZTGcSjK2kWwIfWbOL/V/gupBqMuI8Pe+4L34wHL0Cdjyww==
X-Received: by 2002:a7b:cb0a:: with SMTP id u10mr14992935wmj.0.1548620713670; 
	Sun, 27 Jan 2019 12:25:13 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F14C6483FDE94AFA075100A.dip0.t-ipconnect.de.
	[2003:f0:7f14:c648:3fde:94af:a075:100a])
	by smtp.gmail.com with ESMTPSA id
	w16sm145305195wrp.1.2019.01.27.12.25.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 27 Jan 2019 12:25:12 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Jan 2019 21:25:04 +0100
Message-Id: <20190127202504.22909-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] menu-cache: upgrade 1.0.2 -> 1.1.0
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
X-List-Received-Date: Sun, 27 Jan 2019 20:25:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Latest LxQt requires recent version of menu-cache.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../menu-cache/{menu-cache_1.0.2.bb => menu-cache_1.1.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/menu-cache/{menu-cache_1.0.2.bb => menu-cache_1.1.0.bb} (79%)

diff --git a/meta/recipes-graphics/menu-cache/menu-cache_1.0.2.bb b/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb
similarity index 79%
rename from meta/recipes-graphics/menu-cache/menu-cache_1.0.2.bb
rename to meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb
index 71540cf1df..dfc15ba5ed 100644
--- a/meta/recipes-graphics/menu-cache/menu-cache_1.0.2.bb
+++ b/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb
@@ -10,8 +10,8 @@ DEPENDS = "glib-2.0 libfm-extra"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lxde/menu-cache-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "8dde7a3f5bd9798d0129d1979a5d7640"
-SRC_URI[sha256sum] = "6f83edf2de34f83e701dcb52145d755250a5677580cd413476cc4d7f2d2012d5"
+SRC_URI[md5sum] = "99999a0bca48b980105208760c8fd893"
+SRC_URI[sha256sum] = "ed02eb459dcb398f69b9fa5bf4dd813020405afc84331115469cdf7be9273ec7"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/lxde/files/menu-cache/1.0/"
 
-- 
2.20.1



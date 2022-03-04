Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EBBC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:05:16 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.7917.1646406314835474765
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=D95AyJo7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id y11so7835683pfa.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=p78FtNU4yHR1mim/IzkfRrmKpEBmyufk8Haum7wrtYk=;
        b=D95AyJo77PprPegkPW4EOz3uP85pW394zh+XwZIQTVhGg9YNXd16rysOZfrB81XW9W
         vOW7PXWS9IkpeFjsbyhoyB1XOUBORhOdnE8/wNXVBerfcwoogmjxJ74ZxSVt4XRhTIud
         ELL3vqOaB2Awe7SbnxKjtfjbjKtg54ADwzN3thCkVnIotrZ26t6jQJe3Oyvq3umEBvzy
         Kacx7eOxJ7re1fJrJjXhF2Xo8j/p0oCaw8yl9pn0Ucxg+Clfzr1BB01MiqdZm0KU4jA0
         0nMFPObaZDw9tRnjm4iQHwWmb2j43Pi8vXXxoFRAjgibgbyHoZR9Z/yNlBi7iVOWQ8Bi
         znmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p78FtNU4yHR1mim/IzkfRrmKpEBmyufk8Haum7wrtYk=;
        b=SBPI/4DdLkcrJ8kvOcyzwadzmijyCHDKZf2UgGIHpmU5XMXBS5RFYV/AhHuBQFc26c
         XpZWMzzrSZMzsv31FqrpBGPN+blKn5rdeGnm1gKvbwF7PQZGs+qTT06iIX5sB6x8Jvjg
         rPvnc08iIZuCz4tFRIqvS9GcNo0DOxAlDlgBqxV86e8/38oFRk6whFElwDrHQlVaHiS0
         QFhjd4oyPkjYVx8x6/ekRbhtEz9bUyg39KaG4NvjGk8GuPq7TFIQKfk5OwKmQVftlq2l
         WbdsfrCukh8KhN3SfGBnAnNRsjgn1seGKOBOSJ7QjY7KoAvrlVg/HeLtShs6i9ecARAw
         D/Ww==
X-Gm-Message-State: AOAM532RsL3Q43IhYJnLH6MuGlJ7x+F3rYWKO0HBOsYjIKOVGJQeBB4s
	SazAWU2IPOUZoNQN6cKSg19tgwviGKEw21ZOuj8=
X-Google-Smtp-Source: 
 ABdhPJyPsp75t8GBX9ib+CX+i2AUP9jK9fmfgqHb3DXd0Dy+UHTK8M7sC0KYgMIPPer9auMcjdi6iQ==
X-Received: by 2002:a63:e554:0:b0:34c:262a:c174 with SMTP id
 z20-20020a63e554000000b0034c262ac174mr34624961pgj.330.1646406313804;
        Fri, 04 Mar 2022 07:05:13 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f194-20020a6238cb000000b004f6ce898c61sm80400pfa.77.2022.03.04.07.05.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 07:05:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/18] bootchart2: Add missing python3-math
 dependency
Date: Fri,  4 Mar 2022 05:04:21 -1000
Message-Id: 
 <123d4a673dadfee14d5ad8bbc503405da9602bb0.1646406001.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646406001.git.steve@sakoman.com>
References: <cover.1646406001.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 15:05:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162732

From: Marek Vasut <marex@denx.de>

Without this dependency, generating the bootchart may fail with:
"
ModuleNotFoundError: No module named 'random'
"

(cherry picked from commit 487e9f16a00f895159b79f1865fe8b626b47ddc2)
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Mingli Yu <mingli.yu@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index 66bd897a9a..7f05bd1b0b 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -144,7 +144,7 @@ do_install () {
 
 PACKAGES =+ "pybootchartgui"
 FILES_pybootchartgui += "${PYTHON_SITEPACKAGES_DIR}/pybootchartgui ${bindir}/pybootchartgui"
-RDEPENDS_pybootchartgui = "python3-pycairo python3-compression python3-image python3-shell python3-compression python3-codecs"
+RDEPENDS_pybootchartgui = "python3-pycairo python3-compression python3-image python3-math python3-shell python3-compression python3-codecs"
 RDEPENDS_${PN}_class-target += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
 RDEPENDS_${PN}_class-target += "lsb-release"
 DEPENDS_append_class-native = " python3-pycairo-native"
-- 
2.25.1



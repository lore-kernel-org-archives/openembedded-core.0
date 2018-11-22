Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 58B6B6C5D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 15:42:02 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c14so4060680wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 07:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=N+klM9QYn2oyUxSIMNTNrQAaC74ytC6wqPGB3dO/7r8=;
	b=bARPJx8gLgpwlUy28LsBuHGEHeaG25UTdbo7jVqyDhPDKH9+bOX66/nmUhabvdadXX
	iWBnKDhliXzwpErAip8YDOc6/GG/ygWh4TEAnKSj9XLAXLAg5hBui5btcCsaQt4WG2et
	iSJBoiH+jnt7Q6ly6fGTkbQawZfwBcg179gE9qkGYWEug0FAFxWCayJ7qg+vWGHmWJyy
	sSR5lFj0Hu9iwGtSWl/rQ1aG+KAdUCZA7AtdGSzySIRvF8ZzUvzj0Zkmv5cypTVdveT3
	7qLTIjMFHGrtiqB2Xj7gfsp9WVQ6Sovqy8K76nh9Tee06yPm4Yls7CVvsCV4RezK61I7
	T9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=N+klM9QYn2oyUxSIMNTNrQAaC74ytC6wqPGB3dO/7r8=;
	b=QvLXDXDKg05LCQQDSCE1J8JJgumz1TsDR0V5XPNB5yprln/AMNe86EwLdN425UPdcC
	kBsV7yzsO/ICBWCSf8Z1MER1TWMGNFeXDW0bQ8Ezbw17EG3lFif6wF30q+7BgnF7WrN/
	FMwO5pasLlzafIFxi6vVMgvG2LgQTDc4K4Uzaxx0k40xSD4N355WLp9hP3o3U1LDH+wE
	XYha837vSN0EoguMD0M9SLBnTEqlB8AH3lmuCmcXoN+XB+ySIM755WY8VWwYiDjHNHRA
	NMbxuiLsIKzPWgjyVpz3hHf/qIj8jtU58avNtUjKDUPyr3BqJTwoB3F0R2EIT+k38Sz5
	LWQw==
X-Gm-Message-State: AA+aEWYXkKk5nNuYgppoFartyVwZE7RmchOwAwwbVD3IQxpRd+E5dD57
	drfj4YozG0EuS77xHrjopigBzmYv
X-Google-Smtp-Source: AFSGD/X9etsp/fwrrCwP+eYrAus2oAfdwz3ZwZh5PdGwAA6WJnunA/IIrIFpeHWino7qADuvpgHilw==
X-Received: by 2002:adf:d112:: with SMTP id a18mr10695630wri.17.1542901322818; 
	Thu, 22 Nov 2018 07:42:02 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e8-v6sm3302931wmf.22.2018.11.22.07.42.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 07:42:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 16:41:34 +0100
Message-Id: <20181122154136.121480-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181122154136.121480-1-alex.kanavin@gmail.com>
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
Subject: [PATCH 14/16] lighttpd: update to 1.4.51
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
X-List-Received-Date: Thu, 22 Nov 2018 15:42:02 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../lighttpd/{lighttpd_1.4.50.bb => lighttpd_1.4.51.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.50.bb => lighttpd_1.4.51.bb} (96%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.50.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.51.bb
similarity index 96%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.50.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.51.bb
index 5373a61d703..f28fd2f6905 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.50.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.51.bb
@@ -20,8 +20,8 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
         "
 
-SRC_URI[md5sum] = "0547831efda8492648b7f0c652865dfd"
-SRC_URI[sha256sum] = "29378312d8887cbc14ffe8a7fadef2d5a08c7e7e1be942795142346ad95629eb"
+SRC_URI[md5sum] = "6e68c19601af332fa3c5f174245f59bf"
+SRC_URI[sha256sum] = "2af9fdb265d1f025bfa634e13770239712ecbd585e4975b8226edf1df74e9c82"
 
 PACKAGECONFIG ??= "openssl pcre zlib \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-- 
2.17.1



Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6DDFE79B57
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 22:59:51 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id e24so4613428ljg.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 15:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=hi76ygTz76PtL6FgYLovbYxuB9FYvXe8vWlj//EwpyY=;
	b=G6G0Y6J7xd5OZMuuCzq80r3Jc9iq2sxrlZCVpD7v/Qgwp3fqLGW0yffQS8nWDekrq7
	EzD18sK1439HAxKoY539rjXKyng0Xtd/OF3W4wDJ/Fndqq2VgdVE8zRWGeBF8Z20kiUk
	+LUEALSQJOJdMuwtwcnSx8/oWtg7ZGDWn3sDJZ9gjNXNYJItSwNuq8GNmctjpvOSCB13
	nBn6VvwA4/Vi1TOg+MHvm6f+5zNpmk+LIl25hciAy+aybpqcf8mcZRu/+uLlNW6XiCUX
	gHiOUCilQtAa5PISGCb1D3FqS2iHwg7N638CZ5x/FcNpTYvmq0b7kcJmGcSyv6yFLAbr
	DxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hi76ygTz76PtL6FgYLovbYxuB9FYvXe8vWlj//EwpyY=;
	b=TgLAtQnxEe13WXnOkxpe8KUlzy0Ubk06azkdbyEmTckIse15cU3dsyhnMzsIHS41YV
	QsiNxk0J3aLLyCnZTP1vkRgtQL1Ss1/KJV0BGa/sVf/HfKwgxbXZD+kBuiETzfKB5yuy
	jHOmwrW4vkdG48eXXMz5XLjLX/TFBL86PyM6aEy868m9Bpi3XKIiDFW3rov86df3qv2b
	8YeKKe53DCRplb7PwaweyPJFqxnVsSK+l3iG8sztArsWpKGhdCNniOpXcooMC0xdvYsg
	399vinYgAASOy7Rv97JK2s9ud8zYyu72uHZKiwuv1xFK/v6lZTF446f2misO9HkJkQVw
	bzWw==
X-Gm-Message-State: APjAAAX8F7WcpgZCZBxwzAsoeq3eGkQr2Oi7+qMB0X1hOzLCY/IfMuuF
	J3834S4p8yFeI3jkxRF9IaevLYaE1rY=
X-Google-Smtp-Source: APXvYqyGQu7FwjALuWBzcl7jkeyh30VAEAPs/3+kTzne0v4WlOO54c6UGAyvjoxnwlTc2v+MfAGazw==
X-Received: by 2002:a2e:9b0c:: with SMTP id u12mr6886215lji.239.1567119591665; 
	Thu, 29 Aug 2019 15:59:51 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id z128sm593169lfa.1.2019.08.29.15.59.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 29 Aug 2019 15:59:51 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 00:59:49 +0200
Message-Id: <20190829225949.5884-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ell: update to 0.22
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
X-List-Received-Date: Thu, 29 Aug 2019 22:59:51 -0000

Changelog:
- Fix issue with DHCP and T1 timeout handling.
- Fix issue with escape characters in peer identity string.
- Add support for setting peer certificate's subject CN mask.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-core/ell/{ell_0.21.bb => ell_0.22.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/ell/{ell_0.21.bb => ell_0.22.bb} (83%)

diff --git a/meta/recipes-core/ell/ell_0.21.bb b/meta/recipes-core/ell/ell_0.22.bb
similarity index 83%
rename from meta/recipes-core/ell/ell_0.21.bb
rename to meta/recipes-core/ell/ell_0.22.bb
index 487fbccab5..b3942fc30e 100644
--- a/meta/recipes-core/ell/ell_0.21.bb
+++ b/meta/recipes-core/ell/ell_0.22.bb
@@ -14,8 +14,8 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "f94f8c812b0426b0c30b651fa5142dd9"
-SRC_URI[sha256sum] = "a0db4e3057ba41035637354b6af2aa4c74f83509e0c3e563d682df9d72eaff17"
+SRC_URI[md5sum] = "a4e7d74404f11e71775b89f53a8f1c33"
+SRC_URI[sha256sum] = "3c1d6d997e17dfcbe4ebcd1331d9a7be5c64f2f0a0813bc223790e570d8da2e3"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.17.1



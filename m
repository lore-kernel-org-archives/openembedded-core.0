Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6BC2A7CECB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 15:24:31 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id u16so6544948wrn.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 08:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=x+cF4iNFSO9bEmPCWGy82wibQhc4+lgtYJONoO0APng=;
	b=IH99EYFHE6vnp76kAr13eI8dODcAWht4m8mlsJ/M+TwYWo3fMCIjXygwbAlcpWeb00
	GVjP12jq5iWprlaNH4jI4QEfoejaS7O2UD47hN9/Rxh2mhcR2Lshn8ZvCZkWEhLQeUru
	ZQ29KL1nqFx30Q036aX3Wzbw0IwC6Ry6fnI/j51IuPpaHPoaviTdAnZZRZgJrpw8Fpha
	EuKzBZ9YxL4HqrgKePI9RWMkjU/P0bSqsa6iK1rzoliVLUZykLSwIxwvIYOqvBuc6G41
	2i10qpmkOL/sR+WV1XYljcmubWX5Ap3S5opgUk+8bsNAOGQzmk81IIZw+rQ9AAlWuPva
	lkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=x+cF4iNFSO9bEmPCWGy82wibQhc4+lgtYJONoO0APng=;
	b=O8UzKI+xBQ+GMP3kMwavD7B8Dto8QLZH6caOYFeYEAafs5asOb0ubzPVkZitAg81yS
	CzZ5kZEFZF69QfMXqroUwiGD9Ag+r33CijFQgyuIkwO3HYFtX4uTPjVBS4JFpxKyeebK
	dlYxkX5vDXnJSOYCKBDMJH0KIwxJWC/99JaYiAeOg8mTLsknyrDZX2zLle9KPFDN3loi
	POnQCF8eqDzBQY+gfQvpTJfilhE0l5atxMedcf6zXl7XxFHvBZWI2JC3ZgnHN0rmyhzg
	5onM61dFc9xgXmALHQj4Z7EuMk6aYBH5hdGBFDOJ2JZQF8VPedE9ZQM1yt/VfZWUCLZe
	j1Lg==
X-Gm-Message-State: APjAAAWnAwGKwB2ipQ21WT3fl4i2b7CL5LaHqg+wElj0zALiX6qMI5dV
	VOE/q3LQ0AUAqdO76J48flxVTw62
X-Google-Smtp-Source: APXvYqzhhXT1LhqwQDCkLuwH4jexYE3DbjEw/SQStDLWwVt9k/upltpcUeYYV5Lnd4hHssN6kTydBg==
X-Received: by 2002:a5d:4fc1:: with SMTP id h1mr1794731wrw.323.1558711471792; 
	Fri, 24 May 2019 08:24:31 -0700 (PDT)
Received: from localhost ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	x64sm4502609wmg.17.2019.05.24.08.24.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 24 May 2019 08:24:31 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 May 2019 16:24:26 +0100
Message-Id: <20190524152426.26817-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] mdadm: use ${systemd_unitdir} rather than /lib/systemd
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
X-List-Received-Date: Fri, 24 May 2019 15:24:31 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Fixes build with usrmerge enabled.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-extended/mdadm/mdadm_4.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 597faf787a..40fe376a79 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -45,7 +45,7 @@ DEBUG_OPTIMIZATION_append = " -Wno-error"
 
 do_compile() {
 	# Point to right sbindir
-	sed -i -e "s;BINDIR  = /sbin;BINDIR = $base_sbindir;" -e "s;UDEVDIR = /lib;UDEVDIR = $nonarch_base_libdir;" ${S}/Makefile
+	sed -i -e "s;BINDIR  = /sbin;BINDIR = $base_sbindir;" -e "s;UDEVDIR = /lib;UDEVDIR = $nonarch_base_libdir;" -e "s;SYSTEMD_DIR=/lib/systemd/system;SYSTEMD_DIR=${systemd_unitdir}/system;" ${S}/Makefile
 	oe_runmake SYSROOT="${STAGING_DIR_TARGET}"
 }
 
@@ -93,4 +93,4 @@ RRECOMMENDS_${PN}-ptest += " \
     kernel-module-raid456 \
 "
 
-FILES_${PN} += "/lib/systemd/*"
+FILES_${PN} += "${systemd_unitdir}/*"
-- 
2.20.1



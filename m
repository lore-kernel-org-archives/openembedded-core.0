Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 652227C4A7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 13:06:08 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t200so6204358wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 05:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SJP4DWLGnNq33eOnd4m3y56YH3zNcTOmAhzBsYa67zk=;
	b=fdKjn5FYNOFwhEqjS8nFMaTAjWH+wZHSmDfRTzddddDj5SNsVaex+CDmo8FYMdmjRf
	22mpu+uZVX2Q5UqP1Jy/s0rNgHUfKptndJD50DYcKWHQcwwdKuZ5iVCG3x1aIJVEZeN4
	+KXkKFZlR+cs8iEHgWpUp3egBlxUw28vpAIWq/+hXvsH/Xgv//GUtv9pKqQbovyl66Ud
	iBnlA7VbHL+KAXjqYbBOgzTU8jwXi2FykGzV1OuAT1SmqkCcyBANAsqQeCoOOBSVByiR
	NnO8J5NIuhQzcm/dHb7n3TONr/Ovt44tVdegODXcWgagBFMUsW0k4s79P+hAIQ/kd8Ib
	SDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SJP4DWLGnNq33eOnd4m3y56YH3zNcTOmAhzBsYa67zk=;
	b=HPpnmN8WSDu1vCG1PkEVQs5yTQwwLi52h5bsUYQXd4PQHiwmD0Ed15HErXrdp0vIEe
	/XyfHVqGrfRlBSJmcfhIIwfs3/E2bykJdAMMMVzp14/6222HP8KnLumk9OfCID0MeY8V
	3zck7gGeNOgzoKkuQ2x7K3iXg05yZZRH8OkhQoRcruTSyma0jrPuByFvA3+JS9SErFdB
	+7hKO09BW+SpBrErUW9rf0SoiI8+0DExzZuexUkMyQGHyxjJLktx7rBALwBwH8Ll2Ny3
	zwGzPlUqpWIZJe32ZAJWgHjQp5zDEP1WbCDisvtrhIFSJU9DIobVmGpx2/ccph3qQM66
	Bm7A==
X-Gm-Message-State: AHQUAubM8FTsc+K6iYHNi+vOz1l27xyXsHZ1WnNQggXoqOkipxIGk+md
	6zLbwHSg16XfkEwz74q9G6B7LD/O
X-Google-Smtp-Source: AHgI3IYtDza2xFH9lwA7Ki6WhoenKbs30XEkuZYnkEUID9vuMmbdrWtIP4KsfN01V6auXhnKdnsuMg==
X-Received: by 2002:a1c:d14d:: with SMTP id i74mr2275007wmg.100.1549026368713; 
	Fri, 01 Feb 2019 05:06:08 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a14sm1273972wrr.13.2019.02.01.05.06.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 05:06:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2019 14:05:47 +0100
Message-Id: <20190201130554.90094-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190201130554.90094-1-alex.kanavin@gmail.com>
References: <20190201130554.90094-1-alex.kanavin@gmail.com>
Subject: [PATCH 06/13] qemu: remove support for building against host sdl
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
X-List-Received-Date: Fri, 01 Feb 2019 13:06:08 -0000

This hasn't been the default for a long time (as some distros don't
support it), and with gtk+ being the new default shouldn't
be needed at all.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 07f78058e7b..dccf9dcb00c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,14 +39,6 @@ export LIBTOOL="${HOST_SYS}-libtool"
 
 B = "${WORKDIR}/build"
 
-do_configure_prepend_class-native() {
-	# Append build host pkg-config paths for native target since the host may provide sdl
-	BHOST_PKGCONFIG_PATH=$(PATH=/usr/bin:/bin pkg-config --variable pc_path pkg-config || echo "")
-	if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
-		export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
-	fi
-}
-
 do_configure() {
     ${S}/configure ${EXTRA_OECONF}
 }
-- 
2.17.1



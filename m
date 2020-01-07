Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0B3E97FDDD
	for <openembedded-core@openembedded.org>;
	Tue,  7 Jan 2020 02:34:59 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id q10so27827470pfs.6
	for <openembedded-core@openembedded.org>;
	Mon, 06 Jan 2020 18:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YeCuKOQqqGt2K/1E47d/Xmh0Oob/TEOsR3gP6DeBWyU=;
	b=DAcy5hYA31o4YOO3qvt/7PMoGr181i691h86sPiWcxDN+2Po1PNKDeFfS8fK95wz8w
	TdGDzK55HmjZAXHGgRALf2xfPQL/X6JDRxQhJb/bCfr5apVFHeuxUj3LPqh+SesVFi8j
	Dd4nmq4WhdEJ0nOglOqMJ6xBmi3Q7OY9WEhghZIFlXRX4nZX3xJJX51dnih2bqwUTIdI
	uIMwzRzVc0vUo5pqPU0wnbMaNhL1kkaRr5aDe/WtqPMZ2nl18GPRt8IAs1qgKyTQV57M
	QPeH6lzRcqHS51cs4pGCbvK/y18ki5qrIyTi10COIp4MHBkfEukj+LGME9xm5NYyN0X2
	9TrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YeCuKOQqqGt2K/1E47d/Xmh0Oob/TEOsR3gP6DeBWyU=;
	b=cA6hYf6G6jacuaMkJ/MnObVdGcfS/XCK0haWwiVu1pcTWdAnS0gIVDEuLNJrFXp2WA
	qmSeesq1ZRwXSU74C47j864P/o3eLPP/L9QWHyTy8b1KepuB8uTvJahkobZPJEpwlvPJ
	oIPvvCs4uPTpefPid6ycDmpL8qfdEiVktpvAcj281/U9/gshrW0HxTLiVPkQ/npRUoLk
	c50/ig3WEeD2KO2QVsbUF/WxriPRx5dYA6XD8DdbS6mEBHUMeV+JF43Su6RPH2suk/kp
	ZgTZpDXG+nj3+08HHJTDNAWygNWHCzdAolH1g6nmQrKIRYF1K7uESyCDp4dKA3Oy4yR9
	Ru0A==
X-Gm-Message-State: APjAAAVxAlaxwrydUcW44xbYwpPSpsBlGFT01qqyK2QBL655YGIOQIK2
	KVK1/94E6VQ5cjdvEaSdE2mD4Yxz
X-Google-Smtp-Source: APXvYqz8lyD6vabrfCNvdOSdnxSMcyaxJeb3mPq6c0HBCfzcjl5khoC8Xz4mravNROIo7R4g0jkGGg==
X-Received: by 2002:a62:f94d:: with SMTP id g13mr65127271pfm.60.1578364500070; 
	Mon, 06 Jan 2020 18:35:00 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	d23sm77806193pfo.176.2020.01.06.18.34.59
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 18:34:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon,  6 Jan 2020 18:34:27 -0800
Message-Id: <c7f552dcf378016f81d98c911bf68bae80922fe7.1578364301.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578364301.git.akuster808@gmail.com>
References: <cover.1578364301.git.akuster808@gmail.com>
Subject: [zeus 22/28] systemd: Upgrade 243 -> 243.2
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
X-List-Received-Date: Tue, 07 Jan 2020 02:34:59 -0000

From: Adrian Bunk <bunk@stusta.de>

Bugfix-only changes on the 243 stable branch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../systemd/{systemd-boot_243.bb => systemd-boot_243.2.bb}    | 0
 .../systemd/{systemd-conf_243.bb => systemd-conf_243.2.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                         | 4 +---
 .../recipes-core/systemd/{systemd_243.bb => systemd_243.2.bb} | 0
 4 files changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_243.bb => systemd-boot_243.2.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_243.bb => systemd-conf_243.2.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_243.bb => systemd_243.2.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_243.bb b/meta/recipes-core/systemd/systemd-boot_243.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_243.bb
rename to meta/recipes-core/systemd/systemd-boot_243.2.bb
diff --git a/meta/recipes-core/systemd/systemd-conf_243.bb b/meta/recipes-core/systemd/systemd-conf_243.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-conf_243.bb
rename to meta/recipes-core/systemd/systemd-conf_243.2.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 7f3a59c208..18f17d28ac 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,10 +14,8 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "efb536d0cbe2e58f80e501d19999928c75e08f6a"
+SRCREV = "fab6f010ac6c3bc93a10868de722d7c8c3622eb9"
 SRCBRANCH = "v243-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
-
-PV_append = "+${SRCPV}"
diff --git a/meta/recipes-core/systemd/systemd_243.bb b/meta/recipes-core/systemd/systemd_243.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_243.bb
rename to meta/recipes-core/systemd/systemd_243.2.bb
-- 
2.17.1



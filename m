Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id DBAF578745
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 06:10:22 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 188so20865556wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 22:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=+22pU4bULJ6faI4ndizN0pBgg6LDupjPXpk2SNBVBXI=;
	b=QU3LisHdCCjKNCiJ8z9vwSbkbPy3uzzTLe3izsCr+2thbXdFWuBeGu1bfo1UKdLobc
	o4L1qGHd6lJW/u79DfWGgO8g5pfJq8+GLX0PDXWPsa98kAF6cI4sVXZU4NwByEsV1mb6
	gDHAbLtezF0ztC7KuRgtTwFQS5t31kXI2I694=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+22pU4bULJ6faI4ndizN0pBgg6LDupjPXpk2SNBVBXI=;
	b=P7uc9PhqZrEgEz+6LKX2qaih/4wacbawubh/I7nN1aLpViuYyagNdTrNklKDAB4V/i
	NOnI44zKsjEOeJ9ENDSQd37QXOzn/JgdRy40JQMSAJGy9Tn7+xtgAHoA9n2BXCQaURZc
	vuAgUWpyKpXYjwBSu4MkmuX1xsNkcLT1jBP+146t6P4v3xeDW3k1DVD94xGtdW8/z698
	nUjSfSHlWKGAqcEDRgcLD2eucwH3E8U/fegs9NDjx3QmjMaichX3RV7s2ybp0IaKCYS3
	hp8QYSe6eGV60YNst6REDShWI/GrnhAN/oY0LegPd/QBxMbzt1rQn7PTNkzvM8+LHU+C
	WlvQ==
X-Gm-Message-State: APf1xPAeuyZ0N4kkjk7c3gMkb7PY4trtIlvRwORMGUOaHbXFMjjT81eg
	kuh9ihDmtyB4IDdJNmLF+MJ5b7gZZJY=
X-Google-Smtp-Source: AG47ELs1QaAcuVTRti0jw4MKJPdj6GpnZGsLaPb72tEl40apRrLQ5n8HZn2P07ChJGjzqkFyzhJY6A==
X-Received: by 10.28.184.8 with SMTP id i8mr11320201wmf.52.1519711823403;
	Mon, 26 Feb 2018 22:10:23 -0800 (PST)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63]) by smtp.gmail.com with ESMTPSA id
	o12sm14447812wrb.15.2018.02.26.22.10.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Feb 2018 22:10:22 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 07:10:07 +0100
Message-Id: <20180227061007.11975-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.16.2
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] linux-firmware: fix typo
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
X-List-Received-Date: Tue, 27 Feb 2018 06:10:23 -0000

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index cc97c91fd3..816c7a0d78 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -729,7 +729,7 @@ FILES_${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
 FILES_${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a300_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
 FILES_${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.*"
 RDEPENDS_${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
-RDEPENDS_${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
 
-- 
2.14.2



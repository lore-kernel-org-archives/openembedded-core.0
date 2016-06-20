Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 174ED73178
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 02:24:28 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 66so10437961pfy.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 19:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=snPudPAfm+gMHIwkEx9Kfq445x9h2QQjQDTnUdictSo=;
	b=MEvH2VnILUTehy9P/FeFxoYsAxFcbR8eoGogWr5Wv/GSX1QVSH670FH/jveLUiQ0um
	nHsCXN8+543lKPkf3Arsk8CdS0xpf5x4i9Xtc/Sm3a6ZbEtP+OH9vfnvqziRq5eWBHj9
	elWMJSdyXPGmNcpYbfhBXCdRoGoxUfxfgaHJ5Zm+crD62ftrR5ngd9sUZba2SSdc00vi
	+h+JWAU4fuiXWiiLIi0c6CSITZjwHeHDkHtTAVt8Nk/4QvWeHrdZmX60moQNCA7YZcpD
	l6P5pNGypvKGuvZ3gkq+tAyBBHzjsKilrGRrnZTFPHBNI4h/+oWWXIArY6X8c+qExVea
	HeEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=snPudPAfm+gMHIwkEx9Kfq445x9h2QQjQDTnUdictSo=;
	b=AsZupkGVdfdHDTxZijUEvdQlYUzyweJqMM8FlkYYPnI5Fq8NtKuezA0v7wlN/km384
	JhOwj8fly/F/CQdXunbWOBRIwv7aZaEKO3jYeuYjeZk/T14KC42BrActqZ8yrd/RANM4
	Fv6holOvrjgld3brMGhRbIqM3cLJ9Jkb4OPPml9tdvqmJaIJ29hruPa5Vtwk+qifE45+
	2pNhESsYTL0rXB7Iwaq0nhzO9Y4TnuF7ByM7XsptdFmCU4SSFaD0AP+qPxfyF/DjKPIF
	6JgffBp+p1Yda6c5+Hqa01oqUGAmSl+75eGvwBXXdHXYvwNTunORzmk7VeKmA5fBECEv
	M0tg==
X-Gm-Message-State: ALyK8tKbju8oCQKthQ4qLXWV7ssjObfXsDeZeRJ6i0SsbGI/JOouhtiCZ7qDM9DMKH9icw==
X-Received: by 10.98.62.15 with SMTP id l15mr19062670pfa.24.1466389469450;
	Sun, 19 Jun 2016 19:24:29 -0700 (PDT)
Received: from localhost.localdomain
	(static-50-53-79-155.bvtn.or.frontiernet.net. [50.53.79.155])
	by smtp.gmail.com with ESMTPSA id
	b67sm32347269pfg.85.2016.06.19.19.24.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 19 Jun 2016 19:24:28 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Jun 2016 19:23:47 -0700
Message-Id: <1466389428-4438-3-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1466389428-4438-1-git-send-email-christopher.w.clark@gmail.com>
References: <1466389428-4438-1-git-send-email-christopher.w.clark@gmail.com>
Cc: Christopher Clark <christopher.clark6@baesystems.com>
Subject: [PATCH v2 3/4] linux-firmware : fix typo in RDEPENDS line for iwlwifi-6000g2b-5
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
X-List-Received-Date: Mon, 20 Jun 2016 02:24:29 -0000

From: Christopher Clark <christopher.clark6@baesystems.com>

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index bce2c0b..cdc7315 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -488,7 +488,7 @@ RDEPENDS_${PN}-iwlwifi-3160-9    = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-6000-4    = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-6000g2a-5 = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-6000g2a-6 = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-6000g2a-5 = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-6000g2b-5 = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-6000g2b-6 = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-6050-4    = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-6050-5    = "${PN}-iwlwifi-license"
-- 
2.1.4



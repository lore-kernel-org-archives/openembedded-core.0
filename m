Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id E967B602D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 17:49:22 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id i123so9054419pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 10:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4Gt8TLDvpY/xzGpj1/wCFYh7CLCyut43jvBKkFzTFAc=;
	b=vFy1WJX9SfzfgcNtXofkxEGtfK5ggmPWoZ+RqlXW2RCV1SKn1E51uJRTPT+Qq0tG7G
	ZFEGjNH+m9hWQZpD3E8h5QnZ1a3Ju7CTGKJo23y8wgnIetJNAEf+N+AtOofg+eDdjFSf
	o61xYSBFL1X58xi+Ppx1D5hI7HzZshYQ/klk3HnSoYUXEgfBntvplqJhUgHjdIjzorhO
	N/MzXUOGq/3joO3q9XzAaEXVFZOb1b6Kt1pP0gt8eD/4gnbsQYariFZvhivObsKTq6Ju
	V+G8MaIPKX+7aud/UHWerRn3QA+jhmLWQFjpRQ+Wa9i13X1XZVPgj95HcH5/GenfOsps
	xZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4Gt8TLDvpY/xzGpj1/wCFYh7CLCyut43jvBKkFzTFAc=;
	b=jbJSvCytc9EpkNdrCet3+gzkfMqEUBO+cP+xfilp8oCQInTccR9U0XgPkuyTvuqnn2
	dqVUs+CLqVbOt7lfAvaFL3HXcYPIofGWXloZBI41rCe2U+TMmjbmrbkN6xUl/VBqxtQH
	AyUGIS3dHKZAwlZZQIFEXduNG7lDGAQaCnmzu8AfZi8Ev30owRujwvpKDCHJTAZJfEzk
	P34usa0zbxgzvjbzUO02USIXwrv087rFqvydR69YL5Y+P6VBvrilIgedtNqjN/qwa1g+
	PmadtI2jCyiP0qu4MflwTmzNYnS8zXiEejMrg83lJBlgPlvd/lMPQKhk7aGy0MPaN/OI
	Wp6Q==
X-Gm-Message-State: ALyK8tLUQq0I+Jhcp5nUQZmYTnPfnJHrpij9KBW2P9F0aH7FJ/1uKsb9VeL/MIdCH7I33A==
X-Received: by 10.98.34.153 with SMTP id p25mr22819777pfj.116.1466444962778;
	Mon, 20 Jun 2016 10:49:22 -0700 (PDT)
Received: from localhost.localdomain
	(static-50-53-79-155.bvtn.or.frontiernet.net. [50.53.79.155])
	by smtp.gmail.com with ESMTPSA id
	i187sm56862025pfc.62.2016.06.20.10.49.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Jun 2016 10:49:22 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jun 2016 10:48:52 -0700
Message-Id: <1466444935-16308-2-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1466444935-16308-1-git-send-email-christopher.w.clark@gmail.com>
References: <1466444935-16308-1-git-send-email-christopher.w.clark@gmail.com>
Cc: Christopher Clark <christopher.clark6@baesystems.com>
Subject: [PATCH v3 2/5] linux-firmware : add LICENSE line for iwlwifi-license package
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
X-List-Received-Date: Mon, 20 Jun 2016 17:49:23 -0000

From: Christopher Clark <christopher.clark6@baesystems.com>

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index c39a9ca..bce2c0b 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -460,6 +460,7 @@ LICENSE_${PN}-iwlwifi-7265      = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-7265d     = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-8000c     = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-8265      = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-license   = "Firmware-iwlwifi_firmware"
 
 
 FILES_${PN}-iwlwifi-license = "/lib/firmware/LICENCE.iwlwifi_firmware"
-- 
2.1.4



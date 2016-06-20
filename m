Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 205CC602D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 17:49:14 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i123so9054278pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 10:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8+1I614lwAQIpWwXQKr6GQfVibCr9wdWyeiHjBVGSj0=;
	b=IARz0uWfUIQ+kIn0Ucbx8lXpbV25WPXnrhBSP54TZpfl/s2T9rZVCz8Sr8dH6NU6fH
	roA+3F+81mTWLAYgl8BLxE/3WCFXo6OUJfVUvfBuezDVdmCaEOm9vL0ueNtCc4koF48J
	Fmln0Qw7jH6xauUPRxukPODVtcACOLngi8HTLktu4jhZrny0btQwhpXvrFelviSESY19
	Bb+UnmXJb9elx3ghoCWGLhaPbIFNQV+NOOuPCy7q05fXje0UPJ5MFqBkcwG4juKw84o0
	d6lhyZBH5rYt3w82cl0FRDd/kHEambQa3NVoUCW4SYdvrTWCeLRcuUBqC9t24hThJM3R
	k2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8+1I614lwAQIpWwXQKr6GQfVibCr9wdWyeiHjBVGSj0=;
	b=IDiTRVnYN/QNbsgCx1QwWLCE0zDwJZp/58/9ozoYcyZPwRWN9tVUotoZlqOMY5dGks
	yfYhlpak6aEYb6h5AlBt9e9VpFi69z5C7tk0L94RISwsA2uUc30mbbR06YzebqCiKoHS
	s7k0FEkCdwKslw0UouILnnzQj0tGQajRZxjibe6Q7Qa9f6i+HmDKkUKUIZKDt7WWpDqK
	b8mlnSoO9CP+jj+kXM3QTupnX2FtbVUFY45+VjpL2Svj4xcGIdWwKGv28wbKXWiSnVVk
	3StMnytUQT9jCjKbubvARVf38i+ouCqfM+zSSc+DraJujlf+MA3QKRaN6h0rc2Qa1myZ
	dvXw==
X-Gm-Message-State: ALyK8tJUs/MZhjo8ws30cucvWY/MIt/12OA9AmkD9rGCR/Fm9pgk8+a5hxO0CAs6+SMDYQ==
X-Received: by 10.98.55.1 with SMTP id e1mr22676382pfa.107.1466444955557;
	Mon, 20 Jun 2016 10:49:15 -0700 (PDT)
Received: from localhost.localdomain
	(static-50-53-79-155.bvtn.or.frontiernet.net. [50.53.79.155])
	by smtp.gmail.com with ESMTPSA id
	i187sm56862025pfc.62.2016.06.20.10.49.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Jun 2016 10:49:14 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jun 2016 10:48:51 -0700
Message-Id: <1466444935-16308-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Christopher Clark <christopher.clark6@baesystems.com>
Subject: [PATCH v3 1/5] linux-firmware : fix typo in LICENSE line for iwlwifi-6000g2b-5
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
X-List-Received-Date: Mon, 20 Jun 2016 17:49:16 -0000

From: Christopher Clark <christopher.clark6@baesystems.com>

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 52fd176..c39a9ca 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -451,7 +451,7 @@ LICENSE_${PN}-iwlwifi-3160-9    = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-6000-4    = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-6000g2a-5 = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-6000g2a-6 = "Firmware-iwlwifi_firmware"
-LICENSE_${PN}-iwlwifi-6000g2a-5 = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-6000g2b-5 = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-6000g2b-6 = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-6050-4    = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-6050-5    = "Firmware-iwlwifi_firmware"
-- 
2.1.4



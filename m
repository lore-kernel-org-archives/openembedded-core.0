Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 76B1760107
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 01:32:51 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 66so8857942pfy.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2016 18:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4Gt8TLDvpY/xzGpj1/wCFYh7CLCyut43jvBKkFzTFAc=;
	b=Y4rC3OEyysQ6dhcxuLWmHuTngFSyrEU+V6qgTTF9Axpnxxu5VXbvq0iIVavppKn3l6
	v2Qgx46aoruZqXGIhEFNlAYNS2vk2+NaL22Na3fwfrMa1A2B4Xe5/exTBlezi7i8KaUV
	hyaMg2n2D9s91AOkwFPe4DPeiV8BK9qDXvHBQMj8OHTatt+UMgG9qK07hurW5xuBAYPY
	6FY8tG6qbw+JYpJMCPb0+YHIXwS1OSw4Y+iKBro5ZvZF/O2P83eaHq+mFTwEqXKw5XuY
	uyTtdV8TZAT7L/waVyMqsPM7NsEPZ7wOuTkcgeeEviT8qJ3G4WjJsMVpuhtSQUj4ubcC
	4AdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4Gt8TLDvpY/xzGpj1/wCFYh7CLCyut43jvBKkFzTFAc=;
	b=PvwTflPUVOH5TP4bZSn4eldN9zR7rkFeOj/QmU1dVMUWRVJUCpWHNvCQP2Ok1oJJWI
	E0Au0iNhZVgDgj0owRSw8vivwZJIHHH5f/vDLahpibaveIPhP+O6RPXmmpx9CImcCUHo
	1eaPEPtFaIlXt9LVlDh2lajkPZNuQZfh+GCK18kBzpsCgEhbZ2xC/twIH+LcXiAINlpU
	LPLcmStTodXvXV3oi983DyKFmJGc4/qR7tCOrNt06NtpOXiIU1w5/UquN9HC8C8sSks6
	mASG29nvJ54jxIPHJWPyo5kgB/bQ7GpRNzF2NBuYW+W7xZ+XH/Vg84F8zw3Z2MX+u6eD
	H5nA==
X-Gm-Message-State: ALyK8tKZNivpMgNTiD5TUS2fsqNUtzOZeHsKqeDhKuhTjlxQ4By4J8ZAxathC9yHeDwc/g==
X-Received: by 10.98.51.197 with SMTP id z188mr12178765pfz.100.1466299972802; 
	Sat, 18 Jun 2016 18:32:52 -0700 (PDT)
Received: from localhost.localdomain
	(static-50-53-79-155.bvtn.or.frontiernet.net. [50.53.79.155])
	by smtp.gmail.com with ESMTPSA id
	g63sm56257642pfb.7.2016.06.18.18.32.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 18 Jun 2016 18:32:52 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jun 2016 18:31:11 -0700
Message-Id: <1466299873-8445-2-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1466299873-8445-1-git-send-email-christopher.w.clark@gmail.com>
References: <1466299873-8445-1-git-send-email-christopher.w.clark@gmail.com>
Cc: Christopher Clark <christopher.clark6@baesystems.com>
Subject: [PATCH 2/4] linux-firmware : add LICENSE line for iwlwifi-license package
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
X-List-Received-Date: Sun, 19 Jun 2016 01:32:52 -0000

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



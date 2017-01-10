Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0653A71A50
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 12:50:56 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id v186so60499842lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 04:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=+vRMdWGAHLCBvgIWE0M4yfntjSHDSELYbUBAUHJohvA=;
	b=16UUP6x5gsdlg/DXUiYyWZbo9cOoDL7En3ymW7phu/NIk6xDG7nDf9bkZJ6bczeYjs
	sOe/Y7wmZ2hTK9d1BruP49A1JkD5oW5vK3HFPe58Or74XRf/i3DP5aHremvH1+bt51fP
	/cYcAYe9dhuIBov9esM2Q6CTF6w4qLQPVoJ0qx/VZFC96PWrU/WTOY1bw8/poHNA9DmN
	UPRLWaBf+EZpHJtOsAZXGAbmB1pAEmP3r17bCYprEbu2DgK8U9PF6AL2Yp1gq/VV1IWA
	Kf0L4d49Fzeh5zBuPoFXYGbIctndzeKtWWBtEcMIS+dIBT5mExggRn6gYMbomGiiDPJp
	PTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=+vRMdWGAHLCBvgIWE0M4yfntjSHDSELYbUBAUHJohvA=;
	b=rosQuUpppi5CtXbCofBkvXXdN6IsnTVi/d7XV4LNHuax3S/3QDomoSYBoY5dUtOC73
	Z9gBTcrr2VKDDzpaq6eLHW+Dw1dsz6b/knXXr7DZWL8TDO+hVvo8w69sCwRRK6B+bkDO
	BU/eQcfeMPzl+J2zjjytz8yEFKPntkGDM2zqAa2iHIcNiy6gSKvbes5T8DMnFg4J11k/
	yrabUNB6rRfyDvj3enG/R8tawDwtoVjRrpgAi0CLP5x9D5LDberX4tuxnOJpVxhGoLaW
	5Dg9UnMsTPRgP7YKO1Mk8eFilYfHH5ZDXKsTY4O6tYAu/v3AwjErMN3F6LzfoQc4Dkys
	sAww==
X-Gm-Message-State: AIkVDXKldYWei0wDNTOOkp6M3QOZPDsr6juAHKtaO2GbBx/q1o3CqMIheJ9EKnj6dnOqqQ==
X-Received: by 10.25.170.198 with SMTP id t189mr945601lfe.129.1484052657027;
	Tue, 10 Jan 2017 04:50:57 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id c75sm450711lfe.28.2017.01.10.04.50.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jan 2017 04:50:56 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 13:50:11 +0100
Message-Id: <b7a622ee1c9c05b89f9f9e4222e458fcefeecc4b.1484051596.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1484051596.git.maciej.borzecki@rndity.com>
References: <cover.1484051596.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1484051596.git.maciej.borzecki@rndity.com>
References: <cover.1484051596.git.maciej.borzecki@rndity.com>
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 1/5] selftest: wictestdisk: machine agnostic WKS for use with selftest
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
X-List-Received-Date: Tue, 10 Jan 2017 12:51:00 -0000

Add a kickstart for an image that is not limited to use on x86 compatible
machines. This allows us to run more wic tests on non-x86 architectures.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta-selftest/wic/wictestdisk.wks | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-selftest/wic/wictestdisk.wks

diff --git a/meta-selftest/wic/wictestdisk.wks b/meta-selftest/wic/wictestdisk.wks
new file mode 100644
index 0000000000000000000000000000000000000000..d4de24d83097dab2851dbf5f2b6884679de7c77c
--- /dev/null
+++ b/meta-selftest/wic/wictestdisk.wks
@@ -0,0 +1,7 @@
+# short-description: image for use in machine agnostic wic test cases
+
+# /boot is intentionally an empty partition
+part /boot --ondisk sda --label boot --active --align 1024 --size 16
+part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
+
+# bootloader is intentionally left out
-- 
2.5.5



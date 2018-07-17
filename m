Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id B241D7899A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 16:39:18 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id v14-v6so1900875wro.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9DXbADd2dXuyNHxNLrMrbEytqWMlQPXfV9VPEyZJh1w=;
	b=DtIK+0rm8HaKOys8gBBgDj82JTW20pnnuCQ1NnqVSrl3Uta1OEbbJxcPxGPMkBOwTn
	xAwjBwa8dTGFt0ebsYUcNhRhwDvbWjx0Gf9BeHlFxsoQy/Vuuf6dORv+r+saeBf9365Q
	fxSq1r9BxKCygCzdWXUjxSPVoUV/jj4UsOQdUJZdpI2qlKX/ML9Fu5uF9pCcq7MVGgBX
	GKs4fM6vUTu44s4cFcM2iFQQ2sRx7C0fzjfC2ruB+xhzgPUKnqlOodtJFRpWvL5GALPV
	wO3VnO4GoDWFYwC13c+Sz+JfW97/BBKyqLk6zYg6KSMTGqPL9fXv2Acrb+Pjlqn45RQ+
	HLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9DXbADd2dXuyNHxNLrMrbEytqWMlQPXfV9VPEyZJh1w=;
	b=fMX+E7sZRzue5m3yrq5gpZmHt+sQuCnFcKMUcKSzlUv4j1Uip58Il5OgzyaY9R0PNN
	mCY134/3WXkuoZLFCZ+ZtwzFewsvvTQ9OwoMKVniLXcHfw2pIhbkHzJjsbBbg7alNjbZ
	Ms+xSLQf5alFZi6oQvhicVQuGdyXS/6lcytji0cKAzgwThsyzPOlKiortjHFibz6WHad
	Wf+VzaoGnmYCVw+5ikyKHZ3a6NvkT+XoEF3841KxslJATivrp+jizShTtfr8trmm+XeQ
	FbvrQTv2UKo6XKGQFj+4tOM/+p1UEHIoD5uas1d6VCcv92xN2Hhlwi/4TROPbLuctsFi
	j16w==
X-Gm-Message-State: AOUpUlEHnzp/U6q0dNWqxrRNYVIvI035AlCgqRmkXXV/Be5gC0+RZc3g
	veqhzYv6ZvwePJ6pgZwc5J18VKZj
X-Google-Smtp-Source: AAOMgpc1uAP0AQ7yZI23eB8ppPE9w3vdS8ZU5wjSkrP/Zltiq/kUH9/NZCzg4vs6knc8DPSoZAJdOw==
X-Received: by 2002:adf:9c12:: with SMTP id
	f18-v6mr1957093wrc.93.1531845559156; 
	Tue, 17 Jul 2018 09:39:19 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i125-v6sm15958wmd.11.2018.07.17.09.39.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jul 2018 09:39:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 17:38:59 +0100
Message-Id: <20180717163910.3196-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180717163910.3196-1-ross.burton@intel.com>
References: <20180717163910.3196-1-ross.burton@intel.com>
Subject: [PATCH 04/15] btrfs-tools: upgrade 4.16.1 -> 4.17
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
X-List-Received-Date: Tue, 17 Jul 2018 16:39:19 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../btrfs-tools/{btrfs-tools_4.16.1.bb => btrfs-tools_4.17.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.16.1.bb => btrfs-tools_4.17.bb} (96%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.16.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.bb
similarity index 96%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.16.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.bb
index d1759593099..a3690d612c7 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.16.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl python3-setuptools-native"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "f7fc27cb20924cc340a2a522655969253dd97ae9"
+SRCREV = "33d16ffc0d176ff4a217a0491378d20ad34e0a90"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Makefile-build-mktables-using-native-gcc.patch \
            file://0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch \
-- 
2.11.0



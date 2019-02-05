Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id DB3157BF70
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 15:55:34 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id w73so1639249pfk.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2019 07:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=y49iPK+iWi1eSzZo2Cwa+MWkwfMQIK+lxzEZuBaFj6o=;
	b=VZICtfJPGRfjFmJr/uKImBY5A0Ddf4dLqdkuNzCGRR+Y/yZCnwwkFFiu260CumD62z
	bflNlSDM5ffQ6hs8f17PVs8bmCN2iAPT3UecyasrfbLY77Jrqwa/09hatJetjW4R2eOO
	wS9jO+pwvia9B72TY/9xX6EY5qocbqUpl1MAZB/tzZThjpIfhY8cVzzjBPHvTURjCj2/
	WNpljMQSmzsC+kD9cY5K5YTmnX4MzRWMkBy0uLYLT2wIODNRET6cMmF+IzBIejRaKA0N
	f5bMjVj1i2WZyoT/qZAheEUB3fZ9qtvvUIGUtRB/FMm/KlEXCHFD3NJj7O6hpWCk43uv
	KT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=y49iPK+iWi1eSzZo2Cwa+MWkwfMQIK+lxzEZuBaFj6o=;
	b=LLN0oqCS4VHEqMw4XgUY1eGs0Kx2Z1GG4OfFiQHyNeyYrKOQ3QNfctFjDTsO5EC8iO
	s545hoifHOECvhH/erFYcOB5JJFdbyeqUNWstzXD9SWg3vFMlvEt5rVSNkyFdEZ+9DB2
	Y/Skbvn0qHfXfzO0agx3wClb8XbSVDPwued6F1ZLwljUS0j83akSL4zwB7jDbjwXHNCS
	ajMNz9gWbbp6cR8riFXYduUEJImqTueEd4igoEOhyxyLyJ3r5My0rmyDrsP5LGkovkUo
	Vpp7plPw9h3B5rWFRz4UihQIGXU3oXM6WwBJpW9cpZBGl33WmR6jSo+wuBfSXR69tH2h
	2NIg==
X-Gm-Message-State: AHQUAuZhV0fdboGuUgx8Yz7yCRqRWXqxTkyJXggXMmApvPdBnpm37LZ2
	K5Y3s4HFofxyODgHUD4YnXnzefCl
X-Google-Smtp-Source: AHgI3IYxpNMiZHx+4QkQjlavIcRAnlQa1VOFWHYZEi5fzx1xhOzlVCVjPcn4Nv054rbIxsJXvpDnRg==
X-Received: by 2002:a63:f844:: with SMTP id v4mr412169pgj.82.1549382135511;
	Tue, 05 Feb 2019 07:55:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id p7sm5165115pfa.22.2019.02.05.07.55.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Feb 2019 07:55:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 07:55:24 -0800
Message-Id: <20190205155524.19235-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] qemuarm64: Use arch-armv8a tune instead of arch-armv8
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
X-List-Received-Date: Tue, 05 Feb 2019 15:55:35 -0000
Content-Transfer-Encoding: 8bit

arch-armv8 does not have many real-world implementations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/qemuarm64.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 34fcd2aed0..ee19385eaf 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -2,7 +2,7 @@
 #@NAME: generic armv8 machine
 #@DESCRIPTION: Machine configuration for running a generic armv8
 
-require conf/machine/include/arm/arch-armv8.inc
+require conf/machine/include/arm/arch-armv8a.inc
 require conf/machine/include/qemu.inc
 
 KERNEL_IMAGETYPE = "Image"
-- 
2.20.1



Return-Path: <sstncr@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5C49475545
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 14:10:43 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id v131-v6so742040wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 07:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BCYxUS6S+VKbMtB96iI3a8Utebu8sBc62+ZUFW4O4KI=;
	b=GjuCqLVX94n1KIgCfEv+APpTTptX4s11sK65PfeGR/JJcmZ7zOSFSHFQFOfFhSmrFl
	6nl3kBRBxtzD4xSZN/mByQ6Ef9Yo2ZUj/Jdbay3kuIUexYuFK4QGR/OCj6LBB9XLue3C
	Q/uHHrnTHyo/7JUiQUYtNarGVZC7DwyGcjlmR07LdqW3AmiG6ZZXRSDjtMRMfxaV7D3/
	CbnQGmpmPcC+CkJHa2jYMIfGDIpxKMqxlgg075uJnuq06iE/d9t8UagWvz7u8AGg1b/Q
	o3GYpAME7OwoUQiGywnynQhP2odbmF3j/B0IkJF+Onlvit0rxcGoq8KPpKk5KdG+FF6v
	SE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BCYxUS6S+VKbMtB96iI3a8Utebu8sBc62+ZUFW4O4KI=;
	b=WkIOQ8pvGzs6bMCD90MeXVi4Bc7chery/qfXQ+O9Wb7MIFMLdS4h5sOQPYyKit1onh
	irfszTd923gLEZS1YEAS4T+4iRXk68Jx0Cwi/S6KDD0BqRTknhvY2hDF/VLM2db7ahtl
	0ZW3r5N/ZHkZ2SkWoiPIlQHXgaHij+cMAQ52UiJckoyj1WgvqT7t/mkKRNgm8ylgWQ2g
	sfYCh8f3actPS4Cl16XDdWsH4zithCPIMijMXxuI4L+rGPNHU4QkAbkXSljcDqRCgTTQ
	TBFj0ptjEgoO0gqoARNqOqoL+Ieq7azbLV9vhLRezOBJ6QyS+uOBPwypVO1xpqb44Pd+
	8cVg==
X-Gm-Message-State: APt69E3OAJZJS6RVNZ0t0suPadarVcbNOHW04I5ZLv8wpGNZQXew16V4
	QWq0M+XBAlMD/D55h/T7+SZh/jY5
X-Google-Smtp-Source: ADUXVKLnZX1zbTMieUptnl0Z6z9gzgVnPTHoU2UqeYEQVWwJabGfYe8XNLCGB5G1A16JY+LriEjPpw==
X-Received: by 2002:a1c:eb08:: with SMTP id
	j8-v6mr13338363wmh.160.1529417443844; 
	Tue, 19 Jun 2018 07:10:43 -0700 (PDT)
Received: from ubuntu-xenial.corp.fitbit.com ([86.120.134.70])
	by smtp.gmail.com with ESMTPSA id
	j131-v6sm226299wmb.35.2018.06.19.07.10.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Jun 2018 07:10:43 -0700 (PDT)
From: Stefan Stanacar <sstncr@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2018 14:08:49 +0000
Message-Id: <20180619140849.16963-1-sstncr@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [sumo][PATCH] default-versions.inc: use weak assignments to allow overwrite
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
X-List-Received-Date: Tue, 19 Jun 2018 14:10:43 -0000

default-versions.inc is included by defaultsetup.conf which in bitbake.conf
is included after local/machine/distro.conf.
If these are hard assignments distros can's overwrite them.

Signed-off-by: Stefan Stanacar <sstncr@gmail.com>
---
 meta/conf/distro/include/default-versions.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index 868073843a..3d88e8f656 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -2,6 +2,6 @@
 # Default preferred versions
 #
 
-PREFERRED_VERSION_openssl = "1.0.%"
-PREFERRED_VERSION_openssl-native = "1.0.%"
-PREFERRED_VERSION_nativesdk-openssl = "1.0.%"
+PREFERRED_VERSION_openssl ?= "1.0.%"
+PREFERRED_VERSION_openssl-native ?= "1.0.%"
+PREFERRED_VERSION_nativesdk-openssl ?= "1.0.%"
-- 
2.17.1



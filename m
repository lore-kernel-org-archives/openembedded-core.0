Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9DD8465CF3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 09:34:39 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t17so19229431wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 02:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=1Ter9HJ80GeNTlJEJrRP8bpHS4nahtYRXzYMafl0XAQ=;
	b=ziZZsuUiaXh5bAeSU93XhDYqHYCwIb5ByrigbB28eW9eFIhdB6BG9xLTpgf6TDzMDu
	xIcUyLdkwGQUjUuc9XZQsg0g3DrYVPLzZ5omAhs/ksIsYp+tKF3URn5Tbnom7fO+9fNL
	K+kEHEqf0TEd2qea2G/wtP4GGRpnCNzgsIx5TOYS670rzarveeTeOSGZj0X+LLGZfnFy
	X1tJ8cVxPSdkaV/AUolk3ILNEDIysCpzGBdsQ/PMq2zUFz4xX/KKODKy2yqpqa2UpBBK
	2my1V4Mg1wL1i+X3wL71ENzxOUjcumETDLYRcUIDAtRFRfLpMGtkI6tIOkeATgOAsj7c
	5ZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1Ter9HJ80GeNTlJEJrRP8bpHS4nahtYRXzYMafl0XAQ=;
	b=Ws2Cy9dNTThkjX53lrYl9ZnBumAdiiF6gWDQIOjrKfNd/SA91XQ4M6TkEyZdmAD06x
	tzxotUjJ/kSyqUq7WNxf640TfCm9bXi3Jiy5MvT6LarVyJvG5mAGhCPP6M4fNsVgwdU1
	AgO6Pua4EC10OP7hDT8gKPpr2P0klAEH0ong1kO/WCYZhzGa+IB1ZGGhHMVHpxe8RvWZ
	HIOj+5X0xnlfaOHrzRxVbeCdjHi0Pk+2wPT98BJoeoJ5R1CJ+yrlOzw8jfTr/oVSlO7D
	1XF1J1YcQaBpO8wNlPILD7kxwaQLe8dA+qrarPSfgBpmB2yXo/5M0mDoXXSjXu+IGk3f
	WWzw==
X-Gm-Message-State: APjAAAV0SxXyqCw9UC45eW9TVSIWMFw3uNAD2T80wVrMRzzTDUbTSKRb
	LRpPmQvLo1uanzBUh+RPN/G9pTyv2q8=
X-Google-Smtp-Source: APXvYqzSifuay3f/dEvrpCUs0WiIC8UF1Sc/FcmDeSzp7kaWcuqj5WXILxbSRaN8GGCBbqjYyKxl+w==
X-Received: by 2002:adf:eb02:: with SMTP id s2mr16259691wrn.29.1556012080125; 
	Tue, 23 Apr 2019 02:34:40 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a11sm12102802wmm.35.2019.04.23.02.34.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 02:34:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 10:34:36 +0100
Message-Id: <20190423093436.4022-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] lttng-tools: fix Upstream-Status
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
X-List-Received-Date: Tue, 23 Apr 2019 09:34:39 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../lttng/lttng-tools/0006-Tests-check-for-lttng-modules-presence.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0006-Tests-check-for-lttng-modules-presence.patch b/meta/recipes-kernel/lttng/lttng-tools/0006-Tests-check-for-lttng-modules-presence.patch
index e07c227f466..30aa66b2c8c 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/0006-Tests-check-for-lttng-modules-presence.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/0006-Tests-check-for-lttng-modules-presence.patch
@@ -3,7 +3,7 @@ From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
 Date: Mon, 25 Mar 2019 14:24:51 -0400
 Subject: [2/2] tests: check for lttng-modules presence
 
-Upstream-status: Accepted [5da3fc8579a9f93ea4767729a107784bf2d034ae]
+Upstream-Status: Accepted [5da3fc8579a9f93ea4767729a107784bf2d034ae]
 Backported to 2.11 and 2.10
 
 Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
-- 
2.11.0



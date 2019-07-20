Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by mail.openembedded.org (Postfix) with ESMTP id 281A37F095
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2019 16:29:40 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id c19so23767610lfm.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2019 09:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Gvxwiom2Lhi4DN1tu8uDuRx5iXmnFcb8J7K8785UGd4=;
	b=DDAqmsMofQnxTG8IFnYSBjuyYDYWA30ATL4j7lB6NJwvwf78KTdAd0IesUb+sqS7yj
	bxWS2Z7zyqQcsIez4myUx039db+LZME5noysCmtMRSJvXQh0F3m7x4Ya32EdQIvx3S+U
	iZKMfrKc1torlR/Q1HRfn1kjbkcclcclprAbCIcyLybq0HtLxo0/sUTxgT+N9aza8Yde
	Um0OIUNMY+vamB+2oF45omfLsyBdkV9vmWRXs2nLGiLL48DJlXbu0Sq98E6SQBJBhdyR
	gaGS8IdOJGvZOBlctkSg8roJQ2Z5jNX2P/CWyqi90JqG+NGdC98BCEFe8csiJtMDilwR
	d5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Gvxwiom2Lhi4DN1tu8uDuRx5iXmnFcb8J7K8785UGd4=;
	b=q6KiFHxKXuEuoOa6YIzhGC7D+eT00rZeZ3yYxRhJWyswkczxTkL/vydWJ1fbSthCUT
	RwQpuuvrcLko/R255oGaEiiowaM1G9fXAhaEpKAx+PVTuJjre7qokNljGRVa8CSHs1Ts
	Ql9tbzbi1y8v+HS/DByJesYl44BMpAZx/F8eQ6yl+mavRdKT+5v4SSEOUAGKDHhTagHk
	udlWdTCXTDxcpdyPmsIXT11qDhmwgrg1Wrcy7ffLuUaKwY6THuDnE3p0iopnVLW+3Z/v
	5Nv1lvXC5XIDUD4DccLfkmMkujSix5cCFoZ5srZi7A3NiGqFgEfx0k3+wq5IPD8k442c
	7L3Q==
X-Gm-Message-State: APjAAAXywFAhocJiwSRGY1XL0Isb8ViMqWvj+ZaVH34ONCCWSEhYh/Iy
	QWa/XCAWSQF64J2yFC/vEtMOBiDQ
X-Google-Smtp-Source: APXvYqz7gAN7Kp5NMZ5pT79twXED22HotMAKT+fm9GMdqESLeT9iF0ThyANClVamiq5EQTKG4cn5Wg==
X-Received: by 2002:ac2:59c6:: with SMTP id x6mr27935500lfn.169.1563640181104; 
	Sat, 20 Jul 2019 09:29:41 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	e62sm6491669ljf.82.2019.07.20.09.29.40
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 20 Jul 2019 09:29:40 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Jul 2019 18:29:37 +0200
Message-Id: <20190720162937.19324-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-pbr: update to 5.4.1
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
X-List-Received-Date: Sat, 20 Jul 2019 16:29:41 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/python/python3-pbr_5.4.0.bb | 5 -----
 meta/recipes-devtools/python/python3-pbr_5.4.1.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pbr_5.4.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pbr_5.4.1.bb

diff --git a/meta/recipes-devtools/python/python3-pbr_5.4.0.bb b/meta/recipes-devtools/python/python3-pbr_5.4.0.bb
deleted file mode 100644
index 1f1ec3a420..0000000000
--- a/meta/recipes-devtools/python/python3-pbr_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit setuptools3
-require python-pbr.inc
-
-SRC_URI[md5sum] = "fcf120102d3e4859d41425638122058c"
-SRC_URI[sha256sum] = "36ebd78196e8c9588c972f5571230a059ff83783fabbbbedecc07be263ccd7e6"
diff --git a/meta/recipes-devtools/python/python3-pbr_5.4.1.bb b/meta/recipes-devtools/python/python3-pbr_5.4.1.bb
new file mode 100644
index 0000000000..338ac8b707
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pbr_5.4.1.bb
@@ -0,0 +1,5 @@
+inherit setuptools3
+require python-pbr.inc
+
+SRC_URI[md5sum] = "ab6e26026ab306989a636ec2d50a435a"
+SRC_URI[sha256sum] = "0ca44dc9fd3b04a22297c2a91082d8df2894862e8f4c86a49dac69eae9e85ca0"
-- 
2.17.1



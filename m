Return-Path: <mike@foundries.io>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id A69EF60879
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 19:57:04 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id l24so12532573pgh.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 11:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+qmbDHpItvi7tzv3g6JhutpFDybgWpxkiq9FuotDcTE=;
	b=WCgYOA0wZ06GlCK710OdRmkpTgjOWYPOzj+X3Ql/++u0gXSAp80NqEXLtdLX9mW2FM
	ZLBR3ltMvFRjaPsxHjDQ5PLA8MPFiAgR2ZKkc65LHVB/+ENl+SpUmNwFdwHONeZfNPAZ
	/jFv/dfPFhvI+WePlJG841tHzu4YkTFSmEW8xXjyiRktdFK9bU8pldOiYdUGl0kUUavb
	oSwmzsgiKrR8JMstBs8X/Flldt8HG2zJmfFErzcAYreIndLWClt78J+oi0uv6eT3VL2E
	UGCh9+46n2VIQPQDFbsdY8B0DR4DntLyfr/aIn5Lc8LQCnPMM0Vlthq7DBau45eD4nld
	r2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+qmbDHpItvi7tzv3g6JhutpFDybgWpxkiq9FuotDcTE=;
	b=scDCJ/xh/ewq5I7dFSyz6y3c0QNQ5+nbNAZDaTfuN/VBRlAoOf+rcz6QgOXs2hT6x0
	BZ9jpAbQR9xgML6mlgCyPydTbe2RcJFEJHq2Akgh1du2mu2tvkPfTVRzxUCol4ZBxucl
	L/KsmOxPneI/EZSbEBam3vAS9CH+lzLXJBoAvZ83on1qpEkAPjclAlg7c8VR2sJdsXQ3
	UIJLJTqAUiH+gByp9ET2J+68bQ7Po+7IzhLMQs4Ae3h5LkBPV83IE0RcT0zAlYmRTx6r
	MbCpjSVmvVH/ExepDWW4UnOGo4pEJaccYkgWIGeE5vGhI0izFFO2juzI8MoZDfLfZZwz
	YbrA==
X-Gm-Message-State: APjAAAUyy3V6BMzOTiFGBkdMtJaK9ttS5AeidzC1WUStyAC8Gzhr8NSu
	EvKrJ9YLOqZAF3txFuGq+m771w7jBgGZHw==
X-Google-Smtp-Source: APXvYqyuNGZx4QiZgYJQ7fNIuSJimy7MX5V7PTVGVysOifncDhyvY5vWZ2PQUT89CibsARCWVgqzXA==
X-Received: by 2002:a17:90b:948:: with SMTP id
	dw8mr8842094pjb.21.1573588625141; 
	Tue, 12 Nov 2019 11:57:05 -0800 (PST)
Received: from scottml-arch.lan (107-198-5-8.lightspeed.irvnca.sbcglobal.net.
	[107.198.5.8]) by smtp.googlemail.com with ESMTPSA id
	f185sm19208211pfb.183.2019.11.12.11.57.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Nov 2019 11:57:04 -0800 (PST)
From: Michael Scott <mike@foundries.io>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Nov 2019 11:56:56 -0800
Message-Id: <20191112195656.7359-1-mike@foundries.io>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Stefan Agner <stefan.agner@toradex.com>,
	Bryan Gillespie <bryan.gillespie@hughes.com>, Adrian Bunk <bunk@stusta.de>
Subject: [meta-oe] modemmanager: Upgrade 1.10.6 -> 1.10.8
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
X-List-Received-Date: Tue, 12 Nov 2019 19:57:04 -0000
Content-Transfer-Encoding: 8bit

Includes: Fix for an issue presenting after 1.10.6 update where modem
would enter status denied state.

See:
https://cgit.freedesktop.org/ModemManager/ModemManager/commit/?h=1.10.8&id=47fd8a1e55cac0b0b45812e1dda826f38c264d1b

Signed-off-by: Michael Scott <mike@foundries.io>
---
 .../{modemmanager_1.10.6.bb => modemmanager_1.10.8.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.10.6.bb => modemmanager_1.10.8.bb} (92%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.6.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.8.bb
similarity index 92%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.6.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.8.bb
index 92d4fe0f4..3cd21cc0d 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.6.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.8.bb
@@ -14,8 +14,8 @@ DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
            "
 
-SRC_URI[md5sum] = "7452a94f0d1ca361ae51ff1d287c53f5"
-SRC_URI[sha256sum] = "3c2ca73782215664141042422759899ca9846440fc26d6223c7cf7ea4dd3c996"
+SRC_URI[md5sum] = "c05ac4246c81cc15d617c4a129232988"
+SRC_URI[sha256sum] = "cbe174078dbdf3f746a55f0004353d3c27da2a31da553036d90fc7dc34a0169a"
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
-- 
2.24.0



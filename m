Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6E43E60670
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 11:46:19 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 139so4457915wmn.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 04:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kRNBg68k9az8Y2NQ6qXvQs+eGNjcH02BKtb2mIeHwzE=;
	b=FnXywWfmI5EWw3g6HubKp3gRNpFPnb6widj8nyPlUWV3FGm738gRF1KUm5uc5P3WWl
	HAcke7swQTljnd6jhkBilcyDucQyw+Mvtg4v365LCtC0enxR73GJXIaR+Hi3hslAD5Jz
	aXolyQJHhJSr++N6XOYzTqOu3hBEuSfOftFbQApawZfXLSilY6yHjYpN6lSgtyQ9r9/S
	Spy1S0pfKss6K6RwdM4UdjjGFVuXwgQqjV/ghvpayCuItH7eokW6of7Z4EuaCTUtghM8
	Bi95+ZjF3ENzo6HB00OFLyy+TWKFgC1C6JNvXPOY+RJFsWkVI0esZpcl2oe8ZBdu/8Kt
	Gw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kRNBg68k9az8Y2NQ6qXvQs+eGNjcH02BKtb2mIeHwzE=;
	b=K2TrtkVxY79urJCSFvvEJSSDIFmo8tseRw03SvEmEPxXUPPom6RVso4E75k/1oXISv
	G4EAXJaHtmy7LoXrjPFdKAQ+pjjRDYKMoOemtMGdsoqFpCnFGhkRTFhcws+T4UAUUFMa
	10xvqjgPPl66TkhpJrVIS7FDDlsRxSGz1J8FGmurT5suM/KLJBpcgfz9O+Z7+eBvmi6S
	PCEW4zmtbkAVnnF20zZVa7WfT5IEeIAuExI25Pn2Yntdc2AEmpYQsxHX549nfHDF+inR
	uRiEvUNmxoteG/oQDsmAicAik+fIijJHDCpXWsYAgj65lV5Tv1X7IDDFBlWC4dMfAJF2
	4LtA==
X-Gm-Message-State: AD7BkJI98f/71pqwulG+cp4BosDJRK//MYGvYvEQrRMW9uw6PryPUbMka77a/UfD+QhTYQ==
X-Received: by 10.194.202.195 with SMTP id kk3mr2177094wjc.159.1459251980172; 
	Tue, 29 Mar 2016 04:46:20 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lh1sm28852575wjb.20.2016.03.29.04.46.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Mar 2016 04:46:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Mar 2016 13:46:10 +0200
Message-Id: <1459251970-10993-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.3
Subject: [PATCH] no-static-libs.inc: build static libusb1-native
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
X-List-Received-Date: Tue, 29 Mar 2016 11:46:21 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/no-static-libs.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
index 1265908..13a7918 100644
--- a/meta/conf/distro/include/no-static-libs.inc
+++ b/meta/conf/distro/include/no-static-libs.inc
@@ -27,6 +27,8 @@ DISABLE_STATIC_pn-openssl-native = ""
 DISABLE_STATIC_pn-nativesdk-openssl = ""
 # libssp-static-dev included in build-appliance
 DISABLE_STATIC_pn-gcc-runtime = ""
+# libusb1-native is used to build static dfu-util-native
+DISABLE_STATIC_pn-libusb1-native = ""
 
 EXTRA_OECONF_append = "${DISABLE_STATIC}"
 
-- 
2.7.3



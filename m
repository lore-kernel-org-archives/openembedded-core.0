Return-Path: <oecore.mailinglist@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id DCB5F65CB6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 17:46:28 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id r79so13450350wrb.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 10:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4Y82un7iGzQRMtjU3ULtngaf4mnJX2qbwLDbbP4NA/0=;
	b=cl0IbfM7Tflr8gdX86GBkIVaE3ItTt1EEdYa9aUqiN54c2a134MBql/+4Li62JShDm
	RnfsxexyYD2/WOZ16mopwGPwxK/ChmWOgkpqOAd4qOe4CFnvv6oMxmPpZHtkvbGhto4T
	7p2HEL8yRgLU7KcHY/OBVAsRtCVwTzhfZ2U5o2DOQKTzuqxksFc9JgHeLJADSoEKEM9U
	tG4dOYZS3qIJlmvZPNnEggNWX5lUyi4uEFT8Tmvcuh7HsTS6uTcCOm9t8kfbIwIbXiQj
	Vwy2A6CUsdZfECnaJsIVHiFyT9KxJBrFP72Log5elkVBPYa5vyywC+SPGLD0ey1vhzWd
	u4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4Y82un7iGzQRMtjU3ULtngaf4mnJX2qbwLDbbP4NA/0=;
	b=pxURxGHsjDKaTAQw1lJmlwS2nB2dh8BhivyN8JMDmrY9omWqIR9nutFqAF4gf1EXst
	6/u9BAMLIDT9q70dZxRV3ThZqMn87v0LeUhVsaSXDNuBfsuyRms/W0QVEFMfnjPjO1ps
	+eSnHeUIm8LPH3lML/atmrdEwffWHyqEFgoFtIC48FJKW9fi4wBgiiCk3ls4zurUcr8X
	j5zYtNqVN01UVwHMwU7C+L87/80iMqtUcSE2fmVBaCvoBQynUxYwdaMU1fSWK8MQgrzE
	QxXCCaYF5L1wT31z+FYlXewXPBrN6U9GQnMeMuFCfCVkYD3rfcnlrRo5SAUuDZ5DVUHp
	m3Ng==
X-Gm-Message-State: AMCzsaXHVZwqtgRi/Pj82GK+U7FEUi5Lodgd/cKrkCeH/JuuUGZIoar1
	PC1a9g0AjuBTmk2M2b4rn7cAcXdzMXU=
X-Google-Smtp-Source: ABhQp+RuHss2n0+gK0Kfa8rc6xxyEm1ZRjzxgrCh6qBgkJTqOSBPrUk9Kngqs38nUHYI5DEwZcBtkQ==
X-Received: by 10.223.202.1 with SMTP id o1mr8196602wrh.205.1509385589624;
	Mon, 30 Oct 2017 10:46:29 -0700 (PDT)
Received: from t460s-1.res.training (ppp-2-86-162-66.home.otenet.gr.
	[2.86.162.66]) by smtp.gmail.com with ESMTPSA id
	b190sm3990214wma.22.2017.10.30.10.46.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Oct 2017 10:46:29 -0700 (PDT)
From: Robert Berger <oecore.mailinglist@gmail.com>
X-Google-Original-From: Robert Berger
	<robert.berger@ReliableEmbeddedSystems.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Oct 2017 19:46:21 +0200
Message-Id: <1509385581-10395-1-git-send-email-robert.berger@ReliableEmbeddedSystems.com>
X-Mailer: git-send-email 2.7.4
Cc: Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
Subject: [PATCH v3] nativesdk-packagegroup-sdk-host: remove redundant LICENSE
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
X-List-Received-Date: Mon, 30 Oct 2017 17:46:30 -0000

*) packagegroup class sets a default value for LICENSE
*) usually packagegroups don't contain a LICENSE
   and if they do it's many times a copy/paste and doesn't
   reflect the license of the packages included in the
   packagegroup

Signed-off-by: Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
---
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 2ca6392..aee4a03 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -4,7 +4,6 @@
 
 SUMMARY = "Host packages for the standalone SDK or external toolchain"
 PR = "r12"
-LICENSE = "MIT"
 
 inherit packagegroup nativesdk
 
-- 
2.7.4



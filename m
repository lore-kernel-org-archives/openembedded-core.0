Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6917D71957
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Oct 2017 14:12:03 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id i5so11251934pfe.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Oct 2017 07:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=gFrzP8ZIgUnNqySvuR4KXcHcHiMECjnAeWjzAgHZ8Og=;
	b=SUZFQTsJMCKELGXiuVsJ0ZmN8FWszmZRPbJSd9XC3e1Prpaf49xcC/Dmv/L4ZWICV0
	2Vg9ddtplde6jIh7xNFb4WaPWvyJgDWNM+Xg8oP09OEJMl41EpAKH8dm49KrzQvD9MpX
	6NfUnXMI37Mn5v/wyIgUUZZdoNR70pO24Z48+UtyUrPDe/T1tWwEycy6QalNZGneqCxZ
	TnC+dy9xYuGVaje7apvMAEYI/m3gpDsXpT/MxKuMvU2XeirnOGQ7uzrXd5/LiqrLAwgz
	A8zTK+wCxnXhJbdhB9zNIR9/cWnRqtxMEQ4n6vT9iMu+3DXpN/XOht1HZwjNc7elocA8
	GaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gFrzP8ZIgUnNqySvuR4KXcHcHiMECjnAeWjzAgHZ8Og=;
	b=dPQ3HK7X3SSOWAGufhVg4960zQmgPmhuZyaNWXvASofNiN1OjGvbrilAsbGPv0tvj5
	CgcHqGFIfEwk2XnEqG+50kMNls4C9QsE1uxwCFuwVPiiqPFDMqB1NfWBSaQDt7U7heqK
	gG+vM1ZVZxkLS2dkcdU9y7b7j79HrEIPl7UsLRx9nwpWzCsmdbZDSag1uSlv7sAEGqZq
	awkERocDxxngzgAasbyH3MrEgBhjzCJXwnydmBmfetT+k3snwlTE5m0QOSuUYueSEMW3
	tQ5zhMGtTXee4/FoNOlNdmLPJ+1DfZvwQvV+a162/sY3rRopuDSMwzhUp7SMuEcAmBFz
	HtiQ==
X-Gm-Message-State: AMCzsaWr9fd2hBfc0nI8j5QaEcFtvfI7UzBbI3NMS+e6ShGG+eWAFoR3
	BkM+emIJUaG8GfNwMIdOKN67mQ==
X-Google-Smtp-Source: ABhQp+Q+LjeimeFSIUWGfD/6fqge2xxsBCNPAzMwZd69GXsgKLTvpiUTVw7UOAqPNvgIwdqj4d3jsg==
X-Received: by 10.99.60.11 with SMTP id j11mr4589096pga.21.1508508725170;
	Fri, 20 Oct 2017 07:12:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::d2ab])
	by smtp.gmail.com with ESMTPSA id c8sm2180747pfm.47.2017.10.20.07.12.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Oct 2017 07:12:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Oct 2017 07:11:55 -0700
Message-Id: <20171020141155.26412-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
Subject: [PATCH V3] libcheck: Upgrade to 0.11.0
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
X-List-Received-Date: Fri, 20 Oct 2017 14:12:04 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes since v2: Rename recipe to reflect PV

 .../libcheck/{libcheck_0.10.0.bb => libcheck_0.11.0.bb}           | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-support/libcheck/{libcheck_0.10.0.bb => libcheck_0.11.0.bb} (65%)

diff --git a/meta/recipes-support/libcheck/libcheck_0.10.0.bb b/meta/recipes-support/libcheck/libcheck_0.11.0.bb
similarity index 65%
rename from meta/recipes-support/libcheck/libcheck_0.10.0.bb
rename to meta/recipes-support/libcheck/libcheck_0.11.0.bb
index 9d34198a96..4c23875427 100644
--- a/meta/recipes-support/libcheck/libcheck_0.10.0.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.11.0.bb
@@ -5,13 +5,11 @@ SECTION = "devel"
 LICENSE  = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/check/check-${PV}.tar.gz \
-          "
+SRCREV = "cbc78bab899858f3ece1f218168da54aac757bb0"
 
-SRC_URI[md5sum] = "53c5e5c77d090e103a17f3ed7fd7d8b8"
-SRC_URI[sha256sum] = "f5f50766aa6f8fe5a2df752666ca01a950add45079aa06416b83765b1cf71052"
+SRC_URI = "git://github.com/libcheck/check;protocol=https"
 
-S = "${WORKDIR}/check-${PV}"
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig texinfo
 
-- 
2.14.2



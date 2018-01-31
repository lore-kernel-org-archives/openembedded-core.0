Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 00D1C60722
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 02:07:16 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id i141so12842662qke.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 18:07:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=1gFl/BREMMPb9iG6c7qqhtxtUgogM9h+jKNlN5ZqBUg=;
	b=hSYCIQHVT4Ej3k+DMK051z7XOH9C6C5L80B+xjm0j7TIuqo6GtUyRoVyGu80eu6sGY
	5b4PYraNSP4eM8N9rlCF6NWowpYGJe1MVFhnHFnkSuVdFwUtksSVCK0LLs2KwW+OTXmx
	H5Tu+K9GA1gtHIB3g2CgLsCLeU97DypRMUAzjHAuIyATs1g5sXJubG40EuWzhsaLxEd+
	eJCNVp5kahFyatlbutB6W1591Go5K9HBaqr4X57uJg4b3GHuhPML9aaatNeGn2QPcaMJ
	OH/4k2Y+tFunk9c6IZqt+K37i77p2X3RwqHDDZd6Vg9R8FLpE/W0BijO8LIZqvwZVgNn
	60Xw==
X-Gm-Message-State: AKwxytdTXLBSC/6ETpMm9zsWCTB+zKZ0AcZxL1bs0iT9od6iPyctP5jP
	CB7VSD9mBOsTlBcbj1OXy6Totw==
X-Google-Smtp-Source: AH8x226UBplCiuLthuwaw1gjEWibxp8Gi1OfLQXBZmjhCSxfakOJQbxPx243qQ0iIgqw7qTTKPAM0g==
X-Received: by 10.55.145.1 with SMTP id t1mr17569893qkd.199.1517364437611;
	Tue, 30 Jan 2018 18:07:17 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	h195sm10035535qke.29.2018.01.30.18.07.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Jan 2018 18:07:16 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 31 Jan 2018 00:07:10 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Jan 2018 00:07:09 -0200
Message-Id: <20180131020709.25234-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] glide: Add 0.13.1 version
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
X-List-Received-Date: Wed, 31 Jan 2018 02:07:17 -0000

Glide is a widely used Vendor Package Management for Golang,
especially in private projects as it allows for internal repositories
clone and other fancy things.

This recipe has been originally done as part of updatehub development.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-devtools/glide/glide_0.13.1.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-devtools/glide/glide_0.13.1.bb

diff --git a/meta/recipes-devtools/glide/glide_0.13.1.bb b/meta/recipes-devtools/glide/glide_0.13.1.bb
new file mode 100644
index 00000000000..5069484dddd
--- /dev/null
+++ b/meta/recipes-devtools/glide/glide_0.13.1.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Vendor Package Management for Golang"
+HOMEPAGE = "https://glide.sh"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=54905cf894f8cc416a92f4fc350c35b2"
+
+GO_IMPORT = "github.com/Masterminds/glide"
+SRC_URI = "git://${GO_IMPORT}"
+SRCREV = "67790b3dbede72cfdc54aa53be4706322c9499e0"
+
+inherit go
+
+RDEPENDS_${PN}-dev += "bash"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.16.1



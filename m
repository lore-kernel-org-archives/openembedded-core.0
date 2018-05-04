Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id ACFB8745A5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 22:52:57 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id g20-v6so9679913pgv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 15:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=b58aiWzJWW18YAEwEISOBdUprRrbPZC1sr/sO696aNg=;
	b=vA5SN8Apr/mPBV6rapvFeGSQa6QbfldFOe5mISp7da8N0dBc4izu0M81x9aggRcDNQ
	fRXs78PBJDamdkXbtGrqTu8ZoE5UtTZG8BsG8B56sioQpFEAevsgr3ArCc6ngsI7uxMS
	osKhFEdZUgjo5ex8uPSkpWbJMTVey/+4d+TvY1MWskerDKZYA0KC8Sqvuv8ec2P+7tWL
	GxqAFjsTK2oc4G6xE3DRgEt05tJt03bOAPmwsDeWiLu3cytHwClv+vMxHe9y1joNts5d
	oBkXD4Wll4ZFIiRO+OZdTYlyUQBxnzNhY6u+iWW1vsFYt02nWBdlaEgcCdLIwqLWB75g
	g2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=b58aiWzJWW18YAEwEISOBdUprRrbPZC1sr/sO696aNg=;
	b=nXrVIZoisMSyTj/EUmatbh/IWU6twTEjI8iLH/ctPOA/vuK6GKjz3GI4e3d3BO+GbT
	mARRvCLKn5MeXm14siUefAUEzQQ2GsmZB23QEvpEM6A/yOeDwC0bS5vW9sMbHQ3u+I3W
	6ySZDG7h34AuaGtqlW5fOMbnKQ7kS1Pa62WkPUMB8JuxJGt7DiLthtbY5t79nkSk+++E
	x4E0dw21+TyUth6fty8nNO6dZaYVHPhMtCw1ctCqIuD32N2vrY5AfplK7Mq2hxSDhZnN
	C91EjJ5UCRtbn6citmvtlG1vanSmyEs0GGjGKOsUEbQLAQg7jIw/MQNQMlX5XS64h9d3
	1wGg==
X-Gm-Message-State: ALQs6tBWpssb/yCZ0v61NJbPYQTomFVK+xXJ6eVhvu1LVDQPzqvwNNwS
	Bf25DloG3MHQFjy1Uf7w8oAEqA==
X-Google-Smtp-Source: AB8JxZqV0GTVeTJhAWm9/boyM+nVQ4tP0cSfM10LwMiC7fJg1HE/QyC34Z292tZoKzY8X0I8yDSgYQ==
X-Received: by 2002:a63:b908:: with SMTP id
	z8-v6mr23614675pge.436.1525474378287; 
	Fri, 04 May 2018 15:52:58 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	w26sm41378391pfi.17.2018.05.04.15.52.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 May 2018 15:52:57 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 15:52:44 -0700
Message-Id: <1525474370-7913-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1525474370-7913-1-git-send-email-armccurdy@gmail.com>
References: <1525474370-7913-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/8] babeltrace: move ASNEEDED over-ride into the babeltrace recipe
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
X-List-Received-Date: Fri, 04 May 2018 22:52:57 -0000

Move the recipe specific over-ride for ASNEEDED into the recipe to
make it more apparent that the over-ride is being applied (and that
it should be re-checked on version updates, etc).

Also misc minor recipe cleanup (re-order variables to follow the OE
style guide, etc).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/as-needed.inc        |  1 -
 meta/recipes-kernel/lttng/babeltrace_1.5.5.bb | 12 ++++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/as-needed.inc b/meta/conf/distro/include/as-needed.inc
index 6a8ad9d..38de3a1 100644
--- a/meta/conf/distro/include/as-needed.inc
+++ b/meta/conf/distro/include/as-needed.inc
@@ -1,7 +1,6 @@
 
 ASNEEDED = "-Wl,--as-needed"
 
-ASNEEDED_pn-babeltrace = ""
 ASNEEDED_pn-console-tools = ""
 ASNEEDED_pn-distcc = ""
 ASNEEDED_pn-openobex = ""
diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
index 92d86b9..154d248 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
@@ -2,18 +2,18 @@ SUMMARY = "Babeltrace - Trace Format Babel Tower"
 DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
 HOMEPAGE = "http://www.efficios.com/babeltrace/"
 BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
-
 LICENSE = "MIT & GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
-inherit autotools pkgconfig
+SRC_URI = "http://www.efficios.com/files/babeltrace/babeltrace-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "7decafd46093e4e47c14e7307d498986"
+SRC_URI[sha256sum] = "409146789b4a6b81f6a275fcad932a030743d444f6de5bd4a34aaf17aa72e8ac"
 
-SRC_URI = "http://www.efficios.com/files/babeltrace/babeltrace-${PV}.tar.bz2 \
-"
+inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-debug-info"
 
-SRC_URI[md5sum] = "7decafd46093e4e47c14e7307d498986"
-SRC_URI[sha256sum] = "409146789b4a6b81f6a275fcad932a030743d444f6de5bd4a34aaf17aa72e8ac"
+ASNEEDED = ""
-- 
1.9.1



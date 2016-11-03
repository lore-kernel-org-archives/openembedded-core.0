Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id B601771AE7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 15:34:43 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id x186so2066255vkd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 08:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=2hUydmQKhUrvS0oZuKTxtkfJOBD2G9FfJkuhBh3fYnM=;
	b=KPuPJDu8e1qnj592kBZztZ12zrqW3mOLnMq+e30VK0WwOnJskE/UNEkTjyrarc8XiE
	SCv+eFU++up+1rgsgBlnEmGrGbp0RaebT6kRxohxQDnt8r6j5fCyDHxrhXhrbSO/hSEy
	eS1AghfOji00rjfxvoUk16x/z07oUBvRPXSwb2Z3+006Okz7AecC6yJDzodunsLUtHrf
	JTW0ATBjbWkR25o/JW/s6gPEU3yrssHtMXD5mDG1CLLHBNwuBO+N1HEiKEYtRLtvjjLB
	iJpIMUapa843PKCmq5nhfRqDAYUGKWnm1YGT9e0s6i6FMzmmj865grcWN6DeRyqMUTJT
	2SgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=2hUydmQKhUrvS0oZuKTxtkfJOBD2G9FfJkuhBh3fYnM=;
	b=Q9335A10naNTaTmhgsqrqkAbTkp8ZbiNQZU8nFEAmoeiqucrvfUTDP2mbLtE7plaaG
	9d5WjvIpcgI+2DBtJcOnfpin+d7NuUimvOqOlW2u5wci/27lw0lwIs8dm01H3JynhI5/
	InJuj9GNE+c5QbU/wX5f99usy3ePudD8zL5LpcD43eh75NtrBQQcXVrtL6dU+bwKM8u6
	doEDmxxDZGc/bIL1+JZ67amFlthOHgJKCmpeHrHwqEOy4A0jgHQGq/WpFVFO3vluGFjh
	UhrAD+oiipoUYlVzXk5N5K8YEAzjWUc/sH66SqRjFLDHqJ9mw9vCP3AyHiSCGQOSJAoM
	Tm5g==
X-Gm-Message-State: ABUngvffpjQv9vmWFueG8QCef06zQp8pNy8VdfAjHEum8VhGHXmk7C4yL7ayKSujq0B+vg==
X-Received: by 10.31.207.199 with SMTP id f190mr6925356vkg.32.1478187284536;
	Thu, 03 Nov 2016 08:34:44 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.155.148])
	by smtp.gmail.com with ESMTPSA id
	o12sm1864512vka.19.2016.11.03.08.34.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Nov 2016 08:34:43 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Nov 2016 13:34:03 -0200
Message-Id: <1478187243-17488-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [PATCH v2] serf: Update to version 1.3.9
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
X-List-Received-Date: Thu, 03 Nov 2016 15:34:45 -0000

Change SRC_URI and UPSTREAM_CHECK_URI to use APACHE_MIRROR to download
serf from apache project page.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-support/serf/{serf_1.3.8.bb => serf_1.3.9.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/serf/{serf_1.3.8.bb => serf_1.3.9.bb} (68%)

diff --git a/meta/recipes-support/serf/serf_1.3.8.bb b/meta/recipes-support/serf/serf_1.3.9.bb
similarity index 68%
rename from meta/recipes-support/serf/serf_1.3.8.bb
rename to meta/recipes-support/serf/serf_1.3.9.bb
index c498d90..6ea14ac 100644
--- a/meta/recipes-support/serf/serf_1.3.8.bb
+++ b/meta/recipes-support/serf/serf_1.3.9.bb
@@ -1,12 +1,12 @@
 SUMMARY = "High-Performance Asynchronous HTTP Client Library"
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/s/${BPN}/${BPN}_${PV}.orig.tar.gz \
+SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://norpath.patch \
            file://env.patch"
 
-SRC_URI[md5sum] = "713beaf05d7f3329de121e218e2fcb93"
-SRC_URI[sha256sum] = "77134cd5010664ca023585bce50978bd4005906ed280ff889f591f86df7c59e4"
+SRC_URI[md5sum] = "370a6340ff20366ab088012cd13f2b57"
+SRC_URI[sha256sum] = "549c2d21c577a8a9c0450facb5cca809f26591f048e466552240947bdf7a87cc"
 
-UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/s/serf/"
+UPSTREAM_CHECK_URI = "${APACHE_MIRROR}/${BPN}/"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
-- 
2.1.4



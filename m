Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26BE5C41513
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 13:37:06 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.56936.1718631416995712825
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 06:36:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=WiShe4dP;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=i7A5IOW1YuIk98fmZ9oDyPtKgMH6zl4tC23EXrDMAvs=; b=WiShe4dPrbK9K68tGu4vpPzYch
	Kry/Ld9pnfVHpaqW8++NmRoJUhwhdVH6m2fG4+6AN30h2NFog6kuobtN3aKj+A8/zE9ymCUzw5zGt
	TBzoIjbYeqRK73BrWq7YWqzZt4O/YLaUHk46Ax9qA+858LNFaPaf6d9Qsv1NccukcGkZvt3kBevwM
	3dEjIYnhh5QJ5k0AxBvGwXE1mg5SUv+pOhm4gSdlekrTeHW8CoZWjwVjfb65hZ52orjdjdJyBgNQG
	mIL87A+5AyCQI8kK7vdg1q+9mVG583XpMrhGn/f0N0w57F30T+8B0Cf6Dcox+g/v/VG/uxEjgfp3S
	W1rL1kTg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1sJCXa-0009hz-Qp; Mon, 17 Jun 2024 15:36:55 +0200
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1sJCXW-0002IR-2O;
	Mon, 17 Jun 2024 15:36:55 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH 1/3] ofono: upgrade 2.7 -> 2.8
Date: Mon, 17 Jun 2024 15:36:40 +0200
Message-ID: <20240617133643.1856546-1-martin@geanix.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27309/Mon Jun 17 10:30:25 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 13:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200837

Changelog:
 * Release 2.8
 * build: Require at least version 0.66 when building with external ELL
 * qmi: Remove unused shutdown members in qmi_device_qrtr
 * drivers: Use the new license header format
 * plugins: Use the new license header format
 * isimodem: Use the new license header format
 * rilmodem: Use the new license header format
 * mbimmodem: Use the new license header format
 * unit: Use the new license header format
 * tools: Use the new license header format
 * include: Use the new license header format
 * dundee: Use the new license header format
 * core: Use the new license header format
 * qmimodem: Use the new license header format
 * atmodem: Use the new license header format
 * build: Add notifylist.[ch] from ell
 * udevng: Fix detection of USB attached tty devices
 * udevng: Don't crash for non-QMI devices
 * qmimodem: Remove the create exclusive service API
 * voicecall: Fix use after free
 * atmodem: gprs-context: use default PPP ACCM for Quectel serial modems
 * atmodem: sim: Fix CRSM result handling
 * qmi: gprs-context: support bind_mux for pcie devices
 * udevng: Add mhi subsystem detection
 * udevng: add and use get_ifname() for netdev nodes
 * gobi: ensure required properties are provided
 * gobi: Rename KernelDriver to NetworkInterfaceDriver
 * gobi: add / use DeviceProtocol property
 * qmi: Use l_basename instead of basename
 * log: Use l_basename instead of basename
 * build: link dundee with ell
 * log: Handle dladdr failure

License-Update: license header replaced with spdx identifier
Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 .../recipes-connectivity/ofono/{ofono_2.7.bb => ofono_2.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.7.bb => ofono_2.8.bb} (89%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.7.bb b/meta/recipes-connectivity/ofono/ofono_2.8.bb
similarity index 89%
rename from meta/recipes-connectivity/ofono/ofono_2.7.bb
rename to meta/recipes-connectivity/ofono/ofono_2.8.bb
index bc1f3efd04db..809485d42178 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.7.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.8.bb
@@ -4,14 +4,14 @@ HOMEPAGE = "http://www.ofono.org"
 BUGTRACKER = "https://01.org/jira/browse/OF"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
-                    file://src/ofono.h;beginline=1;endline=20;md5=3ce17d5978ef3445def265b98899c2ee"
+                    file://src/ofono.h;beginline=1;endline=6;md5=13e42133935ceecfc9bcb547f256e277"
 DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
     file://ofono \
 "
-SRC_URI[sha256sum] = "dabf6ef06b94beaad65253200abe3887046a4e722f4fe373c4264f357ae47ad3"
+SRC_URI[sha256sum] = "b5aef455b3a374ce43bad43c2ade9d0430d9c0d28952385c44ac7d0dc933bbb8"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.45.2



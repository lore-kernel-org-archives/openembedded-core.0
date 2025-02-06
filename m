Return-Path: <oobitots@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0AD4C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 14:49:25 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.web10.42781.1738853356422626473
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 06:49:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=crsnWH4C;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2747; q=dns/txt; s=iport;
  t=1738853356; x=1740062956;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9V5uQlqEBw9EndXmqjt7om+MfKYTdw3WAUMm1vkfZUs=;
  b=crsnWH4Cq/mv4FKLStciq1+yhzS2ZS+wkVYWpUeDmWsceKAxRPChbxat
   4PMdiCV2x+rmKDjCPRulGaggrHlRP4UhFw+asdGnN564U5/mfXc1vH7VP
   Z/rD7PgnmpO3CaawyuQWcO5ujfU2MPtjKxBXuhYe5IyiIyZNt6jqYIfeX
   A=;
X-CSE-ConnectionGUID: jx9VOH+bT/Snrsx9YnPCYw==
X-CSE-MsgGUID: E5XYYTdcSXikbM+bGbvnsA==
X-IPAS-Result: =?us-ascii?q?A0ApAAC/yqRn/5X/Ja1aHAECAgEHARQBBAQBggAHAQwBg?=
 =?us-ascii?q?kp2WkJIjHKVSZIhgSUDVg8BAQEPNQ8EAQGFB4sCAiY0CQ4BAgQBAQEBAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4YIhl02AUaBDESDAgGCZAIBr1uCL?=
 =?us-ascii?q?IEBhHzZOIFugUgBjUqFZycbgUlEhH2FEIV3BIdeonZIgSEDWSwBVRMNCgsHB?=
 =?us-ascii?q?YFxAzUMCzAVgUZ7gkdpSToCDQI1gh58giuEWoRDhE2FW4ISgg6IQkADCxgNS?=
 =?us-ascii?q?BEsNxQbBj5uB51OATyEGIEOAYFGgRELkyezLYQlhG+HKZUuGjOqUQGYfKRIh?=
 =?us-ascii?q?GaBZzyBWXAVgyIJSRkP2gVDNTwCBwsBAQMJkXoBAQ?=
IronPort-Data: A9a23:+OwZbq0pvwjzepPrZfbD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzYPm
 DYfUG3TOfvbYzD3fdlxPYmzpxhV6p7VmoJmTlNv3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmE4E/watANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXU4
 rsen+WFYAX4g2QsbDpEg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGDlFnA6o4uexLRlpI7
 +cIeQELVjuymLfjqF67YrEEasULNsLnOsYb/3pn1zycVKxgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiRC/FMEg9/5JYWm+Cih2X4byZwo1OOrq1x6G/WpOB0+OO0bYuMJIDQHq25mG61+
 1L3zlj1CSoqNd+V7HmP3XiygPTmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl/DQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:37/y1aPVuNKzz8BcTsqjsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTnjAsm9qBrnnPYfi7X5Vo3NYOCJggeVxflZnOjfK/mKIVyYygabvp
 0QF5RDNA==
X-Talos-CUID: 9a23:7i0YQGOO3UB24e5DWjk2ymk0WcoZNUbb1mzAcn6+MU1YV+jA
X-Talos-MUID: 9a23:cyzQIwq6LqeAy+9l3tEezxw/BPZZ36ilM3AMkp8j+MOrPzJ2IB7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.13,264,1732579200"; 
   d="scan'208";a="315916423"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Feb 2025 14:49:15 +0000
Received: from sjc-ads-8148.cisco.com (sjc-ads-8148.cisco.com [171.68.208.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id A0944180001DC;
	Thu,  6 Feb 2025 14:49:15 +0000 (GMT)
Received: by sjc-ads-8148.cisco.com (Postfix, from userid 500841)
	id 36F0ACBEF83; Thu,  6 Feb 2025 06:49:15 -0800 (PST)
From: Oleksiy Obitotskyy <oobitots@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksiy Obitotskyy <oobitots@cisco.com>
Subject: [PATCH] systemd: move systemctl utility to separate subpackage
Date: Thu,  6 Feb 2025 14:49:07 +0000
Message-ID: <20250206144907.1924993-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.208.186, sjc-ads-8148.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 14:49:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210941

Move systemctl into separate subpackage to minimize
dependencies from core systemd package.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
---
 meta/recipes-core/systemd/systemd_257.1.bb | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_257.1.bb b/meta/recipes-core/systemd/systemd_257.1.bb
index cdf72a5015..2d4d3e0a7f 100644
--- a/meta/recipes-core/systemd/systemd_257.1.bb
+++ b/meta/recipes-core/systemd/systemd_257.1.bb
@@ -429,6 +429,7 @@ PACKAGE_BEFORE_PN = "\
     ${PN}-mime \
     ${PN}-networkd \
     ${PN}-rpm-macros \
+    ${PN}-systemctl \
     ${PN}-udev-rules \
     ${PN}-vconsole-setup \
     ${PN}-zsh-completion \
@@ -678,13 +679,8 @@ CONFFILES:${PN} = "${sysconfdir}/systemd/coredump.conf \
 "
 
 FILES:${PN} = " ${base_bindir}/* \
-                ${base_sbindir}/shutdown \
-                ${base_sbindir}/halt \
-                ${base_sbindir}/poweroff \
-                ${base_sbindir}/runlevel \
                 ${base_sbindir}/telinit \
                 ${base_sbindir}/resolvconf \
-                ${base_sbindir}/reboot \
                 ${base_sbindir}/init \
                 ${datadir}/dbus-1/services \
                 ${datadir}/dbus-1/system-services \
@@ -749,9 +745,19 @@ FILES:${PN} = " ${base_bindir}/* \
 
 FILES:${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
+FILES:${PN}-systemctl = " \
+                ${bindir}/systemctl \
+                ${base_sbindir}/shutdown \
+                ${base_sbindir}/halt \
+                ${base_sbindir}/poweroff \
+                ${base_sbindir}/runlevel \
+                ${base_sbindir}/reboot \
+"
+
 RDEPENDS:${PN} += "kmod dbus util-linux-mount util-linux-umount udev (= ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty util-linux-fsck util-linux-swaponoff"
 RDEPENDS:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
 RDEPENDS:${PN} += "volatile-binds"
+RDEPENDS:${PN} += "${PN}-systemctl"
 
 RRECOMMENDS:${PN} += "${PN}-extra-utils \
                       udev-hwdb \
@@ -867,14 +873,15 @@ python do_warn_musl() {
 }
 addtask warn_musl before do_configure
 
-ALTERNATIVE:${PN} = "halt reboot shutdown poweroff \
-                     ${@bb.utils.contains('PACKAGECONFIG', 'sysvinit', 'runlevel', '', d)} \
+ALTERNATIVE:${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'sysvinit', 'runlevel', '', d)} \
                      ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'resolv-conf', '', d)}"
 
 ALTERNATIVE_TARGET[resolv-conf] = "${sysconfdir}/resolv-conf.systemd"
 ALTERNATIVE_LINK_NAME[resolv-conf] = "${sysconfdir}/resolv.conf"
 ALTERNATIVE_PRIORITY[resolv-conf] ?= "50"
 
+ALTERNATIVE:${PN}-systemctl = "halt reboot shutdown poweroff runlevel"
+
 ALTERNATIVE_TARGET[halt] = "${base_bindir}/systemctl"
 ALTERNATIVE_LINK_NAME[halt] = "${base_sbindir}/halt"
 ALTERNATIVE_PRIORITY[halt] ?= "300"
-- 
2.44.0



Return-Path: <shinucha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43508C44507
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 04:51:05 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7048.1784263858168251903
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 21:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=cK4Z0eME;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: shinucha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2079; q=dns/txt;
  s=iport01; t=1784263858; x=1785473458;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2PnfdosL+aLgqE5Pr21msncjzF6Aa8O9PHOmiXVv5Oc=;
  b=cK4Z0eMEghT1YvkHOv71OEp3mNT4gL6bZu60osyTsSJv+AYjZu5dlkBi
   U7BQoRl6AmJ8YyI5jcm8n0Wb/PL6iVwekRZrp+fFIINPscX1Viq6hq/a5
   2Oi/7fck2i/61if+zRl6GcwJv/fpu5pl8lhJPyWnp9hrnPlI2EvqdzHBv
   mvdfZ7e82LOTRjJLLd4eAezAY8n5dnJmWqw40xx1wag3t7nv7EnHTkitg
   jzCKTv64ATckhS0s3fQzzTwrAw6BSHMHbRrJsLmiyBFDuwK3mM6WTdXce
   U4ZBHeEaLodHAb1nRuzNMybxYQ6qtKxuUoE2XKH0CAAPJlz0FIDOQU1X0
   A==;
X-CSE-ConnectionGUID: HHwKKv2RRdmidFBRNex01Q==
X-CSE-MsgGUID: ZDq3Rj5uT3+sLXCkmHldcA==
X-IPAS-Result: =?us-ascii?q?A0A+AgBeqVlq/43/Ja1aglmCV4FTQkmWSp4egX4PAQEBD?=
 =?us-ascii?q?1EEAQGFBY1UAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Th?=
 =?us-ascii?q?lyGXTYBRoEMRIMCgnUCAb1cgiyBAYR92UiBZgELFAEFgTOFcYduhXEnG4FJR?=
 =?us-ascii?q?IR+hAqBBoVWIgSDHBKBeFCPMUiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBDBsHBYEdgTqBAIR2Ix8DOX+BL3VKdy1pARIXgU6CFIE+AwsYDUgRLDcUG?=
 =?us-ascii?q?wQ+bgeNSCOCHyABPBwBNAGCKECTABKSU6EPhCeBZp91GjOEBKZomQiCWaIBh?=
 =?us-ascii?q?GmBaDyBWU0jFYMiUxkPV+AkJDU/BwIHDwKRc4F+AQE?=
IronPort-Data: A9a23:kj+7HaJ2CUIxes/lFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS3jFVy
 2ZNWm+DPq7fYWunfdskbIXj8UwB6sTcyIdqHVcd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGcqajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1OLF4VHpNCwNx7BGBC2
 9YiDj0dNkm60rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBUbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME2ojx5nYj/7DLolnOaum3L/ehVTqUmeouw85G27IAlZjeG0aYWKJ4DSLSlTtnS0v
 zn8/TnkPkpZL/iv4jmA0nagjcaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1rfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EhpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:N6WQeKNxRh3JNcBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:e/v7t2GZ8kdgog+aqmJH1FE3Od5/SEfRyXbcDWWCL2t5EOSsHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AHWYdQw807WZTL6/TLwvBVAiQf/VE+v+UCh0Qrc5?=
 =?us-ascii?q?FoO20Hi91GzORhx3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="511177540"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 04:50:57 +0000
Received: from sjc-ads-8046.cisco.com (sjc-ads-8046.cisco.com [171.68.208.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 042D218000193;
	Fri, 17 Jul 2026 04:50:57 +0000 (GMT)
Received: by sjc-ads-8046.cisco.com (Postfix, from userid 1784405)
	id 91070CAF0A0; Thu, 16 Jul 2026 21:50:56 -0700 (PDT)
From: Shinu Chandran <shinucha@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Shinu Chandran <shinucha@cisco.com>
Subject: [OE-core] [master] [PATCH] vim: add PACKAGECONFIG option for desktop files
Date: Thu, 16 Jul 2026 21:50:36 -0700
Message-Id: <20260717045036.3304076-1-shinucha@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-8046.cisco.com [171.68.208.84];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.208.84, sjc-ads-8046.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 04:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241115

The recipe currently always inherits mime-xdg and keeps the installed desktop files. Add a desktop PACKAGECONFIG option so configurations can disable that desktop integration while preserving the current default behavior.

When desktop support is disabled, remove the generated desktop files during do_install and avoid inheriting mime-xdg.

Signed-off-by: Shinu Chandran <shinucha@cisco.com>
---
 meta/recipes-support/vim/vim.inc | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index ce22d957d6..4dd12d220c 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -28,7 +28,7 @@ UPSTREAM_VERSION_UNKNOWN = "1"
 
 VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
 
-inherit autotools-brokensep update-alternatives mime-xdg pkgconfig
+inherit autotools-brokensep update-alternatives pkgconfig
 
 CLEANBROKEN = "1"
 
@@ -53,9 +53,11 @@ do_configure () {
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux x11', d)} \
+    desktop \
     nls \
 "
 
+PACKAGECONFIG[desktop] = ""
 PACKAGECONFIG[gtkgui] = "--enable-gui=gtk3,--enable-gui=no,gtk+3"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
 PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
@@ -65,6 +67,8 @@ PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
 PACKAGECONFIG[nls] = "--enable-nls,--disable-nls,,"
 PACKAGECONFIG[sound] = "--enable-canberra,--disable-canberra,canberra,"
 
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'desktop', 'mime-xdg', '', d)}
+
 EXTRA_OECONF = " \
     --disable-gpm \
     --disable-gtktest \
@@ -111,6 +115,11 @@ do_install() {
 	# delete the block.
 	sed -i '/the mouse works just fine/,+4d' ${D}/${datadir}/${BPN}/vimrc
     fi
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'desktop', 'false', 'true', d)}; then
+        rm -f ${D}${datadir}/applications/vim.desktop
+        rm -f ${D}${datadir}/applications/gvim.desktop
+    fi
 }
 
 PARALLEL_MAKEINST = ""
-- 
2.35.6



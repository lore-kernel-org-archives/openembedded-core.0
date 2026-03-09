Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1AEEFCD6C
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 09:18:22 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9928.1773047897508850841
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 02:18:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HTjtqAd3;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2453; q=dns/txt;
  s=iport01; t=1773047897; x=1774257497;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5sG7IvzrUKM4B4PwWHl7fmozf0J+vhm0PsL1WcjLO+o=;
  b=HTjtqAd3BgcQjDz4SUvrA5kHcOFEtvgdu1PDUg80Pwp+106Rp3AQuh1N
   71/qBhg14ivbg2iOBVVjsK72rHjEFMaqmqgKo+TkJq6cvxmgGmCLRpLOY
   AKzebI0rcaCx0Vs0vF8KCTCMnYV9DzdIdsY6b43AJLINMU2vFRtnJf4uI
   dnDchDES9RH06g4AKmdInYFx0y/x7lnYipjxLAl6wRB6psrjEkQs18zpj
   zepQ2MqoeeORcJBeKsiimFMZqg579ZNSnJABtzJDTnp70ayh4RDPgWWmR
   Wf/FFnBFjSqeww8jQ44xIKUtXAffvlvJK8Mrl61XVEgWnYfq7cubohCKg
   A==;
X-CSE-ConnectionGUID: idbC0SqPRt2Cj1goDXenpw==
X-CSE-MsgGUID: Qd1rhLgZQFCW8bDM5mhwBg==
X-IPAS-Result: =?us-ascii?q?A0DbDQCbj65p/5L/Ja1ahSEPgU9DSZNaAYJwmD+HXQ8BA?=
 =?us-ascii?q?QEPUQQBAYUHjSICJjgTAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgFGMCY2RIMCgnQDqmaCLIEB4CIBCxQBgTiFPIgZdIR6Jxsbg?=
 =?us-ascii?q?XKEfYUQhXcEgiKBDpMbSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ELG?=
 =?us-ascii?q?wcFhSAPiHJ0boETgwMDCxgNSBEsNxQbBD5uB41qPoFBc4EOAYEBO2wGph2hD?=
 =?us-ascii?q?goog3ShWBozhASUFZJSLodlFpBdpFmEaIF/JYFZcBWDIlIZD45fzHMmMjwCB?=
 =?us-ascii?q?wsBAQMJk2cBAQ?=
IronPort-Data: A9a23:MkibW6kyLBWdRglSfF7uuP7o5gzWJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJWm3UMqyLZ2L2fdFya42xoRgPusKHyNNlHFdk+Xg0QltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+Za31GONgWYubDpPs/Pb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYwU8M0vOnh2z
 +BCAzJUYRevt++w2K3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMiSBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTZD/7C7pm9Ausrnn9ejFfrnqepLE85C7YywkZPL3FbouNJ4DVG50J9qqej
 lvKpn75Jh4oDfK09mqP3lfxg+/QtyyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjlCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:wUyGYatArS4UkdKN7LjrqrrV7skDfdV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIYxeOldK0Ec
 xbAs9D4BqaNykfsfrH
X-Talos-CUID: =?us-ascii?q?9a23=3AC7JyZmh4jGErwXwNC75uJMSdRDJuc3HX5y/rOne?=
 =?us-ascii?q?CFTxCSuSaTnOg9aV8jJ87?=
X-Talos-MUID: 9a23:CH25BATLQ2sHYniNRXTViGh4NONn0Z2AI39dm7kj5syEKgZ/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,109,1770595200"; 
   d="scan'208";a="690547604"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Mar 2026 09:18:16 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 97EB2180004B1;
	Mon,  9 Mar 2026 09:18:16 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 46AF5CC1288; Mon,  9 Mar 2026 02:18:16 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH 3/3] improve_kernel_cve_report: add option to read debugsources.zstd
Date: Mon,  9 Mar 2026 02:18:11 -0700
Message-Id: <20260309091811.3508300-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 09:18:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232693

From: Daniel Turull <daniel.turull@ericsson.com>

Adding option to be able to import debugsources.zstd directly.
The linux-yocto-debugsources.zstd is generated in every build and
does not require any additional configuration.

In contrast, SPDX_INCLUDE_COMPILED_SOURCES needs to be explicitly
added and increases build time.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit c84a8958f30bbb982656ddcbe7476f6f81e1a6fb)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 scripts/contrib/improve_kernel_cve_report.py | 27 ++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib/improve_kernel_cve_report.py
index 5c39df05a5..3a15b1ed26 100755
--- a/scripts/contrib/improve_kernel_cve_report.py
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -236,6 +236,26 @@ def read_spdx3(spdx):
             cfiles.add(filename)
     return cfiles
 
+def read_debugsources(file_path):
+    '''
+    Read zstd file from pkgdata to extract sources
+    '''
+    import zstandard as zstd
+    import itertools
+    # Decompress the .zst file
+    cfiles = set()
+    with open(file_path, 'rb') as fh:
+        dctx = zstd.ZstdDecompressor()
+        with dctx.stream_reader(fh) as reader:
+            decompressed_bytes = reader.read()
+            json_data = json.loads(decompressed_bytes)
+            # We need to remove one level from the debug sources
+            for source_list in json_data.values():
+                for source in source_list:
+                    src = source.split("/",1)[1]
+                    cfiles.add(src)
+    return cfiles
+
 def check_kernel_compiled_files(compiled_files, cve_info):
     """
     Return if a CVE affected us depending on compiled files
@@ -372,6 +392,10 @@ def main():
         "--spdx",
         help="SPDX2/3 for the kernel. Needs to include compiled sources",
     )
+    parser.add_argument(
+        "--debug-sources-file",
+        help="Debug sources zstd file generated from Yocto",
+    )
     parser.add_argument(
         "--datadir",
         type=pathlib.Path,
@@ -415,6 +439,9 @@ def main():
     if args.spdx:
         compiled_files = read_spdx(args.spdx)
         logging.info("Total compiled files %d", len(compiled_files))
+    if args.debug_sources_file:
+        compiled_files = read_debugsources(args.debug_sources_file)
+        logging.info("Total compiled files %d", len(compiled_files))
 
     if args.old_cve_report:
         with open(args.old_cve_report, encoding='ISO-8859-1') as f:
-- 
2.35.6



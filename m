Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3AC0C433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 06:54:02 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.24517.1641192841339163766
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jan 2022 22:54:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uJHPK/6q;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641192839; i=@fujitsu.com;
	bh=zMwYjqyOyQWXLK61BCBOaobwjur/Ske/J19i4GFae9s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uJHPK/6qLAiNdgPcXRQ724AJOIBonzsgeLEUFeUcvEZQ0NMbbKt6YhlcHAlFM8kwc
	 XK+Dtin5rT3QABjqs+y/AeN++eMcCLLONgyHSCB+1kv52XbUFoc6RJPp3+u71X/+Ug
	 uDtjNu1ZAejmXSk/geNvD48/u99bFG3NAq4aX1plhGD62T7QXQRF3nRyMu6o1PMyHG
	 krd88SigQNBYikIUoQTu08yy3hB3BatNjuWDcnFK3UD6rip89tmcmXieX7JvttETDp
	 0OvIIHiyFI+s4a/qRJrR6t14u7mAp1KWDxNZft8u56g/EVbygx40zwcwt6ykn1c2QI
	 IYNDWyKQmzYIQ==
Received: from [100.115.35.72] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 38/30-28974-78D92D16;
 Mon, 03 Jan 2022 06:53:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8MRots+91K
  iwY2vnBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bbmc3MBetEKybdesjWwPhSqIuRi0NIYDqT
  xJeJZ5khnOOMEjOvLGXtYuTkYBNQk5h+6waQzcEhIqAncfWfKEiYWUBF4sXvHnYQW1jAWuLFl
  i9MIDYLUPzgnUVgNq+Ak8T9X+sZQWwJAQWJKQ/fM0PEBSVOznzCAjFHQuLgixfMEDWKErMvN7
  NA2BUSs2a1MU1g5J2FpGUWkpYFjEyrGK2TijLTM0pyEzNzdA0NDHQNDU11jS11jQyN9RKrdBP
  1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS9PJSSzYxAoMspVj96g7Gzat+6h1ilORgUhLlrVS6
  mCjEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgvfDrEuJQoJFqempFWmZOcCAh0lLcPAoifDunAKU5
  i0uSMwtzkyHSJ1iDOd4s3bJImaOt2Cy7d5dINkOJmcuOLiamWMWmLzffghIPgCRQix5+XmpUu
  K852YDjRMAGZdRmge3DBbRlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8yqBTOHJzCuBu+k
  V0LlMQOfyap0HObckESEl1cDksv67xWHWC0ncBpl3n3Xv2nJsnarh/Nl+v61TNpzcv/u6jKLs
  HGU/roMNnifl3xQ+cA317ZJ32qsk+rGlydxrypMN8+02+m+X9Qs7UXPwwrrZax9+fGMkZfhlt
  ln6J/Xe46LrlrS6RmUcF+4/zfdU4fhr8ZajtZ36vqXl06p/6fYZPnkWM1mY7WLkq1U3Pazeec
  blyBcu8faXCTRY73jw5ewbc4MPS8p6y7h0TVy0hLcylK/p+I3tK8WSo/oF81kuzF50mW0a76Y
  AGwXbe0m9D/7pPOdy1jXcP/mjsEb+9ofWbaJ354us/sFXVuTb9/narjW/Sxg6L0zQduD/VJP5
  1eLB+wf6NoVLTik3ZkUqsRRnJBpqMRcVJwIA7tKdt2MDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-565.messagelabs.com!1641192838!288103!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2554 invoked from network); 3 Jan 2022 06:53:59 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-10.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Jan 2022 06:53:59 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2036rwSF018828
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Jan 2022 06:53:58 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 3 Jan 2022 06:53:57 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] resolvconf: upgrade 1.87 -> 1.90
Date: Mon, 3 Jan 2022 14:53:45 +0800
Message-ID: <1641192826-41876-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 06:54:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160111

Remove fix-path-for-busybox.patch
since it is included in 1.90

Changelog:
=========
 * Add basic support for ifupdown2 multiple address families
    (Closes: #993270).
  * Move the normalisation script into a separate file.
  * Add a build-time test to verify interface order list is correct.
  * Synchronise the interface order lists.
  * Make the usage notice more useful.
  * Embed the version number during the package build process.
  * Add --version command.
  * Add --help/-h.
  * Remove a pointless use of which(1), since we know where ifquery lives.
  * Update copyright years.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../resolvconf/fix-path-for-busybox.patch     | 20 -------------------
 ...{resolvconf_1.87.bb => resolvconf_1.90.bb} |  3 +--
 2 files changed, 1 insertion(+), 22 deletions(-)
 delete mode 100644 meta/recipes-connectivity/resolvconf/resolvconf/fix-path-for-busybox.patch
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.87.bb => resolvconf_1.90.bb} (96%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf/fix-path-for-busybox.patch b/meta/recipes-connectivity/resolvconf/resolvconf/fix-path-for-busybox.patch
deleted file mode 100644
index 1aead07869..0000000000
--- a/meta/recipes-connectivity/resolvconf/resolvconf/fix-path-for-busybox.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-
-busybox installs readlink into /usr/bin, so ensure /usr/bin
-is in the path.
-
-Upstream-Status: Submitted
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: resolvconf-1.76/etc/resolvconf/update.d/libc
-===================================================================
---- resolvconf-1.76.orig/etc/resolvconf/update.d/libc
-+++ resolvconf-1.76/etc/resolvconf/update.d/libc
-@@ -16,7 +16,7 @@
- #
- 
- set -e
--PATH=/sbin:/bin
-+PATH=/sbin:/bin:/usr/bin
- 
- [ -x /lib/resolvconf/list-records ] || exit 1
- 
diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.90.bb
similarity index 96%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.90.bb
index f57abe3619..54d114d7b6 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.90.bb
@@ -12,11 +12,10 @@ HOMEPAGE = "http://packages.debian.org/resolvconf"
 RDEPENDS:${PN} = "bash"
 
 SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable \
-           file://fix-path-for-busybox.patch \
            file://99_resolvconf \
            "
 
-SRCREV = "1dda36d8465e335c60190c41e7185d782da1bd7b"
+SRCREV = "0a06ef77f4022f8cea2edb7c3013af5a7ddc983d"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



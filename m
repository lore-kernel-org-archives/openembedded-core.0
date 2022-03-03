Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A85CC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:42:24 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web12.13952.1646329343658060952
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:42:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=TsKVz+KR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 0101017f50e02aaa-e90a7b89-0966-43c2-b67b-685b2bbf7701-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1646329342;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=2ARDpEsoh1EEQbc+oTsgaVzesgqMyvFmBtyRMoyWyk0=;
	b=TsKVz+KRHaXGqqqjKlWIQcE3Hi3nWRD3vl+P+7xHIORkWCi3FWCwkAFYptZP5uw/
	hyJ2hD1dMsQXKKAViu5QnzPVzaFeyc2upA9J+Gr/sbgW7kGi0tG23NEJAyH4fNYv35D
	9ErIyOvZgOEgQ8X22/6Eqf3fdrupZ2BarNNWR5AM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1646329342;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=2ARDpEsoh1EEQbc+oTsgaVzesgqMyvFmBtyRMoyWyk0=;
	b=T6xZzGGsOvr4cQ0YPF++ct0k0Wz9PsHR84u5rdMp4Qp4KIc/1psCkcaBl7jKHfBd
	1GN571IJdLuMzeHCEjlTovT8E0QBB5kMCVHftFf7CsEOhRrdjcXUnFsELze9zgaJR+Z
	tdD2pnJPT3jxZGq4Nafv6wXa2VWxkhJo18gjqb80=
Content-Type: multipart/mixed; boundary="===============7619927433594284755=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] kea: upgrading to 2.0.2 SUCCEEDED
Message-ID: 
 <0101017f50e02aaa-e90a7b89-0966-43c2-b67b-685b2bbf7701-000000@us-west-2.amazonses.com>
Date: Thu, 3 Mar 2022 17:42:22 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.03-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:42:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162670

--===============7619927433594284755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kea* to *2.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kea-upgrade-2.0.1-2.0.2.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7619927433594284755==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-kea-upgrade-2.0.1-2.0.2.patch"

From 2341035daf52c1706036bc87786381cb17c4758d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 3 Mar 2022 11:46:59 +0000
Subject: [PATCH] kea: upgrade 2.0.1 -> 2.0.2

---
 .../kea/{kea_2.0.1.bb => kea_2.0.2.bb}        | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/kea/{kea_2.0.1.bb => kea_2.0.2.bb} (77%)

diff --git a/meta/recipes-connectivity/kea/kea_2.0.1.bb b/meta/recipes-connectivity/kea/kea_2.0.2.bb
similarity index 77%
rename from meta/recipes-connectivity/kea/kea_2.0.1.bb
rename to meta/recipes-connectivity/kea/kea_2.0.2.bb
index 900ceb62e4..d75e529040 100644
--- a/meta/recipes-connectivity/kea/kea_2.0.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.0.2.bb
@@ -1,9 +1,28 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -1,4 +1,4 @@
+# -Copyright (C) 2009-2021 Internet Systems Consortium, Inc. ("ISC")
+# +Copyright (C) 2009-2022 Internet Systems Consortium, Inc. ("ISC")
+#  
+#  This Source Code Form is subject to the terms of the Mozilla Public
+#  License, v. 2.0. If a copy of the MPL was not distributed with this
+# 
+#
+
 SUMMARY = "ISC Kea DHCP Server"
 DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It supports both DHCPv4 and DHCPv6 protocols along with their extensions, e.g. prefix delegation and dynamic updates to DNS."
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
 LICENSE = "MPL-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=07b7477a1d815a4aacab73b1531f577a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b4ecee995eeb6780a17dd7e539e97abc"
 
 DEPENDS = "boost log4cplus openssl"
 
@@ -18,7 +37,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            "
-SRC_URI[sha256sum] = "f50bb9a954e314316b4033a175dc807496bb9c1754110bd92a21c165a9e84c57"
+SRC_URI[sha256sum] = "8d28213bdc8e2bb870a383b30ac1e53d54e1eba43d2f86e5151b08b66aa6cf32"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.27.0


--===============7619927433594284755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/kea/kea-dbg: FILELIST: removed "/usr/lib/.debug/libkea-http.so.29.0.0 /usr/lib/.debug/libkea-dhcpsrv.so.50.0.0 /usr/lib/.debug/libkea-hooks.so.39.0.0", added "/usr/lib/.debug/libkea-dhcpsrv.so.51.0.0 /usr/lib/.debug/libkea-http.so.30.0.0 /usr/lib/.debug/libkea-hooks.so.40.0.0"
packages/core2-32-poky-linux/kea/kea-dbg: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/kea/kea-dbg: PV changed from "2.0.1" to "2.0.2"
packages/core2-32-poky-linux/kea/kea-dbg: PKGSIZE changed from 268707028 to 268722796 (+0%)
packages/core2-32-poky-linux/kea/kea-dev: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/kea/kea-dev: PV changed from "2.0.1" to "2.0.2"
packages/core2-32-poky-linux/kea/kea-dev: PKGSIZE changed from 3727663 to 3727892 (+0%)
packages/core2-32-poky-linux/kea/kea-doc: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/kea/kea-doc: PV changed from "2.0.1" to "2.0.2"
packages/core2-32-poky-linux/kea/kea-doc: PKGSIZE changed from 1162452 to 1162901 (+0%)
packages/core2-32-poky-linux/kea/kea-locale: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/kea/kea-locale: PV changed from "2.0.1" to "2.0.2"
packages/core2-32-poky-linux/kea/kea-src: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/kea/kea-src: PV changed from "2.0.1" to "2.0.2"
packages/core2-32-poky-linux/kea/kea-src: PKGSIZE changed from 8936597 to 8938960 (+0%)
packages/core2-32-poky-linux/kea/kea-staticdev: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/kea/kea-staticdev: PV changed from "2.0.1" to "2.0.2"
packages/core2-32-poky-linux/kea/kea: FILELIST: removed "/usr/lib/libkea-dhcpsrv.so.50 /usr/lib/libkea-hooks.so.39 /usr/lib/libkea-http.so.29 /usr/lib/libkea-http.so.29.0.0 /usr/lib/libkea-dhcpsrv.so.50.0.0 /usr/lib/libkea-hooks.so.39.0.0", added "/usr/lib/libkea-http.so.30.0.0 /usr/lib/libkea-http.so.30 /usr/lib/libkea-hooks.so.40.0.0 /usr/lib/libkea-dhcpsrv.so.51.0.0 /usr/lib/libkea-dhcpsrv.so.51 /usr/lib/libkea-hooks.so.40"
packages/core2-32-poky-linux/kea/kea: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/kea/kea: PV changed from "2.0.1" to "2.0.2"
packages/core2-32-poky-linux/kea: SRC_URI changed from "http://ftp.isc.org/isc/kea/2.0.1/kea-2.0.1.tar.gz file://kea-dhcp4.service file://kea-dhcp6.service file://kea-dhcp-ddns.service file://kea-dhcp4-server file://kea-dhcp6-server file://kea-dhcp-ddns-server file://fix-multilib-conflict.patch file://fix_pid_keactrl.patch file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch" to "http://ftp.isc.org/isc/kea/2.0.2/kea-2.0.2.tar.gz file://kea-dhcp4.service file://kea-dhcp6.service file://kea-dhcp-ddns.service file://kea-dhcp4-server file://kea-dhcp6-server file://kea-dhcp-ddns-server file://fix-multilib-conflict.patch file://fix_pid_keactrl.patch file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch"
packages/core2-32-poky-linux/kea: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/kea: PV changed from "2.0.1" to "2.0.2"
Changes to packages/core2-32-poky-linux/kea (sysroot):
  /usr/lib/libkea-dhcpsrv.so changed symlink target from libkea-dhcpsrv.so.50.0.0 to libkea-dhcpsrv.so.51.0.0
  /usr/lib/libkea-hooks.so changed symlink target from libkea-hooks.so.39.0.0 to libkea-hooks.so.40.0.0
  /usr/lib/libkea-http.so changed symlink target from libkea-http.so.29.0.0 to libkea-http.so.30.0.0
  /usr/lib/libkea-dhcpsrv.so.50.0.0 moved to /usr/lib/libkea-dhcpsrv.so.51.0.0
  /usr/lib/libkea-dhcpsrv.so.50 moved to /usr/lib/libkea-dhcpsrv.so.51
  /usr/lib/libkea-hooks.so.39.0.0 moved to /usr/lib/libkea-hooks.so.40.0.0
  /usr/lib/libkea-hooks.so.39 moved to /usr/lib/libkea-hooks.so.40
  /usr/lib/libkea-http.so.29.0.0 moved to /usr/lib/libkea-http.so.30.0.0
  /usr/lib/libkea-http.so.29 moved to /usr/lib/libkea-http.so.30

--===============7619927433594284755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/kea/kea: FILELIST: removed "/usr/lib/libkea-http.so.29.0.0 /usr/lib/libkea-dhcpsrv.so.50 /usr/lib/libkea-dhcpsrv.so.50.0.0 /usr/lib/libkea-http.so.29 /usr/lib/libkea-hooks.so.39 /usr/lib/libkea-hooks.so.39.0.0", added "/usr/lib/libkea-http.so.30.0.0 /usr/lib/libkea-hooks.so.40.0.0 /usr/lib/libkea-hooks.so.40 /usr/lib/libkea-dhcpsrv.so.51 /usr/lib/libkea-dhcpsrv.so.51.0.0 /usr/lib/libkea-http.so.30"
Changes to packages/core2-32-poky-linux/kea (sysroot):
  /usr/lib/libkea-dhcpsrv.so changed symlink target from libkea-dhcpsrv.so.50.0.0 to libkea-dhcpsrv.so.51.0.0
  /usr/lib/libkea-hooks.so changed symlink target from libkea-hooks.so.39.0.0 to libkea-hooks.so.40.0.0
  /usr/lib/libkea-http.so changed symlink target from libkea-http.so.29.0.0 to libkea-http.so.30.0.0
  /usr/lib/libkea-dhcpsrv.so.50.0.0 moved to /usr/lib/libkea-dhcpsrv.so.51.0.0
  /usr/lib/libkea-dhcpsrv.so.50 moved to /usr/lib/libkea-dhcpsrv.so.51
  /usr/lib/libkea-hooks.so.39.0.0 moved to /usr/lib/libkea-hooks.so.40.0.0
  /usr/lib/libkea-hooks.so.39 moved to /usr/lib/libkea-hooks.so.40
  /usr/lib/libkea-http.so.29.0.0 moved to /usr/lib/libkea-http.so.30.0.0
  /usr/lib/libkea-http.so.29 moved to /usr/lib/libkea-http.so.30

--===============7619927433594284755==--


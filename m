Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C93C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:04:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.40711.1681117478595886820
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gFIakcPJ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117481; i=@fujitsu.com;
	bh=rlFXXnbTgFyrXSxX3gGYZshuJEK+sfIbpcaYIHnWnVM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gFIakcPJF84CwouUctiKcjUojk9PWG+iKvHBjn4gj06nk3rEqZTHdAAVRcq/ktkIy
	 jjFUrVwyFOwtKObc/mFEHgsCVaGONDO1rzqKkTKrV+/vBf/KtdQZOt/mmcTtaNp/zq
	 7UJqE/oc0umH3t/HF//FcEDBv2/sMR3mSmDs5Ws6+0nG26sL24teowQp1nVoqdqrpc
	 4ss0FaOOQoe3T+nOca7l057Fc1I3/fsjPDz1eZd3pwh+WrGD8NLzGvZnWHLlKzrioi
	 7OC975YalsfFpgiQ/9nEa31uxygYI4SoQu9C/KkN+ovgAqGLnChlsqbTEu/m3Dz8lG
	 QKTbNdP80yXdw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8OxWVfzonG
  KweVp/BZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bx9lvsBf0KFQ/XhDcwnpLuYuTiEBJ4wCgx
  /e0e5i5GTiDnMpPEh26oxB5GiR+/FjOBJNgEpCRu3P/P1sXIwSEioCdx9Z8oSJhZQEXixe8ed
  hBbWMBe4kLDWbA5LAKqEkfnbmcDsXkFnCTetJ0CsyUEFCSmPHwPVsMp4Cxx/MJudoi9ThLdx+
  6zQtQLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyQapx9igrDVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0K04tKkst0jXUSyrKTM8oyU3MzNFLrNJN1Est1c3LLyrJAEollhfrpRYX6xVX5ibnpOjl
  pZZsYgQGbkpx4u0djMt7/+odYpTkYFIS5e3iMk4R4kvKT6nMSCzOiC8qzUktPsQow8GhJMFrc
  AEoJ1iUmp5akZaZA4wimLQEB4+SCG/WeaA0b3FBYm5xZjpE6hSjLsemfV0HmIVY8vLzUqXEeT
  lAigRAijJK8+BGwCL6EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3m2HgabwZOaVwG16BXQ
  EE9ARXC4GIEeUJCKkpBqYknYXn+GUbVi08PW1W1vZpgTdvREz63Q5226VAN04+9i+Zl7mPqkL
  KjYW3BFMswpX3u2yuy4fq23Ifc/j4dyKI393e+9eJdSlFnF54Sm5QKHdC6+tmzjrrVuAg/KRq
  ZNOqDyMcHZfU1cpV6dQcJv7Svae+G2NZ1/17dp0VDFwyfwHUR17zvMzVe1TXD8ts1CWI6/7yP
  WrSv/NtQ5I//5ptIdl8mHnP0V3HmQfL9HwdP6auVfzQvgOtdKDX7N5s/mSP+zfKrPD0pBNyas
  jUmimfUHwfyvVoHNf+lfIF/Xc3pB15P3corUmh7wOfvC9en3l+qsHk19cM1LieSj+XS2LIey9
  GT+PiugfraObjB04lFiKMxINtZiLihMBuLva32MDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-732.messagelabs.com!1681117480!435057!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20889 invoked from network); 10 Apr 2023 09:04:41 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-5.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:04:41 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id A20B215F
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:04:40 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 9559C155
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:04:40 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:04:38 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] systemd-boot: upgrade 253.1 -> 253.3
Date: Mon, 10 Apr 2023 17:04:18 +0800
Message-ID: <1681117459-24898-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681117459-24898-1-git-send-email-wangmy@fujitsu.com>
References: <1681117459-24898-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:04:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179866

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/systemd/systemd-stable/blob/v253.3/NEWS

0025-systemctl-explicitly-cast-the-constants-to-uint64_t.patch
removed since it's included in 253.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...md-boot_253.1.bb => systemd-boot_253.3.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  3 +-
 ...citly-cast-the-constants-to-uint64_t.patch | 44 -------------------
 3 files changed, 1 insertion(+), 46 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_253.1.bb => systemd-boot_253.3.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0025-systemctl-explicitly-cast-the-constants-to-uint64_t.patch

diff --git a/meta/recipes-core/systemd/systemd-boot_253.1.bb b/meta/recipes-core/systemd/systemd-boot_253.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_253.1.bb
rename to meta/recipes-core/systemd/systemd-boot_253.3.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 14608f9abc..d50f2c9cba 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,11 +14,10 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "6c327d74aa0d350482e82a247d7018559699798d"
+SRCREV = "ed18c2ab79e8b94182d5dcf31d58457763f3e3e1"
 SRCBRANCH = "v253-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
            file://0026-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch \
-           file://0025-systemctl-explicitly-cast-the-constants-to-uint64_t.patch \
            "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/systemd/systemd/0025-systemctl-explicitly-cast-the-constants-to-uint64_t.patch b/meta/recipes-core/systemd/systemd/0025-systemctl-explicitly-cast-the-constants-to-uint64_t.patch
deleted file mode 100644
index d840de870f..0000000000
--- a/meta/recipes-core/systemd/systemd/0025-systemctl-explicitly-cast-the-constants-to-uint64_t.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From fad29ce1f5cc7b12bc13671d9ad80775771a67eb Mon Sep 17 00:00:00 2001
-From: Frantisek Sumsal <frantisek@sumsal.cz>
-Date: Fri, 3 Mar 2023 12:17:27 +0100
-Subject: [PATCH] systemctl: explicitly cast the constants to uint64_t
-
-Otherwise under certain conditions `va_arg()` might get garbage instead
-of the expected value, i.e.:
-
-$ sudo build-o0/systemctl disable asdfasfaf
-sd_bus_message_appendv: Got uint64_t: 0
-Failed to disable unit: Unit file asdfasfaf.service does not exist.
-
-$ sudo build-o1/systemctl disable asdfasfaf
-sd_bus_message_appendv: Got uint64_t: 7954875719681572864
-Failed to disable unit: Invalid argument
-
-(reproduced on an armv7hl machine)
-
-Resolves: #26568
-Follow-up to: bf1bea43f15
-Related issue: https://github.com/systemd/systemd/pull/14470#discussion_r362893735
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/c63bfd0884cf20e48befbee49d41f667660a8802]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/systemctl/systemctl-enable.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/systemctl/systemctl-enable.c b/src/systemctl/systemctl-enable.c
-index 86d9f602fa..f94a286122 100644
---- a/src/systemctl/systemctl-enable.c
-+++ b/src/systemctl/systemctl-enable.c
-@@ -211,7 +211,7 @@ int verb_enable(int argc, char *argv[], void *userdata) {
- 
-                 if (send_runtime) {
-                         if (streq(method, "DisableUnitFilesWithFlagsAndInstallInfo"))
--                                r = sd_bus_message_append(m, "t", arg_runtime ? UNIT_FILE_RUNTIME : 0);
-+                                r = sd_bus_message_append(m, "t", arg_runtime ? (uint64_t) UNIT_FILE_RUNTIME : UINT64_C(0));
-                         else
-                                 r = sd_bus_message_append(m, "b", arg_runtime);
-                         if (r < 0)
--- 
-2.39.2
-
-- 
2.34.1



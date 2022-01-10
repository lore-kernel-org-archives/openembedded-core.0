Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A48C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 14:05:36 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web09.32034.1641823535576314767
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 06:05:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=B6NTN0+5;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641823533; i=@fujitsu.com;
	bh=qeucLyyhS3RVarwM0I44Y/p8F1ISNOwuoaxTwHO0wYg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=B6NTN0+5h+vA/HSlyeWA/pXVRUi4oqBuNabYN4oFp37fGnpxqdtRzVrOy6bpxm8KW
	 f3fLXTmTCynNNMGKrwuT425TAJVjqYsZ5X7N+I8I4Vv2veRsJqGnhzW8Bj5bPmIos5
	 wRhJqvmyLdkoQXjuNpr7L2FWC1VuBnWQt8vo8sRW45g91WTEBbr6uwN+BBGp6XHAOK
	 3n0qgN2oK7vCRQGDMkxR8dIkZPsIBYr7VlIowtBqzXcIZQ38J6NDZq9mfe9VrqXFrI
	 dyCU1fyjJHAH/D+UVut8jc1HV/lWFih4ooL+mrRoTHwBG60YjkDzzoOze0bR5hX1qV
	 ayajwCCJIqwaw==
Received: from [100.115.2.51] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id BD/09-10124-D2D3CD16;
 Mon, 10 Jan 2022 14:05:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8MxSVfX9k6
  iwbd9KhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bbPXPZCo4KVxyZ3M7cwHhToIuRi0NI4DGj
  xMv+vUwQznkmibVf1zFDOCcYJbZsu8LYxcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCAsYSP3Z3gZWzCKhKzLlwmAnE5hVwkvj/5SYziC0hoCAx5eF7MJtTwFmi+9oCVhBbCK
  jm6c/XLBD1ghInZz5hgZgvIXHwxQuoXkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYBSchaR9FpL
  2BYxMqxitkooy0zNKchMzc3QNDQx0DQ1NdU11jUxN9RKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1
  iitzk3NS9PJSSzYxAoM4pZj1/w7G7r6feocYJTmYlER5nxjfSRTiS8pPqcxILM6ILyrNSS0+x
  CjDwaEkwZtgCZQTLEpNT61Iy8wBRhRMWoKDR0mEVwMkzVtckJhbnJkOkTrFqMux8/TiRcxCLH
  n5ealS4ry7rYGKBECKMkrz4EbAovsSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeApBVPJl
  5JXCbXgEdwQR0RDLHbZAjShIRUlINTMWMk6wiVgXO/qeqpr6k6urrvdFfVmrnXHGYliYSODPJ
  MHDZ1LQVHZ+KBDZfv+8649wzE2UJmYML5IwNt2wxdtv25ZFo9E92u7bzy5ofPNt990bkh5qPM
  zTM9j7Z75Lt+CiyvkLhem3x2pInm/YvnL7USctEdUuEzP6S5V5cC6U5lHd7rn2QpBsY8mmbup
  s9u/MvgZiQP5s3eJqKLtR0bE7V2fi6ZbWR/P7kqz+9j332jXzs6T/j768FJzv8/ZZIWs/doqa
  +2nTTM5cLuyRY+hTzm7qaQg/Ivz79TEZ/w8N0ZndjlV3FjQr7pSZOq518KNx1R0TX57qDjfJc
  Oxeb5+7e96ujfn8aA1tWiMDHGCWW4oxEQy3mouJEAFbdFcFpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-587.messagelabs.com!1641823533!5743!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16081 invoked from network); 10 Jan 2022 14:05:33 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Jan 2022 14:05:33 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1CDA110045E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 14:05:33 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 05F4C100452
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 14:05:33 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 10 Jan 2022 14:05:25 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] less: upgrade 598 -> 600
Date: Mon, 10 Jan 2022 22:05:04 +0800
Message-ID: <1641823505-62784-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641823505-62784-1-git-send-email-wangmy@fujitsu.com>
References: <1641823505-62784-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 14:05:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160359

License-Update: year updated to 2022.

Changelog:
==========
Add the --header option.
Add the --no-number-headers option.
Add the --status-line option.
Add the --redraw-on-quit option.
Add the --search-options option.
Add 'H' color type to set color of header lines.
Add #version conditional to lesskey.
Add += syntax to variable section in lesskey files.
Allow option name in -- command to end with '=' in addition to '\n'.
Add $HOME/.config to possible locations of lesskey file.
Add $XDG_STATE_HOME and $HOME/.local/state to possible locations of history file.
Don't read or write history file in secure mode.
Fix display of multibyte and double-width chars in prompt.
Fix ESC-BACKSPACE command when BACKSPACE key does not send 0x08.
Add more \k codes to lesskey format.
Fix bug when empty file is modified while viewing it.
Fix bug when parsing a malformed lesskey file.
Fix bug scrolling history when --incsearch is set.
Fix buffer overflow when invoking lessecho with more than 63 -m/-n options.
Fix bug restoring color at end of highlighted text.
Fix bug in parsing lesskey file.
Defer moving cursor to lower left in some more cases.
Suppress TAB filename expansion in some cases where it doesn't make sense.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/less/{less_598.bb => less_600.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/less/{less_598.bb => less_600.bb} (87%)

diff --git a/meta/recipes-extended/less/less_598.bb b/meta/recipes-extended/less/less_600.bb
similarity index 87%
rename from meta/recipes-extended/less/less_598.bb
rename to meta/recipes-extended/less/less_600.bb
index 574efff365..707870feeb 100644
--- a/meta/recipes-extended/less/less_598.bb
+++ b/meta/recipes-extended/less/less_600.bb
@@ -21,14 +21,14 @@ SECTION = "console/utils"
 
 LICENSE = "GPLv3+ | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://LICENSE;md5=ba01d0cab7f62f7f2204c7780ff6a87d \
+                    file://LICENSE;md5=38fc26d78ca8d284a2a5a4bbc263d29b \
                     "
 DEPENDS = "ncurses"
 
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[sha256sum] = "64e0eb24534ac70d15ff3a36c8853f7a48196aa230d2a104707fc4ff1a45e982"
+SRC_URI[sha256sum] = "6633d6aa2b3cc717afb2c205778c7c42c4620f63b1d682f3d12c98af0be74d20"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.25.1



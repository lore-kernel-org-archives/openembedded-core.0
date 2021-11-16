Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C0A0C433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 01:29:22 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.3943.1637026160851102106
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 17:29:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oczNeNO3;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637026158; i=@fujitsu.com;
	bh=aELiHkKtdgD71SfT/Nz53Vt4PhqdjJndcpggegfMjnE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oczNeNO3xUsUgEchBPQXxpdRnQX+kvGIGZikD8xMI5s1zXwbIMYiSo8AGaJ7vWb8q
	 MR3/Z8egEacP6zIy1/VfA4nRkOzM4JZOffVG6gIKVwJB+TOGaqxDrVTm0zNMu2CNhP
	 sBENKvv7Mn3LVetZZXjZzK+BgNPPr0tt94PzfUkouQ5nXA8z/SnV0WO0fMnXETdVdu
	 tDyfJxlGjJ0K/UhTd5/h52MWGnZH5tw41lorqaF+c+aN583kRWT2xEpwqfgf7MZ0v3
	 vHYQnBV8DwWybVq16ygoew8G/RaPloJODg5GcTopUjHCHZ51BdEsCxHEG+aznNhJvE
	 rbZ/dQd7X3Img==
Received: from [100.112.196.154] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 0A/4E-17294-D6903916;
 Tue, 16 Nov 2021 01:29:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORqJvLOTn
  RoOW8tMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvFg7XHWgtfKFcePb2NtYGyQ62Lk4hASeMwo
  sWzzYiYI5zyTxP2t29kgnBOMEnMurADKcHKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  ewgYWEBJ4nbZxhBwiwCqhKt+/awgNi8QOFJ8y6xg9gSAgoSUx6+ZwaxOQWcJR7u38IM0ioEVH
  NwbTREuaDEyZlPWCCmS0gcfPGCGaJVUWL25WYWCLtCYtasNiYIW03i6rlNzBMYBWchaZ+FpH0
  BI9MqRoukosz0jJLcxMwcXUMDA11DQyNdQ0sLXUNjA73EKt0kvdRS3fLU4hJdQ73E8mK94src
  5JwUvbzUkk2MwOBNKTjWtIPx5OsPeocYJTmYlER54xZNShTiS8pPqcxILM6ILyrNSS0+xCjDw
  aEkwavOOjlRSLAoNT21Ii0zBxhJMGkJDh4lEd4+NqA0b3FBYm5xZjpE6hSjLse7n4sXMQux5O
  XnpUqJ8ypxABUJgBRllObBjYBF9SVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxWIFN4MvN
  K4Da9AjqCCegI+3v9IEeUJCKkpBqYJn9q/+U1x/d2Q+1z7tjOvamHJJd9mWj5JEjs2/5Dsp82
  vWfRvH/P7XtzW+6VS0v/PPXWbg4PdmA+Ephjpb+4+HB5tOzZg7tSddYtbbgvVduw6F+8Wd3NW
  ed1udQ6JsdfSihOsjP7vvXZo7nLzy3SetwldFpkfZxCkXmeYlGo/Dtftgf9j2JWZMf21vye/d
  PqFefya6JPsozc71zO7d2R6avoJnn4ndaekh2xAg7pza8zJkR/7fu1+Z3L1ZO7LV18N3rs+RU
  784H9PNfMv5uclmvNTHmx7Wy44PenX52mK27W+Zz3fJJkiUHMm2K7b9+XHynr5Q2wY3HY2/Dx
  qg1fXRTvPEMBydz2wPjNv8NblViKMxINtZiLihMBcxbjYmUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-291.messagelabs.com!1637026157!452285!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4603 invoked from network); 16 Nov 2021 01:29:17 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Nov 2021 01:29:17 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id EF45E100235
	for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 01:29:16 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DEB7F100229
	for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 01:29:16 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 16 Nov 2021 01:28:57 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] systemd-boot: upgrade 249.5 -> 249.6
Date: Tue, 16 Nov 2021 09:28:42 +0800
Message-ID: <1637026122-80256-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637026122-80256-1-git-send-email-wangmy@fujitsu.com>
References: <1637026122-80256-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 01:29:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158319

0001-meson-use-partial_dependency-to-get-include-director.patch
removed since it is included in 249.6

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...md-boot_249.5.bb => systemd-boot_249.6.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 ...l_dependency-to-get-include-director.patch | 46 -------------------
 .../{systemd_249.5.bb => systemd_249.6.bb}    |  1 -
 4 files changed, 1 insertion(+), 48 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_249.5.bb => systemd-boot_249.6.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-meson-use-partial_dependency-to-get-include-director.patch
 rename meta/recipes-core/systemd/{systemd_249.5.bb => systemd_249.6.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd-boot_249.5.bb b/meta/recipes-core/systemd/systemd-boot_249.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_249.5.bb
rename to meta/recipes-core/systemd/systemd-boot_249.6.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 4e4cdd2e2f..f3ce32efc2 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "00b0393e65252bf631670604f58b844780b08c50"
+SRCREV = "deda69dad784f9c4367533555ff4d7bf6308c0ff"
 SRCBRANCH = "v249-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
 "
diff --git a/meta/recipes-core/systemd/systemd/0001-meson-use-partial_dependency-to-get-include-director.patch b/meta/recipes-core/systemd/systemd/0001-meson-use-partial_dependency-to-get-include-director.patch
deleted file mode 100644
index 51ee5d8623..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-meson-use-partial_dependency-to-get-include-director.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 260e871fda979f040c94d2011545e8122bed68ca Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 18 Oct 2021 10:13:07 +0200
-Subject: [PATCH] meson: use partial_dependency() to get include directory
-
-Getting the variable directly from pkg-config is prone to host
-contamination when building in sysroots as the
-compiler starts looking for the headers on the host in addition to
-the sysroot.
-
-Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/21027]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- meson.build | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index df53c6156d..38fb37dd75 100644
---- a/meson.build
-+++ b/meson.build
-@@ -2618,18 +2618,17 @@ endif
- 
- if conf.get('ENABLE_LOCALED') == 1
-         if conf.get('HAVE_XKBCOMMON') == 1
--                # logind will load libxkbcommon.so dynamically on its own
--                deps = [libdl]
--                extra_includes = [libxkbcommon.get_pkgconfig_variable('includedir')]
-+                # logind will load libxkbcommon.so dynamically on its own, but we still
-+                # need to specify where the headers are
-+                deps = [libdl, libxkbcommon.partial_dependency(compile_args: true)]
-         else
-                 deps = []
--                extra_includes = []
-         endif
- 
-         executable(
-                 'systemd-localed',
-                 systemd_localed_sources,
--                include_directories : includes + extra_includes,
-+                include_directories : includes,
-                 link_with : [libshared],
-                 dependencies : deps,
-                 install_rpath : rootlibexecdir,
--- 
-2.20.1
-
diff --git a/meta/recipes-core/systemd/systemd_249.5.bb b/meta/recipes-core/systemd/systemd_249.6.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_249.5.bb
rename to meta/recipes-core/systemd/systemd_249.6.bb
index 8bdc0ca028..242a53d22a 100644
--- a/meta/recipes-core/systemd/systemd_249.5.bb
+++ b/meta/recipes-core/systemd/systemd_249.6.bb
@@ -25,7 +25,6 @@ SRC_URI += "file://touchscreen.rules \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
            file://0001-test-parse-argument-Include-signal.h.patch \
-           file://0001-meson-use-partial_dependency-to-get-include-director.patch \
            "
 
 # patches needed by musl
-- 
2.25.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2564FC433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 01:17:27 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web12.3750.1634606245365725910
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 18:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hrS3WBAm;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634606243; i=@fujitsu.com;
	bh=nFHMdxUTzIoIZL+FbeVjFLjEV7LPjJWsha/FvVqbtZo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=hrS3WBAmW5NfeKqE6HHciY9VMRRGJrg0iP8idgs26Xyiw1YRgBnFpXBrDdrAfODJx
	 CQs1SIChSyHF6hUkAJUFkbHzfuqRgIKXWlQi6qJDGWtbdUoNePQ+3m2uQe87j2XE5d
	 54FZxgohHX2OKK+Hqd93GcAdVSR4m4LAnD7DawV12MU+MSV+CShk9H2jwkGO+HVaWa
	 r3TvhIordwfmqvwyXqSkLT3fB59VIzCu7O08D93edyq7VKHZW8U9oKGV0w5cd8KWQ8
	 GvmHc7dgkZCTtggz/kztd6Fykh93+qYC+6LozO0IfiS3M0YjeeQ0qoUeuFgNTX2L8V
	 hNDqkRmq8OnYA==
Received: from [100.113.0.18] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 8C/3C-09980-2AC1E616;
 Tue, 19 Oct 2021 01:17:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsViZ8MxVXeRTF6
  iQXO/gMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnH7xG22gkWSFXMmfmBuYPwr2sXIxSEkMItJ
  Ytvky8wQzglGiXOrr7B2MXJysAmoSUy/dQPI5uAQEdCTuPpPFCTMLKAi8eJ3DzuILSxgJbH12
  F4WEJtFQFXixLarbCA2r4CzxOX2iWBjJAQUJKY8fM8MEReUODnzCQvEHAmJgy9eMEPUKErMvt
  zMAmFXSMya1cY0gZF3FpKWWUhaFjAyrWK0TCrKTM8oyU3MzNE1NDDQNTQ01jXUNTIy00us0k3
  USy3VTU7NKylKBMrqJZYX6xVX5ibnpOjlpZZsYgQGWEoh46MdjKdff9A7xCjJwaQkyutwMTdR
  iC8pP6UyI7E4I76oNCe1+BCjDAeHkgSvBkdeopBgUWp6akVaZg4w2GHSEhw8SiK8IVJAad7ig
  sTc4sx0iNQpRnuON2uXLGLmaLt3F0jOXHBwNTPH/fZDq5mFWPLy81KlxHltpYHaBEDaMkrz4I
  bCovMSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeSJDlPJl5JXC7XwGdxQR01lXnHJCzShI
  RUlINTK51vEfZRO7UlEc8Xur3dOPJSSlyubOPNE9eaLxdNeTdM+3JE01fBXzeZNbMLuBY/7lt
  4W7F+S+4lj+M8A0RuHj+6OF9ZpP+nZ281+Ktzcn1KY/ft/i63dsj5y5wf4HIJ6fPLIY9pTFFV
  9QfTS7rieY58vRo3uIKJg/xHKVG+y1NrasVjrtqWJgef5/Q/DurbtcVqSkTXeomly/XEthm++
  yRtOja+ftWhP8It+mWbbWu01lacFpzeoSk+o/nKhvsH+/71rnfpeTUF+/0A0K6ofczX7h4TF/
  v5qjanphsVu0qv4ldbRrDuuDyy3FVd85asb2UM1u75FtHoQSD3DeV/QtLOgo9N9etOfO6tHTr
  MiWW4oxEQy3mouJEAFsSuHJJAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-226.messagelabs.com!1634606241!14945!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31393 invoked from network); 19 Oct 2021 01:17:22 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-11.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Oct 2021 01:17:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19J1HGbd009502
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 02:17:21 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Tue, 19 Oct 2021 02:17:15 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libgit2: upgrade 1.2.0 -> 1.3.0
Date: Tue, 19 Oct 2021 09:16:29 +0800
Message-ID: <1634606189-130388-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 01:17:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157098

New Features
Support custom git extensions by @ethomson in #6031
Introduce git_email_create; deprecate git_diff_format_email by @ethomson in #6061
Deprecated APIs
git_oidarray_free is deprecated; callers should use git_oidarray_dispose
Bug fixes
remote: Mark git_remote_name_is_valid as GIT_EXTERN by @lhchavez in #6032
Fix config parsing for multiline with multiple quoted comment chars by @basile-henry in #6043
indexer: Avoid one mmap(2)/munmap(2) pair per git_indexer_append call by @lhchavez in #6039
merge: Check file mode when resolving renames by @ccstolley in #6060
Allow proxy options when connecting with a detached remote. by @lrm29 in #6058
win32: allow empty environment variables by @ethomson in #6063
Fixes for deprecated APIs by @ethomson in #6066
filter: use a git_oid in filter options, not a pointer by @ethomson in #6067
diff: update GIT_DIFF_IGNORE_BLANK_LINES by @ethomson in #6068
Attribute lookups are always on relative paths by @ethomson in #6073
Handle long paths when querying attributes by @ethomson in #6075
Code cleanups
notes: use a buffer internally by @ethomson in #6047
Fix coding style for pointer by @punkymaniac in #6045
Use typeof GNUC keyword for ISO C compatibility by @duncanthomson in #6041
Discover libssh2 without pkg-config by @stac47 in #6053
Longpath filter bug by @lrm29 in #6055
Add test to ensure empty proxy env behaves like unset env by @sathieu in #6052
Stdint header condition has been reverted. by @lolgear in #6020
buf: common_prefix takes a string array by @ethomson in #6077
oidarray: introduce git_oidarray_dispose by @ethomson in #6076
examples: Free the git_config and git_config_entry after use by @257 in #6071
CI Improvements
ci: pull libssh2 from www.libssh2.org by @ethomson in #6064
Documentation changes
Update README.md by @shijinglu in #6050
New Contributors
@basile-henry made their first contribution in #6043
@duncanthomson made their first contribution in #6041
@stac47 made their first contribution in #6053
@shijinglu made their first contribution in #6050
@ccstolley made their first contribution in #6060
@sathieu made their first contribution in #6052
@257 made their first contribution in #6071

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libgit2/{libgit2_1.2.0.bb => libgit2_1.3.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgit2/{libgit2_1.2.0.bb => libgit2_1.3.0.bb} (80%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.2.0.bb b/meta/recipes-support/libgit2/libgit2_1.3.0.bb
similarity index 80%
rename from meta/recipes-support/libgit2/libgit2_1.2.0.bb
rename to meta/recipes-support/libgit2/libgit2_1.3.0.bb
index 6df42e473f..580fa41c21 100644
--- a/meta/recipes-support/libgit2/libgit2_1.2.0.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.3.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73fa96e40ce64f79bab087c7e1deeacd"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main"
-SRCREV = "4fd32be01c79a5c003bb47674ac1d76d948518b7"
+SRC_URI = "git://github.com/libgit2/libgit2.git;nobranch=1"
+SRCREV = "b7bad55e4bb0a285b073ba5e02b01d3f522fc95d"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



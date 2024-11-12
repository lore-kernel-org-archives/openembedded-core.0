Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23891D3ABFF
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:36 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.82733.1731403534088361604
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rPY9cTIJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403534; x=1762939534;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vVq00wUtyLg7XNgn5HIVEtt8daOKXvhgVViiwq2kIdY=;
  b=rPY9cTIJLVNcBYZEDjw7iLuDnt0W+ABH/lqG4qnLPzbMTj17PquDQxGv
   2oVKQRFCU8TZQcFedo0HU74//MJKdteOAIwOc2zo34D0Gi6Obz92HUqE4
   Eq2Ch9qS+UP/4gUYk6vEnnlIoDYZHOJz1uCnak/1BIRRsvyH/KkwQ+I/s
   GE3JfIqYYD3U9odGqIjz4dcOfbF22UjDNltW25ArR3afVt5TnS9PnkBhF
   +ZosmoYPb8yIY8VeuiyOS11/eqiPzG9aC+BKU6j8oryv9QXtz7MgNImaL
   UNSbj3VLdBUHYS6WXQ76a7lkw86ZQiV5cZf+gkRvVkRIPmtN4/macCj6k
   g==;
X-CSE-ConnectionGUID: OmYpDoMbQJ6MqQs1nJEDJg==
X-CSE-MsgGUID: Xdow70hfSAil5h4uEpqOuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="159037376"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="159037376"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:32 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E9756D9C14
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7CBE1D5062
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 01C8B6BCC2
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A3C421A000A;
	Tue, 12 Nov 2024 17:25:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 25/47] mpg123: upgrade 1.32.7 -> 1.32.9
Date: Tue, 12 Nov 2024 17:24:21 +0800
Message-Id: <1731403483-21399-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--0.956900-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrADzQlKwHB/viFxcREnURUnTv
	92h/oRdlKW8yEBhe8XzM+N1efw7w39nrZ77/nWVq5fkjIw2ui0/WN3XQ/7wsT5Bz1ZAU7t9TZVL
	+FnzEdk6q/r7ujTTNhyJVubrNtbbA7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5BEGD
	rWRIrgOIGQRIwjTl3iuFf+VRAZx7DsZfRzVSVqXDCj6xe3SuezHNKOqzYigYrVtKZKT0dQ2uJz0
	/I2b9TR4vM1YF6AJbbCCfuIMF6xLSdET58jp62S3LfU9R3O83UoYYKWJzBQBjABsITv78OhwW8v
	IcTCNyRXBc/9QwieJMdLexignudRyqXE0VngXWw3sGuR5UT+nSawBio1VZGbS7+RMq/2CK6rA4c
	7UV2fQpvi2PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207013

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-- enable 64 bit offset path for MSVCRT and avoid warnings about
   MS's game about POSIX API with and without underscores
-- Increase the library patchlevel, as was forgotten on previous
   release.
-- Add sections to assembly to support PAC/BTI code
   for aarch64 (-mbranch-protection variants)
-- Prevent premature application of header info into decoding structure,
   at worst having triggered out-of-bounds writes of decoded PCM data
- out123: Show --quiet in --longhelp.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mpg123/{mpg123_1.32.7.bb => mpg123_1.32.9.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.32.7.bb => mpg123_1.32.9.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.32.7.bb b/meta/recipes-multimedia/mpg123/mpg123_1.32.9.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.32.7.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.32.9.bb
index 5a9a2a0943..54006e8c22 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.32.7.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.32.9.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "3c8919243707951cac0e3c39bbf28653bcaffc43c98ff16801a27350db8f0f21"
+SRC_URI[sha256sum] = "03b61e4004e960bacf2acdada03ed94d376e6aab27a601447bd4908d8407b291"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1



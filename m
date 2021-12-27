Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F86C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 14:19:09 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.26645.1640614740691074774
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 06:19:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ts+pwwrz;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640614739; i=@fujitsu.com;
	bh=yR9OZ2s3DCqpVssDE0s4ytJe23cIEbfEpfmytPtCrlY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Ts+pwwrz7g932eAUAvRZyMcpvr3YMlzx5tKpWdF8InqRmrog177+p6BC2G/Iqnb7k
	 NabuLu0Qk9N9pf5g+rNCGzXC9wAGdx/IYJ1k9PHzqiVU4MvK9WjJyNJ4JjJipdaXzy
	 Zh/tOzCm/yMqGiRo2i1BAUxjzlBKQQTwUITalCbpA8p88WnIZ6Fvb12Hs3xPn5rZV0
	 CwxRTgUOfr7Lra+DHLziQNUW+JGCKK9sV6vvQNMwsUfc7GQLvzIXAKFUuypLMfeCHL
	 lcBjqC/n17hcYS5nYx2hbRzbRipQrpNf1fzrpWm3IuioUMUJ0y32gL0GY5UjsrBLd9
	 Ly0ZLQMyPgg0A==
Received: from [100.115.4.164] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id BA/68-10124-25BC9C16;
 Mon, 27 Dec 2021 14:18:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI0Q06fTL
  RYN0SBYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP95XeMBd28FVeamhkbGG9ydzFycQgJzGCS
  2LHqEguEs4dRYtr0GUAOJwebgK7Eucdr2bsYOThEBPQkrv4TBQkLCzhJTDl9hQ3EZhFQlfjz+
  CojiM0r4C6xYeMRMFtCQEFiysP3zBBxQYmTM5+AjWQWkJA4+OIFM8hICQFFidnT5SHKKyReH7
  7EPIGRZxaSjllIOhYwMq1itEoqykzPKMlNzMzRNTQw0DU0NNU10TUyttRLrNJN1Est1S1PLS7
  RNdRLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMpJRilvc7GJv6fuodYpTkYFIS5f0+4WSiEF9Sfkpl
  RmJxRnxRaU5q8SFGGQ4OJQnehuNAOcGi1PTUirTMHGBQw6QlOHiURHinHgNK8xYXJOYWZ6ZDp
  E4xKkqJ81afBEoIgCQySvPg2mCRdIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG8jyBSezL
  wSuOmvgBYzAS2e6XAcZHFJIkJKqoHJ4uCZFIOHQuXnDukYLnNsuje54TDPwc74iQFh66yVBc6
  aqMgeWn3p/Z7iwzKPTZfd2RpotvvE5YaDWZHu2c/rMjsf2k/e9PvttYB1T2a1XLVa+n65wdf6
  3vS7naniTOWM560eLZLcuatY1uJ2kBTH/KVrnpTm93geT36RpG6ad37yljlmzpXxJ08npQjIO
  1w5fPXmjuVHHs0r33NPR/B/4HK/jBmFVmfSeFQeJAe8FDL3eS7M0HgrKD7p4RrrKaJ2wl1hhh
  X5DSZV/3apX2TL27B4SWp5otbD0gMaKksbd6mkTpItKjZd2n38+ocUWz3f3zIiey/8X1s9OT9
  1xu1Pm7zm798Zr+qQND9/l/ghJZbijERDLeai4kQAcg8QHx8DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-591.messagelabs.com!1640614738!340442!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21521 invoked from network); 27 Dec 2021 14:18:58 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-3.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Dec 2021 14:18:58 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1BREIq7O032397
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Dec 2021 14:18:58 GMT
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 27 Dec 2021 14:18:51 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libmicrohttpd: upgrade 0.9.73 -> 0.9.75
Date: Tue, 28 Dec 2021 07:18:44 +0800
Message-ID: <1640647124-3588-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Dec 2021 14:19:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160027

Changelog:
=========
 Fixed Makefile warning on MinGW.
 Fixed compiler warning on MinGW.
 Fixed "configure" portability (for NetBSD).
 MSVC project cosmetics.
 MSVC fixed project to fix linker warning.
 Fixed compiler warning on some platforms.
 Further improved test_client_put_stop to get stable results on all
 platforms.
 Added workaround for platforms (like OpenBSD) where system monotonic clocks
 may jump forward and back.
 Added more checks in test_large_put, increased timeout (was too small for
 this test). -EG

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{libmicrohttpd_0.9.73.bb => libmicrohttpd_0.9.75.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.73.bb => libmicrohttpd_0.9.75.bb} (87%)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb
similarity index 87%
rename from meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb
rename to meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb
index 0b5901bc74..494ccd2ee9 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb
@@ -7,8 +7,7 @@ SECTION = "net"
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "2b15949b1633e4fa487e08cdcc97f0e3"
-SRC_URI[sha256sum] = "a37b2f1b88fd1bfe74109586be463a434d34e773530fc2a74364cfcf734c032e"
+SRC_URI[sha256sum] = "9278907a6f571b391aab9644fd646a5108ed97311ec66f6359cebbedb0a4e3bb"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.25.1



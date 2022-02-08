Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B4BC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 08:27:07 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.8679.1644308825755969163
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 00:27:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rftt51OX;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644308823; i=@fujitsu.com;
	bh=UBmcpIgH+DWsEC7bjb5OGZMPXn7xjLB1JIl7PLLQ7JM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rftt51OXT8PybG8vW61SdfUMzrsOOyKDjqHugxRS9tItmvLXz9NFg4b/X3Y/aPHC0
	 lRFJ2eDl+MXjllsnIjF+asDT/vUQxTcFt4NuOLxAfm2f0YLg1WszKvOgXR19daEZEM
	 wqr06aFl+PTRI/9l8lwPHp2uUo9FGPLD/a22Eos/Wku0EISEShZgbJRHvzhmO64oUF
	 MbV74Ypnt0azNPPF5w5LZRbwWHvS+ubIj4jhFeSyzEMdJzKZGVz7fSmqxqMCWvLtl9
	 BXMZvn+GQEel0G7PfCYa+QGxd/OEX8nePN8OIO9xdJA2mXmRSk9e8TgMymM5/oOTkN
	 UC36nHnP1jzGQ==
Received: from [100.115.2.51] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id 91/01-21232-75922026;
 Tue, 08 Feb 2022 08:27:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORqBuuyZR
  kMH0tj8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnFgj0DBV96K5afeMDUwXuLpYuTkEBJ4zCix
  4JkQhH2eSWLa0vIuRi4g+zijxNP2h+wgCTYBNYnpt26wdjFycIgI6Elc/ScKEmYWUJF48bsHr
  ERYwE7iwf8LzCA2C1B81717TCA2r4CjxNpTP1hBbAkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8
  wQNYoSsy83s0DYFRKzZrUxQdhqElfPbWKewMg/C0n7LCTtCxiZVjFaJhVlpmeU5CZm5ugaGhj
  oGhqa6hrrGlroJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEBmNKMbPQDsb1
  fT/1DjFKcjApifImqTIlCfEl5adUZiQWZ8QXleakFh9ilOHgUJLgPSMOlBMsSk1PrUjLzAFGB
  kxagoNHSYT3mwZQmre4IDG3ODMdInWKUVFKnFcYJCEAksgozYNrg0XjJUZZKWFeRgYGBiGegt
  Si3MwSVPlXjOIcjErCEFN4MvNK4Ka/AlrMBLT466J/iUCLSxIRUlINTJ0Prkp3PviU/il2RlP
  btz2iUds9tQWdXz3dybx95S59bwN5wYtLHv61XlHWGM3nc0985Zd5DSdPcki/qz9WlhDRZ8c3
  2/Q/i1LIuuDZCpIJQT/Md6UffzgzpYqh5vqnJ6Lz100I/rfX57SR0e9Coz3Bra0nFxQ+6NwQ2
  Lggc+EJzRtCRXUzD8zUmHJ9ieGFBdnOyy50qy1f997Q2OyP616t+9vLc9L6H9zLe2et/cVGvF
  f3tuJX5c/XKm+9spokuurg1ez1rDONfFovvpjCsOrmSZHYp/uqGHYWshZ4lwUtPllY+/ncfZP
  DOg8mnvi/QLtiywTRwqQqrdxA/6lXA676X2FrrH4ZxTXJweG23wMlluKMREMt5qLiRADaCKWJ
  QQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-585.messagelabs.com!1644308822!1282!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23879 invoked from network); 8 Feb 2022 08:27:03 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 08:27:03 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B18F9100193
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 08:27:02 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A52F4100180
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 08:27:02 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 08:26:40 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libxcrypt: upgrade 4.4.27 -> 4.4.28
Date: Tue, 8 Feb 2022 16:26:32 +0800
Message-ID: <1644308794-5337-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 08:27:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161483

Changelog:
=========
Add glibc-on-or1k (OpenRISC 1000) entry to libcrypt.minver.
This was added in GNU libc 2.35.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libxcrypt-compat_4.4.27.bb => libxcrypt-compat_4.4.28.bb}  | 0
 meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
 .../libxcrypt/{libxcrypt_4.4.27.bb => libxcrypt_4.4.28.bb}      | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.27.bb => libxcrypt-compat_4.4.28.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.27.bb => libxcrypt_4.4.28.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.27.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.28.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.27.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.28.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 725965e535..58d4c56ddf 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https"
-SRCREV = "814e715dd8580ff00344112d7d8383a6a5a5b83d"
+SRCREV = "50cf2b6dd4fdf04309445f2eec8de7051d953abf"
 SRCBRANCH ?= "develop"
 
 SRC_URI += "file://fix_cflags_handling.patch"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.27.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.27.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb
-- 
2.25.1



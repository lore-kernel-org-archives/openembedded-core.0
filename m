Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D798AC4332F
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 15:03:07 +0000 (UTC)
Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com
 [195.245.230.83])
 by mx.groups.io with SMTP id smtpd.web09.13248.1636470186124385772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 07:03:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hFLeFYfA;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.83,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636470183; i=@fujitsu.com;
	bh=nxeTCW3zexcFe1oqNuuKGjMVquh1nnB2/hCgDuGIpFg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hFLeFYfAk23QcmCVX64DIOm9d1ik0X/LVfvJ3gkPb8Ez7gkPe+7yBiWg8T4gLbsNl
	 6bGr/EWtIINIvGaaP1sveKYEib+5eZmAkSg5JE9N1UqIAw0EOCSOKs9Sn5b1lkLAvt
	 e/NsePhCK5pR1IiyC33yhjqTdFZ89mI0nt2IA0tycbl2SHIfidwGnFWZ6CqsZaeVqf
	 9Or6tWI5B8KmhyKAjcwf/TF96TAtu2Y5dj/XswTiFwrkmXET8/u/+rOD+uHv9y3mqb
	 v0WYVd2N+5InUSiAEFg/SnFPPSoVk+rZUYpXSx+W4ANWRyRqX9JrUMo7NEkuIaSjtf
	 UkDBltgQTbPkQ==
Received: from [100.112.197.16] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 64/21-09147-7AD8A816;
 Tue, 09 Nov 2021 15:03:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8MxVXd5b1e
  iwb8mHos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePfxfdMBf/4Kh6fn8bWwNjJ28XIySEkMJ1J
  4tIk5S5GLiD7OKPEjkOXWUASbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHidw87iC0sYCMxZ
  88NsHIWoPjp0z2MIOW8Ak4S6z7GgYQlBBQkpjx8zwxicwo4S5zve8cMsdZJ4tS+W2A2r4CgxM
  mZT1ggxktIHHzxghmiV1Fi9uVmFgi7QmLWrDamCYz8s5C0zELSsoCRaRWjeVJRZnpGSW5iZo6
  uoYGBrqGhka6hpZmumYleYpVukl5qqW55anGJrqFeYnmxXnFlbnJOil5easkmRmAgphQccdjB
  eP/1B71DjJIcTEqivP+6uhKF+JLyUyozEosz4otKc1KLDzHKcHAoSfBuAckJFqWmp1akZeYAo
  wImLcHBoyTCK9YBlOYtLkjMLc5Mh0idYtTlePdz8SJmIZa8/LxUKXHe/nqgIgGQoozSPLgRsA
  i9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYd0MP0BSezLwSuE2vgI5gAjri4Jd2kCNKEhF
  SUg1MtlH/WKOFbe9+uXSnQDEhe/OiGxrmcw0TF/Jfd8xTOS9y7sbZN9tNBeYu0fTZ/jx9TVFF
  d2y1gHef2U7GTQrnm/5s5zb4VHOTOen2N81mjSznH9dTv1nOXRp6Jmt3+429V5Q+VdzmlBRbl
  FJcvTlx46Gkko9bp1w9Hhf80UZx084ZF92MzTkC/DiSMl72BhzJKE9K5VY69Ofjp7cNhQ1JmS
  wOS/46ffFZNzNqfauhpFeo6hXBz0vzGw42LBHSZ1PWehdeyv2/6tXSvQt+My+eq5ApUve9UYZ
  dv/dx2tP9857LbFh7/8jsd796zDIqvuzao9FlyXXEYuvLDwxT8/fwxD4qkJ/c6/uvkZFLZkaX
  EktxRqKhFnNRcSIApG8Kk0sDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-285.messagelabs.com!1636470182!10709!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17621 invoked from network); 9 Nov 2021 15:03:03 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-5.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Nov 2021 15:03:03 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1A9F2uOE010951
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Nov 2021 15:03:02 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 9 Nov 2021 15:03:00 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] iso-codes: upgrade 4.7.0 -> 4.8.0
Date: Tue, 9 Nov 2021 23:02:43 +0800
Message-ID: <1636470164-60899-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636470164-60899-1-git-send-email-wangmy@fujitsu.com>
References: <1636470164-60899-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 15:03:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158050

- ISO 3166-1: Add flag emoji to countries. Thanks to Pander
  for the suggestion. Fixes #19
- ISO 639-5: New translation for Chinese (Simplified)

- ISO 3166-2: Major update of data.
  Thanks to the script of Kevin Kaiser, which enables
  the download of ISO pages and parses the data.
  Fixes #15, #16, #27
- Rename ChangeLog.md to CHANGELOG.md and follow the suggestions
  from [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
- Move all CHANGELOG entries from versions before 4.0 to an
  archive file (CHANGELOG-PRE-4.0.md) in order to reduce the
  massive size of this CHANGELOG.
- Translation updates for ISO 3166-1
- Translation updates for ISO 3166-2
- Translation updates for ISO 639-2
- Translation updates for ISO 639-3
- Translation updates for ISO 639-5
- Translation updates for ISO 15924

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iso-codes/{iso-codes_4.7.0.bb => iso-codes_4.8.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.7.0.bb => iso-codes_4.8.0.bb} (94%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.7.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.8.0.bb
similarity index 94%
rename from meta/recipes-support/iso-codes/iso-codes_4.7.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.8.0.bb
index 46988a7e80..2f3f589e7c 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.7.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.8.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
-SRCREV = "59767ed869f3952575f7d0f639a290a4c4b315e5"
+SRCREV = "5d0a5515f26b3858e27939c8f9a732d8bd4271ab"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.25.1



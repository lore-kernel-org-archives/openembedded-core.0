Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC089C433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 15:03:28 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web12.13272.1636470207462848950
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 07:03:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oo/IvO8d;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636470205; i=@fujitsu.com;
	bh=adMPcJhqWaX8ihw+fdhNk8S3L5sh+PDSwPbC3i90/qQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oo/IvO8d+B6PMHohFfugSHOVfvuWjI/0z7yiU5rbmt9C/6Ntw71pfKP353tD2+mCh
	 qBuD2jwrB42ZpSmTkA0svGGRhbLfMJE5HwT7OOvL3Woeu9jbR/aTVPhSI0Zzq9O/UL
	 rBVm3J3hEsVdgYhyG/j31AkeHRbfP7YJRj9QDDyPmuMfflSUkTfPs8beartDWbRYk9
	 /X920WHGEOBq+Jv+ucNbc5Em3+ZOxCVH8YfYNGYk06g0FkbEBUVVpMa4X6FYSGIcNn
	 INP6kGlJtOdrPZPYzWexVEfbKgHFW/mX7/MRkSwv4G7fr3tRswNbWR/BWj+ik6jjbR
	 NLwnaDDEGPi5A==
Received: from [100.112.195.167] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id EE/84-11077-DBD8A816;
 Tue, 09 Nov 2021 15:03:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSXdvb1e
  iwffb4hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aPmUvYCuaxVxw5uo+lgfEIWxcjF4eQwGNG
  ie+33rFAOOeZJPo2/mSEcI4zSrycvZupi5GTg01ATWL6rRusXYwcHCICehJX/4mChJkFVCRe/
  O5hB7GFBYwk/ky9A2azAMXvzrjGBmLzCjhJdE79BjZGQkBBYsrD98wgNqeAs8T5vndgthBQza
  l9t5gh6gUlTs58wgIxX0Li4IsXzBC9ihKzLzezQNgVErNmtUHNVJO4em4T8wRGwVlI2mchaV/
  AyLSK0TypKDM9oyQ3MTNH19DAQNfQ0EjX0NJU19hEL7FKN1EvtVS3PLW4RNdQL7G8WK+4Mjc5
  J0UvL7VkEyMwfFMKDivtYHz3+oPeIUZJDiYlUd5/XV2JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR4t4DkBItS01Mr0jJzgLEEk5bg4FES4RXrAErzFhck5hZnpkOkTjEqSonz9tcDJQRAEhmleX
  BtsPi9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYd0MP0BSezLwSuOmvgBYzAS0++KUdZHF
  JIkJKqoGJb4lZ4evb7/w2mTKE3Pz/5ROjxgWr206rHi8+vWVO2/R5fGFH7y8IqRFT37mZ9YS0
  WMeraIfSs0d67Q0vTWy+wLs48b7iC5uLO0usPmodm3nAZOPNDdftgpeFr/s2fT9DV7HAxvBEz
  2iBfytnRH7LyTD7zXj057nr675fOmCZu1LgRo531c+ZPZKimh4GU6rf8LVrbUjjb/dOPnOkuT
  iy1OTCwellLAZpdow9RfPn2zEu9IuR8RPK+7Z570T+rywTzzV8mu2etum49NN62T6GxJYrBS3
  cnbfSrgqobK4U/C/nEGV6+fPF8hs/Nrq1f96jk8FmWCnPoRAX7XH4cW2mv+r/t99zblf95jqw
  eIW5EktxRqKhFnNRcSIAuohGi1oDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-267.messagelabs.com!1636470205!319532!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28500 invoked from network); 9 Nov 2021 15:03:25 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Nov 2021 15:03:25 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D2778100465
	for <openembedded-core@lists.openembedded.org>;
 Tue,  9 Nov 2021 15:03:24 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C6257100441
	for <openembedded-core@lists.openembedded.org>;
 Tue,  9 Nov 2021 15:03:24 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 9 Nov 2021 15:03:03 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] iw: upgrade 5.9 -> 5.16
Date: Tue, 9 Nov 2021 23:02:44 +0800
Message-ID: <1636470164-60899-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636470164-60899-1-git-send-email-wangmy@fujitsu.com>
References: <1636470164-60899-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 15:03:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158052

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-connectivity/iw/{iw_5.9.bb => iw_5.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iw/{iw_5.9.bb => iw_5.16.bb} (90%)

diff --git a/meta/recipes-connectivity/iw/iw_5.9.bb b/meta/recipes-connectivity/iw/iw_5.16.bb
similarity index 90%
rename from meta/recipes-connectivity/iw/iw_5.9.bb
rename to meta/recipes-connectivity/iw/iw_5.16.bb
index 3d1e1c7e79..cf176a349f 100644
--- a/meta/recipes-connectivity/iw/iw_5.9.bb
+++ b/meta/recipes-connectivity/iw/iw_5.16.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://separate-objdir.patch \
 "
 
-SRC_URI[sha256sum] = "6e7d3c9f8b4ee68e412f20fe229c9854c2dba383e3e650ce6af8eb8dbd12efc3"
+SRC_URI[sha256sum] = "9c91f2560b258d9660e656ad37fa5bd100ac255865dcfb26076a576b10d8f3a7"
 
 inherit pkgconfig
 
-- 
2.25.1



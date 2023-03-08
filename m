Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E769DC678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 01:40:36 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.12597.1678239635019509079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 17:40:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oVyGJ4bK;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678239633; i=@fujitsu.com;
	bh=Tqm/U6iyqWMADPt1PS7Ek8+ckuD5Fo8tOz7ub/4PpE4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=oVyGJ4bKF3WfpzGeDvBnm77l9JFyjcqPYxcFgcCO1ruW97EdpxH0Zdtvs4IMzabpm
	 /SSea1lRHf/9pwUBAspP8HM/1Xo9iOXaQyrg93QNrO/UOAe6ev2f3cJxHBWm4bogxc
	 U5GXeJHkGNBLQSEQyS0Suq4owVQNSPS/AgTnJoruoVIN6LwgWmnR6rqPqvhxyQp/Ls
	 Qw/qh//vr6VNsYPJIpNUIHtYACWv0Q12SPKjQnH8LBYnApctAr8czww1igMrpF1/YC
	 ABCCF9ysdHlMoDmN7vhMima8e/Rc0knfpiy6BdgElT+KdVfqmNsSTyj2RYpCaWNGcC
	 1u1z35lKtXDJQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8ORpDvhOXu
  KwdsvvBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aJA72sBR2cFXM/dzA1MDZzdDFycQgJPGCU
  mHBmOjOEc4VJ4kXTCVYIZw+jxNwb/WxdjJwcbAJSEjfu/weyOThEBPQkrv4TBQkzC6hIvPjdw
  w5iCwuESEybexWsnAUofv3QXrA4r4CTxNJJUxlBbAkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8
  wQNYoSsy83s0DYlRKtH35B2WoSV89tYp7AyD8LSfssJO0LGJlWMZoWpxaVpRbpmuklFWWmZ5T
  kJmbm6CVW6SbqpZbqlqcWl+ga6iWWF+ulFhfrFVfmJuek6OWllmxiBIZiSjHDjR2Mc/r+6h1i
  lORgUhLl3XeEPUWILyk/pTIjsTgjvqg0J7X4EKMMB4eSBK/PQ6CcYFFqempFWmYOMC5g0hIcP
  EoivJtBWnmLCxJzizPTIVKnGBWlxHk3PwVKCIAkMkrz4NpgsXiJUVZKmJeRgYFBiKcgtSg3sw
  RV/hWjOAejkjCvwn2gKTyZeSVw018BLWYCWnxhPwvI4pJEhJRUA5PEpt+d70XZDx6dXhK5mXe
  rRfweUa7zRU3Sk364f3JPONG70jv9kqWI8DfTI3Vi6z76f/eXvXfn7L2cuVU2fxJLjgtGzaj7
  zbpZgW2R/uaUUqYXZ1sVHtbs+5cic2efzbfzR/I3LJ1jde6prZFNXVfBSa7JIdmLtm2afnvLo
  ddzdqkIP2z837muZ21lgUqm/Da7XtEPi2dm8e7yzTvP+NGwlGXzTOYDHBVVO+/NL9/d+N6ij+
  PfjaIY7boC7yfMS14YGTebT9ku/dxx6RQu53Wp1sclO5fdW6ge0bXC2Fnt/A/BmF3frvGfFYr
  5ej/t+2OPz+2828oiJnX+lJtgcPehtew8zZP/XXd0LNpb5HJFiaU4I9FQi7moOBEAK1k9P0AD
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-585.messagelabs.com!1678239632!413161!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29403 invoked from network); 8 Mar 2023 01:40:32 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-15.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Mar 2023 01:40:32 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id D0BCD1AF
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Mar 2023 01:40:31 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id C41851AD
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Mar 2023 01:40:31 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Mar 2023 01:40:30 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH V2 1/5] dhcpcd: Fix install conflict when enable multilib.
Date: Wed, 8 Mar 2023 09:40:15 +0800
Message-ID: <1678239619-21210-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 01:40:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178147

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
   file /usr/share/man/man8/dhcpcd.8 conflicts between attempted installs of dhcpcd-doc-9.4.1-r0.cortexa57 and lib32-dhcpcd-doc-9.4.1-r0.armv7ahf_neon

The differences between the two files are as follows:
@@ -821,7 +821,7 @@
 If you always use the same options, put them here.
 .It Pa /usr/libexec/dhcpcd-run-hooks
 Bourne shell script that is run to configure or de-configure an interface.
-.It Pa /usr/lib64/dhcpcd/dev
+.It Pa /usr/lib/dhcpcd/dev
 Linux
 .Pa /dev
 management modules.


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
index 39e689d2f6..03dbf31b35 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
@@ -62,3 +62,6 @@ do_install:append () {
 }
 
 FILES:${PN}-dbg += "${libdir}/dhcpcd/dev/.debug"
+
+inherit multilib_script
+MULTILIB_SCRIPTS = "${PN}-doc:${datadir}/man/man8/dhcpcd.8"
-- 
2.34.1



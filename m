Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCD4C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 15:21:53 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.52989.1638804111931683582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:21:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OFOH+Ok7;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638804109; i=@fujitsu.com;
	bh=IP3Xm5RD+Lq8pHDnES5TstB/xaSlhwl8SYP9jBB5eqQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=OFOH+Ok787/AaVgV/97aqAn+K7zCHwSYToQBc2d2zd6rVrSGwiqZrzot3EvbpRS9O
	 tHUU6KwyrjZqAMe9pMRy1fPXVBXi5odMZ4Gapzoxq1jHmi+ChbL2ue4hxDfj9SEYK+
	 bWUybaFeSMWqkRxJNTMBLYJHlMDX3MK0GskkLPiE1mFNuUlZaayrg2jlQI1Q+OM7in
	 0f8jS7nBD10xzfzYbNLpIq6b9y7RE7aASZhBqXO7W98DK6DUIYlJRlkhLXKr+H4eiz
	 HPNz2eehEsCfiLfOJXy7qm1Mzhk+Q4k0qW4nVzn3AoxV+6NEEgeR/4WvMMFstx5Jtd
	 /IQPDa8wiNgKw==
Received: from [100.113.2.134] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 32/31-32197-D8A2EA16;
 Mon, 06 Dec 2021 15:21:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqNurtS7
  RYPoBdos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP52ZyCl9wVXVeOMjcwHubqYuTkEBJ4zCgx
  caFSFyMXkH2eSWLSlw9MEM5xRoldtw4ygVSxCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAjcTR510sIDYLULz54n5mEJtXwFHiecdpsDESAgoSUx6+B4tzCjhJfN9+nh3iCEeJ3r
  Mf2SDqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2BUSs2a1Qc1Uk7h6bhPzBEbBWUjaZyFpX8D
  ItIrRIqkoMz2jJDcxM0fX0MBA19DQWNdI19RQL7FKN1EvtVQ3OTWvpCgRKKmXWF6sV1yZm5yT
  opeXWrKJERi8KYVMxjsYr73+oHeIUZKDSUmU10NsXaIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lC
  d5GDaCcYFFqempFWmYOMJJg0hIcPEoivAc1gdK8xQWJucWZ6RCpU4yKUuK8zSAJAZBERmkeXB
  ssei8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuadDTKFJzOvBG76K6DFTECLY/pXgywuSUR
  ISTUwzbppdublqnWRzTxOk+TdCtj2v1q2YmVhq/yOEoarvZb67L4hv2+LyYTMUT+ylCXQdUbn
  yWybNdckbq2ofvjxad7edXWpcXKRlxp6t7KGv3x9p3OR+qaSVtY9Dbw79hpMk9x3oyGYhZPla
  UlBW414fcSvo2d4wifrHV3w8Y6hsnqfekT0yoRLhiGb9s/K7gqtiyozsi6sU9/0Mj2mXctTWE
  VTIPJe7YzJRwUvbZJpO68RN7vpeYVRhcsqVmb2zOd617ZVrnxpUGZvsd3sxocpYpOOlv6bd26
  2YuaChy6hzp0t87ILL3MFs+es+6/D+8bB+IHIsgBmhVLlpjKex5tmf7+RGie97sm3l79DSnuU
  WIozEg21mIuKEwFDBR6QWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-226.messagelabs.com!1638804108!40795!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16814 invoked from network); 6 Dec 2021 15:21:49 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Dec 2021 15:21:49 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A89331009EE
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Dec 2021 15:21:48 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9DC19100240
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Dec 2021 15:21:48 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 6 Dec 2021 15:21:29 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sysstat: upgrade 12.4.3 -> 12.4.4
Date: Mon, 6 Dec 2021 23:21:16 +0800
Message-ID: <1638804078-8183-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638804078-8183-1-git-send-email-wangmy@fujitsu.com>
References: <1638804078-8183-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 15:21:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159240

Changelog:
=======================
* iostat: Always display persistent names with option -j.
* iostat: Fix how device mapper names are taken into account when
  entered on the command line.
* mpstat: Don't display offline CPU.
* mpstat: Fix values displayed when an offline CPU goes back online.
* mpstat: Fix untrusted loop bound.
* mpstat: Update non regression tests.
* Use 'grep -E' instead of deprecated 'egrep'.
* Spelling and grammar fixes.
* Update man pages with correct spelling of "JavaScript".

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sysstat/{sysstat_12.4.3.bb => sysstat_12.4.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.4.3.bb => sysstat_12.4.4.bb} (65%)

diff --git a/meta/recipes-extended/sysstat/sysstat_12.4.3.bb b/meta/recipes-extended/sysstat/sysstat_12.4.4.bb
similarity index 65%
rename from meta/recipes-extended/sysstat/sysstat_12.4.3.bb
rename to meta/recipes-extended/sysstat/sysstat_12.4.4.bb
index 5a27de439f..d635650a1f 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.4.3.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.4.4.bb
@@ -4,4 +4,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
 
-SRC_URI[sha256sum] = "ae432431f45aacbcabacfbbe129e2505e215cafa9ce996d7550c6091a46f0bfd"
+SRC_URI[sha256sum] = "9512e7479e04f92e251c5c6b4bd94b8f643d212bd0e986a8ea4d147a6e943d24"
-- 
2.25.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63816C4167B
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:30:58 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.37650.1670830251383712907
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:30:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jiG4abFv;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830256; i=@fujitsu.com;
	bh=qPPhZ0VOHMwbzpLH2Zck5u9lb6OMd34r6n+48GP6bu4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jiG4abFvqwv7WA1H5fgSVt7fS/ihXk3c+XZjzSGiyxjW8XVk/zgORibKXXPSO1h3k
	 FIHZAHr1/nhrJxroOSqtbcpUQWG+EzusAjbQbKl/Gq+tKs4H/J3hUcGxEW6bjtiCk1
	 QcL1SFprgYzt3EkpfVFfTMNHyP903NExGVCGSWPEulECfWq5fQR08uQVPAKXe9TO4P
	 PaQHDLKNKQ/fHLyWCJl1PLAAX3/odR0dru+7akOqo4dE2awEl4leXycit1+YMZg73L
	 Gm0leR8j6l8fRUatdixkiM/M1jxD/T+D8MUCPEVSEMD9Nv/oWkTAIaNiex06NQYpFi
	 fdY4d1X+57z0Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8ORpLvhxrR
  kgx3fBCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1owvxyYyF7RzVBxeJNPAuJi9i5GLQ0jgAaPE
  vW/nGSGcy0wSVw4dYOli5ARy9jBKbJrEBWKzCUhJ3Lj/n62LkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAtcSfhr+sICUsAqoSXROLQMK8Ao4SV/umg02UEFCQmPLwPTNICaeAk8Szo1kQixwl2h
  7MZIQoF5Q4OfMJC8R0CYmDL14wQ7QqSsy+3Aw1pkJi1qw2JghbTeLquU3MExgFZyFpn4WkfQE
  j0ypGs+LUorLUIl1DS72kosz0jJLcxMwcvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwU
  vbzUkk2MwKBNKWa7voNxxrI/eocYJTmYlER5K69MSxbiS8pPqcxILM6ILyrNSS0+xCjDwaEkw
  bvhGlBOsCg1PbUiLTMHGEEwaQkOHiURXjeQVt7igsTc4sx0iNQpRmOOtQ0H9jJzzPzadoBZiC
  UvPy9VSpxX+jpQqQBIaUZpHtwgWGRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMawMyhSc
  zrwRu3yugU5iATol6ORXklJJEhJRUA1NjjLznro0nWItKd+5milYt/2m4r35f1PfsUo3t2R+q
  HkQ8FV3vzrrQqnDlAWnXU2uE367fPSf6tfrzszsM5UMO+r1v1Lq1I2gCZ9T7i0HJj1elaFmde
  PHHXdSr91P6gVJp3ykGHzfYvFn5vfSy4OzbbbJrPmWaxrD+kMzWjlhuu/Yd1z/Jr089nK66CX
  fosOiLbNrbyr31d0XIyVXv4nn21ImL3q/OVmDV3Jgh2srFJHmKvXxFovwevVe6J89+4NvuwKT
  +5GeJcWXU7ODkpi2Nrje/GrxVYzSROn9u+u9716NNKhPfRD5vnpN1Xf/UzyCZQkM//vzV1+/x
  uqgcfnL3m2J/9I5fpx0urDMqPaPEUpyRaKjFXFScCACJrsQ1ZwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-585.messagelabs.com!1670830256!316159!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16182 invoked from network); 12 Dec 2022 07:30:56 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-21.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:30:56 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id DC8D21AF
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 07:30:55 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D08981AD
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 07:30:55 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:30:54 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libxau: upgrade 1.0.10 -> 1.0.11
Date: Mon, 12 Dec 2022 15:29:55 +0800
Message-ID: <1670830196-2900-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670830196-2900-1-git-send-email-wangmy@fujitsu.com>
References: <1670830196-2900-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 07:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174483

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
configure: Use AC_SYS_LARGEFILE to enable large file support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxau_1.0.10.bb => libxau_1.0.11.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxau_1.0.10.bb => libxau_1.0.11.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb b/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb
rename to meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb
index a62c9f088a..e2c06fd14a 100644
--- a/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb
+++ b/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb
@@ -21,4 +21,4 @@ XORG_EXT = "tar.xz"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "8be6f292334d2f87e5b919c001e149a9fdc27005d6b3e053862ac6ebbf1a0c0a"
+SRC_URI[sha256sum] = "f3fa3282f5570c3f6bd620244438dbfbdd580fc80f02f549587a0f8ab329bbeb"
-- 
2.25.1



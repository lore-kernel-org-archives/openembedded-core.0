Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7515C0502C
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 04:12:31 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web08.7708.1661832746752610412
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 21:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pLC6sxUR;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661832745; i=@fujitsu.com;
	bh=xryKRzk4DSR54iWvZ/qNRe2idah3Jm8kffBwLVQuFfs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pLC6sxURDXo6b9uvwN6pW9TsrBDKlwP7+zHZyEg12mYrRIogFfAjzRHfPeJsOg3Xw
	 5OBF54hGm0fgl5RESXxkFG+D12vaytfbOUTmwrgs3ScHdviJv5g6lUbphr7XAHMNdn
	 NTyzo9xuJ6/AzR6UouIy4IE4gIpHvCubJTOx51WSiqJLokn9NTvxv2VsX+FAzjbreP
	 ce/1LabAw/lMRyO8982zijwOWyF20usvvd/ZbO/BJgzezny0DwY5o8/nbFw9gjMRBv
	 EGRgF0fAPevffP0Kd2mH6ljnFQz6bZKDSyvOPQ4VLNKIfvB/1ttZiYsyJbKXx2ND0e
	 Z1JRj74K7q03w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRWlGSWpSXmKPExsViZ8ORqKvRx5t
  s8PiYtMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvGh+SpTwSLOim0PFjI1MM7i6GLk4hASeMwo
  8er9XBYI5zqTxMu/DYwQzl5GiS3LprF1MXJysAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgKVEz7dlYCUsAqoSj06VgYR5BZwkLk/+BTZFQkBBYsrD98wgNqeAs8Tkw9/AWoWAaj
  5++cMGUS8ocXLmExaI8RISB1+8YIboVZSYfbmZBcKulNgzq58JwlaTuHpuE/MERsFZSNpnIWl
  fwMi0itEqqSgzPaMkNzEzR9fQwEDX0NBU11DXyNBcL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFiv
  uDI3OSdFLy+1ZBMjMIRTihlv7mBs7fupd4hRkoNJSZR3YStvshBfUn5KZUZicUZ8UWlOavEhR
  hkODiUJ3svdQDnBotT01Iq0zBxgPMGkJTh4lER4vbuA0rzFBYm5xZnpEKlTjMYcHw5d2cvMMf
  Nr2wFmIZa8/LxUKXHeqb1ApQIgpRmleXCDYHF+iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5I
  w74YeoCk8mXklcPteAZ3CBHTKwyXcIKeUJCKkpBqYpjr3LHAN0RM82LEsOsXUccoVeS1zl93m
  v15xdxWYN2bvnKAluzTh7gIf08d7cj4xRVRJyzFESvM073Kc/TJptnXqtgU3WzYItDcyaBrqv
  u5a4xIQGtKgoRf/gu/9kT7hiHAFj8yard9ZRPvsjthq31GSkFPMV2To5Pt/VPTk36oNu+zqdR
  5vMpoovfSX/9Hsn7PDu0puss1f9Mx9oYKWCZNk4N+t51/fmMhy60iLsI9dojVb+xGR1KLTPh8
  49tVm/AmxqJ5VfkYg5u3q9Eiu0/8NK6Lus3FFPF/EJsdX8XL2gaWtZ2JVp04LrVzCPy16A9MF
  L9Mzypszg89P8Ba7LhfU7zRVa/2HvUmpLEosxRmJhlrMRcWJAL8TUqduAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-585.messagelabs.com!1661832744!25506!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22709 invoked from network); 30 Aug 2022 04:12:24 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Aug 2022 04:12:24 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 18761100191
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:12:24 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0C220100043
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:12:24 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 30 Aug 2022 05:12:22 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mesa: upgrade 22.1.6 -> 22.1.7
Date: Tue, 30 Aug 2022 12:11:50 +0800
Message-ID: <1661832712-12546-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661832712-12546-1-git-send-email-wangmy@fujitsu.com>
References: <1661832712-12546-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 04:12:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170054

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-graphics/mesa/mesa.inc                           | 2 +-
 meta/recipes-graphics/mesa/{mesa_22.1.6.bb => mesa_22.1.7.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa_22.1.6.bb => mesa_22.1.7.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c4efc13438..a2c5679bcc 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -25,7 +25,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch \
            "
 
-SRC_URI[sha256sum] = "22ced061eb9adab8ea35368246c1995c09723f3f71653cd5050c5cec376e671a"
+SRC_URI[sha256sum] = "da838eb2cf11d0e08d0e9944f6bd4d96987fdc59ea2856f8c70a31a82b355d89"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_22.1.6.bb b/meta/recipes-graphics/mesa/mesa_22.1.7.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_22.1.6.bb
rename to meta/recipes-graphics/mesa/mesa_22.1.7.bb
-- 
2.25.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6475DC4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 11:54:20 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.7140.1646135658768552106
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 03:54:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PoK3D69A;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646135657; i=@fujitsu.com;
	bh=GLDtJaZBzTQoI0wIAJTllG1c6qv2UOH6ESs6MbCW5/E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PoK3D69ANbBCRL0jJl5DAnwYroKIzpjoOQl3/IglrOcTQiG1c2ekEzK79oNqs2p3I
	 ag09GMPMIk0iVl2nveouuvRxBKJptEauNo3rG+i6WHrZra/YOOx9Gu9Hwo9XMBZZL0
	 fkHFpXLx5uAuG2RxCmtPDKDtnVWkAYw26GWo90gaiV4gnt65CO9OR4ageqE3AZN652
	 O4vct3Fmln6FP6DCfPR0MmNNTE8GvWvQJ5DMDTL17Z8hKJva0Yn+Cd30eOkGzURGJf
	 5cONZTcEd/CS09lSTtN2vur4vc034Ni+TECZjXmHsC+9zcPwT8Tpe4tVHMeKk6hnuL
	 K9KWR2KXbV6PA==
Received: from [100.115.66.23] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 EF/39-25243-8690E126; Tue, 01 Mar 2022 11:54:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8MxSTeDUy7
  J4G6DgMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnFn8hvGgk+8FZuP2TQw/uXuYuTkEBJ4zCjx
  979uFyMXkH2eSeLJooWsEM5xRol533+ygVSxCahJTL91AyjBwSEioCdx9Z8oSJhZQEXixe8ed
  hBbWMBGYv28Q2DlLEDxlt8fGEFsXgEniQWHPzKB2BICChJTHr5nBrE5BZwltrxvZ4c4wkni7q
  mf7BD1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7AqJWbPaoGaqSVw9t4l5AqPgLCTts5C0L2B
  kWsVom1SUmZ5RkpuYmaNraGCga2hoqmtmqWtsrJdYpZuol1qqm5yaV1KUCJTVSywv1kstLtYr
  rsxNzknRy0st2cQIDOOUYlfFHYzX+n7qHWKU5GBSEuVVuymbJMSXlJ9SmZFYnBFfVJqTWnyIU
  YaDQ0mCdzu7XJKQYFFqempFWmYOMKZg0hIcPEoivHEsQGne4oLE3OLMdIjUKUZdjg+HruxlFm
  LJy89LlRLnPc4BVCQAUpRRmgc3AhbflxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ824BmcK
  TmVcCt+kV0BFMQEf8DZYCOaIkESEl1cBUvcrFdesdszpLlrUPPrpxXti1rrnxy6eHK+9cn3jz
  bgT3Bd/6nKcLX4p8sZwT96O1j6NaWuE6+0vNjWxWr18rbJn2ZVHq3j9tHnfuyIkKff0W4cQ1e
  Xfvf7bin1cn7T3r07r9+0HDdZEvLtzVs1uX6GK4OvD7RynuueZikSoH95/5d+ya0sqWy0Iiub
  NXqpnLZ2SuutXyVMAqc9lUfb11Z9Pto3ecenvm29p71scqC3OebBB38Eyy5+iSleUXP6h6ieX
  Yr3m5Jan7DuTfyVoycVu7NI/jCQf3JcGVCy4J6W9aWvtrbquI1sojqQJ2V5a1WgRav39d4+aq
  xdm9r3epovt09SdWAT41BVNmB6loKLEUZyQaajEXFScCAK8PsTBqAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-528.messagelabs.com!1646135655!32926!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26653 invoked from network); 1 Mar 2022 11:54:16 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Mar 2022 11:54:16 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B610A100446
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 11:54:15 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A832210044D
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 11:54:15 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 1 Mar 2022 11:54:04 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsolv: upgrade 0.7.20 -> 0.7.21
Date: Tue, 1 Mar 2022 19:53:52 +0800
Message-ID: <1646135633-39009-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646135633-39009-1-git-send-email-wangmy@fujitsu.com>
References: <1646135633-39009-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 11:54:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162548

Changelog:
=========
- selected bug fixes:
  * fix segfault on conflict resolution when using bindings
  * fix split provides not working if the update includes a forbidden
    vendor change
- new features:
  * support strict repository priorities
    new solver flag: SOLVER_FLAG_STRICT_REPO_PRIORITY
  * support zstd compressed control files in debian packages
  * add an ifdef allowing to rename Solvable dependency members
    ("requires" is a keyword in C++20)
  * support setting/reading userdata in solv files
    new functions: repowriter_set_userdata, solv_read_userdata
  * support queying of the custom vendor check function
    new function: pool_get_custom_vendorcheck
  * support solv files with an idarray block
  * allow accessing the toolversion at runtime

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsolv/{libsolv_0.7.20.bb => libsolv_0.7.21.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.20.bb => libsolv_0.7.21.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.20.bb b/meta/recipes-extended/libsolv/libsolv_0.7.21.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.20.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.21.bb
index f0ba9553e7..acf61e3adc 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.20.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.21.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "f618e6aae1d44be633b2ab91d4fd4f4f974f4d40"
+SRCREV = "6f8bae1fea9c923bddf01c27115123010d191b07"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1



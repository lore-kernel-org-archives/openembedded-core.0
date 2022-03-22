Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D9BC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 10:30:15 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.8225.1647945013717273246
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 03:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ENKNZePo;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647945012; i=@fujitsu.com;
	bh=u+j94W9RIxTkMZ16svi/XlKkBQV8XvQjte02V2GyGlU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ENKNZePojpG0LRws11rwi1AWO6d4QE6mMxvaNZBSw4++YznSwHbIoYX1uGc+ZLhIJ
	 JEbk5nH0sW/XQOJ7BqI8Z0jQLrpl5gSapTajnMYKWBfTlCjcCvS89CDdVMB/iCa2aN
	 7vCgDKwbxifW26e5c4scQ9wj23Pxr6d9Ty3cT/NzoqI3GuZdAi+Ua1oQXNwqZ/zZDi
	 A9gUjjUbzkiQzaWUxUYOdP3OogN9rszm5SBAi6HpAs7g6v/ueItuQS48frZQ5SYMGA
	 S+5zzjd6PvFRsq40GLft19bM6ggYsupXGeGaUnVGjfaqTeygcuWn6nBx6ni87qQinm
	 7YQJMfEU8cNPQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORqGu81DL
  J4OBXKYs7P9+xW9ybv4DNgcnj3MYVjB4dv68zBjBFsWbmJeVXJLBmnF28lr3gF3vFpY2/WRsY
  J7B3MXJxCAlsYZR4fOoUK4SzgEli/tXjbBDOHkaJN5cuA2U4OdgE1CSm37oBZHNwiAjoSVz9J
  woSZhaQl1i+6Q8biC0sYCnxZMIaJpASFgFVic7PriBhXgFHicYtNxlBbAkBBYkpD98zg9icAk
  4SE/ZdZQKxhYBqvkxewQhRLyhxcuYTFojxEhIHX7xghuhVlJh9uZkFwq6QmDWrjQnCVpO4em4
  T8wRGwVlI2mchaV/AyLSK0SqpKDM9oyQ3MTNH19DAQNfQ0FTX2FzX0FIvsUo3US+1VLc8tbhE
  10gvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwrFOKVYV3MHas/Kl3iFGSg0lJlPdNq2WSEF9SfkplR
  mJxRnxRaU5q8SFGGQ4OJQneo4uBcoJFqempFWmZOcAYg0lLcPAoifBmdAOleYsLEnOLM9MhUq
  cYFaXEeV+C9AmAJDJK8+DaYHF9iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw7zaQKTyZeSV
  w018BLWYCWqzPagayuCQRISXVwJQ1Z8mkJY6HtYTWLq5Se6FvUMe7+6Kp78Ln6/Z2fdD2Zp6+
  dNaTLUZ5r9ODz/e/dlkrk+sb4rWwbFp7r6lTYuut0+ZWF/ykn27pUmarVNxmIeDimCCqG3Ho6
  P9fwc+3nXuy+emXwBW7Yrx7r9sXRsTrZ9ybnr5J70RJVWm0xH5v+97GnIQ7S/c7TIwOOcex5e
  9Xbxk+zhylDMYtNqlSN7dfUuLfN6HHvv5Iidw94em7N14peLr/FNO7KO7v8+WjAk8v+hN4m3t
  tvsSZ36kM8yu69vGfasjx5P4X8j0h1fHrtinpE99IinxZIMM2ZdkRzsPxU5tuWJiK17xlEzZ9
  euDwlBv36mv8paWPrNvXd1qJpTgj0VCLuag4EQDr5T56ZgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-548.messagelabs.com!1647945011!15212!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9174 invoked from network); 22 Mar 2022 10:30:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 10:30:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 96DD9100186;
	Tue, 22 Mar 2022 10:30:10 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 36F6D100190;
	Tue, 22 Mar 2022 10:30:10 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 10:29:59 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Upgrade Helper <uh@not.set>
Subject: [OE-core] [PATCH] gnutls: upgrade 3.7.3 -> 3.7.4
Date: Tue, 22 Mar 2022 18:29:43 +0800
Message-ID: <1647944984-5058-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647944984-5058-1-git-send-email-wangmy@fujitsu.com>
References: <1647944984-5058-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 10:30:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163534

From: Upgrade Helper <uh@not.set>

---
 .../recipes-support/gnutls/{gnutls_3.7.3.bb => gnutls_3.7.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.7.3.bb => gnutls_3.7.4.bb} (96%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.3.bb b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
similarity index 96%
rename from meta/recipes-support/gnutls/gnutls_3.7.3.bb
rename to meta/recipes-support/gnutls/gnutls_3.7.4.bb
index ebabac1bd0..b34eb7f5f0 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.3.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
            "
 
-SRC_URI[sha256sum] = "fc59c43bc31ab20a6977ff083029277a31935b8355ce387b634fa433f8f6c49a"
+SRC_URI[sha256sum] = "e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.25.1



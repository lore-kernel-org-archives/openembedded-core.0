Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FCBFC43217
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:16:29 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.30959.1668892576090693357
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:16:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=zqU9Vsji;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id y10so6244862plp.3
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knfiTWyqX/GRYF3uSJgY9UQL5UfocNzcrOYvE2ArLz4=;
        b=zqU9VsjiuskSOk1yC0VU/7NkMEkf3fZ35k+PnlvLT1VzbZieqjgEzvSJeGBnRACrj7
         euwRiBUNIrqyuLhopBgyUCW5TJTMEu+lMAFIjY3m5e1Pm99nhJsYqk2LTNfTCfzraB0Y
         a5J9GMmgVvuBjDEWHej3lzCTAxnWT/pnhsWos64kI3hLeLfqZRX1RBdb6qZ/ZbBAqMSz
         UE/42YgeEouW+bRZULnfr2PPD4Z//aA5avssL8Y3nhnt4aKCn4io3Qny2NKHNg/lGZGv
         uQLwWEKB+CrEejeWGnS+V2cVpx3WPtGFz2VZqykAi1m/PAZSTD10uJRH9m68lXBFL2rp
         /4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knfiTWyqX/GRYF3uSJgY9UQL5UfocNzcrOYvE2ArLz4=;
        b=xbSrOXyBGmdppQxPRNLhgetGwIO8pDW1WNWBMlyP2gyVROGASPPSzeSYR7lpRjXSfH
         l75PAxojy4EHwNHhJegwbwSCISXlQwRlVVeqmPP0ceBMzlaNYTgX85f958EV522sdGZl
         FeIoTYMdpTsAvWFkIvUwrq/kWwvTkwsj/Y2xGRe6aUjra+/c3ogiM8rbtC6MoGkUX4zZ
         n3nihtmvoiNP3QomaR2E8jA/5GNjO55zh+rm0RPJpwB/RJeA1sd0NAtDHbpRexdFIWIX
         q/MXsM8MjbSydT1/9zuXWAfLf7gBUBwJjqMZIBtO2XkTGI7/i+ncf7aszbfd7kfLqxL9
         YbIg==
X-Gm-Message-State: ANoB5pmSJovWTay3zaw8h4PrUxShiOzV5K56ISXEUxQ0o/fNUjJRZJ+i
	mAf3yGSZpsaKzIslQ05ldIDyub34FNYvUEkd5sQ=
X-Google-Smtp-Source: AA0mqf4WhyNsZBYqUYnSj5Jjaou0ft48wKB4qXSs54iKL7NwSIy4NVfaceylWrLlF023wiy1AXl5xg==
X-Received: by 2002:a17:902:b691:b0:17e:fb19:63ba with SMTP id c17-20020a170902b69100b0017efb1963bamr1224039pls.160.1668892578816;
        Sat, 19 Nov 2022 13:16:18 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.16.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:16:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 30/35] insane: add codeload.github.com to src-uri-bad check
Date: Sat, 19 Nov 2022 11:15:09 -1000
Message-Id: <5c8e0e641ce676d67b10834593d90fdd87787cf9.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173570

From: Ross Burton <ross.burton@arm.com>

GitHub redirects /archive/ URLs to codeload.github.com, a dedicated
service for caching git archives:

$ wget -v https://github.com/unicode-org/icu/archive/refs/tags/release-72-1.zip
HTTP request sent, awaiting response... 302 Found
Location: https://codeload.github.com/unicode-org/icu/zip/refs/tags/release-72-1 [following]

This is not the case for uploaded artifacts:

$ wget -v https://github.com/unicode-org/icu/releases/download/release-72-1/icu4c-72_1-data-bin-l.zip.asc
HTTP request sent, awaiting response... 302 Found
Location: https://objects.githubusercontent.com/github-production-release-asset-2e65be/49244766/... [following]

Check for codeload.github.com URLs in the src-uri-bad check in case
the SRC_URI contains this final URL, and not the public URI.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit a3b4575259fa304c596ed227ed60769b5f72f0a8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index dc46857a19..df2c40c3c5 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1346,7 +1346,7 @@ def unpack_check_src_uri(pn, d):
 
     for url in d.getVar("SRC_URI").split():
         # Search for github and gitlab URLs that pull unstable archives (comment for future greppers)
-        if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url):
+        if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url) or "//codeload.github.com/" in url:
             oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol" % pn, d)
 
 python do_qa_unpack() {
-- 
2.25.1



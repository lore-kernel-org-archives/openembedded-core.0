Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EEFC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 19:35:00 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.3373.1645472099900264445
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 11:35:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=XXZ9N/Ut;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 ck4-20020a17090afe0400b001bc64ee7d3cso130507pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 11:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=b6FxAC/a/FkQQQS5RXdZrM9McMRMl+Gm8Aw91X83kXY=;
        b=XXZ9N/Ut1g0MIEchjDbXUyBlWK6B9w8cASQgLnrCGt2LIbyF9ew1pOdt1+dLuKGsEG
         ZYxbwAeSGMPCK1BCFY8h6bqWOQ5pzg2t/LszLIRZarw314WKTrqyVr+c/Jh43+y0sNkn
         Y1Nx4b9oorerT3zHK/6Qz08lNXKreH8T9mNS1RlUe1zDeeEj5Zl9vwv70UpQXzA84MuP
         TJbqMD7WZBNsQK3vUXp7/ebqmWh8SExf9XP+biOVcTd8AVOHPZkCLQPo7or8Mbi1uvQk
         GZ1nux/vZFEqg9rKiN+U3lpSlSpwzS43X/+eSosRAU1lwt2rorpbyCc5cj/6w1SuSyYr
         QgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b6FxAC/a/FkQQQS5RXdZrM9McMRMl+Gm8Aw91X83kXY=;
        b=veVDW60ldGGRe2sVwX8FsVH/5zyXoy89cQEgj80jHPovhxDT3Ewwk2Goyu8DybaTkV
         BwcPtfw2RfEBRhkNLMo72awoTbWz1NQGo5x4D5rRTsKQE+2SFmbtR3BnI16Za+wLEYvl
         1UCqJRp8jBQHerQMNLyNyIG6XcJgmw59dZjx1Y8OXM0oQGVsHvC9O7wKp/r1rX78a8+x
         eJoeOzzLuHz5wUzXBjBEqzNMv2zLcBqk6oo1UjI9G+spbFE4JOwfUNc2n8nVPIPYRgje
         28W7yS88yqn366eltbO02SHStz4uKRJu+9g/B7ZgDNx/RAVHU24D3TrvRo4tAlFFo6w+
         vZhQ==
X-Gm-Message-State: AOAM531epbBV2HSg3nWbMe15BOxlRH/QOPnrKw2F0bq9hxyVx9HKybvG
	7FkKYyskZlvM8ysAfAinyneJsjMXwdrpCc8A
X-Google-Smtp-Source: 
 ABdhPJyHO+RpuFVjRE5AtrZ9WPbO3bPwrUcwz2X6chD+i76TjNmVjTWCCp5Fkb544jNjVwgaSi8Jsg==
X-Received: by 2002:a17:903:4049:b0:14f:9dcb:7388 with SMTP id
 n9-20020a170903404900b0014f9dcb7388mr9894746pla.16.1645472098957;
        Mon, 21 Feb 2022 11:34:58 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s2sm14286657pfk.3.2022.02.21.11.34.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 11:34:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/8] vim: update to include latest CVE fixes
Date: Mon, 21 Feb 2022 09:34:26 -1000
Message-Id: 
 <faf83cac9ff82a3c795b2e8d82719bea43830f7f.1645465376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645465376.git.steve@sakoman.com>
References: <cover.1645465376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 19:35:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162072

From: Ross Burton <ross@burtonini.com>

Update the version to 4.2.4118, which incorporates the following CVE
fixes:

- CVE-2021-4187
- CVE-2022-0128
- CVE-2022-0156
- CVE-2022-0158

Also remove the explicit whitelisting of CVE-2021-3968 as this is now
handled with an accurate CPE specifying the fixed version.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 764519ad0da6b881918667ca272fcc273b56168a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 1c7256c97c..3f9bd6f012 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".3752"
-SRCREV = "8603be338ac810446f23c092f21bc6082f787519"
+PV .= ".4118"
+SRCREV = "0023f82a76cf43a12b41e71f97a2e860d0444e1b"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
@@ -29,9 +29,6 @@ UPSTREAM_VERSION_UNKNOWN = "1"
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
 
-# CVE-2021-3968 is related to an issue which was introduced after 8.2, this can be removed after 8.3.
-CVE_CHECK_WHITELIST += "CVE-2021-3968"
-
 S = "${WORKDIR}/git"
 
 VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
-- 
2.25.1



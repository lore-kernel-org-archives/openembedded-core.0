Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8A6C43217
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 17:48:38 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.26328.1668880114777591319
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 09:48:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=MKj/ZGGI;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id b62so7718343pgc.0
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 09:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3p4YW9N3KqmSmGc9S42q1BI/3NF3CjsH8e9MIKD5KmQ=;
        b=MKj/ZGGIi9dtpHKT+brAD910/1Axc87Z61wRSeaND2jyfYWTMMkmlI6wrZWfKwEXx9
         AU789WIi91JTyJFIJ+7hIkvBtALYaoaR6FeYM6wJAteD7n/fQtGq1DGPnXRJkj2HQuHM
         1DB3O5f8Do+IG8H6400BZT8Jvf+FJPpxJY0rCpBLhBRCncLECN3ReDOpJjJPOdx6GmAw
         i1s1/X7LYEqlMUQ6apCvJYpIAskk2Tl3pVEB5zQHWvTPCH1KOFiGU1/oeUgpppliSG2v
         8w9dZIZBlqdjDcwCmw2rQu/fwhkPuqrnaiZAKWWHYQTRtf5/O8AaVUGpu2qLdvpwcLqF
         IHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3p4YW9N3KqmSmGc9S42q1BI/3NF3CjsH8e9MIKD5KmQ=;
        b=fXXh/CP3Ua/UQZVQl6yxbhqVbBTvnjb+2ruG6gy7zGK3IViuiPSLpyTktM8+WVBwu/
         Y6dOV/SghIVrQ5Lqj0Ru4zKrdH1+bPMWcmulMNqu61/ZGsKVrDggrVNmsKHoMJqMZUPX
         mgDfWUFlH0U6nP6zYQ2eCwqOPKj1xxw+WEpBIYdE2ypXwWEp1zvX5HJZMfgPTnCevgX8
         YiUUMTdt96O5EdHq642Rl83j/RbzIhjO6X/am9bkxL3HeoSiA3c9rjWWM7AVNrP84bA9
         26FFA5sn8YRmeyQgvw1Dv+Mn4kTSGLzLvHjiXyMPzaYdLF37wSg9M41+W9ULFHn88ghm
         LSng==
X-Gm-Message-State: ANoB5pmjgyQnvSZjHltPIygYZqLxicelYbX9tjHUxdcEEE77UsUupho/
	P2LP3noVXc45rudkQruuSacoBC290nfmQmhDqHw=
X-Google-Smtp-Source: AA0mqf7QbCS71MxvNmqpSeNWW4gwN21Dj+spiXZVdl9l+2kls6qLLZw9xMN4+TNy3SFmE1eD7xZsag==
X-Received: by 2002:a05:6a00:2396:b0:572:698b:5fa9 with SMTP id f22-20020a056a00239600b00572698b5fa9mr13018528pfc.28.1668880113843;
        Sat, 19 Nov 2022 09:48:33 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a668600b0020d3662cc77sm7384151pjj.48.2022.11.19.09.48.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 09:48:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/21] vim: upgrade 9.0.0614 -> 9.0.0820
Date: Sat, 19 Nov 2022 07:47:48 -1000
Message-Id: <f7447f23b23cbffa57b84b5084203cd40ae0bf62.1668879817.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668879817.git.steve@sakoman.com>
References: <cover.1668879817.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 17:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173538

From: Tim Orling <ticotimo@gmail.com>

Includes fixes for CVE-2022-3705
https://nvd.nist.gov/vuln/detail/CVE-2022-3705

For a short list of important changes, see:
https://www.arp242.net/vimlog/

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f6d917bd0f8810b5ed8d403ad25d59cda2fc9574)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index e9fd7a3eec..262c97bf0f 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0614"
-SRCREV = "ef976323e770315b5fca544efb6b2faa25674d15"
+PV .= ".0820"
+SRCREV = "03d6e6f42b0deeb02d52c8a48c14abe431370c1c"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1



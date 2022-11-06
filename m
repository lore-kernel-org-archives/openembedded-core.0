Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BACE4C4321E
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:01 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.16774.1667744254112264108
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:17:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vvyW0mZf;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id v3so8308098pgh.4
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q33k6dm08Pi7V2PEK5W3pUT7zfJnC05ua39Se6HIbu8=;
        b=vvyW0mZfVEVVEskBAtHqTPAnv2XgpeGl7eEq9qKGMq+nMj9FwTSSPxfxg4UObQoCnV
         D9SFtXhg3TfiS4NyC0VmfzLpTc9AZYaEO2+aYn1SJ5jS/Iv6kzNXGX6mmGOi/T1i8J7a
         OnkhJRNtVMwj7zJfdmH2OJ7HD/zxqPDT41ERWw1f4j1AZCfIpW4p8sALygBmKmkxJLtt
         yu05sEly3RRJ7okQWljuKmYthzl0JzAB8QTS1r9FL0WQsxL89Neex6rP1oGgf7gxgVPx
         r3urzHacrW5DYV9be3fheBFoDbZZlttKJFfUMZ8H939umWh3IrBC2F+mbEubXeFa4RBp
         s0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q33k6dm08Pi7V2PEK5W3pUT7zfJnC05ua39Se6HIbu8=;
        b=vIPB8uidJ/LygmTuwFr77gjAT6BeBkEo8/deIT63eAD2QJc/lhLrTMNjnccfE/O1Nc
         +s1ZUa7sUxoTlsp0udt/u03BeBnEZtp1TYumfidUswcN8YlWn+RFnUM/35SBxtkwDaDr
         o83JsyBZPTonJVXfRFsmPvKGuLLzscLup00P+g0BYGWverQjCH+O1Dv/5aRNgirEffMF
         NCrLhlHgf6n5o5rHeHKKi2FPx4BlGy1XVa5HtXPLWkIqYn2ePL/dv9rYDeuprWYqfk6+
         CHmNonnkX8foya8uiBYA5NcNPVKga30qNYoEUgAmovLXFTh7VXoTd54iHcvzx7IJd4nm
         2m2w==
X-Gm-Message-State: ACrzQf0h5TKMDYaq3FC5OmMOILfLnxjYeBbQfbkYn/1D0ZX2/crU2cGj
	8I6vj9dpy8JnNSJ3uGzTlrka/OLMalyRBCb6
X-Google-Smtp-Source: AMsMyM5HFRLwS7zkq2c9c1a6YvOatXAAMz6tOs00hS0z81hm5pXaeN5/4mdqKXdSUtl6+ShBSDb7cg==
X-Received: by 2002:a05:6a00:1a94:b0:56d:267e:a200 with SMTP id e20-20020a056a001a9400b0056d267ea200mr42796239pfv.13.1667744253073;
        Sun, 06 Nov 2022 06:17:33 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.17.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:17:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 01/34] vim: upgrade 9.0.0614 -> 9.0.0820
Date: Sun,  6 Nov 2022 04:16:44 -1000
Message-Id: <1b0ce402ef432cacb824a49aeb039732fe25dc9d.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172769

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
index 0710f6afbf..298a111853 100644
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



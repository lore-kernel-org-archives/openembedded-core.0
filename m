Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB05ECAAD1
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:26:44 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web09.51803.1661624800344116481
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=eO8TPyfZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id 72so4530182pfx.9
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=g0QyaQiEP9xye73xjXrGXpV/exfrjTqHY7U1rxSS3V8=;
        b=eO8TPyfZ/9a/7Xe0yc13f/WNkZOkpad3k7eZWXvtKa8E/BfAYWMFLMmiTXZNM96LXx
         joSft0BxmCIaOHDGa3+fPEGtOflojMpyKKgCBpwDWA5Xr1PIhtIabB0m3RxJaeSF1TWP
         w0yz7fKmR+Wdwo9WFdUrX9T5b2w6XXFoyCk1F3Xa7FHfmEbxbXE6mEbe6lc6U8L2myd5
         uRxS/yUX9Bwod6hT3sCAGQduvkiBAz2e9Gh9uz8gzqgf+xsinFs5B6BNIBWdIm4OurNY
         3uVjCjrnbCl9qJwSMsw8xuPI/nL7+EoXegpMHH75EmC2U8d+0+RgaHoHPgerunD+07Xd
         dGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=g0QyaQiEP9xye73xjXrGXpV/exfrjTqHY7U1rxSS3V8=;
        b=PfGdbHMnff8Yg6jru1nbkjaammvRBNWoLpGxwP45nefGk+oKbsBC4XWiqep2XpHZ/f
         6zKtS9+CKlqUsHMzeTxbPkajDkB6caSHT40ByWCIYjzRvnD9uEPVuIDYI4+brDNuWyF0
         rODRn+sAVELz6jwRM0qcYmMZj+nuXQT4O092RX+yai6HqJ16y0gaqww5sTrfwTzagLrP
         HdSeu8PMaxdHUKtelW4yOK4JuaarwhDD2K4sGBkYcCJGk0BfT2kDLXRU72NwEVrPM2hn
         qEonaXfcUoGqMoc+DtpLdKzQowm2gtsBIhfqd4hePgEzfeFV1ywbPkNVzqlEQ+E6aWnT
         cVUQ==
X-Gm-Message-State: ACgBeo1KCOzIqi2OnIHbnb/qyzjOeHKtyaxK6uxwt8xOguYLjcMd3OJP
	nn0z2vCRlAxywZVGyebbtsxDQ9KWbwWj2T7p
X-Google-Smtp-Source: 
 AA6agR5x4I0YQ35P/O12CzEs72RJDXkfgKbfh+S+6JLZopGyCd6oqJ1XIl2r/orQsoJBKYWhop7eQA==
X-Received: by 2002:a63:485a:0:b0:41d:ed37:d937 with SMTP id
 x26-20020a63485a000000b0041ded37d937mr8024971pgk.336.1661624799422;
        Sat, 27 Aug 2022 11:26:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/24] sanity: add a comment to ensure
 CONNECTIVITY_CHECK_URIS is correct
Date: Sat, 27 Aug 2022 08:25:41 -1000
Message-Id: 
 <b41b50c30cf6bb996ad440a2c4bbc9a2e14f81ba.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661624569.git.steve@sakoman.com>
References: <cover.1661624569.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:26:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169958

From: Shubham Kulkarni <skulkarni@mvista.com>

In sanity.bbclass, in function check_connectivity :
Connectivity is tested by fetching URIs in variable CONNECTIVITY_CHECK_URIS.
If none is accessible, the status error is ambiguous.

It says to ensure the host's network is correctly configured but
never if the remote is available.

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9865176df6b6362a410b0fc3c115d942462dc338)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sanity.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index b1fac107d5..a79e36b594 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -351,6 +351,7 @@ def check_connectivity(d):
             if len(msg) == 0:
                 msg = "%s.\n" % err
                 msg += "    Please ensure your host's network is configured correctly.\n"
+                msg += "    Please ensure CONNECTIVITY_CHECK_URIS is correct and specified URIs are available.\n"
                 msg += "    If your ISP or network is blocking the above URL,\n"
                 msg += "    try with another domain name, for example by setting:\n"
                 msg += "    CONNECTIVITY_CHECK_URIS = \"https://www.example.com/\""
-- 
2.25.1



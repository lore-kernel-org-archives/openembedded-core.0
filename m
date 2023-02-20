Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63A1C61DA3
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 22:20:52 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.28065.1676931645562937440
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 14:20:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=pHUDRmP0;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id il18-20020a17090b165200b0023127b2d602so2853294pjb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRsIBkNEJehomLcJmmfNfv9YPg+kOMU8tNXZSzBL9cw=;
        b=pHUDRmP0SjZy+vO2Sh90RTkmnyfQWQYeFnr7eh/BMn/7KPQrUTY9aItpHsuP+lYMh9
         F6Lc+u3GGcL0uS7SBAEeNSG14c7SGJDowb5fgejsuEgILRA7Qrt3oVx3i6KQC0sDkgkK
         oIGtix+s+NE4UwZkyt2wNFR9W0VYL2hXlfy5WLRJEwT0dCHYF55TFUrzQY1PNGr4MnXX
         LeyIRcDjb2pHYgvHinDZrVXeCevt3/hJzuEdSjZXBRq2niekk2SGIrdqh0pUrXuB7TGu
         v0XRfbFTyQACZMwfzWp1eyfQp/+hoRnz+Hb8PMuvNJ54DSXL3zlLufmF9G87739apjfC
         G0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRsIBkNEJehomLcJmmfNfv9YPg+kOMU8tNXZSzBL9cw=;
        b=56uh8Ac7uvlk03XkFDXaoNLXEZ0yBQejBe/YWlyRyHGLyPGffauM5HBRI2LYDOlDPu
         T2mh6TxdaPYcGD5e/zcBwBgFWxvg6kY8TrpeAz5Wb0Fos4kML2OSda89OOO+2r8dc75M
         LUkUyIqmkYN1avSFkZfOGMLr0qRuEvxnpXhdP9F7XnxDHhjVfvj+rBoa9ejh4jF7r2Vw
         565Q3FAZFH011Fo1Y8TWN2JbK895cgmxwCb6/rTFwYU/VZ5HA/LfvvUKcHXdHq2Z/AOj
         ArFojHoH8Vg+6sd6h3gYOo7NEmZqZTcXYyMg9+vhF9awKt9JGBX4mqz5XKq7myPeoo4i
         TkbQ==
X-Gm-Message-State: AO0yUKXTLvV2mAKJsda4AP68MUeGuOT7dCd6fTICDtrfbwsfmzvFqh4g
	MZU0KkuBWRHdpmumsHyJvyznxqeiBd4TPGvkSws=
X-Google-Smtp-Source: AK7set/sCtqEHwsoHRs08LfAaumJ5naa9wwkmJ62lcIar3TOznJLfday6DyVIVdTKBm4I1K9BzFpMQ==
X-Received: by 2002:a17:902:eccc:b0:19c:387c:bd65 with SMTP id a12-20020a170902eccc00b0019c387cbd65mr3676969plh.10.1676931644512;
        Mon, 20 Feb 2023 14:20:44 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019719f752c5sm8401200plb.59.2023.02.20.14.20.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 14:20:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/16] git: ignore CVE-2022-41953
Date: Mon, 20 Feb 2023 12:20:15 -1000
Message-Id: <dfb042a6159d128aa4ee8d899c447cf33a2be7ae.1676931497.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676931497.git.steve@sakoman.com>
References: <cover.1676931497.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 22:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177468

From: Ross Burton <ross.burton@arm.com>

This is specific to Git-for-Windows.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c8849af809e0213d43e18e5d01067eeeb61b330d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/git.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index d707f25456..ed6308ea2d 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -23,6 +23,8 @@ CVE_PRODUCT = "git-scm:git"
 # in mirrored git repos. Most OE users wouldn't build the docs and
 # we don't see this as a major issue for our general users/usecases.
 CVE_CHECK_WHITELIST += "CVE-2022-24975"
+# This is specific to Git-for-Windows
+CVE_CHECK_WHITELIST += "CVE-2022-41953"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[cvsserver] = ""
-- 
2.34.1



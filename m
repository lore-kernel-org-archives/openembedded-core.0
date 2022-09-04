Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19277ECAAD3
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 06:32:34 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.11019.1662273147305399615
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Sep 2022 23:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A8bXxD9l;
 spf=pass (domain: gmail.com, ip: 209.85.219.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 193so8692926ybc.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Sep 2022 23:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=GrdUNMI3/LT/6mCkkXmhD1o+5fVQG8NGN08E8zHVbIc=;
        b=A8bXxD9lXYiExgTEkYr1wJbFk1BcpTbah2gzsXnwLeBJWZ6niCikWmir+lEtIUEBlj
         gGdr0N86choTxNLc6nA7dohEVlaDi4pqdry8oXCqTggLRRIYz8RR9QSgKml8wXBDO1O1
         kMYbfhT/8qD2xAxIU+hqkPNR8egd47bSQLLs5+FNRH++Jd6e7ZvOHNS4TTPB1KBs9s98
         vLqvUbOHSmKoGJ1Kvmbgrt9Ql18LDGrOGtoBOpd9L//SDPCLeCWQm2UGNqJZaJlqE6vA
         mf5DOO4zp/qfnRJU/CkbNxFrNPSYOxgxdHco+2CupRUMgGHMr8B64pKdcWenQ5JyN5j9
         iurw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=GrdUNMI3/LT/6mCkkXmhD1o+5fVQG8NGN08E8zHVbIc=;
        b=Ot0rDyLWXKJVHe3AqC7SwOiXMSwYRFgg28iSye2rccjbPF0ZkOTIKGa4e9xQu08X9D
         FrlxqkAFZc0LUQa++mG+HA2RxMOstk3Lcwn9sR1mHI6te8We5NR/yxLkfD9ki5jkpuwV
         dEO/u0jr4VkUUPWA0xYgzpSYBZHleUTp9ib/5vNOGL3qLY+CzR00UC3DmPlact5s4FWA
         eKUZSXympsQXockdRHlatTKsm+LKmHU4DqAa+dY35T7+SGT0/gopNPqkG3/9dIBbCjD/
         gPgUefI5LMk1blA/Og/1Yec5I3obCzu6rJBHyLHLBS5CtOWemBhHoVPB69hUh3PxFqxg
         Uyhw==
X-Gm-Message-State: ACgBeo2490aLO8eUeSpfFhIu0eYRNx/bhALXtsQR3nAs4XYbDPDOA9fL
	Ta8SrQMup2XvLk14QfPe7b40x0SKhOJIhA24O0k=
X-Google-Smtp-Source: 
 AA6agR5SLd2KoxvXgNjVnj8m9rbW4Si2CQuwIY6EnFMh8ueVP6McoM3o4oxdSODNOQZU+TtUY4jEunasQS9KbWdKtQc=
X-Received: by 2002:a25:b986:0:b0:671:a73:1ea6 with SMTP id
 r6-20020a25b986000000b006710a731ea6mr27629141ybg.405.1662273146120; Sat, 03
 Sep 2022 23:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220904052928.33120-1-f_l_k@t-online.de>
In-Reply-To: <20220904052928.33120-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Sep 2022 23:32:00 -0700
Message-ID: 
 <CAMKF1spWYcWTCghheMsUjSvZHZAA0SoH1m3rr56NJ=Jv0_fykQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH] squashfs-tools: build with lzo support
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Sep 2022 06:32:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170274

On Sat, Sep 3, 2022 at 10:30 PM Markus Volk <f_l_k@t-online.de> wrote:
>
> This is e.g. needed to be able to install snaps.
>

I thought lzo was something we wanted to remove like lzop
so is it a hard dependency for snaps ?

> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> index 0a7e0f2a52..4e009d2625 100644
> --- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> @@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
>
>  EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS}"
>
> -PACKAGECONFIG ??= "gzip xz lz4 lzma xattr zstd reproducible"
> +PACKAGECONFIG ??= "gzip xz lzo lz4 lzma xattr zstd reproducible"
>  PACKAGECONFIG[gzip] = "GZIP_SUPPORT=1,GZIP_SUPPORT=0,zlib"
>  PACKAGECONFIG[xz] = "XZ_SUPPORT=1,XZ_SUPPORT=0,xz"
>  PACKAGECONFIG[lzo] = "LZO_SUPPORT=1,LZO_SUPPORT=0,lzo"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170273): https://lists.openembedded.org/g/openembedded-core/message/170273
> Mute This Topic: https://lists.openembedded.org/mt/93453623/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


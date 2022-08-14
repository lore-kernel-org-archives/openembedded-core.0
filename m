Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DDBC25B06
	for <webhook@archiver.kernel.org>; Sun, 14 Aug 2022 15:39:45 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.6195.1660491582700399755
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 08:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l7OyKJNv;
 spf=pass (domain: gmail.com, ip: 209.85.208.169,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id s9so5474394ljs.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 08:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=sRzuSNx9ITnFKYDlY29ltfmA+QCkq3rlOl/f2u61Sxg=;
        b=l7OyKJNv8RhZuGzg5izN6M93Wclr28du9AOllITKbdDTX1TqLnRYN8kfgtMZMCl/i5
         5TRZ2ZPxlL+MaOZ3tplSAZ2gL5K4cGVM9WgPTYPaK4nI6cZRhVXj4KjHKlNwQBHGpK7t
         LzsTS7oE+C6xEAXB4uDDRDtWXgexpSnPFG9J35qRDX5wQjtwab+mZ2pGFsHcaZI3y5Vo
         y6desfMGTxpfuvIefGIOgwKhHAJWQ1bs/5L1H2NPp96rg/I5Y2/9d051CrcSqQMmMkyo
         LGloK1ionr6YtXEGIoWPTBBVUa72FRFMGvCoSxkEz1l2zyNFR3Pb2xLMflU61vdOJAtQ
         BQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=sRzuSNx9ITnFKYDlY29ltfmA+QCkq3rlOl/f2u61Sxg=;
        b=t+vlysiQI6uEZ0tmN3YSewGDZ7eullSbrs2NjOH5vw0eFi71IeHq66QUNZQQahQJjJ
         Vign6k2mNRLj5ijw045b2Qn5qMuXZa7NP1U5wmIUbfH81kHqrgehaYX70z0SXlizuzPu
         IO+DJbNq+HFwe4ZWcHbOFVW47Yf37ISHMkuFu948dnkoCP0IA9gHiaZC8TUlAzon0heI
         CHq0i0WtK+acTV42cvz3QQTnjDAkAZ35LNmik3Iu7Nykwh/xXP7gAkbfFe2sOTe3xash
         fhfzX0h1djk7napDkdC6S88a6IV7hQ7mK02SOby/VDu2PXqslad4sUKmIG7ILPXnktm7
         MWlA==
X-Gm-Message-State: ACgBeo1RWOv1xqEyjecAklMWhtOQwee8kD+HvBcacZCxje6++93M1oXd
	NId/Z+pQq86ABQptO0VeRa7+ajZakJEHD3cNj10=
X-Google-Smtp-Source: 
 AA6agR7LfoRPlP+mERAlEPn3Pq5Hmk8LZev9tAqbShi5JSrE+17sNg3xFmsELryzYKLctsBHpuVit5n52Ywxe3333kQ=
X-Received: by 2002:a05:651c:2120:b0:25e:5145:38b0 with SMTP id
 a32-20020a05651c212000b0025e514538b0mr3899000ljq.191.1660491580435; Sun, 14
 Aug 2022 08:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220814151802.9877-1-kai.kang@windriver.com>
In-Reply-To: <20220814151802.9877-1-kai.kang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 14 Aug 2022 17:39:29 +0200
Message-ID: 
 <CANNYZj9rK3fycg6S0yumZrM+L0wNbQgOA1h_2b0bMZehaou=Ww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] packagegroup-self-hosted: update for strace
To: kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Aug 2022 15:39:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169325

Some information or links about how it is incompatible would be
appreciated. Can it be made compatible instead?

Alex

On Sun, 14 Aug 2022 at 17:18, kai <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> strace has been set imcompatible with riscv32, so update in
> packagegroup-self-hosted.bb accordingly.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> index 772b86b39a..a1b0ee2883 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> @@ -98,11 +98,14 @@ RDEPENDS:packagegroup-self-hosted-sdk:append:libc-glibc = "\
>      glibc-utils \
>      rpcsvc-proto \
>      "
> +
> +STRACE = "strace"
> +STRACE:riscv32 = ""
>  RDEPENDS:packagegroup-self-hosted-debug = " \
>      gdb \
>      gdbserver \
>      rsync \
> -    strace \
> +    ${STRACE} \
>      tcf-agent"
>
>
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169324): https://lists.openembedded.org/g/openembedded-core/message/169324
> Mute This Topic: https://lists.openembedded.org/mt/93017686/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


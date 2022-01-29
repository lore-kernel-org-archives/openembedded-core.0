Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97867C433F5
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 15:20:54 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.6954.1643469653265236396
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jan 2022 07:20:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=klL/ltjr;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.43,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f43.google.com with SMTP id u18so16524512edt.6
        for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jan 2022 07:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZW7BLlQEnzCViCBUFCaSyiLOKt9J62XfriIiqBTeiWk=;
        b=klL/ltjrhd1CsM7uQxJF4cGC4yQGiKWItNQxeYHUFYyP4GdtkrthSkQ7+bk2mti4rL
         ON/v3mwO/81I+e1l6tSQ6KwzlGxbdzX0/aGfCoS3DMEJ3pJFNnnaj1ylfoJMvAodDrJo
         fbQdCBKSWtAMhCcHhrD2SQSk1Az+tjpeNJNpG6KH2VFC27/1ciPbLMSAJYBTLII8L+8S
         pRFSUcwDFi8RWh5hbotFFr1bBQWXO71k64vYRLCuien14pjv+PmWUyXJrN6C16Z7gDhC
         i0c7YRL0pcdpTL1/PkbBY++0gdGfK1HM0hDlkEEqrm8+NeikaM3SNbqCzMJ/sFH+uZXK
         26IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZW7BLlQEnzCViCBUFCaSyiLOKt9J62XfriIiqBTeiWk=;
        b=aEPRc38wzQ+O5f6At7xnDLzXILzqOCz9v3NAv1CIydtT/MKClvbIxg1q4jhgDMRakf
         6PWSleBm8KD8o9cXVYeXmPsWS2m0MfwdZbEHfz9Ze9JFtfuBrn2pjc+s69ftnjWBAZ4n
         WLDNhaZ0hhF1esChSoNITgFgaF3iSUaa/5HP/lfeTjFVEA8FmBrYnk+OAr9c6r7YHbYp
         Hl/RdmkmUfTfeRcAhOlCfqaaMFSVFTy56l/f3iFn2xKTcpHIY5IDiesOXK8uiAX8ONmG
         Kut27y6K632M8T1iiEzQwUwpj11iRWoR/nylr39OJQEEd2HcOaIySnsOlAICaEUYfd0f
         m1KQ==
X-Gm-Message-State: AOAM533tAe+Xa/MclcSNj9v2t+T0Tr5kbKPkrzIPiLCG6o3xnvQL6jXf
	G3WsSCbdJP4bz8Enf9fk0rJA4Jyl/cEcSvinYFoTOg==
X-Google-Smtp-Source: 
 ABdhPJyn5MnJ8Lfe3zp6QkqSvp80dkxDNE5BL53RHRXeGqhb5J8Xe+OkcbTOqZpNAtZtc7WbzDZ4fSfVUS2Y5ImMQAI=
X-Received: by 2002:a05:6402:1d49:: with SMTP id
 dz9mr13087506edb.238.1643469651286;
 Sat, 29 Jan 2022 07:20:51 -0800 (PST)
MIME-Version: 1.0
References: <20220124171609.20282-1-nishaparrakat@gmail.com>
In-Reply-To: <20220124171609.20282-1-nishaparrakat@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sat, 29 Jan 2022 05:20:40 -1000
Message-ID: 
 <CAOSpxdbZhtqPNpPyqbk1KHD--sqDzLK83=hEo-Rtn7m2AjZx9A@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH 1/6] lsof: correct LICENSE
To: Nisha Parrakat <nishaparrakat@gmail.com>
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com,
	Ross Burton <ross@burtonini.com>, Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jan 2022 15:20:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161100

On Mon, Jan 24, 2022 at 7:16 AM Nisha Parrakat <nishaparrakat@gmail.com> wrote:
>
> From: Ross Burton <ross@burtonini.com>
>
> The lsof LICENSE is superficially BSD-like, but it isn't BSD.  Now that
> we have the full SPDX license set in oe-core, use Spencer-94.

Results in following warning:

WARNING: build-appliance-image-15.0.0-r0 do_rootfs: The license listed
Spencer-94 was not in the licenses collected for recipe lsof

Steve
>
> (From OE-Core rev: 5c1d61d1d4dfacb643a366285c0392e6a31087ed)
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
> ---
>  meta/recipes-extended/lsof/lsof_4.91.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/lsof/lsof_4.91.bb b/meta/recipes-extended/lsof/lsof_4.91.bb
> index b3adfd57af..7c85bf23fc 100644
> --- a/meta/recipes-extended/lsof/lsof_4.91.bb
> +++ b/meta/recipes-extended/lsof/lsof_4.91.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Lsof is a Unix-specific diagnostic tool. \
>  Its name stands for LiSt Open Files, and it does just that."
>  HOMEPAGE = "http://people.freebsd.org/~abe/"
>  SECTION = "devel"
> -LICENSE = "BSD"
> +LICENSE = "Spencer-94"
>  LIC_FILES_CHKSUM = "file://00README;beginline=645;endline=679;md5=964df275d26429ba3b39dbb9f205172a"
>
>  # Upstream lsof releases are hosted on an ftp server which times out download
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160883): https://lists.openembedded.org/g/openembedded-core/message/160883
> Mute This Topic: https://lists.openembedded.org/mt/88651664/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88737C54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 09:39:07 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.67607.1673257142849264119
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 01:39:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qLR0zBjH;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id g14so8243081ljh.10
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 01:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RTC+8zktKx3b/wGVguXRl76SmDObBWwPzP2S+B0cAKI=;
        b=qLR0zBjHQUwfLjOaiGRkzvlRzmHwCY0smkR3QNOn58B82vatOsQT8u2URUtW/9h8oc
         bonoTNI9ScEWLgIgD+Re+9l847OO8Q6PWd/P8ahITzGhen244+M6k7YtN38t+VHvZ1bY
         mbZCSJttWVltYKw3i+7mVSJAX0zDnROiVm56wueXttR9aSzGmvQQm9J1u1cFDTY14pUH
         EcoOFnP6nCvkrB4VihQaQZM6qXOtdegegHpIrwdRMEhEMmbDHdduGccoiPeZ/2h4qzXX
         K0g6QWUvuTYvahU4MugNZ4MwLnQQE1KOh/khwfH+seopL0Hk01Pwc2ctMyswZ0prhIrq
         pUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTC+8zktKx3b/wGVguXRl76SmDObBWwPzP2S+B0cAKI=;
        b=pz92nlXjj4tkznQOn1PPAAXjuHQkh6apa2TA0PCkJbNfy2IYz65H2mFJkN5LykaTtn
         v+Hj4B5ITUVQ1fM5AHUI6bvD2eX3jYvUxomYeDPyr/xKA4B+OdYGBjhJbXkRq/bDa1Pz
         BWTybAKYhmwwJcfGilryY11MlvX7wz2WAHu8OPp6wCeSPsnNpxNTVvsr6KWy/sfPaArC
         e0mMYiWCPPB+iyT/Ko1wrqpbYsF/beY/sPrwHTIFNpfgJ/EubAYN1zk5NtcFnuxrIOgZ
         KH3VTPZERjQDTXgMtShl+kV7gOCjkYwC5kxcklILHfXiWbnJPTc+cVo14nN+ojMOsMxK
         +S2g==
X-Gm-Message-State: AFqh2kqszTqEG5qKsiXx2crDFXoNTzd47kHY/0Q0tP1cwwzsbpEMnbny
	3uEki+xpG3SXowSnNB2DK/KuziuYcLvTkRzSo400/5mADeY=
X-Google-Smtp-Source: AMrXdXvdxinhH3QjI3WUnH2pwhGQ0iw7w3fLmlvJK4KpciSaYjtQMViOs4sDkVEUrhttVuDFszECs0UcPdl5hTmp2Wk=
X-Received: by 2002:a05:651c:1426:b0:27f:dea6:3d2a with SMTP id
 u38-20020a05651c142600b0027fdea63d2amr2927807lje.45.1673257141122; Mon, 09
 Jan 2023 01:39:01 -0800 (PST)
MIME-Version: 1.0
References: <20230109013924.22185-1-karn.jye.lau@intel.com>
In-Reply-To: <20230109013924.22185-1-karn.jye.lau@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Jan 2023 10:38:49 +0100
Message-ID: <CANNYZj9faTYL2btddhF0A-WFHJAwKu0nqf07GJcGL+bXdsftUA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] freetype:update mirror site for package download.
To: karn.jye.lau@intel.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 09:39:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175677

Can you show the package fetching issues you are having please?
Freetype is still where it was, as far as I see:

https://download.savannah.nongnu.org/releases/freetype/

Alex

On Mon, 9 Jan 2023 at 02:40, <karn.jye.lau@intel.com> wrote:
>
> From: KARN JYE LAU <karn.jye.lau@intel.com>
>
> update SAVANNAH_NONGNU_MIRROR to SAVANNAH_GNU_MIRROR
> to resolve package fetching issues.
>
> Signed-off-by: KARN JYE LAU <karn.jye.lau@intel.com>
> ---
>  meta/recipes-graphics/freetype/freetype_2.12.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/freetype/freetype_2.12.1.bb b/meta/recipes-graphics/freetype/freetype_2.12.1.bb
> index 46c6182630..5e7f916e21 100644
> --- a/meta/recipes-graphics/freetype/freetype_2.12.1.bb
> +++ b/meta/recipes-graphics/freetype/freetype_2.12.1.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=a5927784d823d443c6cae55701d01553 \
>                      file://docs/FTL.TXT;md5=9f37b4e6afa3fef9dba8932b16bd3f97 \
>                      file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"
>
> -SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz"
> +SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.xz"
>  SRC_URI[sha256sum] = "4766f20157cc4cf0cd292f80bf917f92d1c439b243ac3018debf6b9140c41a7f"
>
>  UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175657): https://lists.openembedded.org/g/openembedded-core/message/175657
> Mute This Topic: https://lists.openembedded.org/mt/96144063/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


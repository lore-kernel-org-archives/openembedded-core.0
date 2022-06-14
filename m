Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5154AC43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 09:32:34 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web09.4101.1655199149404405156
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 02:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f0qEaUpO;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id j20so9049534ljg.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 02:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QsT2tADp91+rSks/Aknem1FoLHzPfJFYSnXrsW/D5zw=;
        b=f0qEaUpOv9/hsYirtlr1pPCwECNRWFji19B2GOIxUm5pMkiWYU1lKGnJ6gj68Bt7yO
         4be2c3Jj6ZOD3eYJFWL+u/SLYdNET6zBfcMCPGDpQdARHC8grtvIfse25jf4GnRNJPEL
         kjlI7il9ubBKZoDPSJipII6ntD+0Qf8Dxm8Zgju38kdn3UlVdzPZnlLNFYqDb14S2zZ/
         P28/wUsMCZ7xK3RmkYBF1bE545TEf3svUmAm44rSSyM9oN4xWVsiW0Zlh5WitVUFJhLF
         DZubGmWjWtQBLQqA5m2BfChKvEY2m9p8CcS8tYDVJfrP6svcWY4n821wpq1JQqOkbgw0
         mUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QsT2tADp91+rSks/Aknem1FoLHzPfJFYSnXrsW/D5zw=;
        b=VCfxbKp3Va0CjENj6EGD803QIm5NYgN7ShC6nr1/Mxi3CWQ1Y75FqJV/sMX+LQZQC4
         l5FhsdACGT3w4sffNRCKPkiojZYY90t1GoXOWhFenSHSM7INd4YzmTjTe82kecrfYr04
         jGxKDBGtY5sfZvWE5rc93EveZu10XYTfJDX13sVvjYZ6470/mizgtfjaOo8V/eZ0pHiY
         l7gjnhcHWGjw8fjzbHga9X51CLKkVjpPP8CRsOfmjcgbY+Ouj1s4WGf0cWhzINgBcy5B
         1WrZLR7VFQtGceJHYXALx+8xC5RcbmsGEjJfKzpxeDeZYvgvUVZO0u6C8Bp79CEElgFI
         6duw==
X-Gm-Message-State: AJIora+qRR1sKKRwFi4UPV78zAKREdBNYgXqTl0CU/sK9TT6ukDDcat7
	SWJdw12sZSOBtji23pwgB9LubHCGGO2Y1rIqzuU=
X-Google-Smtp-Source: 
 AGRyM1vL2vlr+5BHvekq5SDVUNEcTFzwpfPB0KlbnnqRsPy8Mbw9C2ypOGHr9em9xJE7pEcYdSyxsjgG37HhnXtrMU4=
X-Received: by 2002:a2e:2ac1:0:b0:255:6d35:6726 with SMTP id
 q184-20020a2e2ac1000000b002556d356726mr1960452ljq.41.1655199147315; Tue, 14
 Jun 2022 02:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220614090549.27507-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220614090549.27507-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Jun 2022 11:32:15 +0200
Message-ID: 
 <CANNYZj95pQ0k=E5fy5J75VGGXL==q035hsbcG3SF=ThF8KGGxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vim: Upgrade 8.2.5034 -> 8.2.5083
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 09:32:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166880

I think SRCREV needs to be adjusted?

Alex

On Tue, 14 Jun 2022 at 11:05, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Includes fixes for CVE-2022-1927, CVE-2022-1942.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-support/vim/vim.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
> index b22e8016abb..41bbfd4959c 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -21,7 +21,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
>             file://racefix.patch \
>             "
>
> -PV .= ".5034"
> +PV .= ".5083"
>  SRCREV = "5a6ec10cc80ab02eeff644ab19b82312630ea855"
>
>  # Remove when 8.3 is out
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166879): https://lists.openembedded.org/g/openembedded-core/message/166879
> Mute This Topic: https://lists.openembedded.org/mt/91745309/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5281FC38145
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 00:10:56 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.3006.1662595850578253283
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 17:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Al3Dr9Yr;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d12so16169847plr.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 17:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=cUqr2GqB6UB8Oj7ZglaLJiLGRDsLkpXf4DJsn/Q4b8Y=;
        b=Al3Dr9Yrw4gpevj70ofivpBv0Fc+mCBZnCydgWVWlptmad7unJGcJQegm/IlRhwzbM
         iIAYWaH1jF9BEkeJqMolRRMrQQfnDvTwZnMY+Gf1v2nKiVFS0QDvzIax4DBm+kgl1OMj
         WJwrnz7ynJDZ2FMc91kznbL0WbnUsTnRekr6e9nFMyvHFFVrdVIGt+CbWKC8PlAUQ/ai
         r3Z5tRXRfK0YjPdio+ctf9kxT2Jenc8xhZ5DWKf2SwYtqAwn31z8sG0Q1STwMz/n/wmK
         ltxO9Pi5DAR/EvISRwPCnaPwfZXwWaLaJ/an1rB2F1prJD1fdKkMkMjny3AuYdZaeoEz
         nPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=cUqr2GqB6UB8Oj7ZglaLJiLGRDsLkpXf4DJsn/Q4b8Y=;
        b=NHG2Fv0vLs+WMSniqzwmvzB4Oc9zyhHjIhyxgL1OEZYvImyn7I0Ta1K4nnxQ8G9ceP
         kr5Hai5loE+pbYS99oibcp1BmlMv7Tixix9O/VG1fR5CR5LvWzuHMN2XTDWRKer7LL/a
         xkFqfk+PHlBeEkoiikrD531vgFdPk+2hKXZ7QAZxKZ0238XFygKtNVjSGq9sqaLf2k34
         2wia1cRI33+F6x2sHlP/4MxrBOEFlk9LBZBpAI+MVJX/P6s8kgMJHjk7Gl5JtvSll2RB
         s0GTxoKTazMV8VJ8pCrmu3B8RbyhznOMIQwsybztpQLDEhQHYgT0y/NzVCSMWXyr/buP
         60PQ==
X-Gm-Message-State: ACgBeo1tkYg4K/XvmRUIIuWc2D5HG9BCpnkpBwPFgw40uS9MjoY0eJC3
	tPdoxLs4XHtlCcHBy4Ij5oYe5rJrOMcIIuXzokA=
X-Google-Smtp-Source: 
 AA6agR5nDVEfShGrojxGJFaifbGtN3JWTKrhJMd3yzkOYtp7krP2f5DfV/TMtdRQFclZgWuxdMl6qSCB4xB+oqMjNHc=
X-Received: by 2002:a17:90b:2745:b0:1fb:1666:80f6 with SMTP id
 qi5-20020a17090b274500b001fb166680f6mr1101042pjb.103.1662595849859; Wed, 07
 Sep 2022 17:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220907220535.3017588-1-raj.khem@gmail.com>
In-Reply-To: <20220907220535.3017588-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Sep 2022 20:10:38 -0400
Message-ID: 
 <CADkTA4N9Ls_sVi_Csj4H6+i0O81a2kje+roWd5NqY6b-3xzM-w@mail.gmail.com>
Subject: Re: [PATCH] linux-yocto: Enable mdio for qemu
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 00:10:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170435

On Wed, Sep 7, 2022 at 6:05 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> There are package like mdio-netlink in meta-oe which need this feature
> to be available, it has started to fail with 5.19

Fine with me!

Bruce

>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto_5.19.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
> index 0ff28aa952..e96395d1bb 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
> @@ -56,7 +56,7 @@ COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qe
>  # Functionality flags
>  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
>  KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
> -KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
> +KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc cfg/net/mdio.scc"
>  KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
> --
> 2.37.3
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


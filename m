Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB78C77B60
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 12:24:38 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web11.6376.1682511872943372795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 05:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PfwYggs0;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-763c343b716so84719239f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 05:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682511872; x=1685103872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLu6B7X3YhcBTCd4Ve1nyKInw2aJSz29cAF4kj8PQ1Y=;
        b=PfwYggs0if2+UuRGoOwfZG90lXZDH81N4gFANTT4XYh1LgTgpexVJx+x6Frb9whjAY
         gU+9sh+fQfUYmemFSx85Bri63uItrGOU0Z5JJY80nJZbUHLZxSD0my5KMcipUQWuy10Y
         /kyAe6HYFkQMU2IzztjY7BkuLGEDIJ195Tw+RUjah4aJMtpH3Vn6cKYyeEMjagSf01LF
         kRu/Yi/uO1r+CQcmptjkTMZ2TLxb20+/yfO7Ca3Sw2A2j/Tk49PezNyR/cTa6jhpQDN8
         Vb10d5uGJg12icjeMFUNbQ6zMS769ywTAODgcnKEGZC6RyjG1stQ+1y3lp2+dC646mGa
         09Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682511872; x=1685103872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLu6B7X3YhcBTCd4Ve1nyKInw2aJSz29cAF4kj8PQ1Y=;
        b=lo+PbzOnLyeVN3Zor50DsxAk3fn87MguQMVor+Hx0TkkKN5HgP89AUSf6alezJ2FtP
         dmFPSZ3nYlEwNKJfP4OvWWlEV6hQ6baE63V1SLlnyOnTMtavR2+oa6OECiKSVjPiLmMm
         S3mQbrOOBrb6pVv2OXKAIzeWyUj9oaFuEH2SN2+yVs2MD3SOF1n68hO3d1YMkuAWoBlU
         FuBWJ/8RTHKxBecEaeRBOeNSWlRTC2kxcgUQUsIZ6ohPuuP79zUcUoUWtSQ46pVTn+B0
         ACgrGz/7OSeetf0YvSdldr13PGNUtBVQ3KteLyzpTXtrl+MYNZyCkCUJUsr4Ux+W0JrM
         D0ag==
X-Gm-Message-State: AAQBX9eCLr0LoxHpcnJsiKpSJE1VZR4Fg0/IsdqGrEkxX5NWa+R36LcT
	iJBldkaTgfxcqmo6hK8yPablNVTLHmXDcdlI4bM=
X-Google-Smtp-Source: AKy350YGcuutM4AUN9linniPr+bsn/T3LEtzdDKDrYqXPRRphfLnF0TJAieS+jn00Olu8/G9EHzm82ff1B1F1mL+8EM=
X-Received: by 2002:a92:b06:0:b0:326:2d5b:afef with SMTP id
 b6-20020a920b06000000b003262d5bafefmr9117038ilf.16.1682511871907; Wed, 26 Apr
 2023 05:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230425203116.12981-1-alex.kiernan@gmail.com> <20230426142016.710804e3@booty>
In-Reply-To: <20230426142016.710804e3@booty>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 26 Apr 2023 13:24:20 +0100
Message-ID: <CAO5Uq5QVmuZWK75=uugcG+0CGrx1XF1CWizRVqPxZbZQrZSQfg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] rust: Upgrade 1.68.2 -> 1.69.0
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 12:24:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180440

On Wed, Apr 26, 2023 at 1:20=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hello Alex,
>
> On Tue, 25 Apr 2023 21:31:15 +0100
> "Alex Kiernan" <alex.kiernan@gmail.com> wrote:
>
> > Rebase patches, drop crossbeam_atomic is this fully merged upstream.
> >
> > https://blog.rust-lang.org/2023/04/20/Rust-1.69.0.html
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>
> musl-qemu AB tests fail with this patch:
>
> ERROR: rust-1.69.0-r0 do_install: ExecutionError('/home/pokybuild/yocto-w=
orker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/rust/1.69.=
0-r0/temp/run.do_install.498791', 1, None, None)
> | error: unused import: `libc::fstatat64`
> | error: could not compile `std` due to previous error
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/7013/st=
eps/11/logs/stdio
>

Thanks, will have a look.

--=20
Alex Kiernan


Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4AF5C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 15:53:31 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.104334.1701791608905425657
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 07:53:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sgdCJNpI;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.54, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a1b75f59a12so292652466b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 07:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701791607; x=1702396407; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiFWd4PSa7O70VGJRu5HLQIjq1CUvNcrEC3M+36N8ig=;
        b=sgdCJNpIj4AK9UYr7f9X7CMD0T/ci0rka6emFIxxoeFaIyQWdSLs1Vi5ZatXABHrFh
         2AnOuoT6x59myhg1llXt7ux19Squ2RQZeEV1prota4SxDpU/Gu9kELcLk4mf1UOTCwb/
         dp6y5t/rkU8EVknA0RkXZROPWQu2goqEqfpHeKP0X33SXOzLn0fT2wvNMwCZiv+lBG8F
         fILY3AWdLrCSGRmmryQJGAB6TAMrG8iR0aWWaXgBQygqbQ1giMKqu43H8WtWIsLOM/LA
         1B2UAoy9Oaynrnt//YJyKwZjwgFF3yjn9b4+TvJtUfospS87lzIdrDhoeQCgSYV2r+62
         Drrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701791607; x=1702396407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiFWd4PSa7O70VGJRu5HLQIjq1CUvNcrEC3M+36N8ig=;
        b=M/lkczY8Py0m6PwOD3BQ853FBCYimplCSrULse9Z2HCl8xJkkH46/m7Q5tQoOgycOw
         SZ2LjvcR5HbF9Ollcckpk5TozPVZx9htas+0cviz6/et+W+mCL+B/FhCWZKKLDXa3PUh
         T76bp8xkBASiWnvtRURiSZXsSjpBUcOqGx91FxtClJnL0GSBBLNvK1hvidFKHPMPO6An
         upvuo6mIrkynqOsnShM5LvJMDMwu+763HRNkgBsBqooSz34zJ+y4qRo5RVLUo3qjC6c1
         QTbLyxBZuH9Cr8zvHTRd3kxf3PdQ7YVFnO4z/KVEHXfrf2Lq3H7YcSuf0QehBGf0pspz
         8iqg==
X-Gm-Message-State: AOJu0YzTXSaCNIoLFhboxF95SH9lyRSw2PXkDTKi0q+v/Iurstgkoefe
	4GfY8NKfE3GlPj38lC4w4uW365gQshjosLncwuSE1A==
X-Google-Smtp-Source: AGHT+IG+6G/V+lzURtKn8E6zmmmM29XujRKfMelLfFy3drpcQpwVQMhZ9XysLpbOaEc4J45Vyfube8zgRPB6TQdMi/0=
X-Received: by 2002:a17:906:1099:b0:a1a:582b:8c99 with SMTP id
 u25-20020a170906109900b00a1a582b8c99mr1752602eju.234.1701791607177; Tue, 05
 Dec 2023 07:53:27 -0800 (PST)
MIME-Version: 1.0
References: <20231205044036.4163615-1-bruce.ashfield@gmail.com>
In-Reply-To: <20231205044036.4163615-1-bruce.ashfield@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 5 Dec 2023 05:53:16 -1000
Message-ID: <CAOSpxdZDYpzoaK01uMKmgzjPqm=Tup2EZO2+w39DSvz3HY1Vrg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 0/4] linux-yocto: -stable updates
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 15:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191845

On Mon, Dec 4, 2023 at 6:40=E2=80=AFPM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Steve,
>
> Much like my last pull request to Richard, this has been
> generated from a newly provisioned machine after my old machine
> of 10 years had a disk failure.
>
> Let me know if you have any issues with this, and I'll debug
> what I missed when configuring the new box.

Hi Bruce,

I'm also seeing an issue with 5.15.141.

Local testing fails with:

WARNING: linux-yocto-5.15.141+gitAUTOINC+92bd0a656f_54a3472506-r0
do_fetch: Failed to fetch URL
git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;bran=
ch=3Dyocto-5.15;destsuffix=3Dkernel-meta,
attempting MIRRORS if available
ERROR: linux-yocto-5.15.141+gitAUTOINC+92bd0a656f_54a3472506-r0
do_fetch: Fetcher failure: Unable to find revision
92bd0a656f0f9db955fb53c52be71cce9296bdb2 in branch yocto-5.15 even
from upstream
ERROR: linux-yocto-5.15.141+gitAUTOINC+92bd0a656f_54a3472506-r0
do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from
any source.', 'git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;n=
ame=3Dmeta;branch=3Dyocto-5.15;destsuffix=3Dkernel-meta')
ERROR: Logfile of failure stored in:
/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/qemux86_64-poky-li=
nux/linux-yocto/5.15.141+gitAUTOINC+92bd0a656f_54a3472506-r0/temp/log.do_fe=
tch.3515498

Steve

>
> Bruce
>
> Bruce Ashfield (4):
>   linux-yocto/5.10: update to v5.10.198
>   linux-yocto/5.10: update to v5.10.200
>   linux-yocto/5.10: update to v5.10.202
>   linux-yocto/5.15: update to v5.15.141
>
>  .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
>  .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
>  .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
>  .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
>  meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++++---------
>  meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
>  6 files changed, 38 insertions(+), 38 deletions(-)
>
> --
> 2.39.2
>


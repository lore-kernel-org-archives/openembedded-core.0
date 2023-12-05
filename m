Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 863ECC4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 21:33:32 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.10797.1701812004337588124
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 13:33:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lCZ81Mzf;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.51, mailfrom: steve@sakoman.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50bfe99b6edso2574329e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 13:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701812002; x=1702416802; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uk6+axVRnlAvn0WFgl6KKZiwk0Po90tvub2bUIVMleM=;
        b=lCZ81MzfF8vYGk4ZkKDiK6pEEiTzqMof9XCUWRdGwQKjM9BCHSbIanEa4c3Cw50C7v
         RIdsaWaPazmWWcZIOxiFLWSdGEf4+EiDnHp36C2euBRjdvTX1onf/I1aj5VZ9D6xkgop
         9ZjmBNRkMGBexgx0Wz3fzJHJIDyQbr+rNOmAaV89653d4QtYg3vmfa02+wUQCdOkMSy1
         0Sn0GkEaITtH6e+fOfIeZjnMgHYXwuuED9iJttDcukEZjAa5oEOhsaJklFIK9MC/Mbv2
         ot2+g0UJ9I1hZNG1D2QB1HRDAcK4hP8ROcRqQGxmOCN/1dVB4AWi9NM7NRo2fy7lg0+b
         C9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701812002; x=1702416802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uk6+axVRnlAvn0WFgl6KKZiwk0Po90tvub2bUIVMleM=;
        b=KDWIJIMrCcQfZj1ky/LFUqshEgKweUoTK+0nq3t/z0sUbkpuNf1SU+2nTiiU5Xlo/k
         0ndnGe2wUeMOyw6hsFfTlVKT8YRCxg72P9H24P86Z0/iCGkrBgBWS2XPdc+pguySiklj
         q69w9x5paTQQUAPaWTeflp/XFJ4W8HZNWKD0Gk9+8JEocog5pXw96Rn4Gl2cBgpHq+G/
         YsskmZEpCI3Tf62oZbIZaKpEjnRtIzX0QfdD4+avhFT8g6huyK6iCln6bgnciackLrIa
         AMAJhnLGCE0hIfeqfsq9EcBKRzubLzK6YablA4RiGnIpg3neZWE9NXXuO80URnxdQUAf
         ampg==
X-Gm-Message-State: AOJu0YxaImtq0ud9/uVxxOzCTyHaMiB60Lo4KsE8pQKI0Oejyv0K3vqw
	1CXEMyjyYaZ36hYNoFvtGj9KHgZ99iOs8jgcFdQr5g==
X-Google-Smtp-Source: AGHT+IFoFnC++UeDqzwxg0OuYDbH+pyImKEIE2fvIa+8Rms6ueswPC/+oA0mVj0tKPQc6fh/2UOZSKMlGVVGsrRI6aw=
X-Received: by 2002:a05:651c:884:b0:2ca:20ce:839e with SMTP id
 d4-20020a05651c088400b002ca20ce839emr40624ljq.46.1701812002156; Tue, 05 Dec
 2023 13:33:22 -0800 (PST)
MIME-Version: 1.0
References: <20231205044036.4163615-1-bruce.ashfield@gmail.com>
 <CAOSpxdZDYpzoaK01uMKmgzjPqm=Tup2EZO2+w39DSvz3HY1Vrg@mail.gmail.com> <ZW9lyDoHaQiG1VZf@gmail.com>
In-Reply-To: <ZW9lyDoHaQiG1VZf@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 5 Dec 2023 11:33:11 -1000
Message-ID: <CAOSpxdaf+KgqZh6n0sDS9OENDpoiTEmbsgkyaFouAuvgjFhF1w@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 0/4] linux-yocto: -stable updates
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 21:33:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191863

On Tue, Dec 5, 2023 at 8:02=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmail=
.com> wrote:
>
> In message: Re: [OE-core][kirkstone 0/4] linux-yocto: -stable updates
> on 05/12/2023 Steve Sakoman wrote:
>
> > On Mon, Dec 4, 2023 at 6:40=E2=80=AFPM <bruce.ashfield@gmail.com> wrote=
:
> > >
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Steve,
> > >
> > > Much like my last pull request to Richard, this has been
> > > generated from a newly provisioned machine after my old machine
> > > of 10 years had a disk failure.
> > >
> > > Let me know if you have any issues with this, and I'll debug
> > > what I missed when configuring the new box.
> >
> > Hi Bruce,
> >
> > I'm also seeing an issue with 5.15.141.
> >
> > Local testing fails with:
> >
> > WARNING: linux-yocto-5.15.141+gitAUTOINC+92bd0a656f_54a3472506-r0
> > do_fetch: Failed to fetch URL
> > git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;=
branch=3Dyocto-5.15;destsuffix=3Dkernel-meta,
> > attempting MIRRORS if available
> > ERROR: linux-yocto-5.15.141+gitAUTOINC+92bd0a656f_54a3472506-r0
> > do_fetch: Fetcher failure: Unable to find revision
> > 92bd0a656f0f9db955fb53c52be71cce9296bdb2 in branch yocto-5.15 even
> > from upstream
> > ERROR: linux-yocto-5.15.141+gitAUTOINC+92bd0a656f_54a3472506-r0
> > do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from
> > any source.', 'git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkme=
ta;name=3Dmeta;branch=3Dyocto-5.15;destsuffix=3Dkernel-meta')
> > ERROR: Logfile of failure stored in:
> > /home/steve/builds/poky-contrib-kirkstone/build/tmp/work/qemux86_64-pok=
y-linux/linux-yocto/5.15.141+gitAUTOINC+92bd0a656f_54a3472506-r0/temp/log.d=
o_fetch.3515498
>
> This was a repository misconfiguration. Only the current
> branch of the kernel-cache was pushed, where I've always
> had all branches to be pushed by default before.
>
> I've tweaked it, and the revision should be in place now.

Thanks Bruce!  Both dunfell and kirkstone are looking good --
autobuilder hasn't completed yet, but I think we are well past the
kernel build.

Appreciate the quick turnaround!

Steve

> > > Bruce Ashfield (4):
> > >   linux-yocto/5.10: update to v5.10.198
> > >   linux-yocto/5.10: update to v5.10.200
> > >   linux-yocto/5.10: update to v5.10.202
> > >   linux-yocto/5.15: update to v5.15.141
> > >
> > >  .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
> > >  .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
> > >  .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
> > >  .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
> > >  meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++++---------
> > >  meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++--------=
--
> > >  6 files changed, 38 insertions(+), 38 deletions(-)
> > >
> > > --
> > > 2.39.2
> > >


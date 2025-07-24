Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAA1C83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 16:48:29 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.1437.1753375708268823495
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 09:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cYwbAJ6p;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-718425f1172so13590407b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 09:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753375707; x=1753980507; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLQBeYyclyxbdyzrsy7d72PwSowWJ8Cn1llGIl+UHvw=;
        b=cYwbAJ6pnFkpbIuqdZdluJ0z1ufOXWfwYvj46R4v3NMjZqBbsLwoTIe+2DL1+xnirc
         OjJ1VHj6s94W+sq1SdATmt4yK2OZPqprhXt2/MKjs2zMSao4E1uxHFSWT80PD2U6ihv2
         jHsOYe/ZDLq1p+LDm+4jp1rx00/HuNSydyNIbuWtTOZKGkpmSsE79uVARNMOzcgO85yz
         r5AoZ+JZNHoO5SmJxOGguWmrBDDfYpAaLEt7Da05rKjweVCWpzSht5gRZxsasAKiNV6Z
         XJNyomjIbBO1/7nZT9VWyS0trJsAxzVSblLCrhCswlX4IPdkgP1FlnKKctUPdW+Z3Fd+
         KuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753375707; x=1753980507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLQBeYyclyxbdyzrsy7d72PwSowWJ8Cn1llGIl+UHvw=;
        b=qXwHamUyNk8dabvTxuFqV9hcToaKmWOZFmMCdlWBBav7dBVSmJ2zNJk/pnuuC/qcbs
         xHlbLa07c/sgdKbPEetGZGLcXWiOR399HauK8E+ptqqVQcRafuxLa3eRSChhzB4l7OOC
         XqfRIRyvagu5eDZlvA2a/i5vznhV5d5qM15fcIkAY/vw0lfx/9qbGSavJj1RvfEiQbIe
         Q830X2C2mBa+nGpCmPLvp1Bzkrq5JuP+/ZMNYJtZsTOKjTDd8Iq3c934BPJyv7YbiMBY
         SD8ztCi0PwtaQy0plK0Rh+GlCPAUuEGa9cpLL6hBBxCP5IwEf6qjhJA9LiJagiNfQ9fi
         fNdQ==
X-Gm-Message-State: AOJu0Yy5ZD46rF2LikZLOcIgD+CpbP48dDfh4EoWER/bXNnSC+n5vPdt
	FU3FMLAZliKLWvavclzP0vkCHsUVxtKZ+zrUlbUUYoKWWx5JLBm6ETJ7nN/WDKPXpAp416858xn
	B2eo1fzN1uhHGQcfzz2ybQ/UduBLQ+n34t/E/RUY=
X-Gm-Gg: ASbGncuKTVZRzZOxUEw49AXvuEgFu10Ll0spn17lTllnOCG4oD0/BqP5jEdlUttB4lV
	1f6NBFWhzYST+qY9OaF5yh/m7LdW+CWedaLEClAS5OMGM3Mk0c/vLQphvY1YysDkxGI8qT/HanL
	ApdVFNyMIGxoQmmnxRsVFgoopENg86+JmhU++GWDZqYpAJi4m+fP780q7sggm6CvOGMGc5LqsOY
	xpewlFeNo3OPpPbWEyhy6hHxrJ8puFrOo01
X-Google-Smtp-Source: AGHT+IE79GmTpkP1AoysxSfK42tRSBqYIq3Tcks9YBJwnUhsyAS7ISir+uDOMIRYgaDtJtVvNqsIGIv2FrPke83D1VI=
X-Received: by 2002:a05:690c:6f06:b0:716:59a6:2dc5 with SMTP id
 00721157ae682-719b4221f0fmr94539717b3.15.1753375707151; Thu, 24 Jul 2025
 09:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250718151017.3153315-1-ross.burton@arm.com> <CAMKF1so=FcHd4ioR6POqTc7VvK-LAxEpndWZBohomnqKtQtZFA@mail.gmail.com>
 <D04BB559-D95D-4B2A-B69F-BE43CDC4F299@arm.com> <7CE0D337-6DB9-4A95-9D84-C8D71A1480BB@arm.com>
In-Reply-To: <7CE0D337-6DB9-4A95-9D84-C8D71A1480BB@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Jul 2025 09:48:01 -0700
X-Gm-Features: Ac12FXyrVAbbHjl0neKo5pPc-UHKhySuKCDZ0HmhZI0swfcR-ZaIDxmx5qQLTSM
Message-ID: <CAMKF1sqvhxr8cya064-6LV+pmP9g1FgHgjnT7xdfo-J8e0U7bA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/3] cmake: drop CCACHE_COMPILERCHECK
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 16:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220852

On Thu, Jul 24, 2025 at 9:21=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 21 Jul 2025, at 16:20, Ross Burton <Ross.Burton@arm.com> wrote:
> >
> > On 19 Jul 2025, at 02:41, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On Fri, Jul 18, 2025 at 8:10=E2=80=AFAM Ross Burton via lists.openembe=
dded.org
> >> <ross.burton=3Darm.com@lists.openembedded.org> wrote:
> >>>
> >>> This variable controls how ccache determines if the cache is valid or=
 not
> >>> for a given compiler.
> >>>
> >>> By default, ccache looks at the mtime of the compiler binary.
> >>>
> >>
> >> this may become interesting when compiler binary is used from sstate
> >> built on another machine, it might be identical binary
> >> but mtime maybe different.
> >
> > I was having these thoughts after posting too.
> >
> > I _think_ the mtimes are preserved so reused sstate should still be ide=
ntical mtimes.
>
> Confirmed that mtimes are preserved. I just wiped my tmp and the compiler=
 in my eg vim recipe=E2=80=99s sysroot has a mtime of two days ago.
>
> I think this is acceptable behaviour: we=E2=80=99ll rebuild if the compil=
er changes.
>
> Reposting this patch with another one that should be good to go.

Thanks, yeah if mtimes work this will be a good improvement and will
work across clang and gcc both

>
> Ross


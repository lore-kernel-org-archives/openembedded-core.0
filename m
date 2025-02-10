Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 876C4C0219B
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 17:31:01 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.57812.1739208658250086651
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 09:30:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AFCq/+D+;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5fa2685c5c0so2050984eaf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 09:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739208657; x=1739813457; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGld15aKDP3TiOJRtOxKq1j2NttppN3Ts9KMPpegNj4=;
        b=AFCq/+D+4ZIge0zVNWzcR/8a/ZWbG8GGbwPdqk9SixWi1YTG8fx18Z4uOam6wxI8f/
         CLi1WBGBVINrJB5I5YipMyMc2k6slkypSyMzxiAunK4dPdDBTQ+Uy9yd5/mDt03dgLbG
         a42KNcNGLk5ftz+3/0HQX3nEstARAw9yLqFLFj7iLFEHQc+SVrhdsul0+mZ7Tmxbo5T8
         n57qoyAY50RnzQE9MPjuSRzwoXLFkVoqHggBQ/7Zs5FLyC6oa4ajjZDsZYWRdzux4HnB
         OBSubEcVgLDoJDf/KP1UDMjPJZPQK1T+LMuNaa2CCVi6CWBc8i6On/hcACaAr6Sx2xgW
         ZIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739208657; x=1739813457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGld15aKDP3TiOJRtOxKq1j2NttppN3Ts9KMPpegNj4=;
        b=TLvvkHhdzB0WIMqDcp0X2hWxsPYmvTM+UkC8nXqDEGb9Kk/mz9pZ9oG6bLXE91gH4l
         72Smto/rPdJwJvIDCnG6uk1X73Tz5jMRc2e/Kiv3ulCup8lID4EW/hmB9+5V9AocWp/7
         QoLikpQRGm8fX3CMseYKQsG0N54oRZEUmxomOvbk85XD+DaX6GY/zguQ/06iK4PSylwi
         f5KiPFEZZ1W+31a6PM/XelNSSHRoMYSCh9Am4bV36vMwODlZFKmgWaCRMOCvjzi3RprQ
         pchoY1qlwZ1v5yaarbqnWhrJsrL3txzCeEDHrK97CoqK0ByppNonv0hOKGa66rsDvkug
         gMJA==
X-Forwarded-Encrypted: i=1; AJvYcCVA/WsSLwK4N17ShVs3zqWpGpAjIS7h3nCTtsjk//KqYkQmDZGPrFJCTIwHqgZgTtg9aHDiwZHgyurtWVlsGMkKmQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzNcH1zfPM0txWfJGzohF0ODpTk54QCKkt8ExM+m5bJSs/Yn16D
	62Z9BG/1DkliDLazWdHAUrRtjx1LvDql5nLa36RsrL0TvFDqU0ribrfjoNbAv/1nPfUEgCbcPiy
	XzwKVGCdrtkhtPfqh+EJdmjyhIR0=
X-Gm-Gg: ASbGncteYxkZQgiReZEy1Vo2m19RPEo2IWj599HqnJBUxYHCGzCNMMjMC6OXJPImDjw
	iKjbotVjAAXlDKnKiSf4xqS3AU6jKb4u13kojzzS/t3fcpJeIz78WzI2oyNCvIIfIWbGeIf5I6a
	duG+YS8YsbU2Q5x6KYEEH7Q6ieWUbwVQ==
X-Google-Smtp-Source: AGHT+IG2AHOtc7szaWeiSqGYmfowE9kD+nSGx3z6/q85cf2V9czkiL738u4L03UAB8ltzpHnRuTzHMDoWjnQUHHIFoA=
X-Received: by 2002:a05:6871:284:b0:297:285e:f9f4 with SMTP id
 586e51a60fabf-2b83ef8ee93mr9775215fac.34.1739208657392; Mon, 10 Feb 2025
 09:30:57 -0800 (PST)
MIME-Version: 1.0
References: <20250210154958.1119250-1-ecordonnier@snap.com> <1745112bfecddf072b229f0c0b26fcb3d96fc053.camel@linuxfoundation.org>
In-Reply-To: <1745112bfecddf072b229f0c0b26fcb3d96fc053.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Feb 2025 09:30:31 -0800
X-Gm-Features: AWEUYZmEgSiR_RtZjPeu-B9FtwjHPXF8TxA4ZyRaoSa1kLj22N6S4Ob06qRz3GU
Message-ID: <CAMKF1sq0ooW+T2m72grkMRH5nOiuuASx=-t+oEfwkqjzv=NpwQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gdb-cross: remove duplicated PACKAGECONFIG
To: richard.purdie@linuxfoundation.org
Cc: ecordonnier@snap.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 17:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211110

On Mon, Feb 10, 2025 at 8:21=E2=80=AFAM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> On Mon, 2025-02-10 at 16:49 +0100, Etienne Cordonnier via lists.openembed=
ded.org wrote:
> > From: Etienne Cordonnier <ecordonnier@snap.com>
> >
> > Duplicating the PACKAGECONFIG variable in gdb-cross and gdb-common make=
s
> > it easy to forget updating one definition without updating the other.
> > However at the moment there is no need for two different definitions.
> >
> > xz is also useful for gdb-cross when minidebuginfo is enabled, so it al=
so needs
> > to be in the definition of PACKAGECONFIG in gdb-cross.inc
> >
> > Let's remove the definition from gdb-cross.inc to make maintenance easi=
er.
> > This enables xz for gdb-cross as side-effect.
> >
> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> > ---
> >  meta/recipes-devtools/gdb/gdb-cross.inc | 1 -
> >  1 file changed, 1 deletion(-)
>
> At the very least this commit message needs to be a bit clearer as
> there is a change of behaviour here.
>
> To be clear, this change adds:
>
> ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'xz', '', d)}
>
> to the default PACKAGECONFIG for gdb-cross. You can't tell that from
> the patch.
>
> I'd also mention that there is still a different definition for gdb-
> cross-canadian and if we do this, they should all probably match.
>
> Whether we should do this, I'm unsure. It might be worth just adding xz
> unconditionally at this point by default to be honest, it isn't a huge
> dependency. gdb is a debugging tool, not for a minimal system.

target gdb where the size and dependencies might matter, for cross and
cross-canadian
IIRC it won't matter as much from size perspective. we can let the
defaults be controlled from
bb itself or from inc and then add/remove as needed in bb files.
Status quo is a mix of both
so we should do something. Perhaps this patch with updated commit log
is a good one

>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211104): https://lists.openembedded.org/g/openembedde=
d-core/message/211104
> Mute This Topic: https://lists.openembedded.org/mt/111104210/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


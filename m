Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2E6CF9C6C
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:39:53 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.9123.1727246384203480370
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jbXpL7jM;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5df9433ac0cso2938876eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 23:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727246383; x=1727851183; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8xpPk4hBUVF6q9f+VAsGa+wOC52RX4ZBGEnL/35pF8=;
        b=jbXpL7jMKya6qrnM8uomKaHJpbn/pBH4oTETSEQaaK2X4zvo4hPgQNiAl6tIDTWGbU
         tVz97JtMwtmI8LVOuWhUHSlnpLo/KfEg29XUVXfdN1E41RwQ0pTAQ6BoNzxIRLG+mau1
         +DjtpVEEQOKPSn4SyICy9xk5jaNwuLnI6ZLc/WM41Uik4L6/YIRLsJXbcgeXhrLcOzHM
         pB2T4ZcDTjIwRLhwAJy9jS20/VvV3+oTJWLXyXRn89FUWM0IqE+qy/8WSG616yGFFfa7
         J/j9oO6lBzSHR7iIBWfA/noz13G174zBVVmBVbc0psM7BA0Kg6mDsBRtCfJFiZIHU9bC
         GtuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727246383; x=1727851183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8xpPk4hBUVF6q9f+VAsGa+wOC52RX4ZBGEnL/35pF8=;
        b=Ktg1vcoBLirLkXzka180v7OKjGJgtnaVjpp6UeWZveW83SODJyHTfKZnTGyze28rvE
         14FOJrHhR66bgS72JAwvS9kEGXmqm/gLEzf+i8zfb8AyCPm+DzPDvOZ1FAMgFc/UMxrx
         vxP0c742YTsibSju/o2499TEskBe8phYe5pBSRQpE3MlIH6buQHJ/1aIjTak3jqXlZTB
         WuU1PVXP4x6kxku172FhCqGHeKywQDdt/V2BfSpIOFbxvGuztg7tO4l/S3OQpkiKQkSR
         JMPgSHRkXhupH0OHL7cZ6qSR6RH3jWL0U+oKzxRIOV2GZ3aBwz9Dmqm6QqS1X1ru5vBq
         /Dsg==
X-Gm-Message-State: AOJu0YxiEBEOAcxs72pwF7ehKC++qjhDqaDjikFclWbF0vPkhQYHvYz4
	EIfpMwepWFMvO3WP3FhIbHKygzo0gdENKkcX9w6aVraqTcEbhhgOV6fIPjaC3dsv2zY8c5a4gc/
	bMtHRyLmQNqruZnBA9i5Pj7egY/g=
X-Google-Smtp-Source: AGHT+IGKgesRZ4SxdhBxugRGRtGnodnpk8oa3soNsKXdn+BVSMFQd+T8nssdky4rjAcxtvhhcbGRun2VLB3QFsb7LBk=
X-Received: by 2002:a05:6820:1c96:b0:5dc:cdf8:21c8 with SMTP id
 006d021491bc7-5e5c6a420f4mr957068eaf.4.1727246383300; Tue, 24 Sep 2024
 23:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240925063423.1870305-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20240925063423.1870305-1-Deepthi.Hemraj@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Sep 2024 23:39:16 -0700
Message-ID: <CAMKF1sr4DM6kXvN13x7MHf3yWN+aFimGDFbdRUJUBgnhSJpF_Q@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] bintuils: stable 2.38 branch update
To: Deepthi.Hemraj@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204893

looks good. Thanks

On Tue, Sep 24, 2024 at 11:34=E2=80=AFPM Hemraj, Deepthi via
lists.openembedded.org
<Deepthi.Hemraj=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>
> Below commit on binutils-2.38 stable branch are updated.
> 4d71e17a9fd libctf: fix ref leak of names of newly-inserted non-root-visi=
ble types
>
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.38.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/reci=
pes-devtools/binutils/binutils-2.38.inc
> index 4a8831b534..032e67a213 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.38.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
> @@ -18,7 +18,7 @@ SRCBRANCH ?=3D "binutils-2_38-branch"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(\d_?)*)"
>
> -SRCREV ?=3D "ea5fe5d01e5a182ee7a0eddb54a702109a9f5931"
> +SRCREV ?=3D "4d71e17a9fd8d319359ded891eb3034a2325d4c0"
>  BINUTILS_GIT_URI ?=3D "git://sourceware.org/git/binutils-gdb.git;branch=
=3D${SRCBRANCH};protocol=3Dgit"
>  SRC_URI =3D "\
>       ${BINUTILS_GIT_URI} \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204890): https://lists.openembedded.org/g/openembedde=
d-core/message/204890
> Mute This Topic: https://lists.openembedded.org/mt/108643516/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


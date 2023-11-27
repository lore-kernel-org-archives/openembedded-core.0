Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A178C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 04:14:35 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.86402.1701058471942289934
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Nov 2023 20:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OWyEmj27;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1fa26074783so856127fac.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Nov 2023 20:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701058471; x=1701663271; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiYJiVgTNLVvZawPV+TT61Y+JKb4WnH3LiLEG26bSFs=;
        b=OWyEmj27w+43Alu065ZBtvnA6SHEMtewF7+o+kQcSykF8tiKkY8wGTHK+O3FsNaXLn
         0Yby+xe6GRw2E+wQlOnyN+jyJhotiGO3LZ25u/lhLpqBRfhNMocBQrGO6MBxkIw5BcDk
         3AZpgPMNVOrHTO19u8GTBk9KAj8z5ZKeLvCcdj3BtuLDea3DBHJhVgGBLOLk2FbrlVMT
         l6tah0Vd86sRR2TpdYVukp9hEMeNm6yXJB6rdxSCwa1PYWnd4rCXOOPxDrmmTAPXXPkW
         7knsgze2t4c63qWop5F5w5k26nq6Tm/M5UYPGVTVWT0Zar0Xe7sFE5nRFd/Bjh4AvcAc
         BhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701058471; x=1701663271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kiYJiVgTNLVvZawPV+TT61Y+JKb4WnH3LiLEG26bSFs=;
        b=RDixDg8iW/nCkgSb3e6Cd5j63udosuXLFL4D75/Q6IKVrySPrNU957qj0DUqznq3AW
         6EaSZX3Zx3ciP2kKlRJjXqahE9ffDjCCfgH7bDkA9t6iUBHVgQc9I5uTJMzbdUOuTjVe
         +rf7QVVa8QFeVjJ0zmVgqaKb0hsk5kEC9crcBmkdRTadAQpwHyI/p06jZtAe9w5qpDN9
         LkKguv6IzqCXw0/16fBRAWiYp8nLyEX6nRBezTozweFyq1CUIN7+dIcHjik5mCYanv/2
         5lg5qRrHqb2Fr9/FEf1/hMiORsYoAaHfEDM4+4xd6R0kZb/qKTiehVshdrVl+1Lj7VUl
         1cCw==
X-Gm-Message-State: AOJu0YzCeVMDkpnXUA4fKpr0mstuQijfMX05HnW6GuDb7Tv33sGqYpm5
	dD+TJQOYEACc7xvuTDmlllI/m0o+PfP8yElmpptfATmloRo=
X-Google-Smtp-Source: AGHT+IFvBx9c2N1hiaRvsVwQ3HvJBae9Db0bBwV53hRzX7f8N6bAOkRH3YtSpPOXHFzvIdgjKivEpipKAPeAWvIEmS4=
X-Received: by 2002:a05:6870:c1d3:b0:1fa:fea:ef2a with SMTP id
 i19-20020a056870c1d300b001fa0feaef2amr11388627oad.57.1701058471102; Sun, 26
 Nov 2023 20:14:31 -0800 (PST)
MIME-Version: 1.0
References: <20231127035539.1024191-1-sundeep.kokkonda@windriver.com>
In-Reply-To: <20231127035539.1024191-1-sundeep.kokkonda@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Nov 2023 20:14:05 -0800
Message-ID: <CAMKF1spi_QQr5enXKLZk=tzgXFf9bFC_0B0CN1y=V6i2TDs+EA@mail.gmail.com>
Subject: Re: [PATCH] binutils: stable 2.41 branch updates
To: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com, 
	naveen.gowda@windriver.com, shivaprasad.moodalappa@windriver.com, 
	yash.shinde@windriver.com, deepthi.hemraj@windriver.com, 
	umesh.kallapa@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 04:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191249

lgtm.

On Sun, Nov 26, 2023 at 7:56=E2=80=AFPM Sundeep KOKKONDA
<sundeep.kokkonda@windriver.com> wrote:
>
> Below commits on binutils-2.41 stable branch are updated.
> eb49941e7e1 Gold/MIPS: Add targ_extra_size=3D64 for mips32 triples
> c27eff41737 Gold/MIPS: Use EM_MIPS instead of EM_MIPS_RS3_LE for little e=
ndian
> 7fe76f02413 x86-64: fix suffix-less PUSH of symbol address
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.41.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.41.inc b/meta/reci=
pes-devtools/binutils/binutils-2.41.inc
> index b4934c02a8..804f092965 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.41.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.41.inc
> @@ -18,7 +18,7 @@ SRCBRANCH ?=3D "binutils-2_41-branch"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(\d_?)*)"
>
> -SRCREV ?=3D "cb4c3555ac4cf8aaf0935cb6e4b09e6882436d21"
> +SRCREV ?=3D "c1321df4eb0a136304205085cd4913dd4eb01054"
>  BINUTILS_GIT_URI ?=3D "git://sourceware.org/git/binutils-gdb.git;branch=
=3D${SRCBRANCH};protocol=3Dhttps"
>  SRC_URI =3D "\
>       ${BINUTILS_GIT_URI} \
> --
> 2.42.0
>


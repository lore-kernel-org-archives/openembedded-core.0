Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F269C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 18:22:05 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.1226.1745518924108419954
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 11:22:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U+QUV4jS;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3feaedb531dso358531b6e.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 11:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745518923; x=1746123723; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayrLmwdkB5Xw7TYpa7Lx8ErMSeaNlqNnLHMmoFZqH1g=;
        b=U+QUV4jSJry+kLSMxeFxdvQz71zeZGpN7oKxH6q2ybMAtmhoDjaeywF9u3jjkCgL+/
         /3TyUUFeL5nUjn8Xpm/zl2hwlU71uZ1LcWK/Ro5CY5mUgK36/PW2lhzFd0Ow5AfBJ/bn
         NbHiFrHa802V1KPP9nu7EXQFkDyztnYTRhF7D7qumZjek7QFpq+SsTyo2pLFvu+L7ecL
         zFcNV0l3ZjNPfy64hr50Ra+uvTahs2vtrKhd+S7Y72CIhbx923sH20zpTr75N1u85BLk
         6weRaQH/OuQTynC1cYpQoTiHx5Z3jRoB+PVcrv8tAkGpGa57Nz/pT1wUynfmM4/n3OeN
         dAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745518923; x=1746123723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ayrLmwdkB5Xw7TYpa7Lx8ErMSeaNlqNnLHMmoFZqH1g=;
        b=ExoBK9kcnsuhzbvD0j6gYbclhv3HbfSqm61C4wLOIVcU8LblmFuJRjeLrMdjGSVvKR
         4eutO5nYkSOrz1abM7SfTm7MzWbQmT5acgkEvnDZONAmxYhpinYeYF0mMORxF/9qbNJv
         eRh4/syzC/O9LFq40eMapmXGTl58/SBKPGL52GiqbatZ/qMe7McjZzwFzCZCEcIk4m3N
         15qYzeMVPB0XZlv1/RAJPUgdGkcC23r6MLaYB235rqn0ioIx7r2lwwL5zF+etrpQk5Xk
         60jKD8A2K4EGO7ipZef6NUfDz6375ko4FW2mW42X+Bs5S7jsB0cDv01t1OqX5Tciba9q
         tzWw==
X-Gm-Message-State: AOJu0Yzcbu9vaM8KOXYefS3QIaChdh0k403rFmTSxEl4Jidwk35RCtlt
	BTfsJ5QM4axMjLxWwimyR2zbSX1QIOGzcS35wS/ctwngrh86D+x81hmsbpsAHrMJbazP7mMX3Ch
	G34Y5/VBWnrGYgSsz9WBCKRJEwwwNYzhI
X-Gm-Gg: ASbGncvqjcy/uZwrpjAeBfy/f+bgQz+ChZgVnlm1nKIiDqJwVAd7oGJ7vaU6TdWrRvg
	1rIxp+aaocBY5Ga4Kr9X6STVe4wo1dcdyg97QY3aahxHIHdsvyvrKTNHEz+eg7IF75JZAQfr4dr
	uZ1sbjGpwqfuADiFsgOpEVWg==
X-Google-Smtp-Source: AGHT+IGtbyMG84J3NeXmTFrtov+BHaZsp9eUli/bs55gPUUeOIwT7n6CbHEDgUoXzMK2fuzkQuBjLvO2+YO6/hnxOpY=
X-Received: by 2002:a05:6808:1b8e:b0:3fe:aeaf:316d with SMTP id
 5614622812f47-401f11ae0ffmr322876b6e.20.1745518923346; Thu, 24 Apr 2025
 11:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
 <20250424-clang-merge-v1-10-5a492a8461aa@gmail.com> <jjntalgntiaaqnhc4ctbxexkyunovdoe3jiq2ra4hhg4qpakyo@ljcbt3opbeje>
In-Reply-To: <jjntalgntiaaqnhc4ctbxexkyunovdoe3jiq2ra4hhg4qpakyo@ljcbt3opbeje>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Apr 2025 11:21:37 -0700
X-Gm-Features: ATxdqUH1k1ShN09P8jG-iaezIkKGxng5zd7Z65QUnjOTpy0XH3Ve-FMHT2K_qlo
Message-ID: <CAMKF1spOLs0aPzPKfbFJzwc=Dra7-3ZdrzTk4-T7EnHCEq4iqw@mail.gmail.com>
Subject: Re: [PATCH 10/11] sstatesig: Handle special case of
 llvm-project-source shared-workdir
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 18:22:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215400

On Thu, Apr 24, 2025 at 2:12=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Apr 24, 2025 at 12:20:44AM -0700, Khem Raj wrote:
> > bitbake-dumpsig or bitbake-diffsig tools do not work on any of tasks
> > exposed by llvm-project-source recipe. This is due to it being a
> > shared-workdir recipe.
> >
> > Fixes
> >
> > bitbake-diffsigs -t llvm-project-source-20.1.2 do_preconfigure
> > NOTE: Starting bitbake server...
> > ERROR: No sigdata files found matching llvm-project-source-20.1.2 do_pr=
econfigure
>
> If anybody runs git bisect on top of OE-Core, they might face issues if
> this patch (and the next one) come after actual clang recipe. I think it
> makes sense to rearrange them to come before the clang recipe
> introduction, so that at each stage the tree can be built without
> issues.

Makes sense will rearrange in v2

>
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/lib/oe/sstatesig.py | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> > index 1f976067631f80d637ba803f49813323d17e7c70..826549948e24571ef57acbe=
6bc5a2442d6c49f13 100644
> > --- a/meta/lib/oe/sstatesig.py
> > +++ b/meta/lib/oe/sstatesig.py
> > @@ -418,6 +418,9 @@ def find_siginfo(pn, taskname, taskhashlist, d):
> >      if pn.startswith("gcc-source"):
> >          # gcc-source shared workdir is a special case :(
> >          stamp =3D localdata.expand("${STAMPS_DIR}/work-shared/gcc-${PV=
}-${PR}")
> > +    elif pn.startswith("llvm-project-source"):
> > +        # llvm-project-source shared workdir is also a special case :*=
(
> > +        stamp =3D localdata.expand("${STAMPS_DIR}/work-shared/llvm-pro=
ject-source-${PV}-${PR}")
> >
> >      filespec =3D '%s.%s.sigdata.*' % (stamp, taskname)
> >      foundall =3D False
> >
> > --
> > 2.49.0
> >
> >
>
> --
> With best wishes
> Dmitry


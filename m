Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.42221.1622454720179891418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 02:52:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HMrAQmKa;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id c13so32267plz.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 May 2021 02:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zy7PEKejki+nfpDlOVwv9ogtYhF4zU6kHEm0T2sKsTU=;
        b=HMrAQmKaC+NVeOH/BUtX8U6ei7vOskpvJo/CLAsyuhvg7VWNmCIlKIYhRLLr4c1Ig/
         pxkTt4yzB9sfEyoUlX/X8xQNYLzXOjKzszJv4KSIStwaMhdevfkZWqc7OMz5TjaUHNw4
         ICd5tT6j1gRYrNo1WIn10p2tIbl8NOYpP5tW7McxabhaOY3VyTc3cxl4edm7pwrMuhqf
         bgplwK7IP84GhLI6FI41NCFdApwUX6VVC7WW7pNWN/Lbcjm3q1ARmHEyfv476Gnw87fx
         pNFH/wleHHc9GFdvNRvyAsJ/IuevqdzT+GtduNPwW8fbukYczZ3RcYvvtEkS6GyjM97o
         nJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zy7PEKejki+nfpDlOVwv9ogtYhF4zU6kHEm0T2sKsTU=;
        b=pqpXLPcfuIuGCg7mTfN8pJPovp4KFLYGX0h+yKMYfMD0zXpiOtE/rVUFKsAVdKVwFI
         adaR/OQZM0Vl/vS/qirFnlAPqZFY/TYsrhFW6ezckJOFv/lKe05qDVtt5vppLsWbbukp
         OQvhFXEY9XULw0sW9DcNIwuBZguq9Yyc3cmNwqlqXE+U4Z0pLy0GVRRz7qo70UQlQJXY
         ZcOi5mbyGuIEgWB6P6EV5rA/N7dVrMzawHr1cviWfBcHbNKwVyJ+MbPFf+gJKDcCltNq
         H1XOPHYJljB2hi0Wb1vx/OWg/MHKM2azN42MUArnBQ3QZYbcB6vhSqD/11hNiHpiRdbK
         S6CA==
X-Gm-Message-State: AOAM53323HORk8rd0zMO8Et7Y910vW52verf2Q37wPCCbFCPaO4MAxhi
	r8kzpxH3YHM9iLNDStQuhCp02TnOCIfonLbgG68=
X-Google-Smtp-Source: ABdhPJzt6ITFgt6KRLBDw5ZHNIUxsS97kKMtzDoBQltiOVbQFPxDz9Mlqwp03M/BfaYevos/3kgKs66ebddbTGbVBWk=
X-Received: by 2002:a17:90a:a78d:: with SMTP id f13mr18149476pjq.161.1622454719468;
 Mon, 31 May 2021 02:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210519102302.2674317-1-Martin.Jansa@gmail.com>
 <AM9PR09MB4642AC4E6EAC764B936940BAA82B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CA+chaQdBf=aJZddxAc43GBXNoRAYwWTzw3MtQSmKxK7=tsNnzQ@mail.gmail.com>
 <AM9PR09MB46421A3886751FC639F8A6F2A82B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <1684024C9F92E21F.28811@lists.openembedded.org>
In-Reply-To: <1684024C9F92E21F.28811@lists.openembedded.org>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Mon, 31 May 2021 11:51:48 +0200
Message-ID: <CALbNGRQkmHQG-q2yEJYOvJcsg5=jO3cjzdSyU=Ue8nqGY6OrHA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstatesig.py: make it fatal error when sstate manifest isn't found
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Martin Jansa <martin.jansa@gmail.com>, Otavio Salvador <otavio.salvador@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 31, 2021 at 3:25 AM Andreas M=C3=BCller via
lists.openembedded.org
<schnitzeltony=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Wed, May 19, 2021 at 6:46 PM Konrad Weihmann <kweihmann@outlook.com> =
wrote:
> If I am not mistaken this breaks wide areas of meta-freescale +
> meta-qt5-extra. I have seen the manifest warning using meta-freescale
> for long time (and many licensed not found in do_rootfs) but now
> builds fail.
> Most recipes failing are native recipes inheriting meta-qt5's
> cmake_qt5-bbcalss  - have many of them in meta-qt5-extra.
> To analyse I did:
>
> [superandy@thanks-buchmuellers oe-core]$ bitbake -e
> extra-cmake-modules-native | grep ^DEPENDS
> DEPENDS=3D"qtbase qtbase-native cmake-native  qtbase-native
> qtbase-native cmake-native qttools-native python3-native
> python3-native  ninja-native"
>
> As soon as I remove (target) qtbase from DEPENDS, build is fine.
> Have the strong feeling that the dynamic-packagearch magic [1] is the
> culprit confusing a native recipe finding target recipe's manifest if
> that recipe is marked as SO-SPECIFIC  - as qtbase [2] is.
>
> Wrote here because I hope the audience is wider - will open an issue
> at meta-freescale tomorrow after zzz...
see https://github.com/Freescale/meta-freescale/issues/798
>
> Cheers,
>
> Andreas
>
> [1] https://github.com/Freescale/meta-freescale/blob/master/classes/fsl-=
dynamic-packagearch.bbclass
> [2] https://github.com/Freescale/meta-freescale/blob/733e1683ce8895a960c=
01a3ee1fce40118d82982/conf/machine/include/imx-base.inc#L246
>
>=20
>

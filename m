Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9619C433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 22:13:57 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.826.1657750429568513317
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 15:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CcAanRGw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id z12so17416054wrq.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 15:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=+QLkxNym3Qu4FHcRvBZs3JjANuOL0aanbts8G1X51us=;
        b=CcAanRGwNXz6Fdjbxxs0v3VBF0DED8/qodkgFwhcJYGki/AuqS+awRy2+UZjmwNieE
         CaDz8SiFVzBHU//lmh1YtsxDgoBmeKhcUQ3CD5qrWpf9Jl66jhxkLukpFpmkDk+YGL0L
         BcHs2sPstUkVbnvxRwfQMQ3Z6RCuCkMkADekY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=+QLkxNym3Qu4FHcRvBZs3JjANuOL0aanbts8G1X51us=;
        b=HQOEnZs2N1T2yzmn/Vg+dsCvm+dyMz1at/92Eunzvsiz+aGAjMKcGFhKYg77HWxDuD
         pX4a2ZzlfqVoMKUZvtO5clBIiYCbATWgmOzztlxSlvZ/GV0cc0QRwXb/M9YxsBO2Jd7Z
         kQygfN+VhyHLuNvlnCFl7pd9taaNXOgM4GYY1VNmBxLthzWn5TzOJJiowZlLxBQAryB8
         SCVq9OdcLUVS02z39bOrBnX4s4cheKgmWaURw2TpTfumlv40IE138DCdzGrm0vuOWfFa
         6ELvEq4+qMHJVb2HALx01KfQOmTOl/nN8ed797fja4fZ2aObzBRtC7OigAGkLXkD8xl+
         Wrng==
X-Gm-Message-State: AJIora82WReXLfk69RzbVLTKYr8UlR3TbLArtiTGHmjyS1O1fKZY2MeE
	EZ1HgEmg7vULo3igWzOLFBUxHAI8NB5ifA==
X-Google-Smtp-Source: 
 AGRyM1u9pqMVrK4um4QJzFM5PSZM3nsp1B7H6rQiho1xwmkcetMa5KKA4kXsnY8k93hC+SYOxwXdnQ==
X-Received: by 2002:adf:dd01:0:b0:21d:6df2:be30 with SMTP id
 a1-20020adfdd01000000b0021d6df2be30mr5208807wrm.255.1657750427822;
        Wed, 13 Jul 2022 15:13:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c037:3be3:5ea0:9a64?
 ([2001:8b0:aba:5f3c:c037:3be3:5ea0:9a64])
        by smtp.gmail.com with ESMTPSA id
 e15-20020a5d500f000000b0021d905477dfsm11747416wrt.86.2022.07.13.15.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 15:13:46 -0700 (PDT)
Message-ID: 
 <6e83879c522c185635c6ad258854e170ef07fcd3.camel@linuxfoundation.org>
Subject: Re: [OE-core] libstdc++ honister -> kirkstone
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Reid <preid@electromag.com.au>, mfumita@electromag.com.au,
	openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2022 23:13:45 +0100
In-Reply-To: <f4223840-8400-44ed-1d5d-8f9ab9b51c46@electromag.com.au>
References: <fbe2ba5d-f82c-ea57-a00d-4e0ff1b9586f@electromag.com.au>
	 <28194.1657080073438546558@lists.openembedded.org>
	 <25ddecdf5e77515b5967dd92d804e8dbd4ef3b70.camel@linuxfoundation.org>
	 <f4223840-8400-44ed-1d5d-8f9ab9b51c46@electromag.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 22:13:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167994

On Tue, 2022-07-12 at 13:23 +0800, Phil Reid wrote:
> On 8/07/2022 9:05 pm, Richard Purdie wrote:
> > On Tue, 2022-07-05 at 21:01 -0700, mfumita@electromag.com.au wrote:
> > > Hello there,
> > >  =20
> > > It isn't due to EOVERFLOW but make_file_type function in libstdc++-
> > > v3\src\filesystem\ops-common.h always returns file_type::unknown.
> > > It's because _GLIBCXX_HAVE_S_ISREG isn't defined.
> > > I found HAVE_S_ISREG at libstdc++-v3/config.h isn't set properly.
> > >  =20
> > > It's caused by a configure failure below to tell if S_ISREG exists on
> > > the target.
> > > gcc/arm-emit-linux-gnueabi/11.3.0/ld: error: tmp-
> > > glibc/work/cortexa9t2hf-neon-emit-linux-gnueabi/gcc-runtime/11.3.0-
> > > r0/dummylib/libstdc++.so: file is empty
> > > collect2: error: ld returned 1 exit status
> > > configure:15686: $? =3D 1
> > >  =20
> > > It complains dummylib/libstdc++.so is empty, configure failed then
> > > wrongly considered S_ISREG doesn't exist.
> > > This seems related to the following commit.
> > > https://github.com/openembedded/openembedded-core/commit/34b0edb0d312=
0c32063ff7e3dd52be20d60401d5
> > >  =20
> > > Reverting this commit rectifies this issue but not sure what's the
> > > proper fix?
> > > Any help appreciated.
> >=20
> > There is some piece we're still not understanding. I had a look at my
> > local build (master so gcc 12.1) and I see HAVE_S_ISREG is set
> > correctly, I don't see any "file is empty" message.
> >=20
> > Are you able to reproduce this on master? Which linker are you using?
> >=20
>=20
> G'day Richard,
>=20
> I've update to master and tried this. Still get a "file is empty" error d=
uring configure. See log snippet below.
>=20
>=20
> Tried to capture the ld version here:
>=20
> wait4(23043, /home/preid/dev/v2022.05/tmp-glibc/work/cortexa9t2hf-neon-em=
it-linux-gnueabi/gcc-runtime/12.1.0-r0/recipe-sysroot-native/usr/bin/arm-em=
it-linux-gnueabi/../../libexec/arm-emit-linux-gnueabi/gcc/arm-emit-linux-gn=
ueabi/12.1.0/ld: error: /home/preid/dev/v2022.05/tmp-glibc/work/cortexa9t2h=
f-neon-emit-linux-gnueabi/gcc-runtime/12.1.0-r0/dummylib/libstdc++.so: file=
 is empty
> collect2: error: ld returned 1 exit status
>=20
>=20
> /home/preid/dev/v2022.05/tmp-glibc/work/cortexa9t2hf-neon-emit-linux-gnue=
abi/gcc-runtime/12.1.0-r0/recipe-sysroot-native/usr/bin/arm-emit-linux-gnue=
abi/../../libexec/arm-emit-linux-gnueabi/gcc/arm-emit-linux-gnueabi/12.1.0/=
ld --version
> GNU gold (GNU Binutils 2.38.20220516) 1.16
> Copyright (C) 2022 Free Software Foundation, Inc.
> This program is free software; you may redistribute it under the terms of
> the GNU General Public License version 3 or (at your option) a later vers=
ion.
> This program has absolutely no warranty.
>=20
>=20
> Hope that helps.


It does thanks. It confirms you're using the gold linker which allowed
me to reproduce (I was trying with the default bfd). I think this small
change will fix it:

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devto=
ols/gcc/gcc-runtime.inc
index c39a0caf8a7..7e920df2d34 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -68,7 +68,8 @@ do_configure () {
        # libstdc++ isn't built yet so CXX would error not able to find it =
which breaks stdc++'s configure
        # tests. Create a dummy empty lib for the purposes of configure.
        mkdir -p ${WORKDIR}/dummylib
-       touch ${WORKDIR}/dummylib/libstdc++.so
+       touch ${WORKDIR}/dummylib/dummylib.c
+       ${CC} ${WORKDIR}/dummylib/dummylib.c -shared -o ${WORKDIR}/dummylib=
/libstdc++.so
        for d in libgcc ${RUNTIMETARGET}; do
                echo "Configuring $d"
                rm -rf ${B}/${TARGET_SYS}/$d/

Cheers,

Richard





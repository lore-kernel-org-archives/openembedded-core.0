Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BC7C433FE
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 09:20:53 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.7553.1652174449283368524
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 02:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BKJ0KHs+;
 spf=pass (domain: gmail.com, ip: 209.85.208.179,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id s27so20112370ljd.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 02:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/vIGI8GlFDkVtdDJS1tKhYkfkSWfL7gXhts+Q5WUMD4=;
        b=BKJ0KHs+Ag61GDlyzhMaeqcTtxz0YUY2Q69zwQorKS87kM8goeN9Z0dvNbYkc2ds6t
         hKGUx9p115PjfJsxggJtG5puLgWJ2s9NqH9YyKZDx49HGhDrbAZWHJ0apUeBOPd4kse1
         16xHaw5nop1ndDB0fHpKFMyNRZnpui+n/LmlQG6SEGi55ZWOmhvESQavoi7U9wKDru3z
         7OjcJSjV3R2klk8qnYRovrGUipVkyX157gHIXcBIE22CWy2iBRRvR8WJddSDbuedgI6H
         tEJCQXcq57Gwjt93TL8Ck6Sj0ixkY/SsmcSOd5v5bm6Gv5v2vI5Ahteogb5q7X43Q6mw
         3mIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/vIGI8GlFDkVtdDJS1tKhYkfkSWfL7gXhts+Q5WUMD4=;
        b=dlzYRkeVBoUfuGrHgYDh4S1C1auMVgCZc8U1vVyuH8lBSmIBECG7DChOB2/2tgABYi
         h9xFkeJksOQAZ7QZw7C+nMdcs60+tpT92Ny/60pqBe4UZFeOU3RibaGy469wnMqIAADj
         X3oEYCE8MDuNiv+Jqh8C6dZpt4ORAbRTnwr6HEB+3NlaNrs8m87cDEO+f83x4YcVDs1h
         /aeHVUuSEBJXNcaWz8gVs3IgR0s4eWYNN8oQisPlyfiXO2BbrxLLsjUPINEGgOed7Z4V
         5wRIWYOEuvn/3KIgvNOfuvGeuh7TPZ3zBrsBIUHbn1fyMG1tWOhc2got3ol2JqBc9SNA
         t0cg==
X-Gm-Message-State: AOAM530KcponAR4TKdnz5Q3D4fLPel8/aomYMFziLfd1BFZRu4t7peWF
	ZYutfIcqaBBHqlo2gHttgVosN9C3CTdojYKdoi8=
X-Google-Smtp-Source: 
 ABdhPJxn4YhTW4nGr1QO9m/wp5JWcCb/cMriWtswnteOeKszUlALvYgYzUuWhDvZdRVJAjq+KdQDpVJAsaDd6Gi6NlY=
X-Received: by 2002:a2e:5c41:0:b0:24f:4ff:e4c1 with SMTP id
 q62-20020a2e5c41000000b0024f04ffe4c1mr13363703ljb.56.1652174447198; Tue, 10
 May 2022 02:20:47 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CO6PR11MB560249B7071753A389AFD7C6EDC99@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: 
 <CO6PR11MB560249B7071753A389AFD7C6EDC99@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 May 2022 11:20:35 +0200
Message-ID: 
 <CANNYZj_F6ZCdAfqbN4YhHgQ_vS8Sj9MFAqsHv+MC5u-zvmJLRg@mail.gmail.com>
Subject: Re: [OE-core] Regression about go 1.18 + OE specific local patch
To: Chen Qi <Qi.Chen@windriver.com>
Cc: "raj.khem@gmail.com" <raj.khem@gmail.com>,
	"alexander.j.kube@gmail.com" <alexander.j.kube@gmail.com>,
 "matt@madison.systems" <matt@madison.systems>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 09:20:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165413

It is probably needed for reproducibility, can you run the repro test
with this patch dropped?

Alex

On Tue, 10 May 2022 at 11:09, Chen Qi <Qi.Chen@windriver.com> wrote:
>
> Hi All,
>
>
>
> I met a regression after go was upgraded to 1.18+.
>
> The problem can be reproduced by running `bitbake nativesdk-skopeo=E2=80=
=99, with meta-virtualization added in bblayers.conf.
>
> The error message is as below.
>
>
>
> =E2=80=9C=E2=80=9D=E2=80=9D
>
> <snip>
>
> | HASH[build golang.org/x/text/unicode/norm]: "import \"golang.org/x/text=
/unicode/norm\"\n"
>
> | HASH /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/work/x86_64-nati=
vesdk-pokysdk-linux/nativesdk-skopeo/v
>
> 1.6.1+gitAUTOINC+3e2defd6d3-r0/git/src/import/vendor/github.com/pkg/error=
s/errors.go: 1b60ba5bcb417f0060d1c1fbc
>
> edaa1a702020499094ce8134f8b45a58c0ebbff
>
> | panic: runtime error: index out of range [0] with length 0
>
> |
>
> | goroutine 5129 [running]:
>
> | cmd/go/internal/work.(*Builder).buildActionID(0xc0002490e0, 0xc000370b4=
0)
>
> |       /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/work/x86_64-lin=
ux/go-crosssdk-x86_64-pokysdk-linux/1.
>
> 18.1-r0/recipe-sysroot-native/usr/lib/x86_64-pokysdk-linux/go/src/cmd/go/=
internal/work/exec.go:281 +0x23cf
>
> | cmd/go/internal/work.(*Builder).build(0xc0002490e0, {0xc000220000?, 0x0=
?}, 0xc000370b40)
>
> |       /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/work/x86_64-lin=
ux/go-crosssdk-x86_64-pokysdk-linux/1.
>
> 18.1-r0/recipe-sysroot-native/usr/lib/x86_64-pokysdk-linux/go/src/cmd/go/=
internal/work/exec.go:476 +0x199
>
> | cmd/go/internal/work.(*Builder).Do.func2({0xadd9f8, 0xc000220000}, 0xc0=
00370b40)
>
> |       /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/work/x86_64-lin=
ux/go-crosssdk-x86_64-pokysdk-linux/1.18.1-r0/recipe-sysroot-native/usr/lib=
/x86_64-pokysdk-linux/go/src/cmd/go/internal/work/exec.go:139 +0x5ec
>
> | cmd/go/internal/work.(*Builder).Do.func3()
>
> |       /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/work/x86_64-lin=
ux/go-crosssdk-x86_64-pokysdk-linux/1.18.1-r0/recipe-sysroot-native/usr/lib=
/x86_64-pokysdk-linux/go/src/cmd/go/internal/work/exec.go:201 +0xb9
>
> | created by cmd/go/internal/work.(*Builder).Do
>
> |       /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/work/x86_64-lin=
ux/go-crosssdk-x86_64-pokysdk-linux/1.18.1-r0/recipe-sysroot-native/usr/lib=
/x86_64-pokysdk-linux/go/src/cmd/go/internal/work/exec.go:187 +0x3da
>
> | Makefile:140: recipe for target 'bin/skopeo' failed
>
> <snip>
>
> =E2=80=9C=E2=80=9D=E2=80=9D
>
>
>
> I did some investigation and found it was related to a local patch, 0001-=
cmd-go-make-content-based-hash-generation-less-pedan.patch.
>
> The build succeeded after I dropped this patch.
>
>
>
> I=E2=80=99m sending out this email to seek for some help, as I don=E2=80=
=99t fully understand what this patch does.
>
>
>
> e.g.
>
> =E2=80=9C=E2=80=9D=E2=80=9D
>
> +               if strings.HasPrefix(flag, "-m") {
>
> +                       newflags =3D append(newflags, flag)
>
> +               }
>
> =E2=80=9C=E2=80=9D=E2=80=9D
>
> This flag filtering is not explained in the commit message.
>
>
>
> One more question: this patch applies to all go recipes, including go cro=
ss compilers and target go. But from its commit message, target go does not=
 seem to need it.
>
>
>
> Any suggestion?
>
>
>
> Regards,
>
> Qi
>
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165412): https://lists.openembedded.org/g/openembedde=
d-core/message/165412
> Mute This Topic: https://lists.openembedded.org/mt/91008732/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


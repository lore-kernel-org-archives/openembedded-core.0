Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A52BC433F5
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 17:58:25 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.353.1664560697808432711
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 10:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CSTJVf/4;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id g130so4299841pfb.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 10:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=oOL6ID7iTD6N1yEo+XYCfxRGBnHD0Esjhozei/TduDA=;
        b=CSTJVf/4/4BzAMBlu5IHtYF1tc+zivubfFsbK5IvIN9g7prGyq+ex5PcGTN+79HVMS
         bSRlfOlJMeky9opuNUH/g/tYamzivDhYJA+dB1UITnUkQLvSTGTK61pwMkabwyfv12Wq
         UWS2U6qawLyeeVrqKolzh7IpDDzqf4Vwly5dJS71aEhjbJEB1Ds910+XneKJoftDO6CL
         OywunpoeJDEXD2y2TnltCGNWqpNh0fcyGhl6VeuFPTyjfZH82HB7tFY3nLNkB7Nfqyao
         /npHbeZ+0i4Jj0qHUhQuL8KfND0ZtNzRDYb3q/HqLToXBZsDIUGoYUdEByHsVA8Oh/1D
         rZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=oOL6ID7iTD6N1yEo+XYCfxRGBnHD0Esjhozei/TduDA=;
        b=seNMVKMydj4Dc7odnWFFFHjApCK30LrxkMN6Isq8K1neUzY6ycu6nlYu8Klh8nQXXz
         jTmSy0D/oeLvuHRnoClgZGxCYv3NYGEcjqbcXaMhPd6yvIM5AMGbpqoVoj0vyPvdRzE1
         2Ccgvnu1bXru2O860GXRClrUthWD2RPYWYGe1Hd7JQNswvXGONVR5hFDopGGgp8O6Q/t
         WFyxrLdYupnKDNzZ0dyylFQfkoUHCIaXBHVVYzAp+49ZItn9Z4QEM5bcYE4NQHy7htyH
         JiWKO09WU/t9shO55NspOD88o9Zlznj0QBZ2QEa3BmmyFYOcB8Lv5/AoybpJoboxrEyI
         lR7g==
X-Gm-Message-State: ACrzQf33PXohx+bCBsCpuWrHMvkI6oLuBxQ7KpftAgSA74yhZzj02aKc
	/cmvKbi8ZpGF51bscfAMk1k9bM94JIvKU0W9cMQ=
X-Google-Smtp-Source: 
 AMsMyM6TBfwYS/0fW9hgt2USytv3aJjqG4mZvNWLGZ9F/jWju97u7RHc+Mc8EHXe+9YSdXy8njdif8sY7ivNbLK68h4=
X-Received: by 2002:a05:6a00:1892:b0:540:acee:29e8 with SMTP id
 x18-20020a056a00189200b00540acee29e8mr10199062pfh.1.1664560697261; Fri, 30
 Sep 2022 10:58:17 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CO6PR11MB560249B7071753A389AFD7C6EDC99@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: 
 <CO6PR11MB560249B7071753A389AFD7C6EDC99@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 30 Sep 2022 18:57:55 +0100
Message-ID: 
 <CANPvuR=W68vwb+r6yAZKmbf5Y08rVRjE6F7ON_ttfsc-Bk41VA@mail.gmail.com>
Subject: Re: [OE-core] Regression about go 1.18 + OE specific local patch
To: Chen Qi <Qi.Chen@windriver.com>
Cc: "raj.khem@gmail.com" <raj.khem@gmail.com>,
	"alexander.j.kube@gmail.com" <alexander.j.kube@gmail.com>,
 "matt@madison.systems" <matt@madison.systems>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001145f305e9e8bd96"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 17:58:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171239

--0000000000001145f305e9e8bd96
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Qi,

With patch in place I have seen some build issues mainly in
meta-virtualization
with ti am62xx-evm, am64xx-evm and riscv64 machines.
Propose to remove the patch as it seams to fix the issue and I don't see
any side effect after
testing it in some weeks.

https://lists.openembedded.org/g/openembedded-core/message/171233

Chen Qi <Qi.Chen@windriver.com> escreveu no dia ter=C3=A7a, 10/05/2022 =C3=
=A0(s)
10:09:

> Hi All,
>
>
>
> I met a regression after go was upgraded to 1.18+.
>
> The problem can be reproduced by running `bitbake nativesdk-skopeo=E2=80=
=99, with
> meta-virtualization added in bblayers.conf.
>
> The error message is as below.
>
>
>
> =E2=80=9C=E2=80=9D=E2=80=9D
>
> <snip>
>
> | HASH[build golang.org/x/text/unicode/norm]: "import \"
> golang.org/x/text/unicode/norm\ <http://golang.org/x/text/unicode/norm%5C=
>
> "\n"
>
> | HASH
> /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/work/x86_64-nativesdk-p=
okysdk-linux/nativesdk-skopeo/v
>
> 1.6.1+gitAUTOINC+3e2defd6d3-r0/git/src/import/vendor/
> github.com/pkg/errors/errors.go: 1b60ba5bcb417f0060d1c1fbc
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
> |
> /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/work/x86_64-linux/go-cr=
osssdk-x86_64-pokysdk-linux/1.
>
> 18.1-r0/recipe-sysroot-native/usr/lib/x86_64-pokysdk-linux/go/src/cmd/go/=
internal/work/exec.go:281
> +0x23cf
>
> | cmd/go/internal/work.(*Builder).build(0xc0002490e0, {0xc000220000?,
> 0x0?}, 0xc000370b40)
>
> |
> /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/work/x86_64-linux/go-cr=
osssdk-x86_64-pokysdk-linux/1.
>
> 18.1-r0/recipe-sysroot-native/usr/lib/x86_64-pokysdk-linux/go/src/cmd/go/=
internal/work/exec.go:476
> +0x199
>
> | cmd/go/internal/work.(*Builder).Do.func2({0xadd9f8, 0xc000220000},
> 0xc000370b40)
>
> |
> /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/work/x86_64-linux/go-cr=
osssdk-x86_64-pokysdk-linux/1.18.1-r0/recipe-sysroot-native/usr/lib/x86_64-=
pokysdk-linux/go/src/cmd/go/internal/work/exec.go:139
> +0x5ec
>
> | cmd/go/internal/work.(*Builder).Do.func3()
>
> |
> /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/work/x86_64-linux/go-cr=
osssdk-x86_64-pokysdk-linux/1.18.1-r0/recipe-sysroot-native/usr/lib/x86_64-=
pokysdk-linux/go/src/cmd/go/internal/work/exec.go:201
> +0xb9
>
> | created by cmd/go/internal/work.(*Builder).Do
>
> |
> /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/work/x86_64-linux/go-cr=
osssdk-x86_64-pokysdk-linux/1.18.1-r0/recipe-sysroot-native/usr/lib/x86_64-=
pokysdk-linux/go/src/cmd/go/internal/work/exec.go:187
> +0x3da
>
> | Makefile:140: recipe for target 'bin/skopeo' failed
>
> <snip>
>
> =E2=80=9C=E2=80=9D=E2=80=9D
>
>
>
> I did some investigation and found it was related to a local patch,
> 0001-cmd-go-make-content-based-hash-generation-less-pedan.patch.
>
> The build succeeded after I dropped this patch.
>
>
>
> I=E2=80=99m sending out this email to seek for some help, as I don=E2=80=
=99t fully
> understand what this patch does.
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
> One more question: this patch applies to all go recipes, including go
> cross compilers and target go. But from its commit message, target go doe=
s
> not seem to need it.
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
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165412):
> https://lists.openembedded.org/g/openembedded-core/message/165412
> Mute This Topic: https://lists.openembedded.org/mt/91008732/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000001145f305e9e8bd96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Qi,</div><div><br></div><div>W<span style=3D"color=
:rgb(51,51,51);font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-=
serif;font-size:14px;white-space:pre-wrap">ith patch in place I have seen s=
ome build issues mainly in meta-virtualization</span></div><span style=3D"c=
olor:rgb(51,51,51);font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,s=
ans-serif;font-size:14px;white-space:pre-wrap">with ti am62xx-evm, am64xx-e=
vm and riscv64 machines.
</span><br>Propose to remove the patch as it seams to fix the issue and I d=
on&#39;t see any side effect=C2=A0after<div>testing it in some weeks.<br><b=
r><a href=3D"https://lists.openembedded.org/g/openembedded-core/message/171=
233">https://lists.openembedded.org/g/openembedded-core/message/171233</a><=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Ch=
en Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Che=
n@windriver.com</a>&gt; escreveu no dia ter=C3=A7a, 10/05/2022 =C3=A0(s) 10=
:09:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>





<div lang=3D"EN-US">
<div>
<p class=3D"MsoNormal">Hi All,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I met a regression after go was upgraded to 1.18+.<u=
></u><u></u></p>
<p class=3D"MsoNormal">The problem can be reproduced by running `bitbake na=
tivesdk-skopeo=E2=80=99, with meta-virtualization added in bblayers.conf.<u=
></u><u></u></p>
<p class=3D"MsoNormal">The error message is as below.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">=E2=80=9C=E2=80=9D=E2=80=9D<u></u><u></u></p>
<p class=3D"MsoNormal">&lt;snip&gt;<u></u><u></u></p>
<p class=3D"MsoNormal">| HASH[build <a href=3D"http://golang.org/x/text/uni=
code/norm" target=3D"_blank">golang.org/x/text/unicode/norm</a>]: &quot;imp=
ort \&quot;<a href=3D"http://golang.org/x/text/unicode/norm%5C" target=3D"_=
blank">golang.org/x/text/unicode/norm\</a>&quot;\n&quot;<u></u><u></u></p>
<p class=3D"MsoNormal">| HASH /ala-lpggp72/qichen/Yocto/builds/build-master=
/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-skopeo/v<u></u><u></u></=
p>
<p class=3D"MsoNormal">1.6.1+gitAUTOINC+3e2defd6d3-r0/git/src/import/vendor=
/<a href=3D"http://github.com/pkg/errors/errors.go" target=3D"_blank">githu=
b.com/pkg/errors/errors.go</a>: 1b60ba5bcb417f0060d1c1fbc<u></u><u></u></p>
<p class=3D"MsoNormal">edaa1a702020499094ce8134f8b45a58c0ebbff<u></u><u></u=
></p>
<p class=3D"MsoNormal">| panic: runtime error: index out of range [0] with =
length 0<u></u><u></u></p>
<p class=3D"MsoNormal">|<u></u><u></u></p>
<p class=3D"MsoNormal">| goroutine 5129 [running]:<u></u><u></u></p>
<p class=3D"MsoNormal">| cmd/go/internal/work.(*Builder).buildActionID(0xc0=
002490e0, 0xc000370b40)<u></u><u></u></p>
<p class=3D"MsoNormal">|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /ala-lpggp72/q=
ichen/Yocto/builds/build-master/tmp/work/x86_64-linux/go-crosssdk-x86_64-po=
kysdk-linux/1.<u></u><u></u></p>
<p class=3D"MsoNormal">18.1-r0/recipe-sysroot-native/usr/lib/x86_64-pokysdk=
-linux/go/src/cmd/go/internal/work/exec.go:281 +0x23cf<u></u><u></u></p>
<p class=3D"MsoNormal">| cmd/go/internal/work.(*Builder).build(0xc0002490e0=
, {0xc000220000?, 0x0?}, 0xc000370b40)<u></u><u></u></p>
<p class=3D"MsoNormal">|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /ala-lpggp72/q=
ichen/Yocto/builds/build-master/tmp/work/x86_64-linux/go-crosssdk-x86_64-po=
kysdk-linux/1.<u></u><u></u></p>
<p class=3D"MsoNormal">18.1-r0/recipe-sysroot-native/usr/lib/x86_64-pokysdk=
-linux/go/src/cmd/go/internal/work/exec.go:476 +0x199<u></u><u></u></p>
<p class=3D"MsoNormal">| cmd/go/internal/work.(*Builder).Do.func2({0xadd9f8=
, 0xc000220000}, 0xc000370b40)<u></u><u></u></p>
<p class=3D"MsoNormal">|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /ala-lpggp72/q=
ichen/Yocto/builds/build-master/tmp/work/x86_64-linux/go-crosssdk-x86_64-po=
kysdk-linux/1.18.1-r0/recipe-sysroot-native/usr/lib/x86_64-pokysdk-linux/go=
/src/cmd/go/internal/work/exec.go:139 +0x5ec<u></u><u></u></p>
<p class=3D"MsoNormal">| cmd/go/internal/work.(*Builder).Do.func3()<u></u><=
u></u></p>
<p class=3D"MsoNormal">|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /ala-lpggp72/q=
ichen/Yocto/builds/build-master/tmp/work/x86_64-linux/go-crosssdk-x86_64-po=
kysdk-linux/1.18.1-r0/recipe-sysroot-native/usr/lib/x86_64-pokysdk-linux/go=
/src/cmd/go/internal/work/exec.go:201 +0xb9<u></u><u></u></p>
<p class=3D"MsoNormal">| created by cmd/go/internal/work.(*Builder).Do<u></=
u><u></u></p>
<p class=3D"MsoNormal">|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /ala-lpggp72/q=
ichen/Yocto/builds/build-master/tmp/work/x86_64-linux/go-crosssdk-x86_64-po=
kysdk-linux/1.18.1-r0/recipe-sysroot-native/usr/lib/x86_64-pokysdk-linux/go=
/src/cmd/go/internal/work/exec.go:187 +0x3da<u></u><u></u></p>
<p class=3D"MsoNormal">| Makefile:140: recipe for target &#39;bin/skopeo&#3=
9; failed<u></u><u></u></p>
<p class=3D"MsoNormal">&lt;snip&gt;<u></u><u></u></p>
<p class=3D"MsoNormal">=E2=80=9C=E2=80=9D=E2=80=9D<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I did some investigation and found it was related to=
 a local patch, 0001-cmd-go-make-content-based-hash-generation-less-pedan.p=
atch.<u></u><u></u></p>
<p class=3D"MsoNormal">The build succeeded after I dropped this patch.<u></=
u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I=E2=80=99m sending out this email to seek for some =
help, as I don=E2=80=99t fully understand what this patch does.<u></u><u></=
u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">e.g.<u></u><u></u></p>
<p class=3D"MsoNormal">=E2=80=9C=E2=80=9D=E2=80=9D<u></u><u></u></p>
<p class=3D"MsoNormal">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if strings.HasPrefix(flag, &quot;-m&quot;=
) {<u></u><u></u></p>
<p class=3D"MsoNormal">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 newflags =3D append(newflags, flag)<u></u><u></u></p>
<p class=3D"MsoNormal">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<u></u><u></u></p>
<p class=3D"MsoNormal">=E2=80=9C=E2=80=9D=E2=80=9D<u></u><u></u></p>
<p class=3D"MsoNormal">This flag filtering is not explained in the commit m=
essage.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">One more question: this patch applies to all go reci=
pes, including go cross compilers and target go. But from its commit messag=
e, target go does not seem to need it.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Any suggestion?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Regards,<u></u><u></u></p>
<p class=3D"MsoNormal">Qi<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#165412): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/165412" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/165412</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91008732/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91008732/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div></blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=
=3D"ltr"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></d=
iv></div></div></div></div>

--0000000000001145f305e9e8bd96--


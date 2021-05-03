Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web12.51.1620071769120820685
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 12:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=nk+LdySu;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.177, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f177.google.com with SMTP id n22so4638705qtk.9
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 12:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=R6L6HJZLuSSxyM7uWPioxPbQmcoI92DJssEmJPP8W10=;
        b=nk+LdySuZhtE/pb01Jwt6XXv4fmdHCQHClFUMybRQs26QkuPsCzbzcs3Liwd89Zlzt
         Usn5mvR3E1o80bEuKbuqkMTcGSgUmjcmAbLQTBKw0usRL0u2anpOZwHeGU3SiI6rdxtr
         Sc8/oFEP8uB1PuyefOsskj4jinRTd4B7CK1k+SRRL3Pjq/6ddArxhpBBjVjj253xx6ms
         SQXDYIHWIQhLAaYajrueBW0k5vnQLAUGg1SttFaUf2vLPZ/AR26AxAGpuDKiCCwrl9V2
         RrK9ZFEzby7X34LUcPob5PTlLTMMWZuf/+St1GT6W5iS0BSMfFqHUI/ts8g/8zSQRCcP
         YTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=R6L6HJZLuSSxyM7uWPioxPbQmcoI92DJssEmJPP8W10=;
        b=KQCxG+SuXIZsYbzlMl0hy0iZ74IluIQGHbG6GGK2HIoUh/jum3XybVyR3nYWFj3fZg
         KBYXpy/VanRmxq7Jc1Day46sT5dipSYiVc7KlQZxbl1RwE2YhC++2PoOYNVu0coevyed
         gikA+ewrkQYhXeo1U56+TVH5qFg/JsauH8+noFjwqfNAbjYzQv5TmTxSZfmSSUXQLVRm
         mVD6uHKRRRDpNvWRCBCMkurzsxmkRGom9xHPUd7/9dSnBe5pArwGV4aeSADXHlih9CMk
         4cPKwIUnMATMDt9VM7LRiyMMTh8VKd/veD62BedAw6Qarp/y+bsq09pbf0nR8vFYuoyu
         yI8A==
X-Gm-Message-State: AOAM533GHotTlVfLgdo16cL7P60wNiqbbtSF8elgmxVDhNxPyga1Ae5W
	S6yncZSbwBIqa3Z1QibdQ+ToxiPQ0ykdW2vU
X-Google-Smtp-Source: ABdhPJzS1dDA70000jaYp+/5K/KCMFFLnF2JXBRxEnfiHdHW6ni7SdpQIU1lQCfD5xQ7TkfD/kBsHg==
X-Received: by 2002:ac8:7757:: with SMTP id g23mr7278940qtu.46.1620071768001;
        Mon, 03 May 2021 12:56:08 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id g18sm9286569qke.21.2021.05.03.12.56.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 May 2021 12:56:07 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f176.google.com with SMTP id a2so6344484qkh.11
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 12:56:07 -0700 (PDT)
X-Received: by 2002:ae9:dc47:: with SMTP id q68mr21178316qkf.197.1620071767252;
 Mon, 03 May 2021 12:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <4145ce915f734aae9f53ab2575521f2d@intel.com> <25102.1618841602267269069@lists.openembedded.org>
 <28e9a1a4251849bcafde43dc01684bd5@XBOX03.axis.com>
In-Reply-To: <28e9a1a4251849bcafde43dc01684bd5@XBOX03.axis.com>
Date: Mon, 3 May 2021 16:55:55 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp3n3gx-Op-4MnqkmnV=6TbJcF3hSA+Wc4dKQjH3A6ykQ@mail.gmail.com>
Message-ID: <CAP9ODKp3n3gx-Op-4MnqkmnV=6TbJcF3hSA+Wc4dKQjH3A6ykQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perl: fix startperl configuration option for perl-native
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Paulo Cesar Zaneti <paulo.zaneti@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000032a4d405c1725a50"

--00000000000032a4d405c1725a50
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Couldn't the OE-Core:f2d1523b19cb066a4a06609f036822fe4a8b43f0 to be
reverted in meanwhile?

Em sex., 30 de abr. de 2021 =C3=A0s 17:42, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> escreveu:

> Well, it did break our builds. I now get the following error when buildi=
ng
> a native recipe that inherits perlnative and tries to run pod2man:
>
>
>
> | /bin/sh: /home/pkj/=E2=80=A6/recipe-sysroot-native/usr/bin/pod2man:
> /home/pkj/=E2=80=A6/recipe-sysroot-native/usr/bin/per: bad interpreter: =
No such
> file or directory
>
>
>
> This is because the first two lines of the pod2man script now looks like
>
>
>
> #!/home/pkj/=E2=80=A6/recipe-sysroot-native/usr/bin/perl
>
>     eval 'exec /home/pkj/=E2=80=A6/recipe-sysroot-native/usr/bin/perl -S=
 $0
> ${1+"$@"}'
>
>
>
> instead of the previous:
>
>
>
> #!/usr/bin/env nativeperl
>
>     eval 'exec /usr/bin/env nativeperl -S $0 ${1+"$@"}'
>
>
>
> I.e., the sed command in perl=E2=80=99s do_install_append_class-native()=
 does not
> seem to have done anything, which is because there is no
> =E2=80=9Cperl-native.*/perl" in the path to match (as can be seen above)=
, it is
> just =E2=80=9Cperl=E2=80=9D, which is what the old code was looking for.
>
>
>
> [ In the above examples, I have replaced a longish part of the path with=
 =E2=80=A6
> to protect the innocent. ]
>
>
>
> //Peter
>
>
>
> *From:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> *On Behalf Of *Paulo Cesar
> Zaneti
> *Sent:* den 19 april 2021 16:13
> *To:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core] [PATCH] perl: fix startperl configuration optio=
n
> for perl-native
>
>
>
> I just re-send the patch with additional fix for the build failure.
>
> I think the basic problem was an inconsistency in the way perl recipe an=
d
> cpan.bbclass convert the absolute perl path to env path.
> Version 2 of the patch tries to use same cpan.bbclass approach on the pe=
rl
> recipe.
>
> Before submitting I just ran "bitbake -k world". I hope it doesn't break
> the build again.
>
>=20
>
>

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--00000000000032a4d405c1725a50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Couldn&#39;t the OE-C=
ore:f2d1523b19cb066a4a06609f036822fe4a8b43f0 to be reverted in meanwhile?<b=
r></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">Em sex., 30 de abr. de 2021 =C3=A0s 17:42, Peter Kjellerstedt &lt;<=
a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</=
a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>





<div style=3D"overflow-wrap: break-word;" lang=3D"SV">
<div class=3D"gmail-m_3946672890407767838WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
>Well, it did break our builds. I now get the following error when building=
 a native recipe that inherits perlnative and tries to run pod2man:<u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:rgb(148,5=
4,52)" lang=3D"EN-US">| /bin/sh: /home/pkj/=E2=80=A6/recipe-sysroot-native/=
usr/bin/pod2man: /home/pkj/=E2=80=A6/recipe-sysroot-native/usr/bin/per: bad=
 interpreter: No such file or directory<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
>This is because the first two lines of the pod2man script now looks like<u=
></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:rgb(148,5=
4,52)" lang=3D"EN-US">#!/home/pkj/=E2=80=A6/recipe-sysroot-native/usr/bin/p=
erl<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:rgb(148,5=
4,52)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0 eval &#39;exec /home/pkj/=E2=80=A6=
/recipe-sysroot-native/usr/bin/perl -S $0 ${1+&quot;$@&quot;}&#39;<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
>instead of the previous:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:rgb(148,5=
4,52)" lang=3D"EN-US">#!/usr/bin/env nativeperl<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:rgb(148,5=
4,52)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0 eval &#39;exec /usr/bin/env native=
perl -S $0 ${1+&quot;$@&quot;}&#39;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
>I.e., the sed command in perl=E2=80=99s do_install_append_class-native() d=
oes not seem to have done anything, which is because there is no =E2=80=9Cp=
erl-native.*/perl&quot; in the path to match
 (as can be seen above), it is just =E2=80=9Cperl=E2=80=9D, which is what =
the old code was looking for.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
>[ In the above examples, I have replaced a longish part of the path with =
=E2=80=A6 to protect the innocent. ]<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
>//Peter<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
><u></u>=C2=A0<u></u></span></p>
<div style=3D"border-color:currentcolor currentcolor currentcolor blue;bor=
der-style:none none none solid;border-width:medium medium medium 1.5pt;padd=
ing:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-color:rgb(225,225,225) currentcolor currentcolor;bord=
er-style:solid none none;border-width:1pt medium medium;padding:3pt 0cm 0cm=
">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> <a href=3D"mailto:openembedded-core@lists.openembedded.org" ta=
rget=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D=
"mailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openemb=
edded-core@lists.openembedded.org</a>&gt;
<b>On Behalf Of </b>Paulo Cesar Zaneti<br>
<b>Sent:</b> den 19 april 2021 16:13<br>
<b>To:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" tar=
get=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [OE-core] [PATCH] perl: fix startperl configuration op=
tion for perl-native<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I just re-send the patch with additional fix for th=
e build failure.<br>
<br>
I think the basic problem was an inconsistency in the way perl recipe and =
cpan.bbclass convert the absolute perl path to env path.<br>
Version 2 of the patch tries to use same cpan.bbclass approach on the perl=
 recipe.<br>
<br>
Before submitting I just ran &quot;bitbake -k world&quot;. I hope it doesn=
&#39;t break the build again.
<u></u><u></u></p>
</div>
</div>
</div>

<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a=
 href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystem=
s.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.co=
m.br" target=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +55 (53=
) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</=
div>

--00000000000032a4d405c1725a50--

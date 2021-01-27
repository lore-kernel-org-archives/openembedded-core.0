Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.5593.1611740757940334168
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 01:45:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DCmYjHiP;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id r12so1706869ejb.9
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 01:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uo9KpDMt212UrHLuY0TtThMC2D9R6IA30OxiT8IfwiQ=;
        b=DCmYjHiPlOImtOCIQ57i+XU/t385XotcQ8NYMmaH1Hd6yt4Z0kS9XP82C6lBVq6Ih8
         mDl4klS9g8/dnsJQ3+FAp5Hh0C7vSlsgk6vPWNOPh+vMaYgglanoDRy0to+HeEjCDN+o
         /lAF+cGq8u3Zs3yYv3HZ4tKVUD61cENgZd0Lw4AoN3NIoy71xIFa/6gcqIfXhuB60Dzt
         l3h+XCs6ulCgVVOeNbemw+36TO0m3ydE18nC4ygHKsCSWsbIX7BMngsbgRVPJJe4XviC
         hB3t3TmbpeYBunil580fYX4f20raqKJvkIcoq6lVmUgRpIoBR+wGicsiW6L9y3wUzzoN
         w0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uo9KpDMt212UrHLuY0TtThMC2D9R6IA30OxiT8IfwiQ=;
        b=sh8pUSCA/D0NK7ACEjEEI4REQ4Gy2tyhhnc4MOQ8b1myrHiGurKbMt6nJcShwI33+Z
         u2YVE6pATg9qr6AREVkQw5m0qr7ZDj0vnnJw6CCt5q3Rim6Hk23JiJvdRfAhAcbGZEhE
         kqvu+sSWb/uwHQWz/nwRw50yt0XGI3E6MLe0pnmEg1KkhY9Zs8UY0cTis5B3ejgoEKbK
         vo32RTDDKAZY9udpvFscgQf8yaYzH7z1mT01rL4+/nDxzYW9ZsayKjfsk5cMDo/pNE0W
         +5p/YxMATZJfezNyuUc3PFIwYsTQk/Pi/PTdITwrcVCq7ITmqB9yt5xPWqN4v/i9mCBq
         +PYw==
X-Gm-Message-State: AOAM533BUxB5W+BqLMkIpQ7cpK2SuBkOG/N9JBZjutcTt4IJzlvTKG3O
	G/4oOQg5+5a69/4A1iJYkhHbLRPxior4fEf8EOg=
X-Google-Smtp-Source: ABdhPJwwB0NIZoZUkLy62a9ekWIYo37GCsprjQRm+AZfV3zyFJFhnAProx8IYyRPoKbowR2mU5wZEFgDV4brVDh5Mms=
X-Received: by 2002:a17:906:49c2:: with SMTP id w2mr5935527ejv.12.1611740756404;
 Wed, 27 Jan 2021 01:45:56 -0800 (PST)
MIME-Version: 1.0
References: <20210121050529.465241A30A4@debian8-ty-1.yocto.io> <BYAPR11MB362480C0773B27E427539424E3BB9@BYAPR11MB3624.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB362480C0773B27E427539424E3BB9@BYAPR11MB3624.namprd11.prod.outlook.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Wed, 27 Jan 2021 09:45:45 +0000
Message-ID: <CANPvuR=_aZWF7Yt=7sk3NSYCWAJbwz8zHtzbQvbUDeoS7YFB9w@mail.gmail.com>
Subject: Re: [OE-core] [yocto] QA notification for completed autobuilder build (yocto-3.3_M2.rc1)
To: Sangeeta Jain <sangeeta.jain@intel.com>
Cc: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	"qa-build-notification@lists.yoctoproject.org" <qa-build-notification@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000416e8a05b9dea373"

--000000000000416e8a05b9dea373
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

gstreamer1.0: fix failing ptest
https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D7b90027aac9fa=
41b3dc98765151d761df8dabb97

Is this commit present yocto-3.3_M2.rc1 ?


Sangeeta Jain <sangeeta.jain@intel.com> escreveu no dia quarta, 27/01/2021
=C3=A0(s) 05:49:

> Hi All,
>
> This is the full report for yocto-3.3_M2.rc1:
>
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tre=
e/?h=3Dintel-yocto-testresults
>
> =3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
> No high milestone defects.
>
> new issue found
>
> BUG id:14203 - [QA 3.3 M2 RC1] failure in ptest :
> gstreamer1.0.gstreamer-1.0/pipelines_seek.test
>
>
> =3D=3D=3D=3D=3D=3D=3D Bugs =3D=3D=3D=3D=3D=3D=3D=3D
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14203
>
> Thanks,
> Sangeeta
>
> > -----Original Message-----
> > From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On
> Behalf
> > Of Pokybuild User
> > Sent: Thursday, 21 January, 2021 1:05 PM
> > To: yocto@lists.yoctoproject.org
> > Cc: qa-build-notification@lists.yoctoproject.org
> > Subject: [yocto] QA notification for completed autobuilder build (yoct=
o-
> > 3.3_M2.rc1)
> >
> >
> > A build flagged for QA (yocto-3.3_M2.rc1) was completed on the
> autobuilder
> > and is available at:
> >
> >
> >     https://autobuilder.yocto.io/pub/releases/yocto-3.3_M2.rc1
> >
> >
> > Build hash information:
> >
> > bitbake: 01e901c44ab0f496606b1d45c8953dc54970204c
> > meta-arm: a8f32f990a0d9dc1db310892c70d5a994c698b32
> > meta-gplv2: 6e8e969590a22a729db1ff342de57f2fd5d02d43
> > meta-intel: b4e5d33affeaa223459c0935a853485137b4591d
> > meta-kernel: 8349870943ba44bbd688656897372e881f32c741
> > meta-mingw: 352d8b0aa3c7bbd5060a4cc2ebe7c0e964de4879
> > oecore: 79821d5a185e25384f5b6b5158b238bbee17c79e
> > poky: b5e634644b69a968a93aad0dd0502cf479d3973a
> >
> >
> >
> > This is an automated message from the Yocto Project Autobuilder
> > Git: git://git.yoctoproject.org/yocto-autobuilder2
> > Email: richard.purdie@linuxfoundation.org
> >
> >
> >
>
>=20
>
>

--=20
best regards,
Jos=C3=A9 Quaresma

--000000000000416e8a05b9dea373
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>gstreamer1.0: fix failing ptest=
</div><div><a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/poky/commi=
t/?id=3D7b90027aac9fa41b3dc98765151d761df8dabb97">https://git.yoctoproject.=
org/cgit/cgit.cgi/poky/commit/?id=3D7b90027aac9fa41b3dc98765151d761df8dabb9=
7</a><br></div><div><br></div><div><div>Is this commit present=C2=A0<span s=
tyle=3D"color:rgb(0,0,0)">yocto-3.3_M2.rc1 ?</span></div><div><span style=
=3D"color:rgb(0,0,0)"><br></span></div><div></div></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Sangeeta Jain &lt;=
<a href=3D"mailto:sangeeta.jain@intel.com">sangeeta.jain@intel.com</a>&gt; =
escreveu no dia quarta, 27/01/2021 =C3=A0(s) 05:49:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Hi All,<br>
<br>
This is the full report for yocto-3.3_M2.rc1:=C2=A0 <br>
<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-co=
ntrib/tree/?h=3Dintel-yocto-testresults" rel=3D"noreferrer" target=3D"_blan=
k">https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tre=
e/?h=3Dintel-yocto-testresults</a><br>
<br>
=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D<br>
No high milestone defects.<br>
<br>
new issue found <br>
<br>
BUG id:14203 - [QA 3.3 M2 RC1] failure in ptest : gstreamer1.0.gstreamer-1=
.0/pipelines_seek.test<br>
<br>
<br>
=3D=3D=3D=3D=3D=3D=3D Bugs =3D=3D=3D=3D=3D=3D=3D=3D<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14203" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_b=
ug.cgi?id=3D14203</a><br>
<br>
Thanks,<br>
Sangeeta<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:yocto@lists.yoctoproject.org" target=3D"_blan=
k">yocto@lists.yoctoproject.org</a> &lt;<a href=3D"mailto:yocto@lists.yocto=
project.org" target=3D"_blank">yocto@lists.yoctoproject.org</a>&gt; On Beha=
lf<br>
&gt; Of Pokybuild User<br>
&gt; Sent: Thursday, 21 January, 2021 1:05 PM<br>
&gt; To: <a href=3D"mailto:yocto@lists.yoctoproject.org" target=3D"_blank"=
>yocto@lists.yoctoproject.org</a><br>
&gt; Cc: <a href=3D"mailto:qa-build-notification@lists.yoctoproject.org" t=
arget=3D"_blank">qa-build-notification@lists.yoctoproject.org</a><br>
&gt; Subject: [yocto] QA notification for completed autobuilder build (yoc=
to-<br>
&gt; 3.3_M2.rc1)<br>
&gt; <br>
&gt; <br>
&gt; A build flagged for QA (yocto-3.3_M2.rc1) was completed on the autobu=
ilder<br>
&gt; and is available at:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://autobuilder.yocto.io/pub/releas=
es/yocto-3.3_M2.rc1" rel=3D"noreferrer" target=3D"_blank">https://autobuild=
er.yocto.io/pub/releases/yocto-3.3_M2.rc1</a><br>
&gt; <br>
&gt; <br>
&gt; Build hash information:<br>
&gt; <br>
&gt; bitbake: 01e901c44ab0f496606b1d45c8953dc54970204c<br>
&gt; meta-arm: a8f32f990a0d9dc1db310892c70d5a994c698b32<br>
&gt; meta-gplv2: 6e8e969590a22a729db1ff342de57f2fd5d02d43<br>
&gt; meta-intel: b4e5d33affeaa223459c0935a853485137b4591d<br>
&gt; meta-kernel: 8349870943ba44bbd688656897372e881f32c741<br>
&gt; meta-mingw: 352d8b0aa3c7bbd5060a4cc2ebe7c0e964de4879<br>
&gt; oecore: 79821d5a185e25384f5b6b5158b238bbee17c79e<br>
&gt; poky: b5e634644b69a968a93aad0dd0502cf479d3973a<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; This is an automated message from the Yocto Project Autobuilder<br>
&gt; Git: git://<a href=3D"http://git.yoctoproject.org/yocto-autobuilder2"=
 rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/yocto-autobuilde=
r2</a><br>
&gt; Email: <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a><br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr">best regards,<br>Jos=C3=A9 Qua=
resma</div></div>

--000000000000416e8a05b9dea373--

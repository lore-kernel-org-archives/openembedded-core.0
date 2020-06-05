Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web10.10344.1591362665837883163
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2020 06:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=Aqpqg0Ei;
 spf=pass (domain: blade-group.com, ip: 209.85.167.170, mailfrom: yann.dirson@blade-group.com)
Received: by mail-oi1-f170.google.com with SMTP id i74so8180276oib.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2020 06:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=yp5C4TIjl2PY3GHpVonS4Avl92w+OsTloJ+srGA/FcE=;
        b=Aqpqg0EifjwLwWgjodl9YRfxphzc/wtn9Pgsf+cCSpPkxW6vs+Ghwmb+OqhP3dPQ5b
         4wV0oz9zoNh7kOkxpy4cNDUwHhl1Cs3ET0iZG1BrqxTueGDHhVJP26GE9pLhiNHXmhVa
         fx3zTpncIExat/9YYQJ2n9spziVsrNZ2lHoY1x53mEgUAiPo262BPOYarOpvbPw5w+3G
         tTTmSk0X5B1fGSuZwkeKFrRf3ic+PdA+M4SrHt2MHufZcv8Rz1tC7ATa6U+HTmORevZ7
         WpsNXz14m64ePMb6BmKtxwNmGyK3eICNowpGx/7IoKNXAqKNCdqRWOXdHMADYsH+XpgZ
         rhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=yp5C4TIjl2PY3GHpVonS4Avl92w+OsTloJ+srGA/FcE=;
        b=n3aAtTpyfvFn/FGmPd4EqiTcTqAGjSf0a7lp+RUWtUuExgP8GOZ00iQp1WQJRFZhTA
         4u1i6mclu1k4KSdwAST2C/sUv6tY0dQfWhwmIk1CXVfrDN8pSTe+nfYEluxpTPNiTnxE
         v+TiDiXaXskLoznuBvehE3iEux6CxVgZ6npZ0XwN45FraMdouCUKeCvsdh3Gary7NYgX
         Zykw4X9BHTSn0WVIl03ar/sQSU6FVqSyNrz9EUmbfNepr5a2nbZDZL41kTuCMoKu14U8
         e8xkPMAQFF9WwbZqf48PqG5QI4rlWsZJ6gyPJrUxRfUTEx19H7v8c+Smgg/J5sECYJiW
         acVA==
X-Gm-Message-State: AOAM5328eiAwMUPWSJ17p8L2wcFfUVLgkGjUZc+ljWRYVMfVcpxOEtHj
	FV4i3Ya60MM3Qv5YzbLweVGriZw4qjq1FBMLEBXQHvKayQH+Tw==
X-Google-Smtp-Source: ABdhPJzzilJVs0KNfGY7TkpLoR+qwmbe2XpYLFRMCpVxB5QvY4T75B4sQgXPcxXNd25lpTunTYob2MMFNicslmXjXgQ=
X-Received: by 2002:aca:eb56:: with SMTP id j83mr1928815oih.110.1591362664866;
 Fri, 05 Jun 2020 06:11:04 -0700 (PDT)
MIME-Version: 1.0
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Fri, 5 Jun 2020 15:10:53 +0200
Message-ID: <CA+4=imbTdacbhmydbXLTMQm8jvNoZJfzt17Y0ZcR2gRAC7LQSg@mail.gmail.com>
Subject: Status of support for recent host glibc
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000593a8005a755fe09"

--000000000000593a8005a755fe09
Content-Type: text/plain; charset="UTF-8"

I just got hit by the following dunfell build issue on my debian/testing
dev box:

 argp-fmtstream.c:(.text+0x4ca): undefined reference to `_IO_fwide'
 /home/yann/yocto/meta-blade/meta-shadow-os/build-boxv2/tmp/hosttools/ld:
argp-fmtstream.c:(.text+0x51d): undefined reference to `_IO_fwide'
 /home/yann/yocto/meta-blade/meta-shadow-os/build-boxv2/tmp/hosttools/ld:
argp-help.o: in function `argp_failure':
 argp-help.c:(.text+0x1fb1): undefined reference to `_IO_fwide'
 collect2: error: ld returned 1 exit status
 make: *** [Makefile:60: localedef] Error 1

After some digging I found https://patchwork.openembedded.org/series/20136
whose patch 4
addresses this very problem.

I could not find any discussion about those patches (it's hard to be sure
though, I found the
new mail archive quite impractical).

Are there any reasons why this 2019-09 series is still NEW ?

-- 
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech

--000000000000593a8005a755fe09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I just got hit by the following dunfell build issue o=
n my debian/testing dev box:<br></div><div><br></div><div>=C2=A0argp-fmtstr=
eam.c:(.text+0x4ca): undefined reference to `_IO_fwide&#39;<br>=C2=A0/home/=
yann/yocto/meta-blade/meta-shadow-os/build-boxv2/tmp/hosttools/ld: argp-fmt=
stream.c:(.text+0x51d): undefined reference to `_IO_fwide&#39;<br>=C2=A0/ho=
me/yann/yocto/meta-blade/meta-shadow-os/build-boxv2/tmp/hosttools/ld: argp-=
help.o: in function `argp_failure&#39;:<br>=C2=A0argp-help.c:(.text+0x1fb1)=
: undefined reference to `_IO_fwide&#39;<br>=C2=A0collect2: error: ld retur=
ned 1 exit status<br>=C2=A0make: *** [Makefile:60: localedef] Error 1</div>=
<div><br></div><div>After some digging I found <a href=3D"https://patchwork=
.openembedded.org/series/20136">https://patchwork.openembedded.org/series/2=
0136</a> whose patch 4</div><div>addresses this very problem.</div><div><br=
></div><div>I could not find any discussion about those patches (it&#39;s h=
ard to be sure though, I found the</div><div>new mail archive quite impract=
ical).</div><div><br></div><div>Are there any reasons why this 2019-09 seri=
es is still NEW ?<br></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature" data-smartmail=3D"gmail_signature">Yann Dirson &lt;<a href=
=3D"mailto:yann@blade-group.com" target=3D"_blank">yann@blade-group.com</a>=
&gt;<br>Blade / Shadow -- <a href=3D"http://shadow.tech" target=3D"_blank">=
http://shadow.tech</a><br><br></div></div>

--000000000000593a8005a755fe09--

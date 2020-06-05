Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.10433.1591362888172299737
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2020 06:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=lOmtkFwk;
 spf=pass (domain: blade-group.com, ip: 209.85.210.52, mailfrom: yann.dirson@blade-group.com)
Received: by mail-ot1-f52.google.com with SMTP id o13so7545507otl.5
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2020 06:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CmGzcg0kTXCip9fCl23ACQNax9+ESvOgVhjR4Gcs5gE=;
        b=lOmtkFwkBaXofPX6ZJgR+GmCx2dxgcii4tk/HzZqnyw1JmOXuVam/d2uVD+zTzpmmO
         r/vZjg2VMgvVeXk77Iv39FeKfKldevn8wxpwSWWxlwqp6CmHc/0UcA0yBgCEcpbRccQO
         As1bajJAHVGEwPCtwYMVlOQU1/Rf+DEdS2yGvjqQ2yCEAaw/XOMImY+6o5JoiKTaCl+D
         KnO1oRm5dsEb+7vInfHx7UrmWCTsvyphyE2xeJfr2C5yqkO7VQ8rH0jHdbPoCXwZKTG+
         BDWTE2jUlfyioo917tDqt0es0O3ZYz1eOo18qUQthxnISxw4WePWrrijG6xmWpepe4zb
         7PZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CmGzcg0kTXCip9fCl23ACQNax9+ESvOgVhjR4Gcs5gE=;
        b=jKt7CTp8QGG09Rzrwq4FWo+I/cmg6hYj4rbpuSUm68Z6D7cBxeas3W7aqv84dcoX+a
         fRI8r8Gb0QqHZgqVknDYOm2B47wvQ9nkZhekPiKhAEpVZofRYnOjFmQVsbFg4v9WOqiX
         XRmuuWCLFwBt/7/TnOXe6R2nanOKIpUN/vG4QBqkNFOVBCmWwgAKObQNDXc/nbVo8PqB
         o/KqqBGvdG+QEly17bKHecux4dwg5cca0ltY2jdFfRBK4lu0NfP+/23e2JfS2nRpRFQ8
         RXxsEiZnNc1quNw8xb5RnJK6lig/ZEKS8SuV1Y/i3MNeJfVCHqbED+1ctFw42IW11/GC
         oqDw==
X-Gm-Message-State: AOAM533NAV1oeD0nUGfDX2n3CjQ+54P0GYgjCKX+Oc7ywQH+7f0FwnU7
	eQxpPkCCXXoPmOtgxnJDLUkWMqXolzGFR8OlSARTzg==
X-Google-Smtp-Source: ABdhPJxECCD6c4BgNWEiw8ZOlGC7dCie1Jq7B30in+gOQ1HgMALD3iSwCeoe9TZXyYXIsfHFIgha8NgMlg8g8I1uG7w=
X-Received: by 2002:a05:6830:1af4:: with SMTP id c20mr7848617otd.191.1591362887475;
 Fri, 05 Jun 2020 06:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <1615A7E9D8CB7FC6.25101@lists.openembedded.org>
In-Reply-To: <1615A7E9D8CB7FC6.25101@lists.openembedded.org>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Fri, 5 Jun 2020 15:14:34 +0200
Message-ID: <CA+4=imaaV_2OtheyeYqcV1tFgiPGe3OMsj=rA8EWRXO5XD0FRw@mail.gmail.com>
Subject: Re: [OE-core] Status of support for recent host glibc
To: yann.dirson@blade-group.com
Cc: openembedded-core@lists.openembedded.org, 
	=?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009e24a005a7560ba3"

--0000000000009e24a005a7560ba3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 5 juin 2020 =C3=A0 15:11, Yann Dirson via lists.openembedded.org
<yann.dirson=3Dblade-group.com@lists.openembedded.org> a =C3=A9crit :

> I just got hit by the following dunfell build issue on my debian/testing
> dev box:
>

My bad (too many build trees), it is a sumo build.


>  argp-fmtstream.c:(.text+0x4ca): undefined reference to `_IO_fwide'
>  /home/yann/yocto/meta-blade/meta-shadow-os/build-boxv2/tmp/hosttools/ld=
:
> argp-fmtstream.c:(.text+0x51d): undefined reference to `_IO_fwide'
>  /home/yann/yocto/meta-blade/meta-shadow-os/build-boxv2/tmp/hosttools/ld=
:
> argp-help.o: in function `argp_failure':
>  argp-help.c:(.text+0x1fb1): undefined reference to `_IO_fwide'
>  collect2: error: ld returned 1 exit status
>  make: *** [Makefile:60: localedef] Error 1
>
> After some digging I found https://patchwork.openembedded.org/series/201=
36
> whose patch 4
> addresses this very problem.
>
> I could not find any discussion about those patches (it's hard to be sur=
e
> though, I found the
> new mail archive quite impractical).
>
> Are there any reasons why this 2019-09 series is still NEW ?
>
> --
> Yann Dirson <yann@blade-group.com>
> Blade / Shadow -- http://shadow.tech
>
>=20
>


--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech

--0000000000009e24a005a7560ba3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">Le=C2=A0ven. 5 juin 2020 =C3=A0=C2=A015:11, Yann Dirson via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;yann.dir=
son=3D<a href=3D"mailto:blade-group.com@lists.openembedded.org">blade-group=
.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>I just got hi=
t by the following dunfell build issue on my debian/testing dev box:<br></d=
iv></div></blockquote><div><br></div><div>My bad (too many build trees), it=
 is a sumo build.</div><div><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div></div><div><br></div><div>=C2=A0argp-fmt=
stream.c:(.text+0x4ca): undefined reference to `_IO_fwide&#39;<br>=C2=A0/ho=
me/yann/yocto/meta-blade/meta-shadow-os/build-boxv2/tmp/hosttools/ld: argp-=
fmtstream.c:(.text+0x51d): undefined reference to `_IO_fwide&#39;<br>=C2=A0=
/home/yann/yocto/meta-blade/meta-shadow-os/build-boxv2/tmp/hosttools/ld: ar=
gp-help.o: in function `argp_failure&#39;:<br>=C2=A0argp-help.c:(.text+0x1f=
b1): undefined reference to `_IO_fwide&#39;<br>=C2=A0collect2: error: ld re=
turned 1 exit status<br>=C2=A0make: *** [Makefile:60: localedef] Error 1</d=
iv><div><br></div><div>After some digging I found <a href=3D"https://patchw=
ork.openembedded.org/series/20136" target=3D"_blank">https://patchwork.open=
embedded.org/series/20136</a> whose patch 4</div><div>addresses this very p=
roblem.</div><div><br></div><div>I could not find any discussion about thos=
e patches (it&#39;s hard to be sure though, I found the</div><div>new mail =
archive quite impractical).</div><div><br></div><div>Are there any reasons =
why this 2019-09 series is still NEW ?<br></div><div><br></div>-- <br><div =
dir=3D"ltr">Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" target=
=3D"_blank">yann@blade-group.com</a>&gt;<br>Blade / Shadow -- <a href=3D"h=
ttp://shadow.tech" target=3D"_blank">http://shadow.tech</a><br><br></div></=
div>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature">Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" ta=
rget=3D"_blank">yann@blade-group.com</a>&gt;<br>Blade / Shadow -- <a href=
=3D"http://shadow.tech" target=3D"_blank">http://shadow.tech</a><br><br></=
div></div>

--0000000000009e24a005a7560ba3--

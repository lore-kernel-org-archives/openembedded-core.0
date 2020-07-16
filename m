Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web11.16819.1594909906027703976
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 07:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oei/fqC3;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id l12so1824170uak.7
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 07:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Dtgg+l9xZbrhcDbJ5FRxZCfYFQn9p+MtYiLnAV575IA=;
        b=oei/fqC3adCoikavjzDZX3OW0pzGUSggwBMzyMsPRO9c/pi1pRTL5JhzxLKZEmBeEw
         zr8uP+a8C9ToKzAucAX4AdT+AyHuK9fPy5/wO7l+u9heDSwN+28geuvIsLlzhVLpOt2H
         XGKzVOTt/fpAihgE9t2V+eBU3pvJutxahAPhTTr875a4KsVpy91VSjECIGGMkvq0Qgv+
         pBlu6+HTrsJXIWoz9c4WY8jFf8UVlKXx0M7zwGaQ28q9v4o5IkLixIrmwd0wadBZ2QlE
         npPsg8E0oEmLSkchP2vmQR2jUdwIEGrZSDCRlUkLbCOiGJM5Sn3vcQxLTLOKMIgwnbKe
         lYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Dtgg+l9xZbrhcDbJ5FRxZCfYFQn9p+MtYiLnAV575IA=;
        b=DINfRwAxnaNFFLq4nNNa2mU9KTQx/0gIN+Dxn0CoB7759hJOpICT4taPdUeOlZEGqX
         TjrehzEZLZG7HpRI+HaDPRZbPXZRcpNRuwEoIzWRljrd/Cnfk3lVZZjpNVuvqvieN6W0
         OU3bXaBOWZu2KVPTG5B6P2xsDppFJ+LqnrETlxsJonib+cFyu3UxQxnEmWgeGT3sDmhF
         U+G9CGTQ3iX3Nee+Og4N38mezM99QFlhPY77igelSB0RYAePhnU2tn0jxeObEqRQFDuX
         0mocc73KgkTyIKR4L8GCce5D6ADJMw6MIUgEHRyLyIWbp+cLcTJ3f/YXK7s+qYJnxUlp
         igyw==
X-Gm-Message-State: AOAM533GhkrMiPphaRGz4sz4gxkQ6dEeLeiDJsqFKPXglgKE/r1TWezp
	JvYb9dl3wvwtuvoG0UE6qAKGrcdeO45lnHqeOnxqzxT7
X-Google-Smtp-Source: ABdhPJzKxSIrsoaPcwz0eienFOZZTOq+vmGnexFA+iCWRm3JOjmbFW34z/x/m88EhfgNkgdJp5R0qNPGuaM1Ue3dRk8=
X-Received: by 2002:ab0:6f0a:: with SMTP id r10mr4407695uah.100.1594909904827;
 Thu, 16 Jul 2020 07:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200715164441.DDD23E01EAA@yocto-www.yoctoproject.org>
In-Reply-To: <20200715164441.DDD23E01EAA@yocto-www.yoctoproject.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 16 Jul 2020 16:31:32 +0200
Message-ID: <CANNYZj8drAJ8fvTC_KPhQ3yZr7KN7iaB-616DnQHmf43TjCFmg@mail.gmail.com>
Subject: Re: [OE-core] [AUH] Upgrade status: 2020-07-15
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000537a1105aa8fe6ac"

--000000000000537a1105aa8fe6ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

we have changed the AUH behavior so that it sends all upgrade patches not
just to maintainers, but also to this mailing list. What this means is tha=
t
if you are interested in an upgrade, and would like to contribute to Yocto=
,
do not hesitate to take these patches, and send them to the mailing list
according to instructions in the mails. Do not wait for 'official'
maintainers to do it!

Thanks,
Alex

On Wed, 15 Jul 2020 at 18:44, <auh@auh.yoctoproject.org> wrote:

> Recipe upgrade statistics:
>
>     * Failed (devtool error): 14
>         bind, 9.16.4, Armin Kuster <akuster808@gmail.com>
>         kbd, 2.3.0, Alexander Kanavin <alex.kanavin@gmail.com>
>         sysvinit, 2.97, Ross Burton <ross.burton@arm.com>
>         gnu-config, 20200621-new-commits-available, Robert Yang <
> liezhi.yang@windriver.com>
>         llvm, 10.0.0, Khem Raj <raj.khem@gmail.com>
>         meson, 0.55.0, Alexander Kanavin <alex.kanavin@gmail.com>
>         nasm, 2.15.02, Richard Purdie <richard.purdie@linuxfoundation.or=
g>
>         rsync, 3.2.2, Yi Zhao <yi.zhao@windriver.com>
>         vala, 0.48.7, Alexander Kanavin <alex.kanavin@gmail.com>
>         logrotate, 3.17.0, Yi Zhao <yi.zhao@windriver.com>
>         libva-initial, 2.8.0, Anuj Mittal <anuj.mittal@intel.com>
>         libva-utils, 2.8.0, Anuj Mittal <anuj.mittal@intel.com>
>         vulkan-demos, git-new-commits-available, Ross Burton <
> ross.burton@arm.com>
>         libcap, 2.39, Yi Zhao <yi.zhao@windriver.com>
>     * Succeeded: 27
>         libuv, 1.38.1, Armin Kuster <akuster@mvista.com>
>         init-system-helpers, 1.58, Anuj Mittal <anuj.mittal@intel.com>
>         btrfs-tools, 5.7, Alexander Kanavin <alex.kanavin@gmail.com>
>         createrepo-c, 0.16.0, Alexander Kanavin <alex.kanavin@gmail.com>
>         dpkg, 1.20.5, An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.com>
>         mtd-utils, 2.1.2, Denys Dmytriyenko <denys@ti.com>
>         python3-cython, 0.29.21, Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>
>         python3-git, 3.1.7, Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>
>         python3-pycryptodome, 3.9.8, Joshua Watt <JPEWhacker@gmail.com>
>         python3-pycryptodomex, 3.9.8, Joshua Watt <JPEWhacker@gmail.com>
>         asciidoc, 9.0.1, Yi Zhao <yi.zhao@windriver.com>
>         libnsl2, 1.3.0, Khem Raj <raj.khem@gmail.com>
>         rpcsvc-proto, 1.4.2, Khem Raj <raj.khem@gmail.com>
>         stress-ng, 0.11.15, Anuj Mittal <anuj.mittal@intel.com>
>         epiphany, 3.36.3, Alexander Kanavin <alex.kanavin@gmail.com>
>         libhandy, 0.80.0, Alexander Kanavin <alex.kanavin@gmail.com>
>         piglit, 1.0-new-commits-available, Ross Burton <
> ross.burton@arm.com>
>         vulkan-headers, 1.2.141.0, Anuj Mittal <anuj.mittal@intel.com>
>         ffmpeg, 4.3.1, Alexander Kanavin <alex.kanavin@gmail.com>
>         mpg123, 1.26.2, Alexander Kanavin <alex.kanavin@gmail.com>
>         x264, r2991-new-commits-available, Anuj Mittal <
> anuj.mittal@intel.com>
>         webkitgtk, 2.28.3, Alexander Kanavin <alex.kanavin@gmail.com>
>         diffoscope, 151, Joshua Watt <JPEWhacker@gmail.com>
>         gnupg, 2.2.21, Hongxu Jia <hongxu.jia@windriver.com>
>         libevent, 2.1.12, Anuj Mittal <anuj.mittal@intel.com>
>         libgcrypt, 1.8.6, Hongxu Jia <hongxu.jia@windriver.com>
>         mpfr, 4.1.0, Khem Raj <raj.khem@gmail.com>
>     * Failed(do_compile): 6
>         go-runtime, 1.14.5, Khem Raj <raj.khem@gmail.com>
>         go, 1.14.5, Khem Raj <raj.khem@gmail.com>
>         python3-setuptools, 49.2.0, Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>
>         python3, 3.8.4, Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>
>         vulkan-loader, 1.2.141.0, Anuj Mittal <anuj.mittal@intel.com>
>         vulkan-tools, 1.2.141.0, Anuj Mittal <anuj.mittal@intel.com>
>     * Failed(other errors): 2
>         libva, 2.8.0, Anuj Mittal <anuj.mittal@intel.com>
>         mesa, 20.1.3, Otavio Salvador <otavio.salvador@ossystems.com.br>
>
>     TOTAL: attempted=3D49 succeeded=3D27(55.10%) failed=3D22(44.90%)
>
> Recipe upgrade statistics per Maintainer:
>
>     Anuj Mittal <anuj.mittal: attempted=3D10 succeeded=3D5(50.00%)
> failed=3D5(50.00%)
>     Richard Purdie <richard.purdie: attempted=3D1 succeeded=3D0(0.00%)
> failed=3D1(100.00%)
>     Alexander Kanavin <alex.kanavin: attempted=3D10 succeeded=3D7(70.00%=
)
> failed=3D3(30.00%)
>     Ross Burton <ross.burton: attempted=3D3 succeeded=3D1(33.33%)
> failed=3D2(66.67%)
>     An=C3=ADbal Lim=C3=B3n <limon.anibal: attempted=3D1 succeeded=3D1(10=
0.00%)
> failed=3D0(0.00%)
>     Robert Yang <liezhi.yang: attempted=3D1 succeeded=3D0(0.00%)
> failed=3D1(100.00%)
>     Armin Kuster <akuster808: attempted=3D1 succeeded=3D0(0.00%)
> failed=3D1(100.00%)
>     Denys Dmytriyenko <denys: attempted=3D1 succeeded=3D1(100.00%)
> failed=3D0(0.00%)
>     Hongxu Jia <hongxu.jia: attempted=3D2 succeeded=3D2(100.00%)
> failed=3D0(0.00%)
>     Khem Raj <raj.khem: attempted=3D6 succeeded=3D3(50.00%) failed=3D3(5=
0.00%)
>     Armin Kuster <akuster: attempted=3D1 succeeded=3D1(100.00%) failed=
=3D0(0.00%)
>     Oleksandr Kravchuk <open.source: attempted=3D4 succeeded=3D2(50.00%)
> failed=3D2(50.00%)
>     Yi Zhao <yi.zhao: attempted=3D4 succeeded=3D1(25.00%) failed=3D3(75.=
00%)
>     Joshua Watt <JPEWhacker: attempted=3D3 succeeded=3D3(100.00%)
> failed=3D0(0.00%)
>     Otavio Salvador <otavio.salvador: attempted=3D1 succeeded=3D0(0.00%)
> failed=3D1(100.00%)
>=20
>

--000000000000537a1105aa8fe6ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello all,</div><div><br></div><div>we have changed t=
he AUH behavior so that it sends all upgrade patches not just to maintainer=
s, but also to this mailing list. What this means is that if you are intere=
sted in an upgrade, and would like to contribute to Yocto, do not hesitate =
to take these patches, and send them to the mailing list according to instr=
uctions in the mails. Do not wait for &#39;official&#39; maintainers to do =
it!</div><div><br></div><div>Thanks,</div><div>Alex<br></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 15 Jul=
 2020 at 18:44, &lt;<a href=3D"mailto:auh@auh.yoctoproject.org">auh@auh.yoc=
toproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Recipe upgrade statistics:<br>
<br>
=C2=A0 =C2=A0 * Failed (devtool error): 14<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bind, 9.16.4, Armin Kuster &lt;<a href=3D"mail=
to:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 kbd, 2.3.0, Alexander Kanavin &lt;<a href=3D"m=
ailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysvinit, 2.97, Ross Burton &lt;<a href=3D"mai=
lto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gnu-config, 20200621-new-commits-available, Ro=
bert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank=
">liezhi.yang@windriver.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 llvm, 10.0.0, Khem Raj &lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meson, 0.55.0, Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.co=
m</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 nasm, 2.15.02, Richard Purdie &lt;<a href=3D"m=
ailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@=
linuxfoundation.org</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rsync, 3.2.2, Yi Zhao &lt;<a href=3D"mailto:yi=
.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vala, 0.48.7, Alexander Kanavin &lt;<a href=3D=
"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a=
>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 logrotate, 3.17.0, Yi Zhao &lt;<a href=3D"mail=
to:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libva-initial, 2.8.0, Anuj Mittal &lt;<a href=
=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com<=
/a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libva-utils, 2.8.0, Anuj Mittal &lt;<a href=3D=
"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vulkan-demos, git-new-commits-available, Ross =
Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.bu=
rton@arm.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libcap, 2.39, Yi Zhao &lt;<a href=3D"mailto:yi=
.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
=C2=A0 =C2=A0 * Succeeded: 27<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libuv, 1.38.1, Armin Kuster &lt;<a href=3D"mai=
lto:akuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 init-system-helpers, 1.58, Anuj Mittal &lt;<a =
href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.c=
om</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 btrfs-tools, 5.7, Alexander Kanavin &lt;<a hre=
f=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.co=
m</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 createrepo-c, 0.16.0, Alexander Kanavin &lt;<a=
 href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmai=
l.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dpkg, 1.20.5, An=C3=ADbal Lim=C3=B3n &lt;<a hr=
ef=3D"mailto:limon.anibal@gmail.com" target=3D"_blank">limon.anibal@gmail.c=
om</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mtd-utils, 2.1.2, Denys Dmytriyenko &lt;<a hre=
f=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-cython, 0.29.21, Oleksandr Kravchuk &l=
t;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">o=
pen.source@oleksandr-kravchuk.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-git, 3.1.7, Oleksandr Kravchuk &lt;<a =
href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.s=
ource@oleksandr-kravchuk.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-pycryptodome, 3.9.8, Joshua Watt &lt;<=
a href=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank">JPEWhacker@gmail.c=
om</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-pycryptodomex, 3.9.8, Joshua Watt &lt;=
<a href=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank">JPEWhacker@gmail.=
com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 asciidoc, 9.0.1, Yi Zhao &lt;<a href=3D"mailto=
:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libnsl2, 1.3.0, Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rpcsvc-proto, 1.4.2, Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 stress-ng, 0.11.15, Anuj Mittal &lt;<a href=3D=
"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 epiphany, 3.36.3, Alexander Kanavin &lt;<a hre=
f=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.co=
m</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libhandy, 0.80.0, Alexander Kanavin &lt;<a hre=
f=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.co=
m</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 piglit, 1.0-new-commits-available, Ross Burton=
 &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@a=
rm.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vulkan-headers, 1.2.141.0, Anuj Mittal &lt;<a =
href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.c=
om</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ffmpeg, 4.3.1, Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.co=
m</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mpg123, 1.26.2, Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.co=
m</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 x264, r2991-new-commits-available, Anuj Mittal=
 &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal=
@intel.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 webkitgtk, 2.28.3, Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.c=
om</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 diffoscope, 151, Joshua Watt &lt;<a href=3D"ma=
ilto:JPEWhacker@gmail.com" target=3D"_blank">JPEWhacker@gmail.com</a>&gt;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gnupg, 2.2.21, Hongxu Jia &lt;<a href=3D"mailt=
o:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libevent, 2.1.12, Anuj Mittal &lt;<a href=3D"m=
ailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libgcrypt, 1.8.6, Hongxu Jia &lt;<a href=3D"ma=
ilto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</=
a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mpfr, 4.1.0, Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 =C2=A0 * Failed(do_compile): 6<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 go-runtime, 1.14.5, Khem Raj &lt;<a href=3D"ma=
ilto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 go, 1.14.5, Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-setuptools, 49.2.0, Oleksandr Kravchuk=
 &lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank=
">open.source@oleksandr-kravchuk.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3, 3.8.4, Oleksandr Kravchuk &lt;<a href=
=
=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.sour=
ce@oleksandr-kravchuk.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vulkan-loader, 1.2.141.0, Anuj Mittal &lt;<a h=
ref=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.co=
m</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vulkan-tools, 1.2.141.0, Anuj Mittal &lt;<a hr=
ef=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com=
</a>&gt;<br>
=C2=A0 =C2=A0 * Failed(other errors): 2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libva, 2.8.0, Anuj Mittal &lt;<a href=3D"mailt=
o:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mesa, 20.1.3, Otavio Salvador &lt;<a href=3D"m=
ailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador@o=
ssystems.com.br</a>&gt;<br>
<br>
=C2=A0 =C2=A0 TOTAL: attempted=3D49 succeeded=3D27(55.10%) failed=3D22(44.=
90%)<br>
<br>
Recipe upgrade statistics per Maintainer:<br>
<br>
=C2=A0 =C2=A0 Anuj Mittal &lt;anuj.mittal: attempted=3D10 succeeded=3D5(50=
.00%) failed=3D5(50.00%)<br>
=C2=A0 =C2=A0 Richard Purdie &lt;richard.purdie: attempted=3D1 succeeded=
=3D0(0.00%) failed=3D1(100.00%)<br>
=C2=A0 =C2=A0 Alexander Kanavin &lt;alex.kanavin: attempted=3D10 succeeded=
=
=3D7(70.00%) failed=3D3(30.00%)<br>
=C2=A0 =C2=A0 Ross Burton &lt;ross.burton: attempted=3D3 succeeded=3D1(33.=
33%) failed=3D2(66.67%)<br>
=C2=A0 =C2=A0 An=C3=ADbal Lim=C3=B3n &lt;limon.anibal: attempted=3D1 succe=
eded=3D1(100.00%) failed=3D0(0.00%)<br>
=C2=A0 =C2=A0 Robert Yang &lt;liezhi.yang: attempted=3D1 succeeded=3D0(0.0=
0%) failed=3D1(100.00%)<br>
=C2=A0 =C2=A0 Armin Kuster &lt;akuster808: attempted=3D1 succeeded=3D0(0.0=
0%) failed=3D1(100.00%)<br>
=C2=A0 =C2=A0 Denys Dmytriyenko &lt;denys: attempted=3D1 succeeded=3D1(100=
.00%) failed=3D0(0.00%)<br>
=C2=A0 =C2=A0 Hongxu Jia &lt;hongxu.jia: attempted=3D2 succeeded=3D2(100.0=
0%) failed=3D0(0.00%)<br>
=C2=A0 =C2=A0 Khem Raj &lt;raj.khem: attempted=3D6 succeeded=3D3(50.00%) f=
ailed=3D3(50.00%)<br>
=C2=A0 =C2=A0 Armin Kuster &lt;akuster: attempted=3D1 succeeded=3D1(100.00=
%) failed=3D0(0.00%)<br>
=C2=A0 =C2=A0 Oleksandr Kravchuk &lt;open.source: attempted=3D4 succeeded=
=3D2(50.00%) failed=3D2(50.00%)<br>
=C2=A0 =C2=A0 Yi Zhao &lt;yi.zhao: attempted=3D4 succeeded=3D1(25.00%) fai=
led=3D3(75.00%)<br>
=C2=A0 =C2=A0 Joshua Watt &lt;JPEWhacker: attempted=3D3 succeeded=3D3(100.=
00%) failed=3D0(0.00%)<br>
=C2=A0 =C2=A0 Otavio Salvador &lt;otavio.salvador: attempted=3D1 succeeded=
=
=3D0(0.00%) failed=3D1(100.00%)<br>
<br>
</blockquote></div>

--000000000000537a1105aa8fe6ac--

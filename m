Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web10.1346.1591997879217628935
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 14:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PSVETXQJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id t26so3692631ual.13
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 14:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jIGeL98mRbIJkHxhw5E1vbQRYpfiEA4EXrqG9plA4nc=;
        b=PSVETXQJsvF/9tQ5jw8ddyAQgZ71xLexbkLC7mkW4ueFE9iFCKP0cNti1862M7e2LG
         nkTLB+RfMMw/aPB3c9AtpzgVetDoKoZJLpOziLaui9JyS7LIzLKp2fQ0Prvq6U44uVeT
         hm4UgAI+5zWdcIiT4fyn/IROAQk/FJZcLC0TeGwdzVDsQ9ZURbF/bIUQKFUHj1HyznWe
         9nsbD7/dZVD28ZaxWzHi35FqvjnyLLXm/XB0oBVms6rCzAoH1pwLycMTyuQiU4YYTa5n
         jc6ks9xVjrxGrWIdRhvHneixiczkWDcXmAh98vZc09lGEAVzh4NrAsoN9JpuUxX53sMh
         kMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jIGeL98mRbIJkHxhw5E1vbQRYpfiEA4EXrqG9plA4nc=;
        b=axTNST1l1GDQxem8QidrGfr/89racPdX/kl1TPFmaZZ1gvi/g40R9NEs4WD/aTfAl/
         wwYnv3unnSWqA5NodpIQNMBjT+2+pR6Te2caKtN/4tAftMWpiKIC2V4Ckbni1B0oZw3X
         tI3stKZHY3y5vBy5BndLX+Ro9DibY/87dfDTNRN3Uw0Oou35cBKkANge6ifiN9FU3kZj
         WOBtS9d3GH8xVbdC9t0bTTBGOHiFFPzM/E+G1txgu4LMGXj7bCnoQmClzlsRjbzCRWUA
         9bkXvz/TXYOCkPnaF/X0YGynRNppdOxwx8DrK2+xZ8M4EOATaYBt8OY1UHBSU0biDv9J
         2M+g==
X-Gm-Message-State: AOAM531LepqiGgZTZ28SAonDAh3AsXvAvnylwTW9RKWIO3pm7jzLgeQt
	In1K6IiGNiYiLUtVjjMqfvzV+zYUKNvKOiobrgs=
X-Google-Smtp-Source: ABdhPJyOfib9khLOHoRa1b9k5upIPeivZG3SGfnIMyq4CfGB3Td2qnoDw9rbJ7n2Wa6V3kABSZqRlrAkmxULAY6th9k=
X-Received: by 2002:ab0:168c:: with SMTP id e12mr11843661uaf.89.1591997878164;
 Fri, 12 Jun 2020 14:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <D7692CC3-34E3-41FE-BBE5-4D5B09947C92@xevo.com>
In-Reply-To: <D7692CC3-34E3-41FE-BBE5-4D5B09947C92@xevo.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 12 Jun 2020 23:37:46 +0200
Message-ID: <CANNYZj9AGMx2LLbf4nm7JTvkwi6CV4Bwu9w73xhivF-q6BBZ3g@mail.gmail.com>
Subject: Re: python3 recipe PGO tests
To: Ryan Rowe <rrowe@xevo.com>, Anuj Mittal <anuj.mittal@intel.com>, 
	Ross Burton <ross@burtonini.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Martin Kelly <mkelly@xevo.com>, Jim Broadus <jbroadus@xevo.com>
Content-Type: multipart/alternative; boundary="00000000000002e67f05a7e9e4c8"

--00000000000002e67f05a7e9e4c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Ryan,

I did not write the pgo bits, I only preserved them (without testing) when
the Python recipe was rewritten from scratch (by me) in order to bring some
sanity to it, and make it possible again to update it to newer versions.
The people you want to talk to are Anuj Mittal and Ross Burton (cc).

Alex

On Fri, 12 Jun 2020 at 23:28, Ryan Rowe <rrowe@xevo.com> wrote:

> Hello Alex,
>
>
>
> I=E2=80=99m investigating Python 3 performance issues on a Raspberry Pi Y=
octo
> build; I appreciate any insights you can provide into the problem.
>
>
>
> In my investigation, I noticed that PGO was disabled in all cases due to =
a
> small bug. I fixed it in a patch submitted to OE-Core (#139459
> <https://lists.openembedded.org/g/openembedded-core/message/139459>).
> Even when PGO is indeed enabled, Python 3 runs significantly slower on
> Yocto-compiled Python 3.8.3 than the same version compiled on Raspbian.
>
>
>
> In your patch,
> 0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
> <http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtool=
s/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.=
patch>,
> I see that you override the default PROFILE_TASK, which did not
> explicitly specify test suites, to a command that explicitly provides tes=
t
> suites. How did you decide on these tests? The standard PGO command runs =
43
> tests, while you specify 7. When I compile Python 3.8.3 on Raspbian, I se=
e
> no intersection between the 43 tests run by default and the 7 you specify=
.
> Additionally, the default module for PROFILE is test while you use
> test.regrtest.
>
>
>
> For reference, here=E2=80=99s the results of a simple CPU-bound test. The=
se tests
> were run on the same Raspberry Pi 4 with same SD card.
>
>
>
> python3 -m timeit -r 10 --setup '
> def fib(n):
>  if n < 2:
>    return n
>
>  if n =3D=3D 2:
>    return 1
>
>  return fib(n - 1) + fib(n - 2)
> ' '[fib(n) for n in range(20)]'
>
>
>
> # Yocto Python 3.8.3
> # 10 loops, best of 10: 28.9 msec per loop
> # 10 loops, best of 10: 29.3 msec per loop
> # 10 loops, best of 10: 27.9 msec per loop
> # 10 loops, best of 10: 30.4 msec per loop
> # Average result: 31.625 msec per loop
>
>
>
> # Raspbian Python 3.8.3
> # 50 loops, best of 10: 7.73 msec per loop
> # 50 loops, best of 10: 7.72 msec per loop
> # 50 loops, best of 10: 7.67 msec per loop
> # 50 loops, best of 10: 7.74 msec per loop
>
> # Average result: 7.715 msec per loop
>
>
>
> # Raspbian speedup: 4.09x
>
>
>
> Best,
>
> Ryan Rowe
>

--00000000000002e67f05a7e9e4c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Ryan,</div><div><br></div><div>I did not write =
the pgo bits, I only preserved them (without testing) when the Python recip=
e was rewritten from scratch (by me) in order to bring some sanity to it, a=
nd make it possible again to update it to newer versions. The people you wa=
nt to talk to are Anuj Mittal and Ross Burton (cc).</div><div><br></div><di=
v>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, 12 Jun 2020 at 23:28, Ryan Rowe &lt;<a href=3D"mail=
to:rrowe@xevo.com" target=3D"_blank">rrowe@xevo.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Hello Alex,</span><u>=
</u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0</span><u></u><=
u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">I=E2=80=99m investiga=
ting Python 3 performance issues on a Raspberry Pi Yocto build; I appreciat=
e any insights you can provide into the problem.</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0</span><u></u><=
u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">In my investigation, =
I noticed that PGO was disabled in all cases due to a small bug. I fixed it=
 in a patch submitted to OE-Core (<a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/139459" target=3D"_blank">#139459</a>).
 Even when PGO is indeed enabled, Python 3 runs significantly slower on Yoc=
to-compiled Python 3.8.3 than the same version compiled on Raspbian.</span>=
<u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0</span><u></u><=
u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">In your patch, <a hre=
f=3D"http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devto=
ols/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profil=
e.patch" target=3D"_blank">
0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch</a>, I see =
that you override the default
</span><span style=3D"font-size:11pt;font-family:Courier">PROFILE_TASK</spa=
n><span style=3D"font-size:11pt">, which did not explicitly specify test su=
ites, to a command that explicitly provides test suites. How did you decide=
 on these tests? The standard PGO
 command runs 43 tests, while you specify 7. When I compile Python 3.8.3 on=
 Raspbian, I see no intersection between the 43 tests run by default and th=
e 7 you specify. Additionally, the default module for
</span><span style=3D"font-size:11pt;font-family:Courier">PROFILE</span><sp=
an style=3D"font-size:11pt"> is
</span><span style=3D"font-size:11pt;font-family:Courier">test</span><span =
style=3D"font-size:11pt"> while you use
</span><span style=3D"font-size:11pt;font-family:Courier">test.regrtest</sp=
an><span style=3D"font-size:11pt">.</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0</span><u></u><=
u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">For reference, here=
=E2=80=99s the results of a simple CPU-bound test. These tests were run on =
the same Raspberry Pi 4 with same SD card.</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0</span><u></u><=
u></u></p>
<p class=3D"MsoNormal" style=3D"margin-right:0in;margin-bottom:3pt;margin-l=
eft:0in">
<span style=3D"font-size:9pt;font-family:Courier">python3 -m timeit -r 10 -=
-setup &#39;<br>
def fib(n):<br>
=C2=A0if n &lt; 2:<br>
=C2=A0=C2=A0=C2=A0return n</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-right:0in;margin-bottom:3pt;margin-l=
eft:0in">
<span style=3D"font-size:9pt;font-family:Courier">=C2=A0if n =3D=3D 2:<br>
=C2=A0=C2=A0=C2=A0return 1</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-right:0in;margin-bottom:3pt;margin-l=
eft:0in">
<span style=3D"font-size:9pt;font-family:Courier">=C2=A0return fib(n - 1) +=
 fib(n - 2)<br>
&#39; &#39;[fib(n) for n in range(20)]&#39;</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-right:0in;margin-bottom:3pt;margin-l=
eft:0in">
<span style=3D"font-size:11pt;font-family:Courier">=C2=A0</span><u></u><u><=
/u></p>
<p class=3D"MsoNormal" style=3D"margin-right:0in;margin-bottom:3pt;margin-l=
eft:0in">
<span style=3D"font-size:11pt;font-family:Courier"># Yocto Python 3.8.3<br>
</span><span style=3D"font-size:9pt;font-family:Courier"># 10 loops, best o=
f 10: 28.9 msec per loop<br>
# 10 loops, best of 10: 29.3 msec per loop<br>
# 10 loops, best of 10: 27.9 msec per loop<br>
# 10 loops, best of 10: 30.4 msec per loop<br>
# Average result: 31.625 msec per loop</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-right:0in;margin-bottom:3pt;margin-l=
eft:0in">
<span style=3D"font-size:9pt;font-family:Courier">=C2=A0</span><u></u><u></=
u></p>
<p class=3D"MsoNormal" style=3D"margin-right:0in;margin-bottom:3pt;margin-l=
eft:0in">
<span style=3D"font-size:11pt;font-family:Courier"># Raspbian Python 3.8.3<=
/span><span style=3D"font-size:9pt;font-family:Courier"><br>
# 50 loops, best of 10: 7.73 msec per loop<br>
# 50 loops, best of 10: 7.72 msec per loop<br>
# 50 loops, best of 10: 7.67 msec per loop<br>
# 50 loops, best of 10: 7.74 msec per loop</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-right:0in;margin-bottom:3pt;margin-l=
eft:0in">
<span style=3D"font-size:9pt;font-family:Courier"># Average result: 7.715 m=
sec per loop</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-right:0in;margin-bottom:3pt;margin-l=
eft:0in">
<span style=3D"font-size:9pt;font-family:Courier">=C2=A0</span><u></u><u></=
u></p>
<p class=3D"MsoNormal" style=3D"margin-right:0in;margin-bottom:3pt;margin-l=
eft:0in">
<span style=3D"font-size:9pt;font-family:Courier"># Raspbian speedup: 4.09x=
</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-right:0in;margin-bottom:3pt;margin-l=
eft:0in">
<span style=3D"font-size:9pt;font-family:Courier">=C2=A0</span><u></u><u></=
u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Best,</span><u></u><u=
></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Ryan Rowe</span><span=
 style=3D"font-size:11pt"><u></u><u></u></span></p>
</div>
</div>

</blockquote></div>

--00000000000002e67f05a7e9e4c8--

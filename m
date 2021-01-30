Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.6412.1612025698683079486
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Jan 2021 08:54:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hookUNYo;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e7so11486536ile.7
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Jan 2021 08:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fI2Iw6D29dn6/ApgPc836UwWkEAyoi+j98e+LYIIQEU=;
        b=hookUNYoLDrh7pruodxJ93S5lPhln/DkrUuizu5cov12kkd4ZCyQ1CzGl2v2uJhYak
         ELA0VGQykcgHtXFtsiAIhNYVMh6BOFaNptt/GW77/1J3FFnGvk2SKBt/wiKrhrGxzuOE
         rWzLSoLTMFfjxx0pBYB21In1Y9ajyA3FwbqWy+Q+JRYYre6OSs/89sUweWTnhR0u/KPa
         NdbJKwhJ28qGwm/ZYxSMCFvvP/FcazJi83NSSKEZesyRrYrMTmTcm18vs1BxFlXy39Oj
         Z7Ytw2B1+KMFJmhFS70xk3ZhTsJwC3B9H0Ib1slfQfoiXe6NoR+cy5xQ36PK2zQ14fbZ
         mZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fI2Iw6D29dn6/ApgPc836UwWkEAyoi+j98e+LYIIQEU=;
        b=oqcMZpLlF5pszwn+4JEeLFeIDjg3mAOORhdyjCSEpy5lTezgj293si3TvLvPklsVBq
         LWK+1h9ntlJBYu5mHa9+GvSMxOY7adWo/0y+RYEpkaNF1F4w4/wTngp6jtbq+qTsDTc4
         MxCPIjUCBW5xs0Uw9ilfZwPff1siH/IrAAL8hh8fvkKxZQZH8X3s9MkSCdgSc95lEYEX
         aulZJIdoDx5dtQVQ58SpuwlCq88gJkntd5aLW0FHYlHa+xckTWWwZctwh1KW0HzHXQ5V
         yGgnDF62QBhikuhJLK00ANSXx6oxqHw3Ot2xsKYJKsrw3QhZLx7+B5EfntT6zjwgwnI7
         QGgw==
X-Gm-Message-State: AOAM533IKI9/SYEMV69BVGg1li3/P+s6n85xM3A9g3JePj6yfLkk8l7E
	Qulf3ERcy3IpiWchTkZ3A3aP7elX4ZngJIjrKWE=
X-Google-Smtp-Source: ABdhPJzlyZsPeiRBbv4lM+zHeVBF6vcaoYYA62z4DhSRq0vTEo/9ZUO4k9U28r5ZclEmomrm1oxbOyi6DePqTlx604M=
X-Received: by 2002:a05:6e02:1d02:: with SMTP id i2mr7725566ila.30.1612025698105;
 Sat, 30 Jan 2021 08:54:58 -0800 (PST)
MIME-Version: 1.0
References: <20210128172313.7681-1-tomasz.dziendzielski@gmail.com>
 <70cd3945856eb783c7239fd716eeea39b127e773.camel@linuxfoundation.org> <165F0294B6476D79.25477@lists.openembedded.org>
In-Reply-To: <165F0294B6476D79.25477@lists.openembedded.org>
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
Date: Sat, 30 Jan 2021 17:57:31 +0100
Message-ID: <CAJkqNs2kh9d8NuCWyhuAaAbbe5n3yZpPVD=m-kHJyM_8dbwo-g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] bitbake: Don't treat mc recipe (Midnight Commander) as a multiconfig target
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, Jon Mason <jon.mason@arm.com>
Content-Type: multipart/alternative; boundary="0000000000001abc8005ba20fb74"

--0000000000001abc8005ba20fb74
Content-Type: text/plain; charset="UTF-8"

>>I did put this into testing anyway and it triggered errors in several
selftests:
>>
>>bitbake-selftest:
>>https
://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1792/steps/11/logs/stdio
<https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1792/steps/11/logs/stdio>
>>
>>and oe-selftest:
>>https
://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1792/steps/14/logs/stdio
<https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1792/steps/14/logs/stdio>
>>
>>(these occurred in all the selftest builds but I've just linked to one).

>It seems in these tests multiconfig targets can have more than 2 colons.
Probably changing "== 2" to ">= 2" should help.
>I tried "bitbake-selftest" and with this change and it passed.
Unfortunately now I don't have access to machine that could handle all
oe-selftest. Could we agree that I will send second patch so it will be
tested on autobuider?

Sorry, I misunderstood your words and thought some other than multiconfig
cases failed on other builds, while in fact it was just multiconfig
failures. Running "oe-selftest -a" would take ages on my machine. With the
">= 2" "bitbake-selftest" already passed and "oe-selftest -r multiconfig"
is correctly building things, instead of failing on "RunQueue" step. As
soon as the multiconfig tests pass I will submit a new patch to
bitbake-devel.

Best regards,
Tomasz Dziendzielsk

--0000000000001abc8005ba20fb74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span class=3D"gmail-im"><span style=3D"font-family:sans-s=
erif">&gt;&gt;I did put this into testing anyway and it triggered errors in=
 several</span><span style=3D"font-family:sans-serif"> selftests:</span><br=
 style=3D"font-family:sans-serif">&gt;&gt;<br style=3D"font-family:sans-ser=
if"><span style=3D"font-family:sans-serif">&gt;&gt;bitbake-selftest:</span>=
<br style=3D"font-family:sans-serif">&gt;&gt;https<a href=3D"https://autobu=
ilder.yoctoproject.org/typhoon/#/builders/87/builds/1792/steps/11/logs/stdi=
o" style=3D"font-family:sans-serif" rel=3D"noreferrer noreferrer noreferrer=
 noreferrer" target=3D"_blank">://autobuilder.yoctoproject.org/typhoon/#/bu=
ilders/87/builds/1792/steps/11/logs/stdio</a><br style=3D"font-family:sans-=
serif">&gt;&gt;<br style=3D"font-family:sans-serif"><span style=3D"font-fam=
ily:sans-serif">&gt;&gt;and oe-selftest:</span><br style=3D"font-family:san=
s-serif">&gt;&gt;https<a href=3D"https://autobuilder.yoctoproject.org/typho=
on/#/builders/87/builds/1792/steps/14/logs/stdio" style=3D"font-family:sans=
-serif" rel=3D"noreferrer noreferrer noreferrer noreferrer" target=3D"_blan=
k">://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1792/steps/=
14/logs/stdio</a><br style=3D"font-family:sans-serif">&gt;&gt;<br style=3D"=
font-family:sans-serif"><span style=3D"font-family:sans-serif">&gt;&gt;(the=
se occurred in all the selftest builds but I&#39;ve just linked to one).</s=
pan><div dir=3D"auto"><span style=3D"font-family:sans-serif"><br></span></d=
iv><div dir=3D"auto"><span style=3D"font-family:sans-serif">&gt;It seems in=
 these tests multiconfig targets can have more than 2 colons. Probably chan=
ging &quot;=3D=3D 2&quot; to &quot;&gt;=3D 2&quot; should help.</span></div=
><div dir=3D"auto"><span style=3D"font-family:sans-serif">&gt;I
 tried &quot;bitbake-selftest&quot; and with this change and it passed.=20
Unfortunately now I don&#39;t have access to machine that could handle all=
=20
oe-selftest. Could we agree that I will send second patch so it will be=20
tested on autobuider?</span></div><div dir=3D"auto"><span style=3D"font-fam=
ily:sans-serif"><br></span></div><div><span style=3D"font-family:sans-serif=
">Sorry, I misunderstood your words and thought some other than multiconfig=
 cases failed on other  builds, while in fact it was just multiconfig failu=
res. Running &quot;oe-selftest -a&quot; would take ages on my machine. With=
 the &quot;&gt;=3D 2&quot; &quot;bitbake-selftest&quot; already passed and =
&quot;oe-selftest -r multiconfig&quot; is correctly building things, instea=
d of failing on &quot;RunQueue&quot; step. As soon as the multiconfig tests=
 pass I will submit a new patch to bitbake-devel.</span></div><div><span st=
yle=3D"font-family:sans-serif"><br></span></div><div><span style=3D"font-fa=
mily:sans-serif">Best regards,</span></div><div><span style=3D"font-family:=
sans-serif">Tomasz Dziendzielsk</span></div></span><br></div>

--0000000000001abc8005ba20fb74--

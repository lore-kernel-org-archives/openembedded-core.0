Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com [209.85.222.68])
 by mx.groups.io with SMTP id smtpd.web12.16727.1598527530226028918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 04:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=riS/hkuN;
 spf=pass (domain: gmail.com, ip: 209.85.222.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f68.google.com with SMTP id b12so1541942uae.9
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 04:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sUgVhwQC4u7IcAXBHv4p+xppJxNnWCt2ndwLXKlj7BQ=;
        b=riS/hkuN1+CtO6uWgBgemBhjCCwtbPegIkGPPah4aXNUwZiuxl1QeCIVVMJRH1fvsK
         ureYsmCixrJgBWyFXaH+AUrfYPdTZeb0XS+CjYxvQOHhRyzzSVM9aX5bjTmOiyuvFGxM
         G1KZsV+Z0+GrQAfsKO80SBJsI+yvyBlpdnJGipTwF8WZYry7yN2vsmWyBvpt4zUFym07
         WJkyO0wWJsimpVKJX7r5rspU3ex76/OIWJKoYko5SRFQSSwqtIfr/nhFb2vy02NJiDWs
         2XkV276ne4VKWELMFeuio5oxLTGeCSv2p4TwyW+OqMHuwFXFY+tnXsM42A3jMIpmNhXL
         VUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sUgVhwQC4u7IcAXBHv4p+xppJxNnWCt2ndwLXKlj7BQ=;
        b=CL1nRvp6jKkHiPSfImw7ozfF1EBtOZ6kCZ9b8NWipQo/7H6/sCOZ06KkWx4sHygBfW
         bmY2z/yVhZUikbpaKH2U+UkgY9jRJvIJ3lcvOX5ca1T6spKlazozOlxzxBJDVWWPuEyP
         haXAFeJdt5zufjUKxGL73tRl3Frvsp4BXHPkfc1yY53a+KU6tw1MpwaMgD/5zIk/rbUj
         i25EcpZYpkM7k6MLuRjiJLMomzcqCYEzg4ELoDSHX5e4MplnC84Ye/RMgCY73epDRyRI
         O6wSmXaOG8JX6u9LhybX4ttMmijMuwfRLQI79Dpcjo3P4wuAewod+K5Mm04FY2oezdGq
         o2jw==
X-Gm-Message-State: AOAM532AQyLrYVt9kZcgPL65xpB2TJNRGLqgxWcFLyuEzc0gQIsfeGrs
	UjeQCV/BWSrRN3XwrhaxmzByMkQRsgNRxVehwUo=
X-Google-Smtp-Source: ABdhPJwXDOnnrLXdATIVVftQu7SjOV8cYnvkCI1adRspLZgHHZHJGHtiqi6T5vzxWzZ7hq08ZFj6aG6F+nNir/FCe8w=
X-Received: by 2002:ab0:601a:: with SMTP id j26mr4130724ual.22.1598527529405;
 Thu, 27 Aug 2020 04:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200827105933.3575-1-alex.kanavin@gmail.com> <20200827105933.3575-6-alex.kanavin@gmail.com>
 <7c38e0ce946af6c0f1075b95c5f41e6f772c9241.camel@linuxfoundation.org>
In-Reply-To: <7c38e0ce946af6c0f1075b95c5f41e6f772c9241.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 27 Aug 2020 13:25:17 +0200
Message-ID: <CANNYZj9kX8td0hAPyWtT=Jyd5+5fkoneX-j9btxU3OYEowUseA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] oeqa/multilib: un-skip the connman test
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008dd28b05adda3173"

--0000000000008dd28b05adda3173
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2020 at 13:06, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Hmm. I think this test is only meant to trigger in a lib32-core-image-
> sato where lib32-connman would be present and connman would not?
>
> The test name could certainly be clearer as its not a generic connman
> test...
>

There is no lib32-core-image-sato anywhere in config.json  - and I think
RPM_PREFER_ELF_ARCH in existing tests should ensure that 32 bit connman
package takes precedence.

Also note that those same tests install lib32-connman, which can only be
for the purpose of the test:
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json#n495

--0000000000008dd28b05adda3173
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 27 Aug 2020 at 13:06, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hmm. I think this test is o=
nly meant to trigger in a lib32-core-image-<br>
sato where lib32-connman would be present and connman would not?<br>
<br>
The test name could certainly be clearer as its not a generic connman<br>
test...<br></blockquote><div><br></div><div>There is no lib32-core-image-sa=
to anywhere in config.json=C2=A0 - and I think <br></div><div>RPM_PREFER_EL=
F_ARCH in existing tests should ensure that 32 bit connman package takes pr=
ecedence.</div><div><br></div><div>Also note that those same tests install =
lib32-connman, which can only be for the purpose of the test:</div><div><a =
href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/=
tree/config.json#n495">http://git.yoctoproject.org/cgit/cgit.cgi/yocto-auto=
builder-helper/tree/config.json#n495</a></div><div><br></div><br></div></di=
v>

--0000000000008dd28b05adda3173--

Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web11.217.1621700993375654171
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 May 2021 09:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jsz+p5XP;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id f11so12022687vst.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 May 2021 09:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3lciJmNn6MtUZMiO0bcb+LI5dror5dcJGNhkxpeUxYI=;
        b=jsz+p5XPK7oU0TkWCzG4/1UMdoJGDsxlCYt9OX+S3RJUivulxGnuizS7OQwnvwD2U0
         +VLxbg/TzfVR72S7AlzaLLjMdD1E3tMksi5D9fGbZET6u1WPLnVVqrCFPe7uUbzFm2ws
         WzLVOOIclOHQQIn/rtzKa9axNb4+0oUS4d0KzAlif1uT939uS2qX07PEtxJtK9ukOIdP
         PjN7Rxv5n16hscseJ8PIxLETOWPP0qL98AFaqqwDbrXDS0FBOGGkPOeIgtCi7rwTi23O
         QvS8Lbu6pGba4XLrECApDsr9a7uwcIGipzdSVeyJfCPrGbG7kRVmJAguH9l+YmMF84Rx
         XLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3lciJmNn6MtUZMiO0bcb+LI5dror5dcJGNhkxpeUxYI=;
        b=IQkw8GyLmOXvcq3CM8uUu73Lj9VPfllv0CCqqKnGW7UbMqTLKcsvmQ+47LVH9MRi2V
         Gqm5E5xgFgtPJu3nez4f/JLgKmTfBweQ8SioiU6np3c9TV4J+TFh9TmJUSmJyMm/9USU
         WY8kEW/iOgrfs5hg2tdtwUYj56BLPSlFf7tfRdDqUUcV/EEtW5cyQosOaUH/mMF8XaXa
         VzqLKMXZFiFY11GmHLq7pGpjvEzz51/FZD8sxoNGYgt0o7PanwSOTIHWiMIlj6aT3ux9
         jE+Z57oZbLRb/wipBnuanmvqKbJLasyHaCcrYKlaNfZiujbxeSBuCnFKf9VHH3ax0/0e
         Bfzw==
X-Gm-Message-State: AOAM531Vs2bvF8iPvUcmZ1qDwJvCR6dSES4ZDUtvKKtZUhcccdtadkn7
	F/hcCFk7PCvX4BUbwTNj83WuxA4PW2giKygJSos=
X-Google-Smtp-Source: ABdhPJzUjHfDZAuRo6wEj8g7HU8WHZ1VsK0BBy4u5Mpa/hK8bFu5/2hdhfay1ckYYoKhGqFkv9cGl6lV6qWhkDA/nRw=
X-Received: by 2002:a67:1447:: with SMTP id 68mr15680712vsu.20.1621700992538;
 Sat, 22 May 2021 09:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com> <20210517103528.24434-6-vinay.m.engg@gmail.com>
 <CANNYZj8jNE92Ct9541GmLzmmNwgrJ2UOEC4=jQstwyi12PBMpw@mail.gmail.com>
 <CANUMPcWJiKAKbw=UHkPd=T3TzTt4fmNwTya6hMZRbewUXdL2wQ@mail.gmail.com>
 <CANNYZj9C0DRCtsMjfr7DDTBqzSJpHSY+FGYx7-Sn2i5kdqNCUw@mail.gmail.com>
 <CANUMPcVaW7vKKwW5cfvu2ETgcrWb70qdAFpCuiD8J8KNoAjjNQ@mail.gmail.com>
 <CANNYZj9OeUc73=xf+F5qub-T4Fr6msvWTpshN=XubL-mL2j5UQ@mail.gmail.com>
 <CANUMPcUs_sUnzH_9XPU_mKsUJrbx5cA2PXUug0Yusf+ze6cpAw@mail.gmail.com>
 <167FE427910432AF.29970@lists.openembedded.org> <CANUMPcWrQtocibdLawMmt30eQkYiC5NLAj+MhnfUs8ozgoHOMA@mail.gmail.com>
 <CANNYZj88moczJGrTH_s3DAvR5P21aGui-yPfPst3mgySEcDj3A@mail.gmail.com>
 <CANNYZj-yODhEEFErtUxBeiw3O1YvEfV-hGOOW_uPNvo6x8mNYQ@mail.gmail.com> <CANUMPcX6W7F8qxyiN8trxH7Grdc3JCUrUxYtNQqvTxtwLpxqoQ@mail.gmail.com>
In-Reply-To: <CANUMPcX6W7F8qxyiN8trxH7Grdc3JCUrUxYtNQqvTxtwLpxqoQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 22 May 2021 18:29:41 +0200
Message-ID: <CANNYZj_NwqRxLE53SNzitb_q5_GHMJaunKRMz2BvGYN_FNmbvQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 6/7] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: multipart/alternative; boundary="000000000000979c0405c2edafae"

--000000000000979c0405c2edafae
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 May 2021 at 15:46, Vinay Kumar <vinay.m.engg@gmail.com> wrote:

>
> If we set "export TEST_DEVICE_ADDR=192.168.7.2:12345;" in do_check of
> rust-testsuite.inc connection establishes with image
> and the test execution is as expected.
>

That's because bitbake sanitizes the environment of the tasks and those
externally set variables do not propagate into do_check().

I would suggest that you do not try to do the testing step as a bitbake
task in a recipe, but rather move what it does directly into
meta/lib/oeqa/selftest/cases/rust.py.

I will respond to the patch separately.

Alex

--000000000000979c0405c2edafae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, 21 May 2021 at 15:46, Vinay Kumar &lt;<a href=3D"mailto:vina=
y.m.engg@gmail.com">vinay.m.engg@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><br>
If we set &quot;export TEST_DEVICE_ADDR=3D<a href=3D"http://192.168.7.2:123=
45" rel=3D"noreferrer" target=3D"_blank">192.168.7.2:12345</a>;&quot; in do=
_check of<br>
rust-testsuite.inc connection establishes with image<br>
and the test execution is as expected.<br></blockquote><div><br></div><div>=
That&#39;s because bitbake sanitizes the environment of the tasks and those=
 externally set variables do not propagate into do_check().</div><div><br><=
/div><div>I would suggest that you do not try to do the testing step as a b=
itbake task in a recipe, but rather move what it does directly into meta/li=
b/oeqa/selftest/cases/rust.py.</div><div><br></div><div>I will respond to t=
he patch separately.<br></div><br><div></div><div>Alex<br></div></div></div=
>

--000000000000979c0405c2edafae--

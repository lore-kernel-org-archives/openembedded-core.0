Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web08.4221.1604170458816932905
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 11:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IhQimowT;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id e3so5258317vsr.8
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 11:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qvCLBMGIQh0POMugax8jYECg4sfo8GXkGQi4jXTN5Dw=;
        b=IhQimowTjO+tvZZYStSrmvPFHbcK+u7nVSU6sOtlwL/C+wjQg4zYPQXR/D0eI7DK/g
         Q0VRSvxY0Bw42IE7Q605AQ0tnR9+UojJe/Byt7XbFmyjW+yhpOFpTm/O5VK1uaXli44L
         5ZnV4rdLrt/mGi1lbtKHvCPPsclPUIgIgTJX4TiWp7ZtPbAZEoWwmp2+Vrpmpr8amyDI
         zOwrTfRpwNLH/9KzQddr2e9xoPQcbqSWWss2fCzZKJRijsEMwMuHNsqUyfj3YYiMi4mx
         9ufN90LA7i/WFjmkQA3hpPsx9FZlkro2IljXIyva+pvV1C0Q2C6dpcc7V4NRb2my6lDg
         MF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qvCLBMGIQh0POMugax8jYECg4sfo8GXkGQi4jXTN5Dw=;
        b=CsOOI9CZ896UNKXjWleSXDMw8UFkKct81qsOXHU09OtgfQC099e7RNT1HVDHOtYTSu
         7uAqPORjxOXZbbfngjO3T2tXFKUNHNe0kEBfYE4AeN9LyQMcc+lCly5SFJ0b/bRzEC+0
         ubSh1p8/GOCh4ARuys8WvQ03fDAsgsLAyaHDZc8x1cLq7fhHSIZ/caVcO7Hy1gN5BdXs
         +hrMnAwUMWm2Q/K6BVjnqU5aj2PS3Za0qhgl7Z1+ouYjZJW/jveTCqb/C+eaUWjxImNJ
         zC11s7zQlu+z58xdp0x8uE8CbDZfie2Qwtzf1cF9t1t0PG8RkQqpyBs2WPsOj9fCTr/w
         yUqQ==
X-Gm-Message-State: AOAM530cv1AG9GydJnu52sw6AFwo+sQpjQM3GJylYbBJDX8EUsP+n5zF
	BJ7QGCC+2CQt+JUJseR9AXbGFPYmCECGOoSa9tw=
X-Google-Smtp-Source: ABdhPJwkV+G50udswnx6Nf3B+OfNO+yHSrj6MXrjQrH8y8sTRC+9VTaFOxCyR+AYZH14tZ2D0wSB0a/ZHg9+WJe1hu8=
X-Received: by 2002:a67:ea0b:: with SMTP id g11mr10370032vso.20.1604170458050;
 Sat, 31 Oct 2020 11:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
 <20201029142806.1830504-6-quaresma.jose@gmail.com> <88cd1831e021c2384219da4223981fa004551498.camel@linuxfoundation.org>
 <1642964F5C513D13.27950@lists.openembedded.org> <1642987B07D196A5.27950@lists.openembedded.org>
 <CANPvuRkKDPM8h5d8wjzdvQ95vY_kYHXkxvW0Uvqw8rTYj0yWCQ@mail.gmail.com>
 <f5f3fe375a9174e401c283431de0fca1634539a1.camel@linuxfoundation.org>
 <1642D6DB2EF0C3ED.10902@lists.openembedded.org> <CANPvuRnjYPZabjLDTW7rttaaH6qUW7sV_ZEyS31bGZHsZHjXsQ@mail.gmail.com>
 <3b12ced1f6625fe0a9bdeb9e5c0cd5a7ca004d50.camel@linuxfoundation.org>
 <b298f53a7fceab3d51ec69ab1b9356269074e712.camel@linuxfoundation.org> <CANPvuRn+ZOcnS+Mg_y5dcX+D1QJH__APYqLECGrBt8KVx0fU1Q@mail.gmail.com>
In-Reply-To: <CANPvuRn+ZOcnS+Mg_y5dcX+D1QJH__APYqLECGrBt8KVx0fU1Q@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 31 Oct 2020 19:54:06 +0100
Message-ID: <CANNYZj9VosotbYD_xF3u8qqiwKBkcN06f7itUasenXtbriONOA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 05/22] gstreamer1.0-plugins-good: upgrade to version 1.18.0
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004fb4a905b2fc0a3d"

--0000000000004fb4a905b2fc0a3d
Content-Type: text/plain; charset="UTF-8"

On Sat, 31 Oct 2020 at 12:49, Jose Quaresma <quaresma.jose@gmail.com> wrote:

> There are great tools on the OE core to check this type of problems.
> Congratulations for the autobuilder infrastructure. I will try to
> setup it in near future
> because they are very useful.
>

I think there's also a ptest regression for gstreamer:
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/1472

It's not a failure, and doesn't prevent merging version updates, but still
should be addressed.

Alex

--0000000000004fb4a905b2fc0a3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, 31 Oct 2020 at 12:49, Jose Quares=
ma &lt;<a href=3D"mailto:quaresma.jose@gmail.com">quaresma.jose@gmail.com</=
a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">There are great tools on the OE core to check this=
 type of problems.<br>
Congratulations for the autobuilder infrastructure. I will try to<br>
setup it in near future<br>
because they are very useful.<br></blockquote><div><br></div><div>I think t=
here&#39;s also a ptest regression for gstreamer:</div><div><a href=3D"http=
s://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/1472">https:/=
/autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/1472</a></div><d=
iv><br></div><div>It&#39;s not a failure, and doesn&#39;t prevent merging v=
ersion updates, but still should be addressed.</div><div><br></div><div>Ale=
x<br> </div></div></div>

--0000000000004fb4a905b2fc0a3d--

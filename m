Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.12442.1625843352194266885
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jul 2021 08:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Elr6EC74;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id q190so9613794qkd.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jul 2021 08:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OfNCIebNwU+S6bREj4CA8o+iaUEFFZ7B8SiIbTeZfQQ=;
        b=Elr6EC74yRj0hjhu89k2lwc1g/Y4IxXhFDfiQH3xx/fv+U0/jAjCJ3XJ9Uz/izPfbi
         jY9T7cfCE2GRjzUVnYZ+xOpADivewPSKuW6Slzbke1QdvjsUP02nDWXmzXlHhYUN7v/s
         kkA1LipXzb7uXQDFKXYJxv1dU9uj4cB8QfeisR8uHP4iqKgz2UT1I4idlGfO3wb5z/tA
         JtKCp2zitimt2yLK3rSpY7CBXM9HVo6As0sma0H7p1ttPXwuGAx7QIFgCVQ9/06BR2au
         FeQ2BXbebBQA6x38iurbOgX62VdF9B6naAiMYa21M54xsgjgY8L8vmXEzA+j9I7MXvgM
         3lsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OfNCIebNwU+S6bREj4CA8o+iaUEFFZ7B8SiIbTeZfQQ=;
        b=nlmM3F4DhjPDMXR69lFZ8KmfgWOXIpmieg8whIm1M51dT2Qh43zw3fg0/waIgysogE
         CcLU7j+R+ASes/tNWi6Q0b/49Do68EB6s7x5xW6Z29gWDCZioTODUZXkiAKIT7h3TNeL
         ZEnAWW0pdTJeCXNqjBKglCcHLF3ZazYiMhyta9O9eHN9ang95gsW5SscJmPvAw1wTeyz
         3p/Lrzofks3w1BNcLclxUkU+VhwVSWvCkTgJq2cDuj/Gnrvi/RZetFjvIvZneFo/tzT/
         ta0JvcL+GJHWIeBDCTXWfUseDUogIdJszF7oPk+uWLoSVdXWmiU/NJrKlOLXmeOWTInP
         cgHA==
X-Gm-Message-State: AOAM531SDl7IcpsvLN5ft5lFyqLQaSjjcUwlt73VMYXmh9RHzyewH2io
	Yp/6BwzgA8y5wWyh7pcERVl7tE1/cCCd8LSw3h4=
X-Google-Smtp-Source: ABdhPJy+XAhQ9z5mADDWlmsN9tVa253QQBLa3N7///cMQaoBwkpn4f5jRwkKoHT2bhzMX8R9mINhVWZK0ZG5mF2gcwk=
X-Received: by 2002:a37:bb82:: with SMTP id l124mr38033793qkf.119.1625843351281;
 Fri, 09 Jul 2021 08:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <1625672669-3918-1-git-send-email-wangmy@fujitsu.com>
 <CAMKF1sqnh0w_psbrNdfTNHq-zkyEzP197mXeY89mX8rvJ5oipg@mail.gmail.com> <OSBPR01MB1845A73BC124CB75DF38D976DC189@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB1845A73BC124CB75DF38D976DC189@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 9 Jul 2021 08:08:45 -0700
Message-ID: <CAMKF1sqRC4Qw873s3Mp8HkKPY59-HmSeqoWjuu64XjFR+VuUSA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gnome-desktop-testing: upgrade 2018.1 -> 2021.1
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 8, 2021 at 11:30 PM wangmy@fujitsu.com <wangmy@fujitsu.com> wro=
te:
>
> I used the default configuration of mips, and the compiler was mips-poky=
-linux-gcc, which did not reproduce this problem.
>
> The compiler in the log you sent me is mips-yoe-linux-clang.
>
> Could you tell me how I can use this compiler.

Yeah, this issue happens when compiling with clang, architecture is
not important. you can use meta-clang layer to reproduce it
and set TOOLCHAIN =3D "clang" in local.conf

I have sent a fix for the issue already

>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> Development Dept.I
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road, =
Nanjing, 210012, China
> TEL: +86+25-86630566-8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> http://www.fujitsu.com/cn/fnst/
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Thursday, July 8, 2021 11:50 AM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> > Cc: Patches and discussions about the oe-core layer
> > <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH] gnome-desktop-testing: upgrade 2018.1 -=
>
> > 2021.1
> >
> > fails to build on mips https://errors.yoctoproject.org/Errors/Details/=
587476/
> >
> > On Wed, Jul 7, 2021 at 8:45 AM wangmy <wangmy@fujitsu.com> wrote:
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  ...esktop-testing_2018.1.bb =3D> gnome-desktop-testing_2021.1.bb} |=
 2
> > > +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)  rename
> > > meta/recipes-support/gnome-desktop-testing/{gnome-desktop-testing_20=
18
> > > .1.bb =3D> gnome-desktop-testing_2021.1.bb} (94%)
> > >
> > > diff --git
> > > a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2=
01
> > > 8.1.bb
> > > b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2=
02
> > > 1.1.bb
> > > similarity index 94%
> > > rename from
> > > meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_201=
8.
> > > 1.bb rename to
> > > meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_202=
1.
> > > 1.bb
> > > index e5c69c0c46..b82eb8af2e 100644
> > > ---
> > > a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2=
01
> > > 8.1.bb
> > > +++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testi=
ng
> > > +++ _2021.1.bb
> > > @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3D3bf50002aefd002f49e7bb854063f7e7 \
> > >
> > file://src/gnome-desktop-testing-runner.c;beginline=3D1;endline=3D20;m=
d5=3D7ef3ad9
> > da2ffcf7707dc11151fe007f4"
> > >
> > >  SRC_URI =3D
> > "git://gitlab.gnome.org/GNOME/gnome-desktop-testing.git;protocol=3Dhtt=
p"
> > > -SRCREV =3D "4decade67b29ad170fcf3de148e41695fc459f48"
> > > +SRCREV =3D "e346cd4ed2e2102c9b195b614f3c642d23f5f6e7"
> > >
> > >  DEPENDS =3D "glib-2.0"
> > >
> > > --
> > > 2.25.1
> > >
> > >
> > >=20
> > >

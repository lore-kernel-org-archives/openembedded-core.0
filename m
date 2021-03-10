Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.8592.1615383366392386232
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 05:36:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B68wm3vL;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id t1so28088931eds.7
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 05:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CeDIqWlF8r1d0kYLG2pibfCwalNYQQ8Crmryv6nqbb8=;
        b=B68wm3vLi1ChUPmkZPIbs1hDpLR6cMGwJcM9n5oLjlGOXX0ux8Q0CKWpLLpx4YOzKO
         Rwr/RRBBZuGT1lufLDZRcOwXEp0Q5rB8G/7FWHcKavodN4RFHtQbn5tSorOR88tSlnnO
         fPu6lJMV4wXMQAlEXjcRGGlx9P+AyaP+yQPkRVLQVfJGuthzQMm6Z6m3nhx8wDHC9Flm
         KL57YreIyqz9hipIP5Epjva05b7cT7HDsYEVgwr2JkDj27HEm2QeIvIv9veDriEx4t4X
         NhdTXLfpKIP9DjiNLdH0s7XDAj4BW2OQiA40+VsdSsMmrm09zo/WWCY1idNKnq0TM2pt
         FH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CeDIqWlF8r1d0kYLG2pibfCwalNYQQ8Crmryv6nqbb8=;
        b=I0lPm3AN0zw0Suht49nZCN+uCm0lUv02h11fB8Ibz17dbgUn9804nOb7VYyFfqzzUl
         9Tss5CJ73qC6Gn9ko1XMdviO4ktp9rwJUm7yd7V384YHYj9Kvzp3tpgt5HrDfxHinvvX
         YM8n5nVQGq4EIiM0hNcLyZ6i7LtEwYX3j6o6h65/wDHA7z7w5oIo2nkXkY3quVZKVZUR
         3l+ypuk44bK/6HIGRDb161aRoXB0YclVSwvhE2Rntx1oQ9TjZxghcPlskHj1vetmVUHr
         mydYi5IlbIB+Yd+2MMKEx3QhX35uJCougS+CGlEtbrg83PpO+yanzKUENRo4h9sAl/J9
         imIQ==
X-Gm-Message-State: AOAM532IMOkxvfhT0PfM8cHF+sjRBiTK0x28fpINQ7CwfPp+VEDJMJz1
	EvSvqaOcBDnDPImfbHtHra7WQxJu9hhcNznpTq8=
X-Google-Smtp-Source: ABdhPJzIGj8WDz+lpLNg+hP2tPf3n+pRo4b6U2DTnu7DJgcuwVf96ZiubK6g/kZWBXDLSEgutj2oyiT6B/GjSY+fECI=
X-Received: by 2002:aa7:d98b:: with SMTP id u11mr3398441eds.352.1615383364529;
 Wed, 10 Mar 2021 05:36:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1615317549.git.bruce.ashfield@gmail.com>
 <c15444b65a82b76332dc30a1120888e5828b91a8.1615317549.git.bruce.ashfield@gmail.com>
 <20210310113254.71b29092@kmaincent-XPS-13-7390>
In-Reply-To: <20210310113254.71b29092@kmaincent-XPS-13-7390>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 10 Mar 2021 08:35:53 -0500
Message-ID: <CADkTA4P-aqtap-3xkLN6HimS6UVbqL8cNvTCKkL=yVq2g7a+LA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/6] linux-yocto/5.10: update to v5.10.21
To: =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fix was already sent in my v2.

Cheers,

Bruce

On Wed, Mar 10, 2021 at 5:32 AM K=C3=B6ry Maincent <kory.maincent@bootlin.c=
om> wrote:
>
> Hello Bruce,
>
> On Tue,  9 Mar 2021 14:23:38 -0500
> "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:
>
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Updating linux-yocto/5.10 to the latest korg -stable release that compr=
ises
> > the following commits:
>
> Got this error:
>
> /home/pokybuild/yocto-worker/edgerouter/build/build/tmp/work-shared/edger=
outer/kernel-source/arch/mips/cavium-octeon/setup.c: In function 'device_tr=
ee_init':
> /home/pokybuild/yocto-worker/edgerouter/build/build/tmp/work-shared/edger=
outer/kernel-source/arch/mips/cavium-octeon/setup.c:1168:2: error: #endif w=
ithout #if
>  1168 | #endif
>       |  ^~~~~
>   CC      arch/mips/cavium-octeon/executive/octeon-model.o
> make[3]: *** [/home/pokybuild/yocto-worker/edgerouter/build/build/tmp/wor=
k-shared/edgerouter/kernel-source/scripts/Makefile.build:279: arch/mips/cav=
ium-octeon/setup.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
>
> Here is the autobuilder log error:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/3180/st=
eps/11/logs/stdio
>
> Regards,
>
> K=C3=B6ry



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

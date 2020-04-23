Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web12.6078.1587648378707496802
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 06:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DcYJQysi;
 spf=pass (domain: gmail.com, ip: 209.85.208.195, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lj1-f195.google.com with SMTP id a21so3307897ljj.11
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 06:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LE+VaJd8QkovVH2jaDSR10ceZ92Mltoe2E000rFhJ20=;
        b=DcYJQysiAKkKQdZq5tW/EBu12r5l3yeEhonvd4D5a5nyjEdqKwBDU/SC4xmOWZz+Bh
         dzoIXORh4OzF57QilDZVzBF7DvbyYtMBPfaP8aCod+vAU94DQqNg6jLl7MkCDbSzjOnb
         NWp3tmq6LKMFJnJ0Z0294xdSGOAs/Bu7FEbAJHHqYAneJ8m06uZeYgXUh9lkAZtltYqm
         JwJTtwRC4gVivwxFXPxZWpdjCtER6dZ8pBUhdY6YIKBM0lGDEZTYiyskvXZTLzt0Md4l
         cMweP42zAtVFY/iaJc2BxYSixFsCEJG8ScJFzkKf+9mgDFoivy2DJz7nqNNvpQs7R9Mr
         GsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LE+VaJd8QkovVH2jaDSR10ceZ92Mltoe2E000rFhJ20=;
        b=ezkwEK3CoFBTQVxCSb4Ns3MbCqE0H8HBlh/cJQK/wS0QCKiPI5tTMcfvrPszj7rgOq
         0DsmCq5ew83dRKITQfEipHMIGwGFLEDZVM2GpYcZjslk7b3QutjM5+VGh2bXsQoDq02m
         Q7HcBhLW1uNGNve9jZlIwtBN1hmRd7gTiffunxS386Y2gWD3W8mBE/ISTc/L854SrlIJ
         qfjclXQyAuQYec+GTQHFUP3xDpCbPlzi/OeJwVxe8HJ4lwmOv6mgcGngxs/lRxO7e91t
         VDGgnNshBipMFOA3+G9C9WatolTRoQFFIWg3eL250B07oUKhFhIVxRIsgTetraPFjvsG
         jf4A==
X-Gm-Message-State: AGi0PuaEZriVVGOjWsKe0q/HtcDF8DMDz7FZgeXsEJECgQ+uYfRg0a3+
	S0lpvC1NYhCTfVsNxR0RjtKusza100VBjVid8mM=
X-Google-Smtp-Source: APiQypIxAmViZ8m+NMWCQ5V5skDZMoe+HvKcXMgCOLdV9TshL1yjOJclBXB74zLp4xGHN7vQBjAoYxb4FUxC1FNmz1k=
X-Received: by 2002:a2e:8798:: with SMTP id n24mr2154462lji.200.1587648376863;
 Thu, 23 Apr 2020 06:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200419063539.1467641-1-ricardo@ribalda.com> <258be2a52105a49413b954df67e61444dc73492e.camel@linuxfoundation.org>
 <CAPybu_1XdULtkfUQsjTa=PvuyUECKpNLoFXX95F_+Ly3=fbqBg@mail.gmail.com>
 <ebb64c86224b51b49b1d86f864566ecd91696f95.camel@linuxfoundation.org>
 <16086D1E57B63D5A.14079@lists.openembedded.org> <CAPybu_16DsHfqq-Frixoq+ySqCbb2qvGmapZR-UbKGgmT8sJyA@mail.gmail.com>
 <9db9f846d38b2818be760caf590cb036531c4799.camel@linuxfoundation.org>
In-Reply-To: <9db9f846d38b2818be760caf590cb036531c4799.camel@linuxfoundation.org>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Thu, 23 Apr 2020 15:26:00 +0200
Message-ID: <CAPybu_2zmq6dD1U8Wc87BUZXQPCt35+yvA7ZbpPQLgQaGyV70w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v7 00/10] Fix permissions and embed-rotofs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Paul Barker <pbarker@konsulko.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 23, 2020 at 3:23 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-04-23 at 15:17 +0200, Ricardo Ribalda Delgado wrote:
> > On my setup, using debian crops the error is even different :(
> >
> > If you want I can keep trying, otherwise I will leave it to the
> > experts ;)
>
> Buried in there I think you have a setup problem:

I launched it inside crops, I was expecting that everything was ok, but

/dev/net/tun is missing :(
pokyuser@e81a7801004c:/workdir/build$ ls -la /dev/net/tun
ls: cannot access '/dev/net/tun': No such file or directory


I can add it and retry, but it takes forever to run every test. Is
there a way to let it rerun, not starting from scratch every time?

2020-04-23 13:18:31,528 - oe-selftest - INFO - Adding layer libraries:
2020-04-23 13:18:31,529 - oe-selftest - INFO - /workdir/meta/lib
2020-04-23 13:18:31,529 - oe-selftest - INFO - /workdir/meta-yocto-bsp/lib
2020-04-23 13:18:31,529 - oe-selftest - INFO - /workdir/meta-selftest/lib
2020-04-23 13:18:31,531 - oe-selftest - INFO - Running bitbake -e to
test the configuration is valid/parsable
2020-04-23 13:18:34,955 - oe-selftest - ERROR - Build directory
/workdir/build-st already exists, aborting


Cheers
>
> Output from runqemu:
> runqemu - ERROR - TUN control device /dev/net/tun is unavailable; you
> may need to enable TUN (e.g. sudo modprobe tun)
> runqemu - INFO - Cleaning up
>
> I'm trying to narrow down the failing patch but its looking like it may
> take me a while as its not immediately obvious :(
>
> Cheers,
>
> Richard
>


-- 
Ricardo Ribalda

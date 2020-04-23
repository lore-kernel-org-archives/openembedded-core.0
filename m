Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web12.3796.1587638845171768828
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 03:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hDpBcoq7;
 spf=pass (domain: gmail.com, ip: 209.85.167.68, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lf1-f68.google.com with SMTP id k28so4356808lfe.10
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 03:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qso4XmBc7LzGspE6duPswPgc+TxZr6qrReo1hUBnJ0c=;
        b=hDpBcoq7Q5glsawteuPpTLUB17/wFbzBQdavNqk98Dtwg+F14pd+AINZroOF2nzqh9
         R4TH7JBssHtF4Mqwpg/dkSM/u1NpvEmGXeRpU4BSOsJzRLHcIPJoRjgPLDpJ0f9L66sn
         ca6X28qFkLu1h1ZXLFWOaW9qCTXJ9rYpotrAfvVMV5ttS2lV7t3vsfLWDqrYTBm/QRFr
         bbRX945rTHU873JR79qmnmsC1vVjZowkGf9h5Jw4/pV1iZVjbI4qq/nx3KIk+zEbo5cJ
         Um9UOy5Tcqt3ypiV+dFIKQiyK19dBHT3lLEDUiHJi/RezSX2Trew/s7eSgQdiwOcydMW
         QYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qso4XmBc7LzGspE6duPswPgc+TxZr6qrReo1hUBnJ0c=;
        b=iAfBIzoDGPjsk7KgamE0bpdXvf6HM3PnXJSPjv/Ik0OWZLUrtbyAqLPxVTN1NfPdLQ
         6zMWX0Z3iKyBBuc7x+8Izy/9IDJ81Sp6PWuwfBabcb13/t0YgNUZ8dLm9vhTfZ7igDJN
         Vpep4g0Q3QKBBLIoKCLpEIiLntU8C5fg1Ib75eQhW/tIcr8Sg3xy54rFKdcAkmV7KUcM
         NoEAcJ5Y55cD7rEhaBRUD78CB58IfTwxOIWSc8RKVZHqUYTM0kJ7iDpo7vsmTmnn+qUY
         mmVNdD6YSuHxzVj125vQHc7poAss98tVojU4PXBFxlQIKv4UWZPTIqyuSovoGMUuo4H0
         /nNw==
X-Gm-Message-State: AGi0PuYOcRe1ZerFyMds8isX99DMT5s14DXfwqvsXVnSGL1TtH9+wkGi
	SmPSODJsARJ0y+629G8VvapdhVH7Vh4EGl9N5cg=
X-Google-Smtp-Source: APiQypKKtrcR7pbWAA8fJMA+cCKEbYHO8c8bCuh7LjqcPyDxmSaiy7bjfxI2oezhUmgBCeGmhEwY2zpOjU52G7PgXnE=
X-Received: by 2002:a19:88a:: with SMTP id 132mr2050070lfi.130.1587638843218;
 Thu, 23 Apr 2020 03:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200419063539.1467641-1-ricardo@ribalda.com> <258be2a52105a49413b954df67e61444dc73492e.camel@linuxfoundation.org>
 <CAPybu_1XdULtkfUQsjTa=PvuyUECKpNLoFXX95F_+Ly3=fbqBg@mail.gmail.com> <ebb64c86224b51b49b1d86f864566ecd91696f95.camel@linuxfoundation.org>
In-Reply-To: <ebb64c86224b51b49b1d86f864566ecd91696f95.camel@linuxfoundation.org>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Thu, 23 Apr 2020 12:47:06 +0200
Message-ID: <CAPybu_3Dap=Eqd1TP4RiBw=5aHRNsK1nZ5yXH9LJ_Wm=r0wGBg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v7 00/10] Fix permissions and embed-rotofs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Paul Barker <pbarker@konsulko.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 23, 2020 at 12:45 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-04-23 at 11:57 +0200, Ricardo Ribalda Delgado wrote:
> > Hi Richard
> >
> > Thanks for the test.
> >
> > All the errors seem to have the same pattern:
> >
> > FileNotFoundError: [Errno 2] No such file or directory:
> > '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-
> > 27135/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0-
> > r0/testimage/qemurunner_log.20200423015612'
> >
> > I do not believe that it is related to my patchset, I have seen that
> > you are already running the selftest without the patchset
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/850
> >
> > Lets see if it also crashes or not. I am also trying to replicate
> > locally.
>
> It did recur:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/862
>
> so your patches are probably not the cause, sorry! :)

No problem, thanks!

I am trying to replicate it anyway here. If I find a problem I will ping you.

>
> I'll continue to try and track it down.
>
> Cheers,
>
> Richard
>


-- 
Ricardo Ribalda

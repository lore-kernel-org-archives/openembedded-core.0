Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web11.4719.1611617509077266373
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 15:31:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=McRBuiDj;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id z22so30143668ioh.9
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 15:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BSWePQ41YHpGACUNk1Wh9TKCzw+AguuqFkamCB5K4xk=;
        b=McRBuiDjDDV/DdBBPaMXRez0Vp7q56VE4z7PhoRMJ0+m/w+4xfsrjme1qXqbP1N4EF
         O/vSTr2pbFynKPjA/MAnD6fNZ25T2cD+/IUEPW6ab53xND4YxTbYPAfYFiWcV9ak+egF
         lgLjyJcMMp8LHuMrVT5W66unUPeQ3BrL39CrVdAHK9nVNSxlGfJ/L3UV/4LI3obLbniE
         X2fZv7w8rOhPiFNyuKPwM7faqpTnwYSArmukM+LNgxkpS9cfHseAIGU+zF47IvBDDS6m
         Wb8RzzjW4uhkqB7BHYz7dQf7ydJIc8j6Zwc+3sSs4AnqFBoK2Q6a1tutZ7RiXlPpMGN7
         8H2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BSWePQ41YHpGACUNk1Wh9TKCzw+AguuqFkamCB5K4xk=;
        b=uLtYN2wRhxZBP+9M+FCffVOi3h6F4o95B3vA9eeK8UfXtrcdSZGX18TRDMJB6yu1fR
         24T/kfqo8I7jYfD87hPGVluQ8jeAyroQgPo0r193isUcp+Z4U7MColK1ISomN23GrDa5
         RGu/tcVOcj/Dp0upufnPH1Om9DHVd2wd1WaVrqR2bsJXEVKKaomykJwQBA0Tr8yPA9e1
         OH/Uz9gKTQE+p0apbN3AaA803/Y/pNuuX3Ns086yPerzQ04lLir4A7ANEzzv6DqaHqpP
         EW1s8O5CCGKs2I3zr5LDm68Pw3anosvYVB9wKTk8x0MFtlMUM9f3cEjF+mrH/tw8vaeA
         dC3g==
X-Gm-Message-State: AOAM531jRXSlaq+g4IrY24OOcEPPZxFMuUBYLEB2X/pfAv2D6wPwrKIf
	DwVxIDa6ZdNMoPgUCbaNMFCMNir+x9B8GogB0fo=
X-Google-Smtp-Source: ABdhPJzhBBzYx9jDAN0XT5xosNDVgNsO6k7HOaf/kxkgCAN+isfA4XCvisly3g9aP+r+nSkBuTAY1Vt9D896KEMveqM=
X-Received: by 2002:a05:6638:35a3:: with SMTP id v35mr2684207jal.36.1611617508525;
 Mon, 25 Jan 2021 15:31:48 -0800 (PST)
MIME-Version: 1.0
References: <20210125210142.8131-1-tomasz.dziendzielski@gmail.com> <155101e7a2527d85df48b078eccd3568ca70a5d3.camel@linuxfoundation.org>
In-Reply-To: <155101e7a2527d85df48b078eccd3568ca70a5d3.camel@linuxfoundation.org>
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
Date: Tue, 26 Jan 2021 00:34:20 +0100
Message-ID: <CAJkqNs34CEpKpNSTi-C7ktwoomiboX22fkGB9C_jf1i4pKZYXg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] externalsrc: Remove task dependencies to deleted tasks
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001c0db405b9c1f149"

--0000000000001c0db405b9c1f149
Content-Type: text/plain; charset="UTF-8"

>would it help to change the python recipe to do:
>addtask do_create_manifest after do_patch do_prepare_recipe_sysroot
>?
Well I think it would, I just thought it's done that way for some reason.
I will submit a new patch.

Best regards,
Tomasz Dziendzielski

--0000000000001c0db405b9c1f149
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr"><span class=3D"gmail-im">&gt;</span>=
would it help to change the python recipe to do:<br>&gt;addtask do_create_m=
anifest after do_patch do_prepare_recipe_sysroot<br>&gt;?</div>Well I think=
 it would, I just thought it&#39;s done that way for some reason.<br></div>=
<div>I will submit a new patch.</div><div><br></div><div>Best regards,<br><=
/div><div>Tomasz Dziendzielski<br></div></div>

--0000000000001c0db405b9c1f149--

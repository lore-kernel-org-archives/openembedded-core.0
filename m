Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web12.5481.1622711563768327959
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 02:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Et5J6wqp;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id s22so2609734vsl.10
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 02:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jpV5X2tO3wAh2SKkXwimom0V5sg89XBkT/zGfSNqNXw=;
        b=Et5J6wqp8TAzeO0J3wL0K1SakvOFXBzcwRpdo1vSV3N+4yn9F5xKsZH3jpIg0L1/pW
         wznqMViZTD2Or904xu0hUjsDS6qDr9D8p2B/vSDXfcpEbITHleunkXc7MWD2kelh6TSH
         EJ6wCr5eAhxJLcXyOvTqQEkAP2l6Nh0yT8oEOPGK0nw14nC9hvuQhp2i+zOeOd9zapcp
         9Tms1wpylDh13sAaaCP20GCmOxlB1+VgXBhGC1vPdYxVzBNybEB3FSLBqQBY+vFY4/hT
         FAIK2cCIVJzajEQj2FH5UszG61xlTBIq8FJ7OIQCL3wvBl7DJ2eeek/D/5/dClVvXVIb
         hGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jpV5X2tO3wAh2SKkXwimom0V5sg89XBkT/zGfSNqNXw=;
        b=pJPcKDKZeFB0QbjtJg/4NMdgkuLoMksU9Nlo3Rxc5CEW9YWs1fvrPU1loTiMVq/nCM
         3o0+1PO8et53f2kUWmnc2l9ACoSlSM+lUXY/jV59NhJPcF6m86czGVXHjIg66aMIoyFh
         0NorYvO+xnEYqsovKzq3Bd4Je6vurtT2Egxta2LXObGOjdcM4Z9rImD15U3T3E6gG9/J
         +UVTMUtAIUCeSD/w8XGl/L0Lu0tI68QVrrlOBLuE1IoWwQupgrEbjlNHK6qADj6Cs+8Y
         ZqCXNZFm8MaBbACgKW0XbUg2Qu3DoT6lOMIJj1AfhNIVm9CVkluHmzJywHOXgDofTPbl
         mzgA==
X-Gm-Message-State: AOAM531bWnbDhizij8yA0UUaETQItIv6SAAZbOY7j9THNrWpxu6siOO0
	njroyWoSJNZ0nomquLXjtBQw+BR/owmX96Ti3KE=
X-Google-Smtp-Source: ABdhPJzyNCQlW4WLK7Ka8GK9mWykY5CUUljEM5OLs/amVajt0k/OtPZXwJ8VVpp+RkeL9KB61m3MxmBhpEL4Dp+yCag=
X-Received: by 2002:a67:1502:: with SMTP id 2mr27589237vsv.54.1622711562951;
 Thu, 03 Jun 2021 02:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <MADEUP.1684EE085BD427A1.11265@lists.openembedded.org>
In-Reply-To: <MADEUP.1684EE085BD427A1.11265@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 3 Jun 2021 11:12:31 +0200
Message-ID: <CANNYZj97RXVD0K0knaBHmZ24twfK06bZrFzjhsAtT0wUT27=Ag@mail.gmail.com>
Subject: Re: [OE-core] [AUH] erofs-utils: upgrading to 20191016 SUCCEEDED
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Richard Weinberger <richard@nod.at>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000048612205c3d8fa47"

--00000000000048612205c3d8fa47
Content-Type: text/plain; charset="UTF-8"

Bogus tag, please ignore. I have queued a patch to correct this. (there is
currently no new version to update to)

Alex

On Thu, 3 Jun 2021 at 03:24, <auh@auh.yoctoproject.org> wrote:

> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *erofs-utils* to
> *20191016* has Succeeded.
>
> Next steps:
>     - apply the patch: git am 0001-erofs-utils-upgrade-1.2.1-20191016.patch
>     - check the changes to upstream patches and summarize them in the
> commit message,
>     - compile an image that contains the package
>     - perform some basic sanity tests
>     - amend the patch and sign it off: git commit -s --reset-author --amend
>     - send it to the appropriate mailing list
>
> Alternatively, if you believe the recipe should not be upgraded at this
> time,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>
> Please review the attached files for further information and build/update
> failures.
> Any problem please file a bug at
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>
> 
>
>

--00000000000048612205c3d8fa47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Bogus tag, please ignore. I have queued a patch to co=
rrect this. (there is currently no new version to update to)<br></div><div>=
<br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, 3 Jun 2021 at 03:24, &lt;<a href=3D"=
mailto:auh@auh.yoctoproject.org">auh@auh.yoctoproject.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
this email is a notification from the Auto Upgrade Helper<br>
that the automatic attempt to upgrade the recipe *erofs-utils* to *2019101=
6* has Succeeded.<br>
<br>
Next steps:<br>
=C2=A0 =C2=A0 - apply the patch: git am 0001-erofs-utils-upgrade-1.2.1-201=
91016.patch<br>
=C2=A0 =C2=A0 - check the changes to upstream patches and summarize them i=
n the commit message,<br>
=C2=A0 =C2=A0 - compile an image that contains the package<br>
=C2=A0 =C2=A0 - perform some basic sanity tests<br>
=C2=A0 =C2=A0 - amend the patch and sign it off: git commit -s --reset-aut=
hor --amend<br>
=C2=A0 =C2=A0 - send it to the appropriate mailing list<br>
<br>
Alternatively, if you believe the recipe should not be upgraded at this ti=
me,<br>
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that<br>
automatic upgrades would no longer be attempted.<br>
<br>
Please review the attached files for further information and build/update =
failures.<br>
Any problem please file a bug at <a href=3D"https://bugzilla.yoctoproject.=
org/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=3D"noreferrer=
" target=3D"_blank">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=
=
=3DAutomated%20Update%20Handler</a><br>
<br>
Regards,<br>
The Upgrade Helper<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000048612205c3d8fa47--

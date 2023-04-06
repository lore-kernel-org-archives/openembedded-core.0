Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F37C7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 08:53:04 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.153850.1680771176947108078
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 01:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BCfGITAu;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id h11so42946560lfu.8
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 01:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680771175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=81iCUfRuHWtJVngCOaWoxZR4OQ/7KgaFWdXbR2Ts6Lo=;
        b=BCfGITAuEiPXNK9XiWvDbq0Hm8jFqdmJZMaLDbyO3gdOWV1F9FRlGySreGTLk3JYZi
         gh05Zh6X2HDpaP6dQ8ySmNlHtlDGy9t2CVIbMz+eLAVacXbLPxJvYpBqv8OKv+ePt9Mq
         ZE3A1rn5i+loVISjWiaokC8bRYSBeBk3Hk67W4+dYawI1VqhKq+bedFd7c/F9RQemWq5
         8/13fre6wnnUMgC1kxat50iCgeZ+6Ek0hkGmQz/wb8bqVCUYbLuiziWrUlFaKXrcJWq7
         XwLxeIQ1hvWXviE635O/ndd7Fi1N1oRkR8309uOOdtAP0zm9HN6aC/Fxzxbal11cAdGX
         CxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680771175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=81iCUfRuHWtJVngCOaWoxZR4OQ/7KgaFWdXbR2Ts6Lo=;
        b=MeSbFHmKhdz33X1oRZLvBEGo7p6H9QcktwWlNnGyX82xkPJcnQTA8cQ/VttIacXE0V
         HAx2Hl5ulIH1t782Yue0Php8/zpqgezyUb6cyZcaGTDRtjhtnc/f8UhpTE0mB4AkxnAm
         d7CPZkmAE8ACVPTEg0I4y8uBQ2BiYj7rVCvP9Ln6otvNL5r6HzHTNaBRrcSw1EKEDP8T
         KxaWhLptN2uMVuKUBVxqU+oYEsRRajJ4ymti5+tqoIx7GmcMxrOsZvg3FwNFir9hJJBK
         eBBRHlV6kM6ExrCsu4YqJu5f+pK3u48/7uIUn4ArK2FcNlQPAj+FiHDtA8XLW3lAc6Qj
         +u7Q==
X-Gm-Message-State: AAQBX9eMh9iwG9W/87Fj54292RNieLJ4h0i3nt7XLzkpfgaPPxaFGMXk
	jJcRO8BcrMSsVGvIURAdV2C6S1Yv2KP/BIQEhdY=
X-Google-Smtp-Source: AKy350Y4ofSw+oNubg5fLwEQ7n4i4cXCyBHHElHq49REffvyZanfvARgfCyeZNQrZKmyYuptEtJ+maMsWdyzSajQkrU=
X-Received: by 2002:ac2:538a:0:b0:4d5:ca43:7049 with SMTP id
 g10-20020ac2538a000000b004d5ca437049mr2814028lfh.12.1680771174881; Thu, 06
 Apr 2023 01:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <17531B0D0DFA1CB6.3977@lists.openembedded.org> <41ad289e-fffb-b9a1-ab53-0c0510c3d324@bootlin.com>
 <CA+cAkeoPkXN+4Z39DWewrhSL1c3GSsbadPhY-_=Rf9p-Na5u+Q@mail.gmail.com> <67d102c4-cb70-169d-b8ad-cb141378b7f0@bootlin.com>
In-Reply-To: <67d102c4-cb70-169d-b8ad-cb141378b7f0@bootlin.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 6 Apr 2023 10:52:43 +0200
Message-ID: <CA+cAkepkVZJ-WsrFeZ8Y7+=95CwD4Fu9e5ddD7WJaWnMjSs5Qw@mail.gmail.com>
Subject: Re: [docs] [OE-core] [PATCH] migration-guides: update 4.2 migration
 and release notes
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org, openembedded-core@lists.openembedded.org, 
	Marta Rybczynska <rybczynska@gmail.com>, Paul Eggleton <paul.eggleton@linux.microsoft.com>, 
	Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d3e37005f8a70842"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 08:53:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179763

--000000000000d3e37005f8a70842
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 6 avr. 2023, 10:23, Michael Opdenacker <
michael.opdenacker@bootlin.com> a =C3=A9crit :

> Hi Frederic
>
> On 05.04.23 at 21:04, Frederic Martinsons wrote:
> >
> >
> >
> >     Any more Rust changes we should mention in the migration notes?
> >
> >
> > Maybe mention a specific procedure to update a cargo based recipe from
> > scratch (i.e. a recipe that
> > didn't use the cargo-update-recipe-crates inheritance):
> >
> > To bootstrap a cargo base recipe which have not the checksum list,
> > below are
> > the steps to make:
> >   - make the recipe inherit cargo-update-recipe-crates
> >   - remove all crate:// from the recipe
> >   - create an empty ${BPN}-crates.inc file and make your recipe
> > requires it
> >   - execute "bitbake -c update_crates your_recipe"
> >   - copy paste the output of bitbake about the missing checksums in
> > your ${BPN}-crates.inc
> >
> > The last step requires a bitbake patch to show all the missing
> > checksum which I don't know
> > if it will be in 4.2.
>
>
> Do you mean this one?
>
> https://git.openembedded.org/bitbake/commit/?h=3D2.4&id=3Ddafa07c080e0597=
5b6319b5adf78a9691c6b6643
>
> It just got merged.
> Thanks for the tip.
>
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

Yes that's the one. Great.

--000000000000d3e37005f8a70842
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto"></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">Le jeu. 6 avr. 2023, 10:23, Michael Opd=
enacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com" target=3D"_bl=
ank" rel=3D"noreferrer">michael.opdenacker@bootlin.com</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Hi Frederic<br>
<br>
On 05.04.23 at 21:04, Frederic Martinsons wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Any more Rust changes we should mention in the migr=
ation notes?<br>
&gt;<br>
&gt;<br>
&gt; Maybe mention a specific procedure to update a cargo based recipe from=
 <br>
&gt; scratch (i.e. a recipe that<br>
&gt; didn&#39;t use the cargo-update-recipe-crates inheritance):<br>
&gt;<br>
&gt; To bootstrap=C2=A0a cargo base recipe which have not the checksum list=
, <br>
&gt; below are<br>
&gt; the steps to make:<br>
&gt; =C2=A0 - make the recipe inherit cargo-update-recipe-crates<br>
&gt; =C2=A0 - remove all crate:// from the recipe<br>
&gt; =C2=A0 - create an empty ${BPN}-crates.inc file and make your recipe <=
br>
&gt; requires it<br>
&gt; =C2=A0 - execute &quot;bitbake -c update_crates your_recipe&quot;<br>
&gt; =C2=A0 - copy paste the output of bitbake about the missing checksums =
in <br>
&gt; your ${BPN}-crates.inc<br>
&gt;<br>
&gt; The last step requires a bitbake patch to show all the missing <br>
&gt; checksum which I don&#39;t know<br>
&gt; if it will be in 4.2.<br>
<br>
<br>
Do you mean this one?<br>
<a href=3D"https://git.openembedded.org/bitbake/commit/?h=3D2.4&amp;id=3Dda=
fa07c080e05975b6319b5adf78a9691c6b6643" rel=3D"noreferrer noreferrer norefe=
rrer" target=3D"_blank">https://git.openembedded.org/bitbake/commit/?h=3D2.=
4&amp;id=3Ddafa07c080e05975b6319b5adf78a9691c6b6643</a><br>
<br>
It just got merged.<br>
Thanks for the tip.<br>
<br>
Cheers<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer noreferrer" ta=
rget=3D"_blank">https://bootlin.com</a><br></blockquote></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Yes that&#39;s the one. Great.=C2=A0</div>=
<div class=3D"gmail_quote" dir=3D"auto"></div></div>

--000000000000d3e37005f8a70842--


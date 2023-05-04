Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683F8C7EE23
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 15:13:57 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.52965.1683213227838407122
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 08:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@theyoctojester-info.20221208.gappssmtp.com header.s=20221208 header.b=5BnYLXAN;
 spf=none, err=permanent DNS error (domain: theyoctojester.info, ip: 209.85.218.48, mailfrom: jester@theyoctojester.info)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-957dbae98b4so97066466b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 08:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20221208.gappssmtp.com; s=20221208; t=1683213226; x=1685805226;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zJijzDUDmGQFxbuATge6jFLgEkwyHiCw3vBlKeLABv4=;
        b=5BnYLXANeUsoxW3bvpKlR8RzTQqd64fBoLeyoOPDfBcKTRYi5gyS/8nrRLwZfET2H1
         bI8l6529xs+RTYZ9E+5ox0IF55GyWBiUiKNYaEKfxiPHnewodW1qJF4MgCM3xySxbdV4
         0s8XfCto4db1TM14lt6+389L49yXVDwmELz2rbGzEw4cV1CIgZapd72H8XMyxNH4q3TG
         FqWN1K+KzfGEQQlET+Qc6Qy85cTviRKB6AMjGaBu0n5kFSgJc0qBPl3NvapOrE/yLS+g
         nV6/7rOA//uKs1/nc19bZANj5pr4ojT3W1Msi3SuhFS8QwQrsQiPOrfNnShwj32HcRnZ
         Z0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683213226; x=1685805226;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJijzDUDmGQFxbuATge6jFLgEkwyHiCw3vBlKeLABv4=;
        b=ho95YgYy0qrdsMJB2c864KhpoNESU8WVk1PX09tN+vMaDLch8zA8yIK09lnlOOGuHo
         ZFY/UFXkGsOy2XuSre7mUFjgXi1VhaUGO+aqptyvdaijRpp2vHLEiSBU5ckznozJ0VGU
         403r9dkIUX0UH+KSGqkk+1TcwlZshq8SsSIs/mfiaSrcBP/NB6eh/FXMuqXTZM+8kqk+
         ZLK700OUWPQ1GZV09qIues0f67JDhlgeFt2IMJUDvzEgShY35Z84lpbsHI07DDS4tU7e
         FT4hiOONFF0IJGAPtOevXe8GU2sir11XICjEsaetFw0eNufPMcKVGLxfJC+P/esDHXI7
         esZA==
X-Gm-Message-State: AC+VfDxbCp8hLAUJvcO6JxQ7ckTerknsWPgw7XBSoUOJ/G6tnz6uTIuN
	58kLiKYjvtkduKW7fVdEEkKaRNkAZ0r69kAeAZB0jg==
X-Google-Smtp-Source: ACHHUZ4ZxEuaLTp+ooiNeTmc25ZVUQ9lZpe+Rt8XoUIIdk4qN4EPOlodVLasnpne9S2LMQajSKbtZT7rpwM4H5ILw4M=
X-Received: by 2002:a17:907:7245:b0:932:cec7:6801 with SMTP id
 ds5-20020a170907724500b00932cec76801mr7060488ejc.54.1683213226030; Thu, 04
 May 2023 08:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAOT3mi+DorC4uSqCwO7HmmFVuXX3BLFWJNp_o-NH4OmqP=6ZSg@mail.gmail.com>
 <de0cbb7c94bb9af021f090b684eee4c6b5bb187e.camel@linuxfoundation.org>
In-Reply-To: <de0cbb7c94bb9af021f090b684eee4c6b5bb187e.camel@linuxfoundation.org>
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Thu, 4 May 2023 17:13:20 +0200
Message-ID: <CAEt6NwpsS8omNHvWeQrLzuOAAaki7rt8oYrbgmyNCuG-k0qZyw@mail.gmail.com>
Subject: Re: Yocto Project Community Manager updates
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Nicolas Dechesne <ndec13@gmail.com>, yocto@lists.yoctoproject.org, 
	yocto-advocacy@lists.yoctoproject.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006b569a05fadf9ebb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 15:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180880

--0000000000006b569a05fadf9ebb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Nico for the five years in which we had the pleasure of working
together for the growth and future of the Yocto Project and OpenEmbedded.
Your contributions and insight will be missed - but hopefully not you as a
person. We will meet again, over a drink, and talk of the olde times...

And on the same note, thank you Andy, Richard, and all of the leadership
working group for the trust placed in me. Let us make this a change that
keeps the good and adds more of it.

Greetz,
Josef

On Thu, May 4, 2023 at 5:07=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2023-05-04 at 16:40 +0200, Nicolas Dechesne wrote:
> > After five years, I have decided to resign from my position as the
> > Yocto Project Community Manager. I joined the OpenEmbedded community
> > around 2008. I have fond memories of my early days, and still
> > remember some of my first interactions on IRC and mailing lists! This
> > is a very welcoming community, always helping new people with
> > patience and kindness. Serving the project during the last five years
> > is something I am very proud of, and I will be forever grateful to
> > all of you for accepting me!
>
> I know we've talked but I did want to publicly say thanks for
> everything you've done in the role!
>
> We've had some good times and overcome some challenges in the last few
> years, the project has definitely benefited from your involvement and
> you'll be sorely missed.
>
> Welcome to the role Josef, no pressure! :)
>
> Cheers,
>
> Richard
>

--0000000000006b569a05fadf9ebb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you Nico for the five years in which we had the plea=
sure of working together for the growth and future of the Yocto Project and=
 OpenEmbedded. Your contributions and insight will be missed - but hopefull=
y not you as a person. We will meet again, over a drink, and talk of the ol=
de times...<div><br></div><div>And on the same note, thank you Andy, Richar=
d, and all of the leadership working group for the trust placed in me. Let =
us make this a change that keeps the good and adds more of it.</div><div><b=
r></div><div>Greetz,</div><div>Josef</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 4, 2023 at 5:07=E2=80=
=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Thu, 2023-05-04 at 16:40 +0200, Ni=
colas Dechesne wrote:<br>
&gt; After five years, I have decided to resign from my position as the<br>
&gt; Yocto Project Community Manager. I joined the OpenEmbedded community<b=
r>
&gt; around 2008. I have fond memories of my early days, and still<br>
&gt; remember some of my first interactions on IRC and mailing lists! This<=
br>
&gt; is a very welcoming community, always helping new people with<br>
&gt; patience and kindness. Serving the project during the last five years<=
br>
&gt; is something I am very proud of, and I will be forever grateful to<br>
&gt; all of you for accepting me!<br>
<br>
I know we&#39;ve talked but I did want to publicly say thanks for<br>
everything you&#39;ve done in the role!=C2=A0<br>
<br>
We&#39;ve had some good times and overcome some challenges in the last few<=
br>
years, the project has definitely benefited from your involvement and<br>
you&#39;ll be sorely missed.<br>
<br>
Welcome to the role Josef, no pressure! :)<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--0000000000006b569a05fadf9ebb--


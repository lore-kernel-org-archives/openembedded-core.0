Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
 by mx.groups.io with SMTP id smtpd.web10.1856.1604337879934297473
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 09:24:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qOn9WGT9;
 spf=pass (domain: gmail.com, ip: 209.85.217.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f66.google.com with SMTP id u7so7865531vsq.11
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 09:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AfIecI7XvKGsydOJfxmXr0ZXgO75eAaw1sbdBApqRcs=;
        b=qOn9WGT9rqVd0I0igQG+nJJ8JmHovV3Dhlud0JwjFHf6sImnS4jJOXW6qVHAGtD34z
         FWUwZIg9/rI6c+hpY9N2sJoRYr9KLTrGRQBtGcI0duOj54GhUhAOv2/aJBfLuIkFG190
         fw7yiC+7edhD0HEpBSREG3lzP1Aa82V39u3TW3651UHKzUXsdTxMZJ76iD6aCDESne5g
         2zYFw1EEn7SCGq3K18GR+Qu9rhi08NgVA+SAOswJJBGSSqz/a7wiQbugtvBRSjDk3nM1
         9hNItireMd6hHEIurrHbkllzOBohcXOKT//Yndq7EfvYfy20f1+0oEIIrsTEsLxGMTop
         Njgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AfIecI7XvKGsydOJfxmXr0ZXgO75eAaw1sbdBApqRcs=;
        b=UPtvFPHz6aBfbvsa6KDK6ciV0scmP/ls1pYB3ZmcwTEzsCoVckvNgBkWjYz5BIE/ZQ
         vUUiwykl6a2yLFC1JmuBHTxTpurdFP5KtgLv2uiBIGcqbEZCypVyUkvGdXZa+lTUITmP
         s2ni3dSbTFDHnZr+OqZinATdmppvbN3tfxjqN2y+nZUcoIkl4Sd4dr4vSfe2y7ellSV8
         QFwlcuI07V4CVzxPsoaODmYiTh+8HuTVE0n6CVwCLEOHJggGFcJYneQPS8xlUWGit1rz
         pg4AeUGi2dkG8zHIi2id0bcfccjju4Q9QSJAcbw0xAx8SQvGZbebE9SFUJZN7t7NFKIZ
         BO7Q==
X-Gm-Message-State: AOAM532aXvoEf0I+Fzye03HKuBaISJOB26U/qWcJNNKtBTlud7fLwRDY
	SyXb7Z4WzVmI+acQh176DLpXc0rHA/FaNPhVZao=
X-Google-Smtp-Source: ABdhPJyaqMfSEPA2oDNjLI34scYRKyT4VK9DkAuMIb2lfwLz3YmjHhGzZUiEM01UOPv7XAoCeGid21wWiPrDq9gMvgg=
X-Received: by 2002:a67:1087:: with SMTP id 129mr15387162vsq.41.1604337879171;
 Mon, 02 Nov 2020 09:24:39 -0800 (PST)
MIME-Version: 1.0
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
 <20201102164907.27572-48-alex.kanavin@gmail.com> <3f8aa9dc-ef61-e498-2e3a-1c3efddad253@gmail.com>
In-Reply-To: <3f8aa9dc-ef61-e498-2e3a-1c3efddad253@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 2 Nov 2020 18:24:27 +0100
Message-ID: <CANNYZj8dfikRckpgfogbysKdZU_5n3jRqPJh3eH2ijFx7d2O+A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 48/80] kea: upgrade 1.7.10 -> 1.9.1
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006347bc05b323058f"

--0000000000006347bc05b323058f
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2020 at 18:19, akuster808 <akuster808@gmail.com> wrote:

> On 11/2/20 8:48 AM, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-connectivity/kea/{kea_1.7.10.bb => kea_1.9.1.bb} | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-connectivity/kea/{kea_1.7.10.bb => kea_1.9.1.bb}
> (96%)
>
> do we care if we have a stable version or development version in core?
>
> 1.8 EOL's in 2022 Q1
>

I guess we do, which means the recipe should inherit upstream-version is
even, to avoid erroneous updates to development series.

This patch can be dropped then, to be replaced later by 1.8 update.

Alex

--0000000000006347bc05b323058f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 2 Nov 2020 at 18:19, akuster808 &=
lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wro=
te:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
On 11/2/20 8:48 AM, Alexander Kanavin wrote:<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-connectivity/kea/{<a href=3D"http://kea_1.7.10.bb" =
rel=3D"noreferrer" target=3D"_blank">kea_1.7.10.bb</a> =3D&gt; <a href=3D"h=
ttp://kea_1.9.1.bb" rel=3D"noreferrer" target=3D"_blank">kea_1.9.1.bb</a>} =
| 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 rename meta/recipes-connectivity/kea/{<a href=3D"http://kea_1.7.=
10.bb" rel=3D"noreferrer" target=3D"_blank">kea_1.7.10.bb</a> =3D&gt; <a hr=
ef=3D"http://kea_1.9.1.bb" rel=3D"noreferrer" target=3D"_blank">kea_1.9.1.b=
b</a>} (96%)<br>
<br>
do we care if we have a stable version or development version in core?<br>
<br>
1.8 EOL&#39;s in 2022 Q1<br></blockquote><div><br></div><div>I guess we do,=
 which means the recipe should inherit upstream-version is even, to avoid e=
rroneous updates to development series.</div><div><br></div><div>This patch=
 can be dropped then, to be replaced later by 1.8 update.<br></div><div><br=
></div><div>Alex<br></div></div></div>

--0000000000006347bc05b323058f--

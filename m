Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E225C761AF
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 05:14:19 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.18027.1680153249155934264
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 22:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H1c6LJ7C;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id bx10so61964ljb.8
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 22:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680153247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w+Ft6ejgQkDp5DPW52GXc7Q2SrbDkJ6LU01IiDxmVRk=;
        b=H1c6LJ7CDnz/ssbPah1upUsDP9qRfddMiviwTR8AVwudqieXQ1dSh/TNZz1eCACGlw
         oByZ8KK3J75SmCwyaNT0mNqlxHxcBb1SZHI7dcpn+7JzDgl1GZs7LhcRZTn3HQlPwGwB
         trfril+KNOPCihp7/xUAjyHjg0jPRyDaviuovjmPl2RvHuAtbyf57knaCij5vfA19WDQ
         RBNkCGn7upJguO6BATIXkECy/IbafSWLH/AwfnPqtVuCQyzBJdgoo347cLnQNJJSvUjX
         OIW4FG9BpwcODfhF5DUIc3UGE5SpAkvFxp6DoJi794ZL4EEXwHZUe9JD4kmO/9av95ik
         A7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680153247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+Ft6ejgQkDp5DPW52GXc7Q2SrbDkJ6LU01IiDxmVRk=;
        b=K51dO3LWNH1jv0ksjIxp/2LnszoTW+Hs83VEHL4htFIQZ/iYZ33vlfkW9b+1iOVsKJ
         ynTNaqzYYCOdFYuBkO3psknOas3ghpOyiDMR/k/Dbo8tvFPMX05/Rj/Gxl5sIyYisQ72
         oZmRSshBnZxysSfzRIFYzQr34Ka9TS0Dyw/e+FkUZ2X40ZiOf9iKRznNUMi0aXqRgep4
         My8weEEQvxFoS0EJoOA1yge27HTZRN+7rOBTvBLGTL0t6h51HoH409NadqQJW3VWgQiv
         NrPui5+AoQ7LN1JOEbzKhDC9COGxiVWwcT630vWc005h8qeqcQSCYUcm9q+VgVV41GD0
         lKug==
X-Gm-Message-State: AAQBX9fDU5h361jZqbN0VY33hqTqyTN/0PwfQ5Bc/xIIU/Mu1ttkOoMg
	HlcS9nSMVz2651RMY89vwruDa73nrd+dw0yf0Zc=
X-Google-Smtp-Source: AKy350ZjBPHM22LRO53SusDbXEvMAFfwAMuARks6fcH/CmM5eLqfNfLYOeA3Fy5s+y+o/a2cmXyT5KwIgHIwpTVpwYA=
X-Received: by 2002:a2e:95cb:0:b0:298:92ed:8251 with SMTP id
 y11-20020a2e95cb000000b0029892ed8251mr6729196ljh.10.1680153246737; Wed, 29
 Mar 2023 22:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <1750DBABD4465B3A.18320@lists.openembedded.org>
In-Reply-To: <1750DBABD4465B3A.18320@lists.openembedded.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 30 Mar 2023 07:13:54 +0200
Message-ID: <CAApg2=RTX1D_8AopyHCocL27Y=tLN0FzdVeYMt+00eZfg==jRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-update-nvd2-native: new CVE database fetcher
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross.burton@arm.com>, Marta Rybczynska <marta.rybczynska@syslinbit.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000070aa0c05f8172928"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 05:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179301

--00000000000070aa0c05f8172928
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Mar 2023, 12:03 Marta Rybczynska via lists.openembedded.org,
<rybczynska=gmail.com@lists.openembedded.org> wrote:

> Add new fetcher for the NVD database using the 2.0 API [1].
> The implementation changes as little as possible, keeping the current
> database format (but using a different database file for the transition
> period), with a notable exception of not using the META table.
>
> Minor changes that could be visible:
> - the database starts in 1999 instead of 2002
> - the complete fetch is longer (30 minutes typically)
>

Ross, Richard,
This is the most up-to-date version with urllib and all download errors I
managed to run into.

Kind regards
Marta

>
>

--00000000000070aa0c05f8172928
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, 29 Mar 2023, 12:03 Marta Rybczynska via <a hre=
f=3D"http://lists.openembedded.org">lists.openembedded.org</a>, &lt;rybczyn=
ska=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.o=
penembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Add =
new fetcher for the NVD database using the 2.0 API [1].<br>
The implementation changes as little as possible, keeping the current<br>
database format (but using a different database file for the transition<br>
period), with a notable exception of not using the META table.<br>
<br>
Minor changes that could be visible:<br>
- the database starts in 1999 instead of 2002<br>
- the complete fetch is longer (30 minutes typically)<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">Ross, Richard,</div><d=
iv dir=3D"auto">This is the most up-to-date version with urllib and all dow=
nload errors I managed to run into.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Kind regards=C2=A0</div><div dir=3D"auto">Marta</div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=C2=A0<=
br>
</blockquote></div></div></div>

--00000000000070aa0c05f8172928--


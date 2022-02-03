Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A51C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 09:05:31 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.web12.6868.1643879130571879928
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 01:05:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A/MhMFwL;
 spf=pass (domain: gmail.com, ip: 209.85.221.176,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f176.google.com with SMTP id u25so1277545vkk.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 01:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dweMOiGzkIBPcGa5f7vfKqpCk4wb6/8kQ3x6+jsZk50=;
        b=A/MhMFwLRAEaWAXnjsf4jUa47NQDf9eI+fH6pfwrGRvXcLT5/XK+Lv5HLzr/OhzKZJ
         8YoQ757ANT76s/rPqoniv4dJFN/axfpNd6l36gcf6/YXZBmNNxD6pU+6AYM5pd+VsSU1
         ePLA11sRltErHjbw3hJtLqqCFfrBVvAeqF8XygwNBqrqXIJijmM3phjC/WGjCnpy7KtD
         5dAZJk0hl0rEapFEOG2vTyVV7DCLcwg0B779sgObEinF+12q8FeZx39djtdp5zZE0H9R
         iNWewNmBdeE5lkmNfoRSr7OXuYYnzvQ26n2xz37Eq3lF7MHSHYJMQWZ8qw86cWEBtncV
         uGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dweMOiGzkIBPcGa5f7vfKqpCk4wb6/8kQ3x6+jsZk50=;
        b=7TkCEB+Uww3+wiwnh+Ovm3NVEIijG4caIEfTDKBibvnHVpUs0NqQvE4prvR15f10RX
         JZKaBjFyIHce6cTtJiz0VcZgaqeAXsQNi6gshua43aOvNLSZf1GOINUSLNlfjIIyf06E
         nF8B0FT0kzCE9VAkVu1HnGoTfWu+d9oTJdid04sdwk1817l/iNaPQvASpZVu1VbToPOH
         qbVysTVvzk1KfI5W9UbKdWCbuClCwtjPcYdJ/BgTqZPOqWe0kGt36x1mXLWj+0b7aNTr
         K4/mkSs/S3hZq0Bz80Q1NjdQNBkfIjHvm+D+OtHBcvUSabskyr3ak9uZ02t4dEtAqGCZ
         6v5w==
X-Gm-Message-State: AOAM530cR+mZXuDuKtNaWDD0TyIhDz9fHkGpHsy9of7uM+Jbv/20bJyS
	hXcG/Ra28nHeH9dVCd0PHwD2/EF7gsyugvvGzfc=
X-Google-Smtp-Source: 
 ABdhPJxAhj8Y7bDvBycutcI4IwGuHlc9l/mStxVu2WXZJ64JgLOYtVTJT6w5fFdnLCvGBQQrwAFJ+p1b8RLClNKz+bQ=
X-Received: by 2002:a05:6122:2190:: with SMTP id
 j16mr14182631vkd.21.1643879129713;
 Thu, 03 Feb 2022 01:05:29 -0800 (PST)
MIME-Version: 1.0
References: <20220202134233.2091916-1-ch@denx.de>
 <20220202134233.2091916-3-ch@denx.de>
 <CANPvuRk4fdDOSsw27G5FWKXDO5D9btha79DKTcy8LRn8QDFxyQ@mail.gmail.com>
 <9c67feaf-d39e-1928-84bf-0f14eba29d1c@denx.de>
In-Reply-To: <9c67feaf-d39e-1928-84bf-0f14eba29d1c@denx.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Feb 2022 10:05:18 +0100
Message-ID: 
 <CANNYZj8C=cteRifuapt4h-CWB4LVw4PXmhKbapch7N8_2GNFiQ@mail.gmail.com>
Subject: Re: [PATCH 02/12] gstreamer1.0-plugins-base: 1.18.5 -> 1.19.90
To: Claudius Heine <ch@denx.de>
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
 Marek Vasut <marex@denx.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000948ee005d7196fe5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 09:05:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161268

--000000000000948ee005d7196fe5
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Feb 2022 at 10:03, Claudius Heine <ch@denx.de> wrote:

> >     file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
> \
> >                  file://0003-viv-fb-Make-sure-config.h-is-included.patch
> \
> >
> file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
> >     -           file://0004-glimagesink-Downrank-to-marginal.patch \
> >
> >
> > Why is this patch dropped? As Far as I know it is not merged upstream.
>
> Good catch! Thanks. Not sure why I dropped it. I will add a rebased
> version to v2.
>

On the other hand I think it's something we do not need anymore.

Alex

--000000000000948ee005d7196fe5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 3 Feb 2022 at 10:03, Claudius Heine &lt;<a href=3D"mailto:ch=
@denx.de">ch@denx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">&gt;=C2=A0 =C2=A0 =C2=A0file://0001-ENGR00312515-get-ca=
ps-from-src-pad-when-query-caps.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0=
003-viv-fb-Make-sure-config.h-is-included.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0=
002-ssaparse-enhance-SSA-text-lines-parsing.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://00=
04-glimagesink-Downrank-to-marginal.patch \<br>
&gt; <br>
&gt; <br>
&gt; Why is this patch dropped? As Far as I know it is not merged upstream.=
<br>
<br>
Good catch! Thanks. Not sure why I dropped it. I will add a rebased <br>
version to v2.<br></blockquote><div><br></div><div>On the other hand I thin=
k it&#39;s something we do not need anymore.</div><div><br></div><div>Alex =
<br></div></div></div>

--000000000000948ee005d7196fe5--


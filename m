Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06EE0C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 19:25:41 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web08.2550.1643311540047362615
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 11:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=du6/bX97;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id u24so5004020eds.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 11:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yzTY0rSTQOHjSwjOwjriYc6dt4U2HpNa3loaDJKwbdc=;
        b=du6/bX97PmczArF7EWImsZ8gFoebOjjVCRJLk/RYOfXOu+8fKGKjyuYiT3UeHL04so
         HeXt1cvcwLsgmockmCt9Jk0kumcwAQbrL9sV45a79wS4kzLVS2PecVDNEGbsicZYDb9e
         Z6jD42fN6di2XgBDCiT/0XrY9d6Fbndte/fwiZaKNwOe4gs8eVIUK7iyNub+Hwg3lMB2
         auIRPAh6orH0AOFloft0+GKIxYlEHHZEnHk07vkxjoumQCdI3qLXlhXApjfzFjv21DLy
         ZkTQ3A5h/v7EPAVh32DYEmwZkoGuwg0mBqtesXTz37NeuYMCi8weja3UievphcuCFaT1
         0CYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yzTY0rSTQOHjSwjOwjriYc6dt4U2HpNa3loaDJKwbdc=;
        b=xdvFICaMxTKQ2+pnaYeKphs2lZP3Nv/W9paWpW3U/4YKJ5XqbbtID1oZ5wbs1Z9fv/
         V9XxvHrFv0qbURv/lu7BNwa2em8ep25cegOE7kCSAzHswdvPt24hlUcE84fvyQSIg3FA
         h/k8L7GVuPE+Ill26UhHfAS9n/05YvLnRjqEC6ntSBqEHvdkEEYLDCNwkP+Qhls1u6e3
         SX+80j0EzUk+3luQup/8452dzsMs63ng6QpCXYQz/3OUH4X2jbyrN3oHRak9ffBp/GUa
         BTpxHv9mbpsR6iLmMdIDOYQoIyjI/zF//W8y8gsPh3mXwQHnuHSLgPMRR+o/oD+Bcw4I
         aFrA==
X-Gm-Message-State: AOAM5329nbvooWRTqklGPcCM4WIncGAFF0tmm9TiFvFWoD0tuG01wu51
	63MHUsXW3u0ldxf1GdLCMiIqciC2KdKNfyMglVk=
X-Google-Smtp-Source: 
 ABdhPJxkefPaJBzmAQPkJ7Cka5izu3La0vE15GC3kbWH7SE4MEK+6swJ999/w1AE3aBTdABNDnbXsJIXB1UWwDnnWLc=
X-Received: by 2002:a05:6402:510b:: with SMTP id
 m11mr4990817edd.290.1643311538531;
 Thu, 27 Jan 2022 11:25:38 -0800 (PST)
MIME-Version: 1.0
References: <20220127102005.3050843-1-alex@linutronix.de>
 <20220127102005.3050843-14-alex@linutronix.de>
 <YfLUpiy5XbI24E6G@pevik>
In-Reply-To: <YfLUpiy5XbI24E6G@pevik>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Jan 2022 20:25:26 +0100
Message-ID: 
 <CANNYZj9kn2hvwdZReHyE4SH9xm4gOAQ-7dtUEjoGJ-L8ixpJaQ@mail.gmail.com>
Subject: Re: [PATCH 14/17] ltp: update 20210927 -> 20220121
To: Petr Vorel <petr.vorel@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Ralph Siemsen <ralph.siemsen@linaro.org>,
	Li Wang <liwang@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000082730b05d6954898"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 19:25:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161050

--00000000000082730b05d6954898
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Jan 2022 at 18:21, Petr Vorel <petr.vorel@gmail.com> wrote:

> Hi Alexander,
>
> > The ltp compliancy parser is rewritten to actually
> > match the logs: they seem to be unstructured, test case names
> > are not printed and the only indication of failure is appearance of
> > FAIL[ED] somewhere.
>
> I'd split meta/lib/oeqa/utils/logparser.py change into separate commit.
> It's not related at all to the update.
>

Without this, the update would break the ltp_compliancy ptest, as it would
cause the parser to fail.

Alex

--00000000000082730b05d6954898
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 27 Jan 2022 at 18:21, Petr Vorel &lt;<a href=3D"mailto:petr.=
vorel@gmail.com">petr.vorel@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Hi Alexander,<br>
<br>
&gt; The ltp compliancy parser is rewritten to actually<br>
&gt; match the logs: they seem to be unstructured, test case names<br>
&gt; are not printed and the only indication of failure is appearance of<br=
>
&gt; FAIL[ED] somewhere.<br>
<br>
I&#39;d split meta/lib/oeqa/utils/logparser.py change into separate commit.=
<br>
It&#39;s not related at all to the update.<br></blockquote><div><br></div><=
div>Without this, the update would break the ltp_compliancy ptest, as it wo=
uld cause the parser to fail. <br></div><div><br></div><div>Alex<br></div><=
br></div></div>

--00000000000082730b05d6954898--


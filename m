Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E103AE7717D
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 15:51:13 +0000 (UTC)
Received: from m43-12.mailgun.net (m43-12.mailgun.net [69.72.43.12])
 by mx.groups.io with SMTP id smtpd.web10.19007.1734105070227154545
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 07:51:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@asterius.io header.s=mailo header.b=C5HmOnKl;
 spf=pass (domain: asterius.io, ip: 69.72.43.12, mailfrom: bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt; s=mailo; t=1734105068; x=1734112268;
 h=Content-Type: Cc: To: To: Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References: MIME-Version: Sender: Sender;
 bh=81QEH66ob5N36G1MyXsL9oTMelJ0jer93kaFyOUW2Do=;
 b=C5HmOnKlf235pecsf76f9f9ujdURSkJxt0yHoA/ua+DNRESXJZYqlzvNPXHsDE3bdkmf5WLfbKCpE+FnPDLpsWCiq4Nv/EKUtIUNe36Atk4q2prNTIqS/g7OAZiCSMb0GG+v343AjECMytHNJhpi7CbhusO9MiUUyyfcMduj3NQ=
X-Mailgun-Sending-Ip: 69.72.43.12
X-Mailgun-Sending-Ip-Pool-Name: 
X-Mailgun-Sending-Ip-Pool: 
X-Mailgun-Sid: WyJiMTQwMSIsIm9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmciLCIzYTU2ODUiXQ==
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43]) by
 a9da4f3a65be with SMTP id 675c57ec8d01bf1d14d287f9 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Fri, 13 Dec 2024 15:51:08 GMT
Sender: derek@asterius.io
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d4e2aa7ea9so3559553a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 07:51:08 -0800 (PST)
X-Gm-Message-State: AOJu0YxiFpiqKvZFAMTDlDPUw/cUriOs+AbQwLjqgJOnjHv8a+R6BhEz
	20s0Ml2sroJgE8Jk30jAE2wBnRbHsXJDpRALlHn7q2iHYfjB6wfhrBNV+xwv3ZOPrRVpMlv0SCE
	M0f0yXgX/hkW74CeR0X6Rs8pP5xY=
X-Google-Smtp-Source: AGHT+IFj5zHhW8ff0dA3H3I5F1MIaIeRC1VcuZ4hny9SnwNMY5gCzRruiFwpMrids2ANQzLMRp+tR9lOV9j3/Co+8yA=
X-Received: by 2002:a17:907:9507:b0:aa5:46b6:4344 with SMTP id
 a640c23a62f3a-aab77eda8b9mr278533266b.58.1734105067677; Fri, 13 Dec 2024
 07:51:07 -0800 (PST)
MIME-Version: 1.0
References: <20241212185619.1599668-1-derek@asterius.io> <CANNYZj8dnzzoQOcPUzMxh0mQSK5Xsd4QxAbegHFXn5fLBDmtWQ@mail.gmail.com>
 <CADNbA1puOQNd-YL3anMpdpfxGHxwYUWM803_2Ho++oNE==7vvQ@mail.gmail.com> <CANNYZj_bngoCTdTHjYmnptiSBu8SLV8SxVgr0ZgV1NyesmhHLg@mail.gmail.com>
In-Reply-To: <CANNYZj_bngoCTdTHjYmnptiSBu8SLV8SxVgr0ZgV1NyesmhHLg@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 13 Dec 2024 09:50:56 -0600
X-Gmail-Original-Message-ID: <CADNbA1q=iv0XY367SWaOJs2T4b4NTg_d421jUZvBhTeYT_HUGw@mail.gmail.com>
Message-ID: <CADNbA1q=iv0XY367SWaOJs2T4b4NTg_d421jUZvBhTeYT_HUGw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/pypi: update the default
 UPSTREAM_CHECK_URI to use the simple repo API
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008ff7af062928cc47"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 15:51:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208688

--0000000000008ff7af062928cc47
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Agreed.  It's painful at times because there isn't a complete
standardization in pypi naming conventions.  I' sent a v2 that is intended
to resolve all of the oe-core UNKNOWN_BROKEN python recipes.  I'll move to
those in meta-python next.

On Fri, Dec 13, 2024 at 9:15=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> On Fri, 13 Dec 2024 at 15:53, Derek Straka <derek@asterius.io> wrote:
> > Thanks for your note.  I=E2=80=99m working through the remaining downst=
ream
> recipe changes today which should address the rest of the UNKNOWN_BROKEN
> recipes.
> >
> > While looking at it yesterday, the download packages come primarily in
> two archetypes:
> > 1. Those that replace =E2=80=98_=E2=80=99 with =E2=80=98-=E2=80=98 in t=
he source archives
> > 2. Those that leave the =E2=80=98_=E2=80=99 ONLY in the archives
> >
> > Given that, I think it=E2=80=99s unlikely there=E2=80=99s a clean fix i=
n the bbclass
> without a more invasive change to the upstream check logic.  I can,
> however, package all the changes for one-core into a single patchset and
> submit a v2.  That will at least address all the core updates in one fell
> swoop.
> >
> > Does that sound reasonable?
>
> Seems so, yes.
>
> Historically pypi upstream checks have been a pain, as there has been
> a constant stream of seemingly random breaking changes, of two types:
>
> 1. _ being replaced by - and vice versa
> 2. CamelCasing being replaced by lowercasing and vice versa.
>
> I haven't been able to figure out any pattern in this, or come up with
> a universal check. If you can simply fix up core recipes to not return
> UNKNOWN_BROKEN, I'd appreciate.
>
> Alex
>

--0000000000008ff7af062928cc47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Agreed.=C2=A0 It&#39;s painful at times b=
ecause there isn&#39;t a complete standardization in pypi naming convention=
s.=C2=A0 I&#39; sent a v2 that=C2=A0is intended to resolve all of the oe-co=
re UNKNOWN_BROKEN python recipes.=C2=A0 I&#39;ll move to those in meta-pyth=
on next.</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Dec 13, 2024 at 9:15=E2=80=AFAM Alexa=
nder Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Fri, 13 Dec 2024 at 15:53, Derek Straka &lt;<a href=3D"mailto:dere=
k@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt; wrote:<br>
&gt; Thanks for your note.=C2=A0 I=E2=80=99m working through the remaining =
downstream recipe changes today which should address the rest of the UNKNOW=
N_BROKEN recipes.<br>
&gt;<br>
&gt; While looking at it yesterday, the download packages come primarily in=
 two archetypes:<br>
&gt; 1. Those that replace =E2=80=98_=E2=80=99 with =E2=80=98-=E2=80=98 in =
the source archives<br>
&gt; 2. Those that leave the =E2=80=98_=E2=80=99 ONLY in the archives<br>
&gt;<br>
&gt; Given that, I think it=E2=80=99s unlikely there=E2=80=99s a clean fix =
in the bbclass without a more invasive change to the upstream check logic.=
=C2=A0 I can, however, package all the changes for one-core into a single p=
atchset and submit a v2.=C2=A0 That will at least address all the core upda=
tes in one fell swoop.<br>
&gt;<br>
&gt; Does that sound reasonable?<br>
<br>
Seems so, yes.<br>
<br>
Historically pypi upstream checks have been a pain, as there has been<br>
a constant stream of seemingly random breaking changes, of two types:<br>
<br>
1. _ being replaced by - and vice versa<br>
2. CamelCasing being replaced by lowercasing and vice versa.<br>
<br>
I haven&#39;t been able to figure out any pattern in this, or come up with<=
br>
a universal check. If you can simply fix up core recipes to not return<br>
UNKNOWN_BROKEN, I&#39;d appreciate.<br>
<br>
Alex<br>
</blockquote></div></div>

--0000000000008ff7af062928cc47--


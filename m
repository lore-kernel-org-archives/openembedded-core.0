Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0165E77180
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 14:53:53 +0000 (UTC)
Received: from so254-41.mailgun.net (so254-41.mailgun.net [198.61.254.41])
 by mx.groups.io with SMTP id smtpd.web10.17371.1734101613948873517
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 06:53:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@asterius.io header.s=mailo header.b=cR2ZJJdU;
 spf=pass (domain: asterius.io, ip: 198.61.254.41, mailfrom: bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt; s=mailo; t=1734101612; x=1734108812;
 h=Content-Type: Cc: To: To: Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References: MIME-Version: Sender: Sender;
 bh=hKtFbtddAJoKajFg26bRdBjeU+/lbRZS86tZWrcO3xw=;
 b=cR2ZJJdUNJS4vkNTbq54V+/Gc6aTJsrlIg+qVJSps4MRRsTdyi3jIjBx50Mx7Plle311NLvdSDo6KE446CSlEyqcWKszGJfBctkrD+qKAa4sQ4f/lEdMyWvO5bYmPzCp5MwL4lVudL8Ik8A9mb9+oPQD3ZiMTfcNQdFFfuJAs5s=
X-Mailgun-Sending-Ip: 198.61.254.41
X-Mailgun-Sending-Ip-Pool-Name: 
X-Mailgun-Sending-Ip-Pool: 
X-Mailgun-Sid: WyJiMTQwMSIsIm9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmciLCIzYTU2ODUiXQ==
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52]) by
 b8faa7c31ae7 with SMTP id 675c4a6b83dbb2a7275164cc (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Fri, 13 Dec 2024 14:53:31 GMT
Sender: derek@asterius.io
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa66ead88b3so347102166b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 06:53:31 -0800 (PST)
X-Gm-Message-State: AOJu0Yy0T3Misfhl050Fw7H057GSoaVl4EA3xslkrSphBwatCq8yNMgK
	iyJyATz6MdsKVEvy3t8rTZq2uKyMUpDv3sQcXkFhRGekkVaU2ARMtJRILz+JMMgJmT75JtM/o7+
	Xh/lBq0WfWFakKnHauhNLsfF2hsI=
X-Google-Smtp-Source: AGHT+IHcpMglcQ8rynXOWBSAwL7udTMIPNmAyeq5OnXdhv5XSXHVbRRVxGP+0l/zrb7i7OiLO1IjiKY2scIfHcYU8Hs=
X-Received: by 2002:a17:907:9450:b0:aa6:7d82:5413 with SMTP id
 a640c23a62f3a-aab779b3f5emr292336066b.34.1734101609981; Fri, 13 Dec 2024
 06:53:29 -0800 (PST)
MIME-Version: 1.0
References: <20241212185619.1599668-1-derek@asterius.io> <CANNYZj8dnzzoQOcPUzMxh0mQSK5Xsd4QxAbegHFXn5fLBDmtWQ@mail.gmail.com>
In-Reply-To: <CANNYZj8dnzzoQOcPUzMxh0mQSK5Xsd4QxAbegHFXn5fLBDmtWQ@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 13 Dec 2024 08:53:18 -0600
X-Gmail-Original-Message-ID: <CADNbA1puOQNd-YL3anMpdpfxGHxwYUWM803_2Ho++oNE==7vvQ@mail.gmail.com>
Message-ID: <CADNbA1puOQNd-YL3anMpdpfxGHxwYUWM803_2Ho++oNE==7vvQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/pypi: update the default
 UPSTREAM_CHECK_URI to use the simple repo API
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000077b69a062927fed4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 14:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208685

--00000000000077b69a062927fed4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Thanks for your note.  I=E2=80=99m working through the remaining downstream=
 recipe
changes today which should address the rest of the UNKNOWN_BROKEN recipes.

While looking at it yesterday, the download packages come primarily in two
archetypes:
1. Those that replace =E2=80=98_=E2=80=99 with =E2=80=98-=E2=80=98 in the s=
ource archives
2. Those that leave the =E2=80=98_=E2=80=99 ONLY in the archives

Given that, I think it=E2=80=99s unlikely there=E2=80=99s a clean fix in th=
e bbclass
without a more invasive change to the upstream check logic.  I can,
however, package all the changes for one-core into a single patchset and
submit a v2.  That will at least address all the core updates in one fell
swoop.

Does that sound reasonable?

-Derek

On Fri, Dec 13, 2024 at 2:28=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> On Thu, 12 Dec 2024 at 19:56, Derek Straka via lists.openembedded.org
> <derek=3Dasterius.io@lists.openembedded.org> wrote:
>
> > Update the UPSTREAM_CHECK_URI to leverage the simple repo API.  The
> > project URLs require javascript which breaks the version checking fetch
> > and subsequent logic.  The simple repo API provides similar
> > functionality with a well defined spec which is used by tools such as
> > pip.  Also update the UPSTREAM_CHECK_REGEX to be compatible with the
> > information retrieved via the API
>
> Unfortunately even with this patch, there's a large amount of
> UNKNOWN_BROKEN in the output of 'devtool check-upgrade-status'. Can
> you please check those, hopefully it's a simple tweak?
>
> Alex
>

--00000000000077b69a062927fed4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Alex,</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Thanks for your note.=C2=A0 I=E2=80=99m working through the remaining do=
wnstream recipe changes today which should address the rest of the UNKNOWN_=
BROKEN recipes.</div><div dir=3D"auto"><br></div><div dir=3D"auto">While lo=
oking at it yesterday, the download packages come primarily in two archetyp=
es:=C2=A0</div><div dir=3D"auto">1. Those that replace =E2=80=98_=E2=80=99 =
with =E2=80=98-=E2=80=98 in the source archives</div><div dir=3D"auto">2. T=
hose that leave the =E2=80=98_=E2=80=99 ONLY in the archives</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Given that, I think it=E2=80=99s unli=
kely there=E2=80=99s a clean fix in the bbclass without a more invasive cha=
nge to the upstream check logic.=C2=A0 I can, however, package all the chan=
ges for one-core into a single patchset and submit a v2.=C2=A0 That will at=
 least address all the core updates in one fell swoop.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Does that sound reasonable?</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">-Derek</div><div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 13, 2024 at 2:28=
=E2=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
>alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">On Thu, 12=
 Dec 2024 at 19:56, Derek Straka via <a href=3D"http://lists.openembedded.o=
rg" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><br>
&lt;derek=3D<a href=3D"mailto:asterius.io@lists.openembedded.org" target=3D=
"_blank">asterius.io@lists.openembedded.org</a>&gt; wrote:<br>
<br>
&gt; Update the UPSTREAM_CHECK_URI to leverage the simple repo API.=C2=A0 T=
he<br>
&gt; project URLs require javascript which breaks the version checking fetc=
h<br>
&gt; and subsequent logic.=C2=A0 The simple repo API provides similar<br>
&gt; functionality with a well defined spec which is used by tools such as<=
br>
&gt; pip.=C2=A0 Also update the UPSTREAM_CHECK_REGEX to be compatible with =
the<br>
&gt; information retrieved via the API<br>
<br>
Unfortunately even with this patch, there&#39;s a large amount of<br>
UNKNOWN_BROKEN in the output of &#39;devtool check-upgrade-status&#39;. Can=
<br>
you please check those, hopefully it&#39;s a simple tweak?<br>
<br>
Alex<br>
</blockquote></div></div>

--00000000000077b69a062927fed4--


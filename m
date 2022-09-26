Return-Path: <andriy.danylovskyy@streamunlimited.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48869C07E9D
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 12:59:07 +0000 (UTC)
Subject: Re: [PATCH] classes/patch: move QUILT_PC for patching consistency
To: openembedded-core@lists.openembedded.org
From: "Andriy Danylovskyy" <andriy.danylovskyy@streamunlimited.com>
X-Originating-Location: Vienna, AT (91.114.0.140)
X-Originating-Platform: Linux Chrome 105
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 26 Sep 2022 05:59:02 -0700
References: 
 <d2e8e257c5e15ee3e91017a425a09f730c66f326.camel@linuxfoundation.org>
In-Reply-To: 
 <d2e8e257c5e15ee3e91017a425a09f730c66f326.camel@linuxfoundation.org>
Message-ID: <18402.1664197142886667457@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="vq2b78r96LBRF7ICq6bR"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 12:59:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171065

--vq2b78r96LBRF7ICq6bR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On 26/09/2022 14:21, Richard Purdie wrote:

>=20
> I'm old school and have used quilt for patching kernels for a couple of
> decades and have used it before devtool (or even git) existed! There
> are
> probably better ways now but quilt is muscle memory.
>=20
>=20
>>  =C2=A0Then another (dirtier?) option would be to patch quilt-native
>> itself,
>> setting QUILT_PC to the relative ./patches/.pc
>>=20
>=20
> Sadly it doesn't help my use case as I'm used to changing to some
> random
> WORKDIR and using the host's copy of quilt to save messing with
> PATH :/.
>=20
> Cheers,
>=20
> Richard
>=20

I see, you never imagine all use cases until you ask.
But the issue needs a solution, one way or another. What's especially bad i=
s this can go unnoticed for quite a while.

--
Best regards,
Andriy

--vq2b78r96LBRF7ICq6bR
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<br />
<div class=3D"moz-cite-prefix">On 26/09/2022 14:21, Richard Purdie wrote:</=
div>
<blockquote cite=3D"mid:d2e8e257c5e15ee3e91017a425a09f730c66f326.camel@linu=
xfoundation.org">
<pre class=3D"moz-quote-pre">I'm old school and have used quilt for patchin=
g kernels for a couple of
decades and have used it before devtool (or even git) existed! There
are probably better ways now but quilt is muscle memory.

</pre>
<blockquote>
<pre class=3D"moz-quote-pre"> &nbsp;Then another (dirtier?) option would be=
 to patch quilt-native
itself, setting QUILT_PC to the relative ./patches/.pc
</pre>
</blockquote>
<pre class=3D"moz-quote-pre">Sadly it doesn't help my use case as I'm used =
to changing to some
random WORKDIR and using the host's copy of quilt to save messing with
PATH :/.

Cheers,

Richard
</pre>
</blockquote>
I see, you never imagine all use cases until you ask.<br />But the issue ne=
eds a solution, one way or another. What's especially bad is this can go un=
noticed for quite a while.<br /><br />--<br />Best regards,<br />Andriy

--vq2b78r96LBRF7ICq6bR--


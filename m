Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 64F507F166
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 13:41:05 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id k10so45558000qtq.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 06:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ud7n6IX0hlosJRSI/Le8MWNrpsPIZPPNflTJeMfKqnU=;
	b=qxOR73BxixYs7ckpQNIMY1HXrbhTNfWgdl3QhC3D8eD6EwucCsWOGs81AJ0bER7EKH
	UOazlwDl7qZdTID5a/vcVUQ8+XO/g3ue3Z1XdQOIw7/Y/pS6z/sylIoMb9twVONDFl4W
	3mdWNwYNcDFBsMrjg2Ak/Zr55yp6DvNNQSlrUSml5gJeXwbmn1HqAj03vg68SCjUWvbW
	XWy6toXXyqjtPfKC/9vyEXDDqzRugjAX+tz6tbrubHfYmDjovqC4qL2E3aw5Q7dFlCJ8
	mB5r4gm6V3ZVBC33MmmmXbulgclx514jtyXs8Rx0vllj+/6ISKWnCAUbpUwLopB8cE90
	RgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ud7n6IX0hlosJRSI/Le8MWNrpsPIZPPNflTJeMfKqnU=;
	b=YPP15RasENODp/HJ83nqxPltVf1caal/RFGgCs1w6nlbOgAJ7LqTVz5XAKncfAIKM4
	QBpMiofh9+CU9Uc+zJa8qYF3p6U3tGgB+tAACnAqpsgtU7tMbsL6na29XT6IH46Zycg9
	j1TTAOv3kQ26uj4m/N/s8PpUFqvyztQMJahdpUVQspoIy3DJaajaN0gdAbIjxPl293HW
	0iBtxDHEbQzhy/MBL4adzq+s6/1trcELWgXQBSuYIKgjHgVEdRsh6qwJCWDlyR+EbmQP
	YTyJfZfTNQAFlE5QW0yPGIdITiYo1ZvftEXy561IosZk6v2dYWZdInCMyfkQBTJi+CVi
	mEHQ==
X-Gm-Message-State: APjAAAVaY9ayY7cCX4+XNtcJS8KAGuXPeRycs4JKEOBgvElfbnrchHgu
	GqrthUORHWUJ/pgSOMnirtm/KLkzfCw8nEwPpUs=
X-Google-Smtp-Source: APXvYqzfxZt40W5rTJOh2h8qLbc+KNO0eYHeOkMmtGm46Lpzr1qDvdXWGKQ3Y2EFSa6tVcSBj6TBbT8iKjkA3907bzw=
X-Received: by 2002:a0c:ae5a:: with SMTP id z26mr58342585qvc.65.1563975666074; 
	Wed, 24 Jul 2019 06:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190724000313.26375-1-anuj.mittal@intel.com>
	<fb36e3dc-6246-914d-c427-974a1b167216@balister.org>
	<a38548e3-17a5-8007-80ec-77bca123d491@gmail.com>
	<20190724071549.GA19385@localhost>
In-Reply-To: <20190724071549.GA19385@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Jul 2019 06:40:55 -0700
Message-ID: <CAMKF1sr9kSXwD-imhW75zs+GzTRvH3W1+xaqvaRVfQ0oN-SGuA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libsdl: remove
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jul 2019 13:41:05 -0000
Content-Type: multipart/alternative; boundary="0000000000000387d5058e6d762e"

--0000000000000387d5058e6d762e
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 24, 2019 at 12:15 AM Adrian Bunk <bunk@stusta.de> wrote:

> On Tue, Jul 23, 2019 at 11:59:47PM -0700, Khem Raj wrote:
> >
> > On 7/23/19 11:28 PM, Philip Balister wrote:
> > > On 07/24/2019 02:03 AM, Anuj Mittal wrote:
> > > > All the users in OE-Core have moved to libsdl2. It will be moved to
> > > > meta-oe.
> > > Are there any users in meta-oe? Can we just drop this completely? (Yes,
> > > I've been afk so may have missed some email)
> >
> > yes there are recipes asking for virtual/libsdl2
>
> libsdl is the previous generation before libsdl2.
> libsdl2 will stay in oe-core.


Libsdl I agree add it if someone asks for it

>
>
> In meta-oe there's gegl that needs libsdl,
> and in meta-multimedia libdc1394.
>
> Plus various libsdl-* packages.
>
> So yes, dropping it completely sounds feasible.
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
>

--0000000000000387d5058e6d762e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jul 24, 2019 at 12:15 AM Adrian Bunk &lt;<a href=3D=
"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">On Tue, Jul 23, 2019 at 11:59:47PM -0700, Khem Raj wrote=
:<br>
&gt; <br>
&gt; On 7/23/19 11:28 PM, Philip Balister wrote:<br>
&gt; &gt; On 07/24/2019 02:03 AM, Anuj Mittal wrote:<br>
&gt; &gt; &gt; All the users in OE-Core have moved to libsdl2. It will be m=
oved to<br>
&gt; &gt; &gt; meta-oe.<br>
&gt; &gt; Are there any users in meta-oe? Can we just drop this completely?=
 (Yes,<br>
&gt; &gt; I&#39;ve been afk so may have missed some email)<br>
&gt; <br>
&gt; yes there are recipes asking for virtual/libsdl2<br>
<br>
libsdl is the previous generation before libsdl2.<br>
libsdl2 will stay in oe-core.</blockquote><div dir=3D"auto"><br></div><div =
dir=3D"auto">Libsdl I agree add it if someone asks for it=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><br>
<br>
In meta-oe there&#39;s gegl that needs libsdl,<br>
and in meta-multimedia libdc1394.<br>
<br>
Plus various libsdl-* packages.<br>
<br>
So yes, dropping it completely sounds feasible.<br>
<br>
cu<br>
Adrian<br>
<br>
-- <br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Is there not promise of rain?&quot; Ling T=
an asked suddenly out<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 of the darkness. There had been need of rain fo=
r many days.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Only a promise,&quot; Lao Er said.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pearl S. =
Buck - Dragon Seed<br>
<br>
</blockquote></div></div>

--0000000000000387d5058e6d762e--

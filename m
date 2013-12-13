Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id DE84D6DDFD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 16:14:48 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id eh20so1563780lab.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 08:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=z65kx88GFOk5YItLY/lgj+AE+1USBiJy6/TVQ8kejJk=;
	b=aEwzRVOof/t5xCXLBLBQGGTi8lA8760vh4/P79pVG2h/K0iWYsuKkAHlRCPamheLFo
	+bZDfNU7qE4kewfkY70EXn6AkpnnqnoSTCQZ0W0GnntWScRZHjHybUGYXjiS/E/sg3tt
	DjuMHEKQ3UY1O1IM8O7bD4PI8vtV7P5bu9b52cdkTNbeptMlD4PnMqhnfCOTGjmyebXt
	ZkayMKRioHJEqSn8nC79qoJ1KRwlMD9qeU+PsxPCC+kH6qBEcf245wJ7KYPqL+ZUqJh0
	Yc34s0epp8WwmISEt+bfVNmRGNz49soB3Q8WBECQcDFp8kLe+MMWZvyrRD0XJXgDSRC2
	HVfw==
X-Received: by 10.152.28.230 with SMTP id e6mr2014818lah.3.1386951287354; Fri,
	13 Dec 2013 08:14:47 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.22.169 with HTTP; Fri, 13 Dec 2013 08:14:27 -0800 (PST)
In-Reply-To: <52AB2E16.5070905@windriver.com>
References: <cover.1386946335.git.kergoth@gmail.com>
	<6122710ad05d4a2c1fa2d42fba3025cae6dab5ed.1386946335.git.kergoth@gmail.com>
	<52AB2E16.5070905@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 13 Dec 2013 09:14:27 -0700
X-Google-Sender-Auth: e_WrDuEz30T9j9iH1pSepwOy6ck
Message-ID: <CABcZANkdh-Ym6uS_vyMQUSBjEVmOpciwRcYLNDEV0qsSmuiWeg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 1/2] os-release: add new operating system identification recipe
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
X-List-Received-Date: Fri, 13 Dec 2013 16:14:50 -0000
Content-Type: multipart/alternative; boundary=089e0160b79acdb9c104ed6cc20c

--089e0160b79acdb9c104ed6cc20c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2013 at 8:56 AM, Mark Hatle <mark.hatle@windriver.com>wrote=
:

> On 12/13/13, 8:56 AM, Christopher Larson wrote:
>
>> From: Christopher Larson <chris_larson@mentor.com>
>>
>> This is needed by systemd, among other useful applications. All fields a=
re
>> metadata driven, and initial values come from our DISTRO variables.
>>
>
> I thought there was a part of the lsb-release recipe that did this same
> thing.
>
> It doesn't set the 'os-release' file, but the 'lsb-release' file.  Maybe
> it would make sense to consolidate this stuff into a base-file-...


Yeah, that=E2=80=99s part of why I posted this as an RFC, there=E2=80=99s t=
his question of
whether such things should just get folded into base-files, or stay
separate. I don=E2=80=99t have a very strong opinion on it either way, myse=
lf.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0160b79acdb9c104ed6cc20c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Dec 13, 2013 at 8:56 AM, Mark Hatle <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver=
.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 12/13/13, 8:56 AM, Chri=
stopher Larson wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com" tar=
get=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
<br>
This is needed by systemd, among other useful applications. All fields are<=
br>
metadata driven, and initial values come from our DISTRO variables.<br>
</blockquote>
<br></div>
I thought there was a part of the lsb-release recipe that did this same thi=
ng.<br>
<br>
It doesn&#39;t set the &#39;os-release&#39; file, but the &#39;lsb-release&=
#39; file. =C2=A0Maybe it would make sense to consolidate this stuff into a=
 base-file-...</blockquote></div><br>Yeah, that=E2=80=99s part of why I pos=
ted this as an RFC, there=E2=80=99s this question of whether such things sh=
ould just get folded into base-files, or stay separate. I don=E2=80=99t hav=
e a very strong opinion on it either way, myself.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--089e0160b79acdb9c104ed6cc20c--

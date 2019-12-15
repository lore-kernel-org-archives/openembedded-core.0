Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
	[209.85.222.47])
	by mail.openembedded.org (Postfix) with ESMTP id D9B137F7BB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 17:12:52 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id l6so802436uap.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 09:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wZYleQ+lMufF1acion7MjtOCcUteIu/l7DOOv+Fizuc=;
	b=rT9JuCVSWlcBzc8UKsQo+Rw3W3edC4BpoWlk85KVa0GL52zW8ff/d7tDs/HlZeG8/j
	Dl76ZyfruJ6BV0IDaU8PV1kVZZr4jrLauznf1kK8Ex9G7mc8TUR27ABqmjHPK3hguKC1
	o6uY0rcJ0DLhVz7ftwMHKlT2JZ06yfbNYE0byrWUu0vMlL7MiyfZUYGMviG8OqJT5M+c
	AIA0ZCqlXDLEHmoGEjeRAsTYdz9GyPV8dN3CSmRAan46IewQV9fmujotmozebq1w/rnb
	NlR2p0dwj7T0f419eFuU4hefdpdR+IAqNEiVh+VLJjUzj8m0COvC0Q6KRAUzhu6x/Pb1
	bqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wZYleQ+lMufF1acion7MjtOCcUteIu/l7DOOv+Fizuc=;
	b=XL8180nR/JDf17SdbSu0D/9+cMczZNngql/oY5xg+tPxwrgCZt94BEfEoI7z4LCkDR
	7uLpcniRwCRWzVY1sOO+D8KaQlfFWCa3IWzWPNBWFEHQi8HUzbw5PljGi/WSKsq5mJ7j
	CaH2/yNaE7RlrjK3jkNXyJXYnPwCyULaqX3Zt1Rv8P+QCsIIbYS4w8SKXs/Q0N9+2yT8
	d+AaRjWW41W05v6WHASpQbN+05Ij7Ot5cRXPehXxOa+0Jej9dx++pzHcLYwB2989OqvW
	lUARAruioR5q+k0L8US2no4/L5IgH/drX7zSASvb/8AfK57spkKvhnW/Pn6I3cURJOcB
	PKFQ==
X-Gm-Message-State: APjAAAXvs2HGn1m91OWEDdCl9IjfFAQ7zxMMuLlF1+y8PIGyEHCkRyhU
	FkE43UKRIA64tVhVciYPkyUgWW4G4d7kSRjOJQY=
X-Google-Smtp-Source: APXvYqwu9tzqfOog7wt7g1fY2AO9VRHmyA23tX4abmc7LnX6jbVOhNsMrH0RBbNioL/7wUcIOr4jJOZMQQ5L9nGQc8o=
X-Received: by 2002:a9f:3fcc:: with SMTP id m12mr20618565uaj.89.1576429973820; 
	Sun, 15 Dec 2019 09:12:53 -0800 (PST)
MIME-Version: 1.0
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-7-alex.kanavin@gmail.com>
	<CAMKF1spXie5SDtsJj6R=6hAUjYo8kBTmyj+SfW4rYU+1cWUtig@mail.gmail.com>
	<CANNYZj_k4NmmSAp+r80Ss+jgsd22hYcxRSySqYn7Yby8PCrDJw@mail.gmail.com>
	<CAMKF1sof2JwFMX=kHVaup_-LA3UjsqrU5iGXZymR5TOzGik1ZA@mail.gmail.com>
In-Reply-To: <CAMKF1sof2JwFMX=kHVaup_-LA3UjsqrU5iGXZymR5TOzGik1ZA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 15 Dec 2019 18:12:42 +0100
Message-ID: <CANNYZj_ZaJ-prapQf6adS6Adp4CnF2X4TG3HPDonivPj_QAnrA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/30] gstreamer1.0-python: add a patch to fix python 3.8 builds
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
X-List-Received-Date: Sun, 15 Dec 2019 17:12:53 -0000
Content-Type: multipart/alternative; boundary="0000000000009a5afd0599c134bf"

--0000000000009a5afd0599c134bf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 15 Dec 2019 at 18:06, Khem Raj <raj.khem@gmail.com> wrote:

> This is expected; the patch should be merged together with 3.8 upgrade.
>
> I don=E2=80=99t think this patch is right though since this patch is crea=
ting
> py3.8 dependency if you want to upstream something that should work with
> all py3 I think
>

It's being discussed in the upstream submission ticket, and will be
resolved; we can take the 3.8-specific fix meanwhile.

Alex

--0000000000009a5afd0599c134bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 15 Dec 2019 at 18:06, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div>This is expected; the patch should be merg=
ed together with 3.8 upgrade.</div></div><div><div class=3D"gmail_quote"><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">I don=E2=80=99t think this patc=
h is right though since this patch is creating py3.8 dependency if you want=
 to upstream something that should work with all py3 I think <br></div></di=
v></div></blockquote><div><br></div><div>It&#39;s being discussed in the up=
stream submission ticket, and will be resolved; we can take the 3.8-specifi=
c fix meanwhile.</div><div><br></div><div>Alex<br></div></div></div>

--0000000000009a5afd0599c134bf--

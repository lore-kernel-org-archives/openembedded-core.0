Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67])
	by mail.openembedded.org (Postfix) with ESMTP id E5A747FEEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 16:08:12 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id y2so2647422qvu.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 08:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vWPr6w237F2p7sygDRUR5rnRMCs1OWneJvn7oxGby/M=;
	b=Z3nlN69zypdaBDvlkbpfb9JQb4g8Syv5QH6hcSpJRPRcj0jgzRIzCTO+z2J0ZF4rUy
	VJwdK18TQ5c5aNC7PJup2sPsSRxCdl+sxIu2ycQ3W+33XYmQq/wwGueJ83rBLhLvTRlV
	iYCwVG1dywCkZoHv8UYA+/rB8W8elBh+BT1fqr+CKfKxmaYyLVjLbER25C95v9NNdTc5
	f48G2BW0o8q7LCz6cdks/3/29QbNxHMLG0WO4hnkY+YbaeVJSjFF8tOFTjTlJ6a+TVqa
	KizBNiQlwWMrWM3FTmj0UB/xD7LiX694omKcDnw33QRBpbJrBUWiRX8waXI59Z+V8J9c
	BbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vWPr6w237F2p7sygDRUR5rnRMCs1OWneJvn7oxGby/M=;
	b=EP1WnwrURin6hY71GPYAdk8qUXCcGOdNThIPm0W7pL5tFNP199OXnRPRjbzZkRXI3e
	g2auijgoXi3/CZv6rcYAmofx1vSIgyC7xFRbOGGrLl20CO+qiBAcgAX7HfLcbNmAUDQ0
	v5r+DVeV66SZ7ch59GmgvOkB+Edj0NRmVf1tk08U/WThRaiparVR0j5NkSFMe3aD1YKN
	6mvvC4x79zQi2ZbgVPpcoueFmpSeb8btWL411V6wJfbBqirVgkh3UMKOtNCaAAzzmpZ/
	a9PgY5PJ4MWgIPSFLjWWCbMbVdQRPUGaqFAZs6GG/Bt0kDNjebPa3FRWZJBZZHDLcq4I
	PRBA==
X-Gm-Message-State: APjAAAUwYVow74MftU7fd2CohfhDPcHMBu1DKr6ENRahdMIpEXp4NAfZ
	A6/IDuovoHVJcwlK/aaplXhRB5inkc6BIO+i5MU=
X-Google-Smtp-Source: APXvYqzSvZY712nwUeB+C3NHS++5C+2DTkn2O7RdVM97A60qFy1iUV5jF7dTuxWTcxBTvc2l3AHilNBD4tQMSPYzbhg=
X-Received: by 2002:ad4:478b:: with SMTP id z11mr23346749qvy.185.1580227693558;
	Tue, 28 Jan 2020 08:08:13 -0800 (PST)
MIME-Version: 1.0
References: <20200128035850.2629175-1-raj.khem@gmail.com>
	<A678FC67-6C95-4B81-8DC0-28446111D1CE@gmail.com>
	<4eb4ce6425a3cc96d9500ddc54eb9e34cc4df57c.camel@linuxfoundation.org>
In-Reply-To: <4eb4ce6425a3cc96d9500ddc54eb9e34cc4df57c.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jan 2020 08:08:00 -0800
Message-ID: <CAMKF1sqv=DJP040YxKWCAYWu-4YnmuA7qSm3myuGhgReYjsmRQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] valgrind: Fix ptest builds on musl
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
X-List-Received-Date: Tue, 28 Jan 2020 16:08:13 -0000
Content-Type: multipart/alternative; boundary="00000000000056c18a059d356e77"

--00000000000056c18a059d356e77
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2020 at 2:07 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2020-01-28 at 09:09 +0100, Alexander Kanavin wrote:
> > The reason I dropped the previous version of this is that with the
> > patch the test failed, without the patch it passed. If you can
> > confirm that the new version doesn=E2=80=99t regress the test I would
> > appreciate. You can edit run-ptest prior to running it to include
> > only the test suite with this test to make it quicker.
>
> valgrind fails to build on musl without a patch:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1499
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1503
>

I have already sent a patch on top of master-next to fix this


> Cheers,
>
> Richard
>
>

--00000000000056c18a059d356e77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jan 28, 2020 at 2:07 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, 2020-=
01-28 at 09:09 +0100, Alexander Kanavin wrote:<br>
&gt; The reason I dropped the previous version of this is that with the<br>
&gt; patch the test failed, without the patch it passed. If you can<br>
&gt; confirm that the new version doesn=E2=80=99t regress the test I would<=
br>
&gt; appreciate. You can edit run-ptest prior to running it to include<br>
&gt; only the test suite with this test to make it quicker.<br>
<br>
valgrind fails to build on musl without a patch:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/64/build=
s/1499" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/64/builds/1499</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/45/build=
s/1503" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/45/builds/1503</a><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I have already s=
ent a patch on top of master-next to fix this=C2=A0</div><div dir=3D"auto">=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--00000000000056c18a059d356e77--

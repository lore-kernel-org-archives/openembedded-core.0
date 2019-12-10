Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
	[209.85.221.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5DEFD7F9A6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 11:48:25 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id y184so1903274vkc.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 03:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Zm7ztdrHMmZKor91RAp9DceaosVKlaIFo6fNrdqUXP0=;
	b=VDx/xUXQJJvaUZ6EmshUNKwkwqwsQ7WXtcRudiv3hy51J+44zAj0ttJKxg4eWyDyj+
	Mqo1qrlPlyI93+dQF4nmklqG86HU5Prxsgz0pLgjOuMvpGaOYaE1kxBIh8ymlnIvsrWq
	5nbZTQmFcx9wJhxZGNpnZYdYLnMxGctXQ9PKfc1V3VnkF9mitAqcOwKwUHFCNTGpELwJ
	FAeMbEa93uPQ5v7wHgdFbJ0AmgagrwH38UtsggECVFOn2X/dIAs1jDgkjC73+52GwLXF
	QDm27iIEkC+b9SqzgyWwGQ45OOgDvAp7uX+ejK4zje4suIORkI8jcM6REfnPAJ0vuwbv
	4YUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Zm7ztdrHMmZKor91RAp9DceaosVKlaIFo6fNrdqUXP0=;
	b=cW4ZsvYngbyi65M5fISjerTykTNMe8CeIgxIRmhQRymMAhqfw9sSsREY+Rvw9qjwHR
	StTbfR4gUSYa/R8PgvzI3m4uP6V0kd+ODQ2tDJ7w8+qWRSosvAdtLEdCg+nk+jZ9bYQA
	elMaEUswOG160GkQJOq36yV7vzzHJm4KfdCD7abjlK0RdjX/LUKMbsq2Y/m4iActXABJ
	M9Lac7PO3+VogGQiY/lDBAyN3bXGAE59dDfPfLvfrP5xfwNHD+63Q2IBi83k4WqKPlgO
	eQ408fM4vsY+F9NXkBmdgPhTIBrqjg+jbtH1ii21+HyptVHb7b4LhS/VJeAC8FN8F0QC
	qAAA==
X-Gm-Message-State: APjAAAUhRBPRQYKMPUeTWZ/DHbAHzViCIu2Nb6IRDWcVj7rGB6j/7AKj
	OBNar9R54MmsZMkQBNOzUsrBc+DHXIx42JqwS0US9hYJ
X-Google-Smtp-Source: APXvYqzEsPJXWo4muvlY8QCGFqqSiH9EKuPxZuSA1yHRr+Ee6DQaMruMIGnNvRXv1MfNV2OLxMjmehNRCr3g/iBV6DY=
X-Received: by 2002:a1f:7dcd:: with SMTP id y196mr18115744vkc.29.1575978506251;
	Tue, 10 Dec 2019 03:48:26 -0800 (PST)
MIME-Version: 1.0
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
	<20191205154357.121346-11-alex.kanavin@gmail.com>
	<cd3cd74323732762097a80f32c594f33612730a4.camel@linuxfoundation.org>
In-Reply-To: <cd3cd74323732762097a80f32c594f33612730a4.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Dec 2019 12:48:15 +0100
Message-ID: <CANNYZj9qDOzzzZv4QUc8qbGLcPM6FpToA6h=O2j=54fqFwcLGw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/24] perl: update to 5.30.1
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
X-List-Received-Date: Tue, 10 Dec 2019 11:48:25 -0000
Content-Type: multipart/alternative; boundary="00000000000009f304059958177e"

--00000000000009f304059958177e
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Dec 2019 at 00:41, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2019-12-05 at 16:43 +0100, Alexander Kanavin wrote:
> > Drop fix-setgroup.patch as the upstream has fixed the issue.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  .../perl/files/fix-setgroup.patch             | 49 ---------------
> > ----
> >  .../perl/{perl_5.30.0.bb => perl_5.30.1.bb}   | 11 ++---
> >  2 files changed, 5 insertions(+), 55 deletions(-)
> >  delete mode 100644 meta/recipes-devtools/perl/files/fix-
> > setgroup.patch
> >  rename meta/recipes-devtools/perl/{perl_5.30.0.bb => perl_5.30.1.bb}
> > (97%)
>
> I think a build race sneaked in with this upgrade:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/240
>
>   /usr/share/man/man3/TAP::Parser::SourceHandler::Executable.3
>   /usr/sinstallman: Can't open cpan/podlators/blib/script/pod2text: No
> such file or directory
> ABORTED
> hare/man/man3/TAP::Parser::SourceHandler::File.3
>   /usr/share/man/man3/TAP::Parser::SourceHandler::Handle.3
>

This is an existing issue that happens very rarely:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13244

Any chance you might be able to obtain log.do_compile from the failed build?

Alex

--00000000000009f304059958177e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 10 Dec 2019 at 00:41, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 2019-12-05 at 16:43=
 +0100, Alexander Kanavin wrote:<br>
&gt; Drop fix-setgroup.patch as the upstream has fixed the issue.<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../perl/files/fix-setgroup.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 49 ---------------<br>
&gt; ----<br>
&gt;=C2=A0 .../perl/{<a href=3D"http://perl_5.30.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">perl_5.30.0.bb</a> =3D&gt; <a href=3D"http://perl_5.30.1.b=
b" rel=3D"noreferrer" target=3D"_blank">perl_5.30.1.bb</a>}=C2=A0 =C2=A0| 1=
1 ++---<br>
&gt;=C2=A0 2 files changed, 5 insertions(+), 55 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/perl/files/fix-<br>
&gt; setgroup.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/perl/{<a href=3D"http://perl_5.30.0=
.bb" rel=3D"noreferrer" target=3D"_blank">perl_5.30.0.bb</a> =3D&gt; <a hre=
f=3D"http://perl_5.30.1.bb" rel=3D"noreferrer" target=3D"_blank">perl_5.30.=
1.bb</a>}<br>
&gt; (97%)<br>
<br>
I think a build race sneaked in with this upgrade:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/103/buil=
ds/240" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/103/builds/240</a><br>
<br>
=C2=A0 /usr/share/man/man3/TAP::Parser::SourceHandler::Executable.3<br>
=C2=A0 /usr/sinstallman: Can&#39;t open cpan/podlators/blib/script/pod2text=
: No such file or directory<br>
ABORTED<br>
hare/man/man3/TAP::Parser::SourceHandler::File.3<br>
=C2=A0 /usr/share/man/man3/TAP::Parser::SourceHandler::Handle.3<br></blockq=
uote><div><br></div><div>This is an existing issue that happens very rarely=
:</div><div><a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D=
13244">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13244</a></div><=
div><br></div><div>Any chance you might be able to obtain log.do_compile fr=
om the failed build?</div><div><br></div><div>Alex<br> </div></div></div>

--00000000000009f304059958177e--

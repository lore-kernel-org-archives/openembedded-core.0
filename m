Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id BE921773C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 13:07:43 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id k15so132628635qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 05:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WtZAMDw+qh4MRYbMZrF0vHwwdRgrMnxifDWsBNTOVIE=;
	b=e8KMCZsFWQQq4ClJGNkHmxQn8PSfY0vHMnK9UZyPWritmDjBbH+bp8E9ayhmJVdStf
	QdDd5ktuSXW2i1RffDElunEEyXQLrO2c3cIMTUF7OQlzWwM6MKK5k3dqR2psbnWFN7wF
	NkWq9QDqTNmDMsULqIjV8KOwQMk9ZFHkNwja2PjqRbTR5aIyyeOMjA+JLkeo2j33M31X
	TzEEVX3ld+NccRe16ythHQHo4Q0diqjI4jyIn0ZZLOPUbrv3ptnb7Wl4qW9K1EBM0iG0
	yd8JFZGC0gniy/ndKG8pSaQdn1sRsjXy4M8yr71b3DPeugxHH7OxsyxkEIVkvnowq7Em
	b7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WtZAMDw+qh4MRYbMZrF0vHwwdRgrMnxifDWsBNTOVIE=;
	b=ZHPn8iC3I8bBRck+5jp8GaD+urPBLKfWWYGHk7hydZOSYpBDHoOAEStMdi/+4Zc5qA
	qIuhRaXKkX2Xoyt0ObKZUwiuUwJP12xXEm0bvTF0b5Ck20qFrRQOo19Q+nQJWK+l2MPM
	sUt2GtDgb8sWBuyRmSyGzLzul2OasNuD+pvS/lNZASjKtqF7fYOR3K2H+X2/g2B3MOGk
	pm82mNj/JGQfXDlYgDLeIVaKyfjwKTBbwKSS6rAUu+/BkE0tbi5uSC2QOhjUMthY1BQM
	OUfKbPD2R5ODe8zhokipUSQ1iAwTM2gj1J+AlxBZi8M8seyyVeJFlQ7Md13hpTjiSoKj
	wRqg==
X-Gm-Message-State: AIkVDXLn7zuRzVZR/PBYPVtX9og2qaeka1fdh+XaTqG9h0XcLNQXbHu62L65hqgACRW7cjZqbG4QowJe+32N1kQo
X-Received: by 10.200.39.212 with SMTP id x20mr7384575qtx.109.1485522463898;
	Fri, 27 Jan 2017 05:07:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 27 Jan 2017 05:07:23 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1701270739140.15334@uk63952.mitel.com>
References: <alpine.LFD.2.20.1701270739140.15334@uk63952.mitel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 27 Jan 2017 13:07:23 +0000
Message-ID: <CAJTo0LbFkHqLxDZDMQMkpVbm0XLyDX=0uNqAd-sCudPcrqJGsw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what is the working directory for configure/compile/install tasks?
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
X-List-Received-Date: Fri, 27 Jan 2017 13:07:43 -0000
Content-Type: multipart/alternative; boundary=001a1135b542c4557f0547132635

--001a1135b542c4557f0547132635
Content-Type: text/plain; charset=UTF-8

On 27 January 2017 at 12:44, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>   i've been handed a simple example of Makefile-based source to turn
> into a recipe, and the configure/build process is absolutely
> straightforward -- top-level "configure" and "Makefile" files to be
> run -- to the point where i can simply define my own do_configure(),
> do_compile(), etc. tasks.
>

$ git grep \\[dirs\\] meta/classes/base.bbclass
meta/classes/base.bbclass:do_fetch[dirs] = "${DL_DIR}"
meta/classes/base.bbclass:do_unpack[dirs] = "${WORKDIR}"
meta/classes/base.bbclass:do_configure[dirs] = "${B}"
meta/classes/base.bbclass:do_compile[dirs] = "${B}"
meta/classes/base.bbclass:do_install[dirs] = "${B}"

Ross

--001a1135b542c4557f0547132635
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 January 2017 at 12:44, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D"gmail-:f0" class=3D"gma=
il-a3s gmail-aXjCH gmail-m159dff54a3cb10e4">=C2=A0 i&#39;ve been handed a s=
imple example of Makefile-based source to turn<br>
into a recipe, and the configure/build process is absolutely<br>
straightforward -- top-level &quot;configure&quot; and &quot;Makefile&quot;=
 files to be<br>
run -- to the point where i can simply define my own do_configure(),<br>
do_compile(), etc. tasks.<br></div></blockquote></div><br><div class=3D"gma=
il_extra">$ git grep \\[dirs\\] meta/classes/base.bbclass</div><div class=
=3D"gmail_extra">meta/classes/base.bbclass:do_fetch[dirs] =3D &quot;${DL_DI=
R}&quot;</div><div class=3D"gmail_extra">meta/classes/base.bbclass:do_unpac=
k[dirs] =3D &quot;${WORKDIR}&quot;</div><div class=3D"gmail_extra">meta/cla=
sses/base.bbclass:do_configure[dirs] =3D &quot;${B}&quot;</div><div class=
=3D"gmail_extra">meta/classes/base.bbclass:do_compile[dirs] =3D &quot;${B}&=
quot;</div><div class=3D"gmail_extra">meta/classes/base.bbclass:do_install[=
dirs] =3D &quot;${B}&quot;</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div></div>

--001a1135b542c4557f0547132635--

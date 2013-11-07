Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 631A16D3D5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 17:58:59 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id z5so732276lbh.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2013 09:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=hdFNYVnEttXQZ0Uj8yYQCuzeZg5fRYdQ4lii1hbmgEY=;
	b=def2G9vz/7GUu4xiEmPzAQHD5pPeaj5wQXEOLV/ZmNH51Rkfg0IIxFgBObxjFPNP4W
	MmPQJ+3skP+X6ybS+RoQvQFQiSdsQRRC8b2Z8CZ/xuwSkShxWr6XoDmUhB/BRDIv9cZs
	xPLDUS0Kx6idVZFF3rMZlcwFYbxxEU43dq57yyOakLnyGKu9fSa4n26wgCOHpJ9eDVkO
	XS1lY6SW5zovmfTy2N2SFglLHd/P026vVv19ddzC9JkOgHJLlEr8e/XsIkXVfpxqAJeg
	GMfIU9M8l3lbNZs7SzMfJCHrQSbpzbB5qss0QzVo2srw0ATXPAGUU4CNT7FUBE3LRHCC
	redw==
X-Received: by 10.112.205.34 with SMTP id ld2mr7150289lbc.27.1383847140240;
	Thu, 07 Nov 2013 09:59:00 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.53.197 with HTTP; Thu, 7 Nov 2013 09:58:40 -0800 (PST)
In-Reply-To: <CA+JN8xOQvNk_DFG+Zqk_Z6XVcaRA2MBAS9_y1emuZzAwQ24m_A@mail.gmail.com>
References: <CA+JN8xOQvNk_DFG+Zqk_Z6XVcaRA2MBAS9_y1emuZzAwQ24m_A@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 7 Nov 2013 10:58:40 -0700
X-Google-Sender-Auth: gD1kjn5HIs1c18GrqGHZoZqKVWM
Message-ID: <CABcZANnuhwobaaYnQNGwgWOcAQGrxvqZnShA0JHVtYW0K=YU7A@mail.gmail.com>
To: Seth Bollinger <seth.boll@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libxml2 python module
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
X-List-Received-Date: Thu, 07 Nov 2013 17:58:59 -0000
Content-Type: multipart/alternative; boundary=001a11c3d99a37b29304ea9a057e

--001a11c3d99a37b29304ea9a057e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2013 at 10:55 AM, Seth Bollinger <seth.boll@gmail.com> wrote=
:

> I've tried setting EXTRA_OECONF --with-python, but it doesn't appear to b=
e
> having much affect.
>
> I'm currently trying to hack together using python manually to build the
> install, but this feels like I'm moving in the wrong direction.
>
> Can anyone offer any guidance please?
>

You almost certainly need to inherit one or more of the python bbclasses
(see pythonnative, distutils*) to ensure it finds files corresponding to
our target python. I=E2=80=99d suggest checking those out, and possibly als=
o
reading the configure.{ac,in} to see just what it=E2=80=99s checking when e=
nabling
python support.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c3d99a37b29304ea9a057e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Nov 7, 2013 at 10:55 AM, Seth Bollinger <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:seth.boll@gmail.com" target=3D"_blank">seth.boll@gmail.com</a>=
&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>I&#39;ve tried setting=C2=A0EXTRA_OECON=
F --with-python, but it doesn&#39;t appear to be having much affect.</div>
<div><br></div><div>I&#39;m currently trying to hack together using python =
manually to build the install, but this feels like I&#39;m moving in the wr=
ong direction.</div><div><br></div><div>Can anyone offer any guidance pleas=
e?</div>

</blockquote></div><br>You almost certainly need to inherit one or more of =
the python bbclasses (see pythonnative, distutils*) to ensure it finds file=
s corresponding to our target python. I=E2=80=99d suggest checking those ou=
t, and possibly also reading the configure.{ac,in} to see just what it=E2=
=80=99s checking when enabling python support.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a11c3d99a37b29304ea9a057e--

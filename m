Return-Path: <kergoth@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0204060167
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 12:48:04 +0000 (UTC)
Received: by qgem68 with SMTP id m68so652609qge.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 05:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=YZSCu8+ZwUwi/TeG0MNWjkn+xP6fiqipHjHJHjeek1M=;
	b=P82IWY6Pdqaxo20xQ9lpGm52bfVzhSHuUZ7gP98mS/s40kRfeQ2FnDXk2sSzPKik4w
	SJE4OvUcvXaMvXtxd4EfL5HFlx+An+Emo0eKPbh5M6OQPW6BEyASS0ZxsQdtgXq6hEWs
	xM2Vx0ednT0ebqfqmHfH79lDvqLMeG4cNchtHvkP4NZu5op/p3E96GV8XpWHVZEMU0yJ
	QfYcvGur1g3b9/Gd+K/3WBOZ5oP2QnkJ0lpfPZ6HCCZgbfYs3qYSuUiL0lEDmqNcih+T
	fF21w1/J0tQpzj9eCA/rQ4m+AuTaeNzA3cXdZTzoGfUaoH+Kh7D2CqUbUS1LW0erLS4H
	IrFg==
X-Received: by 10.55.23.215 with SMTP id 84mr3055236qkx.102.1435322885155;
	Fri, 26 Jun 2015 05:48:05 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.73 with HTTP; Fri, 26 Jun 2015 05:47:45 -0700 (PDT)
In-Reply-To: <7eaec2a8209ca34e5d8b247f31935af496134aea.1435299778.git.liezhi.yang@windriver.com>
References: <cover.1435299778.git.liezhi.yang@windriver.com>
	<7eaec2a8209ca34e5d8b247f31935af496134aea.1435299778.git.liezhi.yang@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 26 Jun 2015 05:47:45 -0700
X-Google-Sender-Auth: ICjwHdlbp9P6q2AwXoNosAxXD_4
Message-ID: <CABcZANkDvPZcDHFEWauiZd8PFgipLbfsNTSZ3NUHcQwwF61eaQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sanity.bbclass: check /bin/sh is dash or bash
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
X-List-Received-Date: Fri, 26 Jun 2015 12:48:07 -0000
Content-Type: multipart/alternative; boundary=001a1147a6f6b532cd05196b264f

--001a1147a6f6b532cd05196b264f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2015 at 11:23 PM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> The build would fail when /bin/sh links to ksh or csh, we only test dash
> and bash AFAIK.
>

Hmm, would this break self-hosted builds, as you don=E2=80=99t check for bu=
sybox,
or am I missing something? Not that I=E2=80=99ve ever done a build like tha=
t, other
than using the old build appliance, and I don=E2=80=99t know much about how=
 that
was built, but maybe someone else knows better than I :)
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1147a6f6b532cd05196b264f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jun 25, 2015 at 11:23 PM, Robert Yang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
2dw" class=3D"a3s" style=3D"overflow:hidden">The build would fail when /bin=
/sh links to ksh or csh, we only test dash<br>
and bash AFAIK.</div></blockquote></div><br>Hmm, would this break self-host=
ed builds, as you don=E2=80=99t check for busybox, or am I missing somethin=
g? Not that I=E2=80=99ve ever done a build like that, other than using the =
old build appliance, and I don=E2=80=99t know much about how that was built=
, but maybe someone else knows better than I :)<br>-- <br><div class=3D"gma=
il_signature">Christopher Larson<br>clarson at kergoth dot com<br>Founder -=
 BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software=
 Engineer, Mentor Graphics</div>
</div></div>

--001a1147a6f6b532cd05196b264f--

Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 41D8C601A5
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Dec 2015 15:53:36 +0000 (UTC)
Received: by ioir85 with SMTP id r85so159608689ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Dec 2015 07:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=qNREt0p3UutolznVjKy83EpJuE3qXQqt55gb1iF1rEI=;
	b=zWB9LbJiYipkqd70QBgrltv9JPMPCe5b4vnKfEycN9JRZ2yKfUlrz0hlmyZz8+qBYw
	0DKKE+Tf5TqxbfBKPtVSBKgJxE+XNpjbCZVOci7sqelN432BfYY6OdcmrkAGLJ4BfbFI
	vvqieuy+u9Fm95XZIMFMbiY01cmxqeUZxMZ1fjlZ6V51TnGytZna1Y+XsZwIWXPCBZnG
	z1qbqtcrpISn45a+Ex82vIWq0axRBdp5t2VueoSUbwvOlhOKy6HrQg6t6G7Sb0HHMjn9
	H/1Yv6O+KO4txcBZjB/iJNJ2wEe7aNjnBlB0GhmHxPcmW+SJrc9qtbGFHqK8NSOsU8E+
	tqZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=qNREt0p3UutolznVjKy83EpJuE3qXQqt55gb1iF1rEI=;
	b=bLOlYkwSOvx6bpA305FjgR2mP52y4sUwcLzZrUXC3LccZeb0l5FsIk5zZDn2NmikqG
	o2ssN2SFSou3OAMmkWafgfS7/FU8+k5jkhJOtyMMYhpA4XXjF3MtkqUBFQ/ArMQTYLm3
	88wFd0SqoWDrxAJdLPopyD00phfINAFqceWePVzlxbqk+rPT+qPcaZmKRPTGtIpepczj
	SHpXRy+uWMKTLw1eH+Cmb7gJjmwLfK9A1Fjk3VeyKhTDrXnVWUnKPJom/1IMlbI961Li
	HHRKknkI1n8jcSuB5GAN7pnY/vQZW13MK81hza/3nmYi2FVUkQy0cYFMfNRqDp/qBwfI
	w9qg==
X-Received: by 10.107.134.28 with SMTP id i28mr21908557iod.74.1449417217390;
	Sun, 06 Dec 2015 07:53:37 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.69.129 with HTTP; Sun, 6 Dec 2015 07:53:17 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1512060812150.19723@localhost>
References: <alpine.LFD.2.20.1512060812150.19723@localhost>
From: Christopher Larson <clarson@kergoth.com>
Date: Sun, 6 Dec 2015 08:53:17 -0700
X-Google-Sender-Auth: jW3baNLmUT1-E295kymDx8Li5pQ
Message-ID: <CABcZAN=nufN_K2C9n_-TeHTuvDbq9YdmvADLtO0YAwftgYJAyw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: why would a BBFILES variable refer to a "classes" directory?
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
X-List-Received-Date: Sun, 06 Dec 2015 15:53:37 -0000
Content-Type: multipart/alternative; boundary=001a113ecc0a5fc1cf05263cbe2c

--001a113ecc0a5fc1cf05263cbe2c
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 6, 2015 at 6:16 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>   possibly a stupid question, but i'm looking at a publicly available
> OE layer and, in layer.conf, there is a setting for BBFILES that pulls
> in a number of subdirectories and ends with:
>
>         ... snip ...
>         ${LAYERDIR}/recipes-*/*/*.bbappend \
>         ${LAYERDIR}/classes/*.bbclass"
>
>   i am unfamiliar with BBFILES used to include references to a classes
> directory, and that layer.conf file already includes the earlier line:
>
>   BBPATH := "${LAYERDIR}:${BBPATH}"
>
>   can someone explain what BBFILES has to do with defining additional
> classes in a layer? thanks muchly.
>

Nothing. It's not accomplishing anything.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113ecc0a5fc1cf05263cbe2c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sun, Dec 6, 2015 at 6:16 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.c=
a</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":kt" c=
lass=3D"a3s" style=3D"overflow:hidden">=C2=A0 possibly a stupid question, b=
ut i&#39;m looking at a publicly available<br>
OE layer and, in layer.conf, there is a setting for BBFILES that pulls<br>
in a number of subdirectories and ends with:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ... snip ...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${LAYERDIR}/recipes-*/*/*.bbappend \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${LAYERDIR}/classes/*.bbclass&quot;<br>
<br>
=C2=A0 i am unfamiliar with BBFILES used to include references to a classes=
<br>
directory, and that layer.conf file already includes the earlier line:<br>
<br>
=C2=A0 BBPATH :=3D &quot;${LAYERDIR}:${BBPATH}&quot;<br>
<br>
=C2=A0 can someone explain what BBFILES has to do with defining additional<=
br>
classes in a layer? thanks muchly.</div></blockquote></div><br>Nothing. It&=
#39;s not accomplishing anything.<br>-- <br><div class=3D"gmail_signature">=
Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, Open=
Embedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Men=
tor Graphics</div>
</div></div>

--001a113ecc0a5fc1cf05263cbe2c--

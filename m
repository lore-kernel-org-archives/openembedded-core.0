Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6BD9C74007
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 17:05:02 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id n21so21633886qta.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 09:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Vd42FD5Ry6ldXj/wQNNyyf8m+p4NsnNiS/l2XZezYwE=;
	b=w6z4dQFBIxq96tyawYCcvkAeFl4Eh5sITtJcFysqCnT9sJgNMVrgwOv7MICVQcxJ4P
	tzEe5pnk/yOkOHIOkgL6YvOPubddzQ3htHf0soN3s0ERagZKMtLxaPJrYZwl7RhDMREv
	R9BcUz22hYfX2dNz5NY4f2HTqNa6on5OxrJJJekzUfC8RbcWwpwHwVUAV4neSaUYNXgK
	Nd1xmz6zEhB4+/hZJ9CSjU7ueP9xw53tjS/7WP5kWq0yD30Sa9TLlP7vPn8utqbklFRg
	+XAPTThS9dDwImc42qKOYKbh6A3EBHvK4N21UZMNEELNOHzS2NIXXxHMINFd2aM0cQVs
	41FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Vd42FD5Ry6ldXj/wQNNyyf8m+p4NsnNiS/l2XZezYwE=;
	b=amDGBKmh3MEgdMakxHhId91b3COtXu3o3Ugrbo5bE1Zkc8AGweX2E5iOMRcb4BQ76p
	GXMs9IUn2DEjaGrjrx+XONyznrXdvtldklln16EK7dpY5qfLIICb4/pucU/84h84UNZJ
	zAkEVcRKdn7Wi88yssbZV8DWEbTT9yjuWenUAhfWk9MnyVzmZJZhywJrCpqTChfr4lNC
	iPYhlHVH3bPR8iIa8a2LOq3c2ptcPaiMjDeMXcBeXLXY4I3oEFWdR/oYv1C7s1Ed0rAZ
	Xe5QEp4a1cwLHPO9UH922ZdBQaiYd+mS+OEkUg9kqhlF0zgIOVg9RdkUsVDbbWxoNQWW
	M72A==
X-Gm-Message-State: AMke39mveOSj+1U8cM/Zi2oJMVLHTLWH1rkk4xsE3a69qTKzb1w9b6iBw4Hald3kjJH+fhKkIOOqHKzDmhp81rof
X-Received: by 10.237.53.9 with SMTP id a9mr3441333qte.188.1487955904228; Fri,
	24 Feb 2017 09:05:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 24 Feb 2017 09:04:43 -0800 (PST)
In-Reply-To: <1487952031-3996-1-git-send-email-ankit.tarot@gmail.com>
References: <1487952031-3996-1-git-send-email-ankit.tarot@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Feb 2017 17:04:43 +0000
Message-ID: <CAJTo0LY-i8JJNEoN=43F5GaNU390g2x-BPJkihYXv=Fogmg2Ow@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ell: Initial recipe for Embedded Linux Library
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
X-List-Received-Date: Fri, 24 Feb 2017 17:05:03 -0000
Content-Type: multipart/alternative; boundary=001a11c0285e1d469d054949bb98

--001a11c0285e1d469d054949bb98
Content-Type: text/plain; charset=UTF-8

On 24 February 2017 at 16:00, Ankit Navik <ankit.tarot@gmail.com> wrote:

>  meta/recipes-core/ell/ell.inc    | 10 ++++++++++
>  meta/recipes-core/ell/ell_git.bb |  9 +++++++++
>

Unless you have other recipes using the .inc file, then just merge these
into a single .bb.


> +DEPENDS  = "dbus"
> +RDEPENDS_${PN} += "dbus"
>

Why the RDEPENDS?  Any linking will add libdbus as required.


> +do_configure_prepend () {
> +    ${S}/bootstrap
> +}
>

This just does a mkdir and then calls autoreconf which we do straight away
afterwards, so is mostly a waste of time.  If we need to create the
directory before autoreconf then just do the mkdir in _prepend.

However currently this isn't used by anything in oe-core, so what's the
rationale for adding it to oe-core instead of another layer?

Ross

--001a11c0285e1d469d054949bb98
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 24 February 2017 at 16:00, Ankit Navik <span dir=3D"ltr=
">&lt;<a href=3D"mailto:ankit.tarot@gmail.com" target=3D"_blank">ankit.taro=
t@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex">=C2=A0meta/recipes-core/ell/ell.inc=C2=A0=
 =C2=A0 | 10 ++++++++++<br>
=C2=A0meta/recipes-core/ell/<a href=3D"http://ell_git.bb" rel=3D"noreferrer=
" target=3D"_blank">ell_git.<wbr>bb</a> |=C2=A0 9 +++++++++<br></blockquote=
><div><br></div><div>Unless you have other recipes using the .inc file, the=
n just merge these into a single .bb.</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;=
border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex=
">+DEPENDS=C2=A0 =3D &quot;dbus&quot;<br>
+RDEPENDS_${PN} +=3D &quot;dbus&quot;<br></blockquote><div><br></div><div>W=
hy the RDEPENDS?=C2=A0 Any linking will add libdbus as required.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-s=
tyle:solid;padding-left:1ex">+do_configure_prepend () {<br>
+=C2=A0 =C2=A0 ${S}/bootstrap<br>
+}<br></blockquote><div><br></div><div class=3D"gmail_extra">This just does=
 a mkdir and then calls autoreconf which we do straight away afterwards, so=
 is mostly a waste of time.=C2=A0 If we need to create the directory before=
 autoreconf then just do the mkdir in _prepend.</div><div><br></div><div>Ho=
wever currently this isn&#39;t used by anything in oe-core, so what&#39;s t=
he rationale for adding it to oe-core instead of another layer?</div><div><=
br></div><div>Ross=C2=A0</div></div></div></div>

--001a11c0285e1d469d054949bb98--

Return-Path: <kergoth@gmail.com>
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
	[209.85.210.49])
	by mail.openembedded.org (Postfix) with ESMTP id AAE9A7C753
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 01:21:23 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id 32so25574268ota.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 17:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HlkYURV+pfcli2cNlL90nsW62PD9+PuAAVDIMoTzyO0=;
	b=CHx2lnQG2ffsuR7caJJMAGwb1ONKNS1E2dxA7bhVIUOlUSyB3SK3H7O4gakqA9tWJL
	7EJOsYcbM7ZCa89PKxdHdhksK0Ya4N83Ndn6tiIIt+FNSkNxsgxKXjEnv6dyc7fbJ4Wt
	EtgMI5vqibhjsVy6dRgdqEINpxuXff/S8adbCSebJmvVEj6Euhv6QX1+Ab7yP4bZN6aY
	DEdhRGN9Q6wLB5CIZ0OtNfojSQU5p4RBEyzlWiUXuq0Eb/4YiM/UbcPRbWVU+HCcCGUk
	yUGrrbk/2fYu6f1KKHKueRh0lrmmhnJ5xqXAwJehNO/9YzH6keYbSR3ueMUIgcfHt+73
	lAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HlkYURV+pfcli2cNlL90nsW62PD9+PuAAVDIMoTzyO0=;
	b=L1fsJTPZxFnRFY8Li2fclR+gwKEpEpPY4lUmknuUp0+xAS5NpgmxP7cwA37hI/vAcH
	QGb00OqTFzWRbO1Dk1BGPsk2LT5WyYW613uAztNzt9FXPEV2N1y5KS/36CQd6DUNe+Yd
	ngxeELBFpdIvwIScdE72JuMTjebH2MtmHS3S/I9IWstQ6l8Rbn/h3kFmxeqTyju2EWAh
	C4x2Vte71iKfkwEBsmJiMHyPE5DApZPB2oXKJM0jg+XuPZUNVehODhnNnEtHXajpQfuv
	/0IAu3K6Y+TYHMK6SSPhnnbdMWVVDi95tEVeSf4PCDnVHUJqV7HbD6GeaxTwqTx7zzp9
	QZ1g==
X-Gm-Message-State: AHQUAuYcjx6jR5SVHc4NLk8fmKNoRuyAbkHsP0r9SPnghaJAth5rxMH0
	6vgL43/K23d/9l6ScftZdYGXBWdqGyisFVd7dvfRTUbZ
X-Google-Smtp-Source: AHgI3IbsYvfNpVd16HcpPmFT0WPsKxDWS7//nQG+UDNgZVdq5cTXdEzHZJFAeAJY8F9MS6I8usxVjBJ9H2fitBsNlJk=
X-Received: by 2002:a9d:66f:: with SMTP id 102mr13555943otn.293.1550452884424; 
	Sun, 17 Feb 2019 17:21:24 -0800 (PST)
MIME-Version: 1.0
References: <20190217145107.2796-1-pkj@axis.com>
	<20190217145107.2796-3-pkj@axis.com>
In-Reply-To: <20190217145107.2796-3-pkj@axis.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Sun, 17 Feb 2019 18:21:13 -0700
Message-ID: <CABcZANkrFaJ8SMDBHND-=TfBtxyq59K1d1g9vjkizSVUiSfHcg@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libc-package.bbclass: Add a progress meter for the package task
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
X-List-Received-Date: Mon, 18 Feb 2019 01:21:23 -0000
Content-Type: multipart/alternative; boundary="0000000000006acd7d058220f142"

--0000000000006acd7d058220f142
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 17, 2019 at 7:51 AM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> The package task for glibc-locale takes a very long time to execute,
> especially if using qemu. In that case, a progress meter helps a lot to
> show the progress of the task.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/classes/libc-package.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/classes/libc-package.bbclass
> b/meta/classes/libc-package.bbclass
> index ee598905b0..f1c0545c67 100644
> --- a/meta/classes/libc-package.bbclass
> +++ b/meta/classes/libc-package.bbclass
> @@ -348,11 +348,16 @@ python package_do_split_gconvs () {
>          makefile = oe.path.join(d.getVar("WORKDIR"), "locale-tree",
> "Makefile")
>          m = open(makefile, "w")
>          m.write("all: %s\n\n" % " ".join(commands.keys()))
> +        i = 1
> +        total = len(commands)
>          for cmd in commands:
>

for i, cmd in enumerate(commands):
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--0000000000006acd7d058220f142
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 17, 2019 at 7:51 AM Peter=
 Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjel=
lerstedt@axis.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;border-left-color:rgb(204,204,204);padding-left:1ex">The package task=
 for glibc-locale takes a very long time to execute,<br>
especially if using qemu. In that case, a progress meter helps a lot to<br>
show the progress of the task.<br>
<br>
Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@=
axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/libc-package.bbclass | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.=
bbclass<br>
index ee598905b0..f1c0545c67 100644<br>
--- a/meta/classes/libc-package.bbclass<br>
+++ b/meta/classes/libc-package.bbclass<br>
@@ -348,11 +348,16 @@ python package_do_split_gconvs () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0makefile =3D oe.path.join(d.getVar(&quot;=
WORKDIR&quot;), &quot;locale-tree&quot;, &quot;Makefile&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m =3D open(makefile, &quot;w&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m.write(&quot;all: %s\n\n&quot; % &quot; =
&quot;.join(commands.keys()))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 total =3D len(commands)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for cmd in commands:<br></blockquote><div=
><br></div><div>for i, cmd in enumerate(commands):</div></div>-- <br><div d=
ir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"=
>Christopher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenE=
mbedded, OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div=
></div></div></div>

--0000000000006acd7d058220f142--

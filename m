Return-Path: <kergoth@gmail.com>
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
	[209.85.167.182])
	by mail.openembedded.org (Postfix) with ESMTP id C96F86B6AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2018 15:51:06 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id a77so15377011oii.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2018 07:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=btfnBvdoXs/WrhE/+vcc1CUueg4GKWMiTPcSg5WCbN4=;
	b=Lqz1WnuSrVqEGg71Q/Z3/yYNHlN0D1qSlBCLTH0lUY8dCpgjHV1YJbHB0ZqAKd45Fl
	nlF07VqXaosQVjitnO7f89KCt98fyY4eU1C8XJ+d0iO9o/v6bqhPj/7M51SWjqH/pFGx
	6tkzud8n/+1a7IUmvBQlIX2/4d8HYjr1TgMA3Y5l/csgnUaEQewUoaTKEazWe3NSNM4c
	ZH+Ax8URVbVCs8f3QFofITRfSGVzeTP7a+XgemN6vbrUznn0Ejwr2sygzDH9eSQyPO2j
	UhovEL1ml4eq30u5qO4qfNlrqzYvDA49cUKqhKQ1e3TDrS7PlaMJ5DrRZgJXApChQmpV
	HA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=btfnBvdoXs/WrhE/+vcc1CUueg4GKWMiTPcSg5WCbN4=;
	b=WAtAYicyELyD9PSpLWVrY2p3cbAP78EB/cZfudHadQWT/hFk8eo5nyWQa6fFOyPt7Z
	/BUHPZPFzqblvEFcts82VbnrhP6/RjbowiiCWiKuc8dE77qrhG1AoAMAdj2tmyd3kqGz
	/+vlcqRNRfEwxUktL38DjG6zXFnq8h3Na38p/OQfmEPp19HTNMIQfW4oYRHic9KZxTaY
	LjJHinXwYY6RDB4BetovUfqb/W8amQd0coPxaVIOze54sAVPLfBa7QueggbA+9PDT1h5
	ETiasvBnw8lepFw72pfXYNOI/2eP8/g1uk+5KKKj8RW8wVp+RgVrqRXuhGJ3MigLlv86
	7cZw==
X-Gm-Message-State: AA+aEWZ8BnLwiACjaecOu5fLUPX0ndHzM8BsQhJR3jissJYLHyrehLaq
	14uBsXw9ly7Irl/baii6Wxa7/KJiuROWubWmZ7g=
X-Google-Smtp-Source: AFSGD/VcTgCl7qZhdzHiieGt3fn/YGtrli7bpgKdd/LBMDxHaM70Or8jB50659/kpGXQkt0LrfsFuUEIG4jdYZW8nkk=
X-Received: by 2002:aca:e401:: with SMTP id b1mr655971oih.231.1544629867665;
	Wed, 12 Dec 2018 07:51:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1544597612.git.liezhi.yang@windriver.com>
	<3623f754f6cd91a1721933eed0c5a50ffbdfe14b.1544597612.git.liezhi.yang@windriver.com>
In-Reply-To: <3623f754f6cd91a1721933eed0c5a50ffbdfe14b.1544597612.git.liezhi.yang@windriver.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 12 Dec 2018 08:50:56 -0700
Message-ID: <CABcZANnV4LG0aLwEvvyVz4qEWONZC5_UfixBiThBrQdmJhOzQA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] base.bbclass: Add comments for gcc links to ccache
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
X-List-Received-Date: Wed, 12 Dec 2018 15:51:07 -0000
Content-Type: multipart/alternative; boundary="000000000000925f7b057cd52af1"

--000000000000925f7b057cd52af1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This should probably remove the dirname srctool from path and check again
with the same direction, rather than reversing it, in case the toolchain is
in multiple locations in PATH, as  you=E2=80=99re flipping the PATH priorit=
y order
doing it this way. I realize you=E2=80=99re just updating the description, =
not the
code, so just a random th ought for the future here..

On Tue, Dec 11, 2018 at 11:44 PM Robert Yang <liezhi.yang@windriver.com>
wrote:

> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/base.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index e715ffa..e6af673 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -122,6 +122,10 @@ def setup_hosttools_dir(dest, toolsvar, d,
> fatal=3DTrue):
>          desttool =3D os.path.join(dest, tool)
>          if not os.path.exists(desttool):
>              srctool =3D bb.utils.which(path, tool, executable=3DTrue)
> +            # gcc/g++ may link to ccache on some hosts, e.g.,
> +            # /usr/local/bin/ccache/gcc -> /usr/bin/ccache, then
> which(gcc)
> +            # would return /usr/local/bin/ccache/gcc, but what we need i=
s
> +            # /usr/bin/gcc, this code can check and fix that.
>              if "ccache" in srctool:
>                  srctool =3D bb.utils.which(path, tool, executable=3DTrue=
,
> direction=3D1)
>              if srctool:
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000925f7b057cd52af1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This should probably remove the dirname srctool from path =
and check again with the same direction, rather than reversing it, in case =
the toolchain is in multiple locations in PATH, as =C2=A0you=E2=80=99re fli=
pping the PATH priority order doing it this way. I realize you=E2=80=99re j=
ust updating the description, not the code, so just a random th ought for t=
he future here..</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tu=
e, Dec 11, 2018 at 11:44 PM Robert Yang &lt;<a href=3D"mailto:liezhi.yang@w=
indriver.com">liezhi.yang@windriver.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left=
:1ex">Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windrive=
r.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/base.bbclass | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass<br>
index e715ffa..e6af673 100644<br>
--- a/meta/classes/base.bbclass<br>
+++ b/meta/classes/base.bbclass<br>
@@ -122,6 +122,10 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=3DTru=
e):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desttool =3D os.path.join(dest, tool)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.path.exists(desttool):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srctool =3D bb.utils.which(=
path, tool, executable=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # gcc/g++ may link to ccache on =
some hosts, e.g.,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # /usr/local/bin/ccache/gcc -&gt=
; /usr/bin/ccache, then which(gcc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # would return /usr/local/bin/cc=
ache/gcc, but what we need is<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # /usr/bin/gcc, this code can ch=
eck and fix that.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &quot;ccache&quot; in sr=
ctool:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srctool =3D b=
b.utils.which(path, tool, executable=3DTrue, direction=3D1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if srctool:<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christoph=
er Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, O=
penZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></d=
iv>

--000000000000925f7b057cd52af1--

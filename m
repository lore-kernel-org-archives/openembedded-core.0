Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id DFAF66080C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 05:38:37 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id m9so9115158vso.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Mar 2020 22:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wdZRQZPFlkQPMQNTZvWsoIC73xyhAlyM6DCQNS6KXI8=;
	b=RAJfrPhGs6Fn0G6Kr1zSRDx/FSPIImXeZ83ZESAgpaPV/4AHVLYgCuZW8ZOuqbgWLO
	DejfM1/j5ADLpEN1Mit7qwwPgsFjGNaeGv+wMkla0xTc7ekPhb8mKG+eLWcP3NCI9/2a
	G2vrg2rsfH7/fBotauAW3N27msVig6XWvstlJhOLG0jq573HKM/d4lj3yRu5VzvpboFG
	6E2q2Ud/xrjCsfVJYSSei4GFhP3wtwZK0Ue/C32jUXhI5RWNB/4YdRAxqD/GyEQwYpM+
	XqW90ievyiei2ntQ/wSAQHXjVOCuM3BQjto1YYvCowZukRZK8gjEjAHvEVCMGMNfELDJ
	7W9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wdZRQZPFlkQPMQNTZvWsoIC73xyhAlyM6DCQNS6KXI8=;
	b=VVjtC1TtkHfBY+EkS9mLANfNpwTE0w6WOn6hO1F8pYTcFCmOlmFDSo6w6VbaGQJ5Ws
	8hht1htRw48ylfEsbJDk9QUfGxMwyGtZajY2qfYG/t6r4LSBCDP+BS1jmUa3o19FkWbk
	EekNzALVdz7I0sI2Q8CQZv/vk3BgRl9jCuybLZO3RZWaWVO5+Y7+fD88Z8tR8t50QTb0
	KURnJWOBQX43xmh3vFgI3Zx6oV5RRv3g1U6UOrJAPtHtCHa1+q2ECM17k3uvXEXSJcpB
	Mi6HbxPtWpY/I5DzJ1tNeEt15Z2wMefoQHi941aTU6WQi7FloOd52BstR9PGaokmrLLy
	QRKg==
X-Gm-Message-State: ANhLgQ2+/QWyJATs4kAOw/uc671HbItLJTBqpNEbCX8QKQAheWhVpvnL
	mPdzBuxLUWBB2uVxELLjc96XMmdiSyRxqv2E01I=
X-Google-Smtp-Source: ADFU+vv1r1APgbC2cUjXwHXxGOPO/ELFMmRMwAjEAX7B77gcIoQonGzwGD+UUdclq6jpubzVf+PYQQJd6IgJf+vs/PI=
X-Received: by 2002:a67:d03:: with SMTP id 3mr12777463vsn.35.1584250718358;
	Sat, 14 Mar 2020 22:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200315042947.3257882-1-raj.khem@gmail.com>
In-Reply-To: <20200315042947.3257882-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 15 Mar 2020 06:38:27 +0100
Message-ID: <CANNYZj98XmAvvu5PTmUKyFyGU5+f4XDo7J6=cHFEr2u3Ge5T1A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bison: Reset load average settings if specified in environment
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
X-List-Received-Date: Sun, 15 Mar 2020 05:38:38 -0000
Content-Type: multipart/alternative; boundary="0000000000004d8e8c05a0de1d76"

--0000000000004d8e8c05a0de1d76
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Shouldn=E2=80=99t the race be fixed? This might still happen because -j sti=
ll
parallelises the build,no?

Alex

On Sun 15. Mar 2020 at 5.30, Khem Raj <raj.khem@gmail.com> wrote:

> In some cases, we run into parallel build failures where BUILT_SOURCES
> is skipped, as a result required header files are not generated and the
> build fails with missing header errors like
>
> ../bison-3.5.2/lib/uniwidth/width.c:21:10: fatal error: uniwidth.h: No
> such file or directory
>  #include "uniwidth.h"
>           ^~~~~~~~~~~~
> compilation terminated.
>
> BUILT_SOURCES should be built automatically with `make all` [1] therefore
> ensure that make is invoked with `all` target
>
> bison-native parallel build fails when -l<n> is passed globally from
> build environment, errors like below due to race starts to show up
>
> Therefore removes a previous load limit if set
>
> [1]
> https://www.gnu.org/software/automake/manual/html_node/Built-Sources-Exam=
ple.html#Built-Sources-Example
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/bison/bison_3.5.3.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/recipes-devtools/bison/bison_3.5.3.bb
> b/meta/recipes-devtools/bison/bison_3.5.3.bb
> index 09e4b18f9e..27e09434f8 100644
> --- a/meta/recipes-devtools/bison/bison_3.5.3.bb
> +++ b/meta/recipes-devtools/bison/bison_3.5.3.bb
> @@ -18,6 +18,12 @@ SRC_URI[sha256sum] =3D
> "2bf85b5f88a5f2fa8069aed2a2dfc3a9f8d15a97e59c713e3906e5fdd9
>  # No point in hardcoding path to m4, just use PATH
>  EXTRA_OECONF +=3D "M4=3Dm4"
>
> +# Reset any loadavg set via environment, it breaks parallel build
> +# | ../bison-3.5.2/lib/uniwidth/width.c:21:10: fatal error: uniwidth.h:
> No such file or directory
> +# |  #include "uniwidth.h"
> +# |           ^~~~~~~~~~~~
> +EXTRA_OEMAKE_append =3D " -l"
> +
>  inherit autotools gettext texinfo
>
>  # The automatic m4 path detection gets confused, so force the right valu=
e
> --
> 2.25.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000004d8e8c05a0de1d76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Shouldn=E2=80=99t the race be fixed? This might stil=
l happen because -j still parallelises the build,no?</div></div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun 15. Mar 2020 at 5.30, Kh=
em Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">In some cases, we run into =
parallel build failures where BUILT_SOURCES<br>
is skipped, as a result required header files are not generated and the<br>
build fails with missing header errors like<br>
<br>
../bison-3.5.2/lib/uniwidth/width.c:21:10: fatal error: uniwidth.h: No such=
 file or directory<br>
=C2=A0#include &quot;uniwidth.h&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~<br>
compilation terminated.<br>
<br>
BUILT_SOURCES should be built automatically with `make all` [1] therefore<b=
r>
ensure that make is invoked with `all` target<br>
<br>
bison-native parallel build fails when -l&lt;n&gt; is passed globally from<=
br>
build environment, errors like below due to race starts to show up<br>
<br>
Therefore removes a previous load limit if set<br>
<br>
[1] <a href=3D"https://www.gnu.org/software/automake/manual/html_node/Built=
-Sources-Example.html#Built-Sources-Example" rel=3D"noreferrer" target=3D"_=
blank">https://www.gnu.org/software/automake/manual/html_node/Built-Sources=
-Example.html#Built-Sources-Example</a><br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/bison/<a href=3D"http://bison_3.5.3.bb" rel=3D"=
noreferrer" target=3D"_blank">bison_3.5.3.bb</a> | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/bison/<a href=3D"http://bison_3.5.3.bb" =
rel=3D"noreferrer" target=3D"_blank">bison_3.5.3.bb</a> b/meta/recipes-devt=
ools/bison/<a href=3D"http://bison_3.5.3.bb" rel=3D"noreferrer" target=3D"_=
blank">bison_3.5.3.bb</a><br>
index 09e4b18f9e..27e09434f8 100644<br>
--- a/meta/recipes-devtools/bison/<a href=3D"http://bison_3.5.3.bb" rel=3D"=
noreferrer" target=3D"_blank">bison_3.5.3.bb</a><br>
+++ b/meta/recipes-devtools/bison/<a href=3D"http://bison_3.5.3.bb" rel=3D"=
noreferrer" target=3D"_blank">bison_3.5.3.bb</a><br>
@@ -18,6 +18,12 @@ SRC_URI[sha256sum] =3D &quot;2bf85b5f88a5f2fa8069aed2a2d=
fc3a9f8d15a97e59c713e3906e5fdd9<br>
=C2=A0# No point in hardcoding path to m4, just use PATH<br>
=C2=A0EXTRA_OECONF +=3D &quot;M4=3Dm4&quot;<br>
<br>
+# Reset any loadavg set via environment, it breaks parallel build<br>
+# | ../bison-3.5.2/lib/uniwidth/width.c:21:10: fatal error: uniwidth.h: No=
 such file or directory<br>
+# |=C2=A0 #include &quot;uniwidth.h&quot;<br>
+# |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~<br>
+EXTRA_OEMAKE_append =3D &quot; -l&quot;<br>
+<br>
=C2=A0inherit autotools gettext texinfo<br>
<br>
=C2=A0# The automatic m4 path detection gets confused, so force the right v=
alue<br>
-- <br>
2.25.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000004d8e8c05a0de1d76--

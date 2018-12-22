Return-Path: <jacob.kroon@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id DFA2079D74
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 10:12:01 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id p197so10067391itp.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 02:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tFGbM+O0pidigupUrQVEummaNwcgVxFgB6KrHUuupPA=;
	b=NgAdsnKwutUggHr6kJyl4KzUNWsrgoDPi0HnMgT7IbPjWFt/Ex0YVqJrWzT676hV3j
	LQmu20dM2yMEiMxhaqSo9rvLwysO/9UvGVkgjS5W7gmk92XgJTwXfhIRBVMe0FVtpDb8
	crJDkQliOdnHb9dM0phZovIy2s+/2ar0WvZA0byJ91CRhMkRyVWkE0sfHuBaOOLnzZya
	KpUKRvKA148Ai+u/z90QL2cEv6UdDUq9Lqdnqy3lAG6YIQflycBtK7XFIRyHRixH8XA5
	P5vbn5qAQVqMHAKNmsbqrlzH6Vv8JwYUQ4Z/MCtFyw2sRqsOOQSgXUAsdopY/zCXC918
	mFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tFGbM+O0pidigupUrQVEummaNwcgVxFgB6KrHUuupPA=;
	b=s7xf8yUFcQvqpnRuu6MpE3TObEwFlJdj17yG92eE4pka0mOoyKQkzDvyXFCBA0gmRA
	DnLTAIddd3FIsz7q8Ph7pXKdTFnPaJTTfBRj+N6FcEng8AfkfiJgN2Yykih5HarvWE2B
	xxN5BhDv79LchLlAL5kq/UuvX3uettSSyvucQ/DVweodT1EXFkPUj338Qzbrawz7yrC7
	1Smq9//wHoJczhpv36RSiNOrk3V405I4jVtlEJur4AIvFOMRIwzOECxAAVpTWFuSayHx
	T5ikwHw60D9w8m5qVs9InraJumEJ180EXer2x/lpAC2N+swRLGTxIzuTqyQpfKNwl/Ic
	bCTg==
X-Gm-Message-State: AJcUukdXYZwhOaDTEm2KB8JYMHeB0+AtJfINjqRyR04KXqWOQ90SOP3c
	avU0DlPGiMVUzZYf0ptVxIFwey595sht7JZq6Pg=
X-Google-Smtp-Source: ALg8bN7nM+F0HNEMOkm/tsPnYso6Xt4cwWDjnt1r/t2DHGIzXLsCTcyQ8MMa5zVwOAQXeYlAi9IaJpjc6fP167csbSs=
X-Received: by 2002:a24:214a:: with SMTP id e71mr1738210ita.60.1545473522787; 
	Sat, 22 Dec 2018 02:12:02 -0800 (PST)
MIME-Version: 1.0
References: <1545432031-27272-1-git-send-email-rbilovol@cisco.com>
In-Reply-To: <1545432031-27272-1-git-send-email-rbilovol@cisco.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Date: Sat, 22 Dec 2018 11:11:50 +0100
Message-ID: <CAPbeDCnMvWPHJ7q3yD65P0YeT5LU8=YkZkyp+HpOpYEjJSoufg@mail.gmail.com>
To: Ruslan Bilovol <rbilovol@cisco.com>
Cc: xe-linux-external@cisco.com,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdbm: depend on readline
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
X-List-Received-Date: Sat, 22 Dec 2018 10:12:02 -0000
Content-Type: multipart/alternative; boundary="00000000000055ebf0057d999880"

--00000000000055ebf0057d999880
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Dec 2018, 23:40 Ruslan Bilovol via Openembedded-core <
openembedded-core@lists.openembedded.org wrote:

> This package depends on readline recipe.
> In traditional OE build readline is a dependency
> of python3 and few other packages, thus at the time
> of gdbm build it is available.
>
> However, if some custom set of recipes is build,
> there is a race between gdbm and python3 build
> and availability of readline isn't deterministic,
> causing next build error:
> | ../../gdbm-1.18/src/input-rl.c:18:31: fatal error: readline/readline.h:
> No such file or directory
> |  #include <readline/readline.h>
> |                                ^
> | compilation terminated.
>
> Thus add readline dependency explicitly.
>

I thought that nowadays with per-recipe sysroots, these sort of issues were
a thing of the past ? Am I missing something ? This patch is for master
right ?

/Jacob

Cudos to Kostiantyn Iarmak <kiarmak@cisco.com> who
> found this issue.
>
> Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> ---
>  meta/recipes-support/gdbm/gdbm_1.18.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> index 16ecc50..215ae47 100644
> --- a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> +++ b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> @@ -15,6 +15,8 @@ SRC_URI[sha256sum] =
> "86e613527e5dba544e73208f42b78b7c022d4fa5a6d5498bf18c8d6f74
>
>  inherit autotools gettext texinfo lib_package ptest
>
> +DEPENDS += "readline"
> +
>  # Needed for dbm python module
>  EXTRA_OECONF = "-enable-libgdbm-compat"
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000055ebf0057d999880
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, =
21 Dec 2018, 23:40 Ruslan Bilovol via Openembedded-core &lt;<a href=3D"mail=
to:openembedded-core@lists.openembedded.org">openembedded-core@lists.openem=
bedded.org</a> wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This package =
depends on readline recipe.<br>
In traditional OE build readline is a dependency<br>
of python3 and few other packages, thus at the time<br>
of gdbm build it is available.<br>
<br>
However, if some custom set of recipes is build,<br>
there is a race between gdbm and python3 build<br>
and availability of readline isn&#39;t deterministic,<br>
causing next build error:<br>
| ../../gdbm-1.18/src/input-rl.c:18:31: fatal error: readline/readline.h: N=
o such file or directory<br>
|=C2=A0 #include &lt;readline/readline.h&gt;<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
| compilation terminated.<br>
<br>
Thus add readline dependency explicitly.<br></blockquote></div></div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">I thought that nowadays with per-re=
cipe sysroots, these sort of issues were a thing of the past ? Am I missing=
 something ? This patch is for master right ?</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">/Jacob</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Cudos to Kostiantyn Iarmak &lt;<a href=3D"mailto:kiarmak@cisco.com" target=
=3D"_blank" rel=3D"noreferrer">kiarmak@cisco.com</a>&gt; who<br>
found this issue.<br>
<br>
Signed-off-by: Ruslan Bilovol &lt;<a href=3D"mailto:rbilovol@cisco.com" tar=
get=3D"_blank" rel=3D"noreferrer">rbilovol@cisco.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/gdbm/<a href=3D"http://gdbm_1.18.1.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">gdbm_1.18.1.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-support/gdbm/<a href=3D"http://gdbm_1.18.1.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">gdbm_1.18.1.bb</a> b/meta/rec=
ipes-support/gdbm/<a href=3D"http://gdbm_1.18.1.bb" rel=3D"noreferrer noref=
errer" target=3D"_blank">gdbm_1.18.1.bb</a><br>
index 16ecc50..215ae47 100644<br>
--- a/meta/recipes-support/gdbm/<a href=3D"http://gdbm_1.18.1.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">gdbm_1.18.1.bb</a><br>
+++ b/meta/recipes-support/gdbm/<a href=3D"http://gdbm_1.18.1.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">gdbm_1.18.1.bb</a><br>
@@ -15,6 +15,8 @@ SRC_URI[sha256sum] =3D &quot;86e613527e5dba544e73208f42b7=
8b7c022d4fa5a6d5498bf18c8d6f74<br>
<br>
=C2=A0inherit autotools gettext texinfo lib_package ptest<br>
<br>
+DEPENDS +=3D &quot;readline&quot;<br>
+<br>
=C2=A0# Needed for dbm python module<br>
=C2=A0EXTRA_OECONF =3D &quot;-enable-libgdbm-compat&quot;<br>
<br>
-- <br>
1.9.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openembedded=
.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>

--00000000000055ebf0057d999880--

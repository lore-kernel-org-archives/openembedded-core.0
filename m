Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail.openembedded.org (Postfix) with ESMTP id 79D8B7D57E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 20:54:54 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id w11so10750375edl.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 13:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=/y1aUIcnNp3qpNsqpefP3h2xLJqxtjQjU50+yqBpZJw=;
	b=Dw8bXn3lIORa9hWQS/6bkdc2/ZAUSV/K4GycUibKk2cPcCWzc+DcBD0gbIADfGvL+d
	jb1SmNrsZktuycIznchdfJxT5iK0lOHwh6qKRUqCxORMe3GkLYIiCJq9BduMkVwPIjYn
	/Rr6iL3xHS9lgZdhlKYmiCNO3jdxPEhQ8eTp2SUTA3QSkluJDKcdCzkQlEgTe4nvN4CY
	u40WFRsbpBDF06kvisTjm84DeBoltU5pKwbhzXGwvNf99Ecy8vpThO5bcEgkpAUdFdIW
	wRN/QPMI5LkeQNRBnCoyY21JKs7trnwHZWAB2Op5L4Rpr1fMz/FFzVJ9pi4sLbZsi3YH
	Clgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=/y1aUIcnNp3qpNsqpefP3h2xLJqxtjQjU50+yqBpZJw=;
	b=peN4kMSgK1MucRmf8Yz4R70AB6kO1y38PznjxUu8MCbjEXjjSqtuWxE2mkIb0JsAnO
	div8Ei0t22LucCxzcimU3Tld33SVM1y6uiyd050eROOdqaSjGl1WwKc2qDrT9+jKNaZN
	wEYeiHjwM0jUxWy2amegq2vi7gN3VSbyOTfLCcheqmZhHdoX2QLjCwP/Qr2ulJztbzAg
	AjvQW9cRR+vv0Nw6vpr1S+GTiJRAeqT7bmJeXfk6xR8tArU1tMowkXYjNtduiLUUZqcR
	fwO0y+MPRHxVJGGwXtnwQ/FV8CPr21dgXd1kF7cCIbM8F8HU447eSrjBgSAB1+fFxlNn
	sc5w==
X-Gm-Message-State: APjAAAXRhCoogccRdFDhYAiNevWNRHnJWihq1VYG9dmtS16ZbBa9FB8q
	VAgoiQokwJYXwgPLRNEm4IcxJbsNzk0L4HlVdq/Tc2ZE
X-Google-Smtp-Source: APXvYqy0ABk2UgRdoQxs09D28XNuhXWpOuov+JKIPhTUkeMy0r//YPzC5M62NI5m619tMqSPRpHflaScyQ2Vh2ktb3c=
X-Received: by 2002:a50:b662:: with SMTP id c31mr20147320ede.252.1557608094988;
	Sat, 11 May 2019 13:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1spT7=rt=JrAqT44h7KjqAHr342Ew5SxrcPJB0EA3bXJPA@mail.gmail.com>
	<20190511163618.11829-1-Martin.Jansa@gmail.com>
In-Reply-To: <20190511163618.11829-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 11 May 2019 22:54:53 +0200
Message-ID: <CA+chaQe1LaMWsVVyyC9CGjGBAT2BGrcc+fjvdCEaThP7WGzN_Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] perf: make sure that the tools/include/uapi/asm-generic directory exists
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
X-List-Received-Date: Sat, 11 May 2019 20:54:54 -0000
Content-Type: multipart/alternative; boundary="0000000000003381af0588a2e57a"

--0000000000003381af0588a2e57a
Content-Type: text/plain; charset="UTF-8"

I'm sorry, will need v3.

install: target
'lib32-perf/1.0-r9/perf-1.0/tools/include/uapi/asm-generic/unistd.h' is not
a directory

On Sat, May 11, 2019 at 6:36 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> * before trying to copy unistd.h into it
>
> * older kernels don't have uapi in tools/include and do_configure fails
>   with:
>   DEBUG: Executing shell function do_configure
>   cp: cannot create regular file
> '.../perf/1.0-r9/perf-1.0/tools/include/uapi/asm-generic/unistd.h':
>   No such file or directory
>   WARNING: exit code 1 from a shell command.
>
> * tools/include/uapi was added in kernel 4.8 with
>
> https://github.com/torvalds/linux/commit/c4b6014e8bb0c8d47fe5c71ebc604f31091e5d3f
>   tools: Add copy of perf_event.h to tools/include/linux/
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/
> perf.bb
> index 546076f84b..774894166c 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -238,7 +238,7 @@ do_configure_prepend () {
>
>      # unistd.h can be out of sync between libc-headers and the captured
> version in the perf source
>      # so we copy it from the sysroot unistd.h to the perf unistd.h
> -    cp ${STAGING_INCDIR}/asm-generic/unistd.h
> ${S}/tools/include/uapi/asm-generic/unistd.h
> +    install -D 0644 ${STAGING_INCDIR}/asm-generic/unistd.h
> ${S}/tools/include/uapi/asm-generic/unistd.h
>  }
>
>  python do_package_prepend() {
> --
> 2.17.1
>
>

--0000000000003381af0588a2e57a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">I&#39;m sorry, will need v3.<div><br></di=
v><div>install: target &#39;lib32-perf/1.0-r9/perf-1.0/tools/include/uapi/a=
sm-generic/unistd.h&#39; is not a directory<br></div></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 11, =
2019 at 6:36 PM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">=
martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">* before trying to copy unistd.h into it<br>
<br>
* older kernels don&#39;t have uapi in tools/include and do_configure fails=
<br>
=C2=A0 with:<br>
=C2=A0 DEBUG: Executing shell function do_configure<br>
=C2=A0 cp: cannot create regular file &#39;.../perf/1.0-r9/perf-1.0/tools/i=
nclude/uapi/asm-generic/unistd.h&#39;:<br>
=C2=A0 No such file or directory<br>
=C2=A0 WARNING: exit code 1 from a shell command.<br>
<br>
* tools/include/uapi was added in kernel 4.8 with<br>
=C2=A0 <a href=3D"https://github.com/torvalds/linux/commit/c4b6014e8bb0c8d4=
7fe5c71ebc604f31091e5d3f" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/torvalds/linux/commit/c4b6014e8bb0c8d47fe5c71ebc604f31091e5d3f</a><b=
r>
=C2=A0 tools: Add copy of perf_event.h to tools/include/linux/<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nor=
eferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a href=
=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a><br>
index 546076f84b..774894166c 100644<br>
--- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
@@ -238,7 +238,7 @@ do_configure_prepend () {<br>
<br>
=C2=A0 =C2=A0 =C2=A0# unistd.h can be out of sync between libc-headers and =
the captured version in the perf source<br>
=C2=A0 =C2=A0 =C2=A0# so we copy it from the sysroot unistd.h to the perf u=
nistd.h<br>
-=C2=A0 =C2=A0 cp ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/include=
/uapi/asm-generic/unistd.h<br>
+=C2=A0 =C2=A0 install -D 0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/=
tools/include/uapi/asm-generic/unistd.h<br>
=C2=A0}<br>
<br>
=C2=A0python do_package_prepend() {<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--0000000000003381af0588a2e57a--

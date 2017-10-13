Return-Path: <liu.ming50@gmail.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 430A26FFD3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 07:35:20 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id v41so7825479qtv.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 00:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Gcv3jUPezwdMcky2gOnGHh9UzpPLpoKoILjcWGCBiTw=;
	b=qTZsaqFl0a9JJFRkgflzZmNYHezZtWVqKrGKveFvSpy/9i9AAvRXqQAh0DLSsbTuPw
	+TYfEg+JiNYSu3k3pJti8L7hjqLRRwJ+gUX42V9sGxaeyv4236QNyU6itXOtWnk1hp2K
	DH+ame5QMHk3LI+AJpjjDq+KKFMWAANdO8E0cCqr/vpAZ2FEq7AIcGzMd+Ox73r5TLoB
	Qt8GZCEdV9L7/AOdpsdpTJnOlWB+76SXnJcy4AksW8+vduVRNmjTa6YnGDLHENnHAHlF
	/RD4gV819xyfz7W18igm2jF8NX7J1c42LoQw8k5YqA9MzrGt1HIcW+5yiW0YGTJNMG0y
	dOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Gcv3jUPezwdMcky2gOnGHh9UzpPLpoKoILjcWGCBiTw=;
	b=o3uTTO4aGi2HhK2zDUeeQJH8BguYqu0eTgXeyEnCAciW26OR0ebGTZgnPlDMfXmHq4
	B/0qzODv4r9TW3eMmMioWUSlaqurHpeu4ELfTip9s2mKHYXpzF7XqTKKdEC4U60fl5rh
	AI2feM/GklHER/jXyxXQXA+5hGnnMlg9msNs+DVL+N2TCh1+CVr3WInIvuMYghVzW+Qo
	4oShtl/pxPSrglSizIGY+GhL6zWhzSd2zfjzYVTzSugyhXWgb7n4asEqNUMEHPKgm+wi
	jeS7oxnf2UFcPycgfHee/YIC6mCfZ9lyFLfclZ/40eYP8zeJnq8LaVKxte4BDU8q7MfZ
	JChw==
X-Gm-Message-State: AMCzsaWJ8a6HyUm8t9ueKYfFNCkZh/FXLprHJPSadl+7KNb3NYVX7aTO
	y6fUZDoo4CemyqIWLBWz8HV3foC1QsevdCZx+1YKvA==
X-Google-Smtp-Source: AOwi7QAN+Mew5So84KWpqwCDjwqKfiQrYUQBO3peLvp2bX/xCxyChYWERLxE9KRSp6ayo2NO6/4z4zieHgV0lPrcZk8=
X-Received: by 10.200.44.133 with SMTP id 5mr721438qtw.169.1507880121381; Fri,
	13 Oct 2017 00:35:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.34.196 with HTTP; Fri, 13 Oct 2017 00:35:20 -0700 (PDT)
In-Reply-To: <1507879511-1070-1-git-send-email-liu.ming50@gmail.com>
References: <1507879511-1070-1-git-send-email-liu.ming50@gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Fri, 13 Oct 2017 15:35:20 +0800
Message-ID: <CALatG=4S7aafcY1k_dYX1ktwqJdkh0q8eZG6yiKAAJiTZ=cx4g@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: Re: [PATCH] lib/oe/terminal.py: use an absolute path to execute oe-gnome-terminal-phonehome
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
X-List-Received-Date: Fri, 13 Oct 2017 07:35:20 -0000
Content-Type: multipart/alternative; boundary="001a1135a10affb720055b68b21d"

--001a1135a10affb720055b68b21d
Content-Type: text/plain; charset="UTF-8"

Sorry, I mistakenly sent a useless file xxxxxxxxxx file with this patch,
please ignore it, will send a V2 soon.

//Ming Liu

2017-10-13 15:25 GMT+08:00 <liu.ming50@gmail.com>:

> From: Ming Liu <liu.ming50@gmail.com>
>
> A flaw was found on my Ubuntu 14.04.5 LTS, on which that gnome-terminal is
> the default terminal, when I run any of the tasks:
> bitbake busybox -c menuconfig/devshell/devpyshell
> bitbake virtual/kernel -c menuconfig/devshell/devpyshell
>
> I got a error as follows:
> "Failed to execute child process "oe-gnome-terminal-phonehome" (No such
> file or directory)"
>
> Seems the environment of the process calling Popen is not passed to the
> child process, this behaviour is a known issue in Python bug tracker:
> http://bugs.python.org/issue8557
>
> It could be fixed by using an absolute path instead per test.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/lib/oe/terminal.py | 2 +-
>  xxxxxxxxxx              | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  create mode 100644 xxxxxxxxxx
>
> diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
> index 9eb19a2..94afe39 100644
> --- a/meta/lib/oe/terminal.py
> +++ b/meta/lib/oe/terminal.py
> @@ -224,7 +224,7 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
>      import time
>      pidfile = tempfile.NamedTemporaryFile(delete = False).name
>      try:
> -        sh_cmd = "oe-gnome-terminal-phonehome " + pidfile + " " + sh_cmd
> +        sh_cmd = bb.utils.which(os.getenv('PATH'),
> "oe-gnome-terminal-phonehome") + " " + pidfile + " " + sh_cmd
>          pipe = terminal(sh_cmd, title, env, d)
>          output = pipe.communicate()[0]
>          if output:
> diff --git a/xxxxxxxxxx b/xxxxxxxxxx
> new file mode 100644
> index 0000000..e69de29
> --
> 2.7.4
>
>

--001a1135a10affb720055b68b21d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Sorry, I mistakenly sent a useless file xxxxxxxx=
xx file with this patch, please ignore it, will send a V2 soon.<br></div><b=
r></div>//Ming Liu<br></div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">2017-10-13 15:25 GMT+08:00  <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt;</s=
pan>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">From: Ming Liu &lt;<a href=3D"mailt=
o:liu.ming50@gmail.com">liu.ming50@gmail.com</a>&gt;<br>
<br>
A flaw was found on my Ubuntu 14.04.5 LTS, on which that gnome-terminal is<=
br>
the default terminal, when I run any of the tasks:<br>
bitbake busybox -c menuconfig/devshell/devpyshell<br>
bitbake virtual/kernel -c menuconfig/devshell/devpyshell<br>
<br>
I got a error as follows:<br>
&quot;Failed to execute child process &quot;oe-gnome-terminal-phonehome&quo=
t; (No such file or directory)&quot;<br>
<br>
Seems the environment of the process calling Popen is not passed to the<br>
child process, this behaviour is a known issue in Python bug tracker:<br>
<a href=3D"http://bugs.python.org/issue8557" rel=3D"noreferrer" target=3D"_=
blank">http://bugs.python.org/<wbr>issue8557</a><br>
<br>
It could be fixed by using an absolute path instead per test.<br>
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">liu.min=
g50@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/terminal.py | 2 +-<br>
=C2=A0xxxxxxxxxx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A02 files changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0create mode 100644 xxxxxxxxxx<br>
<br>
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py<br>
index 9eb19a2..94afe39 100644<br>
--- a/meta/lib/oe/terminal.py<br>
+++ b/meta/lib/oe/terminal.py<br>
@@ -224,7 +224,7 @@ def spawn(name, sh_cmd, title=3DNone, env=3DNone, d=3DN=
one):<br>
=C2=A0 =C2=A0 =C2=A0import time<br>
=C2=A0 =C2=A0 =C2=A0pidfile =3D tempfile.NamedTemporaryFile(<wbr>delete =3D=
 False).name<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sh_cmd =3D &quot;oe-gnome-terminal-phonehome &=
quot; + pidfile + &quot; &quot; + sh_cmd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sh_cmd =3D bb.utils.which(os.getenv(&#39;<wbr>=
PATH&#39;), &quot;oe-gnome-terminal-phonehome&quot;) + &quot; &quot; + pidf=
ile + &quot; &quot; + sh_cmd<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pipe =3D terminal(sh_cmd, title, env, d)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output =3D pipe.communicate()[0]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if output:<br>
diff --git a/xxxxxxxxxx b/xxxxxxxxxx<br>
new file mode 100644<br>
index 0000000..e69de29<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br></div>

--001a1135a10affb720055b68b21d--

Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F53C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 20:40:25 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.169856.1698698422397308220
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 13:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B2qNS3LZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4083ac51d8aso38669235e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 13:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698698421; x=1699303221; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8AIQII2fx2DrnV2I1fiwTdqdFnmYJ2iK67h3f+aVeyQ=;
        b=B2qNS3LZ03AoA5WwSJICYOJy6wSI2c1rOKvUp/9QZ98mwp42qWJKjmbxtATa6YM0Fc
         KA9a/ESXpJ0PkIWHdybqqtDWx20zHMz9ixNVoIi9o5HpxncETRN69gJ6tdVR8esRhCyI
         v92qV63Us1OBcY/7M0dRsdcLyCI5FCa+2VyFUg6HpacYu+04d1PfjH+33ysb4E8UO07m
         2DMFY8wc+dJPgb24hxPM2VDiSEmatD8jql1L2rfZ+xm7BJeaYmPU+ykfIpvizpsBXkYo
         Mr1nLeypaJm2w1aW6omZfMoqFqMakoN2Xm3Y+RWimjAf2cTUOeh6L5hrqLftyg62diSr
         na9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698698421; x=1699303221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8AIQII2fx2DrnV2I1fiwTdqdFnmYJ2iK67h3f+aVeyQ=;
        b=bO05hvf8Q6IoqE96IcgC12OagHeRWDxRaTxMVZa4q5ydJjLT5P6UEiUVmHM9lUuywQ
         UaCDk9Ldij1/8FFCpWvIEkr9d7WhpX6L+wifbkPiFIojq8hShIncY/eFY+nVZCK/Ph+y
         PYnCKPtODmmv1YhgRfwGs6ihNPLfFG6a2ChxxqN6Q6k97ujSXcMjsTfym+g/Pi48hc2N
         ovbOun1FCq3sfD0gSeu9EtzZYPOVGiiSThdDzD6dzTm7YkL0FE8sfbHFeTxqcp9jKVdU
         GUekZIr+yXgo2BrLFf93+Fa0OIzvjOWnaRIZEfUOBXsbCUfRgHhafGyfZou+OuLQNQdk
         yHbw==
X-Gm-Message-State: AOJu0YxWM9AwjHj6iBlaWKjUl23DRG1w1vvn9lr2NC3+h630Ou5aqdjZ
	WNaY7wXUWKbdqU9NSnfB1E0qB6jh+xd6mZS6fII=
X-Google-Smtp-Source: AGHT+IEGHOWlv9/TkY7ogQ+w5+a4nCuvTwC+vA2VZEeS2oPPrdQ47GQaeLuZYfcwRZwL/cz/jX5MWfs5YliUKnMWUqE=
X-Received: by 2002:a05:600c:4f0d:b0:403:7b2:6d8f with SMTP id
 l13-20020a05600c4f0d00b0040307b26d8fmr9331792wmq.2.1698698420402; Mon, 30 Oct
 2023 13:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231024220735.3011192-1-raj.khem@gmail.com>
In-Reply-To: <20231024220735.3011192-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 30 Oct 2023 21:40:08 +0100
Message-ID: <CA+chaQcKzwnhBOjsnbgOZLrDx5Wtxe=2VugKoS4WTw0Z6U_cjA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: Use strip utility used for
 kernel build in do_package
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000edbe750608f50b4b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 20:40:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189810

--000000000000edbe750608f50b4b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This doesn't work well with ccache.bbclass when KERNEL_STRIP is prefixed
with ccache as:
KERNEL_STRIP=3D"ccache aarch64-oe-linux-strip "

do_package then fails with:
ERROR: Fatal errors occurred in subprocesses:
[Errno 2] No such file or directory: 'ccache x86_64-oe-linux-strip':
Traceback (most recent call last):
  File "TOPDIR/oe-core/meta/lib/oe/utils.py", line 288, in run
    ret =3D self._target(*self._args, **self._kwargs)
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "TOPDIR/oe-core/meta/lib/oe/package.py", line 66, in runstrip
    output =3D subprocess.check_output(stripcmd, stderr=3Dsubprocess.STDOUT=
)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.11/subprocess.py", line 466, in check_output
    return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, check=3DTrue,
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.11/subprocess.py", line 548, in run
    with Popen(*popenargs, **kwargs) as process:
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.11/subprocess.py", line 1026, in __init__
    self._execute_child(args, executable, preexec_fn, close_fds,
  File "/usr/lib/python3.11/subprocess.py", line 1950, in _execute_child
    raise child_exception_type(errno_num, err_msg, err_filename)
FileNotFoundError: [Errno 2] No such file or directory: 'ccache
x86_64-oe-linux-strip'

On Wed, Oct 25, 2023 at 12:07=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:

> os.environ does not pass this down to runstrip() function and in
> strip_execs() its using STRIP bitbake variable to find the strip utility
> to use. Since there might be a trailing whitespace in KERNEL_STRIP
> remove that otherwise python is not able to launch it.
> e.g.
>
> FileNotFoundError: [Errno 2] No such file or directory:
> 'riscv64-yoe-linux-strip '
>
> This is more evident when STRIP and KERNEL_STRIP are different utilities
> e.g. when using clang as default toolchain but using gcc+binutils only fo=
r
> kernel build.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index 2ec9ea2091e..16b85dbca48 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -336,7 +336,7 @@ kernel_do_transform_bundled_initramfs() {
>  do_transform_bundled_initramfs[dirs] =3D "${B}"
>
>  python do_package:prepend () {
> -    os.environ['STRIP'] =3D d.getVar('KERNEL_STRIP')
> +    d.setVar('STRIP',  d.getVar('KERNEL_STRIP').strip())
>  }
>
>  python do_devshell:prepend () {
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189658):
> https://lists.openembedded.org/g/openembedded-core/message/189658
> Mute This Topic: https://lists.openembedded.org/mt/102167569/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000edbe750608f50b4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This doesn&#39;t work well with ccache.bbclass when KERNEL=
_STRIP is prefixed with ccache as:<div>KERNEL_STRIP=3D&quot;ccache aarch64-=
oe-linux-strip &quot;<br></div><div><br></div><div>do_package then fails wi=
th:</div><div>ERROR: Fatal errors occurred in subprocesses:<br>[Errno 2] No=
 such file or directory: &#39;ccache x86_64-oe-linux-strip&#39;: Traceback =
(most recent call last):<br>=C2=A0 File &quot;TOPDIR/oe-core/meta/lib/oe/ut=
ils.py&quot;, line 288, in run<br>=C2=A0 =C2=A0 ret =3D self._target(*self.=
_args, **self._kwargs)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>=C2=A0 File &quot;TOPDIR/oe-core/meta/lib/oe=
/package.py&quot;, line 66, in runstrip<br>=C2=A0 =C2=A0 output =3D subproc=
ess.check_output(stripcmd, stderr=3Dsubprocess.STDOUT)<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^<br>=C2=A0 File &quot;/usr/lib/python3.11/subprocess.py&quot=
;, line 466, in check_output<br>=C2=A0 =C2=A0 return run(*popenargs, stdout=
=3DPIPE, timeout=3Dtimeout, check=3DTrue,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>=
=C2=A0 File &quot;/usr/lib/python3.11/subprocess.py&quot;, line 548, in run=
<br>=C2=A0 =C2=A0 with Popen(*popenargs, **kwargs) as process:<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>=C2=A0 File &quot=
;/usr/lib/python3.11/subprocess.py&quot;, line 1026, in __init__<br>=C2=A0 =
=C2=A0 self._execute_child(args, executable, preexec_fn, close_fds,<br>=C2=
=A0 File &quot;/usr/lib/python3.11/subprocess.py&quot;, line 1950, in _exec=
ute_child<br>=C2=A0 =C2=A0 raise child_exception_type(errno_num, err_msg, e=
rr_filename)<br>FileNotFoundError: [Errno 2] No such file or directory: &#3=
9;ccache x86_64-oe-linux-strip&#39;<br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 25, 2023 at 12:07=
=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">os.environ does not pass this down to runstrip() function and in<br>
strip_execs() its using STRIP bitbake variable to find the strip utility<br=
>
to use. Since there might be a trailing whitespace in KERNEL_STRIP<br>
remove that otherwise python is not able to launch it.<br>
e.g.<br>
<br>
FileNotFoundError: [Errno 2] No such file or directory: &#39;riscv64-yoe-li=
nux-strip &#39;<br>
<br>
This is more evident when STRIP and KERNEL_STRIP are different utilities<br=
>
e.g. when using clang as default toolchain but using gcc+binutils only for<=
br>
kernel build.<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index 2ec9ea2091e..16b85dbca48 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -336,7 +336,7 @@ kernel_do_transform_bundled_initramfs() {<br>
=C2=A0do_transform_bundled_initramfs[dirs] =3D &quot;${B}&quot;<br>
<br>
=C2=A0python do_package:prepend () {<br>
-=C2=A0 =C2=A0 os.environ[&#39;STRIP&#39;] =3D d.getVar(&#39;KERNEL_STRIP&#=
39;)<br>
+=C2=A0 =C2=A0 d.setVar(&#39;STRIP&#39;,=C2=A0 d.getVar(&#39;KERNEL_STRIP&#=
39;).strip())<br>
=C2=A0}<br>
<br>
=C2=A0python do_devshell:prepend () {<br>
-- <br>
2.42.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#189658): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/189658" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/189658</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102167569/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102167569/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000edbe750608f50b4b--


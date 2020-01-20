Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id D9B967FC47
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 16:12:33 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id g15so19257896vsf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 08:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pa1/eoismIkmWqRSDdG0p6qoIHu2ZN2riAsvzanRqn0=;
	b=drg5E9X737GP8/f6QAaKlZ2z8rj786le1yHE9I0sd1yW4cmva8QeG9ddWeUamGojZQ
	XXEF1Yy1B0Q97HTDblbIMEN8/eFbw+5X3PNsWgQ7pCKICRyaY4bhwu6Q17+9/D1/+5nZ
	4QI/HwO6grd6dXqH4Nr/0O7TZ+Wz9+PwjwjjLu39Iu8rr56sUGL45GpFW6Yf/wEMe7ZS
	Yar8IhmnFMWk55EbrtoGxhS4rwMkRKeN2dSJMOXxovNWnm2KxOjDqCP45m1VZJ+gTyaS
	MC6coQrTVdK/iAGnDaVJgI8idNU0u1CCP8tEOjk1/ylRwkxt24OCCkv8ujhTvusv6vOh
	GOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pa1/eoismIkmWqRSDdG0p6qoIHu2ZN2riAsvzanRqn0=;
	b=pRaKZ2yPVb3INAA534C7kPCnTRSAsWPUGkCprS3b+ursiXueGlfzv4WHk6vI8tgM/+
	7jigs2SoDeceHv0KCGSNwsPgVSVfcQJ1rqUFZv3CyAkWsOIMTvxAGb4VxfhH3cmVMuRy
	VbqrisxD7d2WLtbb2wDwIlPmCiMve/saxl5citnNhsocmNbib3xXBCHBHYwq9n18LnIM
	2H8logVXbX0eU1rsVFSqv9lEQZBsmzMLWJc3FqKwvkjQs3LIhazomnUzFHwlSEGmqWow
	ckAAjudO+orAnPfYdTulraPUs8WAukbLKsbl+G3BzGPzTypTLn/LmAiaIWoggfGRKVqN
	iGRA==
X-Gm-Message-State: APjAAAUj0kEnqttgd6lsFKKfp4pzpw6J2LQ74iZbVtDztI0u8tENTh0l
	z1pHIZe9306RpOGontjN0pb04hCHbCDOUJYvklT18jgU
X-Google-Smtp-Source: APXvYqw9X/u2qq3eMUPeA028raVDdSp+o2aVHW53F0yYmG7onPjYwaio8ZT8cowRoEMS49wD8vF83X2phafRLBIoK+g=
X-Received: by 2002:a05:6102:3213:: with SMTP id
	r19mr13125531vsf.83.1579536754643; 
	Mon, 20 Jan 2020 08:12:34 -0800 (PST)
MIME-Version: 1.0
References: <875zh6f6vm.fsf@windriver.com>
In-Reply-To: <875zh6f6vm.fsf@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 Jan 2020 17:12:23 +0100
Message-ID: <CANNYZj-nAT1oWq9nyPSGYWk1pVg1Q00rnMX08FmiEhXr2n-+ZA@mail.gmail.com>
To: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: skip unit tests to avoid Makefile errors
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
X-List-Received-Date: Mon, 20 Jan 2020 16:12:34 -0000
Content-Type: multipart/alternative; boundary="0000000000002b97a3059c948f53"

--0000000000002b97a3059c948f53
Content-Type: text/plain; charset="UTF-8"

I think I have a better patch for this:
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates&id=c2fc852501414b06e6587d97d3bc944a4650906e

Rather than hardcode upstream-specific targets, my patch uses a variable
that upstream uses to skip the tests.

Alex

On Mon, 20 Jan 2020 at 17:08, Mingde (Matthew) Zeng <
matthew.zeng@windriver.com> wrote:

>
> As per do_compile_ptest first appeared in commit
> 1f7aaf76f4aa7875f05f4b838a5ec4594a4c35dc,
> regress/unittests/ binaries are already skipped.
>
> This will trigger a Makefile error when running ptest:
> ```sh
> /bin/sh: line 4:
> /usr/lib/openssh/ptest/regress/unittests/sshbuf/test_sshbuf: No such file
> or directory
> make: *** [Makefile:243: unit] Error 127
> make: Target 'tests' not remade because of errors.
> ```
>
> openssh/regress/Makefile:
> ```
> tests:          prep file-tests t-exec unit
> ```
>
> Therefore we do not `make tests` as it consists of unit tests, we
> `make prep file-tests t-exec` instead.
>
> Signed-off-by: Matthew Zeng<Matthew.Zeng@windriver.com>
>
> ---
>  meta/recipes-connectivity/openssh/openssh/run-ptest | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/run-ptest
> b/meta/recipes-connectivity/openssh/openssh/run-ptest
> index daf62cca5b..e5270ceade 100755
> --- a/meta/recipes-connectivity/openssh/openssh/run-ptest
> +++ b/meta/recipes-connectivity/openssh/openssh/run-ptest
> @@ -4,7 +4,8 @@ export TEST_SHELL=sh
>
>  cd regress
>  sed -i "/\t\tagent-ptrace /d" Makefile
> -make -k .OBJDIR=`pwd` .CURDIR=`pwd` SUDO="sudo" tests \
> +
> +make -k .OBJDIR=`pwd` .CURDIR=`pwd` SUDO="sudo" prep file-tests t-exec \
>          | sed -u -e 's/^skipped/SKIP: /g' -e 's/^ok /PASS: /g' -e
> 's/^failed/FAIL: /g'
>
>  SSHAGENT=`which ssh-agent`
> @@ -41,4 +42,3 @@ EOF
>         ${SSHAGENT} -k > /dev/null
>  fi
>  userdel openssh-test
> -
> --
> 2.24.0
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000002b97a3059c948f53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think I have a better patch for this:</div><div><a =
href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Dakana=
vin/package-version-updates&amp;id=3Dc2fc852501414b06e6587d97d3bc944a465090=
6e">http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Dakanavin/=
package-version-updates&amp;id=3Dc2fc852501414b06e6587d97d3bc944a4650906e</=
a></div><div><br></div><div>Rather than hardcode upstream-specific targets,=
 my patch uses a variable that upstream uses to skip the tests.</div><div><=
br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, 20 Jan 2020 at 17:08, Mingde (Matthew=
) Zeng &lt;<a href=3D"mailto:matthew.zeng@windriver.com">matthew.zeng@windr=
iver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><br>
As per do_compile_ptest first appeared in commit 1f7aaf76f4aa7875f05f4b838a=
5ec4594a4c35dc,<br>
regress/unittests/ binaries are already skipped.<br>
<br>
This will trigger a Makefile error when running ptest:<br>
```sh<br>
/bin/sh: line 4: /usr/lib/openssh/ptest/regress/unittests/sshbuf/test_sshbu=
f: No such file or directory<br>
make: *** [Makefile:243: unit] Error 127<br>
make: Target &#39;tests&#39; not remade because of errors.<br>
```<br>
<br>
openssh/regress/Makefile:<br>
```<br>
tests:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prep file-tests t-exec unit<br>
```<br>
<br>
Therefore we do not `make tests` as it consists of unit tests, we<br>
`make prep file-tests t-exec` instead.<br>
<br>
Signed-off-by: Matthew Zeng&lt;<a href=3D"mailto:Matthew.Zeng@windriver.com=
" target=3D"_blank">Matthew.Zeng@windriver.com</a>&gt;<br>
<br>
---<br>
=C2=A0meta/recipes-connectivity/openssh/openssh/run-ptest | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-connectivity/openssh/openssh/run-ptest b/meta/rec=
ipes-connectivity/openssh/openssh/run-ptest<br>
index daf62cca5b..e5270ceade 100755<br>
--- a/meta/recipes-connectivity/openssh/openssh/run-ptest<br>
+++ b/meta/recipes-connectivity/openssh/openssh/run-ptest<br>
@@ -4,7 +4,8 @@ export TEST_SHELL=3Dsh<br>
<br>
=C2=A0cd regress<br>
=C2=A0sed -i &quot;/\t\tagent-ptrace /d&quot; Makefile<br>
-make -k .OBJDIR=3D`pwd` .CURDIR=3D`pwd` SUDO=3D&quot;sudo&quot; tests \<br=
>
+<br>
+make -k .OBJDIR=3D`pwd` .CURDIR=3D`pwd` SUDO=3D&quot;sudo&quot; prep file-=
tests t-exec \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| sed -u -e &#39;s/^skipped/SKIP: /g&#39;=
 -e &#39;s/^ok /PASS: /g&#39; -e &#39;s/^failed/FAIL: /g&#39;<br>
<br>
=C2=A0SSHAGENT=3D`which ssh-agent`<br>
@@ -41,4 +42,3 @@ EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${SSHAGENT} -k &gt; /dev/null<br>
=C2=A0fi<br>
=C2=A0userdel openssh-test<br>
-<br>
--<br>
2.24.0<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000002b97a3059c948f53--

Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3412C77D6F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 22:59:07 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id m68so28455923ith.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 15:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zMJVdLiuJ9ox4l4ELJwwg2CzbPVuV4phaCSy63yEjE0=;
	b=Eedqf1Iv/mlgh4+ZglVT7n8HZ1BdeerA1h+JEZTnQUsWsOUipLMrpp6GXDnDQvPrWs
	olkM5LHLHU6imnELnqac+OzMikYnBt2phO03oXFivGptwQZ3QLw14rmZ+z0n32gqXCj8
	Tnyk/6A8Gkfl3OuOZJB1QvnJqe9Pn4mrD8xwpDGLDGmllXJ3kYMx0ET1lez5r2ljLDFF
	jKGcAMYd69r/vCO0pgmTHncNYwUh6We1aGWL2lAI10SHSO14xXcyf+bsjCBVEqJHltOX
	FiYCECsHZ9e7EI/Sb6hNzKd2erZ0U2/7vImlFAt89nktZleq1tELCPVLhVExFuDeXW9l
	Q1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zMJVdLiuJ9ox4l4ELJwwg2CzbPVuV4phaCSy63yEjE0=;
	b=unAjPOtzzR+yxH75rZQfz6s7ty7paH2eRPoK+7yADxe7lZUEufeAhQOe8nANW6fFnK
	fOxAvchYRJSNvi7LJEMfhjb/ZWJpLYn0p7rlBeJYPgPrJc89zb5ajFr/ulCQQJt3HkcL
	pBSH72V/ZMhOAXdMtPjFd4ogdtjKe8nnEwImV7/WIXZ6Rwe4ra/G/q223SJoSjZLFiSd
	xS7/qqWdurM0gr/OlXeYCkhP8CeQLk2bMFNdgRI8i65M19YHj4A5Yb1mofgx+mcwj4xS
	oAFBxoS7vsfkhUnEzrkWhyCzEM3JGIEn9tVHfnYUk5i+LDk39NNlenJfa24v+YVlg8il
	2dwA==
X-Gm-Message-State: AIVw110boEIMsCyyIrgFva+Jd4LTnIg5POh4ZjWF2pP8ns58XXdTQkHx
	MEWLyyMGtcWXXCGq9Gp/Q/Q+KN6KAaou
X-Received: by 10.36.216.215 with SMTP id b206mr799918itg.23.1500073148511;
	Fri, 14 Jul 2017 15:59:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.161 with HTTP; Fri, 14 Jul 2017 15:58:48 -0700 (PDT)
In-Reply-To: <1500062533-24722-1-git-send-email-jslater@windriver.com>
References: <1500062533-24722-1-git-send-email-jslater@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Jul 2017 23:58:48 +0100
Message-ID: <CAJTo0La53sDWHb=15f9-vQNEVe7Uiyah3756T_ZNGxN1xPaEEQ@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1][V2] valgrind: allow version 3.12 to build under gcc7
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
X-List-Received-Date: Fri, 14 Jul 2017 22:59:10 -0000
Content-Type: multipart/alternative; boundary="94eb2c05ba5a27954f05544eff5c"

--94eb2c05ba5a27954f05544eff5c
Content-Type: text/plain; charset="UTF-8"

There's an outstanding patch for 3.13 upgrade which was failing to ptest
build. I gave up waiting for the submitter to fix it and backported the fix
myself earlier, it's currently queued for master.

Ross

On 14 July 2017 at 21:02, Joe Slater <jslater@windriver.com> wrote:

> Building for powerpc64 fails because of erroneous assertions
> that register r2 is clobbered.  This has been fixed in
> version 3.13.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  .../valgrind/valgrind/wait-for-3.13.patch          | 40
> ++++++++++++++++++++++
>  meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |  1 +
>  2 files changed, 41 insertions(+)
>  create mode 100644 meta/recipes-devtools/valgrind/valgrind/wait-for-3.
> 13.patch
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind/wait-for-3.13.patch
> b/meta/recipes-devtools/valgrind/valgrind/wait-for-3.13.patch
> new file mode 100644
> index 0000000..355c336
> --- /dev/null
> +++ b/meta/recipes-devtools/valgrind/valgrind/wait-for-3.13.patch
> @@ -0,0 +1,40 @@
> +valgrind: allow compilation under gcc7 for powerpc64
> +
> +Remove a few admonitions that r2 is not preserved by function or system
> calls
> +since they are not true.  -m32 ppc code does not care, but -m64 code does.
> +
> +Upstream-Status: Accepted [ version 3.13 has similar changes, but NOT
> this patch ]
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +
> +--- a/coregrind/m_debuglog.c
> ++++ b/coregrind/m_debuglog.c
> +@@ -215,7 +215,7 @@ static UInt local_sys_write_stderr ( con
> +       :
> +       : "b" (block)
> +       : "cc","memory","cr0","ctr",
> +-        "r0","r2","r3","r4","r5","r6","r7","r8","r9","r10","r11","r12"
> ++        "r0","r3","r4","r5","r6","r7","r8","r9","r10","r11","r12"
> +    );
> +    if (block[0] < 0)
> +       block[0] = -1;
> +@@ -231,7 +231,7 @@ static UInt local_sys_getpid ( void )
> +       : "=&r" (__res)
> +       : "i" (__NR_getpid)
> +       : "cc","memory","cr0","ctr",
> +-        "r0","r2","r4","r5","r6","r7","r8","r9","r10","r11","r12"
> ++        "r0","r4","r5","r6","r7","r8","r9","r10","r11","r12"
> +    );
> +    return (UInt)__res;
> + }
> +--- a/include/valgrind.h
> ++++ b/include/valgrind.h
> +@@ -2708,7 +2708,7 @@ typedef
> + #define __CALLER_SAVED_REGS                                       \
> +    "lr", "ctr", "xer",                                            \
> +    "cr0", "cr1", "cr2", "cr3", "cr4", "cr5", "cr6", "cr7",        \
> +-   "r0", "r2", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10",   \
> ++   "r0", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10",   \
> +    "r11", "r12", "r13"
> +
> + /* Macros to save and align the stack before making a function
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
> b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
> index b63d278..80b1781 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
> @@ -35,6 +35,7 @@ SRC_URI = "http://www.valgrind.org/
> downloads/valgrind-${PV}.tar.bz2 \
>             file://0001-memcheck-arm64-Define-__THROW-if-not-already-defined.patch
> \
>             file://0002-memcheck-x86-Define-__THROW-if-not-defined.patch \
>             file://0003-tests-seg_override-Replace-__modify_ldt-with-syscall.patch
> \
> +           file://wait-for-3.13.patch \
>             "
>  SRC_URI_append_libc-musl = "\
>             file://0001-fix-build-for-musl-targets.patch \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c05ba5a27954f05544eff5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There&#39;s an outstanding patch for 3.13 upgrade which wa=
s failing to ptest build. I gave up waiting for the submitter to fix it and=
 backported the fix myself earlier, it&#39;s currently queued for master.<d=
iv><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 14 July 2017 at 21:02, Joe Slater <span dir=3D"ltr">&lt=
;<a href=3D"mailto:jslater@windriver.com" target=3D"_blank">jslater@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Building for=
 powerpc64 fails because of erroneous assertions<br>
that register r2 is clobbered.=C2=A0 This has been fixed in<br>
version 3.13.<br>
<br>
Signed-off-by: Joe Slater &lt;<a href=3D"mailto:jslater@windriver.com">jsla=
ter@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../valgrind/valgrind/wait-<wbr>for-3.13.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 40 ++++++++++++++++++++++<br>
=C2=A0meta/recipes-devtools/<wbr>valgrind/<a href=3D"http://valgrind_3.12.0=
.bb" rel=3D"noreferrer" target=3D"_blank">valgrind_3.12.0.bb</a>=C2=A0 |=C2=
=A0 1 +<br>
=C2=A02 files changed, 41 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/<wbr>valgrind/valgrind/wait-=
for-3.<wbr>13.patch<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>valgrind/valgrind/wait-for-3.<wbr>1=
3.patch b/meta/recipes-devtools/<wbr>valgrind/valgrind/wait-for-3.<wbr>13.p=
atch<br>
new file mode 100644<br>
index 0000000..355c336<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/<wbr>valgrind/valgrind/wait-for-3.<wbr>13.patch=
<br>
@@ -0,0 +1,40 @@<br>
+valgrind: allow compilation under gcc7 for powerpc64<br>
+<br>
+Remove a few admonitions that r2 is not preserved by function or system ca=
lls<br>
+since they are not true.=C2=A0 -m32 ppc code does not care, but -m64 code =
does.<br>
+<br>
+Upstream-Status: Accepted [ version 3.13 has similar changes, but NOT this=
 patch ]<br>
+<br>
+Signed-off-by: Joe Slater &lt;<a href=3D"mailto:joe.slater@windriver.com">=
joe.slater@windriver.com</a>&gt;<br>
+<br>
+--- a/coregrind/m_debuglog.c<br>
++++ b/coregrind/m_debuglog.c<br>
+@@ -215,7 +215,7 @@ static UInt local_sys_write_stderr ( con<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;b&quot; (block)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;cc&quot;,&quot;memory&quot;,&quot;cr0&q=
uot;,&quot;ctr&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;r0&quot;,&quot;r2&quot;,&quot;r3&quot;,=
&quot;r4&quot;,&quot;r5&quot;,&quot;r6&quot;,<wbr>&quot;r7&quot;,&quot;r8&q=
uot;,&quot;r9&quot;,&quot;r10&quot;,&quot;r11&quot;,&quot;<wbr>r12&quot;<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;r0&quot;,&quot;r3&quot;,&quot;r4&quot;,=
&quot;r5&quot;,&quot;r6&quot;,&quot;r7&quot;,<wbr>&quot;r8&quot;,&quot;r9&q=
uot;,&quot;r10&quot;,&quot;r11&quot;,&quot;r12&quot;<br>
+=C2=A0 =C2=A0 );<br>
+=C2=A0 =C2=A0 if (block[0] &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0block[0] =3D -1;<br>
+@@ -231,7 +231,7 @@ static UInt local_sys_getpid ( void )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;=3D&amp;r&quot; (__res)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;i&quot; (__NR_getpid)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;cc&quot;,&quot;memory&quot;,&quot;cr0&q=
uot;,&quot;ctr&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;r0&quot;,&quot;r2&quot;,&quot;r4&quot;,=
&quot;r5&quot;,&quot;r6&quot;,&quot;r7&quot;,<wbr>&quot;r8&quot;,&quot;r9&q=
uot;,&quot;r10&quot;,&quot;r11&quot;,&quot;r12&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;r0&quot;,&quot;r4&quot;,&quot;r5&quot;,=
&quot;r6&quot;,&quot;r7&quot;,&quot;r8&quot;,<wbr>&quot;r9&quot;,&quot;r10&=
quot;,&quot;r11&quot;,&quot;r12&quot;<br>
+=C2=A0 =C2=A0 );<br>
+=C2=A0 =C2=A0 return (UInt)__res;<br>
+ }<br>
+--- a/include/valgrind.h<br>
++++ b/include/valgrind.h<br>
+@@ -2708,7 +2708,7 @@ typedef<br>
+ #define __CALLER_SAVED_REGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 &quot;lr&quot;, &quot;ctr&quot;, &quot;xer&quot;,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 &quot;cr0&quot;, &quot;cr1&quot;, &quot;cr2&quot;, &quot;cr3=
&quot;, &quot;cr4&quot;, &quot;cr5&quot;, &quot;cr6&quot;, &quot;cr7&quot;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+-=C2=A0 =C2=A0&quot;r0&quot;, &quot;r2&quot;, &quot;r3&quot;, &quot;r4&quo=
t;, &quot;r5&quot;, &quot;r6&quot;, &quot;r7&quot;, &quot;r8&quot;, &quot;r=
9&quot;, &quot;r10&quot;,=C2=A0 =C2=A0\<br>
++=C2=A0 =C2=A0&quot;r0&quot;, &quot;r3&quot;, &quot;r4&quot;, &quot;r5&quo=
t;, &quot;r6&quot;, &quot;r7&quot;, &quot;r8&quot;, &quot;r9&quot;, &quot;r=
10&quot;,=C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 &quot;r11&quot;, &quot;r12&quot;, &quot;r13&quot;<br>
+<br>
+ /* Macros to save and align the stack before making a function<br>
diff --git a/meta/recipes-devtools/<wbr>valgrind/<a href=3D"http://valgrind=
_3.12.0.bb" rel=3D"noreferrer" target=3D"_blank">valgrind_3.12.0.bb</a> b/m=
eta/recipes-devtools/<wbr>valgrind/<a href=3D"http://valgrind_3.12.0.bb" re=
l=3D"noreferrer" target=3D"_blank">valgrind_3.12.0.bb</a><br>
index b63d278..80b1781 100644<br>
--- a/meta/recipes-devtools/<wbr>valgrind/<a href=3D"http://valgrind_3.12.0=
.bb" rel=3D"noreferrer" target=3D"_blank">valgrind_3.12.0.bb</a><br>
+++ b/meta/recipes-devtools/<wbr>valgrind/<a href=3D"http://valgrind_3.12.0=
.bb" rel=3D"noreferrer" target=3D"_blank">valgrind_3.12.0.bb</a><br>
@@ -35,6 +35,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.valgrind.org/down=
loads/valgrind-${PV}.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://w=
ww.valgrind.org/<wbr>downloads/valgrind-${PV}.tar.<wbr>bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-memcheck-arm64-<wbr>D=
efine-__THROW-if-not-already-<wbr>defined.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-memcheck-x86-<wbr>Def=
ine-__THROW-if-not-defined.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-tests-seg_<wbr>overri=
de-Replace-__modify_ldt-<wbr>with-syscall.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://wait-for-3.13.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI_append_libc-musl =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-fix-build-for-<wbr>mu=
sl-targets.patch \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c05ba5a27954f05544eff5c--

Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id DC8476D5DE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 18:58:57 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id ar20so17630023iec.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Nov 2013 10:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5uTuMB+v8XJ1WmHdOoq5VTRBURDPoEMw8K7DoNG8fPE=;
	b=wo/EH+t5rRm+k34LVbRijDBlkcwkJ8a8hEcR1e64s0Z3YG0eVySmsgC2zHDjRFbBsy
	P5chtFdlNz0yXi/nIfTmKhXAfeT6mfIAdexjFteMYPTVVYfUQBKdXDEqZBLzH9JFTeRq
	Vk+l1bSRwMYknDZfrHZI8VAQuMFXKqxBTiml+NCSbakdKWGhiMUkCkUd6bgtaeG3p1Fz
	MdvcMihfjLmASahkq7DA1/zEF0y30IMhid/MZ53NmsEsXy0DIQFlgZaYfFoDEwLcCWTO
	xvPvTy2FMnzKfrW1cCaOZGvEBxokVWTQxJYW8b8FNPvrrl5BUt8BhAuTwynmLj+UaXu+
	OO8g==
MIME-Version: 1.0
X-Received: by 10.50.22.67 with SMTP id b3mr21307281igf.39.1383764339589; Wed,
	06 Nov 2013 10:58:59 -0800 (PST)
Received: by 10.50.79.167 with HTTP; Wed, 6 Nov 2013 10:58:59 -0800 (PST)
In-Reply-To: <527A900E.4050502@linux.intel.com>
References: <1383622893-5185-1-git-send-email-raj.khem@gmail.com>
	<5279C70B.90103@linux.intel.com>
	<E60C2A2A-EC7B-4A72-8553-B37D7DD19A58@gmail.com>
	<527A900E.4050502@linux.intel.com>
Date: Wed, 6 Nov 2013 10:58:59 -0800
Message-ID: <CAMKF1so2W9JMHtLUg==ktYcQo1vrZ3K-FU+mddt4LMcvzAs-Rg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4] expect: Add recipe
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
X-List-Received-Date: Wed, 06 Nov 2013 18:58:58 -0000
Content-Type: multipart/alternative; boundary=047d7b10ca29ea5f1804ea86bd63

--047d7b10ca29ea5f1804ea86bd63
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, November 6, 2013, Saul Wold wrote:

> On 11/05/2013 08:58 PM, Khem Raj wrote:
>
>>
>> On Nov 5, 2013, at 8:35 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>
>>  On 11/04/2013 07:41 PM, Khem Raj wrote:
>>>
>>>> From: Mihaela Sendrea <mihaela.sendrea@enea.com>
>>>>
>>>> Nedeed for gcc-runtime tests.
>>>>
>>>>
>>> i am seeing configure fails with this patch
>>>
>>>  configure:2350: checking for correct TEA configuration
>>>> configure:2363: result: ok (TEA 3.9)
>>>> configure:2430: configuring expect 5.45
>>>> configure:2508: checking for Tcl configuration
>>>> configure:2528: error: /srv/ssd/sgw/builds/world/tmp/sysroots/genericx=
86/usr/lib
>>>> directory doesn't contain tclConfig.sh
>>>>
>>>
>>
>> OK what happens if you readd DEPENDS +=3D =E2=80=9Ctcl=E2=80=9D ?
>> since you have it reproduced may be its best to try it out.
>>
>>
> yup, DEPENDS does the trick, so there might be some issue someplace else.
>
>
thx i will send an update v5 but i wonder why RDEPENDS didnt turn into a
depends may be bitbake issue


> Sau!
>
>
>
>  Sau!
>
>
>
>  Fixed build on multilib and add patch to remove
> !/depot/path/expect -f
> which caused rpm to puke on rfs generation
>
> Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../expect/expect/0001-configure.in.patch          | 108
> ++++++++++++++++
>   .../expect/expect/0002-tcl.m4.patch                |  17 +++
>   .../expect/expect/01-example-shebang.patch         | 144
> +++++++++++++++++++++
>   meta/recipes-devtools/expect/expect_5.45.bb        |  60 +++++++++
>   4 files changed, 329 insertions(+)
>   create mode 100644 meta/recipes-devtools/expect/
> expect/0001-configure.in.patch
>   create mode 100644 meta/recipes-devtools/expect/expect/0002-tcl.m4.patc=
h
>   create mode 100644 meta/recipes-devtools/expect/
> expect/01-example-shebang.patch
>   create mode 100644 meta/recipes-devtools/expect/expect_5.45.bb
>
> diff --git a/meta/recipes-devtools/expect/expect/0001-configure.in.patch
> b/meta/recipes-devtools/expect/expect/0001-configure.in.patch
> new file mode 100644
> index 0000000..7595a25
> --- /dev/null
> +++ b/meta/recipes-devtools/expect/expect/0001-configure.in.patch
> @@ -0,0 +1,108 @@
> +Allow cross compiling.
> +
> +Signed-off-by: Anders Roxell <anders.roxell@enea.com>
> +Upstream-Status: Pending
> +---
> +diff -uNr a/configure.in b/configure.in
> +--- a/configure.in     2012-12-14 15:31:32.623180450 +0100
> ++++ b/configure.in     2012-12-14 15:53:34.518233519 +0100
> +@@ -481,7 +481,7 @@
> + ,
> +       AC_MSG_RESULT(no)
> + ,
> +-      AC_MSG_ERROR([Expect can't be cross compiled])
> ++      AC_MSG_RESULT(no)
> + )
> +
> + AC_MSG_CHECKING([if any value exists for WNOHANG])
> +@@ -506,7 +506,9 @@
> +       AC_MSG_RESULT(no)
> +       AC_DEFINE(WNOHANG_BACKUP_VALUE, 1)
> + ,
> +-      AC_MSG_ERROR([Expect can't be cross compiled])
> ++      AC_MSG_RESULT(yes)
> ++      AC_DEFINE_UNQUOTED(WNOHANG_BACKUP_VALUE, `cat wnohang`)
> ++      rm -f wnohang
> + )
> +
> + #
> +@@ -574,7 +576,8 @@
> +       AC_DEFINE(REARM_SIG)
> + ,
> +       AC_MSG_RESULT(no)
> +-, AC_MSG_WARN([Expect can't be cross compiled])
> ++,
> ++      AC_MSG_RESULT(no)
> + )
> +
> + # HPUX7 has trouble with the big cat so split it
> +@@ -725,7 +728,9 @@
> + ,
> +         AC_MSG_RESULT(no)
> + ,
> +-      AC_MSG_ERROR([Expect can't be cross compiled])
> ++        AC_MSG_RESULT(yes)
> ++        AC_DEFINE(HAVE_SGTTYB)
> ++        PTY_TYPE=3Dsgttyb
> + )
> +
> + # mach systems have include files for unimplemented features
> +@@ -749,7 +754,9 @@
> + ,
> +         AC_MSG_RESULT(no)
> + ,
> +-      AC_MSG_ERROR([Expect can't be cross compiled])
> ++        AC_DEFINE(HAVE_TERMIO)
> ++        PTY_TYPE=3Dtermios
> ++        AC_MSG_RESULT(yes)
> + )
> +
> +   # now check for the new style ttys (not yet posix)
> +@@ -771,7 +778,9 @@
> +   ,
> +         AC_MSG_RESULT(no)
> +   ,
> +-      AC_MSG_ERROR([Expect can't be cross compiled])
> ++        AC_DEFINE(HAVE_TERMIOS)
> ++        PTY_TYPE=3Dtermios
> ++        AC_MSG_RESULT(yes)
> +   )
> + fi
> +
> +@@ -794,7 +803,7 @@
> + ,
> +       AC_MSG_RESULT(no)
> + ,
> +-      AC_MSG_ERROR([Expect can't be cross compiled])
> ++      AC_MSG_RESULT(no)
> + )
> +
> + AC_MSG_CHECKING([if TIOCGWINSZ in termios.h])
> +@@ -816,7 +825,7 @@
> + ,
> +       AC_MSG_RESULT(no)
> + ,
> +-      AC_MSG_ERROR([Expect can't be cross compiled])
> ++      AC_MSG_RESULT(no)
> + )
> +
> + # finally check for Cray style ttys
> +@@ -837,7 +846,7 @@
> + ,
> +       AC_MSG_RESULT(no)
> + ,
> +-      AC_MSG_ERROR([Expect can't be cross compiled])
> ++      AC_MSG_RESULT(no)
> + )
> +
> + #
> +@@ -889,7 +898,8 @@
> +       AC_MSG_RESULT(yes),
> +       AC_MSG_RESULT(no)
> + ,
> +-      AC_MSG_ERROR([Expect can't be cross compiled])
> ++      AC_DEFINE(HAVE_SV_TIMEZONE)
> ++      AC_MSG_RESULT(yes),
> + )
> +
>
>

--047d7b10ca29ea5f1804ea86bd63
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, November 6, 2013, Saul Wold  wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">On 11/05/2013 08:58 PM, Khem Raj wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
On Nov 5, 2013, at 8:35 PM, Saul Wold &lt;<a>sgw@linux.intel.com</a>&gt; wr=
ote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 11/04/2013 07:41 PM, Khem Raj wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Mihaela Sendrea &lt;<a>mihaela.sendrea@enea.com</a>&gt;<br>
<br>
Nedeed for gcc-runtime tests.<br>
<br>
</blockquote>
<br>
i am seeing configure fails with this patch<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
configure:2350: checking for correct TEA configuration<br>
configure:2363: result: ok (TEA 3.9)<br>
configure:2430: configuring expect 5.45<br>
configure:2508: checking for Tcl configuration<br>
configure:2528: error: /srv/ssd/sgw/builds/world/tmp/<u></u>sysroots/generi=
cx86/usr/lib directory doesn&#39;t contain tclConfig.sh<br>
</blockquote></blockquote>
<br>
<br>
OK what happens if you readd DEPENDS +=3D =E2=80=9Ctcl=E2=80=9D ?<br>
since you have it reproduced may be its best to try it out.<br>
<br>
</blockquote>
<br>
yup, DEPENDS does the trick, so there might be some issue someplace else.<b=
r>
<br></blockquote><div><br></div><div>thx i will send an update v5 but i won=
der why RDEPENDS didnt turn into a depends may be bitbake issue</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">

Sau!<br>
<blockquote style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
<br>
<blockquote style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><blockquote style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
<br>
</blockquote>
Sau!<br>
<br>
<br>
<br>
<blockquote style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
Fixed build on multilib and add patch to remove<br>
!/depot/path/expect -f<br>
which caused rpm to puke on rfs generation<br>
<br>
Signed-off-by: Mihaela Sendrea &lt;<a>mihaela.sendrea@enea.com</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a>raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0 .../expect/expect/0001-<u></u>configure.in.patch =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 108 ++++++++++++++++<br>
=C2=A0 .../expect/expect/0002-tcl.m4.<u></u>patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A017 +++<br>
=C2=A0 .../expect/expect/01-example-<u></u>shebang.patch =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 144 +++++++++++++++++++++<br>
=C2=A0 meta/recipes-devtools/expect/<a href=3D"http://expect_5.45.bb" targe=
t=3D"_blank">e<u></u>xpect_5.45.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A06=
0 +++++++++<br>
=C2=A0 4 files changed, 329 insertions(+)<br>
=C2=A0 create mode 100644 meta/recipes-devtools/expect/<u></u>expect/0001-c=
onfigure.in.patch<br>
=C2=A0 create mode 100644 meta/recipes-devtools/expect/<u></u>expect/0002-t=
cl.m4.patch<br>
=C2=A0 create mode 100644 meta/recipes-devtools/expect/<u></u>expect/01-exa=
mple-shebang.<u></u>patch<br>
=C2=A0 create mode 100644 meta/recipes-devtools/expect/<a href=3D"http://ex=
pect_5.45.bb" target=3D"_blank">e<u></u>xpect_5.45.bb</a><br>
<br>
diff --git a/meta/recipes-devtools/<u></u>expect/expect/0001-configure.<u><=
/u>in.patch b/meta/recipes-devtools/<u></u>expect/expect/0001-configure.<u>=
</u>in.patch<br>
new file mode 100644<br>
index 0000000..7595a25<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/<u></u>expect/expect/0001-configure.<u></u>in.p=
atch<br>
@@ -0,0 +1,108 @@<br>
+Allow cross compiling.<br>
+<br>
+Signed-off-by: Anders Roxell &lt;<a>anders.roxell@enea.com</a>&gt;<br>
+Upstream-Status: Pending<br>
+---<br>
+diff -uNr a/<a href=3D"http://configure.in" target=3D"_blank">configure.in=
</a> b/<a href=3D"http://configure.in" target=3D"_blank">configure.in</a><b=
r>
+--- a/<a href=3D"http://configure.in" target=3D"_blank">configure.in</a> =
=C2=A0 =C2=A0 2012-12-14 15:31:32.623180450 +0100<br>
++++ b/<a href=3D"http://configure.in" target=3D"_blank">configure.in</a> =
=C2=A0 =C2=A0 2012-12-14 15:53:34.518233519 +0100<br>
+@@ -481,7 +481,7 @@<br>
+ ,<br>
+ =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT(no)<br>
+ ,<br>
+- =C2=A0 =C2=A0 =C2=A0AC_MSG_ERROR([Expect can&#39;t be cross compiled])<b=
r>
++ =C2=A0 =C2=A0 =C2=A0AC_MSG_RESULT(no)<br>
+ )<br>
+<br>
+ AC_MSG_CHECKING([if any value exists for WNOHANG])<br>
+@@ -506,7 +506,9 @@<br>
+ =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT(no)<br>
+ =C2=A0 =C2=A0 =C2=A0 AC_DEFINE(WNOHANG_BACKUP_<u></u>VALUE, 1)<br>
+ ,<br>
+- =C2=A0 =C2=A0 =C2=A0AC_MSG_ERROR([Expect can&#39;t be cross compiled])<b=
r>
++ =C2=A0 =C2=A0 =C2=A0AC_MSG_RESULT(yes)<br>
++ =C2=A0 =C2=A0 =C2=A0AC_DEFINE_UNQUOTED(WNOHANG_<u></u>BACKUP_VALUE, `cat=
 wnohang`)<br>
++ =C2=A0 =C2=A0 =C2=A0rm -f wnohang<br>
+ )<br>
+<br>
+ #<br>
+@@ -574,7 +576,8 @@<br>
+ =C2=A0 =C2=A0 =C2=A0 AC_DEFINE(REARM_SIG)<br>
+ ,<br>
+ =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT(no)<br>
+-, AC_MSG_WARN([Expect can&#39;t be cross compiled])<br>
++,<br>
++ =C2=A0 =C2=A0 =C2=A0AC_MSG_RESULT(no)<br>
+ )<br>
+<br>
+ # HPUX7 has trouble with the big cat so split it<br>
+@@ -725,7 +728,9 @@<br>
+ ,<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT(no)<br>
+ ,<br>
+- =C2=A0 =C2=A0 =C2=A0AC_MSG_ERROR([Expect can&#39;t be cross compiled])<b=
r>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_MSG_RESULT(yes)<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_DEFINE(HAVE_SGTTYB)<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0PTY_TYPE=3Dsgttyb<br>
+ )<br>
+<br>
+ # mach systems have include files for unimplemented features<br>
+@@ -749,7 +754,9 @@<br>
+ ,<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT(no)<br>
+ ,<br>
+- =C2=A0 =C2=A0 =C2=A0AC_MSG_ERROR([Expect can&#39;t be cross compiled])<b=
r>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_DEFINE(HAVE_TERMIO)<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0PTY_TYPE=3Dtermios<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_MSG_RESULT(yes)<br>
+ )<br>
+<br>
+ =C2=A0 # now check for the new style ttys (not yet posix)<br>
+@@ -771,7 +778,9 @@<br>
+ =C2=A0 ,<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT(no)<br>
+ =C2=A0 ,<br>
+- =C2=A0 =C2=A0 =C2=A0AC_MSG_ERROR([Expect can&#39;t be cross compiled])<b=
r>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_DEFINE(HAVE_TERMIOS)<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0PTY_TYPE=3Dtermios<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_MSG_RESULT(yes)<br>
+ =C2=A0 )<br>
+ fi<br>
+<br>
+@@ -794,7 +803,7 @@<br>
+ ,<br>
+ =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT(no)<br>
+ ,<br>
+- =C2=A0 =C2=A0 =C2=A0AC_MSG_ERROR([Expect can&#39;t be cross compiled])<b=
r>
++ =C2=A0 =C2=A0 =C2=A0AC_MSG_RESULT(no)<br>
+ )<br>
+<br>
+ AC_MSG_CHECKING([if TIOCGWINSZ in termios.h])<br>
+@@ -816,7 +825,7 @@<br>
+ ,<br>
+ =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT(no)<br>
+ ,<br>
+- =C2=A0 =C2=A0 =C2=A0AC_MSG_ERROR([Expect can&#39;t be cross compiled])<b=
r>
++ =C2=A0 =C2=A0 =C2=A0AC_MSG_RESULT(no)<br>
+ )<br>
+<br>
+ # finally check for Cray style ttys<br>
+@@ -837,7 +846,7 @@<br>
+ ,<br>
+ =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT(no)<br>
+ ,<br>
+- =C2=A0 =C2=A0 =C2=A0AC_MSG_ERROR([Expect can&#39;t be cross compiled])<b=
r>
++ =C2=A0 =C2=A0 =C2=A0AC_MSG_RESULT(no)<br>
+ )<br>
+<br>
+ #<br>
+@@ -889,7 +898,8 @@<br>
+ =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT(yes),<br>
+ =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT(no)<br>
+ ,<br>
+- =C2=A0 =C2=A0 =C2=A0AC_MSG_ERROR([Expect can&#39;t be cross compiled])<b=
r>
++ =C2=A0 =C2=A0 =C2=A0AC_DEFINE(HAVE_SV_TIMEZONE)<br>
++ =C2=A0 =C2=A0 =C2=A0AC_MSG_RESULT(yes),<br>
+ )<br>
+<br></blockquote></blockquote></blockquote></blockquote>

--047d7b10ca29ea5f1804ea86bd63--

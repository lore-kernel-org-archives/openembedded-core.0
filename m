Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 644E070018
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 08:14:54 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id f3so5554wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 00:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=MxkQ7/76qZf/iMFgwBwfeFXE5hz8a5tgxPOWDgejbi4=;
	b=PatdWb8IkIQnXkh3B9SORBLhMB8To0l+jDSOJLzdxi0VwycCeBNuS+VvXwFBSTF2N/
	y3N3QgyQLbwVUrm8rzBX51v/kiaKbl122XQ+Sc0R56J/6hVmgezMI/7js8JAilA93Qps
	307hKHKIB2f0tQ10VmFEmT/F9TNJcZlxKMtd6oMNGTgHEUlvt95HlLu7kGWB+kXkCJO0
	gjuw8uPSU7jO5UNwxjlPonBhfUf8wj/i7tLN2B80TBtLOmQeITF9VXmyp42yaqb34zM/
	ccsXr08+op5yrSt/OqqldoT1hQJ9zCxha3wN4AZckYwqMgocoaQPetoNKsxIcB8DNmLd
	Ps2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=MxkQ7/76qZf/iMFgwBwfeFXE5hz8a5tgxPOWDgejbi4=;
	b=auM8YT8VAktRY/lZR6+vyl3bDt/f3B9A/8jBfP+MEFgTH/G+bYknr3DJS7yxGnELps
	7kW8j7YpiBMOekd+gdi/JGrnKuDbDFWc0F+dNthCpMTNhQ/jy3zybVp+xdUSooOnoP5H
	cscHTFmiKZZBR+DEvz0tpedDB/agcxGbFmHMvbaEFc6Eu78nGa7iEdYWHWsQ8ZZ9Kxb5
	FdiAmIBdpQa3EntlmDLlG6bSJx+qS/G0Z0rLkCHq5cH74ittzZNSX9xJDRrtoYAi6FeA
	T11m+iEcJX9yz6KOXXbNLXv+jhCHhnEN7434nAq8jba5ujrpkuH+O0dL3Ddx8LGQhYdU
	Mnow==
X-Gm-Message-State: AKwxyteagGYOzDTMK0SPe59SZHNHr9ENxIrokOZ0SeJV+NJjpE+kmLtY
	fztWtGDH2jBpf/U20wYlnytIOULvUDKFygg+7gE=
X-Google-Smtp-Source: ACJfBos+n7tjdcA6qAOqZBPY2HIdvwM/aH4XIo11XLMPEOdwEyVI5tALm4t+SuI7bBpKKfUEl2k2XtBLeC4qmWQ8baM=
X-Received: by 10.28.17.149 with SMTP id 143mr10353376wmr.96.1516004095067;
	Mon, 15 Jan 2018 00:14:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.122.19 with HTTP; Mon, 15 Jan 2018 00:14:54 -0800 (PST)
In-Reply-To: <1512175057-78-1-git-send-email-Martin.Jansa@gmail.com>
References: <20161018011619.31677-1-raj.khem@gmail.com>
	<1512175057-78-1-git-send-email-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 15 Jan 2018 09:14:54 +0100
Message-ID: <CA+chaQcbgVU+=f5Yg6QrJ0fQyY4LZU3hFAs4L+gw+HVq4sk35w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][RESEND][PATCH] gnutls_3.5.3.bb: Fix native build on distro with kernel < 3.4.17
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
X-List-Received-Date: Mon, 15 Jan 2018 08:14:55 -0000
Content-Type: multipart/alternative; boundary="001a1146dabe908a2f0562cc3568"

--001a1146dabe908a2f0562cc3568
Content-Type: text/plain; charset="UTF-8"

ping

On Sat, Dec 2, 2017 at 1:37 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> From: Khem Raj <raj.khem@gmail.com>
>
> When using distros which use old kernels gnutls fails to build
> due to missing SYS_getrandom, therefore we need to check for this
> before using it.
> Fixes errorr e.g.
>
> | ../../../gnutls-3.5.3/lib/nettle/rnd-linux.c: In function
> 'have_getrandom':
> | ../../../gnutls-3.5.3/lib/nettle/rnd-linux.c:59:42: error:
> 'SYS_getrandom' undeclared (first use in this function)
> |  #  define getrandom(dst,s,flags) syscall(SYS_getrandom, (void*)dst,
> (size_t)s, (unsigned int)flags)
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../gnutls/gnutls/check_SYS_getrandom.patch        | 35
> ++++++++++++++++++++++
>  meta/recipes-support/gnutls/gnutls_3.5.3.bb        |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta/recipes-support/gnutls/
> gnutls/check_SYS_getrandom.patch
>
> diff --git a/meta/recipes-support/gnutls/gnutls/check_SYS_getrandom.patch
> b/meta/recipes-support/gnutls/gnutls/check_SYS_getrandom.patch
> new file mode 100644
> index 0000000..535c22a
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/check_SYS_getrandom.patch
> @@ -0,0 +1,35 @@
> +From f26c3979ab0325edb2e410d287bc501cf00e0ac0 Mon Sep 17 00:00:00 2001
> +From: Nikos Mavrogiannopoulos <nmav@redhat.com>
> +Date: Mon, 22 Aug 2016 16:32:34 +0200
> +Subject: [PATCH] rnd-linux: added check for SYS_getrandom being defined
> +
> +This allows to compile the getrandom() code in old Linux systems
> +which do not have the system call defined.
> +---
> +
> +Upstream-Status: Backport
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> + lib/nettle/rnd-linux.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/nettle/rnd-linux.c b/lib/nettle/rnd-linux.c
> +index d7f07a6..7a24d05 100644
> +--- a/lib/nettle/rnd-linux.c
> ++++ b/lib/nettle/rnd-linux.c
> +@@ -56,7 +56,11 @@ static dev_t _gnutls_urandom_fd_rdev = 0;
> + # else
> + #  include <sys/syscall.h>
> + #  undef getrandom
> +-#  define getrandom(dst,s,flags) syscall(SYS_getrandom, (void*)dst,
> (size_t)s, (unsigned int)flags)
> ++#  if defined(SYS_getrandom)
> ++#   define getrandom(dst,s,flags) syscall(SYS_getrandom, (void*)dst,
> (size_t)s, (unsigned int)flags)
> ++#  else
> ++#   define getrandom(dst,s,flags) -1
> ++#  endif
> + # endif
> +
> + static unsigned have_getrandom(void)
> +--
> +libgit2 0.24.0
> +
> diff --git a/meta/recipes-support/gnutls/gnutls_3.5.3.bb
> b/meta/recipes-support/gnutls/gnutls_3.5.3.bb
> index b2dbb07..0400588 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.5.3.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.5.3.bb
> @@ -4,6 +4,7 @@ SRC_URI += "file://correct_rpl_gettimeofday_signature.patch
> \
>              file://0001-configure.ac-fix-sed-command.patch \
>              file://use-pkg-config-to-locate-zlib.patch \
>              file://0001-Use-correct-include-dir-with-minitasn.patch \
> +            file://check_SYS_getrandom.patch \
>              file://CVE-2016-7444.patch \
>             "
>  SRC_URI[md5sum] = "6c2c7f40ddf52933ee3ca474cb8cb63c"
> --
> 2.7.4
>
>

--001a1146dabe908a2f0562cc3568
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping</div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Sat, Dec 2, 2017 at 1:37 AM, Martin Jansa <span dir=3D"ltr">&l=
t;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@=
gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Kh=
em Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;=
<br>
<br>
When using distros which use old kernels gnutls fails to build<br>
due to missing SYS_getrandom, therefore we need to check for this<br>
before using it.<br>
Fixes errorr e.g.<br>
<br>
| ../../../gnutls-3.5.3/lib/<wbr>nettle/rnd-linux.c: In function &#39;have_=
getrandom&#39;:<br>
| ../../../gnutls-3.5.3/lib/<wbr>nettle/rnd-linux.c:59:42: error: &#39;SYS_=
getrandom&#39; undeclared (first use in this function)<br>
|=C2=A0 #=C2=A0 define getrandom(dst,s,flags) syscall(SYS_getrandom, (void*=
)dst, (size_t)s, (unsigned int)flags)<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">M=
artin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../gnutls/gnutls/check_SYS_<wbr>getrandom.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 35 ++++++++++++++++++++++<br>
=C2=A0meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.5.3.bb" rel=3D=
"noreferrer" target=3D"_blank">gn<wbr>utls_3.5.3.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 36 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/gnutls/<wbr>gnutls/check_SYS_=
getrandom.<wbr>patch<br>
<br>
diff --git a/meta/recipes-support/gnutls/<wbr>gnutls/check_SYS_getrandom.<w=
br>patch b/meta/recipes-support/gnutls/<wbr>gnutls/check_SYS_getrandom.<wbr=
>patch<br>
new file mode 100644<br>
index 0000000..535c22a<br>
--- /dev/null<br>
+++ b/meta/recipes-support/gnutls/<wbr>gnutls/check_SYS_getrandom.<wbr>patc=
h<br>
@@ -0,0 +1,35 @@<br>
+From f26c3979ab0325edb2e410d287bc50<wbr>1cf00e0ac0 Mon Sep 17 00:00:00 200=
1<br>
+From: Nikos Mavrogiannopoulos &lt;<a href=3D"mailto:nmav@redhat.com">nmav@=
redhat.com</a>&gt;<br>
+Date: Mon, 22 Aug 2016 16:32:34 +0200<br>
+Subject: [PATCH] rnd-linux: added check for SYS_getrandom being defined<br=
>
+<br>
+This allows to compile the getrandom() code in old Linux systems<br>
+which do not have the system call defined.<br>
+---<br>
+<br>
+Upstream-Status: Backport<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
+<br>
+ lib/nettle/rnd-linux.c | 6 +++++-<br>
+ 1 file changed, 5 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/lib/nettle/rnd-linux.c b/lib/nettle/rnd-linux.c<br>
+index d7f07a6..7a24d05 100644<br>
+--- a/lib/nettle/rnd-linux.c<br>
++++ b/lib/nettle/rnd-linux.c<br>
+@@ -56,7 +56,11 @@ static dev_t _gnutls_urandom_fd_rdev =3D 0;<br>
+ # else<br>
+ #=C2=A0 include &lt;sys/syscall.h&gt;<br>
+ #=C2=A0 undef getrandom<br>
+-#=C2=A0 define getrandom(dst,s,flags) syscall(SYS_getrandom, (void*)dst, =
(size_t)s, (unsigned int)flags)<br>
++#=C2=A0 if defined(SYS_getrandom)<br>
++#=C2=A0 =C2=A0define getrandom(dst,s,flags) syscall(SYS_getrandom, (void*=
)dst, (size_t)s, (unsigned int)flags)<br>
++#=C2=A0 else<br>
++#=C2=A0 =C2=A0define getrandom(dst,s,flags) -1<br>
++#=C2=A0 endif<br>
+ # endif<br>
+<br>
+ static unsigned have_getrandom(void)<br>
+--<br>
+libgit2 0.24.0<br>
+<br>
diff --git a/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.5.3.bb"=
 rel=3D"noreferrer" target=3D"_blank"><wbr>gnutls_3.5.3.bb</a> b/meta/recip=
es-support/gnutls/<a href=3D"http://gnutls_3.5.3.bb" rel=3D"noreferrer" tar=
get=3D"_blank"><wbr>gnutls_3.5.3.bb</a><br>
index b2dbb07..0400588 100644<br>
--- a/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.5.3.bb" rel=3D=
"noreferrer" target=3D"_blank"><wbr>gnutls_3.5.3.bb</a><br>
+++ b/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.5.3.bb" rel=3D=
"noreferrer" target=3D"_blank"><wbr>gnutls_3.5.3.bb</a><br>
@@ -4,6 +4,7 @@ SRC_URI +=3D &quot;file://correct_rpl_<wbr>gettimeofday_sig=
nature.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.ac-fi=
x-<wbr>sed-command.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://use-pkg-config-to-<w=
br>locate-zlib.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Use-correct-<wb=
r>include-dir-with-minitasn.<wbr>patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://check_SYS_getrandom.<wbr>=
patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2016-7444.patch =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>6c2c7f40ddf52933ee3ca474cb8cb6<wbr>3c&=
quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br></div>

--001a1146dabe908a2f0562cc3568--

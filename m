Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 034836B6EA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 10:26:25 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id t22so9124585ioa.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Feb 2018 02:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8qaVGbdKXcWmqjkCevQrvzsrZ/JJy3BdyXgoWeJe4w8=;
	b=VpZf1cLzYhJ0oXJbDy6rkoFBv8DER6s3j9nsAvZrN8cjn1k3+wJ6eAx5jyu+13emdO
	hfRmpXcDFLQY77iYoBv38HTi2Fcrn23aqqSwQkmMypopwnyQ8vzYAqIBfUVCtBFASgCw
	tfUKMhhAVsEJ7/5JsIViiICOhi6vzzmodqiByJh0bQSswNbfkihc8iI6hsx96bGH3IRk
	woHtWMT2jEqmB906L9fQ7aUVzJr5sJkQdlHxieQk/8GykGHgrk2+4hjdFKBHb1fV63xp
	Acjb7vHfHVFWTA1Q68hzSAiMBU8F8hM3+QQcpRcKACwlN+ntmDdQgcSwZ3pSojkqDV76
	GuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8qaVGbdKXcWmqjkCevQrvzsrZ/JJy3BdyXgoWeJe4w8=;
	b=WaXR0xItUbdt3dzQLSGeispx4p39hHqr5SeoCrYV23ImGEen8tpj71t/p2h58LdEgB
	t18in4/yX5VvHxSEUkBVrhRptNjzmDMpRx45rAPnu1BYrCXcN5XVwcv4nAxh74DtzKqU
	xDsItcvw68SnrbPXyj4p5ud0tqKBpJfgBAwDH/lyJ5blAS/INdbtz5pYMtjCHieCiYrL
	7wK1htifrQLOOIWTh3u2bnV/o84CV2PFGEpqrNQijwDqe9T6c8oRiw+IqNQlspP0CIn/
	m42vnv8McOxAIphGZxAnxSYdcLy3ME3/NLpvyAclmGw0nmV/GqTWyb6QFd8e/KCdYJLE
	cVew==
X-Gm-Message-State: APf1xPDkWjx9sUW4A0BZxKSDdAEYzffaE7Vbg75B22Z29Hg8d7a6Wapn
	N4VFEoM3zqWPcuL7Mx0XD4RP175tHIHeCOr4MmvEzQ==
X-Google-Smtp-Source: AH8x226sWW/ESVWkmvfHuahUSLGys4cDQxkoIGNYDrspky4vK3GU/c/WxrkyzC507fy6FyjW/Z+xhXq+GRIwQpoYHsI=
X-Received: by 10.107.32.19 with SMTP id g19mr2400936iog.217.1518171986903;
	Fri, 09 Feb 2018 02:26:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Fri, 9 Feb 2018 02:26:06 -0800 (PST)
In-Reply-To: <1518111299-21765-1-git-send-email-anders.roxell@linaro.org>
References: <1518111299-21765-1-git-send-email-anders.roxell@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Feb 2018 10:26:06 +0000
Message-ID: <CAJTo0LZ+H+usAY7s+XXBFs+EQdNJwvBrc5KRbbPoLFh-df9ouA@mail.gmail.com>
To: Anders Roxell <anders.roxell@linaro.org>, Yi Zhao <yi.zhao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: fix knob to control numa support
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
X-List-Received-Date: Fri, 09 Feb 2018 10:26:26 -0000
Content-Type: multipart/alternative; boundary="001a1141a2a4fcdaa10564c4f59b"

--001a1141a2a4fcdaa10564c4f59b
Content-Type: text/plain; charset="UTF-8"

There's now two patches which do this on the list, can you decide which one
should be merged?

Cheers,
Ross

On 8 February 2018 at 17:34, Anders Roxell <anders.roxell@linaro.org> wrote:

> Reported-by: Yi Zhao <yi.zhao@windriver.com>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  ...ix-default-value-of-without-numa-switch-i.patch | 31 ++++++++++++++
>  ...onfigure-add-knob-to-control-numa-support.patch | 50
> ++++++++++++++++++++++
>  ...-control-whether-numa-support-should-be-c.patch | 45
> -------------------
>  meta/recipes-extended/ltp/ltp_20180118.bb          |  3 +-
>  4 files changed, 83 insertions(+), 46 deletions(-)
>  create mode 100644 meta/recipes-extended/ltp/ltp/
> 0001-configure-Fix-default-value-of-without-numa-switch-i.patch
>  create mode 100644 meta/recipes-extended/ltp/ltp/
> 0001-configure-add-knob-to-control-numa-support.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/
> 0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
>
> diff --git a/meta/recipes-extended/ltp/ltp/0001-configure-Fix-
> default-value-of-without-numa-switch-i.patch b/meta/recipes-extended/ltp/
> ltp/0001-configure-Fix-default-value-of-without-numa-switch-i.patch
> new file mode 100644
> index 0000000..da62687
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0001-configure-Fix-
> default-value-of-without-numa-switch-i.patch
> @@ -0,0 +1,31 @@
> +From 4ace68a6ba501907a0741dba5f5f155e06a74c35 Mon Sep 17 00:00:00 2001
> +From: Petr Vorel <pvorel@suse.cz>
> +Date: Wed, 7 Feb 2018 11:09:49 +0100
> +Subject: [PATCH] configure: Fix default value of --without-numa switch in
> help
> +
> +The default value is no.
> +
> +Fixes: 39a85a1f1 ("configure: add knob to control numa support")
> +
> +Signed-off-by: Petr Vorel <pvorel@suse.cz>
> +Upstream-Status: Accepted
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index b39a31d..d66ea00 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -86,7 +86,7 @@ fi
> + # Numa
> + AC_ARG_WITH([numa],
> +   AC_HELP_STRING([--without-numa],
> +-    [without numa support (default=yes)]),
> ++    [without numa support (default=no)]),
> +   [with_numa=no],
> +   [with_numa=yes]
> + )
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-extended/ltp/ltp/0001-configure-add-knob-to-control-numa-support.patch
> b/meta/recipes-extended/ltp/ltp/0001-configure-add-knob-
> to-control-numa-support.patch
> new file mode 100644
> index 0000000..8aaa287
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0001-configure-add-knob-
> to-control-numa-support.patch
> @@ -0,0 +1,50 @@
> +From 39a85a1f1e6624f554215ba4b6843d3689a8415e Mon Sep 17 00:00:00 2001
> +From: Anders Roxell <anders.roxell@linaro.org>
> +Date: Mon, 5 Feb 2018 11:56:04 +0100
> +Subject: [PATCH] configure: add knob to control numa support
> +
> +Allow to disable numa from the top level.
> +
> +Based on patch:
> +http://cgit.openembedded.org/openembedded-core/commit/meta/
> recipes-extended/ltp?id=4c7873552e13dfdba96afca7562c398d2966ca71
> +
> +Reported-by: Roy Li <rongqing.li@windriver.com>
> +Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> +Signed-off-by: Petr Vorel <pvorel@suse.cz>
> +Upstream-Status: Accepted
> +---
> + configure.ac | 10 ++++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 5c8d4ea..b39a31d 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -83,6 +83,14 @@ else
> +     AC_SUBST([WITH_EXPECT],["no"])
> + fi
> +
> ++# Numa
> ++AC_ARG_WITH([numa],
> ++  AC_HELP_STRING([--without-numa],
> ++    [without numa support (default=yes)]),
> ++  [with_numa=no],
> ++  [with_numa=yes]
> ++)
> ++
> + # Perl
> + AC_ARG_WITH([perl],
> +   [AC_HELP_STRING([--with-perl],
> +@@ -157,7 +165,9 @@ LTP_CHECK_SELINUX
> + LTP_CHECK_SIGNAL
> + LTP_CHECK_SYSCALL_EVENTFD
> + LTP_CHECK_SYSCALL_MODIFY_LDT
> ++if test "x$with_numa" = xyes; then
> + LTP_CHECK_SYSCALL_NUMA
> ++fi
> + LTP_CHECK_SYSCALL_QUOTACTL
> + LTP_CHECK_SYSCALL_SIGNALFD
> + LTP_CHECK_SYSCALL_UNSHARE
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-
> whether-numa-support-should-be-c.patch b/meta/recipes-extended/ltp/
> ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
> deleted file mode 100644
> index 31460b9..0000000
> --- a/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-
> whether-numa-support-should-be-c.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From 867ad5d5d64b9b27ee32148027532db0a00f6433 Mon Sep 17 00:00:00 2001
> -From: "Roy.Li" <rongqing.li@windriver.com>
> -Date: Thu, 7 Jan 2016 17:33:26 +0000
> -Subject: [PATCH 02/32] Add knob to control whether numa support should be
> - checked
> -
> -otherwise undeterministic dependency will be generated
> -during build depending upong numa being staged or not
> -
> -Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> -Upstream-Status: Pending
> ----
> - m4/ltp-numa.m4 | 10 +++++++++-
> - 1 file changed, 9 insertions(+), 1 deletion(-)
> -
> -diff --git a/m4/ltp-numa.m4 b/m4/ltp-numa.m4
> -index fc3383e..44cb559 100644
> ---- a/m4/ltp-numa.m4
> -+++ b/m4/ltp-numa.m4
> -@@ -24,7 +24,13 @@ dnl LTP_CHECK_SYSCALL_NUMA
> - dnl ----------------------------
> - dnl
> - AC_DEFUN([LTP_CHECK_SYSCALL_NUMA], [
> --      AC_CHECK_LIB(numa, numa_available, [have_libnuma=yes])
> -+      AC_MSG_CHECKING([for numa])
> -+      AC_ARG_WITH(
> -+              [numa],
> -+              AC_HELP_STRING([--without-numa],
> -+              [without numa support]),
> -+              [],
> -+      [AC_CHECK_LIB(numa, numa_available, [have_libnuma=yes])
> -       AC_CHECK_HEADERS([numa.h numaif.h], [], [have_numa_headers=no])
> -
> -       if test "x$have_numa_headers" != "xno"; then
> -@@ -42,3 +48,5 @@ exit(1);
> -               AC_DEFINE(HAVE_NUMA_V2, 1, [Define to 1 if you have
> libnuma and it's headers version >= 2 installed.])
> -       fi
> - ])
> -+AC_MSG_RESULT([$with_numa])
> -+])
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp_20180118.bb
> b/meta/recipes-extended/ltp/ltp_20180118.bb
> index 369b98d..a0dd9aa 100644
> --- a/meta/recipes-extended/ltp/ltp_20180118.bb
> +++ b/meta/recipes-extended/ltp/ltp_20180118.bb
> @@ -24,7 +24,8 @@ CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
>  SRCREV = "731cd34e682d297b207668be8b1d15320a9ac1b1"
>
>  SRC_URI = "git://github.com/linux-test-project/ltp.git \
> -           file://0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
> \
> +           file://0001-configure-add-knob-to-control-numa-support.patch \
> +           file://0001-configure-Fix-default-value-of-without-numa-switch-i.patch
> \
>             file://0003-Add-knob-to-control-tirpc-support.patch \
>             file://0004-build-Add-option-to-select-libc-implementation.patch
> \
>             file://0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
> \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141a2a4fcdaa10564c4f59b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There&#39;s now two patches which do this on the list, can=
 you decide which one should be merged?<div><br></div><div>Cheers,</div><di=
v>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On 8 February 2018 at 17:34, Anders Roxell <span dir=3D"ltr">&lt;<a href=
=3D"mailto:anders.roxell@linaro.org" target=3D"_blank">anders.roxell@linaro=
.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Reported-by: Y=
i Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com">yi.zhao@windriver.com</=
a>&gt;<br>
Signed-off-by: Anders Roxell &lt;<a href=3D"mailto:anders.roxell@linaro.org=
">anders.roxell@linaro.org</a>&gt;<br>
---<br>
=C2=A0...ix-default-value-of-<wbr>without-numa-switch-i.patch | 31 ++++++++=
++++++<br>
=C2=A0...onfigure-add-knob-to-<wbr>control-numa-support.patch | 50 ++++++++=
++++++++++++++<br>
=C2=A0...-control-whether-numa-<wbr>support-should-be-c.patch | 45 --------=
-----------<br>
=C2=A0meta/recipes-extended/ltp/<a href=3D"http://ltp_20180118.bb" rel=3D"n=
oreferrer" target=3D"_blank">ltp_<wbr>20180118.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 3 +-<br>
=C2=A04 files changed, 83 insertions(+), 46 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0001-configure-=
Fix-default-<wbr>value-of-without-numa-switch-<wbr>i.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0001-configure-=
add-knob-to-<wbr>control-numa-support.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0002-Add-knob-t=
o-control-<wbr>whether-numa-support-should-<wbr>be-c.patch<br>
<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0001-configure-Fix-<wbr>def=
ault-value-of-without-numa-<wbr>switch-i.patch b/meta/recipes-extended/ltp/=
<wbr>ltp/0001-configure-Fix-<wbr>default-value-of-without-numa-<wbr>switch-=
i.patch<br>
new file mode 100644<br>
index 0000000..da62687<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/ltp/<wbr>ltp/0001-configure-Fix-<wbr>default-va=
lue-of-without-numa-<wbr>switch-i.patch<br>
@@ -0,0 +1,31 @@<br>
+From 4ace68a6ba501907a0741dba5f5f15<wbr>5e06a74c35 Mon Sep 17 00:00:00 200=
1<br>
+From: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&=
gt;<br>
+Date: Wed, 7 Feb 2018 11:09:49 +0100<br>
+Subject: [PATCH] configure: Fix default value of --without-numa switch in =
help<br>
+<br>
+The default value is no.<br>
+<br>
+Fixes: 39a85a1f1 (&quot;configure: add knob to control numa support&quot;)=
<br>
+<br>
+Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz">pvorel@sus=
e.cz</a>&gt;<br>
+Upstream-Status: Accepted<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index b39a31d..d66ea00 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -86,7 +86,7 @@ fi<br>
+ # Numa<br>
+ AC_ARG_WITH([numa],<br>
+=C2=A0 =C2=A0AC_HELP_STRING([--without-<wbr>numa],<br>
+-=C2=A0 =C2=A0 [without numa support (default=3Dyes)]),<br>
++=C2=A0 =C2=A0 [without numa support (default=3Dno)]),<br>
+=C2=A0 =C2=A0[with_numa=3Dno],<br>
+=C2=A0 =C2=A0[with_numa=3Dyes]<br>
+ )<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0001-configure-add-knob-<wb=
r>to-control-numa-support.patch b/meta/recipes-extended/ltp/<wbr>ltp/0001-c=
onfigure-add-knob-<wbr>to-control-numa-support.patch<br>
new file mode 100644<br>
index 0000000..8aaa287<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/ltp/<wbr>ltp/0001-configure-add-knob-<wbr>to-co=
ntrol-numa-support.patch<br>
@@ -0,0 +1,50 @@<br>
+From 39a85a1f1e6624f554215ba4b6843d<wbr>3689a8415e Mon Sep 17 00:00:00 200=
1<br>
+From: Anders Roxell &lt;<a href=3D"mailto:anders.roxell@linaro.org">anders=
.roxell@linaro.org</a>&gt;<br>
+Date: Mon, 5 Feb 2018 11:56:04 +0100<br>
+Subject: [PATCH] configure: add knob to control numa support<br>
+<br>
+Allow to disable numa from the top level.<br>
+<br>
+Based on patch:<br>
+<a href=3D"http://cgit.openembedded.org/openembedded-core/commit/meta/reci=
pes-extended/ltp?id=3D4c7873552e13dfdba96afca7562c398d2966ca71" rel=3D"nore=
ferrer" target=3D"_blank">http://cgit.openembedded.org/<wbr>openembedded-co=
re/commit/meta/<wbr>recipes-extended/ltp?id=3D<wbr>4c7873552e13dfdba96afca7=
562c39<wbr>8d2966ca71</a><br>
+<br>
+Reported-by: Roy Li &lt;<a href=3D"mailto:rongqing.li@windriver.com">rongq=
ing.li@windriver.com</a>&gt;<br>
+Signed-off-by: Anders Roxell &lt;<a href=3D"mailto:anders.roxell@linaro.or=
g">anders.roxell@linaro.org</a>&gt;<br>
+Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz">pvorel@sus=
e.cz</a>&gt;<br>
+Upstream-Status: Accepted<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 10 ++++++++++<br>
+ 1 file changed, 10 insertions(+)<br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index 5c8d4ea..b39a31d 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -83,6 +83,14 @@ else<br>
+=C2=A0 =C2=A0 =C2=A0AC_SUBST([WITH_EXPECT],[&quot;no&quot;])<br>
+ fi<br>
+<br>
++# Numa<br>
++AC_ARG_WITH([numa],<br>
++=C2=A0 AC_HELP_STRING([--without-<wbr>numa],<br>
++=C2=A0 =C2=A0 [without numa support (default=3Dyes)]),<br>
++=C2=A0 [with_numa=3Dno],<br>
++=C2=A0 [with_numa=3Dyes]<br>
++)<br>
++<br>
+ # Perl<br>
+ AC_ARG_WITH([perl],<br>
+=C2=A0 =C2=A0[AC_HELP_STRING([--with-perl],<br>
+@@ -157,7 +165,9 @@ LTP_CHECK_SELINUX<br>
+ LTP_CHECK_SIGNAL<br>
+ LTP_CHECK_SYSCALL_EVENTFD<br>
+ LTP_CHECK_SYSCALL_MODIFY_LDT<br>
++if test &quot;x$with_numa&quot; =3D xyes; then<br>
+ LTP_CHECK_SYSCALL_NUMA<br>
++fi<br>
+ LTP_CHECK_SYSCALL_QUOTACTL<br>
+ LTP_CHECK_SYSCALL_SIGNALFD<br>
+ LTP_CHECK_SYSCALL_UNSHARE<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0002-Add-knob-to-control-<w=
br>whether-numa-support-should-<wbr>be-c.patch b/meta/recipes-extended/ltp/=
<wbr>ltp/0002-Add-knob-to-control-<wbr>whether-numa-support-should-<wbr>be-=
c.patch<br>
deleted file mode 100644<br>
index 31460b9..0000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0002-Add-knob-to-control-<wbr>whet=
her-numa-support-should-<wbr>be-c.patch<br>
+++ /dev/null<br>
@@ -1,45 +0,0 @@<br>
-From 867ad5d5d64b9b27ee32148027532d<wbr>b0a00f6433 Mon Sep 17 00:00:00 200=
1<br>
-From: &quot;Roy.Li&quot; &lt;<a href=3D"mailto:rongqing.li@windriver.com">=
rongqing.li@windriver.com</a>&gt;<br>
-Date: Thu, 7 Jan 2016 17:33:26 +0000<br>
-Subject: [PATCH 02/32] Add knob to control whether numa support should be<=
br>
- checked<br>
-<br>
-otherwise undeterministic dependency will be generated<br>
-during build depending upong numa being staged or not<br>
-<br>
-Signed-off-by: Roy.Li &lt;<a href=3D"mailto:rongqing.li@windriver.com">ron=
gqing.li@windriver.com</a>&gt;<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
-Signed-off-by: Anders Roxell &lt;<a href=3D"mailto:anders.roxell@linaro.or=
g">anders.roxell@linaro.org</a>&gt;<br>
-Upstream-Status: Pending<br>
----<br>
- m4/ltp-numa.m4 | 10 +++++++++-<br>
- 1 file changed, 9 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/m4/ltp-numa.m4 b/m4/ltp-numa.m4<br>
-index fc3383e..44cb559 100644<br>
---- a/m4/ltp-numa.m4<br>
-+++ b/m4/ltp-numa.m4<br>
-@@ -24,7 +24,13 @@ dnl LTP_CHECK_SYSCALL_NUMA<br>
- dnl ----------------------------<br>
- dnl<br>
- AC_DEFUN([LTP_CHECK_SYSCALL_<wbr>NUMA], [<br>
--=C2=A0 =C2=A0 =C2=A0 AC_CHECK_LIB(numa, numa_available, [have_libnuma=3Dy=
es])<br>
-+=C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING([for numa])<br>
-+=C2=A0 =C2=A0 =C2=A0 AC_ARG_WITH(<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [numa],<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_HELP_STRING([--withou=
t-<wbr>numa],<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [without numa support]),=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [],<br>
-+=C2=A0 =C2=A0 =C2=A0 [AC_CHECK_LIB(numa, numa_available, [have_libnuma=3D=
yes])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_CHECK_HEADERS([numa.h numaif.h], [], [have_n=
uma_headers=3Dno])<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;x$have_numa_headers&quot; !=3D &q=
uot;xno&quot;; then<br>
-@@ -42,3 +48,5 @@ exit(1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_DEFINE(HAVE_NUMA=
_V2, 1, [Define to 1 if you have libnuma and it&#39;s headers version &gt;=
=3D 2 installed.])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
- ])<br>
-+AC_MSG_RESULT([$with_numa])<br>
-+])<br>
---<br>
-2.7.0<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20180118.bb" r=
el=3D"noreferrer" target=3D"_blank">lt<wbr>p_20180118.bb</a> b/meta/recipes=
-extended/ltp/<a href=3D"http://ltp_20180118.bb" rel=3D"noreferrer" target=
=3D"_blank">lt<wbr>p_20180118.bb</a><br>
index 369b98d..a0dd9aa 100644<br>
--- a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20180118.bb" rel=3D"n=
oreferrer" target=3D"_blank">lt<wbr>p_20180118.bb</a><br>
+++ b/meta/recipes-extended/ltp/<a href=3D"http://ltp_20180118.bb" rel=3D"n=
oreferrer" target=3D"_blank">lt<wbr>p_20180118.bb</a><br>
@@ -24,7 +24,8 @@ CFLAGS_append_mipsarchn64 =3D &quot; -D__SANE_USERSPACE_T=
YPES__&quot;<br>
=C2=A0SRCREV =3D &quot;<wbr>731cd34e682d297b207668be8b1d15<wbr>320a9ac1b1&q=
uot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/linux-test-proje=
ct/ltp.git" rel=3D"noreferrer" target=3D"_blank">github.com/linux-test-<wbr=
>project/ltp.git</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Add-knob-to-<wbr>cont=
rol-whether-numa-support-<wbr>should-be-c.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure-add-<wbr>kn=
ob-to-control-numa-support.<wbr>patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure-Fix-<wbr>de=
fault-value-of-without-numa-<wbr>switch-i.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-Add-knob-to-<wbr>cont=
rol-tirpc-support.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-build-Add-option-<wbr=
>to-select-libc-implementation.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-kernel-<wbr>controlle=
rs-Link-with-libfts-<wbr>explicitly-on-mu.patch \<br>
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

--001a1141a2a4fcdaa10564c4f59b--

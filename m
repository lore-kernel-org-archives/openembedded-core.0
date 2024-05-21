Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26723C25B7C
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 15:20:56 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.22489.1716304854846590952
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 08:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cfqgPg/7;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51f1bf83f06so6746818e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 08:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716304853; x=1716909653; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0ptrQaaleGaL5agDIYaYyUtotaKs21fPOiu/gybLjPw=;
        b=cfqgPg/76TjrMoQzwDXtN6YmOcLu7fvtNkXKxFZpsm5lCpSWNIcogRf8IMKQjLukMo
         kWzHzpusdS0skMeo9QQuxlLrVr/5GQQXn2BBFlmGQbjLxJCOy1G9u5m+/ChdrjWqYPwW
         NO0xzefPe5r9WpiOOvGNw16PvipQr3ZxjNUzT/znS5VoIQ79n/ObFfbPItOqDCkEUvEp
         WYguw/KyYtc4NDtJilE+AOBBNPyW1Sz3jHJvAoQklQMxSDvluTSd0Ord1oRUHQjOJXYq
         f3rPyQ9zhuP5rOpwMjpSlt8xWoO6fI6T9F3ozDs4mdebhs7m3QNfXzZVXWrLkcw+I4kd
         FFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716304853; x=1716909653;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ptrQaaleGaL5agDIYaYyUtotaKs21fPOiu/gybLjPw=;
        b=AONBUOo43Vq7SHYRcdgSNEaonoPFMuM0JIWA0AolzEnWXq6C0cFNyJHZfqNaVpFhZ/
         5ZTinUfmfuqbI9pVl9OU5tWeYiFl1KBXmBAcpmhnKb3f/mM50RI9CL5uwNiLkIcVLFG1
         6QQ81S3+QiwrcfjIgO8KMwFiJydYiFmdnDPg+21iEgk2ostJOWaWdS7qJwuD3sPMrTy4
         JXgy2pmmAvzGfbFZYdMCec87Be8oUB9DEn3P0mhSkQfcDqOQKyRE7f8A4dsiiZvZ05w6
         qvy4xW1hKoSbnLR5ibcKFRCB4nwR/feaIPlLV8LL/UhXWg51QYxVxicn0UrOEXR0RY8r
         SrUQ==
X-Gm-Message-State: AOJu0YweE/8IIud3s/jfbNxNgZSaQm7VEoISnPNNafA9Nyid/HK3Y17k
	Mcv/YmPzOmwbJ9rbWrTjaZgQmXFLsOrtV4t/tUCW5EWP0OOPKOfq0M0TVX3Fkz8hMiYnvTr+Gnh
	A0kuuZX4SQINPznhriDCc/wvYhFdMKA==
X-Google-Smtp-Source: AGHT+IHzN1aDxmpnX6yAD71t9PXuOigOXoVSNSvMKt3ZeiQUJoIhTGeDK/wqkaFDafA9vgXq6toKJOjuOMN6qKyWI5Q=
X-Received: by 2002:a05:6512:31ce:b0:523:af41:ad45 with SMTP id
 2adb3069b0e04-523af41b0b9mr13045284e87.54.1716304852728; Tue, 21 May 2024
 08:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240521151739.591124-1-ross.burton@arm.com>
In-Reply-To: <20240521151739.591124-1-ross.burton@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 May 2024 17:20:41 +0200
Message-ID: <CANNYZj8=LLz0syzkuSAO5mnBpMkt2wmtsFDBMX2MtRqnoVn1Rg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gawk: fix readline detection
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000012c3390618f85d53"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 15:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199651

--00000000000012c3390618f85d53
Content-Type: text/plain; charset="UTF-8"

Please include a link to the submission.

Alex

On Tue 21. May 2024 at 17.17, Ross Burton via lists.openembedded.org
<ross.burton=arm.com@lists.openembedded.org> wrote:

> The code fragment used to detect readline in cross builds doesn't compile
> cleanly with GCC 14.1, so readline is never enabled.
>
> Add missing includes so the test works, and readline can be enabled.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...001-m4-readline-add-missing-includes.patch | 38 +++++++++++++++++++
>  meta/recipes-extended/gawk/gawk_5.3.0.bb      |  1 +
>  2 files changed, 39 insertions(+)
>  create mode 100644
> meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch
>
> diff --git
> a/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch
> b/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch
> new file mode 100644
> index 00000000000..97edf1ccf8c
> --- /dev/null
> +++
> b/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch
> @@ -0,0 +1,38 @@
> +From 4f4e84f139e2a8682f1374a592f2636c43ad857b Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
> +Date: Tue, 21 May 2024 15:10:11 +0000
> +Subject: [PATCH] m4/readline: add missing includes
> +
> +The cross-specific code fragment only includes stdio.h, where the native
> +fragment also includes fcntl.h and unistd.h.  This is important because
> +GCC 14.1 has made the implicit definitions an error:
> +
> +conftest.c: In function 'main':
> +conftest.c:144:9: error: implicit declaration of function 'close'; did
> you mean 'pclose'? [-Wimplicit-function-declaration]
> +conftest.c:146:14: error: implicit declaration of function 'open'; did
> you mean 'popen'? [-Wimplicit-function-declaration]
> +
> +Add the missing includes so that the check doesn't always fail due to
> +these errors.
> +
> +Upstream-Status: Submitted
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +---
> + m4/readline.m4 | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/m4/readline.m4 b/m4/readline.m4
> +index 38f96326..efd52d4e 100644
> +--- a/m4/readline.m4
> ++++ b/m4/readline.m4
> +@@ -66,6 +66,8 @@ dnl action if false:
> + dnl action if cross compiling:
> +               [AC_LINK_IFELSE(
> +                       [AC_LANG_PROGRAM([[#include <stdio.h>
> ++#include <fcntl.h>
> ++#include <unistd.h>
> + #include <readline/readline.h>
> + #include <readline/history.h>]],              dnl includes
> +                       dnl function body
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb
> b/meta/recipes-extended/gawk/gawk_5.3.0.bb
> index d7a0fc616d3..e94cf19db48 100644
> --- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
> +++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
> @@ -16,6 +16,7 @@ PACKAGECONFIG[readline] =
> "--with-readline,--without-readline,readline"
>  PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
>
>  SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
> +           file://0001-m4-readline-add-missing-includes.patch \
>             file://run-ptest \
>             "
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199648):
> https://lists.openembedded.org/g/openembedded-core/message/199648
> Mute This Topic: https://lists.openembedded.org/mt/106225075/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000012c3390618f85d53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please include a link to the submission.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue 21. May 2024 at 17.17, R=
oss Burton via <a href=3D"http://lists.openembedded.org">lists.openembedded=
.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.org=
">arm.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=
The code fragment used to detect readline in cross builds doesn&#39;t compi=
le<br>
cleanly with GCC 14.1, so readline is never enabled.<br>
<br>
Add missing includes so the test works, and readline can be enabled.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0...001-m4-readline-add-missing-includes.patch | 38 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-extended/gawk/<a href=3D"http://gawk_5.3.0.bb" rel=3D"no=
referrer" target=3D"_blank">gawk_5.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1=
 +<br>
=C2=A02 files changed, 39 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-extended/gawk/gawk/0001-m4-readline-a=
dd-missing-includes.patch<br>
<br>
diff --git a/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-i=
ncludes.patch b/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missin=
g-includes.patch<br>
new file mode 100644<br>
index 00000000000..97edf1ccf8c<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes=
.patch<br>
@@ -0,0 +1,38 @@<br>
+From 4f4e84f139e2a8682f1374a592f2636c43ad857b Mon Sep 17 00:00:00 2001<br>
+From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_bl=
ank">ross.burton@arm.com</a>&gt;<br>
+Date: Tue, 21 May 2024 15:10:11 +0000<br>
+Subject: [PATCH] m4/readline: add missing includes<br>
+<br>
+The cross-specific code fragment only includes stdio.h, where the native<b=
r>
+fragment also includes fcntl.h and unistd.h.=C2=A0 This is important becau=
se<br>
+GCC 14.1 has made the implicit definitions an error:<br>
+<br>
+conftest.c: In function &#39;main&#39;:<br>
+conftest.c:144:9: error: implicit declaration of function &#39;close&#39;;=
 did you mean &#39;pclose&#39;? [-Wimplicit-function-declaration]<br>
+conftest.c:146:14: error: implicit declaration of function &#39;open&#39;;=
 did you mean &#39;popen&#39;? [-Wimplicit-function-declaration]<br>
+<br>
+Add the missing includes so that the check doesn&#39;t always fail due to<=
br>
+these errors.<br>
+<br>
+Upstream-Status: Submitted<br>
+Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
+---<br>
+ m4/readline.m4 | 2 ++<br>
+ 1 file changed, 2 insertions(+)<br>
+<br>
+diff --git a/m4/readline.m4 b/m4/readline.m4<br>
+index 38f96326..efd52d4e 100644<br>
+--- a/m4/readline.m4<br>
++++ b/m4/readline.m4<br>
+@@ -66,6 +66,8 @@ dnl action if false:<br>
+ dnl action if cross compiling:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LINK_IFELSE(<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0[AC_LANG_PROGRAM([[#include &lt;stdio.h&gt;<br>
++#include &lt;fcntl.h&gt;<br>
++#include &lt;unistd.h&gt;<br>
+ #include &lt;readline/readline.h&gt;<br>
+ #include &lt;readline/history.h&gt;]],=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 dnl includes<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dnl function body<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta/recipes-extended/gawk/<a href=3D"http://gawk_5.3.0.bb" re=
l=3D"noreferrer" target=3D"_blank">gawk_5.3.0.bb</a> b/meta/recipes-extende=
d/gawk/<a href=3D"http://gawk_5.3.0.bb" rel=3D"noreferrer" target=3D"_blank=
">gawk_5.3.0.bb</a><br>
index d7a0fc616d3..e94cf19db48 100644<br>
--- a/meta/recipes-extended/gawk/<a href=3D"http://gawk_5.3.0.bb" rel=3D"no=
referrer" target=3D"_blank">gawk_5.3.0.bb</a><br>
+++ b/meta/recipes-extended/gawk/<a href=3D"http://gawk_5.3.0.bb" rel=3D"no=
referrer" target=3D"_blank">gawk_5.3.0.bb</a><br>
@@ -16,6 +16,7 @@ PACKAGECONFIG[readline] =3D &quot;--with-readline,--witho=
ut-readline,readline&quot;<br>
=C2=A0PACKAGECONFIG[mpfr] =3D &quot;--with-mpfr,--without-mpfr, mpfr&quot;<=
br>
<br>
=C2=A0SRC_URI =3D &quot;${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-m4-readline-add-missi=
ng-includes.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#199648): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/199648" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/199648</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106225075/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/106225075/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000012c3390618f85d53--


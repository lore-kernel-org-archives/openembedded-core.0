Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26D0C4345F
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 11:05:34 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.11087.1714129525723655100
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Apr 2024 04:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PIjHGLMR;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51ae2e37a87so2386467e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Apr 2024 04:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714129524; x=1714734324; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RAgA+BBrTbiVAqb4DEJyFp2HaDL7ICeCdQ/8qv1cFCI=;
        b=PIjHGLMRmIWoj92SLDepV+ClmX5kFX5lKlbtsdxMg4KTuquWfUFk2XXfNydb5FGLpm
         1K5CgmGw/oQGq94W4aDCUCrE7Eg4px78Xres+iKJKwqrdYPJMpuo1zLflZW49EsEqK2H
         WWjHROGUr0Pw03lPFXkzWhreFiitfxnTkpA3adKxmacoD4ApPBxPN/c91GibgTRHPk/T
         plCU41Jdyu3wO3zQG9I75aCnc+kpbrnZMcztySDAXZ2t2QHODQ1RZ01+rpWP0BP74pVC
         iZyQOAXrApQO6I7mwmf7Bla7k6o7TP7/QtQKtFPfaP5Ytz1xczfDO9vODJkq3g2cq8NE
         OAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714129524; x=1714734324;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAgA+BBrTbiVAqb4DEJyFp2HaDL7ICeCdQ/8qv1cFCI=;
        b=MEvkfOKLxfc1ylYOKFHDLCAHT33krZ0slvcnVUr0HuUx23ilcgpJCV8APBNPDO7A8k
         jXginoJ2vHr6l44wpWLsaArw49dROBk6lJGcqpM+2w/8gmCRZHHyBh5r/0pVRpXOnjEO
         w5/ZuMALerc2cRbi5fQgpskjqDC5+z+5Ye6DsSQA4xrk+JpkOduuOwN3nVNuxeBNOvtt
         CqzPb9hu+h2aelvBFLvM+kXf+dVYNwu7dzBL/K+D4wssF4XnuyMruaZJ7FQrUxAGY/3B
         oyGAnGDkAmFNSWHYy+6SwH6skgo7kixW7KjD4HNiMoZSg7Fgz2sUsSc0UV0r/V7xC1dV
         Rcew==
X-Forwarded-Encrypted: i=1; AJvYcCWFND4lN4gUS9looUPTzMoJPH75hQExaLPXSrW4iykNPxNRIH9eHqnsh6d81nSvxPIcPWT5azjbKGBsDG7JdTx9NtFzMU7P4P7cpRdVm+ITJzSRIG/5LAlT
X-Gm-Message-State: AOJu0Yzmd+COHZIAyC4bCr6L7zs/Bnj7E9w0Y/mkPMrKC2kXaEz4m0fB
	7eNN19F6ybwg+rvKtuZWLGscwH+hyPMsJjERVPHnIIJSzG3Kk9Z/F6kIBcId2rXzFlSwu03GYvQ
	BQ13fs0KCTJ44F88ARKN++mPYkeI=
X-Google-Smtp-Source: AGHT+IEy848jD/9woQZJPoyN3JDEy5kbrn+2U+CWzFKZXj1ZbF2d85lfuYnp4MryMbsGsG20QT0oQ+qY718Ppszh4BQ=
X-Received: by 2002:a05:6512:33c1:b0:513:5a38:f545 with SMTP id
 d1-20020a05651233c100b005135a38f545mr1616334lfg.62.1714129523252; Fri, 26 Apr
 2024 04:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240426104001.3076365-1-ross.burton@arm.com>
In-Reply-To: <20240426104001.3076365-1-ross.burton@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Apr 2024 13:05:11 +0200
Message-ID: <CANNYZj8psOvqiuWF5Pw2xfv9-CFsKw1AjQuerjOzzq-Mt3dk=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][master scarthgap] procps: fix build with new
 glibc but old kernel headers
To: ross.burton@arm.com
Cc: nd@arm.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005526d70616fde119"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Apr 2024 11:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198722

--0000000000005526d70616fde119
Content-Type: text/plain; charset="UTF-8"

No pending patches please.

Alex

On Fri 26. Apr 2024 at 12.40, Ross Burton via lists.openembedded.org
<ross.burton=arm.com@lists.openembedded.org> wrote:

> If you're building procps with a newer glibc (with pidfd_open()) but
> older kernel headers (say 4.x, before __NR_pidfd_open) then procps will
> fail to build because of a typo in configure.ac.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../procps/procps/pidfd.patch                 | 25 +++++++++++++++++++
>  meta/recipes-extended/procps/procps_4.0.4.bb  |  1 +
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta/recipes-extended/procps/procps/pidfd.patch
>
> diff --git a/meta/recipes-extended/procps/procps/pidfd.patch
> b/meta/recipes-extended/procps/procps/pidfd.patch
> new file mode 100644
> index 00000000000..4c19043496b
> --- /dev/null
> +++ b/meta/recipes-extended/procps/procps/pidfd.patch
> @@ -0,0 +1,25 @@
> +From c8f625e085b8249cc009e8b19c3a19100217eb35 Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
> +Date: Thu, 25 Apr 2024 13:33:15 +0000
> +Subject: [PATCH] Fix pidfd_open detection
> +
> +This check for pidfd_open uses AC_CHECK_FUNC which just runs the
> specified code, but
> +src/pgrep.c checks HAVE_PIDFD_OPEN which will only be defined by
> AC_CHECK_FUNCS.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +---
> +
> +diff --git a/configure.ac b/configure.ac
> +index fec27e3f..024731c7 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -170,7 +170,7 @@ AC_TRY_COMPILE([#include <errno.h>],
> +               AC_MSG_RESULT(yes),
> +               AC_MSG_RESULT(no))
> +
> +-AC_CHECK_FUNC([pidfd_open], [enable_pidwait=yes], [
> ++AC_CHECK_FUNCS([pidfd_open], [enable_pidwait=yes], [
> +   AC_MSG_CHECKING([for __NR_pidfd_open])
> +   AC_COMPILE_IFELSE([AC_LANG_SOURCE([
> + #include <sys/syscall.h>
> diff --git a/meta/recipes-extended/procps/procps_4.0.4.bb
> b/meta/recipes-extended/procps/procps_4.0.4.bb
> index 800384f22f7..ec8c4b0261b 100644
> --- a/meta/recipes-extended/procps/procps_4.0.4.bb
> +++ b/meta/recipes-extended/procps/procps_4.0.4.bb
> @@ -14,6 +14,7 @@ inherit autotools gettext pkgconfig update-alternatives
>
>  SRC_URI = "git://
> gitlab.com/procps-ng/procps.git;protocol=https;branch=master \
>             file://sysctl.conf \
> +           file://pidfd.patch \
>             "
>  SRCREV = "4ddcef2fd843170c8e2d59a83042978f41037a2b"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198721):
> https://lists.openembedded.org/g/openembedded-core/message/198721
> Mute This Topic: https://lists.openembedded.org/mt/105747722/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000005526d70616fde119
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">No pending patches please.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri 26. Apr 2024 at 12.40, Ross Burton via=
 <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;r=
oss.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.org">arm.com@list=
s.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style=
:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">If you&#39;re b=
uilding procps with a newer glibc (with pidfd_open()) but<br>
older kernel headers (say 4.x, before __NR_pidfd_open) then procps will<br>
fail to build because of a typo in <a href=3D"http://configure.ac" rel=3D"n=
oreferrer" target=3D"_blank">configure.ac</a>.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0.../procps/procps/pidfd.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 25 +++++++++++++++++++<br>
=C2=A0meta/recipes-extended/procps/<a href=3D"http://procps_4.0.4.bb" rel=
=3D"noreferrer" target=3D"_blank">procps_4.0.4.bb</a>=C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 26 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-extended/procps/procps/pidfd.patch<br=
>
<br>
diff --git a/meta/recipes-extended/procps/procps/pidfd.patch b/meta/recipes=
-extended/procps/procps/pidfd.patch<br>
new file mode 100644<br>
index 00000000000..4c19043496b<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/procps/procps/pidfd.patch<br>
@@ -0,0 +1,25 @@<br>
+From c8f625e085b8249cc009e8b19c3a19100217eb35 Mon Sep 17 00:00:00 2001<br>
+From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_bl=
ank">ross.burton@arm.com</a>&gt;<br>
+Date: Thu, 25 Apr 2024 13:33:15 +0000<br>
+Subject: [PATCH] Fix pidfd_open detection<br>
+<br>
+This check for pidfd_open uses AC_CHECK_FUNC which just runs the specified=
 code, but <br>
+src/pgrep.c checks HAVE_PIDFD_OPEN which will only be defined by AC_CHECK_=
FUNCS.<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
+---<br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index fec27e3f..024731c7 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -170,7 +170,7 @@ AC_TRY_COMPILE([#include &lt;errno.h&gt;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_MSG_RESULT(yes),=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_MSG_RESULT(no))<=
br>
+ <br>
+-AC_CHECK_FUNC([pidfd_open], [enable_pidwait=3Dyes], [<br>
++AC_CHECK_FUNCS([pidfd_open], [enable_pidwait=3Dyes], [<br>
+=C2=A0 =C2=A0AC_MSG_CHECKING([for __NR_pidfd_open])<br>
+=C2=A0 =C2=A0AC_COMPILE_IFELSE([AC_LANG_SOURCE([<br>
+ #include &lt;sys/syscall.h&gt;<br>
diff --git a/meta/recipes-extended/procps/<a href=3D"http://procps_4.0.4.bb=
" rel=3D"noreferrer" target=3D"_blank">procps_4.0.4.bb</a> b/meta/recipes-e=
xtended/procps/<a href=3D"http://procps_4.0.4.bb" rel=3D"noreferrer" target=
=3D"_blank">procps_4.0.4.bb</a><br>
index 800384f22f7..ec8c4b0261b 100644<br>
--- a/meta/recipes-extended/procps/<a href=3D"http://procps_4.0.4.bb" rel=
=3D"noreferrer" target=3D"_blank">procps_4.0.4.bb</a><br>
+++ b/meta/recipes-extended/procps/<a href=3D"http://procps_4.0.4.bb" rel=
=3D"noreferrer" target=3D"_blank">procps_4.0.4.bb</a><br>
@@ -14,6 +14,7 @@ inherit autotools gettext pkgconfig update-alternatives<b=
r>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://gitlab.com/procps-ng/procps=
.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank"=
>gitlab.com/procps-ng/procps.git;protocol=3Dhttps;branch=3Dmaster</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sysctl.conf \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pidfd.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRCREV =3D &quot;4ddcef2fd843170c8e2d59a83042978f41037a2b&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#198721): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/198721" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/198721</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105747722/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105747722/1686489</a><br>
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

--0000000000005526d70616fde119--


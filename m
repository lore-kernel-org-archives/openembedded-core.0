Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D27C433FE
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 19:38:23 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.1510.1635277102849501059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 12:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HBAFKdua;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id a26so424368pfr.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 12:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jxNn3R/2n2f196hj5Kypv4LTMvHjlAE1Po33AeSVcpQ=;
        b=HBAFKduaDNb3oZQsd+oo+8TbZp3SDh2+6iOK0hwhe5+lRalv9o209l4awW/1gkjkc+
         Pk5fTGczvqPJJ9+k4Vzr9My0cbAVQ5VlmKMElo4fepR41wN2zTmq1lY5V999Q1ibO4In
         woBebta1MKIi5uyA6yIHTV7SmaXLaLx5N4KcoaIQVlUHeDjyS1x54t/itBeDYjKfCnUu
         QKpKBKTWXZ/zeSyk4CGC7WhpPBHw5wtJJ/FsI53jrMqvW6AVEsP88+hiBZ17cKobozNZ
         c2QH8my9gYLCObfpmZMnjOk3nRl29PF8UaciWdEmOX7waefQnYJryCw/mTt1lDc9jZAm
         6IiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jxNn3R/2n2f196hj5Kypv4LTMvHjlAE1Po33AeSVcpQ=;
        b=WcRSKXaK+4wZzAPcmLrG1lSlGatva+etUeF5ySkIAxB3VQ/nkNIVU7YUs2AlsF4fl5
         Acs2dY+3dr0nOwOFXiKw8EzoXbrYMpIq6W5wT+sUyLA5fxbAuEgrSd7haDctVK+KdMYN
         s+P1Ff1LNCrWVjmfVcWQ9z5eJahq2dxd55Rs5ddN8jMzRu7XgiogI7uXiWhCg79+HhmB
         TJ1kjxw4P9TGLEuT4wv4LG5R6BBofxEWU04Fy49b1kZbzHaBI5Zl4xy3Jcs9R1mOIKlY
         ocy4/wN0eA3Bv7oVnPw/DEILCLfhhbL9i9ISZHiLSt2KiJZupETmGuzfgg6WMANBcrS8
         /j+Q==
X-Gm-Message-State: AOAM530xMVMfAtkApTyMBaTBd0rO0G2UNHUFvGuFfrCvNEzfwQ6UZ6p/
	19oQzOMV9joCG1FrHa+NB6k32o4Z1Fd1mAS6D6M=
X-Google-Smtp-Source: 
 ABdhPJxSMiE3HAHt6oJRMFr3F6/Npi8tkvZ/oxGdCIGPvHnRytxxe86R44wUZtlNPgicayfXwDHI6RAhqIR5P67p4go=
X-Received: by 2002:a63:7102:: with SMTP id m2mr20875378pgc.100.1635277102090;
 Tue, 26 Oct 2021 12:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211011094059.4184654-1-alex@linutronix.de>
 <20211011094059.4184654-24-alex@linutronix.de>
In-Reply-To: <20211011094059.4184654-24-alex@linutronix.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 26 Oct 2021 21:38:11 +0200
Message-ID: 
 <CA+chaQc7S7fmdDaWQfqPGv+o6UYrp_hUKgdr08uoegESuDPqew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 24/25] webkitgtk: update 2.32.3 -> 2.34.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c78e7005cf469e2e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 19:38:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157450

--000000000000c78e7005cf469e2e
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 11, 2021 at 11:42 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../0001-ANGLE-do-not-enable-SSE-on-x86.patch | 26 ++++++++++++++++
>  ...1-Enable-THREADS_PREFER_PTHREAD_FLAG.patch | 10 +++---
>  .../0001-MiniBrowser-Fix-reproduciblity.patch | 31 -------------------
>  .../webkit/webkitgtk/include_xutil.patch      |  8 ++---
>  .../webkitgtk/musl-lower-stack-usage.patch    | 14 ++++-----
>  ...ebkitgtk_2.32.3.bb => webkitgtk_2.34.0.bb} | 23 ++++++++------
>  6 files changed, 55 insertions(+), 57 deletions(-)
>  create mode 100644
> meta/recipes-sato/webkit/webkitgtk/0001-ANGLE-do-not-enable-SSE-on-x86.patch
>  delete mode 100644
> meta/recipes-sato/webkit/webkitgtk/0001-MiniBrowser-Fix-reproduciblity.patch
>  rename meta/recipes-sato/webkit/{webkitgtk_2.32.3.bb =>
> webkitgtk_2.34.0.bb} (90%)
>
> diff --git
> a/meta/recipes-sato/webkit/webkitgtk/0001-ANGLE-do-not-enable-SSE-on-x86.patch
> b/meta/recipes-sato/webkit/webkitgtk/0001-ANGLE-do-not-enable-SSE-on-x86.patch
> new file mode 100644
> index 00000000000..1c6ba970376
> --- /dev/null
> +++
> b/meta/recipes-sato/webkit/webkitgtk/0001-ANGLE-do-not-enable-SSE-on-x86.patch
> @@ -0,0 +1,26 @@
> +From c71a4e18afb4869a0fbb0efd59c4860b72f493f7 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Tue, 5 Oct 2021 13:32:28 +0200
> +Subject: [PATCH] ANGLE: do not enable SSE on x86
> +
> +The code does not actually build there.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + Source/ThirdParty/ANGLE/src/common/platform.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Source/ThirdParty/ANGLE/src/common/platform.h
> b/Source/ThirdParty/ANGLE/src/common/platform.h
> +index 41f3cf4f..cab85a82 100644
> +--- a/Source/ThirdParty/ANGLE/src/common/platform.h
> ++++ b/Source/ThirdParty/ANGLE/src/common/platform.h
> +@@ -89,7 +89,7 @@
> + #if defined(_MSC_VER) && !defined(_M_ARM) && !defined(_M_ARM64)
> + #    include <intrin.h>
> + #    define ANGLE_USE_SSE
> +-#elif defined(__GNUC__) && (defined(__x86_64__) || defined(__i386__))
> ++#elif defined(__GNUC__) && (defined(__x86_64__))
> + #    include <x86intrin.h>
> + #    define ANGLE_USE_SSE
> + #endif
>

Can you improve the commit message of this patch to show what "does not
actually build there"?

Because it fails to build here for qemux86 with:

webkitgtk/2.34.0-r0/webkitgtk-2.34.0/Source/ThirdParty/ANGLE/src/libANGLE/Constants.h:20:7:
error: 'size_t' does not name a type
   20 | const size_t kDefaultMaxProgramCacheMemoryBytes = 0;
      |       ^~~~~~

and deleting this patch fixes the build.

--000000000000c78e7005cf469e2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Oct 11, 2021 at 11:42 AM Alexande=
r Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.=
com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Signed-off-by: Alexander Kanavin &lt;<a href=
=3D"mailto:alex@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;=
<br>
---<br>
=C2=A0.../0001-ANGLE-do-not-enable-SSE-on-x86.patch | 26 ++++++++++++++++<b=
r>
=C2=A0...1-Enable-THREADS_PREFER_PTHREAD_FLAG.patch | 10 +++---<br>
=C2=A0.../0001-MiniBrowser-Fix-reproduciblity.patch | 31 ------------------=
-<br>
=C2=A0.../webkit/webkitgtk/include_xutil.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
8 ++---<br>
=C2=A0.../webkitgtk/musl-lower-stack-usage.patch=C2=A0 =C2=A0 | 14 ++++----=
-<br>
=C2=A0...<a href=3D"http://ebkitgtk_2.32.3.bb" rel=3D"noreferrer" target=3D=
"_blank">ebkitgtk_2.32.3.bb</a> =3D&gt; <a href=3D"http://webkitgtk_2.34.0.=
bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.34.0.bb</a>} | 23 ++++=
++++------<br>
=C2=A06 files changed, 55 insertions(+), 57 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-ANGLE-do-n=
ot-enable-SSE-on-x86.patch<br>
=C2=A0delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-MiniBrowse=
r-Fix-reproduciblity.patch<br>
=C2=A0rename meta/recipes-sato/webkit/{<a href=3D"http://webkitgtk_2.32.3.b=
b" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.32.3.bb</a> =3D&gt; <a =
href=3D"http://webkitgtk_2.34.0.bb" rel=3D"noreferrer" target=3D"_blank">we=
bkitgtk_2.34.0.bb</a>} (90%)<br>
<br>
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-ANGLE-do-not-enable-SS=
E-on-x86.patch b/meta/recipes-sato/webkit/webkitgtk/0001-ANGLE-do-not-enabl=
e-SSE-on-x86.patch<br>
new file mode 100644<br>
index 00000000000..1c6ba970376<br>
--- /dev/null<br>
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-ANGLE-do-not-enable-SSE-on-x8=
6.patch<br>
@@ -0,0 +1,26 @@<br>
+From c71a4e18afb4869a0fbb0efd59c4860b72f493f7 Mon Sep 17 00:00:00 2001<br>
+From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" target=
=3D"_blank">alex@linutronix.de</a>&gt;<br>
+Date: Tue, 5 Oct 2021 13:32:28 +0200<br>
+Subject: [PATCH] ANGLE: do not enable SSE on x86<br>
+<br>
+The code does not actually build there.<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
 target=3D"_blank">alex@linutronix.de</a>&gt;<br>
+---<br>
+ Source/ThirdParty/ANGLE/src/common/platform.h | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/Source/ThirdParty/ANGLE/src/common/platform.h b/Source/ThirdP=
arty/ANGLE/src/common/platform.h<br>
+index 41f3cf4f..cab85a82 100644<br>
+--- a/Source/ThirdParty/ANGLE/src/common/platform.h<br>
++++ b/Source/ThirdParty/ANGLE/src/common/platform.h<br>
+@@ -89,7 +89,7 @@<br>
+ #if defined(_MSC_VER) &amp;&amp; !defined(_M_ARM) &amp;&amp; !defined(_M_=
ARM64)<br>
+ #=C2=A0 =C2=A0 include &lt;intrin.h&gt;<br>
+ #=C2=A0 =C2=A0 define ANGLE_USE_SSE<br>
+-#elif defined(__GNUC__) &amp;&amp; (defined(__x86_64__) || defined(__i386=
__))<br>
++#elif defined(__GNUC__) &amp;&amp; (defined(__x86_64__))<br>
+ #=C2=A0 =C2=A0 include &lt;x86intrin.h&gt;<br>
+ #=C2=A0 =C2=A0 define ANGLE_USE_SSE<br>
+ #endif<br></blockquote><div><br></div><div>Can you improve the commit mes=
sage of this patch to show what &quot;does not actually build there&quot;?<=
/div><div><br></div><div>Because it fails to build here for qemux86 with:</=
div><div><br></div><div>webkitgtk/2.34.0-r0/webkitgtk-2.34.0/Source/ThirdPa=
rty/ANGLE/src/libANGLE/Constants.h:20:7: error: &#39;size_t&#39; does not n=
ame a type<br>=C2=A0 =C2=A020 | const size_t kDefaultMaxProgramCacheMemoryB=
ytes =3D 0;<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 ^~~~~~<br></div>=
<div><br></div><div>and deleting this patch fixes the build.</div></div></d=
iv>

--000000000000c78e7005cf469e2e--


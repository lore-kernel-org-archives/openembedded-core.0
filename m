Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA889C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 13:43:31 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web10.51514.1638798210376938334
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 05:43:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oCyx+BCa;
 spf=pass (domain: gmail.com, ip: 209.85.222.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id n6so19674038uak.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 05:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LTWa3CPSG5qb49SpwTZCuBx5UOxJZHMm6QeOvT+Jy8M=;
        b=oCyx+BCapbM+XMGm1pgZ4TGdQM7BLPQNgcySVltEZmCD6j7s6j5opNFXpO77AXJndH
         uXQP2IQJN/DwAb6kmj5G0BPx80L3z8A7eSh+JMJBddTUnSw0Gk5OCKpZ6KtlJefgZKMQ
         auhCUbUnJqCMP8kkwsiY9hzX1JR/oAEogGDNY2vdzzX7VnvznmMB/mll46fca1S3YzY4
         n6PFJ7bzq7iHmmaERdhxHdyEQSRPwPz7Zw17L4o+JFlcQ+ZvbH03fxmvAMR5mA/yXUYk
         CEvMv+XOmJLYp/xrlKsq6wJZBo/EeAHspEnd8YqLlK3+eJYrowGzmgkvoS0rwgtReo/G
         /CFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LTWa3CPSG5qb49SpwTZCuBx5UOxJZHMm6QeOvT+Jy8M=;
        b=rj0NK0BE2HFUtR68sgBtUjOHfGnD+Qj/FGsJ9wyukleS4c9+nPDOMiA1qKI1YPeuKt
         i0iV3e+sTfurEUcuUWXcCxGaT5RKGfbWdUb7clKXN8XhfUD7zXEqwNV656K6iqAS+/ih
         e9ElftvFDbDkKNZvTwjSySRhWkn5N/mNBx3vuyNtjcRvcgOaKepgipOse4u0euolqqFD
         8tPjFdbwkA78v5H/d0nGCOHejx1L9sesG+b7DSjYnYcJfDGZBz1qb0NtjQQy8siYAgKj
         WGOzVtBleNt2hQA7zokqX1OhfGleseqiMtc+YlIm4OJrnSlhO98TR8HUg0eKdwXLsbCv
         xezw==
X-Gm-Message-State: AOAM5329nJUFtMVVtNVcwbNsqKPfpRoE5lBzhkC2e6sWk3CF6KIejZlX
	vsp2p+tT+eFNgmG6Rsd/IRpzELwdCrFC6G8i7ek=
X-Google-Smtp-Source: 
 ABdhPJykSfC74Qq+hfORdNgSPU7c4W8CZr9maW1/SJ80FNPp5A9jvC5xG5W7gSsEBajIkWHRMK6sjXvqShrKFcS+PHI=
X-Received: by 2002:a67:7105:: with SMTP id m5mr36413520vsc.81.1638798208958;
 Mon, 06 Dec 2021 05:43:28 -0800 (PST)
MIME-Version: 1.0
References: <20211206130634.500693-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211206130634.500693-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Dec 2021 14:43:17 +0100
Message-ID: 
 <CANNYZj8r-3BvcYnaiBbTGzBJ_iAPg6Sn83Dt4N4NLUh+vP-=yQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] minicom: Upgrade 2.7.1 -> 2.8
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001a83e905d27a7149"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 13:43:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159228

--0000000000001a83e905d27a7149
Content-Type: text/plain; charset="UTF-8"

Since AUH didn't pick this up, can you run 'devtool latest-version minicom'
with this update, as it probably would report something that needs fixing
via regexp?

Alex

On Mon, 6 Dec 2021 at 14:06, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> * Update the url to use .bz2 instead of .gz compression.
> * Drop three patches merged upstream
> * Submit two patches upstream
> * Drop the musl patch since half was already applied upstream and
>   musl now builds fine without the other piece
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  ...Fix-build-issus-surfaced-due-to-musl.patch | 47 -------------------
>  ...ix-minicom-h-v-return-value-is-not-0.patch | 32 ++++++-------
>  .../minicom/allow.to.disable.lockdev.patch    | 17 +++++--
>  .../{minicom_2.7.1.bb => minicom_2.8.bb}      | 11 ++---
>  4 files changed, 31 insertions(+), 76 deletions(-)
>  delete mode 100644
> meta/recipes-extended/minicom/minicom/0001-Fix-build-issus-surfaced-due-to-musl.patch
>  rename meta/recipes-extended/minicom/{minicom_2.7.1.bb => minicom_2.8.bb}
> (68%)
>
> diff --git
> a/meta/recipes-extended/minicom/minicom/0001-Fix-build-issus-surfaced-due-to-musl.patch
> b/meta/recipes-extended/minicom/minicom/0001-Fix-build-issus-surfaced-due-to-musl.patch
> deleted file mode 100644
> index fec67fdd3fd..00000000000
> ---
> a/meta/recipes-extended/minicom/minicom/0001-Fix-build-issus-surfaced-due-to-musl.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From d62a5862e26ed3fc58d789efe9c40ca6c911d36b Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 31 Aug 2015 22:35:31 +0000
> -Subject: [PATCH] Fix build issus surfaced due to musl
> -
> -src/getsdir.h:28:14: error: 'MAXNAMLEN' undeclared here (not in a
> function)
> -   char fname[MAXNAMLEN + 1];  /* filename + terminating null */
> -
> -src/dial.c:352:22: error: 'KIOCSOUND' undeclared (first use in this
> function)
> -|      ioctl(consolefd, KIOCSOUND, k);
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - src/dial.c    | 2 +-
> - src/getsdir.c | 1 +
> - 2 files changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/dial.c b/src/dial.c
> -index a90c1d2..bf02574 100644
> ---- a/src/dial.c
> -+++ b/src/dial.c
> -@@ -39,7 +39,7 @@
> - #include "intl.h"
> -
> - #ifdef VC_MUSIC
> --#  if defined(__GLIBC__)
> -+#  if defined(__GLIBC__) || defined(__linux__)
> - #    include <sys/ioctl.h>
> - #    include <sys/kd.h>
> - #    include <sys/time.h>
> -diff --git a/src/getsdir.c b/src/getsdir.c
> -index 2195b27..b61a361 100644
> ---- a/src/getsdir.c
> -+++ b/src/getsdir.c
> -@@ -30,6 +30,7 @@
> - #include <string.h>
> - #include <sys/types.h>
> - #include <sys/stat.h>
> -+#include <sys/param.h>
> - #include <errno.h>
> -
> - #include "getsdir.h"
> ---
> -2.5.1
> -
> diff --git
> a/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch
> b/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch
> index bd8261c979d..9e67126f3e1 100644
> ---
> a/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch
> +++
> b/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch
> @@ -1,35 +1,33 @@
> -Subject: [PATCH] fix minicom -h/-v return value is not 0
> +Exit normally for help/verison options
>
> -Upstream-Status: Pending
> -
> -Signed-off-by: Lu Chong <Chong.Lu@windriver.com>
> +If -v or -h is used for the help/version information, it is a normal exit
> situation,
> +not an error condition. Sometimes these are used as a simple operation
> test of the
> +resulting binary so the exit code does matter.
>
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Upstream-Status: Submitted [
> https://salsa.debian.org/minicom-team/minicom/-/merge_requests/14]
>  ---
>   src/minicom.c |    6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> -diff --git a/src/minicom.c b/src/minicom.c
> -index e1a557b..730da7c 100644
> ---- a/src/minicom.c
> -+++ b/src/minicom.c
> -@@ -1166,15 +1166,13 @@ int main(int argc, char **argv)
> -                "modify it under the terms of the GNU General Public
> License\n"
> +Index: minicom-2.8/src/minicom.c
> +===================================================================
> +--- minicom-2.8.orig/src/minicom.c
> ++++ minicom-2.8/src/minicom.c
> +@@ -1257,14 +1257,14 @@ int main(int argc, char **argv)
> +                  "modify it under the terms of the GNU General Public
> License\n"
>                    "as published by the Free Software Foundation; either
> version\n"
> -                  "2 of the License, or (at your option) any later
> version.\n\n");
> +                  "2 of the License, or (at your option) any later
> version.\n\n"));
>  -          exit(1);
> --          break;
>  +          exit(0);
> +           break;
>           case 's': /* setup mode */
>             dosetup = 1;
>             break;
>           case 'h':
>             helpthem();
>  -          exit(1);
> --          break;
>  +          exit(0);
> +           break;
>           case 'p': /* Pseudo terminal to use. */
>             if (strncmp(optarg, "/dev/", 5) == 0)
> -             optarg += 5;
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch
> b/meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch
> index f5c08896ff5..39dc5c04925 100644
> --- a/meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch
> +++ b/meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch
> @@ -1,10 +1,19 @@
> -Upstream-Status: Pending
> +configure: Allow lockdev to be disabled
> +
> +When the pkgconfig dependencies may be present, it is useful to be
> +able to explictly disable the lockdev dependency. This adds such an
> +option.
>
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +Upstream-Status: Submitted [
> https://salsa.debian.org/minicom-team/minicom/-/merge_requests/14]
>
> ---- a/configure.in     2013-02-06 18:18:13.000000000 +0100
> -+++ b/configure.in     2013-07-21 15:31:27.614828894 +0200
> -@@ -40,7 +40,13 @@
> +Index: minicom-2.8/configure.ac
> +===================================================================
> +--- minicom-2.8.orig/configure.ac
> ++++ minicom-2.8/configure.ac
> +@@ -43,7 +43,13 @@ if test "x$enable_socket" = xyes; then
>   fi
>
>   PKG_PROG_PKG_CONFIG
> diff --git a/meta/recipes-extended/minicom/minicom_2.7.1.bb
> b/meta/recipes-extended/minicom/minicom_2.8.bb
> similarity index 68%
> rename from meta/recipes-extended/minicom/minicom_2.7.1.bb
> rename to meta/recipes-extended/minicom/minicom_2.8.bb
> index 4f715cbc714..3abd8a41ca9 100644
> --- a/meta/recipes-extended/minicom/minicom_2.7.1.bb
> +++ b/meta/recipes-extended/minicom/minicom_2.8.bb
> @@ -7,17 +7,12 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
>
>  file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
>
> -SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.gz \
> +SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.bz2 \
>             file://allow.to.disable.lockdev.patch \
>             file://0001-fix-minicom-h-v-return-value-is-not-0.patch \
> -           file://0001-Fix-build-issus-surfaced-due-to-musl.patch \
> -           file://0001-Drop-superfluous-global-variable-definitions.patch
> \
> -           file://0002-Drop-superfluous-global-variable-definitions.patch
> \
> -           file://0003-Drop-superfluous-global-variable-definitions.patch
> \
> -          "
> +"
>
> -SRC_URI[md5sum] = "9021cb8c5445f6e6e74b2acc39962d62"
> -SRC_URI[sha256sum] =
> "532f836b7a677eb0cb1dca8d70302b73729c3d30df26d58368d712e5cca041f1"
> +SRC_URI[sha256sum] =
> "38cea30913a20349326ff3f1763ee1512b7b41601c24f065f365e18e9db0beba"
>
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159227):
> https://lists.openembedded.org/g/openembedded-core/message/159227
> Mute This Topic: https://lists.openembedded.org/mt/87539156/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000001a83e905d27a7149
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Since AUH didn&#39;t pick this up, can you run &#39;d=
evtool latest-version minicom&#39; with this update, as it probably would r=
eport something that needs fixing via regexp?</div><div><br></div><div>Alex=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Mon, 6 Dec 2021 at 14:06, Richard Purdie &lt;<a href=3D"mailto=
:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* Up=
date the url to use .bz2 instead of .gz compression.<br>
* Drop three patches merged upstream<br>
* Submit two patches upstream<br>
* Drop the musl patch since half was already applied upstream and<br>
=C2=A0 musl now builds fine without the other piece<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0...Fix-build-issus-surfaced-due-to-musl.patch | 47 ------------------=
-<br>
=C2=A0...ix-minicom-h-v-return-value-is-not-0.patch | 32 ++++++-------<br>
=C2=A0.../minicom/allow.to.disable.lockdev.patch=C2=A0 =C2=A0 | 17 +++++--<=
br>
=C2=A0.../{<a href=3D"http://minicom_2.7.1.bb" rel=3D"noreferrer" target=3D=
"_blank">minicom_2.7.1.bb</a> =3D&gt; <a href=3D"http://minicom_2.8.bb" rel=
=3D"noreferrer" target=3D"_blank">minicom_2.8.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
 11 ++---<br>
=C2=A04 files changed, 31 insertions(+), 76 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-extended/minicom/minicom/0001-Fix-bui=
ld-issus-surfaced-due-to-musl.patch<br>
=C2=A0rename meta/recipes-extended/minicom/{<a href=3D"http://minicom_2.7.1=
.bb" rel=3D"noreferrer" target=3D"_blank">minicom_2.7.1.bb</a> =3D&gt; <a h=
ref=3D"http://minicom_2.8.bb" rel=3D"noreferrer" target=3D"_blank">minicom_=
2.8.bb</a>} (68%)<br>
<br>
diff --git a/meta/recipes-extended/minicom/minicom/0001-Fix-build-issus-sur=
faced-due-to-musl.patch b/meta/recipes-extended/minicom/minicom/0001-Fix-bu=
ild-issus-surfaced-due-to-musl.patch<br>
deleted file mode 100644<br>
index fec67fdd3fd..00000000000<br>
--- a/meta/recipes-extended/minicom/minicom/0001-Fix-build-issus-surfaced-d=
ue-to-musl.patch<br>
+++ /dev/null<br>
@@ -1,47 +0,0 @@<br>
-From d62a5862e26ed3fc58d789efe9c40ca6c911d36b Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Mon, 31 Aug 2015 22:35:31 +0000<br>
-Subject: [PATCH] Fix build issus surfaced due to musl<br>
-<br>
-src/getsdir.h:28:14: error: &#39;MAXNAMLEN&#39; undeclared here (not in a =
function)<br>
-=C2=A0 =C2=A0char fname[MAXNAMLEN + 1];=C2=A0 /* filename + terminating nu=
ll */<br>
-<br>
-src/dial.c:352:22: error: &#39;KIOCSOUND&#39; undeclared (first use in thi=
s function)<br>
-|=C2=A0 =C2=A0 =C2=A0 ioctl(consolefd, KIOCSOUND, k);<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
-Upstream-Status: Pending<br>
-<br>
- src/dial.c=C2=A0 =C2=A0 | 2 +-<br>
- src/getsdir.c | 1 +<br>
- 2 files changed, 2 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/dial.c b/src/dial.c<br>
-index a90c1d2..bf02574 100644<br>
---- a/src/dial.c<br>
-+++ b/src/dial.c<br>
-@@ -39,7 +39,7 @@<br>
- #include &quot;intl.h&quot;<br>
- <br>
- #ifdef VC_MUSIC<br>
--#=C2=A0 if defined(__GLIBC__)<br>
-+#=C2=A0 if defined(__GLIBC__) || defined(__linux__)<br>
- #=C2=A0 =C2=A0 include &lt;sys/ioctl.h&gt;<br>
- #=C2=A0 =C2=A0 include &lt;sys/kd.h&gt;<br>
- #=C2=A0 =C2=A0 include &lt;sys/time.h&gt;<br>
-diff --git a/src/getsdir.c b/src/getsdir.c<br>
-index 2195b27..b61a361 100644<br>
---- a/src/getsdir.c<br>
-+++ b/src/getsdir.c<br>
-@@ -30,6 +30,7 @@<br>
- #include &lt;string.h&gt;<br>
- #include &lt;sys/types.h&gt;<br>
- #include &lt;sys/stat.h&gt;<br>
-+#include &lt;sys/param.h&gt;<br>
- #include &lt;errno.h&gt;<br>
- <br>
- #include &quot;getsdir.h&quot;<br>
--- <br>
-2.5.1<br>
-<br>
diff --git a/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-ret=
urn-value-is-not-0.patch b/meta/recipes-extended/minicom/minicom/0001-fix-m=
inicom-h-v-return-value-is-not-0.patch<br>
index bd8261c979d..9e67126f3e1 100644<br>
--- a/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-val=
ue-is-not-0.patch<br>
+++ b/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-val=
ue-is-not-0.patch<br>
@@ -1,35 +1,33 @@<br>
-Subject: [PATCH] fix minicom -h/-v return value is not 0<br>
+Exit normally for help/verison options<br>
<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Lu Chong &lt;<a href=3D"mailto:Chong.Lu@windriver.com" targ=
et=3D"_blank">Chong.Lu@windriver.com</a>&gt;<br>
+If -v or -h is used for the help/version information, it is a normal exit =
situation,<br>
+not an error condition. Sometimes these are used as a simple operation tes=
t of the<br>
+resulting binary so the exit code does matter.<br>
<br>
+Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
+Upstream-Status: Submitted [<a href=3D"https://salsa.debian.org/minicom-te=
am/minicom/-/merge_requests/14" rel=3D"noreferrer" target=3D"_blank">https:=
//salsa.debian.org/minicom-team/minicom/-/merge_requests/14</a>]<br>
=C2=A0---<br>
=C2=A0 src/minicom.c |=C2=A0 =C2=A0 6 ++----<br>
=C2=A0 1 file changed, 2 insertions(+), 4 deletions(-)<br>
<br>
-diff --git a/src/minicom.c b/src/minicom.c<br>
-index e1a557b..730da7c 100644<br>
---- a/src/minicom.c<br>
-+++ b/src/minicom.c<br>
-@@ -1166,15 +1166,13 @@ int main(int argc, char **argv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;modify it un=
der the terms of the GNU General Public License\n&quot;<br>
+Index: minicom-2.8/src/minicom.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- minicom-2.8.orig/src/minicom.c<br>
++++ minicom-2.8/src/minicom.c<br>
+@@ -1257,14 +1257,14 @@ int main(int argc, char **argv)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;modif=
y it under the terms of the GNU General Public License\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
as published by the Free Software Foundation; either version\n&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;2 of =
the License, or (at your option) any later version.\n\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;2 of =
the License, or (at your option) any later version.\n\n&quot;));<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;s&#39;: /* setup mode */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dosetup =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;h&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 helpthem();<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;p&#39;: /* Pseudo terminal to =
use. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strncmp(optarg, &quot;/dev/&q=
uot;, 5) =3D=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0optarg +=3D 5;<br>
--- <br>
-1.7.9.5<br>
-<br>
diff --git a/meta/recipes-extended/minicom/minicom/<a href=3D"http://allow.=
to" target=3D"_blank">allow.to</a>.disable.lockdev.patch b/meta/recipes-ext=
ended/minicom/minicom/<a href=3D"http://allow.to" target=3D"_blank">allow.t=
o</a>.disable.lockdev.patch<br>
index f5c08896ff5..39dc5c04925 100644<br>
--- a/meta/recipes-extended/minicom/minicom/<a href=3D"http://allow.to" tar=
get=3D"_blank">allow.to</a>.disable.lockdev.patch<br>
+++ b/meta/recipes-extended/minicom/minicom/<a href=3D"http://allow.to" tar=
get=3D"_blank">allow.to</a>.disable.lockdev.patch<br>
@@ -1,10 +1,19 @@<br>
-Upstream-Status: Pending<br>
+configure: Allow lockdev to be disabled<br>
+<br>
+When the pkgconfig dependencies may be present, it is useful to be<br>
+able to explictly disable the lockdev dependency. This adds such an<br>
+option.<br>
<br>
=C2=A0Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
+Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://salsa.debian.org/minicom-te=
am/minicom/-/merge_requests/14" rel=3D"noreferrer" target=3D"_blank">https:=
//salsa.debian.org/minicom-team/minicom/-/merge_requests/14</a>]<br>
<br>
---- a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a>=C2=A0 =C2=A0 =C2=A02013-02-06 18:18:13.000000000 +0100<br=
>
-+++ b/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a>=C2=A0 =C2=A0 =C2=A02013-07-21 15:31:27.614828894 +0200<br=
>
-@@ -40,7 +40,13 @@<br>
+Index: minicom-2.8/<a href=3D"http://configure.ac" rel=3D"noreferrer" targ=
et=3D"_blank">configure.ac</a><br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- minicom-2.8.orig/<a href=3D"http://configure.ac" rel=3D"noreferrer" ta=
rget=3D"_blank">configure.ac</a><br>
++++ minicom-2.8/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
+@@ -43,7 +43,13 @@ if test &quot;x$enable_socket&quot; =3D xyes; then<br>
=C2=A0 fi<br>
<br>
=C2=A0 PKG_PROG_PKG_CONFIG<br>
diff --git a/meta/recipes-extended/minicom/<a href=3D"http://minicom_2.7.1.=
bb" rel=3D"noreferrer" target=3D"_blank">minicom_2.7.1.bb</a> b/meta/recipe=
s-extended/minicom/<a href=3D"http://minicom_2.8.bb" rel=3D"noreferrer" tar=
get=3D"_blank">minicom_2.8.bb</a><br>
similarity index 68%<br>
rename from meta/recipes-extended/minicom/<a href=3D"http://minicom_2.7.1.b=
b" rel=3D"noreferrer" target=3D"_blank">minicom_2.7.1.bb</a><br>
rename to meta/recipes-extended/minicom/<a href=3D"http://minicom_2.8.bb" r=
el=3D"noreferrer" target=3D"_blank">minicom_2.8.bb</a><br>
index 4f715cbc714..3abd8a41ca9 100644<br>
--- a/meta/recipes-extended/minicom/<a href=3D"http://minicom_2.7.1.bb" rel=
=3D"noreferrer" target=3D"_blank">minicom_2.7.1.bb</a><br>
+++ b/meta/recipes-extended/minicom/<a href=3D"http://minicom_2.8.bb" rel=
=3D"noreferrer" target=3D"_blank">minicom_2.8.bb</a><br>
@@ -7,17 +7,12 @@ LICENSE =3D &quot;GPLv2+&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D420477abc567404debca0=
a2a1cb6b645 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://src/minicom.h;beginline=3D1;endline=3D12;md5=3Da58838cb709f0db517=
f4e42730c49e81&quot;<br>
<br>
-SRC_URI =3D &quot;${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.gz =
\<br>
+SRC_URI =3D &quot;${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.bz2=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://allow.to.disable.lockdev.p=
atch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-fix-minicom-h-v-retur=
n-value-is-not-0.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-build-issus-surfa=
ced-due-to-musl.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Drop-superfluous-glob=
al-variable-definitions.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Drop-superfluous-glob=
al-variable-definitions.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-Drop-superfluous-glob=
al-variable-definitions.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;9021cb8c5445f6e6e74b2acc39962d62&quot;<br>
-SRC_URI[sha256sum] =3D &quot;532f836b7a677eb0cb1dca8d70302b73729c3d30df26d=
58368d712e5cca041f1&quot;<br>
+SRC_URI[sha256sum] =3D &quot;38cea30913a20349326ff3f1763ee1512b7b41601c24f=
065f365e18e9db0beba&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[lockdev] =3D &quot;--enable-lockdev,--disable-lockdev,l=
ockdev&quot;<br>
-- <br>
2.32.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159227): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159227" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159227</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87539156/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87539156/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000001a83e905d27a7149--


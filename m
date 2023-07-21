Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C1DEB64DD
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 16:51:01 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.12068.1689958256477971517
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 09:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Yf1Yx5YF;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4fb7769f15aso3422194e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 09:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689958254; x=1690563054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WgEplNi5tu8lmD+N239MvrExZ+QkFuwJSLDYDktoDQI=;
        b=Yf1Yx5YF3vlJjGrIL7dCmOnxvSf48yY5Zneyj5rBwpWgkaW5wUX/cd4365QqIJaGjz
         HmLr13bfw3y5glOMp4B/jZqiVNdg1sawRtNO4hqOogw/yGqfd51pP4z0aP8wgmOMjqMG
         HYePpaj9rUEx4fGHJmRijNxiO38db4qPUgJWitJZs5CjlfMs4KIWSczom8gljyh35DC/
         OvNHamvCaIGRgQ5V73upGMXr2+w3Nf2dQkW51qwheMHYCV99FnaAUwQkWA6c7LPxnLPd
         CrTKWdsqo+s6clcLBaAsiJJLopyTaquzev2QY4Mo43voBef64jAwh0wXaY4qQoMpFEV0
         j5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689958254; x=1690563054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgEplNi5tu8lmD+N239MvrExZ+QkFuwJSLDYDktoDQI=;
        b=fEBLlaAM9mxvm70DJnmch+BcB4oFVCRqiCkQBAREdlKhDn14nFSrLFRsfYeOhdKZO7
         KQtsAe+kB/4AnQu8JumCpCM4go+Lo9nUxQNaxfwkAIi98w+NBpd9QnTgEcwxeUhw6cDB
         qlGoPcc/IlNiJUc5UTU4lLt0LYMhtcKiiLWFFYxYXNaUtXLftM5I/vpS2IEEIDh/8ff5
         gujNco+FrsROpsuQhm2gzh9Mub8Y35ZhwjoNCE4iUre2BqJh+/4gvGpaxOiVFHrX35ys
         rEHrVqZ4GgY/kk80GLxH7QS7z8XolmThhUzQwlQF5Dr8ARIb9izTcAlWfIimpLUOw6tc
         N+yQ==
X-Gm-Message-State: ABy/qLaTjXaG6Cjwa0YgNRnG+W6TlAtx8WwDpxfBpUp/dvhfCGcIldH0
	3oTl+2tlTDkcqMokFfAjEHc2Q6wBMTZBYUd7QOg=
X-Google-Smtp-Source: APBJJlH1xCj5nugbUXKnI6jO3Dj+T9VA4aLqCPCWfG4wQ6rfCkQwQS/CilGgswztf+RQNHLm5fWdoeQgrMXKy+twr7Q=
X-Received: by 2002:a05:6512:2115:b0:4fb:89f2:594d with SMTP id
 q21-20020a056512211500b004fb89f2594dmr1547554lfr.63.1689958254081; Fri, 21
 Jul 2023 09:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230721124809.2324399-1-tgamblin@baylibre.com>
In-Reply-To: <20230721124809.2324399-1-tgamblin@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Jul 2023 19:50:42 +0300
Message-ID: <CANNYZj98-ENCds0+uAqnwFtkePNeJDpXiW_qrXqtfeKOdrztUw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] iproute2: upgrade 6.3.0 -> 6.4.0
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006b7ce90601021114"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 16:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184706

--0000000000006b7ce90601021114
Content-Type: text/plain; charset="UTF-8"

Thanks!

Alex

On Fri 21. Jul 2023 at 15.48, Trevor Gamblin <tgamblin@baylibre.com> wrote:

> Changelog:
> https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/log/
>
> Added a patch for including limits.h with musl builds, or else
> we get failures such as:
>
> | mdb.c: In function 'mdb_parse_vni':
> | mdb.c:666:47: error: 'ULONG_MAX' undeclared (first use in this function)
> |   666 |         if ((endptr && *endptr) || vni_num == ULONG_MAX)
> |       |                                               ^~~~~~~~~
> | mdb.c:666:47: note: 'ULONG_MAX' is defined in header '<limits.h>'; did
> you forget to '#include <limits.h>'?
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
> v2 modifies the included patch to reflect that it has been submitted to
> the upstream iproute2 project.
>
>  .../0001-bridge-mdb.c-include-limits.h.patch  | 41 +++++++++++++++++++
>  .../{iproute2_6.3.0.bb => iproute2_6.4.0.bb}  |  3 +-
>  2 files changed, 43 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
>  rename meta/recipes-connectivity/iproute2/{iproute2_6.3.0.bb =>
> iproute2_6.4.0.bb} (95%)
>
> diff --git
> a/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
> b/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
> new file mode 100644
> index 0000000000..f9a0e35d83
> --- /dev/null
> +++
> b/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
> @@ -0,0 +1,41 @@
> +From b13f04c0c685b6d2474aa7d97e191531f327bc45 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Thu, 20 Jul 2023 14:32:23 -0400
> +Subject: [PATCH] bridge/mdb.c: include limits.h
> +
> +Upstream-Status: Submitted
> +(
> https://lore.kernel.org/netdev/20230720203726.2316251-1-tgamblin@baylibre.com/
> )
> +
> +While building iproute2 6.4.0 with musl using Yocto Project, errors such
> +as the following were encountered:
> +
> +| mdb.c: In function 'mdb_parse_vni':
> +| mdb.c:666:47: error: 'ULONG_MAX' undeclared (first use in this function)
> +|   666 |         if ((endptr && *endptr) || vni_num == ULONG_MAX)
> +|       |                                               ^~~~~~~~~
> +| mdb.c:666:47: note: 'ULONG_MAX' is defined in header '<limits.h>'; did
> you forget to '#include <limits.h>'?
> +
> +Include limits.h in bridge/mdb.c to fix this issue. This change is based
> +on one in Alpine Linux, but the author there had no plans to submit:
> +
> https://git.alpinelinux.org/aports/commit/main/iproute2/include.patch?id=bd46efb8a8da54948639cebcfa5b37bd608f1069
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + bridge/mdb.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/bridge/mdb.c b/bridge/mdb.c
> +index fbb4f704..18793458 100644
> +--- a/bridge/mdb.c
> ++++ b/bridge/mdb.c
> +@@ -15,6 +15,7 @@
> + #include <string.h>
> + #include <arpa/inet.h>
> + #include <netdb.h>
> ++#include <limits.h>
> +
> + #include "libnetlink.h"
> + #include "utils.h"
> +--
> +2.41.0
> +
> diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb
> b/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb
> similarity index 95%
> rename from meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb
> rename to meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb
> index 892fa854da..32e2f8176b 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb
> +++ b/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb
> @@ -13,9 +13,10 @@ DEPENDS = "flex-native bison-native iptables libcap"
>
>  SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
>             file://0001-libc-compat.h-add-musl-workaround.patch \
> +           file://0001-bridge-mdb.c-include-limits.h.patch \
>             "
>
> -SRC_URI[sha256sum] =
> "dfb2a98db96e7a653cffc6693335a1a466e29a34b6ac528be48f35e1d2766732"
> +SRC_URI[sha256sum] =
> "4c51b8decbc7e4da159ffb066f590cfb93dbf9af7ff86b1647ce42b7c179a272"
>
>  inherit update-alternatives bash-completion pkgconfig
>
> --
> 2.41.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184694):
> https://lists.openembedded.org/g/openembedded-core/message/184694
> Mute This Topic: https://lists.openembedded.org/mt/100275858/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000006b7ce90601021114
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks!</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">Alex=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Fri 21. Jul 2023 at 15.48, Trevor Gamblin &lt;<a href=
=3D"mailto:tgamblin@baylibre.com">tgamblin@baylibre.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-co=
lor:rgb(204,204,204)">Changelog: <a href=3D"https://git.kernel.org/pub/scm/=
network/iproute2/iproute2.git/log/" rel=3D"noreferrer" target=3D"_blank">ht=
tps://git.kernel.org/pub/scm/network/iproute2/iproute2.git/log/</a><br>
<br>
Added a patch for including limits.h with musl builds, or else<br>
we get failures such as:<br>
<br>
| mdb.c: In function &#39;mdb_parse_vni&#39;:<br>
| mdb.c:666:47: error: &#39;ULONG_MAX&#39; undeclared (first use in this fu=
nction)<br>
|=C2=A0 =C2=A0666 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((endptr &amp;&amp;=
 *endptr) || vni_num =3D=3D ULONG_MAX)<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~<br>
| mdb.c:666:47: note: &#39;ULONG_MAX&#39; is defined in header &#39;&lt;lim=
its.h&gt;&#39;; did you forget to &#39;#include &lt;limits.h&gt;&#39;?<br>
<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@baylibre.com" =
target=3D"_blank">tgamblin@baylibre.com</a>&gt;<br>
---<br>
v2 modifies the included patch to reflect that it has been submitted to<br>
the upstream iproute2 project.<br>
<br>
=C2=A0.../0001-bridge-mdb.c-include-limits.h.patch=C2=A0 | 41 +++++++++++++=
++++++<br>
=C2=A0.../{<a href=3D"http://iproute2_6.3.0.bb" rel=3D"noreferrer" target=
=3D"_blank">iproute2_6.3.0.bb</a> =3D&gt; <a href=3D"http://iproute2_6.4.0.=
bb" rel=3D"noreferrer" target=3D"_blank">iproute2_6.4.0.bb</a>}=C2=A0 |=C2=
=A0 3 +-<br>
=C2=A02 files changed, 43 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-b=
ridge-mdb.c-include-limits.h.patch<br>
=C2=A0rename meta/recipes-connectivity/iproute2/{<a href=3D"http://iproute2=
_6.3.0.bb" rel=3D"noreferrer" target=3D"_blank">iproute2_6.3.0.bb</a> =3D&g=
t; <a href=3D"http://iproute2_6.4.0.bb" rel=3D"noreferrer" target=3D"_blank=
">iproute2_6.4.0.bb</a>} (95%)<br>
<br>
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-=
include-limits.h.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-b=
ridge-mdb.c-include-limits.h.patch<br>
new file mode 100644<br>
index 0000000000..f9a0e35d83<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include=
-limits.h.patch<br>
@@ -0,0 +1,41 @@<br>
+From b13f04c0c685b6d2474aa7d97e191531f327bc45 Mon Sep 17 00:00:00 2001<br>
+From: Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@baylibre.com" target=
=3D"_blank">tgamblin@baylibre.com</a>&gt;<br>
+Date: Thu, 20 Jul 2023 14:32:23 -0400<br>
+Subject: [PATCH] bridge/mdb.c: include limits.h<br>
+<br>
+Upstream-Status: Submitted<br>
+(<a href=3D"https://lore.kernel.org/netdev/20230720203726.2316251-1-tgambl=
in@baylibre.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.=
org/netdev/20230720203726.2316251-1-tgamblin@baylibre.com/</a>)<br>
+<br>
+While building iproute2 6.4.0 with musl using Yocto Project, errors such<b=
r>
+as the following were encountered:<br>
+<br>
+| mdb.c: In function &#39;mdb_parse_vni&#39;:<br>
+| mdb.c:666:47: error: &#39;ULONG_MAX&#39; undeclared (first use in this f=
unction)<br>
+|=C2=A0 =C2=A0666 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((endptr &amp;&amp=
; *endptr) || vni_num =3D=3D ULONG_MAX)<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~<br>
+| mdb.c:666:47: note: &#39;ULONG_MAX&#39; is defined in header &#39;&lt;li=
mits.h&gt;&#39;; did you forget to &#39;#include &lt;limits.h&gt;&#39;?<br>
+<br>
+Include limits.h in bridge/mdb.c to fix this issue. This change is based<b=
r>
+on one in Alpine Linux, but the author there had no plans to submit:<br>
+<a href=3D"https://git.alpinelinux.org/aports/commit/main/iproute2/include=
.patch?id=3Dbd46efb8a8da54948639cebcfa5b37bd608f1069" rel=3D"noreferrer" ta=
rget=3D"_blank">https://git.alpinelinux.org/aports/commit/main/iproute2/inc=
lude.patch?id=3Dbd46efb8a8da54948639cebcfa5b37bd608f1069</a><br>
+<br>
+Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@baylibre.com"=
 target=3D"_blank">tgamblin@baylibre.com</a>&gt;<br>
+---<br>
+ bridge/mdb.c | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/bridge/mdb.c b/bridge/mdb.c<br>
+index fbb4f704..18793458 100644<br>
+--- a/bridge/mdb.c<br>
++++ b/bridge/mdb.c<br>
+@@ -15,6 +15,7 @@<br>
+ #include &lt;string.h&gt;<br>
+ #include &lt;arpa/inet.h&gt;<br>
+ #include &lt;netdb.h&gt;<br>
++#include &lt;limits.h&gt;<br>
+ <br>
+ #include &quot;libnetlink.h&quot;<br>
+ #include &quot;utils.h&quot;<br>
+-- <br>
+2.41.0<br>
+<br>
diff --git a/meta/recipes-connectivity/iproute2/<a href=3D"http://iproute2_=
6.3.0.bb" rel=3D"noreferrer" target=3D"_blank">iproute2_6.3.0.bb</a> b/meta=
/recipes-connectivity/iproute2/<a href=3D"http://iproute2_6.4.0.bb" rel=3D"=
noreferrer" target=3D"_blank">iproute2_6.4.0.bb</a><br>
similarity index 95%<br>
rename from meta/recipes-connectivity/iproute2/<a href=3D"http://iproute2_6=
.3.0.bb" rel=3D"noreferrer" target=3D"_blank">iproute2_6.3.0.bb</a><br>
rename to meta/recipes-connectivity/iproute2/<a href=3D"http://iproute2_6.4=
.0.bb" rel=3D"noreferrer" target=3D"_blank">iproute2_6.4.0.bb</a><br>
index 892fa854da..32e2f8176b 100644<br>
--- a/meta/recipes-connectivity/iproute2/<a href=3D"http://iproute2_6.3.0.b=
b" rel=3D"noreferrer" target=3D"_blank">iproute2_6.3.0.bb</a><br>
+++ b/meta/recipes-connectivity/iproute2/<a href=3D"http://iproute2_6.4.0.b=
b" rel=3D"noreferrer" target=3D"_blank">iproute2_6.4.0.bb</a><br>
@@ -13,9 +13,10 @@ DEPENDS =3D &quot;flex-native bison-native iptables libc=
ap&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.ta=
r.xz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-libc-compat.h-add-mus=
l-workaround.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-bridge-mdb.c-include-=
limits.h.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;dfb2a98db96e7a653cffc6693335a1a466e29a34b6ac5=
28be48f35e1d2766732&quot;<br>
+SRC_URI[sha256sum] =3D &quot;4c51b8decbc7e4da159ffb066f590cfb93dbf9af7ff86=
b1647ce42b7c179a272&quot;<br>
<br>
=C2=A0inherit update-alternatives bash-completion pkgconfig<br>
<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#184694): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/184694" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/184694</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100275858/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100275858/1686489</a><br>
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

--0000000000006b7ce90601021114--


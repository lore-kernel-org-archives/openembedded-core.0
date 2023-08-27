Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F791C83F11
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 22:43:05 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.2122.1693176180599948259
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 15:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=VF9v5cQe;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5712b68dbc0so1825848eaf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 15:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693176179; x=1693780979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VSh0FRbDK3KsFD9fraq6Fcs77iOzVY8huT0QjnVsmhU=;
        b=VF9v5cQegTHWB4YXch3jEK8B0TNetn1Qz1DgsqbPyp0t2drPhAfC9eeHt0zyKZtDiP
         dpxwXNMyYiAE69d0554zBP7l7QHtrf0vn8VZks8PKTnlXQHNpl4vWCqXKlIkPdKPGgta
         kDuacwY2bC4+Vd/eBx0H5+QROLaVqVF0RAesSID2K+y2qBq88+wkHEy5PWvTJCQgizzq
         XZhD5Wzox8hMJbIkYgxHSqPxCLwoduHCp0Fy+gSnPDMrCFBatpFlHQxKV7eTc7gUN4hm
         AMXOieVbWUVR2iNoxusWcqOoo2RD/7Nb75TijwlCMbF8rrwtR0iVegTlBbbIyAnjJTTP
         oZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693176179; x=1693780979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VSh0FRbDK3KsFD9fraq6Fcs77iOzVY8huT0QjnVsmhU=;
        b=guvtwf9XaAfk2aVB8jBJGrN46zU/hAUWTIi8/Sk6QgGDWGEXiBWkAAS0ofJj5MgDok
         g8FQkPvtGR9XksYMyIQs/WYBVa/naKsBkZt95uvcF10CdrLSMg3psaUSSBTZ6oVfjZR6
         RRktsZre81obFrSf33f+dEtWQMp166POju2T/khQFHEnt6XU3e4TRyaUMC0zeZVcy8wa
         d1dlml1R7D1DuD3CChEtyFpJUCDcKiLGRM8RBgh2/mCuiZhGkEcTI1rDlRwgC2I/AYfO
         akW/mRkm0Og4ghvKFO1VTXHk2g/grlr32h9DWP3XSVq44121YrHXlEamvVyrdTUqoB7g
         vadw==
X-Gm-Message-State: AOJu0YylAayZtTxXz8KuaTI+kVQcuE8qexJS+P6XHyG5L/FjFV78N33x
	0sJ/7t60GU6gCXSmQthnXjSKKTcgTJ5PGTaGDcA=
X-Google-Smtp-Source: AGHT+IF2AnM2WxJc4GRWIRSsPIrgBv2hJT1B2l56R32xlJF/BaWvWh8RegG4MhznGlae76RM9udzrHHed0vQDaVWBQs=
X-Received: by 2002:a4a:301e:0:b0:570:fdf2:41f0 with SMTP id
 q30-20020a4a301e000000b00570fdf241f0mr9559615oof.1.1693176179446; Sun, 27 Aug
 2023 15:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230827221021.1349269-1-abe.kohandel@gmail.com>
In-Reply-To: <20230827221021.1349269-1-abe.kohandel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Aug 2023 15:42:48 -0700
Message-ID: <CAMKF1sp2tQ1uu7jHJ8teiMdtHzn6fOZCpiQHyjBEtpFivyDOtg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] libdnf: resolve cstdint inclusion
 for newer gcc versions
To: Abe Kohandel <abe.kohandel@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b7da580603ef4ca4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 22:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186809

--000000000000b7da580603ef4ca4
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 27, 2023 at 3:12 PM Abe Kohandel <abe.kohandel@gmail.com> wrote:

> Depending on the host gcc version, libdnf fails to compile due to
> missing cstdint inclusion. The issue has already been addressed
> upstream, add the patch to resolve this for older versions of the
> library.
>
> This commit is taken directly from the libdnf project at
> https://github.com/rpm-software-management/libdnf
>
> Signed-off-by: Abe Kohandel <abe.kohandel@gmail.com>
> ---
>  ...58-Don-t-assume-inclusion-of-cstdint.patch | 56 +++++++++++++++++++
>  meta/recipes-devtools/libdnf/libdnf_0.66.0.bb |  1 +
>  2 files changed, 57 insertions(+)
>  create mode 100644
> meta/recipes-devtools/libdnf/libdnf/0001-Fix-1558-Don-t-assume-inclusion-of-cstdint.patch
>
> diff --git
> a/meta/recipes-devtools/libdnf/libdnf/0001-Fix-1558-Don-t-assume-inclusion-of-cstdint.patch
> b/meta/recipes-devtools/libdnf/libdnf/0001-Fix-1558-Don-t-assume-inclusion-of-cstdint.patch
> new file mode 100644
> index 0000000000..51fa141f79
> --- /dev/null
> +++
> b/meta/recipes-devtools/libdnf/libdnf/0001-Fix-1558-Don-t-assume-inclusion-of-cstdint.patch
> @@ -0,0 +1,56 @@
> +From 779ea105564b6d717300af2fcb02a399737a536f Mon Sep 17 00:00:00 2001
> +From: ctxnop <ctxnop@gmail.com>
> +Date: Mon, 15 May 2023 19:30:16 +0200
> +Subject: [PATCH] Fix #1558: Don't assume inclusion of cstdint
> +
> +With last versions of gcc, some headers don't include cstdint anymore,
> +but some sources assume that it is.
> +
> +Upstream-Status: Submitted [
> https://github.com/rpm-software-management/libdnf/pull/1602]


This pull is already merged at this time so status should be marked
Backport


> +Signed-off-by: ctxnop <ctxnop@gmail.com>
> +---
> + libdnf/conf/ConfigMain.hpp    | 1 +
> + libdnf/conf/ConfigRepo.hpp    | 1 +
> + libdnf/conf/OptionSeconds.hpp | 2 ++
> + 3 files changed, 4 insertions(+)
> +
> +diff --git a/libdnf/conf/ConfigMain.hpp b/libdnf/conf/ConfigMain.hpp
> +index 19395c71..59f65c48 100644
> +--- a/libdnf/conf/ConfigMain.hpp
> ++++ b/libdnf/conf/ConfigMain.hpp
> +@@ -32,6 +32,7 @@
> + #include "OptionString.hpp"
> + #include "OptionStringList.hpp"
> +
> ++#include <cstdint>
> + #include <memory>
> +
> + namespace libdnf {
> +diff --git a/libdnf/conf/ConfigRepo.hpp b/libdnf/conf/ConfigRepo.hpp
> +index 2b198441..84cafbad 100644
> +--- a/libdnf/conf/ConfigRepo.hpp
> ++++ b/libdnf/conf/ConfigRepo.hpp
> +@@ -26,6 +26,7 @@
> + #include "ConfigMain.hpp"
> + #include "OptionChild.hpp"
> +
> ++#include <cstdint>
> + #include <memory>
> +
> + namespace libdnf {
> +diff --git a/libdnf/conf/OptionSeconds.hpp b/libdnf/conf/OptionSeconds.hpp
> +index dc714b23..a80a973f 100644
> +--- a/libdnf/conf/OptionSeconds.hpp
> ++++ b/libdnf/conf/OptionSeconds.hpp
> +@@ -25,6 +25,8 @@
> +
> + #include "OptionNumber.hpp"
> +
> ++#include <cstdint>
> ++
> + namespace libdnf {
> +
> + /**
> +--
> +2.42.0
> +
> diff --git a/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
> b/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
> index 2558f96851..9ed4108777 100644
> --- a/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
> +++ b/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
> @@ -11,6 +11,7 @@ SRC_URI = "git://
> github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
>             file://enable_test_data_dir_set.patch \
>             file://0001-drop-FindPythonInstDir.cmake.patch \
>
> file://0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-data.patch \
> +           file://0001-Fix-1558-Don-t-assume-inclusion-of-cstdint.patch \
>             "
>
>  SRCREV = "add5d5418b140a86d08667dd2b14793093984875"
> --
> 2.42.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186808):
> https://lists.openembedded.org/g/openembedded-core/message/186808
> Mute This Topic: https://lists.openembedded.org/mt/100999045/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b7da580603ef4ca4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Aug 27, 2023 at 3:12 PM Abe Kohandel &lt;<a href=3D=
"mailto:abe.kohandel@gmail.com">abe.kohandel@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Depending on the host gcc version, libdn=
f fails to compile due to<br>
missing cstdint inclusion. The issue has already been addressed<br>
upstream, add the patch to resolve this for older versions of the<br>
library.<br>
<br>
This commit is taken directly from the libdnf project at<br>
<a href=3D"https://github.com/rpm-software-management/libdnf" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/rpm-software-management/libdnf</=
a><br>
<br>
Signed-off-by: Abe Kohandel &lt;<a href=3D"mailto:abe.kohandel@gmail.com" t=
arget=3D"_blank">abe.kohandel@gmail.com</a>&gt;<br>
---<br>
=C2=A0...58-Don-t-assume-inclusion-of-cstdint.patch | 56 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.66.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libdnf_0.66.0.bb</a> |=C2=A0 1 +<br>
=C2=A02 files changed, 57 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Fix-1558-=
Don-t-assume-inclusion-of-cstdint.patch<br>
<br>
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Fix-1558-Don-t-assume=
-inclusion-of-cstdint.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Fix-=
1558-Don-t-assume-inclusion-of-cstdint.patch<br>
new file mode 100644<br>
index 0000000000..51fa141f79<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Fix-1558-Don-t-assume-inclus=
ion-of-cstdint.patch<br>
@@ -0,0 +1,56 @@<br>
+From 779ea105564b6d717300af2fcb02a399737a536f Mon Sep 17 00:00:00 2001<br>
+From: ctxnop &lt;<a href=3D"mailto:ctxnop@gmail.com" target=3D"_blank">ctx=
nop@gmail.com</a>&gt;<br>
+Date: Mon, 15 May 2023 19:30:16 +0200<br>
+Subject: [PATCH] Fix #1558: Don&#39;t assume inclusion of cstdint<br>
+<br>
+With last versions of gcc, some headers don&#39;t include cstdint anymore,=
<br>
+but some sources assume that it is.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/rpm-software-man=
agement/libdnf/pull/1602" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/rpm-software-management/libdnf/pull/1602</a>]</blockquote><div dir=
=3D"auto"><br></div><div dir=3D"auto">This pull is already merged at this t=
ime so status should be marked Backport=C2=A0</div><div dir=3D"auto"><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
+Signed-off-by: ctxnop &lt;<a href=3D"mailto:ctxnop@gmail.com" target=3D"_b=
lank">ctxnop@gmail.com</a>&gt;<br>
+---<br>
+ libdnf/conf/ConfigMain.hpp=C2=A0 =C2=A0 | 1 +<br>
+ libdnf/conf/ConfigRepo.hpp=C2=A0 =C2=A0 | 1 +<br>
+ libdnf/conf/OptionSeconds.hpp | 2 ++<br>
+ 3 files changed, 4 insertions(+)<br>
+<br>
+diff --git a/libdnf/conf/ConfigMain.hpp b/libdnf/conf/ConfigMain.hpp<br>
+index 19395c71..59f65c48 100644<br>
+--- a/libdnf/conf/ConfigMain.hpp<br>
++++ b/libdnf/conf/ConfigMain.hpp<br>
+@@ -32,6 +32,7 @@<br>
+ #include &quot;OptionString.hpp&quot;<br>
+ #include &quot;OptionStringList.hpp&quot;<br>
+ <br>
++#include &lt;cstdint&gt;<br>
+ #include &lt;memory&gt;<br>
+ <br>
+ namespace libdnf {<br>
+diff --git a/libdnf/conf/ConfigRepo.hpp b/libdnf/conf/ConfigRepo.hpp<br>
+index 2b198441..84cafbad 100644<br>
+--- a/libdnf/conf/ConfigRepo.hpp<br>
++++ b/libdnf/conf/ConfigRepo.hpp<br>
+@@ -26,6 +26,7 @@<br>
+ #include &quot;ConfigMain.hpp&quot;<br>
+ #include &quot;OptionChild.hpp&quot;<br>
+ <br>
++#include &lt;cstdint&gt;<br>
+ #include &lt;memory&gt;<br>
+ <br>
+ namespace libdnf {<br>
+diff --git a/libdnf/conf/OptionSeconds.hpp b/libdnf/conf/OptionSeconds.hpp=
<br>
+index dc714b23..a80a973f 100644<br>
+--- a/libdnf/conf/OptionSeconds.hpp<br>
++++ b/libdnf/conf/OptionSeconds.hpp<br>
+@@ -25,6 +25,8 @@<br>
+ <br>
+ #include &quot;OptionNumber.hpp&quot;<br>
+ <br>
++#include &lt;cstdint&gt;<br>
++<br>
+ namespace libdnf {<br>
+ <br>
+ /**<br>
+-- <br>
+2.42.0<br>
+<br>
diff --git a/meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.66.0.b=
b" rel=3D"noreferrer" target=3D"_blank">libdnf_0.66.0.bb</a> b/meta/recipes=
-devtools/libdnf/<a href=3D"http://libdnf_0.66.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libdnf_0.66.0.bb</a><br>
index 2558f96851..9ed4108777 100644<br>
--- a/meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.66.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libdnf_0.66.0.bb</a><br>
+++ b/meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.66.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libdnf_0.66.0.bb</a><br>
@@ -11,6 +11,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/rpm-=
software-management/libdnf;branch=3Ddnf-4-master;p" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/rpm-software-management/libdnf;branch=3Ddnf-4-mast=
er;p</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://enable_test_data_dir_set.p=
atch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-drop-FindPythonInstDi=
r.cmake.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-libdnf-dnf-context.cp=
p-do-not-try-to-access-BDB-data.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-1558-Don-t-assume=
-inclusion-of-cstdint.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRCREV =3D &quot;add5d5418b140a86d08667dd2b14793093984875&quot;<br>
-- <br>
2.42.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#186808): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/186808" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/186808</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100999045/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100999045/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000b7da580603ef4ca4--


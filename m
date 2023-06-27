Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0502EB64DD
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 09:56:46 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.9229.1687859797689991601
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 02:56:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QaOprCfw;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1a28de15c8aso4099331fac.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 02:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687859797; x=1690451797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t9O7jXw6BvdgBjrbPQCyszIJ23mSIGxCp31GB5CnLrE=;
        b=QaOprCfw1JScQ+SElC73jAYQLFYHBveqb+wDS2wJ4uTF6SNhhOrfbXqW8Fr/smbcv/
         d5rbdvs9ZNgBOI2qNCxK8etr8KszarLC0ca73FNUFCxB1wItiaasY2+J9rqOLfWlWJ+V
         3WEatcs64CjWQ30jO1ab1IU+ebkSfATGXWTqiZG/QThSMoUHf+4XcdGgOM+Da9azyrWv
         DsyLiadgKak0hcHFrQCrsXZa0KRQUC6dc45bSu+yLIkTvkdIXfMheOnXcwfaL/upo7Gu
         x6Ng6/A7gTUOPEmJs4CgwquAX7RtxntLt8hiqcZGfGZ1KEl+nTpXF21Qn4ihosuFVitB
         6Ydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687859797; x=1690451797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t9O7jXw6BvdgBjrbPQCyszIJ23mSIGxCp31GB5CnLrE=;
        b=bEv44qsgauROGmfo8wkke6NhXeiLzIH2B35bf+lV49TH7AmCwU1EJCaIaif8N7J8qf
         4dAa9eBo2tpbETq/jhciy6e5lKRib06xpOT1FRi/ZAciz/eVde7WQ05hqizcKCshPHVf
         hJ7BP9EHgkwwHCzeAD/8EoUyPTlovIwZtyR7UI8FUIweKaVbvq3pGkeDHLBq9UxALIKq
         zxVXfQq6hV6ID5mCRmMDffWCMAwvTvM2/NdYebZf9m2bkkoe67rh1MdgbFPZrg1wjTSO
         pxU7tsrHWqz4sLMN7Peoc13qz+0hDZbj5MQVCpLQ0l+GmeM0DeribZf+hzgBbqH1EFzF
         LrJA==
X-Gm-Message-State: AC+VfDxncdycnk97Rcf0A7LVSYnyPLPx4kICHszLZTXyiXq5iF/FrQtC
	TSKuWbGRM6BDLJ1ZrDSTuRJ2AlftbYuorpaLT5qYfHyYAfQ=
X-Google-Smtp-Source: ACHHUZ4ojDGK5JAuMQoKMYxGFaqvaLS7DCcDdNfw3Uq5TsuCrfCbrG5v5D6VcHrvAbEsF88ccohoNgVUeWAIp7QEi7Q=
X-Received: by 2002:a05:6870:284:b0:17a:ce6b:720 with SMTP id
 q4-20020a056870028400b0017ace6b0720mr26127814oaf.19.1687859796575; Tue, 27
 Jun 2023 02:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230626214620.121199-1-sakib.sajal@windriver.com>
In-Reply-To: <20230626214620.121199-1-sakib.sajal@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Jun 2023 11:56:25 +0200
Message-ID: <CAMKF1spHOzGussgKRXZifbQUxKj4DdSF1JkJ-WcyrbVfLchdRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bno_plot.py, btt_plot.py: Ask for python3 specifically
To: sakib.sajal@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009b0a7105ff197b87"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 09:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183478

--0000000000009b0a7105ff197b87
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 26, 2023 at 11:46 PM Sakib Sajal via lists.openembedded.org
<sakib.sajal=windriver.com@lists.openembedded.org> wrote:

> python2 has been deprecated, use python3 instead
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  ...plot.py-Ask-for-python3-specifically.patch | 35 +++++++++++++++++++
>  meta/recipes-kernel/blktrace/blktrace_git.bb  |  4 ++-
>  2 files changed, 38 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch
>
> diff --git
> a/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch
> b/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch
> new file mode 100644
> index 0000000000..a3b8a98589
> --- /dev/null
> +++
> b/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch
> @@ -0,0 +1,35 @@
> +From b8d9618cbbec5a04cf6dede0a6ceda41021b92ae Mon Sep 17 00:00:00 2001
> +From: Sakib Sajal <sakib.sajal@windriver.com>
> +Date: Mon, 26 Jun 2023 17:34:01 -0400
> +Subject: [PATCH] bno_plot.py, btt_plot.py: Ask for python3 specifically
> +
> +python2 is deprecated, use python3.
> +
> +Upstream-Status: Denied [
> https://www.spinics.net/lists/linux-btrace/msg01364.html]
> +


I think the response is not rejection yet if you provide a convincing
explanation why using python3 instead of python makes it more portable and
explicit than asking for python which could be anything and also this is a
distro decision and not python community decision


> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + btt/bno_plot.py | 2 +-
> + btt/btt_plot.py | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/btt/bno_plot.py b/btt/bno_plot.py
> +index 3aa4e19..d7d7159 100644
> +--- a/btt/bno_plot.py
> ++++ b/btt/bno_plot.py
> +@@ -1,4 +1,4 @@
> +-#! /usr/bin/env python
> ++#! /usr/bin/env python3
> + #
> + # btt blkno plotting interface
> + #
> +diff --git a/btt/btt_plot.py b/btt/btt_plot.py
> +index 40bc71f..8620d31 100755
> +--- a/btt/btt_plot.py
> ++++ b/btt/btt_plot.py
> +@@ -1,4 +1,4 @@
> +-#! /usr/bin/env python
> ++#! /usr/bin/env python3
> + #
> + # btt_plot.py: Generate matplotlib plots for BTT generate data files
> + #
> diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb
> b/meta/recipes-kernel/blktrace/blktrace_git.bb
> index d0eeba3208..288784236a 100644
> --- a/meta/recipes-kernel/blktrace/blktrace_git.bb
> +++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
> @@ -14,7 +14,9 @@ SRCREV = "366d30b9cdb20345c5d064af850d686da79b89eb"
>
>  PV = "1.3.0+git${SRCPV}"
>
> -SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master;protocol=https"
> +SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master;protocol=https
> \
> +
>  file://0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch \
> +           "
>
>  S = "${WORKDIR}/git"
>
> --
> 2.40.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183431):
> https://lists.openembedded.org/g/openembedded-core/message/183431
> Mute This Topic: https://lists.openembedded.org/mt/99798201/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000009b0a7105ff197b87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jun 26, 2023 at 11:46 PM Sakib Sajal via <a href=3D=
"http://lists.openembedded.org">lists.openembedded.org</a> &lt;sakib.sajal=
=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">windriver.com@li=
sts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>python2 has been deprecated, use python3 instead<br>
<br>
Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.com"=
 target=3D"_blank">sakib.sajal@windriver.com</a>&gt;<br>
---<br>
=C2=A0...plot.py-Ask-for-python3-specifically.patch | 35 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-kernel/blktrace/<a href=3D"http://blktrace_git.bb" rel=
=3D"noreferrer" target=3D"_blank">blktrace_git.bb</a>=C2=A0 |=C2=A0 4 ++-<b=
r>
=C2=A02 files changed, 38 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-kernel/blktrace/blktrace/0001-bno_plo=
t.py-btt_plot.py-Ask-for-python3-specifically.patch<br>
<br>
diff --git a/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plo=
t.py-Ask-for-python3-specifically.patch b/meta/recipes-kernel/blktrace/blkt=
race/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch<br>
new file mode 100644<br>
index 0000000000..a3b8a98589<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-As=
k-for-python3-specifically.patch<br>
@@ -0,0 +1,35 @@<br>
+From b8d9618cbbec5a04cf6dede0a6ceda41021b92ae Mon Sep 17 00:00:00 2001<br>
+From: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.com" target=
=3D"_blank">sakib.sajal@windriver.com</a>&gt;<br>
+Date: Mon, 26 Jun 2023 17:34:01 -0400<br>
+Subject: [PATCH] bno_plot.py, btt_plot.py: Ask for python3 specifically<br=
>
+<br>
+python2 is deprecated, use python3.<br>
+<br>
+Upstream-Status: Denied [<a href=3D"https://www.spinics.net/lists/linux-bt=
race/msg01364.html" rel=3D"noreferrer" target=3D"_blank">https://www.spinic=
s.net/lists/linux-btrace/msg01364.html</a>]<br>
+</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I think the res=
ponse is not rejection yet if you provide a convincing explanation why usin=
g python3 instead of python makes it more portable and explicit than asking=
 for python which could be anything and also this is a distro decision and =
not python community decision</div><div dir=3D"auto"><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex" dir=3D"auto"><br>
+Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.com=
" target=3D"_blank">sakib.sajal@windriver.com</a>&gt;<br>
+---<br>
+ btt/bno_plot.py | 2 +-<br>
+ btt/btt_plot.py | 2 +-<br>
+ 2 files changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/btt/bno_plot.py b/btt/bno_plot.py<br>
+index 3aa4e19..d7d7159 100644<br>
+--- a/btt/bno_plot.py<br>
++++ b/btt/bno_plot.py<br>
+@@ -1,4 +1,4 @@<br>
+-#! /usr/bin/env python<br>
++#! /usr/bin/env python3<br>
+ #<br>
+ # btt blkno plotting interface<br>
+ #<br>
+diff --git a/btt/btt_plot.py b/btt/btt_plot.py<br>
+index 40bc71f..8620d31 100755<br>
+--- a/btt/btt_plot.py<br>
++++ b/btt/btt_plot.py<br>
+@@ -1,4 +1,4 @@<br>
+-#! /usr/bin/env python<br>
++#! /usr/bin/env python3<br>
+ #<br>
+ # btt_plot.py: Generate matplotlib plots for BTT generate data files<br>
+ #<br>
diff --git a/meta/recipes-kernel/blktrace/<a href=3D"http://blktrace_git.bb=
" rel=3D"noreferrer" target=3D"_blank">blktrace_git.bb</a> b/meta/recipes-k=
ernel/blktrace/<a href=3D"http://blktrace_git.bb" rel=3D"noreferrer" target=
=3D"_blank">blktrace_git.bb</a><br>
index d0eeba3208..288784236a 100644<br>
--- a/meta/recipes-kernel/blktrace/<a href=3D"http://blktrace_git.bb" rel=
=3D"noreferrer" target=3D"_blank">blktrace_git.bb</a><br>
+++ b/meta/recipes-kernel/blktrace/<a href=3D"http://blktrace_git.bb" rel=
=3D"noreferrer" target=3D"_blank">blktrace_git.bb</a><br>
@@ -14,7 +14,9 @@ SRCREV =3D &quot;366d30b9cdb20345c5d064af850d686da79b89eb=
&quot;<br>
<br>
=C2=A0PV =3D &quot;1.3.0+git${SRCPV}&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.dk/blktrace.git;branc=
h=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">git.kerne=
l.dk/blktrace.git;branch=3Dmaster;protocol=3Dhttps</a>&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.dk/blktrace.git;branc=
h=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">git.kerne=
l.dk/blktrace.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-bno_plot.py-btt_plot.=
py-Ask-for-python3-specifically.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-- <br>
2.40.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#183431): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/183431" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/183431</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99798201/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99798201/1997914</a><br>
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

--0000000000009b0a7105ff197b87--


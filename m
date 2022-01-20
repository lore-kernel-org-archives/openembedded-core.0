Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639AFC433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 19:05:30 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web08.456.1642705526992070327
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 11:05:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QX8oqgLK;
 spf=pass (domain: gmail.com, ip: 209.85.222.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id w21so12656605uan.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 11:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E+91Tiivz+SvhnccWJrxcKu6Tj1S6/2VUCjrOkvJ4Ps=;
        b=QX8oqgLKvUHJQsjohtGSuuhYzurgIQFk1MgkJi2PxPhKFDRUkc4QlIuhUS6cD4ygEa
         s7qpJl023WaZLPAebNlMJgGJAMeAfJu4TdZRNVnjBRmML8MS/ckdybUjTc9QTr1pKKSe
         mfqR5RFE65OLNWnuQzaIwmWE3Y8GQbcnwzMXVj9p+Dt2kTkXJ+9B0Fiw6KdPYeS0ZPfg
         e0WFhufacd+qYbHJuKW/8txXxoqond68k4JlbyNHS/Q4kCiMPgWkaqVEBkGDLBxCT5tq
         qB7jQzPgsW5SFsVpkPbbNFGHTw2Toh122qYyDpeafDElv9zGbjCuoVoR+nKBCpH918Bz
         kM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E+91Tiivz+SvhnccWJrxcKu6Tj1S6/2VUCjrOkvJ4Ps=;
        b=hXtj+ABcZHKFauyiStz6paLbrq71Dgh/NiAkynwuAh4MIzFlGyna3503bKF/PF5SEV
         QpbQmoS/WdXF/42ArGhwOpQt+hyV4MVZCh+GdGh0tImy742ulF8tLU18KNkXx7WlqGv3
         D26x8HngsQvRFQbyfv3Rm7p7Lu2BYreVV7uaIDwU2fme8UBFuzwOFxxR4mN4C8o3j887
         7VfbNudbag7vdXurxzZj+zVldU/46MpSA45Ep3yVy9Xg/0AjFWLFyiEWR44EDlUmjuGV
         svGlYrtiVv4vGY0LlREgeig5d+25wYF+Rwa0Ano8dYW3HbZ5sC4MoMeLJUCLPoq2wSwa
         xL3A==
X-Gm-Message-State: AOAM531uZJd/ryAIAgPJBY/FIkJWaID2St4YA2O9d6f+UhcUrxK1kRRz
	3o3Ah/tG2n+M6QyhAtJudmXwGgjV8ESNs4fnAI0=
X-Google-Smtp-Source: 
 ABdhPJzV9tGDnPD3LskJ/fHHBXT1l5jPmOUFeiGbyP171A1OCZGpzU16GM0DC7CjtrUGg3flFE/4Su4rElbRmQNNH1A=
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr260749uai.89.1642705526087;
 Thu, 20 Jan 2022 11:05:26 -0800 (PST)
MIME-Version: 1.0
References: <20220120165455.42075-1-kory.maincent@bootlin.com>
In-Reply-To: <20220120165455.42075-1-kory.maincent@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Jan 2022 20:05:14 +0100
Message-ID: 
 <CANNYZj9PsUAFh=2Xofn6RcCBfq8Gs-NiRB5MW1gbpseqZ88VOw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] icu: fix make_icudata dependencies
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 thomas.petazzoni@bootlin.com,
	Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000005a628d05d6082ff1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 19:05:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160777

--0000000000005a628d05d6082ff1
Content-Type: text/plain; charset="UTF-8"

This isn't correct, as recipe's own sysroot is populated by
prepare_recipe_sysroot() of the recipe.

I think the real correct fix is

addtask do_make_icudata before do_configure after do_patch
do_prepare_recipe_sysroot

You need to tweak the line at the end of the recipe.

Alex

On Thu, 20 Jan 2022 at 17:54, Kory Maincent <kory.maincent@bootlin.com>
wrote:

> The make_icudata task is set before the configure task then the
> dependencies for this task are not populate yet.
>
> Fixed it by setting the deptask flag to do_populate_sysroot. With this, the
> do_populate_sysroot task of each item in DEPENDS must complete before
> do_make_icudata can execute.
>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>
> Change in v2:
> Use deptask flag instead of setting manually the task dependencies with
> depends flag.
>
>  meta/recipes-support/icu/icu_70.1.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-support/icu/icu_70.1.bb
> b/meta/recipes-support/icu/icu_70.1.bb
> index 0988ae8b8e..ff5e249e9d 100644
> --- a/meta/recipes-support/icu/icu_70.1.bb
> +++ b/meta/recipes-support/icu/icu_70.1.bb
> @@ -123,6 +123,9 @@ EXTRA_OECONF:append:libc-musl = "
> ac_cv_func_strtod_l=no"
>  PACKAGECONFIG ?= ""
>  PACKAGECONFIG[make-icudata] = ",,,"
>
> +# Add dependencies to make_icudata
> +do_make_icudata[deptask] += "do_populate_sysroot"
> +
>  do_make_icudata:class-target () {
>      ${@bb.utils.contains('PACKAGECONFIG', 'make-icudata', '', 'exit 0',
> d)}
>      cd ${S}
> --
> 2.25.1
>
>

--0000000000005a628d05d6082ff1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This isn&#39;t correct, as recipe&#39;s own sysroot i=
s populated by prepare_recipe_sysroot() of the recipe.<br></div><div><br></=
div><div>I think the real correct fix is <br></div><div><br></div><div>addt=
ask do_make_icudata before do_configure after do_patch do_prepare_recipe_sy=
sroot</div><div><br></div><div>You need to tweak the line at the end of the=
 recipe.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 20 Jan 2022 at 17:5=
4, Kory Maincent &lt;<a href=3D"mailto:kory.maincent@bootlin.com">kory.main=
cent@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">The make_icudata task is set before the configure task then=
 the<br>
dependencies for this task are not populate yet.<br>
<br>
Fixed it by setting the deptask flag to do_populate_sysroot. With this, the=
<br>
do_populate_sysroot task of each item in DEPENDS must complete before<br>
do_make_icudata can execute.<br>
<br>
Signed-off-by: Kory Maincent &lt;<a href=3D"mailto:kory.maincent@bootlin.co=
m" target=3D"_blank">kory.maincent@bootlin.com</a>&gt;<br>
---<br>
<br>
Change in v2:<br>
Use deptask flag instead of setting manually the task dependencies with<br>
depends flag.<br>
<br>
=C2=A0meta/recipes-support/icu/<a href=3D"http://icu_70.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">icu_70.1.bb</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/recipes-support/icu/<a href=3D"http://icu_70.1.bb" rel=3D=
"noreferrer" target=3D"_blank">icu_70.1.bb</a> b/meta/recipes-support/icu/<=
a href=3D"http://icu_70.1.bb" rel=3D"noreferrer" target=3D"_blank">icu_70.1=
.bb</a><br>
index 0988ae8b8e..ff5e249e9d 100644<br>
--- a/meta/recipes-support/icu/<a href=3D"http://icu_70.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">icu_70.1.bb</a><br>
+++ b/meta/recipes-support/icu/<a href=3D"http://icu_70.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">icu_70.1.bb</a><br>
@@ -123,6 +123,9 @@ EXTRA_OECONF:append:libc-musl =3D &quot; ac_cv_func_str=
tod_l=3Dno&quot;<br>
=C2=A0PACKAGECONFIG ?=3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[make-icudata] =3D &quot;,,,&quot;<br>
<br>
+# Add dependencies to make_icudata<br>
+do_make_icudata[deptask] +=3D &quot;do_populate_sysroot&quot;<br>
+<br>
=C2=A0do_make_icudata:class-target () {<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;make=
-icudata&#39;, &#39;&#39;, &#39;exit 0&#39;, d)}<br>
=C2=A0 =C2=A0 =C2=A0cd ${S}<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000005a628d05d6082ff1--


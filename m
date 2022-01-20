Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D450C433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 14:37:39 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web10.12636.1642689458502921211
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 06:37:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VWT89BT1;
 spf=pass (domain: gmail.com, ip: 209.85.222.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id u6so11296617uaq.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 06:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cg83CsLKRR2RImkUoYI9sTJUhqWiOqTuCR9bhspTkIw=;
        b=VWT89BT1ocsnNgOOdEB7tFPVjVrFighMif2y7aA2dNyX8hQWjDy6LiD/qSipnE6Ma5
         5yTfkSkj8tj5iCSp7HBuUhF9u7C2wfuFDfd9Ia8zjUb0U8hTmyXgdlkrG/flLMxlkted
         meDu63O70ssoS/zSTTKS8d+8Sm9i6KsyLvr9HFpe0fJxGIi4+vVlXebxpy4zqsSKmLab
         l2R76Vr2+TXYbfBaqJoUr0HBXX/YwrkjY7Mcz0BzlL6Qe9lkPh8hon5hO4VgZd4SNnMp
         BAgHJrNJU9b4MgLTFNhzqK94xlRLOtokJun+r19Xc5cruYNNC+e7qdRpl1KrAV+v2Y4K
         sP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cg83CsLKRR2RImkUoYI9sTJUhqWiOqTuCR9bhspTkIw=;
        b=QJyYNtSX7Q9r3fsG5eFHOxFZxs5LZlvbVWgbObl6Lc2QNqBeRfen2ZEXsinxRbaK0c
         HYF8EhwOqwSKVRXCa+MAe+V++ISV8ed8dSyU23bO00KSthzrjyeE4P1QNhcAFVSln4zf
         1cR8PezW5FQrFnnuPv/lbeC0cR45NERvHY02Ba/wGeFUIq9x6p0RyUWkKjtkFN8IsOq1
         cVFfclFFV3R9sGJtTG5U85vjEmDGoCyrMWbCJDNgYY33MV1q95Ir8fV3IRXa1jjjl/l0
         0LI3YeviHc4aWTj8RH0F9uuTtHSfXuyVsyvLC1Y44XAkVHmnAc8B3AulH+vPS+tX92W4
         nCIg==
X-Gm-Message-State: AOAM530p/d0u9EiyudiHqX/T74p+NC0RuECpLP7RBgGzOxIm7zZ+9vWR
	N+eXSCMH5LqRSNL4fHDyJhVGOaZYvWHk2SEHuU8=
X-Google-Smtp-Source: 
 ABdhPJy6Gs26H59ZBgMMzzv0Ku9HVHOK4QbtZ9FbW9eRRdEF6dMt+vJ3H4rthXzc2wlM5kIxcw+qw5ltR+rpyX0qFwo=
X-Received: by 2002:a9f:3763:: with SMTP id a32mr2778061uae.93.1642689457605;
 Thu, 20 Jan 2022 06:37:37 -0800 (PST)
MIME-Version: 1.0
References: <20220120143242.35930-1-kory.maincent@bootlin.com>
In-Reply-To: <20220120143242.35930-1-kory.maincent@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Jan 2022 15:37:26 +0100
Message-ID: 
 <CANNYZj8iOcC6TLkOW2Bt6G+Ey=h5zwxrEUNQC8E7v8yXz0GFpg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] icu: fix make_icudata dependencies
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 thomas.petazzoni@bootlin.com,
	Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000098cffa05d6047106"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 14:37:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160762

--00000000000098cffa05d6047106
Content-Type: text/plain; charset="UTF-8"

Can we rather make a dependency on the task that prepares the sysroot,
instead of listing the dependencies one by one (with anonymous python too!)?

Alex

On Thu, 20 Jan 2022 at 15:32, Kory Maincent <kory.maincent@bootlin.com>
wrote:

> The make_icudata task is set before the configure task then the
> dependencies for this task are not populate yet.
>
> Fixed it by setting autoconf, automake and ccache native dependencies
> to this task.
>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  meta/recipes-support/icu/icu_70.1.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/recipes-support/icu/icu_70.1.bb
> b/meta/recipes-support/icu/icu_70.1.bb
> index 0988ae8b8e..ae985bca4f 100644
> --- a/meta/recipes-support/icu/icu_70.1.bb
> +++ b/meta/recipes-support/icu/icu_70.1.bb
> @@ -123,6 +123,14 @@ EXTRA_OECONF:append:libc-musl = "
> ac_cv_func_strtod_l=no"
>  PACKAGECONFIG ?= ""
>  PACKAGECONFIG[make-icudata] = ",,,"
>
> +# Add dependencies to make_icudata
> +do_make_icudata[depends] = "autoconf-native:do_populate_sysroot
> automake-native:do_populate_sysroot"
> +python() {
> +    if not (bb.data.inherits_class("native", d) or
> +            bb.utils.to_boolean(d.getVar('CCACHE_DISABLE'))):
> +        d.appendVarFlag('do_make_icudata', 'depends', '
> ccache-native:do_populate_sysroot')
> +}
> +
>  do_make_icudata:class-target () {
>      ${@bb.utils.contains('PACKAGECONFIG', 'make-icudata', '', 'exit 0',
> d)}
>      cd ${S}
> --
> 2.25.1
>
>

--00000000000098cffa05d6047106
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can we rather make a dependency on the task that prep=
ares the sysroot, instead of listing the dependencies one by one (with anon=
ymous python too!)?</div><div><br></div><div>Alex<br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 20 Jan 2=
022 at 15:32, Kory Maincent &lt;<a href=3D"mailto:kory.maincent@bootlin.com=
">kory.maincent@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">The make_icudata task is set before the configur=
e task then the<br>
dependencies for this task are not populate yet.<br>
<br>
Fixed it by setting autoconf, automake and ccache native dependencies<br>
to this task.<br>
<br>
Signed-off-by: Kory Maincent &lt;<a href=3D"mailto:kory.maincent@bootlin.co=
m" target=3D"_blank">kory.maincent@bootlin.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/icu/<a href=3D"http://icu_70.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">icu_70.1.bb</a> | 8 ++++++++<br>
=C2=A01 file changed, 8 insertions(+)<br>
<br>
diff --git a/meta/recipes-support/icu/<a href=3D"http://icu_70.1.bb" rel=3D=
"noreferrer" target=3D"_blank">icu_70.1.bb</a> b/meta/recipes-support/icu/<=
a href=3D"http://icu_70.1.bb" rel=3D"noreferrer" target=3D"_blank">icu_70.1=
.bb</a><br>
index 0988ae8b8e..ae985bca4f 100644<br>
--- a/meta/recipes-support/icu/<a href=3D"http://icu_70.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">icu_70.1.bb</a><br>
+++ b/meta/recipes-support/icu/<a href=3D"http://icu_70.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">icu_70.1.bb</a><br>
@@ -123,6 +123,14 @@ EXTRA_OECONF:append:libc-musl =3D &quot; ac_cv_func_st=
rtod_l=3Dno&quot;<br>
=C2=A0PACKAGECONFIG ?=3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[make-icudata] =3D &quot;,,,&quot;<br>
<br>
+# Add dependencies to make_icudata<br>
+do_make_icudata[depends] =3D &quot;autoconf-native:do_populate_sysroot aut=
omake-native:do_populate_sysroot&quot;<br>
+python() {<br>
+=C2=A0 =C2=A0 if not (bb.data.inherits_class(&quot;native&quot;, d) or<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.to_boolean(d.getVar(&#3=
9;CCACHE_DISABLE&#39;))):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVarFlag(&#39;do_make_icudata&#39;, &#3=
9;depends&#39;, &#39; ccache-native:do_populate_sysroot&#39;)<br>
+}<br>
+<br>
=C2=A0do_make_icudata:class-target () {<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;make=
-icudata&#39;, &#39;&#39;, &#39;exit 0&#39;, d)}<br>
=C2=A0 =C2=A0 =C2=A0cd ${S}<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--00000000000098cffa05d6047106--


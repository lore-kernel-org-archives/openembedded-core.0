Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB6BC433FE
	for <webhook@archiver.kernel.org>; Sat,  5 Nov 2022 09:58:43 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.4654.1667642317449433087
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Nov 2022 02:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ANdFOTpP;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id k19so9559330lji.2
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 02:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TqRrtHHv7gAhM66t+Ve6jPyYtqZDTW5e4gtZ5GEY+j0=;
        b=ANdFOTpPdWA0sKvNKDuopBP0KyYl0HZgRMsERfOTvuU24ziR8D37sVF0Rnw7ilr29u
         7Tm6RM67OptEWB3Wv96aNMIOMtGqmkbG2Ihq5iWEmAusQjLNOM+tPiy2zbgdVT7CUvG6
         hRhXztI/b9iJza9oscpNihcAyYEAs/YFjFoDfqiIYhKZHgY0lSMt0uzwT41onm0EtNQ4
         yelkjFHrkaeapH3YFDRRth1zdDOoxnbPHTZlNMGKABvOEXlmoNH4KaOt9TejOC3wjcuX
         sJUIhgBjWhstpAXY4PnhXdoQW+6PhNmGgiw3I5+WADefCIbCZpGKnDZ4d4U6rOBX7M0z
         gEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TqRrtHHv7gAhM66t+Ve6jPyYtqZDTW5e4gtZ5GEY+j0=;
        b=S26X7TsfjV9s7gt1+BQcc7KGDA9NOIOm3238e9Pf4QocPk4WSmErQWEjIsEdRNaf+N
         7/edKaYwEu77SIzcv/7Xqa2J4/zjBjCnkDfnF5deiYoVOTXIQLcwYJ6F+cRENMpy/3ix
         Pp9ZiY4+pywDGzSHwiBAHrMwQ1xwenjOAyxhlFht5KFttL6MiT/v6libQrdFEdgV6i95
         WsyWGj2j6Fq6Kb56sl7nLJkYKRd8kYTIXj4NRL+dFSR1lGSqDoWFibM4Rp8nbNT7bSMU
         qoRxIk19eJTByNGHOFKn43vwjOUxchJfY7PCnvQHb3Cwqwtnc0xWOCwfoIPxtVgW3cV1
         VoyA==
X-Gm-Message-State: ACrzQf31nVFyKeTRNtv4WCM/lSV4lTrneKO0tFA9+zECtv4CLGWtYsZG
	a9hoMzS9/ZdvKIUQlEe7yPm3FXpAOOqKR9WRTCo=
X-Google-Smtp-Source: AMsMyM76o0GExWJpdYAyagl3/rhgy1PslyxDkcxnNLXFxWCG8b0oot76Lw9rgMxAm2oVGooHzPDA3vSKoO/8v4lacVs=
X-Received: by 2002:a2e:885a:0:b0:277:eba:852 with SMTP id z26-20020a2e885a000000b002770eba0852mr3199299ljj.31.1667642315545;
 Sat, 05 Nov 2022 02:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20221105095026.820-1-cp0613@linux.alibaba.com>
In-Reply-To: <20221105095026.820-1-cp0613@linux.alibaba.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 5 Nov 2022 10:58:24 +0100
Message-ID: <CANNYZj9e3T6kRwPTYbT8rp1gWX40bJMrAgcv8HD8Huu8hZL+UQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-python] [PATCH] add meta-python/recipes-devtools/python/python3-brotli_1.0.9.bb
To: cp0613 <cp0613@linux.alibaba.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d4a3d605ecb63b25"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 09:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172744

--000000000000d4a3d605ecb63b25
Content-Type: text/plain; charset="UTF-8"

Wrong mailing list, needs to go to openembedded-devel.

Alex

On Sat 5. Nov 2022 at 10.50, cp0613 <cp0613@linux.alibaba.com> wrote:

> From: cp0613 <cp0613@linux.alibaba.com>
>
> Signed-off-by: cp0613 <cp0613@linux.alibaba.com>
> ---
>  .../python/python3-brotli_1.0.9.bb             | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-brotli_1.0.9.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-brotli_1.0.9.bb
> b/meta-python/recipes-devtools/python/python3-brotli_1.0.9.bb
> new file mode 100644
> index 000000000..5dfac5823
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-brotli_1.0.9.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Brotli compression format"
> +HOMEPAGE = "https://pypi.org/project/Brotli/"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=941ee9cd1609382f946352712a319b4b"
> +
> +PYPI_PACKAGE = "Brotli"
> +PYPI_PACKAGE_EXT = "zip"
> +
> +SRC_URI[sha256sum] =
> "4d1b810aa0ed773f81dceda2cc7b403d01057458730e309856356d4ef4188438"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS:${PN} = "\
> +  ${PYTHON_PN}-cffi \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172743):
> https://lists.openembedded.org/g/openembedded-core/message/172743
> Mute This Topic: https://lists.openembedded.org/mt/94823671/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000d4a3d605ecb63b25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Wrong mailing list, needs to go to openembedded-devel.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat 5. Nov 202=
2 at 10.50, cp0613 &lt;<a href=3D"mailto:cp0613@linux.alibaba.com">cp0613@l=
inux.alibaba.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:s=
olid;padding-left:1ex;border-left-color:rgb(204,204,204)">From: cp0613 &lt;=
<a href=3D"mailto:cp0613@linux.alibaba.com" target=3D"_blank">cp0613@linux.=
alibaba.com</a>&gt;<br>
<br>
Signed-off-by: cp0613 &lt;<a href=3D"mailto:cp0613@linux.alibaba.com" targe=
t=3D"_blank">cp0613@linux.alibaba.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-brotli_1.0.9.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-brotli_1.0.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++++++++++++++<br>
=C2=A01 file changed, 18 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-brotli_1.0.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-b=
rotli_1.0.9.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
brotli_1.0.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-brotli_1.0.9.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-brot=
li_1.0.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-brotli_1.0.9.bb</=
a><br>
new file mode 100644<br>
index 000000000..5dfac5823<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-brotli_=
1.0.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-brotli_1.0.9.bb</a><=
br>
@@ -0,0 +1,18 @@<br>
+SUMMARY =3D &quot;Brotli compression format&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://pypi.org/project/Brotli/" rel=3D"nor=
eferrer" target=3D"_blank">https://pypi.org/project/Brotli/</a>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D941ee9cd1609382f946352712a=
319b4b&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;Brotli&quot;<br>
+PYPI_PACKAGE_EXT =3D &quot;zip&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;4d1b810aa0ed773f81dceda2cc7b403d01057458730e3=
09856356d4ef4188438&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+RDEPENDS:${PN} =3D &quot;\<br>
+=C2=A0 ${PYTHON_PN}-cffi \<br>
+&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172743): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172743" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/172743</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94823671/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94823671/1686489</a><br>
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

--000000000000d4a3d605ecb63b25--


Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web08.33899.1611564633186470754
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 00:50:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ryVJcwhy;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id o125so6775945vsc.6
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 00:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8hoC7Gj+V4kwErIoEQwAeINfeED+74HpC18XyOFWdS8=;
        b=ryVJcwhynRUTvE3qP8Vr+wjRJzu4c+nsKMEVcSkqI1cdzzp4zABvVrJa/NQ48xEtgv
         8SGxI3iFuK/qS/YOQdPihaaVgPze8oVh8x0Iwm8wT0Y/U1HFO+K/RiTIi8B8MUApBBqE
         pfaIdT6+2CtQBKF0Cg72IzMeADzfP51py+BFnmjE2Oh1W+J2rekx3AvoO7ULypxouDsP
         Nr2Hdtm/9HE0dXthgyl6bcg3CbIX+iXnDxJuwcBVxZpe4Iz5RnUIiR5Ii7apqNojVPf6
         Kp0d1a4h0lVgXpck18FlZewEcWX2DeL3cWlZqNE6t7VWAxqJ31A42miM+RA0qNGXt7B8
         CAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8hoC7Gj+V4kwErIoEQwAeINfeED+74HpC18XyOFWdS8=;
        b=baZO36aRjuzsD07v7Zs80+TxV6n6RIP+WYLLTKWdA1nV1TxHeyCdjUTKP7qLAvN4qG
         DQaZrfcrSCToaqrdc2onyCNOS4x+ehOsbLFcLb61ijPFtLSDtYXLpxsXfXNfFrrVRrrR
         J7IuVcZM9aT2t8S2AgQSuriSHjpGm8CGAmSw8Mefj839fatGFDZKIGEUOeA383l/FF2a
         yoiEpvvNgq7g64vFHR6dUzpSqf/R3rKAia6Yj/mjAUVbNaxGsEkaoTwGttXn2N38+j5I
         7lGVmzf+9oVgfKLAG+hLB76JRTkaAeeSA0xC66BuJM6lASIVjLiyRUDuCn4JsLRcUGV3
         QsBQ==
X-Gm-Message-State: AOAM532PgUqFRQh5JcHndzE+M9FSFi8P5LOU9cytMrowSAsl67pWJHmg
	HV4Gcixbf3xcaAacYFR9+6pCOC9EDgQeIz/Al/c=
X-Google-Smtp-Source: ABdhPJwdeAUgxuJA5MNakGscyJNb+4wmpxS0PKtvZXYfIDKdcr+3ZxCtQweu1p7BxDP48+QwYjtr30E0WDyoR/2WR5Y=
X-Received: by 2002:a67:e014:: with SMTP id c20mr748187vsl.54.1611564632351;
 Mon, 25 Jan 2021 00:50:32 -0800 (PST)
MIME-Version: 1.0
References: <1611541232-1991-1-git-send-email-wangmy@cn.fujitsu.com> <165D6D18BAAD288B.11914@lists.openembedded.org>
In-Reply-To: <165D6D18BAAD288B.11914@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 25 Jan 2021 09:50:20 +0100
Message-ID: <CANNYZj_+9pAFBVk0hKr4RN0d_UK7n7uw1HRj-CAuUa98Zr8koA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-docutils: Fix bug of program rst2man cannot be found.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000071a6b205b9b5a11d"

--00000000000071a6b205b9b5a11d
Content-Type: text/plain; charset="UTF-8"

Please always check first if issue has been fixed upstream and needs to be
backported:
https://gitlab.freedesktop.org/mesa/drm/-/commit/62b9a3eee9bdaafa766e92d5bebeb4e59845c45a

Alex

On Mon, 25 Jan 2021 at 09:43, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> Wait, you need to provide a better explanation. Where does this issue
> happen? And why isn't it fixed upstream?
>
> Alex
>
> On Mon, 25 Jan 2021 at 03:20, Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
>> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
>> ---
>>  .../python/python3-docutils_0.16.bb               | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/python/python3-docutils_0.16.bb
>> b/meta/recipes-devtools/python/python3-docutils_0.16.bb
>> index 50547a1b0c..3b2df223ed 100644
>> --- a/meta/recipes-devtools/python/python3-docutils_0.16.bb
>> +++ b/meta/recipes-devtools/python/python3-docutils_0.16.bb
>> @@ -14,4 +14,19 @@ S = "${WORKDIR}/docutils-${PV}"
>>
>>  inherit distutils3
>>
>> +do_install_append_class-native() {
>> +    mv ${D}${bindir}/rst2html.py ${D}${bindir}/rst2html
>> +    mv ${D}${bindir}/rst2html4.py ${D}${bindir}/rst2html4
>> +    mv ${D}${bindir}/rst2html5.py ${D}${bindir}/rst2html5
>> +    mv ${D}${bindir}/rst2latex.py ${D}${bindir}/rst2latex
>> +    mv ${D}${bindir}/rst2man.py ${D}${bindir}/rst2man
>> +    mv ${D}${bindir}/rst2odt.py ${D}${bindir}/rst2odt
>> +    mv ${D}${bindir}/rst2odt_prepstyles.py
>> ${D}${bindir}/rst2odt_prepstyles
>> +    mv ${D}${bindir}/rst2pseudoxml.py ${D}${bindir}/rst2pseudoxml
>> +    mv ${D}${bindir}/rst2s5.py ${D}${bindir}/rst2s5
>> +    mv ${D}${bindir}/rst2xetex.py ${D}${bindir}/rst2xetex
>> +    mv ${D}${bindir}/rst2xml.py ${D}${bindir}/rst2xml
>> +    mv ${D}${bindir}/rstpep2html.py ${D}${bindir}/rstpep2html
>> +}
>> +
>>  BBCLASSEXTEND = "native"
>> --
>> 2.25.1
>>
>>
>>
>>
>>
>>
>>
> 
>
>

--00000000000071a6b205b9b5a11d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Please always check first if issue has been fixed ups=
tream and needs to be backported:</div><div><a href=3D"https://gitlab.freed=
esktop.org/mesa/drm/-/commit/62b9a3eee9bdaafa766e92d5bebeb4e59845c45a">http=
s://gitlab.freedesktop.org/mesa/drm/-/commit/62b9a3eee9bdaafa766e92d5bebeb4=
e59845c45a</a></div><div><br></div><div>Alex<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 25 Jan 2021=
 at 09:43, Alexander Kanavin via <a href=3D"http://lists.openembedded.org">=
lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@l=
ists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v>Wait, you need to provide a better explanation. Where does this issue hap=
pen? And why isn&#39;t it fixed upstream?<br></div><div><br></div><div>Alex=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Mon, 25 Jan 2021 at 03:20, Wang Mingyu &lt;<a href=3D"mailto:w=
angmy@cn.fujitsu.com" target=3D"_blank">wangmy@cn.fujitsu.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by:=
 Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com" target=3D"_blank"=
>wangmy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-docutils_0.16.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-docutils_0.16.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 +++++++++++++++<br>
=C2=A01 file changed, 15 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-docuti=
ls_0.16.bb" rel=3D"noreferrer" target=3D"_blank">python3-docutils_0.16.bb</=
a> b/meta/recipes-devtools/python/<a href=3D"http://python3-docutils_0.16.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-docutils_0.16.bb</a><br>
index 50547a1b0c..3b2df223ed 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-docutils_0.16=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-docutils_0.16.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-docutils_0.16=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-docutils_0.16.bb</a><br>
@@ -14,4 +14,19 @@ S =3D &quot;${WORKDIR}/docutils-${PV}&quot;<br>
<br>
=C2=A0inherit distutils3<br>
<br>
+do_install_append_class-native() {<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rst2html.py ${D}${bindir}/rst2html<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rst2html4.py ${D}${bindir}/rst2html4<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rst2html5.py ${D}${bindir}/rst2html5<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rst2latex.py ${D}${bindir}/rst2latex<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rst2man.py ${D}${bindir}/rst2man<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rst2odt.py ${D}${bindir}/rst2odt<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rst2odt_prepstyles.py ${D}${bindir}/rst2od=
t_prepstyles<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rst2pseudoxml.py ${D}${bindir}/rst2pseudox=
ml<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rst2s5.py ${D}${bindir}/rst2s5<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rst2xetex.py ${D}${bindir}/rst2xetex<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rst2xml.py ${D}${bindir}/rst2xml<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rstpep2html.py ${D}${bindir}/rstpep2html<b=
r>
+}<br>
+<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div>
<br>
<br>
<br>
</blockquote></div>

--00000000000071a6b205b9b5a11d--

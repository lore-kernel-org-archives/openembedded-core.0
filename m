Return-Path: <kergoth@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8CEAE7C1F0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 15:19:54 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id 32so11372489ota.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 07:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5ic1Bg3sF8f1wZ2lw9ImmeD4m32VEmMjdxcSsMECb1A=;
	b=k2O+3R7qb53K41uVHopDM4e8GUffBSgAnVA/IApGnXePRndv+MVyg45RN3DX9bJcks
	F5zWNr+WkeuBwFYcE5RqTdEv1HPiS63Od6VuSMdKKYW+h2PRUq1XdX9CCdya7UrQ4mle
	Br4Uf9v1uG1HXUYsevMdIX7XTTdFIqeBWDA4G+qqcViOdhlZwpMbe1rMdYHzsvEAmR7N
	n07voThbNUuXM6e2gT+vFYxsO8CoNKgKFdN9BlrRE0XCklJrJO053y5Sa3iB4/vFq+JT
	Qf7fGQKlqlfL0s6YS49L7kzkCM4J8e+zkrFzfPgM+MewY+bsNG2PoFTHppRUtNvtgKuX
	9LUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5ic1Bg3sF8f1wZ2lw9ImmeD4m32VEmMjdxcSsMECb1A=;
	b=VIX50mm9c4KTMS1gEpxIQzyo70vKSzTwVZTNKWldrVhQvWYYLUFss+X2spSqoLiFDE
	ilqus5mGi7FZupeOZZarPEi3DyDmqnSqnO2sc+t11gfQS9N18fl8b+2pRmTnP8fRp5yv
	xlpxzhFEoRr919OSnMnuP8MvWWLRBaIRFnAl0CBlsvY57psj1EuSY3np2iNOnntSZwho
	lTz9P55PpITtOgapuQfVjw7hXZKWnF1osrkjoqaM0Bg6PnsxrJlyyA/cAE2MogSV4wDg
	1JbCrfV/cb4nnQX4h4otUKB7SxXvDxNlIxUav3OA4j2rFKL7smc1x+rcm0nSNQGfH4RZ
	hQyA==
X-Gm-Message-State: AJcUukd0LIaYHxDN0yUZAIjV71Q7Spi01FfFOi8s6qZEAQ2d7vtG0BDP
	nKQ7Vz5/k8heAt0KlYEYKwDqmYsIsu9t7L2g840=
X-Google-Smtp-Source: ALg8bN74/LIAGbQnHWPD7Bc3HtJpMfTEbQIwVC2XCrOT0UIP4edfFEN9aH0a5YH0CSi0TM7J1W9N6SdlGb+M31SB+yw=
X-Received: by 2002:a9d:1b2c:: with SMTP id l41mr8601305otl.1.1547738395285;
	Thu, 17 Jan 2019 07:19:55 -0800 (PST)
MIME-Version: 1.0
References: <20190117071227.57387-1-kai.kang@windriver.com>
	<CABcZANkxhSTj+bha5Sn4zqgjFKCUZUq8XTT0KDj7hndK3Da-Pg@mail.gmail.com>
In-Reply-To: <CABcZANkxhSTj+bha5Sn4zqgjFKCUZUq8XTT0KDj7hndK3Da-Pg@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 17 Jan 2019 08:19:44 -0700
Message-ID: <CABcZAN=CjbACOmwkvKpsMox7fnwM+QTUj=icnyuqdzYMr=ei3g@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: reset default value of DEBUG_PREFIX_MAP
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2019 15:19:54 -0000
Content-Type: multipart/alternative; boundary="000000000000419e67057fa8edc1"

--000000000000419e67057fa8edc1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You also aren=E2=80=99t =E2=80=9Cresetting=E2=80=9D anything, I=E2=80=99d s=
uggest clarifying the summary as
well.

On Thu, Jan 17, 2019 at 8:19 AM Christopher Larson <kergoth@gmail.com>
wrote:

> The commit message doesn=E2=80=99t match what you=E2=80=99re actually doi=
ng. "Specifying
> -fdebug-prefix-map is equivalent to specifying all the individual
> -f*-prefix-map options which means including -fmacro-prefix-map and
> -fdebug-prefix-map currently=E2=80=9D I assume you mean "Specifying
> -ffile-prefix-map=E2=80=9D there.
>
> On Thu, Jan 17, 2019 at 12:13 AM <kai.kang@windriver.com> wrote:
>
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Reset default value of DEBUG_PREFIX_MAP with '-fdebug-prefix-map'.
>> Specifying -fdebug-prefix-map is equivalent to specifying all the
>> individual -f*-prefix-map options which means including
>> -fmacro-prefix-map and -fdebug-prefix-map currently. Option
>> -fmacro-prefix-map helps to avoid buildpaths qa warnings which caused
>> by __FILE__ macro expansion for packages such as llvm and librepo.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>  meta/conf/bitbake.conf | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 0bdcd04d74..d20460e845 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -599,9 +599,9 @@ EXTRA_OEMAKE_prepend_task-install =3D
>> "${PARALLEL_MAKEINST} "
>>  # Optimization flags.
>>  ##################################################################
>>  # Beware: applied last to first
>> -DEBUG_PREFIX_MAP ?=3D
>> "-fdebug-prefix-map=3D${WORKDIR}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}=
-${PR} \
>> -                     -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
>> -                     -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
>> +DEBUG_PREFIX_MAP ?=3D
>> "-ffile-prefix-map=3D${WORKDIR}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-=
${PR} \
>> +                     -ffile-prefix-map=3D${STAGING_DIR_HOST}=3D \
>> +                     -ffile-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
>>  "
>>  DEBUG_FLAGS ?=3D "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}=
"
>>
>> --
>> 2.20.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics
>


--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000419e67057fa8edc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You also aren=E2=80=99t =E2=80=9Cresetting=E2=80=9D anythi=
ng, I=E2=80=99d suggest clarifying the summary as well.</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 17, 2019=
 at 8:19 AM Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.com">ker=
goth@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:sol=
id;border-left-color:rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><d=
iv dir=3D"ltr">The commit message doesn=E2=80=99t match what you=E2=80=99re=
 actually doing. &quot;Specifying -fdebug-prefix-map is equivalent to speci=
fying all the=C2=A0individual -f*-prefix-map options which means including=
=C2=A0-fmacro-prefix-map and -fdebug-prefix-map currently=E2=80=9D I assume=
 you mean &quot;Specifying -ffile-prefix-map=E2=80=9D there.</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail-m_-441412628043=
7379143gmail_attr">On Thu, Jan 17, 2019 at 12:13 AM &lt;<a href=3D"mailto:k=
ai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(2=
04,204,204);padding-left:1ex">From: Kai Kang &lt;<a href=3D"mailto:kai.kang=
@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
<br>
Reset default value of DEBUG_PREFIX_MAP with &#39;-fdebug-prefix-map&#39;.<=
br>
Specifying -fdebug-prefix-map is equivalent to specifying all the<br>
individual -f*-prefix-map options which means including<br>
-fmacro-prefix-map and -fdebug-prefix-map currently. Option<br>
-fmacro-prefix-map helps to avoid buildpaths qa warnings which caused<br>
by __FILE__ macro expansion for packages such as llvm and librepo.<br>
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targe=
t=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 0bdcd04d74..d20460e845 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -599,9 +599,9 @@ EXTRA_OEMAKE_prepend_task-install =3D &quot;${PARALLEL_=
MAKEINST} &quot;<br>
=C2=A0# Optimization flags.<br>
=C2=A0##################################################################<br=
>
=C2=A0# Beware: applied last to first<br>
-DEBUG_PREFIX_MAP ?=3D &quot;-fdebug-prefix-map=3D${WORKDIR}=3D/usr/src/deb=
ug/${PN}/${EXTENDPE}${PV}-${PR} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \<br>
+DEBUG_PREFIX_MAP ?=3D &quot;-ffile-prefix-map=3D${WORKDIR}=3D/usr/src/debu=
g/${PN}/${EXTENDPE}${PV}-${PR} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-ffile-prefix-map=3D${STAGING_DIR_HOST}=3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-ffile-prefix-map=3D${STAGING_DIR_NATIVE}=3D \<br>
=C2=A0&quot;<br>
=C2=A0DEBUG_FLAGS ?=3D &quot;-g -feliminate-unused-debug-types ${DEBUG_PREF=
IX_MAP}&quot;<br>
<br>
-- <br>
2.20.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail-m_-4414126280437379143gmail_signature"><div dir=3D"ltr"><di=
v><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founde=
r - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, Mentor G=
raphics</div></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christoph=
er Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, O=
penZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></d=
iv>

--000000000000419e67057fa8edc1--

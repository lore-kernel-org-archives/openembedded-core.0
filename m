Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
	[209.85.166.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9347E7D15E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 17:12:24 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id x3so14729626iol.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 10:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=drR1d1XO6kuk2F1rU3zGdCFEBVIViOyX0T4vFWz4pKI=;
	b=jjr/a0vLHwSyEOqqp0oLTn9ymvWlTRYHUrC8UzKqg/Hh95dcA6RrY9+y6EdWxAlSgD
	tXgA58s/FITOhhVbShd0gzWIcfPdaUU5LfICMvcOxd2X41HfCeB951jcPnGAsMRJkRgK
	Qk/33vUlbntRYlOtXMYf5R9aZn+GohZ6mlj1VjI/ryQTX1OTbefXRMnbRGHgO50f8rUA
	puoUZgtHmJ7HwmQCD5lhAMVTeIwIkknMcyPw/6Z8OY+SaeImxToCMDPHbM5wNRZh/+M3
	PMqVxIEDS60qmRoFdo77pOWcTd5cXUAjTOJXtLbZPevJ7kOgmBJ0j5Mp0Pyx6u2uflI/
	L5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=drR1d1XO6kuk2F1rU3zGdCFEBVIViOyX0T4vFWz4pKI=;
	b=HxpP0YBpFQ04bWXE9hEn0ESbt8fIEMshtLzG7Iu753jtmnLBeaervARMaMp+HvwzBW
	J6mfddzE+YX3T0YgKBGypbRSINQDjeMag2vIg8T3ozsF+TqrxuGuwZ7VbcokkKsS5MiE
	qq5h0W7Ow5ICnGbQ8jbvJqeGJ+wVF0z5NfeaQ1INxKLOB0M0VvwBv56WXIytu7MsHfs/
	CnwZRnX4b7zN4bA4gS3NCiHniEOBe9fdnpkT/HLuor7EbJi0gg3PwrKLEq9hR/mAp9eV
	N33uYm2b14GgqIdpuiQo2TXxpz6uxMNSHqjvUtl6NgYnhPAAhjriB2ucp+E8n2hVXJsF
	DbUw==
X-Gm-Message-State: APjAAAVMTh1zezcqnccXMzPjQhFrOjQRsa5b/I1uTfTRlJKR9ngdGPJm
	Y7Z87m4UVG+D5w7UW9hp8RWVppyy0qYKM1ETjkI=
X-Google-Smtp-Source: APXvYqyk2qFYDAH2DoOtN1mWBR27WaoodoKHxutxaOe3jCOoWHvNpEPrdYsAiWePSaGNHs+RRsNGpROlY5RXKXUh238=
X-Received: by 2002:a6b:790c:: with SMTP id i12mr12499101iop.265.1553706745464;
	Wed, 27 Mar 2019 10:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <1553701511-32475-1-git-send-email-vincent.prince.fr@gmail.com>
	<CALRtUqv6OrCibt4xYfvJNc_Gy+UqYAeziUQT8Krz7Zo0mR9qbA@mail.gmail.com>
In-Reply-To: <CALRtUqv6OrCibt4xYfvJNc_Gy+UqYAeziUQT8Krz7Zo0mR9qbA@mail.gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Wed, 27 Mar 2019 18:12:14 +0100
Message-ID: <CAB2nKc9YKVxBupFqFO7o5tWH5U4VB=Wo+5BgJxUwMkniHfH-pA@mail.gmail.com>
To: TEXIER Pierre-Jean <texier.pj2@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] Systemd: Add pattern matching support to PACKAGECONFIG
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
X-List-Received-Date: Wed, 27 Mar 2019 17:12:24 -0000
Content-Type: multipart/alternative; boundary="000000000000a60b100585168a9c"

--000000000000a60b100585168a9c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pierre-Jean,

Thanks for your review, I'll rework commit log in V3 tomorrow,

Regards,
Vincent

Le mer. 27 mars 2019 =C3=A0 16:57, TEXIER Pierre-Jean <texier.pj2@gmail.com=
> a
=C3=A9crit :

> Hi Vincent,
>
> Le mer. 27 mars 2019 =C3=A0 16:45, Vincent Prince <vincent.prince.fr@gmai=
l.com>
> a =C3=A9crit :
>
>> libpcre2 is needed to enable grep option to journalctl.
>>
>> Changes in v2:
>> - Fix false case option
>>
>> Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
>> ---
>>  meta/recipes-core/systemd/systemd_241.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>
> The changelog should be added below the "---" line in the patch,
> this allows to not get included into the actual commit log.
>
> Pierre-Jean
>
>
>> diff --git a/meta/recipes-core/systemd/systemd_241.bb
>> b/meta/recipes-core/systemd/systemd_241.bb
>> index a12b9ab..bfbfc81 100644
>> --- a/meta/recipes-core/systemd/systemd_241.bb
>> +++ b/meta/recipes-core/systemd/systemd_241.bb
>> @@ -151,6 +151,7 @@ PACKAGECONFIG[nss-mymachines] =3D
>> "-Dnss-mymachines=3Dtrue,-Dnss-mymachines=3Dfalse"
>>  PACKAGECONFIG[nss-resolve] =3D "-Dnss-resolve=3Dtrue,-Dnss-resolve=3Dfa=
lse"
>>  PACKAGECONFIG[openssl] =3D "-Dopenssl=3Dtrue,-Dopenssl=3Dfalse,openssl"
>>  PACKAGECONFIG[pam] =3D "-Dpam=3Dtrue,-Dpam=3Dfalse,libpam,${PAM_PLUGINS=
}"
>> +PACKAGECONFIG[pcre2] =3D "-Dpcre2=3Dtrue,-Dpcre2=3Dfalse,libpcre2"
>>  PACKAGECONFIG[polkit] =3D "-Dpolkit=3Dtrue,-Dpolkit=3Dfalse"
>>  PACKAGECONFIG[portabled] =3D "-Dportabled=3Dtrue,-Dportabled=3Dfalse"
>>  PACKAGECONFIG[qrencode] =3D "-Dqrencode=3Dtrue,-Dqrencode=3Dfalse,qrenc=
ode"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--000000000000a60b100585168a9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Pierre-Jean,<div dir=3D"auto"><br></div><div dir=3D"au=
to">Thanks for your review, I&#39;ll rework commit log in V3 tomorrow,=C2=
=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards,=C2=A0</div>=
<div dir=3D"auto">Vincent</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Le mer. 27 mars 2019 =C3=A0 16:57, TEXIER Pi=
erre-Jean &lt;<a href=3D"mailto:texier.pj2@gmail.com">texier.pj2@gmail.com<=
/a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi Vincent,</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 27 mars=
 2019 =C3=A0=C2=A016:45, Vincent Prince &lt;<a href=3D"mailto:vincent.princ=
e.fr@gmail.com" target=3D"_blank" rel=3D"noreferrer">vincent.prince.fr@gmai=
l.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">libpcre2 is needed to enable grep option to journalctl.<b=
r>
<br>
Changes in v2:<br>
- Fix false case option<br>
<br>
Signed-off-by: Vincent Prince &lt;<a href=3D"mailto:vincent.prince.fr@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">vincent.prince.fr@gmail.com</a>&=
gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_241.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">systemd_241.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br></blockquote><div><br></div><div>Th=
e changelog should be added below the &quot;---&quot; line in the patch,=C2=
=A0</div><div>this allows to not get included into the actual commit log.=
=C2=A0</div><div><br></div><div>Pierre-Jean</div><div><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_241.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">systemd_241.bb</a> b/meta/rec=
ipes-core/systemd/<a href=3D"http://systemd_241.bb" rel=3D"noreferrer noref=
errer" target=3D"_blank">systemd_241.bb</a><br>
index a12b9ab..bfbfc81 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_241.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">systemd_241.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_241.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">systemd_241.bb</a><br>
@@ -151,6 +151,7 @@ PACKAGECONFIG[nss-mymachines] =3D &quot;-Dnss-mymachine=
s=3Dtrue,-Dnss-mymachines=3Dfalse&quot;<br>
=C2=A0PACKAGECONFIG[nss-resolve] =3D &quot;-Dnss-resolve=3Dtrue,-Dnss-resol=
ve=3Dfalse&quot;<br>
=C2=A0PACKAGECONFIG[openssl] =3D &quot;-Dopenssl=3Dtrue,-Dopenssl=3Dfalse,o=
penssl&quot;<br>
=C2=A0PACKAGECONFIG[pam] =3D &quot;-Dpam=3Dtrue,-Dpam=3Dfalse,libpam,${PAM_=
PLUGINS}&quot;<br>
+PACKAGECONFIG[pcre2] =3D &quot;-Dpcre2=3Dtrue,-Dpcre2=3Dfalse,libpcre2&quo=
t;<br>
=C2=A0PACKAGECONFIG[polkit] =3D &quot;-Dpolkit=3Dtrue,-Dpolkit=3Dfalse&quot=
;<br>
=C2=A0PACKAGECONFIG[portabled] =3D &quot;-Dportabled=3Dtrue,-Dportabled=3Df=
alse&quot;<br>
=C2=A0PACKAGECONFIG[qrencode] =3D &quot;-Dqrencode=3Dtrue,-Dqrencode=3Dfals=
e,qrencode&quot;<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openembedded=
.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>
</blockquote></div>

--000000000000a60b100585168a9c--

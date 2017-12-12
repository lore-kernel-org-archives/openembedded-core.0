Return-Path: <taborskikrzysztof@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4A0097876D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 08:34:32 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id l22so20185557wrc.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 00:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=zdg6bxVdjC86E1WjP5MV+yaV1ttNLeamBDmup3anF3c=;
	b=c8MehrveGWjAgTOtFE1giO4PrJXnHKLMkmR7PbGlqppTbWeIYJOPeVhwPitRWVpZQM
	3D40XBpcZEe4P1A85XYeDw9e2KV91DB97hSENbKCVn86dCM+mIOJf0wvECGub29rIGkt
	HkepmVZAV8W9yFIm3oDb6ZT3cKa/enqEsFYuExmzIIDmss0s432xeJwQs2xktz6AIUbF
	dCkTDwYhMnbPuAFFseT9RNMjcYGk4TJGPZekMetHkoDEZoJY9BFbnQcGVf21fvNsGVYO
	cwKrNvIV1upqufDiRcdVIklLw4qsifkvAhGkjCpIbYaV3M3p3LpRxBRnzzk/Ugw98VQ5
	mfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=zdg6bxVdjC86E1WjP5MV+yaV1ttNLeamBDmup3anF3c=;
	b=BX4JUA+QDsQdih5O63GsSFVuWQtki+BWv3cvixR2OxN2zWWxdOE4GFvbZ/XQvoxHtt
	ojLfvb+vbEbnNXvJx6Tz8KdmQxs6vXYKPvlDXGVZBJuDoIxhV33LYRRHX9u1uQ2SZgnP
	4/Pmlnl+Kv3cSszAM1RB8oCaxkLMvZjHAYBWgOc4e/B5KlYSiUA69DcY6Cvn6cipuLDC
	DA/qTeyve0gyb8iUpLvQCUAIKb7ZpAR6dd8XtFn4k3ayPDWcrGc38S94DN3dRilQSAyi
	F7483phRyvX/ZWU69WCr8oQqV3g3hGt4eS2Lxs4kByJZ/B2FBJO0Lp7vbkThDe3UnmdF
	WQrQ==
X-Gm-Message-State: AKGB3mJr+Gwl3GpCDUuYYXXt+G2mrnqg0KRv9HZU1Ggzqa3nxobxPrLo
	x5248gLfIOW3oGUU4ye8IqTkRHjbeRvfsQBBxvwb+w==
X-Google-Smtp-Source: ACJfBouV3x0weSC042iwv9GazHSYNMtq6gUXLsPyAVFbj7zZRakN+zN2M/QrilNMsclx4h4ttsQfNbHMjGqta9jkcwc=
X-Received: by 10.223.134.76 with SMTP id 12mr3144508wrw.137.1513067673123;
	Tue, 12 Dec 2017 00:34:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.105.70 with HTTP; Tue, 12 Dec 2017 00:34:32 -0800 (PST)
In-Reply-To: <00b201d3704c$8357c870$8a075950$@gmail.com>
References: <20171204181640.31225-1-taborskikrzysztof@gmail.com>
	<00b201d3704c$8357c870$8a075950$@gmail.com>
From: Krzysztof Taborski <taborskikrzysztof@gmail.com>
Date: Tue, 12 Dec 2017 09:34:32 +0100
Message-ID: <CAFmD+WESsG-ebvx_AmDOpisQFaP3_DzvrWr8dF9j88=5V7GBDg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] perl: native modules will not trigger build perl for target.
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
X-List-Received-Date: Tue, 12 Dec 2017 08:34:32 -0000
Content-Type: multipart/alternative; boundary="001a11491a402d7e5605602085e1"

--001a11491a402d7e5605602085e1
Content-Type: text/plain; charset="UTF-8"

kindly reminder

2017-12-08 18:46 GMT+01:00 Krzysztof Taborski <taborskikrzysztof@gmail.com>:

> Hello,
> I would like to request feedback about my patch.
>
> Br,
> Krzysztof Taborski
>
> -----Original Message-----
> From: Krzysztof Taborski [mailto:taborskikrzysztof@gmail.com]
> Sent: Monday, December 04, 2017 7:17 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Krzysztof Taborski
> Subject: [OE-core][PATCH v2] perl: native modules will not trigger build
> perl for target.
>
> Currently building perl-native modules triggers build perl for target due
> to PACKAGES_DYNAMIC regex.
>
> This commit will cause, that perl native modules will trigger perl-native
> build.
>
> Signed-off-by: Krzysztof Taborski <taborskikrzysztof@gmail.com>
> ---
>  meta/recipes-devtools/perl/perl-native_5.24.1.bb | 2 ++
>  meta/recipes-devtools/perl/perl_5.24.1.bb        | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
> b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
> index 48113f05a9..a81dc4d703 100644
> --- a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
> +++ b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
> @@ -134,3 +134,5 @@ EOF
>
>  # Fix the path in sstate
>  SSTATE_SCAN_FILES += "*.pm *.pod *.h *.pl *.sh"
> +PACKAGES_DYNAMIC_class-native += "^perl-module-.*native$"
> +
> diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb
> b/meta/recipes-devtools/perl/perl_5.24.1.bb
> index 6b27b22d22..3dc7805da9 100644
> --- a/meta/recipes-devtools/perl/perl_5.24.1.bb
> +++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
> @@ -323,7 +323,7 @@ python split_perl_packages () {
>      d.setVar(d.expand("RRECOMMENDS_${PN}-modules"), ' '.join(packages))
> }
>
> -PACKAGES_DYNAMIC += "^perl-module-.*"
> +PACKAGES_DYNAMIC += "^perl-module-.*(?<!\-native)$"
>  PACKAGES_DYNAMIC_class-nativesdk += "^nativesdk-perl-module-.*"
>
>  RPROVIDES_perl-lib = "perl-lib"
> --
> 2.13.6
>
>


-- 
Pozdrawiam,
Krzysiek Taborski

--001a11491a402d7e5605602085e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">kindly reminder<br></div><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">2017-12-08 18:46 GMT+01:00 Krzysztof Taborski <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:taborskikrzysztof@gmail.com" target=3D"=
_blank">taborskikrzysztof@gmail.com</a>&gt;</span>:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">Hello,<br>
I would like to request feedback about my patch.<br>
<br>
Br,<br>
Krzysztof Taborski<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
-----Original Message-----<br>
From: Krzysztof Taborski [mailto:<a href=3D"mailto:taborskikrzysztof@gmail.=
com">taborskikrzysztof@<wbr>gmail.com</a>]<br>
Sent: Monday, December 04, 2017 7:17 PM<br>
To: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openembedde=
d-core@lists.<wbr>openembedded.org</a><br>
Cc: Krzysztof Taborski<br>
Subject: [OE-core][PATCH v2] perl: native modules will not trigger build<br=
>
perl for target.<br>
<br>
Currently building perl-native modules triggers build perl for target due<b=
r>
to PACKAGES_DYNAMIC regex.<br>
<br>
This commit will cause, that perl native modules will trigger perl-native<b=
r>
build.<br>
<br>
Signed-off-by: Krzysztof Taborski &lt;<a href=3D"mailto:taborskikrzysztof@g=
mail.com">taborskikrzysztof@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/perl/<a href=3D"http://perl-native_5.24.1.bb" r=
el=3D"noreferrer" target=3D"_blank">per<wbr>l-native_5.24.1.bb</a> | 2 ++<b=
r>
=C2=A0meta/recipes-devtools/perl/<a href=3D"http://perl_5.24.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">per<wbr>l_5.24.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 2 +-<br>
=C2=A02 files changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/perl/<a href=3D"http://perl-native_5.24.=
1.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>erl-native_5.24.1.bb</a><b=
r>
b/meta/recipes-devtools/perl/<a href=3D"http://perl-native_5.24.1.bb" rel=
=3D"noreferrer" target=3D"_blank">p<wbr>erl-native_5.24.1.bb</a><br>
index 48113f05a9..a81dc4d703 100644<br>
--- a/meta/recipes-devtools/perl/<a href=3D"http://perl-native_5.24.1.bb" r=
el=3D"noreferrer" target=3D"_blank">p<wbr>erl-native_5.24.1.bb</a><br>
+++ b/meta/recipes-devtools/perl/<a href=3D"http://perl-native_5.24.1.bb" r=
el=3D"noreferrer" target=3D"_blank">p<wbr>erl-native_5.24.1.bb</a><br>
@@ -134,3 +134,5 @@ EOF<br>
<br>
=C2=A0# Fix the path in sstate<br>
=C2=A0SSTATE_SCAN_FILES +=3D &quot;*.pm *.pod *.h *.pl *.sh&quot;<br>
+PACKAGES_DYNAMIC_class-native +=3D &quot;^perl-module-.*native$&quot;<br>
+<br>
diff --git a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.24.1.bb" r=
el=3D"noreferrer" target=3D"_blank">p<wbr>erl_5.24.1.bb</a><br>
b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.24.1.bb" rel=3D"noref=
errer" target=3D"_blank">p<wbr>erl_5.24.1.bb</a><br>
index 6b27b22d22..3dc7805da9 100644<br>
--- a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.24.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">p<wbr>erl_5.24.1.bb</a><br>
+++ b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.24.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">p<wbr>erl_5.24.1.bb</a><br>
@@ -323,7 +323,7 @@ python split_perl_packages () {<br>
=C2=A0 =C2=A0 =C2=A0d.setVar(d.expand(&quot;<wbr>RRECOMMENDS_${PN}-modules&=
quot;), &#39; &#39;.join(packages))<br>
}<br>
<br>
-PACKAGES_DYNAMIC +=3D &quot;^perl-module-.*&quot;<br>
+PACKAGES_DYNAMIC +=3D &quot;^perl-module-.*(?&lt;!\-native)$<wbr>&quot;<br=
>
=C2=A0PACKAGES_DYNAMIC_class-<wbr>nativesdk +=3D &quot;^nativesdk-perl-modu=
le-.*&quot;<br>
<br>
=C2=A0RPROVIDES_perl-lib =3D &quot;perl-lib&quot;<br>
--<br>
2.13.6<br>
<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr">Pozdrawiam,<div>Krzysiek Taborski</div></div></div>
</div>

--001a11491a402d7e5605602085e1--

Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id B0F42772A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:48:45 +0000 (UTC)
Received: by iouu10 with SMTP id u10so74478572iou.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=CzzJnZEDE/lBqLA9m/eaaoTetfiXPFgSp9UH74pkZOc=;
	b=b56xt89gc4UY+aOmKZev7dW9ydn44aw9ncefdqRBrqdbI/XtbMaGU2Iyqw6GBVCHpo
	Ucj3pXT8JCCR80sbEEniAHnp8F73MJSaMH+vMWbWMrshAla+HMRDvSknd97dy/HqtyMe
	tLWdbs7KtH5KFnTeCYEwX8kZnPT+fSpNMMH4vQDqbVe14H870BJ5b5XYTJbyYMz1jHPr
	wnUy4hwTxvPzzGywNU5TKJvFN8otMqPgAfEfVvt0em//GRZ1uap8aqVJqlPb4qQmf9n5
	v/N2HrFw0B6out5S9nP2CrGJL6Ac+uXQ4xS4LavfNtoHLSzVUbOYtTeErY0qdMdGFO7S
	1VVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=CzzJnZEDE/lBqLA9m/eaaoTetfiXPFgSp9UH74pkZOc=;
	b=BYKLZwKha+P2AiR2f55NMeT/LyEypGmZKidoHY14MmoAaOLNdjPI/KREW7UVl+mnTV
	UgVYR753d7tyWgYuWRicFQhDDovKUs34sswiDEIZLx8wm1ULxmBDyVZf58V9huvw7/g1
	VgZETftLY/5o0pSLfOyuOSkMSwuSWBieirQ1T5Zledi+3S+OXT735kn51r+WkTNsiXVk
	22JHrSD4nhrg7NDbAob0MojWDL9OdYXpOIdGBDBZoM3DMKhItX6fY2aFiI/swTD8vIpV
	oNdkcR0CYkw9172NNrtnf098aU+Q3omMoy4hSL3bjDyJdz1h+4LiSShen1E+uIiH43tc
	5lRw==
X-Received: by 10.107.134.28 with SMTP id i28mr16857942iod.74.1447372125799;
	Thu, 12 Nov 2015 15:48:45 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.93.7 with HTTP; Thu, 12 Nov 2015 15:48:26 -0800 (PST)
In-Reply-To: <25235c4c941f0db5e08dbdea09244fb1ed743630.1447371041.git.chris_larson@mentor.com>
References: <cover.1447371041.git.chris_larson@mentor.com>
	<0608c916d5ea89bc95112b583a04de0cc81a6374.1447371041.git.chris_larson@mentor.com>
	<25235c4c941f0db5e08dbdea09244fb1ed743630.1447371041.git.chris_larson@mentor.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Thu, 12 Nov 2015 16:48:26 -0700
X-Google-Sender-Auth: qjExOudxYYf1wFG9pxS22kRh85k
Message-ID: <CABcZANm8mf8GH=mBp0ZUbgM=jW3SKx-qd3+taUAWBJULdKP7iQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 7/7] nativesdk-perl: set PERL5LIB based on wrapper path
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
X-List-Received-Date: Thu, 12 Nov 2015 23:48:46 -0000
Content-Type: multipart/alternative; boundary=001a113ecc0a6a8db105246095b7

--001a113ecc0a6a8db105246095b7
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 12, 2015 at 4:40 PM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> Rather than relying on OECORE_NATIVE_SYSROOT, we can operate relative to
> the
> wrapper binary location.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/recipes-devtools/perl/perl_5.22.0.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb
> b/meta/recipes-devtools/perl/perl_5.22.0.bb
> index 9df8d04..ea0677a 100644
> --- a/meta/recipes-devtools/perl/perl_5.22.0.bb
> +++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
> @@ -244,9 +244,11 @@ do_install() {
>          ln -s Config_heavy.pl
> ${D}${libdir}/perl/${PV}/Config_heavy-target.pl
>  }
>
> +REL_PERLLIB = "${@os.path.relpath('${libdir}', '${bindir}')}/perl"
> +
>  do_install_append_class-nativesdk () {
>          create_wrapper ${D}${bindir}/perl \
> -
> PERL5LIB='$PERL5LIB:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/site_perl/${PV}:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/vendor_perl/${PV}:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/${PV}'
> +            PERL5LIB='$PERL5LIB:`dirname
> $realpath`/${REL_PERLLIB}/site_perl/${PV}:`dirname
> $realpath`/${REL_PERLLIB}/vendor_perl/${PV}:`dirname
> $realpath`/${REL_PERLLIB}/${PV}'
>

Hmm, perhaps create_wrapper should be altered to provide the binary dirname
as a variable so we can easily reference it, avoiding the need to
repeatedly dirname here.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113ecc0a6a8db105246095b7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Nov 12, 2015 at 4:40 PM, Christopher Larson <span dir=3D"ltr">&lt;<=
a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2ki" class=
=3D"a3s" style=3D"overflow:hidden">From: Christopher Larson &lt;<a href=3D"=
mailto:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
<br>
Rather than relying on OECORE_NATIVE_SYSROOT, we can operate relative to th=
e<br>
wrapper binary location.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/perl/<a href=3D"http://perl_5.22.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">perl_5.22.0.bb</a> | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.22.0.bb" r=
el=3D"noreferrer" target=3D"_blank">perl_5.22.0.bb</a> b/meta/recipes-devto=
ols/perl/<a href=3D"http://perl_5.22.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">perl_5.22.0.bb</a><br>
index 9df8d04..ea0677a 100644<br>
--- a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.22.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">perl_5.22.0.bb</a><br>
+++ b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.22.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">perl_5.22.0.bb</a><br>
@@ -244,9 +244,11 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s Config_heavy.pl ${D}${libdir}/perl/=
${PV}/Config_heavy-target.pl<br>
=C2=A0}<br>
<br>
+REL_PERLLIB =3D &quot;${@os.path.relpath(&#39;${libdir}&#39;, &#39;${bindi=
r}&#39;)}/perl&quot;<br>
+<br>
=C2=A0do_install_append_class-nativesdk () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_wrapper ${D}${bindir}/perl \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PERL5LIB=3D&#39;$PERL5LIB:$OECOR=
E_NATIVE_SYSROOT/${libdir_nativesdk}/perl/site_perl/${PV}:$OECORE_NATIVE_SY=
SROOT/${libdir_nativesdk}/perl/vendor_perl/${PV}:$OECORE_NATIVE_SYSROOT/${l=
ibdir_nativesdk}/perl/${PV}&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PERL5LIB=3D&#39;$PERL5LIB:`dirna=
me $realpath`/${REL_PERLLIB}/site_perl/${PV}:`dirname $realpath`/${REL_PERL=
LIB}/vendor_perl/${PV}:`dirname $realpath`/${REL_PERLLIB}/${PV}&#39;</div><=
/blockquote></div><br>Hmm, perhaps create_wrapper should be altered to prov=
ide the binary dirname as a variable so we can easily reference it, avoidin=
g the need to repeatedly dirname here.<br>-- <br><div class=3D"gmail_signat=
ure"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Fou=
nder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior So=
ftware Engineer, Mentor Graphics</div></div>
</div></div>

--001a113ecc0a6a8db105246095b7--

Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id A76DF7306B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 14:17:22 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id f54so9680345uaa.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 06:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=veieTyVlSXkoIGaphOsUw4Grxurxd88Okp6x5D8yXq4=;
	b=Cu0eJPtymoC9VMRI8ffYDn0I0XRWI7SH/4Rpl5P0FtduDwabzxNTTIRFqbzbrVZHZp
	x90LoQ3JMMYR96fEvuzV3EO62rREGtbMagsog7SBGkhS9nMQV3UUwOJZMOS/IPzzqSJu
	elXzs+ZH2wyIltnGkz9ITY6mru2dh/lJj4BqwYEtbqYXe3fSxoDOgTukXNFj0IUSlFJi
	6yYh22CYNqcmOcWXfmrC1nAWkLlJx7Au53/SHP7r5JJU3pDRk6L67+vqPhDHY52T3o9r
	UFvNaBTTKYwA5toi2Q6UcYxGIziys3OUF4vf8bWs5JwJjN6ZJ5/o3VB/DgOTvZSsnmKV
	hoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=veieTyVlSXkoIGaphOsUw4Grxurxd88Okp6x5D8yXq4=;
	b=Z8gCCwIl4nGxCymc3uDdXd4TmXmhEIgb2xihRWhSX0gbnkiRV3jhR93fFlaBgYFzvM
	aLSbWK3IteFQ1eNXWhEcr3yLl4A1wjQGOMV3mTGJrxhgh7wsLfoEkYSqyvDKY+QEAI47
	PoFhgXlesSj21mtGmZlqf0/1SF2Q7pUvmn0dbKCeaC4yZ7VPGJoNBpNis/305lfBGWO/
	WtQVwXRx2PIl4/HWZKqB9i90+DlARpteg7L6dpX0Hs0JodLFvjYC9WnBMaf2J9X/hN4V
	MGcoqrjYBIbrL9BLlqQ/timExT8TQ8WTmnoXzcaTNQhIfnvpszhVbp6RUeiPotCRfl2J
	YRSg==
X-Gm-Message-State: AMke39lLx+7olAfDEtF4pNLUcI+wxruDCb39z6Smm+w5GTrUWeY3a0pnM1Mu5DCQAy3oNaC1dGt4O2NbVNJ9Xw==
X-Received: by 10.176.69.201 with SMTP id u67mr7016259uau.101.1489069043860;
	Thu, 09 Mar 2017 06:17:23 -0800 (PST)
MIME-Version: 1.0
References: <20170309135933.1232-1-ismo.puustinen@intel.com>
In-Reply-To: <20170309135933.1232-1-ismo.puustinen@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 09 Mar 2017 14:17:12 +0000
Message-ID: <CAMKF1sqL-AY9gnZsEJEg-zE7Mm-aZEBu5dv=Qp2mK0_WHyZOyA@mail.gmail.com>
To: Ismo Puustinen <ismo.puustinen@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc: let cpp rrecommend gcc.
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
X-List-Received-Date: Thu, 09 Mar 2017 14:17:25 -0000
Content-Type: multipart/alternative; boundary=94eb2c11c0086801aa054a4ce789

--94eb2c11c0086801aa054a4ce789
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 9, 2017 at 5:59 AM Ismo Puustinen <ismo.puustinen@intel.com>
wrote:

> The file /usr/libexec/gcc/.../cc1 has been installed in package "gcc"
> instead of package "cpp", because FILES statements for both packages
> match the cc1 binary. Remove the attempt to install the file in cpp to
> avoid confusion.



Perhaps it's better to package it in cpp and remove from gcc package

>
>
> However, cpp uses cc1. If cc1 is not installed, there are error messages
> such as: "cpp: error trying to exec 'cc1': execvp: No such file or
> directory". Add gcc to RRECOMMENDS_cpp to fix the problem.
>
> Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
> ---
>  meta/recipes-devtools/gcc/gcc-target.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc
> b/meta/recipes-devtools/gcc/gcc-target.inc
> index f436fa2..3a2927e 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -93,8 +93,9 @@ FILES_gfortran-symlinks = "\
>  FILES_cpp = "\
>      ${bindir}/${TARGET_PREFIX}cpp* \
>      ${base_libdir}/cpp \
> -    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1"
> +"
>  FILES_cpp-symlinks = "${bindir}/cpp"
> +RRECOMMENDS_cpp = "${PN}"
>
>  FILES_gcov = "${bindir}/${TARGET_PREFIX}gcov* \
>      ${bindir}/${TARGET_PREFIX}gcov-tool* \
> --
> 2.9.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c11c0086801aa054a4ce789
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div>On Thu, Mar 9, 2017 at 5:59 AM Ism=
o Puustinen &lt;<a href=3D"mailto:ismo.puustinen@intel.com">ismo.puustinen@=
intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The file=
 /usr/libexec/gcc/.../cc1 has been installed in package &quot;gcc&quot;<br =
class=3D"gmail_msg">
instead of package &quot;cpp&quot;, because FILES statements for both packa=
ges<br class=3D"gmail_msg">
match the cc1 binary. Remove the attempt to install the file in cpp to<br c=
lass=3D"gmail_msg">
avoid confusion.</blockquote><div><br></div><div><br></div><div>Perhaps it&=
#39;s better to package it in cpp and remove from gcc package</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><br class=3D"gmail_msg">
<br class=3D"gmail_msg">
However, cpp uses cc1. If cc1 is not installed, there are error messages<br=
 class=3D"gmail_msg">
such as: &quot;cpp: error trying to exec &#39;cc1&#39;: execvp: No such fil=
e or<br class=3D"gmail_msg">
directory&quot;. Add gcc to RRECOMMENDS_cpp to fix the problem.<br class=3D=
"gmail_msg">
<br class=3D"gmail_msg">
Signed-off-by: Ismo Puustinen &lt;<a href=3D"mailto:ismo.puustinen@intel.co=
m" class=3D"gmail_msg" target=3D"_blank">ismo.puustinen@intel.com</a>&gt;<b=
r class=3D"gmail_msg">
---<br class=3D"gmail_msg">
=C2=A0meta/recipes-devtools/gcc/gcc-target.inc | 3 ++-<br class=3D"gmail_ms=
g">
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br class=3D"gmail_msg"=
>
<br class=3D"gmail_msg">
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtoo=
ls/gcc/gcc-target.inc<br class=3D"gmail_msg">
index f436fa2..3a2927e 100644<br class=3D"gmail_msg">
--- a/meta/recipes-devtools/gcc/gcc-target.inc<br class=3D"gmail_msg">
+++ b/meta/recipes-devtools/gcc/gcc-target.inc<br class=3D"gmail_msg">
@@ -93,8 +93,9 @@ FILES_gfortran-symlinks =3D &quot;\<br class=3D"gmail_msg=
">
=C2=A0FILES_cpp =3D &quot;\<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0${bindir}/${TARGET_PREFIX}cpp* \<br class=3D"gmail_msg"=
>
=C2=A0 =C2=A0 =C2=A0${base_libdir}/cpp \<br class=3D"gmail_msg">
-=C2=A0 =C2=A0 ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1&quot;<br class=
=3D"gmail_msg">
+&quot;<br class=3D"gmail_msg">
=C2=A0FILES_cpp-symlinks =3D &quot;${bindir}/cpp&quot;<br class=3D"gmail_ms=
g">
+RRECOMMENDS_cpp =3D &quot;${PN}&quot;<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
=C2=A0FILES_gcov =3D &quot;${bindir}/${TARGET_PREFIX}gcov* \<br class=3D"gm=
ail_msg">
=C2=A0 =C2=A0 =C2=A0${bindir}/${TARGET_PREFIX}gcov-tool* \<br class=3D"gmai=
l_msg">
--<br class=3D"gmail_msg">
2.9.3<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
--<br class=3D"gmail_msg">
_______________________________________________<br class=3D"gmail_msg">
Openembedded-core mailing list<br class=3D"gmail_msg">
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" class=3D"gmail_=
msg" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br clas=
s=3D"gmail_msg">
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">http://lists.ope=
nembedded.org/mailman/listinfo/openembedded-core</a><br class=3D"gmail_msg"=
>
</blockquote></div></div>

--94eb2c11c0086801aa054a4ce789--

Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 10C0F771A9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 16:01:37 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id 1so58871594ion.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 08:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to:cc:content-type;
	bh=XTzcoNfHFKuHkjTafSCMIVHtODz9ukcsAHV1o6p0pQM=;
	b=eqzjJWTKNtyuhZ984XOP+28P6SfYrGHiYjOR71Q/bGDRa3v/0cISZ1Z+V6egJbnYZl
	1uJNRHCT82QTAdX+NAnempeYkrDSnYNtFLera9OoBlhufGUdIeV79rB0aYIL1ZGvvjqF
	8ylLQVxdSTRmpFqlU0HD3ue5rsC59TC4i3lZPRfJtzLdtOlzpo0E1jvuaBGt2D3R8Qqf
	QIcHIwyECeQJogo4i4AMSl1IN37DwZYfzDtM1TMb11/L2WhYu/NaN3Kvu+3xpWN28qHp
	8pMsmcDOZyKWo9O8eVtv45796ZtLkHBEe2AUWgAJ78Iun638BNVB3LMKfKYE1dYBjU7/
	0VuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
	:content-type;
	bh=XTzcoNfHFKuHkjTafSCMIVHtODz9ukcsAHV1o6p0pQM=;
	b=U1Wg0gUyrJS+OxxrHJa62W53Ok9W8bTtu/K5qE/hAXbVPB9if7iYHD88DFdonWgvBf
	aa9T+4ltgsis9hbKtnJxx5r4wQWwhTjty7ay668N8JkbdxiJHur/QElS584lvvXx+4yl
	O/+aXvzb+LZbSNwnoutILijlqtfBZHt+T+1skHi2/DVxHyzIwpOnaQXdZUpfDrSBAV8x
	roQNz8Gpr3cnQI2UExYDez3kcntl5cjxeI2YJMrAKlbCEQVYhHCVqjhsmWHaQeuGDALH
	V/p0oa6PpV1guDYb2SB3InAlqrTJqex0LV4+eIsfyEaag0yxmS39N/nX/QVPF0ZPApyi
	XMsw==
X-Gm-Message-State: AG10YOQmejxe1pL+JbA8E5bizYGho7NhVmcIBE49+zHYBy0z00QpXoSsUpLof9kUpgvcLo2og8wRqzor7t/ekBGY
X-Received: by 10.107.3.154 with SMTP id e26mr4496235ioi.99.1453996898390;
	Thu, 28 Jan 2016 08:01:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 28 Jan 2016 08:01:19 -0800 (PST)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Jan 2016 16:01:19 +0000
Message-ID: <CAJTo0La500C+Tam6B_7Sf_Xs1=3hjWDGND4F2CMx_36rMCpXdQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][jethro] libpcre: bug fixes include security
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
X-List-Received-Date: Thu, 28 Jan 2016 16:01:38 -0000
Content-Type: multipart/alternative; boundary=001a113ec10aa23944052a670852

--001a113ec10aa23944052a670852
Content-Type: text/plain; charset=UTF-8

Armin forgot the Jethro tag as this is fixed in master already.

On 27 January 2016 at 22:20, Armin Kuster <akuster808@gmail.com> wrote:

> From: Armin Kuster <akuster@mvista.com>
>
> [Yocto # 9008]
>
> This is the next patch release for pcre. The 8.xx series now only contains
> bug fixes.
>
> http://www.pcre.org/original/changelog.txt
>
> The following security fixes are included:
> CVE-2015-3210 pcre: heap buffer overflow in pcre_compile2() /
> compile_regex()
> CVE-2015-3217 pcre: stack overflow in match()
> CVE-2015-5073 CVE-2015-8388 pcre: Buffer overflow caused by certain
> patterns with an unmatched closing parenthesis
>
> CVE-2015-8380 pcre: Heap-based buffer overflow in pcre_exec
> CVE-2015-8381 pcre: Heap Overflow in compile_regex()
> CVE-2015-8383 pcre: Buffer overflow caused by repeated conditional group
> CVE-2015-8384 pcre: Buffer overflow caused by recursive back reference by
> name within certain group
> CVE-2015-8385 pcre: Buffer overflow caused by forward reference by name to
> certain group
> CVE-2015-8386 pcre: Buffer overflow caused by lookbehind assertion
> CVE-2015-8387 pcre: Integer overflow in subroutine calls
> CVE-2015-8389 pcre: Infinite recursion in JIT compiler when processing
> certain patterns
>  CVE-2015-8390 pcre: Reading from uninitialized memory when processing
> certain patterns
>
>  CVE-2015-8392 pcre: Buffer overflow caused by certain patterns with
> duplicated named groups
>  CVE-2015-8393 pcre: Information leak when running pcgrep -q on crafted
> binary
>  CVE-2015-8394 pcre: Integer overflow caused by missing check for certain
> conditions
>  CVE-2015-8395 pcre: Buffer overflow caused by certain references
>  CVE-2016-1283 pcre: Heap buffer overflow in pcre_compile2 causes DoS
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta/recipes-support/libpcre/{libpcre_8.37.bb => libpcre_8.38.bb} | 4
> ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/libpcre/{libpcre_8.37.bb => libpcre_8.38.bb}
> (94%)
>
> diff --git a/meta/recipes-support/libpcre/libpcre_8.37.bb
> b/meta/recipes-support/libpcre/libpcre_8.38.bb
> similarity index 94%
> rename from meta/recipes-support/libpcre/libpcre_8.37.bb
> rename to meta/recipes-support/libpcre/libpcre_8.38.bb
> index 1880639..c567607 100644
> --- a/meta/recipes-support/libpcre/libpcre_8.37.bb
> +++ b/meta/recipes-support/libpcre/libpcre_8.38.bb
> @@ -14,8 +14,8 @@ SRC_URI =
> "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-${PV}.tar.bz2 \
>             file://Makefile \
>  "
>
> -SRC_URI[md5sum] = "ed91be292cb01d21bc7e526816c26981"
> -SRC_URI[sha256sum] =
> "51679ea8006ce31379fb0860e46dd86665d864b5020fc9cd19e71260eef4789d"
> +SRC_URI[md5sum] = "00aabbfe56d5a48b270f999b508c5ad2"
> +SRC_URI[sha256sum] =
> "b9e02d36e23024d6c02a2e5b25204b3a4fa6ade43e0a5f869f254f49535079df"
>
>  S = "${WORKDIR}/pcre-${PV}"
>
> --
> 2.3.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113ec10aa23944052a670852
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Armin forgot the Jethro tag as this is fixed in master alr=
eady.<br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 27 Ja=
nuary 2016 at 22:20, Armin Kuster <span dir=3D"ltr">&lt;<a href=3D"mailto:a=
kuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">From: Armin Kuster &lt;<a href=3D"=
mailto:akuster@mvista.com">akuster@mvista.com</a>&gt;<br>
<br>
[Yocto # 9008]<br>
<br>
This is the next patch release for pcre. The 8.xx series now only contains<=
br>
bug fixes.<br>
<br>
<a href=3D"http://www.pcre.org/original/changelog.txt" rel=3D"noreferrer" t=
arget=3D"_blank">http://www.pcre.org/original/changelog.txt</a><br>
<br>
The following security fixes are included:<br>
CVE-2015-3210 pcre: heap buffer overflow in pcre_compile2() / compile_regex=
()<br>
CVE-2015-3217 pcre: stack overflow in match()<br>
CVE-2015-5073 CVE-2015-8388 pcre: Buffer overflow caused by certain pattern=
s with an unmatched closing parenthesis<br>
<br>
CVE-2015-8380 pcre: Heap-based buffer overflow in pcre_exec<br>
CVE-2015-8381 pcre: Heap Overflow in compile_regex()<br>
CVE-2015-8383 pcre: Buffer overflow caused by repeated conditional group<br=
>
CVE-2015-8384 pcre: Buffer overflow caused by recursive back reference by n=
ame within certain group<br>
CVE-2015-8385 pcre: Buffer overflow caused by forward reference by name to =
certain group<br>
CVE-2015-8386 pcre: Buffer overflow caused by lookbehind assertion<br>
CVE-2015-8387 pcre: Integer overflow in subroutine calls<br>
CVE-2015-8389 pcre: Infinite recursion in JIT compiler when processing cert=
ain patterns<br>
=C2=A0CVE-2015-8390 pcre: Reading from uninitialized memory when processing=
 certain patterns<br>
<br>
=C2=A0CVE-2015-8392 pcre: Buffer overflow caused by certain patterns with d=
uplicated named groups<br>
=C2=A0CVE-2015-8393 pcre: Information leak when running pcgrep -q on crafte=
d binary<br>
=C2=A0CVE-2015-8394 pcre: Integer overflow caused by missing check for cert=
ain conditions<br>
=C2=A0CVE-2015-8395 pcre: Buffer overflow caused by certain references<br>
=C2=A0CVE-2016-1283 pcre: Heap buffer overflow in pcre_compile2 causes DoS<=
br>
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com">akust=
er@mvista.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/libpcre/{<a href=3D"http://libpcre_8.37.bb" rel=
=3D"noreferrer" target=3D"_blank">libpcre_8.37.bb</a> =3D&gt; <a href=3D"ht=
tp://libpcre_8.38.bb" rel=3D"noreferrer" target=3D"_blank">libpcre_8.38.bb<=
/a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-support/libpcre/{<a href=3D"http://libpcre_8.37.b=
b" rel=3D"noreferrer" target=3D"_blank">libpcre_8.37.bb</a> =3D&gt; <a href=
=3D"http://libpcre_8.38.bb" rel=3D"noreferrer" target=3D"_blank">libpcre_8.=
38.bb</a>} (94%)<br>
<br>
diff --git a/meta/recipes-support/libpcre/<a href=3D"http://libpcre_8.37.bb=
" rel=3D"noreferrer" target=3D"_blank">libpcre_8.37.bb</a> b/meta/recipes-s=
upport/libpcre/<a href=3D"http://libpcre_8.38.bb" rel=3D"noreferrer" target=
=3D"_blank">libpcre_8.38.bb</a><br>
similarity index 94%<br>
rename from meta/recipes-support/libpcre/<a href=3D"http://libpcre_8.37.bb"=
 rel=3D"noreferrer" target=3D"_blank">libpcre_8.37.bb</a><br>
rename to meta/recipes-support/libpcre/<a href=3D"http://libpcre_8.38.bb" r=
el=3D"noreferrer" target=3D"_blank">libpcre_8.38.bb</a><br>
index 1880639..c567607 100644<br>
--- a/meta/recipes-support/libpcre/<a href=3D"http://libpcre_8.37.bb" rel=
=3D"noreferrer" target=3D"_blank">libpcre_8.37.bb</a><br>
+++ b/meta/recipes-support/libpcre/<a href=3D"http://libpcre_8.38.bb" rel=
=3D"noreferrer" target=3D"_blank">libpcre_8.38.bb</a><br>
@@ -14,8 +14,8 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/project/pcre/pcre=
/${PV}/pcre-${PV}.tar.bz2 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Makefile \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;ed91be292cb01d21bc7e526816c26981&quot;<br>
-SRC_URI[sha256sum] =3D &quot;51679ea8006ce31379fb0860e46dd86665d864b5020fc=
9cd19e71260eef4789d&quot;<br>
+SRC_URI[md5sum] =3D &quot;00aabbfe56d5a48b270f999b508c5ad2&quot;<br>
+SRC_URI[sha256sum] =3D &quot;b9e02d36e23024d6c02a2e5b25204b3a4fa6ade43e0a5=
f869f254f49535079df&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/pcre-${PV}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.3.5<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div></div>

--001a113ec10aa23944052a670852--

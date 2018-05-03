Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 881027488C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 09:33:48 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id d11-v6so20844882iof.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2018 02:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MoxMVkRcekqnMWuqex51dhE+bdaPHn01SM/91V0enHA=;
	b=jljtg4SoPjlm0NwnW95iyTmKk/+blImAlLEznGSmqZxV0b7mhBw8aI4Oi3k+6LSJ7h
	ijI+ZhF45LITtBT+SzANhIN2eMLaIhY7NiXrdosNQlFQOrWC9bMvhx/nOAfR1MSoY4Sr
	LoqNCiy6w9pxzQZXk73SMNLzsawo+a8eTIc9LBN5k7T48Z9bIPMMaKeL2wdc18lKorMH
	cpiWkrxy28deKPrZwtMZt8OjITzYJlMu9ntCXIan0hiD6xnNSbNtyNTJ9mJY/A+Xw+wM
	WQoJxojIiocCCajCx2OObVL1IvK43Q1vnZCgL/zuJWycJGuGDTz3dHc1hSzixfXACn+5
	F+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MoxMVkRcekqnMWuqex51dhE+bdaPHn01SM/91V0enHA=;
	b=PR4q6FlM3QsLdIUFMinfMWT7rBKTvbTgTpiHD8GUMsk6Btx7tXfQyaciTrCKThQ9Pz
	OiRW8OI7pthXKsBl8vsH3nD9OHsOjT5KmYIIi4ECZqIocJFD/YudmCSxZjHBVA2eNVOf
	NvXyA2buGinQ0i0Dnf14mH78g3Y6+79scqqCWfGlpuHLfJ81rH/zuyfp5DLIc126ceO9
	McZRsYTvJz3Red793eLZ+p/KWb6NBShV6PffiLlY/0laszOwsMYHzbp9U2Lus95loITx
	z8PG41r8UpYqTkG+66be/DTtRAx2GDcxjHnskanksmGZXiRWNU5Eap3lKOfC5ycoxzua
	uEYw==
X-Gm-Message-State: ALQs6tB7bBWqje5CIyjN01dd+8EkkVtdEYHrR01vyy+mUabPIfwCLU4V
	tFtNkx54A36Hq19QyDq7MjRT7JCjb/m/9pZvNF5s9Q==
X-Google-Smtp-Source: AB8JxZp96nM3fbpwoX55T8H4XnPN11CFxaKLlLhCYrpf2uoGUnELRO3mXj7WTGKWjK+1cE/2J2Vf0rkdwMgQu5Iy9iA=
X-Received: by 2002:a6b:752:: with SMTP id
	79-v6mr25004526ioh.216.1525340029946; 
	Thu, 03 May 2018 02:33:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.29.203 with HTTP; Thu, 3 May 2018 02:33:29 -0700 (PDT)
In-Reply-To: <20180503090918.20964-1-hongl.fnst@cn.fujitsu.com>
References: <20180503090918.20964-1-hongl.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 May 2018 10:33:29 +0100
Message-ID: <CAJTo0LZ+LN1Ok6SO3zh7KAphyPOFrwxYhB3+w1NVto62LrDEOw@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] flex: update to 2.6.4.
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
X-List-Received-Date: Thu, 03 May 2018 09:33:49 -0000
Content-Type: multipart/alternative; boundary="000000000000a5a519056b49e6df"

--000000000000a5a519056b49e6df
Content-Type: text/plain; charset="UTF-8"

By passing --disable-bootstrap for the native build you're assuming that
the host has flex.  If we could assume that we wouldn't be building a
flex-native.

Also I submitted this upgrade a few months ago but flex was aborting in the
selftest, which is why it wasn't integrated.  I'll integrate it again, and
see what happens.

Ross

On 3 May 2018 at 10:09, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:

> From: Lei Maohui <leimaohui@cn.fujitsu.com>
>
> * Deleted 3 patches because these patches have been fixed in new version.
> * Added "--disable-bootstrap" to avoid the build error of stage1flex on
> host.
>
> stage1flex-misc.o: In function `allocate_array':
> misc.c:(.text+0x38f): undefined reference to `reallocarray'
> stage1flex-misc.o: In function `reallocate_array':
> misc.c:(.text+0xc8a): undefined reference to `reallocarray'
> collect2: error: ld returned 1 exit status
>
>
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/flex/{flex_2.6.0.bb => flex_2.6.4.bb} | 13
> ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>  rename meta/recipes-devtools/flex/{flex_2.6.0.bb => flex_2.6.4.bb} (84%)
>
> diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb
> b/meta/recipes-devtools/flex/flex_2.6.4.bb
> similarity index 84%
> rename from meta/recipes-devtools/flex/flex_2.6.0.bb
> rename to meta/recipes-devtools/flex/flex_2.6.4.bb
> index b89b751..4d59cc6 100644
> --- a/meta/recipes-devtools/flex/flex_2.6.0.bb
> +++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
> @@ -10,17 +10,14 @@ BBCLASSEXTEND = "native nativesdk"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
>
> -SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
> +SRC_URI = "https://github.com/westes/flex/releases/download/v2.6.4/
> flex-${PV}.tar.gz \
>             file://run-ptest \
> -           file://do_not_create_pdf_doc.patch \
>             file://0001-tests-add-a-target-for-building-tests-without-runnin.patch
> \
> -           file://0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
> \
> -           file://CVE-2016-6354.patch \
>             ${@bb.utils.contains('PTEST_ENABLED', '1', '',
> 'file://disable-tests.patch', d)} \
>             "
>
> -SRC_URI[md5sum] = "266270f13c48ed043d95648075084d59"
> -SRC_URI[sha256sum] = "24e611ef5a4703a191012f80c1027d
> c9d12555183ce0ecd46f3636e587e9b8e9"
> +SRC_URI[md5sum] = "2882e3179748cc9f9c23ec593d6adc8d"
> +SRC_URI[sha256sum] = "e87aae032bf07c26f85ac0ed325099
> 8c37621d95f8bd748b31f15b33c45ee995"
>
>  # Flex has moved to github from 2.6.1 onwards
>  UPSTREAM_CHECK_URI = "https://github.com/westes/flex/releases"
> @@ -30,7 +27,9 @@ inherit autotools gettext texinfo ptest
>
>  M4 = "${bindir}/m4"
>  M4_class-native = "${STAGING_BINDIR_NATIVE}/m4"
> -EXTRA_OECONF += "ac_cv_path_M4=${M4}"
> +EXTRA_OECONF += "ac_cv_path_M4=${M4} \
> +                 --disable-bootstrap \
> +                "
>  EXTRA_OEMAKE += "m4=${STAGING_BINDIR_NATIVE}/m4"
>
>  EXTRA_OEMAKE += "${@bb.utils.contains('PTEST_ENABLED', '1',
> 'FLEX=${STAGING_BINDIR_NATIVE}/flex', '', d)}"
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000a5a519056b49e6df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">By passing --disable-bootstrap for the native build you&#3=
9;re assuming that the host has flex.=C2=A0 If we could assume that we woul=
dn&#39;t be building a flex-native.<div><br></div><div>Also I submitted thi=
s upgrade a few months ago but flex was aborting in the selftest, which is =
why it wasn&#39;t integrated.=C2=A0 I&#39;ll integrate it again, and see wh=
at happens.</div><div><br></div><div>Ross</div></div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On 3 May 2018 at 10:09, Hong Liu <span =
dir=3D"ltr">&lt;<a href=3D"mailto:hongl.fnst@cn.fujitsu.com" target=3D"_bla=
nk">hongl.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">From: Lei Maohui &lt;<a href=3D"mailto:leimaohui@cn.fujitsu.com"=
>leimaohui@cn.fujitsu.com</a>&gt;<br>
<br>
* Deleted 3 patches because these patches have been fixed in new version.<b=
r>
* Added &quot;--disable-bootstrap&quot; to avoid the build error of stage1f=
lex on host.<br>
<br>
stage1flex-misc.o: In function `allocate_array&#39;:<br>
misc.c:(.text+0x38f): undefined reference to `reallocarray&#39;<br>
stage1flex-misc.o: In function `reallocate_array&#39;:<br>
misc.c:(.text+0xc8a): undefined reference to `reallocarray&#39;<br>
collect2: error: ld returned 1 exit status<br>
<br>
<br>
Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leimaohui@cn.fujitsu.com">l=
eimaohui@cn.fujitsu.com</a>&gt;<br>
Signed-off-by: Hong Liu &lt;<a href=3D"mailto:hongl.fnst@cn.fujitsu.com">ho=
ngl.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/flex/{<a href=3D"http://flex_2.6.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">fl<wbr>ex_2.6.0.bb</a> =3D&gt; <a href=3D"http=
://flex_2.6.4.bb" rel=3D"noreferrer" target=3D"_blank">flex_2.6.4.bb</a>} |=
 13 ++++++-------<br>
=C2=A01 file changed, 6 insertions(+), 7 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/flex/{<a href=3D"http://flex_2.6.0.bb" r=
el=3D"noreferrer" target=3D"_blank">fl<wbr>ex_2.6.0.bb</a> =3D&gt; <a href=
=3D"http://flex_2.6.4.bb" rel=3D"noreferrer" target=3D"_blank">flex_2.6.4.b=
b</a>} (84%)<br>
<br>
diff --git a/meta/recipes-devtools/flex/<a href=3D"http://flex_2.6.0.bb" re=
l=3D"noreferrer" target=3D"_blank">f<wbr>lex_2.6.0.bb</a> b/meta/recipes-de=
vtools/flex/<a href=3D"http://flex_2.6.4.bb" rel=3D"noreferrer" target=3D"_=
blank">f<wbr>lex_2.6.4.bb</a><br>
similarity index 84%<br>
rename from meta/recipes-devtools/flex/<a href=3D"http://flex_2.6.0.bb" rel=
=3D"noreferrer" target=3D"_blank">fle<wbr>x_2.6.0.bb</a><br>
rename to meta/recipes-devtools/flex/<a href=3D"http://flex_2.6.4.bb" rel=
=3D"noreferrer" target=3D"_blank">fle<wbr>x_2.6.4.bb</a><br>
index b89b751..4d59cc6 100644<br>
--- a/meta/recipes-devtools/flex/<a href=3D"http://flex_2.6.0.bb" rel=3D"no=
referrer" target=3D"_blank">f<wbr>lex_2.6.0.bb</a><br>
+++ b/meta/recipes-devtools/flex/<a href=3D"http://flex_2.6.4.bb" rel=3D"no=
referrer" target=3D"_blank">f<wbr>lex_2.6.4.bb</a><br>
@@ -10,17 +10,14 @@ BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>e4742cf92e89040b=
39486a6219b680<wbr>67&quot;<br>
<br>
-SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/flex/<wbr>flex-${PV}.tar.bz2 \<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/westes/flex/releases/downl=
oad/v2.6.4/flex-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/westes/<wbr>flex/releases/download/v2.6.4/<wbr>flex-${PV}.tar.gz=
</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://do_not_create_pdf_doc.<wbr=
>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-tests-add-a-<wbr>targ=
et-for-building-tests-<wbr>without-runnin.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-avoid-c-comments-<wbr=
>in-c-code-fails-with-gcc-6.<wbr>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2016-6354.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PTEST_<=
wbr>ENABLED&#39;, &#39;1&#39;, &#39;&#39;, &#39;file://disable-tests.patch&=
#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>266270f13c48ed043d95648075084d<wbr>59&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>24e611ef5a4703a191012f80c1027d<wbr>c9d12=
555183ce0ecd46f3636e587e9<wbr>b8e9&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>2882e3179748cc9f9c23ec593d6adc<wbr>8d&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>e87aae032bf07c26f85ac0ed325099<wbr>8c376=
21d95f8bd748b31f15b33c45e<wbr>e995&quot;<br>
<br>
=C2=A0# Flex has moved to github from 2.6.1 onwards<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/westes/fle=
x/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/westes/=
<wbr>flex/releases</a>&quot;<br>
@@ -30,7 +27,9 @@ inherit autotools gettext texinfo ptest<br>
<br>
=C2=A0M4 =3D &quot;${bindir}/m4&quot;<br>
=C2=A0M4_class-native =3D &quot;${STAGING_BINDIR_NATIVE}/m4&quot;<br>
-EXTRA_OECONF +=3D &quot;ac_cv_path_M4=3D${M4}&quot;<br>
+EXTRA_OECONF +=3D &quot;ac_cv_path_M4=3D${M4} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-bo=
otstrap \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0EXTRA_OEMAKE +=3D &quot;m4=3D${STAGING_BINDIR_NATIVE}/<wbr>m4&quot;<b=
r>
<br>
=C2=A0EXTRA_OEMAKE +=3D &quot;${@bb.utils.contains(&#39;PTEST_<wbr>ENABLED&=
#39;, &#39;1&#39;, &#39;FLEX=3D${STAGING_BINDIR_NATIVE}<wbr>/flex&#39;, &#3=
9;&#39;, d)}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.7.4<br>
<br>
<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--000000000000a5a519056b49e6df--

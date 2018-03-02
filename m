Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3B84071C42
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 14:12:41 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id j7so1944906ita.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 06:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zU0MWDWeNDvg2kwQZUkfAZljbvv4Y2F7O3XDk8hRNH4=;
	b=GUlKIsOwe7VILsygeLCn8oGFdiEUOFnycqIpLv+woDPM6pooAOLuf3wuGSizAaGZBF
	qeFDWY5T7FYKIKp6hzOEgU8aknfnOi+Pi4OjJU/XRYKaGBqbp87lTfJqcO0YM4wu5HL5
	ORoIu1doBDPXSNSUihitvnRvGWKOSfU4V+2kvEQq/meZJrt+adJyAPH2JwT0n5GzJcXT
	8hZDo+gkZu6di79LiEPDl9K2Gbsmpx4J03zGcS6//HDbCx7Dbp70xATgarllbckcM3+K
	2MDr6QqkgoeL69/LoiqdxdMenc8rst0xtg17AJVYqI6YSav0KmtXOnZSZ3xiZIUf4nxd
	GWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zU0MWDWeNDvg2kwQZUkfAZljbvv4Y2F7O3XDk8hRNH4=;
	b=kWAJw383ARS8/aYHHAcMFGqbqyA8sujarkA4hFNrTXVBuEpoCmHBx8+Hvn7/VBhljV
	qzW3RVD2EFberyujOH/VYkaEV1MraAcdI8lUpkLYTtzw5QQnLtQoPplozXzDO2Xgam3u
	t6e0y+kgv0DXE+di3ezFo1yOZQz5X9s9iXBIEHG1aPha2bX+NwwG93L5gG6maXe1wY/l
	L93Weh5Dpk6gjauZzHzaxj8Kdx8T8elMi1WpaGEB/aCc4hN3SP/wEuX6V+1chKMSriF1
	hyCVrUalMC8dKtrMUW2aj6Ti3vb3KJo9yyJenPU4QsgSuuqYqGD1B/6JVTlai34dcbvJ
	6gvw==
X-Gm-Message-State: AElRT7EkjTPfGNXOQSoMDn8hr7XZHHUg7f2UnJ+nQBVmKWQ1sLLql9Lg
	iG3942HApUjw9ZNHblH8ELPf2ZDc6rEZMbkjYhxw7w==
X-Google-Smtp-Source: AG47ELskKBKsfp5Wel5vhGLCq+YVzrvOMmqhKK8LhiaO5+TEalqxL2BDEGiJPr3F4azD74TmKLfCTfewAODNGkKXh4c=
X-Received: by 10.36.36.144 with SMTP id f138mr2428206ita.131.1519999963228;
	Fri, 02 Mar 2018 06:12:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Fri, 2 Mar 2018 06:12:22 -0800 (PST)
In-Reply-To: <20180301140052.1388-14-alexander.kanavin@linux.intel.com>
References: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
	<20180301140052.1388-14-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 2 Mar 2018 14:12:22 +0000
Message-ID: <CAJTo0LbB5ZAHTmcbv5Moof0kjYejw4XOskNawqH3sCopyxPSFg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/15] expect: upgrade 5.45.3 -> 5.45.4
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
X-List-Received-Date: Fri, 02 Mar 2018 14:12:42 -0000
Content-Type: multipart/alternative; boundary="001a1147cd30de041605666e9127"

--001a1147cd30de041605666e9127
Content-Type: text/plain; charset="UTF-8"

ERROR: expect-5.45.4-r0 do_fetch: Fetcher failure for URL: '
http://downloads.sourceforge.net/expect/Expect/5.45.4/expect5.45.4.tar.gz'.
Checksum mismatch!
File: '/srv/autobuilder/
autobuilder.yoctoproject.org/current_sources/expect5.45.4.tar.gz' has md5
checksum cb530d737c8f2d1023797cf0587b4e05 when
00fce8de158422f5ccd2666512329bd2 was expected
File: '/srv/autobuilder/
autobuilder.yoctoproject.org/current_sources/expect5.45.4.tar.gz' has
sha256 checksum
7a07d3f7cca5c0b38ca811984ef8da536da32932d68c1a6cce33ec2462b930bf when
49a7da83b0bdd9f46d04a04deec19c7767bb9a323e40c4781f89caf760b92c34 was
expected
If this change is expected (e.g. you have upgraded to a new version without
updating the checksums) then you can use these lines within the recipe:
SRC_URI[md5sum] = "cb530d737c8f2d1023797cf0587b4e05"
SRC_URI[sha256sum] =
"7a07d3f7cca5c0b38ca811984ef8da536da32932d68c1a6cce33ec2462b930bf"

Yes, they changed the tarball between you submitting this (and me testing
it here), and the autobuilder run last night.

Actually worth checking they haven't been hacked, although god knows who
would want to compromise expect of all things.

Ross

On 1 March 2018 at 14:00, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-devtools/expect/{expect_5.45.3.bb => expect_5.45.4.bb} | 4
> ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/expect/{expect_5.45.3.bb => expect_5.45.4.bb}
> (95%)
>
> diff --git a/meta/recipes-devtools/expect/expect_5.45.3.bb
> b/meta/recipes-devtools/expect/expect_5.45.4.bb
> similarity index 95%
> rename from meta/recipes-devtools/expect/expect_5.45.3.bb
> rename to meta/recipes-devtools/expect/expect_5.45.4.bb
> index 445eca5742d..96eacd92934 100644
> --- a/meta/recipes-devtools/expect/expect_5.45.3.bb
> +++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
> @@ -26,8 +26,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expect/
> Expect/${PV}/${BPN}${PV}.tar.gz \
>             file://0001-Resolve-string-formatting-issues.patch \
>             file://0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch
> \
>            "
> -SRC_URI[md5sum] = "a8855cd41c1ef004b9794db9e2a57a9d"
> -SRC_URI[sha256sum] = "c520717b7195944a69ce1492ec82ca
> 0ac3f3baf060804e6c5ee6d505ea512be9"
> +SRC_URI[md5sum] = "00fce8de158422f5ccd2666512329bd2"
> +SRC_URI[sha256sum] = "49a7da83b0bdd9f46d04a04deec19c
> 7767bb9a323e40c4781f89caf760b92c34"
>
>  UPSTREAM_CHECK_URI = "http://sourceforge.net/
> projects/expect/files/Expect/"
>  UPSTREAM_CHECK_REGEX = "/Expect/(?P<pver>(\d+[\.\-_]*)+)/"
> --
> 2.15.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1147cd30de041605666e9127
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ERROR: expect-5.45.4-r0 do_fetch: Fetcher failure for URL:=
 &#39;<a href=3D"http://downloads.sourceforge.net/expect/Expect/5.45.4/expe=
ct5.45.4.tar.gz">http://downloads.sourceforge.net/expect/Expect/5.45.4/expe=
ct5.45.4.tar.gz</a>&#39;. Checksum mismatch!<br>File: &#39;/srv/autobuilder=
/<a href=3D"http://autobuilder.yoctoproject.org/current_sources/expect5.45.=
4.tar.gz">autobuilder.yoctoproject.org/current_sources/expect5.45.4.tar.gz<=
/a>&#39; has md5 checksum cb530d737c8f2d1023797cf0587b4e05 when 00fce8de158=
422f5ccd2666512329bd2 was expected<br>File: &#39;/srv/autobuilder/<a href=
=3D"http://autobuilder.yoctoproject.org/current_sources/expect5.45.4.tar.gz=
">autobuilder.yoctoproject.org/current_sources/expect5.45.4.tar.gz</a>&#39;=
 has sha256 checksum 7a07d3f7cca5c0b38ca811984ef8da536da32932d68c1a6cce33ec=
2462b930bf when 49a7da83b0bdd9f46d04a04deec19c7767bb9a323e40c4781f89caf760b=
92c34 was expected<br>If this change is expected (e.g. you have upgraded to=
 a new version without updating the checksums) then you can use these lines=
 within the recipe:<br>SRC_URI[md5sum] =3D &quot;cb530d737c8f2d1023797cf058=
7b4e05&quot;<br>SRC_URI[sha256sum] =3D &quot;7a07d3f7cca5c0b38ca811984ef8da=
536da32932d68c1a6cce33ec2462b930bf&quot;<div><br></div><div>Yes, they chang=
ed the tarball between you submitting this (and me testing it here), and th=
e autobuilder run last night.</div><div><br></div><div>Actually worth check=
ing they haven&#39;t been hacked, although god knows who would want to comp=
romise expect of all things.</div><div><br></div><div>Ross</div></div><div =
class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 1 March 2018 at 14:=
00, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D"mailto:alexander.kan=
avin@linux.intel.com" target=3D"_blank">alexander.kanavin@linux.intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Alexa=
nder Kanavin &lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com">alexa=
nder.kanavin@linux.<wbr>intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/expect/{<a href=3D"http://expect_5.45.3.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>expect_5.45.3.bb</a> =3D&gt; <a href=
=3D"http://expect_5.45.4.bb" rel=3D"noreferrer" target=3D"_blank">expect_5.=
45.4.bb</a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/expect/{<a href=3D"http://expect_5.45.3.=
bb" rel=3D"noreferrer" target=3D"_blank"><wbr>expect_5.45.3.bb</a> =3D&gt; =
<a href=3D"http://expect_5.45.4.bb" rel=3D"noreferrer" target=3D"_blank">ex=
pect_5.45.4.bb</a>} (95%)<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>expect/<a href=3D"http://expect_5.4=
5.3.bb" rel=3D"noreferrer" target=3D"_blank">expect_5.45.3.bb</a> b/meta/re=
cipes-devtools/<wbr>expect/<a href=3D"http://expect_5.45.4.bb" rel=3D"noref=
errer" target=3D"_blank">expect_5.45.4.bb</a><br>
similarity index 95%<br>
rename from meta/recipes-devtools/expect/<a href=3D"http://expect_5.45.3.bb=
" rel=3D"noreferrer" target=3D"_blank">e<wbr>xpect_5.45.3.bb</a><br>
rename to meta/recipes-devtools/expect/<a href=3D"http://expect_5.45.4.bb" =
rel=3D"noreferrer" target=3D"_blank">e<wbr>xpect_5.45.4.bb</a><br>
index 445eca5742d..96eacd92934 100644<br>
--- a/meta/recipes-devtools/<wbr>expect/<a href=3D"http://expect_5.45.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">expect_5.45.3.bb</a><br>
+++ b/meta/recipes-devtools/<wbr>expect/<a href=3D"http://expect_5.45.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">expect_5.45.4.bb</a><br>
@@ -26,8 +26,8 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/expect/<wbr>Expec=
t/${PV}/${BPN}${PV}.tar.<wbr>gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Resolve-string-<wbr>f=
ormatting-issues.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-expect-Fix-<wbr>segfa=
ults-if-Tcl-is-built-<wbr>with-stubs-and-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-SRC_URI[md5sum] =3D &quot;<wbr>a8855cd41c1ef004b9794db9e2a57a<wbr>9d&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>c520717b7195944a69ce1492ec82ca<wbr>0ac3f=
3baf060804e6c5ee6d505ea51<wbr>2be9&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>00fce8de158422f5ccd2666512329b<wbr>d2&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>49a7da83b0bdd9f46d04a04deec19c<wbr>7767b=
b9a323e40c4781f89caf760b9<wbr>2c34&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://sourceforge.net/projec=
ts/expect/files/Expect/" rel=3D"noreferrer" target=3D"_blank">http://source=
forge.net/<wbr>projects/expect/files/Expect/</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;/Expect/(?P&lt;pver&gt;(\d+[\.\-_]*<wb=
r>)+)/&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.15.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1147cd30de041605666e9127--

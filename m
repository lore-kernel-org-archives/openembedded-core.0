Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 327307833A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 12:20:10 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id o9so32517160iod.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 05:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0pelBBX0jUIch/xsYD3jPf7ywu5cr1U+/27O1QRhnHc=;
	b=X8avgx15HtaA1Vu1/55AneH94i6tWXQ6GNO5N1T4SGMUmIBdFXJUBHNS1CAOfUQSkW
	gJ4SrQm+v6W6DFIUYflf254M7svnfIy0kDdUT1N60AAwCy9ATj8pvZsGGaoUzMCBQvV/
	0VsywVa8kXI33LF3lHTOZmBHqdK2LaiU1B94TXlIcsjn/UKmtw29tD1SETGJdNVjJn2H
	sICOuKp3GFbupLRzdGClqW/jO6NYA8i+PtUFc8uxbOKzYwzGPzCcBacbVGy4ityVilJ8
	cS9AXAkFoQQuWBCpCz/Chv4cznBAKtwmfsgIGv7LF0swxgN91nfSFn+dY6YGWQBH+yvp
	RVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0pelBBX0jUIch/xsYD3jPf7ywu5cr1U+/27O1QRhnHc=;
	b=em40+RBNWjP/p+ygs6jydOXeL4cKkSpFKTEBmUAnjQkORFs4TjFhtAum00q3Jl9eOd
	nqV1vRYTgX9E+jUJK+GRjuqVRKrsCEVgnMVX1JBgAgimsO1tLTmmQtoWI23GcODAWwR4
	Eb0e8yxkA8NI6COPMLBXqwi3CXNCZsFK42LABceyLWsPvcsrlRUVqC/NypErTBFt2TN9
	Hc+ErJANwlCszMtQJ/RVRmEXkFScThVzkyi/YojEAUaXBmV64PL7yeej9e3L0EYps+b+
	VUIiMya4NLyPdWTPXOUTLP9056D+7MkYepugvei+sJeZ6mtRhx9xmAVNIRV8jDiy2vPO
	EhlA==
X-Gm-Message-State: AHYfb5gn7KGARjZxLq2hUwUhNjlAfw1nZnF3ax/tKpsS9uVymQ6gk377
	GnWZ4RSFxV4EobfF1lzy88Kc4f9ssqZu
X-Received: by 10.107.59.200 with SMTP id i191mr8776947ioa.171.1503058812222; 
	Fri, 18 Aug 2017 05:20:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.141.19 with HTTP; Fri, 18 Aug 2017 05:19:41 -0700 (PDT)
In-Reply-To: <1502744948-29741-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
References: <1502744948-29741-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 18 Aug 2017 15:19:41 +0300
Message-ID: <CAHiDW_H5rSmW=AQQGsZ=8df80VK1PHYgoG0JgFDiUYsoELBoxA@mail.gmail.com>
To: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: upgrade to 7.55.1
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
X-List-Received-Date: Fri, 18 Aug 2017 12:20:11 -0000
Content-Type: multipart/alternative; boundary="001a114f80dc9454570557062619"

--001a114f80dc9454570557062619
Content-Type: text/plain; charset="UTF-8"

On 15 August 2017 at 00:09, Oleksandr Kravchuk <oleksandr.kravchuk@
pelagicore.com> wrote:

> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
> ---
>  meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.55.1.bb} | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>  rename meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.55.1.bb} (92%)
>
> diff --git a/meta/recipes-support/curl/curl_7.54.1.bb
> b/meta/recipes-support/curl/curl_7.55.1.bb
> similarity index 92%
> rename from meta/recipes-support/curl/curl_7.54.1.bb
> rename to meta/recipes-support/curl/curl_7.55.1.bb
> index f42582a..0074a74 100644
> --- a/meta/recipes-support/curl/curl_7.54.1.bb
> +++ b/meta/recipes-support/curl/curl_7.55.1.bb
> @@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/
> curl-${PV}.tar.bz2 \
>  #
>  SRC_URI += " file://configure_ac.patch"
>
> -SRC_URI[md5sum] = "6b6eb722f512e7a24855ff084f54fe55"
> -SRC_URI[sha256sum] = "fdfc4df2d001ee0c44ec071186e77
> 0046249263c491fcae48df0e1a3ca8f25a0"
> +SRC_URI[md5sum] = "8c153f282bbe482495214654cdcd4182"
> +SRC_URI[sha256sum] = "e5b1a92ed3b0c11f149886458fa06
> 3419500819f1610c020d62f25b8e4b16cfb"
>
>  CVE_PRODUCT = "libcurl"
>  inherit autotools pkgconfig binconfig multilib_header
> @@ -53,10 +53,6 @@ EXTRA_OECONF = " \
>      --without-nghttp2 \
>  "
>
> -do_install_append() {
> -       oe_multilib_header curl/curlbuild.h
> -}
> -
>

The lack of curlbuild.h leads to cve-check-tool build failure (this is with
7.55.0 but same should apply to 7.55.1):
https://autobuilder.yocto.io/builders/nightly-no-x11/
builds/416/steps/BuildImages/logs/stdio

The upstream cve-check-tool would probably not fail but we have a patched
in progress bar(?) that breaks. I'll send a a fix for cve-check-tool.

Jussi




>  do_install_append_class-target() {
>         # cleanup buildpaths from curl-config
>         sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${bindir}/curl-config
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114f80dc9454570557062619
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 15 August 2017 at 00:09, Oleksandr Kravchuk <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:oleksandr.kravchuk@pelagicore.com" target=3D"_blank">oleksa=
ndr.kravchuk@<wbr>pelagicore.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Signed-off-by: Oleksandr Kravchuk &lt;<a h=
ref=3D"mailto:oleksandr.kravchuk@pelagicore.com" target=3D"_blank">oleksand=
r.kravchuk@pelagicore<wbr>.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/curl/{<a href=3D"http://curl_7.54.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">cu<wbr>rl_7.54.1.bb</a> =3D&gt; <a href=3D"htt=
p://curl_7.55.1.bb" rel=3D"noreferrer" target=3D"_blank">curl_7.55.1.bb</a>=
} | 8 ++------<br>
=C2=A01 file changed, 2 insertions(+), 6 deletions(-)<br>
=C2=A0rename meta/recipes-support/curl/{<a href=3D"http://curl_7.54.1.bb" r=
el=3D"noreferrer" target=3D"_blank">cur<wbr>l_7.54.1.bb</a> =3D&gt; <a href=
=3D"http://curl_7.55.1.bb" rel=3D"noreferrer" target=3D"_blank">curl_7.55.1=
.bb</a>} (92%)<br>
<br>
diff --git a/meta/recipes-support/curl/<a href=3D"http://curl_7.54.1.bb" re=
l=3D"noreferrer" target=3D"_blank">cu<wbr>rl_7.54.1.bb</a> b/meta/recipes-s=
upport/curl/<a href=3D"http://curl_7.55.1.bb" rel=3D"noreferrer" target=3D"=
_blank">cu<wbr>rl_7.55.1.bb</a><br>
similarity index 92%<br>
rename from meta/recipes-support/curl/<a href=3D"http://curl_7.54.1.bb" rel=
=3D"noreferrer" target=3D"_blank">curl<wbr>_7.54.1.bb</a><br>
rename to meta/recipes-support/curl/<a href=3D"http://curl_7.55.1.bb" rel=
=3D"noreferrer" target=3D"_blank">curl<wbr>_7.55.1.bb</a><br>
index f42582a..0074a74 100644<br>
--- a/meta/recipes-support/curl/<a href=3D"http://curl_7.54.1.bb" rel=3D"no=
referrer" target=3D"_blank">cu<wbr>rl_7.54.1.bb</a><br>
+++ b/meta/recipes-support/curl/<a href=3D"http://curl_7.55.1.bb" rel=3D"no=
referrer" target=3D"_blank">cu<wbr>rl_7.55.1.bb</a><br>
@@ -14,8 +14,8 @@ SRC_URI =3D &quot;<a href=3D"http://curl.haxx.se/download=
/curl-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://curl.h=
axx.se/download/<wbr>curl-${PV}.tar.bz2</a> \<br>
=C2=A0#<br>
=C2=A0SRC_URI +=3D &quot; file://configure_ac.patch&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;6b6eb722f512e7a24855ff084f54f<wbr>e55&quot;<br>
-SRC_URI[sha256sum] =3D &quot;fdfc4df2d001ee0c44ec071186e77<wbr>0046249263c=
491fcae48df0e1a3ca8<wbr>f25a0&quot;<br>
+SRC_URI[md5sum] =3D &quot;8c153f282bbe482495214654cdcd4<wbr>182&quot;<br>
+SRC_URI[sha256sum] =3D &quot;e5b1a92ed3b0c11f149886458fa06<wbr>3419500819f=
1610c020d62f25b8e4b<wbr>16cfb&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;libcurl&quot;<br>
=C2=A0inherit autotools pkgconfig binconfig multilib_header<br>
@@ -53,10 +53,6 @@ EXTRA_OECONF =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0--without-nghttp2 \<br>
=C2=A0&quot;<br>
<br>
-do_install_append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_multilib_header curl/curlbuild.h<br>
-}<br>
-<br></blockquote><div><br></div><div>The lack of curlbuild.h leads to cve-=
check-tool build failure (this is with 7.55.0 but same should apply to 7.55=
.1):</div><div><a href=3D"https://autobuilder.yocto.io/builders/nightly-no-=
x11/builds/416/steps/BuildImages/logs/stdio" target=3D"_blank">https://auto=
builder.yocto.io/<wbr>builders/nightly-no-x11/<wbr>builds/416/steps/BuildIm=
ages/<wbr>logs/stdio</a><br></div><div><br></div><div>The upstream cve-chec=
k-tool would probably not fail but we have a patched in progress bar(?) tha=
t breaks. I&#39;ll send a a fix for cve-check-tool.</div><div><br></div><di=
v>Jussi</div><div><br></div><div><br></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
=C2=A0do_install_append_class-targe<wbr>t() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # cleanup buildpaths from curl-config<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s,${STAGING_DIR_HOST},,g&#39; ${=
D}${bindir}/curl-config<br>
<span class=3D"m_5528161242065247619gmail-HOEnZb"><font color=3D"#888888">-=
-<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--001a114f80dc9454570557062619--

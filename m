Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2CB12780F7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 12:15:23 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id f55so178136115qta.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 05:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vFDgtkNxfdutmDGUxKjNJ9FdVrDz9ajcX8BCktQX1CU=;
	b=MHYuQwDMH48N4lvv+ZjrXrkESwRHvNdjh0IsVcQ5UAX8j/J5KrSk1fCSbScvHTtfz/
	eXDXQZjIGxHKfQ3NBxsCN9Do2fb5nzq+8vgvBET8OLO+Tt9oPtlaly2uHCcfTC3HOGft
	oeWvzsUNbJ2LHAmgwWjVyQLt83UZzST4hkP+3MSxnn+Wa52QkefByKPr6NJrnl5kbmy1
	TXnNqxuQH5WdR0lNHsOLcjvVQXigfb+AKKjumzEpJmLFTaqzjdsy7kcNtWk0yhmDApKV
	KvEnlzUVtee06u/RIXIunxMhv98ZktZ+NEf3xMqtC7dtTVYQjC8O1PcWVhKLPms4X8BY
	L29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vFDgtkNxfdutmDGUxKjNJ9FdVrDz9ajcX8BCktQX1CU=;
	b=ihn7cOAvgWzZBbtlILOLz0JT3dwXtoa1N4sw5jEIMlbLu/W8sN6BZvO02niKKK5x+z
	NsvGl9eZoA1xNiPuFnWtPGVxg6MaCtk+jjj3Vq911btP+b0AMpJsSvMpRLsqdoZ44j0J
	SOxG/Z+lJe8fypupJRrR02cp6+j/281+1peF/WQgCEPIzDUHqJB6vTs4kme4hnoiwVhx
	5mdm8laf5sc4MAJtGlK3d8BvH7pw96FLWWGGwpXLgDxc9vQKBrALu1BBZdJPJZ7RUs7a
	usvwV6tb2ua3Nlgj0BMhj7sko+D9qvmXW06umNzV87hl5K9h75H0NgyF8VsaMeaiYwqR
	1JFw==
X-Gm-Message-State: AODbwcB6KgrXoBAsWSKhXD7bt1alUqSmr7DUltyOdn89kmBfQA8GiGRO
	cwz2NV5Hpgz42qO7wBqYIea2a557XJfE
X-Received: by 10.200.43.33 with SMTP id 30mr40556073qtu.210.1495714524917;
	Thu, 25 May 2017 05:15:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Thu, 25 May 2017 05:15:04 -0700 (PDT)
In-Reply-To: <1494933979-5139-8-git-send-email-dv@pseudoterminal.org>
References: <1494933979-5139-1-git-send-email-dv@pseudoterminal.org>
	<1494933979-5139-8-git-send-email-dv@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 May 2017 13:15:04 +0100
Message-ID: <CAJTo0LYipxZN4VK25oKEcPH4=PUw3BJUQG-W14h8+T7N2P+_1w@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/9] gstreamer1.0-omx: upgrade to version 1.12.0
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
X-List-Received-Date: Thu, 25 May 2017 12:15:24 -0000
Content-Type: multipart/alternative; boundary="001a1141481ef1b33d0550582c7e"

--001a1141481ef1b33d0550582c7e
Content-Type: text/plain; charset="UTF-8"

I presume you build without api-documentation as with Poky I get this error:

| checking for gtkdoc-check...
/data/poky-master/tmp/work/corei7-64-poky-linux/gstreamer1.0-omx/1.10.4-r0/recipe-sysroot-native/usr/bin/gtkdoc-check
| checking for gtkdoc-rebase...
/data/poky-master/tmp/work/corei7-64-poky-linux/gstreamer1.0-omx/1.10.4-r0/recipe-sysroot-native/usr/bin/gtkdoc-rebase
| checking for gtkdoc-mkpdf...
/data/poky-master/tmp/work/corei7-64-poky-linux/gstreamer1.0-omx/1.10.4-r0/recipe-sysroot-native/usr/bin/gtkdoc-mkpdf
| configure: error: You need to have gtk-doc >= 1.3 installed to build
GStreamer OpenMAX Plug-ins

Ross

On 16 May 2017 at 12:26, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:

> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  .../{gstreamer1.0-omx_1.10.4.bb => gstreamer1.0-omx_1.12.0.bb}        |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.10.4.bb =>
> gstreamer1.0-omx_1.12.0.bb} (69%)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.4.bb
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.0.bb
> similarity index 69%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.4.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.0.bb
> index dfeefa5..73c5adb 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.4.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.0.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> 4fbd65380cdd255951079008b364516c \
>
>  SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.
> tar.xz"
>
> -SRC_URI[md5sum] = "cedb230f1c47d0cf4b575d70dff66ff2"
> -SRC_URI[sha256sum] = "45072925cf262f0fd528fab78f0de5
> 2734e46a5a88aa802fae51c67c09c81aa2"
> +SRC_URI[md5sum] = "eaf9505c7acb9b96215cb0ff775d278d"
> +SRC_URI[sha256sum] = "acee8c8a88b995fb95601b7b43bf0c
> 83f502d9026bca5705f9c0dc44a757997e"
>
>  S = "${WORKDIR}/gst-omx-${PV}"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141481ef1b33d0550582c7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I presume you build without api-documentation as with Poky=
 I get this error:<div><br></div><div><div>| checking for gtkdoc-check... /=
data/poky-master/tmp/work/corei7-64-poky-linux/gstreamer1.0-omx/1.10.4-r0/r=
ecipe-sysroot-native/usr/bin/gtkdoc-check</div><div>| checking for gtkdoc-r=
ebase... /data/poky-master/tmp/work/corei7-64-poky-linux/gstreamer1.0-omx/1=
.10.4-r0/recipe-sysroot-native/usr/bin/gtkdoc-rebase</div><div>| checking f=
or gtkdoc-mkpdf... /data/poky-master/tmp/work/corei7-64-poky-linux/gstreame=
r1.0-omx/1.10.4-r0/recipe-sysroot-native/usr/bin/gtkdoc-mkpdf</div><div>| c=
onfigure: error: You need to have gtk-doc &gt;=3D 1.3 installed to build GS=
treamer OpenMAX Plug-ins</div></div><div><br></div><div>Ross</div></div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 16 May 2017 at 12=
:26, Carlos Rafael Giani <span dir=3D"ltr">&lt;<a href=3D"mailto:dv@pseudot=
erminal.org" target=3D"_blank">dv@pseudoterminal.org</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Signed-off-by: Carlos Rafael Giani &lt;<a=
 href=3D"mailto:dv@pseudoterminal.org">dv@pseudoterminal.org</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://gstreamer1.0-omx_1.10.4.bb" rel=3D"noreferrer"=
 target=3D"_blank">gstreamer1.0-omx_1.10.4.<wbr>bb</a> =3D&gt; <a href=3D"h=
ttp://gstreamer1.0-omx_1.12.0.bb" rel=3D"noreferrer" target=3D"_blank">gstr=
eamer1.0-omx_1.12.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-multimedia/<wbr>gstreamer/{<a href=3D"http://gstr=
eamer1.0-omx_1.10.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-o=
mx_1.<wbr>10.4.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-omx_1.12.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-omx_1.12.0.bb</a>} (69%)=
<br>
<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstre=
amer1.0-omx_1.10.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-om=
x_1.<wbr>10.4.bb</a> b/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"ht=
tp://gstreamer1.0-omx_1.12.0.bb" rel=3D"noreferrer" target=3D"_blank">gstre=
amer1.0-omx_1.<wbr>12.0.bb</a><br>
similarity index 69%<br>
rename from meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstrea=
mer1.0-omx_1.10.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-omx=
_1.<wbr>10.4.bb</a><br>
rename to meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstreame=
r1.0-omx_1.12.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-omx_1=
.<wbr>12.0.bb</a><br>
index dfeefa5..73c5adb 100644<br>
--- a/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstreamer1.0=
-omx_1.10.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-omx_1.<wb=
r>10.4.bb</a><br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstreamer1.0=
-omx_1.12.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-omx_1.<wb=
r>12.0.bb</a><br>
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>4fbd65=
380cdd255951079008b36451<wbr>6c \<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://gstreamer.freedesktop.org/src/gst=
-omx/gst-omx-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://gstr=
eamer.freedesktop.<wbr>org/src/gst-omx/gst-omx-${PV}.<wbr>tar.xz</a>&quot;<=
br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>cedb230f1c47d0cf4b575d70dff66f<wbr>f2&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>45072925cf262f0fd528fab78f0de5<wbr>2734e=
46a5a88aa802fae51c67c09c8<wbr>1aa2&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>eaf9505c7acb9b96215cb0ff775d27<wbr>8d&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>acee8c8a88b995fb95601b7b43bf0c<wbr>83f50=
2d9026bca5705f9c0dc44a757<wbr>997e&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/gst-omx-${PV}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
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

--001a1141481ef1b33d0550582c7e--

Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id F102E60602
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Feb 2018 23:29:20 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id n7so3881397iob.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Feb 2018 15:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jA7ONMcFpgHlF6LWhA2xfRFhpUtkxrznbR6V1tf6DLA=;
	b=GjFDHNKmf3eEvijJMN57fBToqX0gFjwliy9ROknMjlg842QoX6Md+P5mvP62x2Kqr1
	ZoaLpFap3TYFq1jclxwGwJmZcpX2WUQI4+J+xrwUyD2tE8yani2eUrrM5ka2y4QNha4F
	NYfMw2uiZ5WF1ni/jyVEggO4IY5GVONwRXzW/dxcl0GWd098f7qdfANUqbmZkxB51WtE
	obXouxXKhKXtZCaW6RajcGV7YyTScWSCvP/xsM98Bha80w0OCaQkeuMbY8G93fG+EeO4
	5iwthSzLQE2gIYOCYxa/XUTMIEipNr3f8wQmhJlNTYCIjfD5f5CEjNBEAqCPz+1NBVj1
	UPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jA7ONMcFpgHlF6LWhA2xfRFhpUtkxrznbR6V1tf6DLA=;
	b=DOPiJaNs0HSLWRmwP7tP0+Bz0tm2ej2c86FVaCWKu1iFPiWM92LqI+4snyZZh71Mzy
	rO5H3PlcEzlohNDDytAo7u2/n+rGa08bGXY9ssWY4T5Wg2kLKfy73W+DtgRJU3l0KgEf
	PUMRDWJ3SeS2Ac10YBy60H7oQASK+uTfh6u3g0k3LKer7D+3Nn0YdLMHBySG84QxNDhb
	d/aXKadowOmhCZNrdW3fe5lUNIaIPUqfbnBM3Iz+AM+Z47dsnJ+3zRCAo01j9mXN04tN
	4JmGctJVtCAsvEEd30fKLyp9BVp9+FK+kXYHVyNaLLyEKp+wx/8wpmE6ap273+t0ZwKe
	hLow==
X-Gm-Message-State: APf1xPDvJOp+4o7tCxUdHqq8PNFabLRmRCGWhPwuyuxxkxjnHd/6sq4O
	buLaofyPdGPlwkUVp3hCc1fSXbKs7VvLdGcgCzZvag==
X-Google-Smtp-Source: AH8x224QmVVHbpl+0b0kXJ+Da6g0OqILgKcH48shGjtipPsbYofdjQ62xSA4WZgnu7pe+di3F90zXT2KWACT9WbCMjw=
X-Received: by 10.107.32.19 with SMTP id g19mr9695994iog.217.1518046161831;
	Wed, 07 Feb 2018 15:29:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Wed, 7 Feb 2018 15:29:01 -0800 (PST)
In-Reply-To: <1518039023-29531-1-git-send-email-carlos.rodriguez@ridgerun.com>
References: <1518039023-29531-1-git-send-email-carlos.rodriguez@ridgerun.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Feb 2018 23:29:01 +0000
Message-ID: <CAJTo0LZpMogpg6sBUtbL+-BJ+Cf6C-HG6P3um-HjUaCct52YXA@mail.gmail.com>
To: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gst-shark: Add Gst-Shark recipe
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
X-List-Received-Date: Wed, 07 Feb 2018 23:29:21 -0000
Content-Type: multipart/alternative; boundary="001a1141a2a43aa0180564a7aaa8"

--001a1141a2a43aa0180564a7aaa8
Content-Type: text/plain; charset="UTF-8"

I'd be inclined to say these are a good fit for meta-multimedia, but not
oe-core.

Ross

On 7 February 2018 at 21:30, Carlos Rodriguez <carlos.rodriguez@ridgerun.com
> wrote:

> Gst-Shark is a set of tracers used as Benchmarks and
> profiling tools for GStreamer. It includes tracers for
> generating debug information plus some tools to analyze
> the debug information. GstShark provides easy to use and
> useful tracers, paired with analysis tools to enable
> straightforward optimizations.
>
> Signed-off-by: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
> ---
>  meta/recipes-multimedia/gstreamer/gst-shark.inc    | 36
> ++++++++++++++++++++++
>  .../gstreamer/gst-shark_0.2.1.bb                   |  3 ++
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-shark.inc
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-shark_0.2.1.bb
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-shark.inc
> b/meta/recipes-multimedia/gstreamer/gst-shark.inc
> new file mode 100644
> index 0000000..1841d30
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gst-shark.inc
> @@ -0,0 +1,36 @@
> +DESCRIPTION = "RidgeRun Gst-Shark Tracers"
> +SUMMARY = "Benchmarks and profiling tools for GStreamer"
> +HOMEPAGE = "https://developer.ridgerun.com/wiki/index.php?title=GstShark"
> +SECTION = "multimedia"
> +LICENSE = "GPLv2+"
> +
> +DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base
> gstreamer1.0-plugins-bad "
> +
> +SRCBRANCH ?= "master"
> +
> +SRCREV_base = "a60b3996fe3376d42334fc89014e9d6f6af62899"
> +SRCREV_common = "b64f03f6090245624608beb5d2fff335e23a01c0"
> +
> +SRC_URI = " \
> +    git://git@github.com/RidgeRun/gst-shark.git;protocol=https;
> branch=${SRCBRANCH};name=base \
> +    git://anongit.freedesktop.org/git/gstreamer/common.git;
> protocol=https;destsuffix=git/common;name=common; \
> +    "
> +
> +S = "${WORKDIR}/git"
> +
> +PACKAGECONFIG_CONFARGS = " \
> +       --disable-graphviz \
> +       --enable-gtk-doc=no \
> +"
> +
> +FILES_${PN} += "\
> +       ${libdir}/gstreamer-1.0/libgstsharktracers.so  \
> +       ${libdir}/gstreamer-1.0/libgstsharktracers.la \
> +"
> +
> +inherit autotools gettext
> +
> +do_configure() {
> +${S}/autogen.sh --noconfigure
> +oe_runconf
> +}
> diff --git a/meta/recipes-multimedia/gstreamer/gst-shark_0.2.1.bb
> b/meta/recipes-multimedia/gstreamer/gst-shark_0.2.1.bb
> new file mode 100644
> index 0000000..637bd0e
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gst-shark_0.2.1.bb
> @@ -0,0 +1,3 @@
> +require gst-shark.inc
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e1caa368743492879002ad032445fa97"
> \ No newline at end of file
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141a2a43aa0180564a7aaa8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;d be inclined to say these are a good fit for meta-m=
ultimedia, but not oe-core.<div><br></div><div>Ross</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 7 February 2018 at 21:30=
, Carlos Rodriguez <span dir=3D"ltr">&lt;<a href=3D"mailto:carlos.rodriguez=
@ridgerun.com" target=3D"_blank">carlos.rodriguez@ridgerun.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">Gst-Shark is a set of tracers u=
sed as Benchmarks and<br>
profiling tools for GStreamer. It includes tracers for<br>
generating debug information plus some tools to analyze<br>
the debug information. GstShark provides easy to use and<br>
useful tracers, paired with analysis tools to enable<br>
straightforward optimizations.<br>
<br>
Signed-off-by: Carlos Rodriguez &lt;<a href=3D"mailto:carlos.rodriguez@ridg=
erun.com">carlos.rodriguez@ridgerun.com</a><wbr>&gt;<br>
---<br>
=C2=A0meta/recipes-multimedia/<wbr>gstreamer/gst-shark.inc=C2=A0 =C2=A0 | 3=
6 ++++++++++++++++++++++<br>
=C2=A0.../gstreamer/<a href=3D"http://gst-shark_0.2.1.bb" rel=3D"noreferrer=
" target=3D"_blank">gst-shark_0.2.1.<wbr>bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++<br>
=C2=A02 files changed, 39 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/<wbr>gstreamer/gst-shark.i=
nc<br>
=C2=A0create mode 100644 meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"=
http://gst-shark_0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">gst-shark_0=
.2.1.bb</a><br>
<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/gst-shark.inc b/meta/re=
cipes-multimedia/<wbr>gstreamer/gst-shark.inc<br>
new file mode 100644<br>
index 0000000..1841d30<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/gst-shark.inc<br>
@@ -0,0 +1,36 @@<br>
+DESCRIPTION =3D &quot;RidgeRun Gst-Shark Tracers&quot;<br>
+SUMMARY =3D &quot;Benchmarks and profiling tools for GStreamer&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://developer.ridgerun.com/wiki/index.ph=
p?title=3DGstShark" rel=3D"noreferrer" target=3D"_blank">https://developer.=
ridgerun.<wbr>com/wiki/index.php?title=3D<wbr>GstShark</a>&quot;<br>
+SECTION =3D &quot;multimedia&quot;<br>
+LICENSE =3D &quot;GPLv2+&quot;<br>
+<br>
+DEPENDS =3D &quot;gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plug=
ins-bad &quot;<br>
+<br>
+SRCBRANCH ?=3D &quot;master&quot;<br>
+<br>
+SRCREV_base =3D &quot;<wbr>a60b3996fe3376d42334fc89014e9d<wbr>6f6af62899&q=
uot;<br>
+SRCREV_common =3D &quot;<wbr>b64f03f6090245624608beb5d2fff3<wbr>35e23a01c0=
&quot;<br>
+<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://git@github.com/RidgeRun/gst-shark.gi=
t;protocol=3Dhttps;branch=3D${SRCBRANCH};name=3Dbase" rel=3D"noreferrer" ta=
rget=3D"_blank">git@github.com/RidgeRun/<wbr>gst-shark.git;protocol=3Dhttps=
;<wbr>branch=3D${SRCBRANCH};name=3Dbase</a> \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://anongit.freedesktop.org/git/gstreame=
r/common.git;protocol=3Dhttps;destsuffix=3Dgit/common;name=3Dcommon" rel=3D=
"noreferrer" target=3D"_blank">anongit.freedesktop.org/<wbr>git/gstreamer/c=
ommon.git;<wbr>protocol=3Dhttps;destsuffix=3Dgit/<wbr>common;name=3Dcommon<=
/a>; \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+PACKAGECONFIG_CONFARGS =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-graphviz \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-gtk-doc=3Dno \<br>
+&quot;<br>
+<br>
+FILES_${PN} +=3D &quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/gstreamer-1.0/<wbr>libgstsharktracers=
.so=C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/gstreamer-1.0/<a href=3D"http://libgs=
tsharktracers.la" rel=3D"noreferrer" target=3D"_blank">libgst<wbr>sharktrac=
ers.la</a> \<br>
+&quot;<br>
+<br>
+inherit autotools gettext<br>
+<br>
+do_configure() {<br>
+${S}/autogen.sh --noconfigure<br>
+oe_runconf<br>
+}<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gst-s=
hark_0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">gst-shark_0.2.1.bb</a> =
b/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gst-shark_0.2.1.=
bb" rel=3D"noreferrer" target=3D"_blank">gst-shark_0.2.1.bb</a><br>
new file mode 100644<br>
index 0000000..637bd0e<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gst-shark_0.=
2.1.bb" rel=3D"noreferrer" target=3D"_blank">gst-shark_0.2.1.bb</a><br>
@@ -0,0 +1,3 @@<br>
+require gst-shark.inc<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>e1caa368743492879002a=
d032445fa<wbr>97&quot;<br>
\ No newline at end of file<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
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

--001a1141a2a43aa0180564a7aaa8--

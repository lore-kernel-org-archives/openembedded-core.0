Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 05B24601A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 15:06:35 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id o9so4459890iod.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 08:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Qhw9EiLhmUfft6R6aWY3ojrGRjcswkj3e0OyFdy5X4k=;
	b=DPpNwwYs5E62pDpSWgIuePz0Wz33BQXkirrJwbR38+e0CPJKeSK0thREKtRpO4QEOz
	uuXn2+3BRoQ2XlQqedIhkCnYEsUCMFTV8T36lySqHVyfJ9OUAdKMvsAYLdVgz9ZHCXK9
	QjqpsVPVQ6nzbThL0/OAR/18tzaXiO8EKUJg9rtdLkHJfIp+P6yU3QbU1fpxFtX/QoZM
	33KaJxEewHmRcvYwr4Qe+zhmfZHmEpuG6u4MXVLnDznAJoMKj3brbvh/p+pbS+xzGdNZ
	tvwXYg9+xOoJ2WAtWRvg0gOLcEPZKUfxHlAJfpPxeeUjGEXiq8MCq2g+fNrzpUYYUqYp
	HLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Qhw9EiLhmUfft6R6aWY3ojrGRjcswkj3e0OyFdy5X4k=;
	b=VGmHWb/F33WbfVDT9LZtKJ1TOMj9m1XBnMr09vazPtsOzs91Z8EPIF8z7Ey4p6T7Jg
	6huwJ8MeLBvKQkV79w0FNMEBbshdEc6hjOJbKeRTwZFeSNjMnMvCc7yhNH4CNG48r6aG
	VvXf1MFoCj707q0p5foAXBX2Tme+hMXwwzvVUrIibaP2H/RvjZuN+htX9Z3nRzzL++XW
	elH8RQ00Lpwinbff0lcb5w1MHxfGUMS2jlXwf3eLgg+Pqdd/pwMi2vyUwyej2Sm6/t9e
	3saj3FLqbIJ2zg0hSVcc+S4MLJefSx6fqArhTep0EmCRaGwp/FL6zUJ0jVrHS5GHJM6X
	S5dw==
X-Gm-Message-State: AIVw111iilRx5zozZeIuEDrOrl+ufmG2IP0HFfXYWrPBHiEOu8TsSi5O
	41ziK/PvmVPnTQU8YPdPnRa/UU4Vx09e
X-Received: by 10.107.205.72 with SMTP id d69mr19353493iog.224.1501513596965; 
	Mon, 31 Jul 2017 08:06:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Mon, 31 Jul 2017 08:06:16 -0700 (PDT)
In-Reply-To: <b59b18fe8cb0efc2577b58e6af9ed848748ff09d.1501512975.git-series.patrick.ohly@intel.com>
References: <cover.d5ac661bf06568770da90f3e88828979c242547e.1501512975.git-series.patrick.ohly@intel.com>
	<b59b18fe8cb0efc2577b58e6af9ed848748ff09d.1501512975.git-series.patrick.ohly@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 31 Jul 2017 16:06:16 +0100
Message-ID: <CAJTo0LYO=ttPT-TfO8yWt_xWzsbUfp2Y0CwMphaK0ab72Qu7Qg@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] autoconf-archive: move from meta-oe to OE-core
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
X-List-Received-Date: Mon, 31 Jul 2017 15:06:36 -0000
Content-Type: multipart/alternative; boundary="94eb2c189bae929a7205559e60dd"

--94eb2c189bae929a7205559e60dd
Content-Type: text/plain; charset="UTF-8"

v2 made it into master, can you send just the fix?

Ross

On 31 July 2017 at 15:56, Patrick Ohly <patrick.ohly@intel.com> wrote:

> Having common macros in OE-core that are needed by autotools based
> projects makes sense. For example, tpm2.0-tools in meta-measured
> depended on meta-oe only because of autoconf-archive.
>
> This is a verbatim copy of the autoconf-archive recipe in
> meta-openembedded rev 1cbd1bc1, with just one change: the patch which
> disabled the installation of ax_code_coverage.m4 and
> ax_check_enable_debug.m4 and the dependency on gnome-common were
> removed.
>
> So now autoconf-archive in OE-core provides them. gnome-common in
> meta-oe will be changed to not install them and instead depend on
> autoconf-archive.
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/recipes-devtools/autoconf-archive/autoconf-archive.inc           |
> 13 +++++++++++++
>  meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb |
> 13 +++++++++++++
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta/recipes-devtools/autoconf-archive/autoconf-
> archive.inc
>  create mode 100644 meta/recipes-devtools/autoconf-archive/autoconf-
> archive_2016.09.16.bb
>
> diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
> b/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
> new file mode 100644
> index 0000000..4f63e0f
> --- /dev/null
> +++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
> @@ -0,0 +1,13 @@
> +LICENSE = "GPLv3"
> +HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
> +SECTION = "devel"
> +
> +DEPENDS += "m4-native"
> +DEPENDS_class-native = "m4-native gnu-config-native"
> +DEPENDS_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
> +
> +RDEPENDS_${PN} = "m4 gnu-config"
> +
> +SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
> +
> +inherit autotools
> diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-
> archive_2016.09.16.bb b/meta/recipes-devtools/autoconf-archive/autoconf-
> archive_2016.09.16.bb
> new file mode 100644
> index 0000000..0a1a771
> --- /dev/null
> +++ b/meta/recipes-devtools/autoconf-archive/autoconf-
> archive_2016.09.16.bb
> @@ -0,0 +1,13 @@
> +require autoconf-archive.inc
> +
> +
> +PARALLEL_MAKE = ""
> +
> +LICENSE = "GPLv2 & GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +SRC_URI[md5sum] = "bf19d4cddce260b3c3e1d51d42509071"
> +SRC_URI[sha256sum] = "e8f2efd235f842bad2f6938bf4a722
> 40a5e5fcd248e8444335e63beb60fabd82"
> +
> +EXTRA_OECONF += "ac_cv_path_M4=m4"
> +BBCLASSEXTEND = "native nativesdk"
> --
> git-series 0.9.1
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c189bae929a7205559e60dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">v2 made it into master, can you send just the fix?<div><br=
></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On 31 July 2017 at 15:56, Patrick Ohly <span dir=3D"ltr">&lt;<a =
href=3D"mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Having common =
macros in OE-core that are needed by autotools based<br>
projects makes sense. For example, tpm2.0-tools in meta-measured<br>
depended on meta-oe only because of autoconf-archive.<br>
<br>
This is a verbatim copy of the autoconf-archive recipe in<br>
meta-openembedded rev 1cbd1bc1, with just one change: the patch which<br>
disabled the installation of ax_code_coverage.m4 and<br>
ax_check_enable_debug.m4 and the dependency on gnome-common were<br>
removed.<br>
<br>
So now autoconf-archive in OE-core provides them. gnome-common in<br>
meta-oe will be changed to not install them and instead depend on<br>
autoconf-archive.<br>
<br>
Signed-off-by: Patrick Ohly &lt;<a href=3D"mailto:patrick.ohly@intel.com">p=
atrick.ohly@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/<wbr>autoconf-archive/autoconf-<wbr>archive.inc=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 13 +++++++++++++<br>
=C2=A0meta/recipes-devtools/<wbr>autoconf-archive/<a href=3D"http://autocon=
f-archive_2016.09.16.bb" rel=3D"noreferrer" target=3D"_blank">autoconf-<wbr=
>archive_2016.09.16.bb</a> | 13 +++++++++++++<br>
=C2=A02 files changed, 26 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/<wbr>autoconf-archive/autoco=
nf-<wbr>archive.inc<br>
=C2=A0create mode 100644 meta/recipes-devtools/<wbr>autoconf-archive/<a hre=
f=3D"http://autoconf-archive_2016.09.16.bb" rel=3D"noreferrer" target=3D"_b=
lank">autoconf-<wbr>archive_2016.09.16.bb</a><br>
<br>
diff --git a/meta/recipes-devtools/<wbr>autoconf-archive/autoconf-<wbr>arch=
ive.inc b/meta/recipes-devtools/<wbr>autoconf-archive/autoconf-<wbr>archive=
.inc<br>
new file mode 100644<br>
index 0000000..4f63e0f<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/<wbr>autoconf-archive/autoconf-<wbr>archive.inc=
<br>
@@ -0,0 +1,13 @@<br>
+LICENSE =3D &quot;GPLv3&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://www.gnu.org/software/autoconf-archive=
/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/software/<wbr>au=
toconf-archive/</a>&quot;<br>
+SECTION =3D &quot;devel&quot;<br>
+<br>
+DEPENDS +=3D &quot;m4-native&quot;<br>
+DEPENDS_class-native =3D &quot;m4-native gnu-config-native&quot;<br>
+DEPENDS_class-nativesdk =3D &quot;m4-nativesdk gnu-config-nativesdk&quot;<=
br>
+<br>
+RDEPENDS_${PN} =3D &quot;m4 gnu-config&quot;<br>
+<br>
+SRC_URI =3D &quot;${GNU_MIRROR}/${BPN}/${BPN}-$<wbr>{PV}.tar.xz&quot;<br>
+<br>
+inherit autotools<br>
diff --git a/meta/recipes-devtools/<wbr>autoconf-archive/<a href=3D"http://=
autoconf-archive_2016.09.16.bb" rel=3D"noreferrer" target=3D"_blank">autoco=
nf-<wbr>archive_2016.09.16.bb</a> b/meta/recipes-devtools/<wbr>autoconf-arc=
hive/<a href=3D"http://autoconf-archive_2016.09.16.bb" rel=3D"noreferrer" t=
arget=3D"_blank">autoconf-<wbr>archive_2016.09.16.bb</a><br>
new file mode 100644<br>
index 0000000..0a1a771<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/<wbr>autoconf-archive/<a href=3D"http://autocon=
f-archive_2016.09.16.bb" rel=3D"noreferrer" target=3D"_blank">autoconf-<wbr=
>archive_2016.09.16.bb</a><br>
@@ -0,0 +1,13 @@<br>
+require autoconf-archive.inc<br>
+<br>
+<br>
+PARALLEL_MAKE =3D &quot;&quot;<br>
+<br>
+LICENSE =3D &quot;GPLv2 &amp; GPLv3&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>d32239bcb673463ab874e=
80d47fae5<wbr>04&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>bf19d4cddce260b3c3e1d51d425090<wbr>71&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>e8f2efd235f842bad2f6938bf4a722<wbr>40a5e=
5fcd248e8444335e63beb60fa<wbr>bd82&quot;<br>
+<br>
+EXTRA_OECONF +=3D &quot;ac_cv_path_M4=3Dm4&quot;<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
git-series 0.9.1<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c189bae929a7205559e60dd--

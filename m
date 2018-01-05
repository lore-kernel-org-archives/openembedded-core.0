Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id D2F266010D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 11:47:48 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id x67so5518028ioi.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jan 2018 03:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VLl8zkYIR6D7Gp6sES8TENhf9mACuEoPtjzDITV/3fg=;
	b=PYTZSwQGtJdJtyRR5G6hjLAGRPgGi+v9BLe5W7Rd8IavX1ZMPlBlxVU9l0SoYRLGt4
	7D9izK/deCRjG9/Rcp1fOjZ45IJcp9DgziCd/eg/oTYH4HpZHdX5nvqTOHww6wauSYm/
	yIj7dHo4t1hoDlCu7epCzmpA4kfkcbf3pI8Hpn79GbTFXFD6582VMk4W2LZmks9aZCsK
	ccF3CMhgTRHhAnzFf7gKO2jqTswsena956eqr8uW6XxopsqsGX91ewm6V2bS5sy0YosU
	NeE1KVrpTAWG7aJhojM5Sj9llTXXEe7VOjr2UNLOnf0CvA8v0mn2BLCwOCYCxXlTTKeq
	Zozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VLl8zkYIR6D7Gp6sES8TENhf9mACuEoPtjzDITV/3fg=;
	b=qVYIPTfJ1BsXeYNPJvulpRVI1ZUIv2elzU57UfZPG5bdE18Scj4WNhwAtOeHZPLq5z
	BvIOsHdPCl+4oSVMDIAedtB+75Jq4X/rjbCW0WF10t9oHWu+RcGi7b0OT6mP0D9DbNPK
	KlwVlYPv4mJcMI5t34vp4KKV+h2BxXbv/1hSjRvWf02v4p+MujwNB9IMWLO3iYSMC4nT
	UeEiZOvZF2UPuqm11UCXDb27FgpJH0g/9pNg8k2/UV7HEx6r6uwpVnU4jBvfsGkaufBu
	wTjF8WLf0Tmg9rfx45dzqr/7iz65UaVJJ3jCTNGqZ9VJyuea3Bk8pKmff6rBRW27RTJg
	++uw==
X-Gm-Message-State: AKGB3mK934M9H1hiC/QDIyFLv/o4Yzk7ciK1sklwbZ9I1OSUKui4Nwaa
	9Ke5e15UzXKPY6sRq1zzcSm3ECEOl2FCXkDPDf3aVQ==
X-Google-Smtp-Source: ACJfBottx0YdYOC2BlauZqoDyiml7qD2mysCsmaq/ki3eHHYf+Wh9wcmJC9zzElGieXojoP/CFk96G8z6A696tpii6g=
X-Received: by 10.107.186.139 with SMTP id k133mr2770372iof.208.1515152869795; 
	Fri, 05 Jan 2018 03:47:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.34.133 with HTTP; Fri, 5 Jan 2018 03:47:29 -0800 (PST)
In-Reply-To: <20180104131238.21452-2-alexander.kanavin@linux.intel.com>
References: <20180104131238.21452-1-alexander.kanavin@linux.intel.com>
	<20180104131238.21452-2-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Jan 2018 11:47:29 +0000
Message-ID: <CAJTo0Lb4YRsAknNGhzc_dqGS7wJgFzxL_siyqQAGJ=9Wy7Cm+g@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/9] gnomebase-meson.bbclass: add a meson-specific version
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
X-List-Received-Date: Fri, 05 Jan 2018 11:47:49 -0000
Content-Type: multipart/alternative; boundary="94eb2c07077a95bfed0562060483"

--94eb2c07077a95bfed0562060483
Content-Type: text/plain; charset="UTF-8"

Do we even need gnomebase-meson with this?  I can see a future where GNOME
is entirely Meson and then we could just switch the default
GNOMEBASEBUILDCLASS from autotools to meson.

(prior art being the tarball compression type)

Ross

On 4 January 2018 at 13:12, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> gnomebase.bbclass hardcodes the autotools inherit, so make it
> configurable and set appropriately from both classes.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/classes/gnomebase-meson.bbclass | 2 ++
>  meta/classes/gnomebase.bbclass       | 3 ++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>  create mode 100644 meta/classes/gnomebase-meson.bbclass
>
> diff --git a/meta/classes/gnomebase-meson.bbclass
> b/meta/classes/gnomebase-meson.bbclass
> new file mode 100644
> index 00000000000..92e2e3f3b18
> --- /dev/null
> +++ b/meta/classes/gnomebase-meson.bbclass
> @@ -0,0 +1,2 @@
> +GNOMEBASEBUILDCLASS = "meson"
> +inherit gnomebase
> diff --git a/meta/classes/gnomebase.bbclass b/meta/classes/gnomebase.
> bbclass
> index 4ccc8e07814..efcb6caae15 100644
> --- a/meta/classes/gnomebase.bbclass
> +++ b/meta/classes/gnomebase.bbclass
> @@ -20,7 +20,8 @@ FILES_${PN} += "${datadir}/application-registry  \
>
>  FILES_${PN}-doc += "${datadir}/devhelp"
>
> -inherit autotools pkgconfig
> +GNOMEBASEBUILDCLASS ??= "autotools"
> +inherit ${GNOMEBASEBUILDCLASS} pkgconfig
>
>  do_install_append() {
>         rm -rf ${D}${localstatedir}/lib/scrollkeeper/*
> --
> 2.15.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c07077a95bfed0562060483
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Do we even need gnomebase-meson with this?=C2=A0 I can see=
 a future where GNOME is entirely Meson and then we could just switch the d=
efault GNOMEBASEBUILDCLASS from autotools to meson.<div><br></div><div>(pri=
or art being the tarball compression type)</div><div><br></div><div>Ross</d=
iv></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 4 Jan=
uary 2018 at 13:12, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D"mail=
to:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kanavin@l=
inux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">gnom=
ebase.bbclass hardcodes the autotools inherit, so make it<br>
configurable and set appropriately from both classes.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/gnomebase-meson.<wbr>bbclass | 2 ++<br>
=C2=A0meta/classes/gnomebase.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ++-<br>
=C2=A02 files changed, 4 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/classes/gnomebase-meson.<wbr>bbclass<br>
<br>
diff --git a/meta/classes/gnomebase-<wbr>meson.bbclass b/meta/classes/gnome=
base-<wbr>meson.bbclass<br>
new file mode 100644<br>
index 00000000000..92e2e3f3b18<br>
--- /dev/null<br>
+++ b/meta/classes/gnomebase-<wbr>meson.bbclass<br>
@@ -0,0 +1,2 @@<br>
+GNOMEBASEBUILDCLASS =3D &quot;meson&quot;<br>
+inherit gnomebase<br>
diff --git a/meta/classes/gnomebase.<wbr>bbclass b/meta/classes/gnomebase.<=
wbr>bbclass<br>
index 4ccc8e07814..efcb6caae15 100644<br>
--- a/meta/classes/gnomebase.<wbr>bbclass<br>
+++ b/meta/classes/gnomebase.<wbr>bbclass<br>
@@ -20,7 +20,8 @@ FILES_${PN} +=3D &quot;${datadir}/application-<wbr>regist=
ry=C2=A0 \<br>
<br>
=C2=A0FILES_${PN}-doc +=3D &quot;${datadir}/devhelp&quot;<br>
<br>
-inherit autotools pkgconfig<br>
+GNOMEBASEBUILDCLASS ??=3D &quot;autotools&quot;<br>
+inherit ${GNOMEBASEBUILDCLASS} pkgconfig<br>
<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${localstatedir}/lib/<wbr>scrollkeep=
er/*<br>
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

--94eb2c07077a95bfed0562060483--

Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id B2E247898D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 17:49:13 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id b34so11425390ioj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 09:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vswUUfa5ba19Lf/1o/RN1eqi5jXVjZLaWkDKqXyO3/w=;
	b=NfAjmgHa65S4CJimBaC4iTEfUC1dQEvyVIraZzOwP0bkPjjszB7+OVPCdhL1khuoEK
	eu/R5XFwJ6YWhB0TfnBkA4q+XPIt94ltRTYRl/vPFNpDsvs/iOeomN3KbNVHv3l4XAJ7
	TlrvzDx6F48nea9N8w5TcQq5cmMXclnj6852AkRgPfpiq/Eael1CfNq+lewqmuSkEFAC
	1dwcpixWjmLMObGkAg05dWTP9kei7Aq3GCN5GhRln7ZYgCZGQudMU3fgcpuK6Y0DAzrU
	ZaVXab81kVlzFYHIHBxs4rc+SFgTwTCuFO6wdQQiFfED8nhvNxz00vsFprKtxuswZlKj
	GsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vswUUfa5ba19Lf/1o/RN1eqi5jXVjZLaWkDKqXyO3/w=;
	b=ehDqV/0x5T650BBOoCk8SXITC5EWgpK+R3Xl1eYx1A9J+AhMRRaLsIhjtT8gzr62Dy
	/dEV11yMqZQp4fIwgC8kDAZ08IDtIKTOCekZ2krD/gWCW96k8cN2E+FSD+RHClohEy20
	+eZGnszt3wF1GQt90k8SnAeC1XDQvagVQdiRKAJ7OXc1/XYtKn/QCkwsSS/pqWUZsNPw
	5nQ4+R0RWpq2G/l0l+mTnZNR8CgHMfeuvU4rpNI2P7VXVaBH04MXBTL+VPPylGzBsu+s
	5/PWoAVag2Yv/XY+A+swZGYNFzKdHDF7hBWCUxPusIUh+Zmh9Ff+sD9CgZMSToyLeKIt
	Dnlg==
X-Gm-Message-State: AElRT7GHzOFYzo5Wr0n8iDL96/R6utTXc+E5EIp2GWl5dJxc7Vjp5XNN
	9V29lvCW2H/bOv7gZsQNx7JxqAr4PuVxNmjVX8yR1w==
X-Google-Smtp-Source: AG47ELuAvjSxeC2kuc2zPRVFBSPR0saTKQ0N6itlL3K10ydK+LGG6ws66Es5mFDu7WdapMfVs2GxaWXT97RtETAaiig=
X-Received: by 10.107.37.212 with SMTP id l203mr7479458iol.20.1520012954750;
	Fri, 02 Mar 2018 09:49:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Fri, 2 Mar 2018 09:48:54 -0800 (PST)
In-Reply-To: <20180302174657.32731-1-alexandru.vasiu@ni.com>
References: <20180302174657.32731-1-alexandru.vasiu@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 2 Mar 2018 17:48:54 +0000
Message-ID: <CAJTo0LZY4g32zNeTKoxT2fNYY4xr1NzGgrqdCo1_3XLCmZ8ueg@mail.gmail.com>
To: Alexandru Vasiu <alexandru.vasiu@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add support for pyiface
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
X-List-Received-Date: Fri, 02 Mar 2018 17:49:13 -0000
Content-Type: multipart/alternative; boundary="001a11405f163906740566719808"

--001a11405f163906740566719808
Content-Type: text/plain; charset="UTF-8"

Nice recipe, but it should be in meta-python unless there's a compelling
reason to be in oe-core.

Ross

On 2 March 2018 at 17:46, Alexandru Vasiu <alexandru.vasiu@ni.com> wrote:

> Pyiface is a package that exposes the network interfaces of the
> operating system in a easy to use and transparent way.
>
> Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
> ---
>  meta/recipes-support/pyiface/pyiface_0.0.2.bb | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 meta/recipes-support/pyiface/pyiface_0.0.2.bb
>
> diff --git a/meta/recipes-support/pyiface/pyiface_0.0.2.bb
> b/meta/recipes-support/pyiface/pyiface_0.0.2.bb
> new file mode 100644
> index 0000000000..fad75af06d
> --- /dev/null
> +++ b/meta/recipes-support/pyiface/pyiface_0.0.2.bb
> @@ -0,0 +1,10 @@
> +SUMMARY = "Pyiface Recipe - Adds Pyiface library for Python"
> +HOMEPAGE = "https://pypi.python.org/pypi/pyiface/"
> +LICENSE = "GPLv3+"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fe869ee987a340198fb0d54c55c47
> f1"
> +
> +SRC_URI[md5sum] = "8ced1d8ef89376a5aed97a59f11ae683"
> +SRC_URI[sha256sum] = "bf5b1ff115344d388b0f9409a440ee
> 06f67478b6c63bc8d8ce8f843f2652a8d3"
> +
> +inherit pypi setuptools
> --
> 2.16.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11405f163906740566719808
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Nice recipe, but it should be in meta-python unless there&=
#39;s a compelling reason to be in oe-core.<div><br></div><div>Ross</div></=
div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 2 March 20=
18 at 17:46, Alexandru Vasiu <span dir=3D"ltr">&lt;<a href=3D"mailto:alexan=
dru.vasiu@ni.com" target=3D"_blank">alexandru.vasiu@ni.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Pyiface is a package that exposes t=
he network interfaces of the<br>
operating system in a easy to use and transparent way.<br>
<br>
Signed-off-by: Alexandru Vasiu &lt;<a href=3D"mailto:alexandru.vasiu@ni.com=
">alexandru.vasiu@ni.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/pyiface/<a href=3D"http://pyiface_0.0.2.bb" rel=
=3D"noreferrer" target=3D"_blank">p<wbr>yiface_0.0.2.bb</a> | 10 ++++++++++=
<br>
=C2=A01 file changed, 10 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/pyiface/<a href=3D"http://pyi=
face_0.0.2.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>yiface_0.0.2.bb</=
a><br>
<br>
diff --git a/meta/recipes-support/<wbr>pyiface/<a href=3D"http://pyiface_0.=
0.2.bb" rel=3D"noreferrer" target=3D"_blank">pyiface_0.0.2.bb</a> b/meta/re=
cipes-support/<wbr>pyiface/<a href=3D"http://pyiface_0.0.2.bb" rel=3D"noref=
errer" target=3D"_blank">pyiface_0.0.2.bb</a><br>
new file mode 100644<br>
index 0000000000..fad75af06d<br>
--- /dev/null<br>
+++ b/meta/recipes-support/<wbr>pyiface/<a href=3D"http://pyiface_0.0.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">pyiface_0.0.2.bb</a><br>
@@ -0,0 +1,10 @@<br>
+SUMMARY =3D &quot;Pyiface Recipe - Adds Pyiface library for Python&quot;<b=
r>
+HOMEPAGE =3D &quot;<a href=3D"https://pypi.python.org/pypi/pyiface/" rel=
=3D"noreferrer" target=3D"_blank">https://pypi.python.org/pypi/<wbr>pyiface=
/</a>&quot;<br>
+LICENSE =3D &quot;GPLv3+&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D<wbr>4fe869ee987a34019=
8fb0d54c55c47<wbr>f1&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>8ced1d8ef89376a5aed97a59f11ae6<wbr>83&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>bf5b1ff115344d388b0f9409a440ee<wbr>06f67=
478b6c63bc8d8ce8f843f2652<wbr>a8d3&quot;<br>
+<br>
+inherit pypi setuptools<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.16.2<br>
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

--001a11405f163906740566719808--

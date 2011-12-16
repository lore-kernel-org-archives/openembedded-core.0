Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RbSRc-0003C8-AZ
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 08:43:04 +0100
Received: by lami14 with SMTP id i14so1357201lam.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 23:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=yOpJDQWizHatuV5fdgwzPCGVy57HSVXIXGTxw8aENks=;
	b=cZy700ukC29uZIhGSRkUmNFrIjgT2+oHqw8D7A2dF/Ca5cvH1OBqlPbBR/DFgOKjJu
	1Z4FC+qPXzfQgxT8rFK6CZzdg/WPLgfZCCZ+vBE1gjqK7a/utb4MM7mIHkc2svmzrlp4
	XrAsWFkqnFUlU6r3wJJiJwpq5NrTsX4b1MkRM=
MIME-Version: 1.0
Received: by 10.152.104.103 with SMTP id gd7mr6536898lab.34.1324020965389;
	Thu, 15 Dec 2011 23:36:05 -0800 (PST)
Received: by 10.152.24.36 with HTTP; Thu, 15 Dec 2011 23:36:05 -0800 (PST)
In-Reply-To: <eec8014c76be16e9a58c34f5a448231a74abd445.1323991540.git.josh@linux.intel.com>
References: <cover.1323991540.git.josh@linux.intel.com>
	<eec8014c76be16e9a58c34f5a448231a74abd445.1323991540.git.josh@linux.intel.com>
Date: Thu, 15 Dec 2011 23:36:05 -0800
Message-ID: <CAMKF1soSb-Gh+UD-aZe31cGm=+nQY2SXk-GfRwW3Er35N0z7yQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/10] udev: fix LICENSE fields to be SPDX compliant
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Dec 2011 07:43:04 -0000
Content-Type: multipart/alternative; boundary=f46d04088e8551338e04b430a759

--f46d04088e8551338e04b430a759
Content-Type: text/plain; charset=UTF-8

On Thursday, December 15, 2011, Joshua Lock <josh@linux.intel.com> wrote:
> Additionally I'm not sure where the LGPL license came from, the COPYING
> file and Fedora both say GPL v2 or later so drop the LGPL entry for now.
>
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
>  meta/recipes-core/udev/udev-new.inc |    2 +-
>  meta/recipes-core/udev/udev.inc     |    4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/udev/udev-new.inc
b/meta/recipes-core/udev/udev-new.inc
> index eac7903..769d54a 100644
> --- a/meta/recipes-core/udev/udev-new.inc
> +++ b/meta/recipes-core/udev/udev-new.inc
> @@ -2,7 +2,7 @@ SUMMARY = "/dev/ and hotplug management daemon"
>  DESCRIPTION = "udev is a daemon which dynamically creates and removes
device nodes from \
>  /dev/, handles hotplug events and loads drivers at boot time."
>  HOMEPAGE = "
http://www.kernel.org/pub/linux/utils/kernel/hotplug/udev.html"
> -LICENSE = "GPLv2+ & LGPLv2.1+"
> +LICENSE = "GPL-2.0+"
>  LICENSE_${PN} = "GPLv2+

Why two notations for Gpl v2 above


>  LICENSE_libudev = "LGPLv2.1+"
>  LICENSE_libgudev = "LGPLv2.1+"
> diff --git a/meta/recipes-core/udev/udev.inc
b/meta/recipes-core/udev/udev.inc
> index d731816..2e501fa 100644
> --- a/meta/recipes-core/udev/udev.inc
> +++ b/meta/recipes-core/udev/udev.inc
> @@ -1,7 +1,7 @@
>  SUMMARY = "/dev/ and hotplug management daemon"
>  DESCRIPTION = "udev is a program which dynamically creates and removes
device nodes from \
>  /dev/. It responds to /sbin/hotplug device events and requires a 2.6
kernel."
> -LICENSE = "GPL"
> +LICENSE = "GPL-2.0+"
>
>  SRC_URI += " \
>           file://udev.rules \
> @@ -11,7 +11,7 @@ SRC_URI += " \
>           file://mount.sh \
>           file://network.sh \
>           file://local.rules \
> -       file://udev-cache \
> +           file://udev-cache \
>            file://init"
>
>  UDEV_DEVFS_RULES ?= "0"
> --
> 1.7.7.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--f46d04088e8551338e04b430a759
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Thursday, December 15, 2011, Joshua Lock &lt;<a href=3D"mailto:j=
osh@linux.intel.com">josh@linux.intel.com</a>&gt; wrote:<br>&gt; Additional=
ly I&#39;m not sure where the LGPL license came from, the COPYING<br>&gt; f=
ile and Fedora both say GPL v2 or later so drop the LGPL entry for now.<br>
&gt;<br>&gt; Signed-off-by: Joshua Lock &lt;<a href=3D"mailto:josh@linux.in=
tel.com">josh@linux.intel.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0meta/recipe=
s-core/udev/udev-new.inc | =C2=A0 =C2=A02 +-<br>&gt; =C2=A0meta/recipes-cor=
e/udev/udev.inc =C2=A0 =C2=A0 | =C2=A0 =C2=A04 ++--<br>
&gt; =C2=A02 files changed, 3 insertions(+), 3 deletions(-)<br>&gt;<br>&gt;=
 diff --git a/meta/recipes-core/udev/udev-new.inc b/meta/recipes-core/udev/=
udev-new.inc<br>&gt; index eac7903..769d54a 100644<br>&gt; --- a/meta/recip=
es-core/udev/udev-new.inc<br>
&gt; +++ b/meta/recipes-core/udev/udev-new.inc<br>&gt; @@ -2,7 +2,7 @@ SUMM=
ARY =3D &quot;/dev/ and hotplug management daemon&quot;<br>&gt; =C2=A0DESCR=
IPTION =3D &quot;udev is a daemon which dynamically creates and removes dev=
ice nodes from \<br>
&gt; =C2=A0/dev/, handles hotplug events and loads drivers at boot time.&qu=
ot;<br>&gt; =C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.kernel.org/pub/l=
inux/utils/kernel/hotplug/udev.html">http://www.kernel.org/pub/linux/utils/=
kernel/hotplug/udev.html</a>&quot;<br>
&gt; -LICENSE =3D &quot;GPLv2+ &amp; LGPLv2.1+&quot;<br>&gt; +LICENSE =3D &=
quot;GPL-2.0+&quot;<br>&gt; =C2=A0LICENSE_${PN} =3D &quot;GPLv2+<br><br>Why=
 two notations for Gpl v2 above <br><br><br>&gt; =C2=A0LICENSE_libudev =3D =
&quot;LGPLv2.1+&quot;<br>
&gt; =C2=A0LICENSE_libgudev =3D &quot;LGPLv2.1+&quot;<br>&gt; diff --git a/=
meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc<br>&gt; i=
ndex d731816..2e501fa 100644<br>&gt; --- a/meta/recipes-core/udev/udev.inc<=
br>
&gt; +++ b/meta/recipes-core/udev/udev.inc<br>&gt; @@ -1,7 +1,7 @@<br>&gt; =
=C2=A0SUMMARY =3D &quot;/dev/ and hotplug management daemon&quot;<br>&gt; =
=C2=A0DESCRIPTION =3D &quot;udev is a program which dynamically creates and=
 removes device nodes from \<br>
&gt; =C2=A0/dev/. It responds to /sbin/hotplug device events and requires a=
 2.6 kernel.&quot;<br>&gt; -LICENSE =3D &quot;GPL&quot;<br>&gt; +LICENSE =
=3D &quot;GPL-2.0+&quot;<br>&gt;<br>&gt; =C2=A0SRC_URI +=3D &quot; \<br>&gt=
; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://udev.rules \<br>
&gt; @@ -11,7 +11,7 @@ SRC_URI +=3D &quot; \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 file://mount.sh \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
file://network.sh \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://local=
.rules \<br>&gt; - =C2=A0 =C2=A0 =C2=A0 file://udev-cache \<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://udev-cache \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://init&quot;<br>&gt;<br>=
&gt; =C2=A0UDEV_DEVFS_RULES ?=3D &quot;0&quot;<br>&gt; --<br>&gt; 1.7.7.4<b=
r>&gt;<br>&gt;<br>&gt; _______________________________________________<br>&=
gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>&gt; <a href=3D"http://lists.linuxtog=
o.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.or=
g/cgi-bin/mailman/listinfo/openembedded-core</a><br>
&gt;

--f46d04088e8551338e04b430a759--

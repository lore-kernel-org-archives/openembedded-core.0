Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SwxSa-0003hh-Hp
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 17:37:12 +0200
Received: by yenl13 with SMTP id l13so8011964yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 08:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=5gFPfQGD/IiIzWI3ZkdwOYPDQxGQWKJ32iPFkRHafLE=;
	b=GRcYzSjuz6mu2UZYyQqG6qwsupN9bcuKcognNERGaco/jSIE9VhEFJtWszSAY+wUxM
	4lXTO3P+HJ8IayCc1obWJMXgd4Z39W2MFG36c4b/2dlXI1QitfI9tZDNDNzdR/HIoAXc
	pyhPs5dFY+e7K6k4S4+Tv8LzSr3PWW72zqj0xF78M3vIE8PjWUMFcRGT/S0CuOz14HwA
	entP5FCVixlotX7ilA+2UOrI4yBFUa3ha+v07hFSL1MTf/WSm64nS34yt6AY9FCLrRz5
	jOTw3jUpRpF2qy/L3DKiXWkyW+nSAveMhwkKC+IHZqpVVV/P9GHOOhE7/h3Rm4EOgx5N
	4Ivw==
Received: by 10.50.40.193 with SMTP id z1mr4509396igk.0.1343921132011; Thu, 02
	Aug 2012 08:25:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.139.164 with HTTP; Thu, 2 Aug 2012 08:25:11 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <1343909173-2161-1-git-send-email-radu.moisan@intel.com>
References: <1343909173-2161-1-git-send-email-radu.moisan@intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 2 Aug 2012 18:25:11 +0300
Message-ID: <CAK18fxFW89ficqdXn-H2VOPApOUhaXH0yNOkK4xb3J1HtxfLnA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkLwPlpQx40tQkrTNSYKn3fbwGKUc45BIh6ah/zhERjjQlPnvmTV9hZeZ64QRKmIVOl+LNZ
Subject: Re: [PATCH v2] usbutils: Upgrade usbutils to upstream v006
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
X-List-Received-Date: Thu, 02 Aug 2012 15:37:12 -0000
Content-Type: multipart/alternative; boundary=14dae9340c41ae007904c64a05b2

--14dae9340c41ae007904c64a05b2
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 2, 2012 at 3:06 PM, Radu Moisan <radu.moisan@intel.com> wrote:

> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>  .../usbutils/{usbutils_0.91.bb => usbutils_006.bb} |    7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>  rename meta/recipes-bsp/usbutils/{usbutils_0.91.bb => usbutils_006.bb}
> (80%)
>
> diff --git a/meta/recipes-bsp/usbutils/usbutils_0.91.bbb/meta/recipes-bsp/usbutils/
> usbutils_006.bb
> similarity index 80%
> rename from meta/recipes-bsp/usbutils/usbutils_0.91.bb
> rename to meta/recipes-bsp/usbutils/usbutils_006.bb
> index abe807c..c1c9fc0 100644
> --- a/meta/recipes-bsp/usbutils/usbutils_0.91.bb
> +++ b/meta/recipes-bsp/usbutils/usbutils_006.bb
> @@ -7,19 +7,18 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>
>  DEPENDS = "libusb zlib"
> -PR = "r5"
> +PR = "r0"
>
>  SRC_URI =
> "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
>             file://usb-devices-avoid-dependency-on-bash.patch \
>             file://Fix-NULL-pointer-crash.patch"
>
> -SRC_URI[md5sum] = "49de2403b40bf3a9863faaa8d3858deb"
> -SRC_URI[sha256sum] =
> "c122346b0225121bcf159abf804116f826a4a3462c94ce7b8871f7559e6b3a46"
> +SRC_URI[md5sum] = "850790442f5eb487cdc7e35f8ee03e11"
> +SRC_URI[sha256sum] =
> "553270b4030f0844cb70aed57e61c7f10a7ed6641c3bed20249201cec9bcf122"
>
>  inherit autotools
>
>  do_install_append() {
> -       ln -s ../sbin/lsusb ${D}${bindir}/lsusb


This is not needed anymore?

ag

--14dae9340c41ae007904c64a05b2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Aug 2, 2012 at 3:06 PM, Radu Moisan <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:radu.moisan@intel.com" target=3D"_blank=
">radu.moisan@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">

Signed-off-by: Radu Moisan &lt;<a href=3D"mailto:radu.moisan@intel.com">rad=
u.moisan@intel.com</a>&gt;<br>
---<br>
=A0.../usbutils/{<a href=3D"http://usbutils_0.91.bb" target=3D"_blank">usbu=
tils_0.91.bb</a> =3D&gt; <a href=3D"http://usbutils_006.bb" target=3D"_blan=
k">usbutils_006.bb</a>} | =A0 =A07 +++----<br>
=A01 file changed, 3 insertions(+), 4 deletions(-)<br>
=A0rename meta/recipes-bsp/usbutils/{<a href=3D"http://usbutils_0.91.bb" ta=
rget=3D"_blank">usbutils_0.91.bb</a> =3D&gt; <a href=3D"http://usbutils_006=
.bb" target=3D"_blank">usbutils_006.bb</a>} (80%)<br>
<br>
diff --git a/meta/recipes-bsp/usbutils/<a href=3D"http://usbutils_0.91.bb" =
target=3D"_blank">usbutils_0.91.bb</a> b/meta/recipes-bsp/usbutils/<a href=
=3D"http://usbutils_006.bb" target=3D"_blank">usbutils_006.bb</a><br>
similarity index 80%<br>
rename from meta/recipes-bsp/usbutils/<a href=3D"http://usbutils_0.91.bb" t=
arget=3D"_blank">usbutils_0.91.bb</a><br>
rename to meta/recipes-bsp/usbutils/<a href=3D"http://usbutils_006.bb" targ=
et=3D"_blank">usbutils_006.bb</a><br>
index abe807c..c1c9fc0 100644<br>
--- a/meta/recipes-bsp/usbutils/<a href=3D"http://usbutils_0.91.bb" target=
=3D"_blank">usbutils_0.91.bb</a><br>
+++ b/meta/recipes-bsp/usbutils/<a href=3D"http://usbutils_006.bb" target=
=3D"_blank">usbutils_006.bb</a><br>
@@ -7,19 +7,18 @@ LICENSE =3D &quot;GPLv2+&quot;<br>
=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D94d55d512a9ba36caa9b7df0=
79bae19f&quot;<br>
<br>
=A0DEPENDS =3D &quot;libusb zlib&quot;<br>
-PR =3D &quot;r5&quot;<br>
+PR =3D &quot;r0&quot;<br>
<br>
=A0SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-=
${PV}.tar.gz \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://usb-devices-avoid-dependency-on-bash.patch \=
<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://Fix-NULL-pointer-crash.patch&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;49de2403b40bf3a9863faaa8d3858deb&quot;<br>
-SRC_URI[sha256sum] =3D &quot;c122346b0225121bcf159abf804116f826a4a3462c94c=
e7b8871f7559e6b3a46&quot;<br>
+SRC_URI[md5sum] =3D &quot;850790442f5eb487cdc7e35f8ee03e11&quot;<br>
+SRC_URI[sha256sum] =3D &quot;553270b4030f0844cb70aed57e61c7f10a7ed6641c3be=
d20249201cec9bcf122&quot;<br>
<br>
=A0inherit autotools<br>
<br>
=A0do_install_append() {<br>
- =A0 =A0 =A0 ln -s ../sbin/lsusb ${D}${bindir}/lsusb</blockquote><div><br>=
</div><div>This is not needed anymore?=A0</div><div><br></div><div>ag</div>=
</div>

--14dae9340c41ae007904c64a05b2--

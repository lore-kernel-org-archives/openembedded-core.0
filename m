Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TT8oo-00046A-Uu
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 11:13:12 +0100
Received: by mail-vc0-f175.google.com with SMTP id p1so66619vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 02:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=orbWwBXJ9ZbBhATSyh+MpXn+w5NhgDWk6xli0Ob5wAM=;
	b=Sy4PYN/azwalF+zYHW9eFzHLr8XSOaYzRsyWemNAomXe0Vpp1xQZJMC48A2r3ujck7
	PPhw0nMm57r8Dyw7plFiYnPVayq27jgtLhRCv9+VX8bI/8ItiVmgCJ7LorY0P1sbyG5P
	CeTI/yWBm3xwXgVmnV/BE3GB6c2ZyuH3VDY6Rwwwu32NygLaxVwjDLgfW0396kVwXfzl
	TrIXXHkIM5cymGuwgEKl1ypfyVANPWPPofSKBBp6/WFSC+pncM0gdQN2JuIMund4rfqr
	RkybJzZrj3ghnFfGCB8/n0iQUAO/LylUaR4Bn1UG5DapgOc6CdZofq3dkPUMPbe80/tK
	Fzpg==
Received: by 10.220.154.68 with SMTP id n4mr12755721vcw.22.1351591175351; Tue,
	30 Oct 2012 02:59:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.59.0.10 with HTTP; Tue, 30 Oct 2012 02:59:15 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <1351096656-32438-1-git-send-email-ross.burton@intel.com>
References: <1351096656-32438-1-git-send-email-ross.burton@intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 30 Oct 2012 11:59:15 +0200
Message-ID: <CAK18fxFzwdCszev=Ss+rMdytAqUgDcnA4e9HEC4_psz2SAJbxw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmx+GQT2O8kq3iPL0hfwz9rpvk6jX4n9wleIKnBvQ0vvzPU1CaQg979fauN5PuLwdohqkfx
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] pulseaudio: add GConf dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Oct 2012 10:13:12 -0000
Content-Type: multipart/alternative; boundary=f46d043be0bee36d2804cd43d78a

--f46d043be0bee36d2804cd43d78a
Content-Type: text/plain; charset=ISO-8859-1

This commit made pulseaudio unbuildable for builds with no GPLv3 packages.

Andrei


On Wed, Oct 24, 2012 at 7:37 PM, Ross Burton <ross.burton@intel.com> wrote:

> Add explicit build-dependency on GConf as currently it's an implicit
> dependency
> and so vunerable to races at build time.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc    |    2 +-
>  meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index 463777d..ab70c7e 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =
> "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
>  DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool
> \
>             ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11
> libxtst libice libsm libxcb gtk+', '', d)}"
>  # optional
> -DEPENDS += "udev alsa-lib glib-2.0 dbus \
> +DEPENDS += "udev alsa-lib glib-2.0 dbus gconf \
>             ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '',
> d)}"
>
>  SRC_URI = "
> http://0pointer.de/lennart/projects/pulseaudio/pulseaudio-${PV}.tar.gz \
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bbb/meta/recipes-multimedia/pulseaudio/
> pulseaudio_2.1.bb
> index a10b953..d25b424 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
> @@ -1,6 +1,6 @@
>  require pulseaudio.inc
>
> -PR = "r7"
> +PR = "r8"
>
>  DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
>
> --
> 1.7.10
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--f46d043be0bee36d2804cd43d78a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

This commit made pulseaudio unbuildable for builds with no GPLv3 packages.=
=A0<br><br>Andrei<br>
<br><br><div class=3D"gmail_quote">On Wed, Oct 24, 2012 at 7:37 PM, Ross Bu=
rton <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">

Add explicit build-dependency on GConf as currently it&#39;s an implicit de=
pendency<br>
and so vunerable to races at build time.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=A0meta/recipes-multimedia/pulseaudio/pulseaudio.inc =A0 =A0| =A0 =A02 +-<b=
r>
=A0meta/recipes-multimedia/pulseaudio/<a href=3D"http://pulseaudio_2.1.bb" =
target=3D"_blank">pulseaudio_2.1.bb</a> | =A0 =A02 +-<br>
=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recip=
es-multimedia/pulseaudio/pulseaudio.inc<br>
index 463777d..ab70c7e 100644<br>
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc<br>
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc<br>
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D &quot;file://GPL;md5=3D4325afd396feb=
cb659c36b49533135d4 \<br>
=A0DEPENDS =3D &quot;libatomics-ops liboil avahi libsamplerate0 libsndfile1=
 libtool \<br>
=A0 =A0 =A0 =A0 =A0 =A0 ${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;x1=
1&#39;, &#39;virtual/libx11 libxtst libice libsm libxcb gtk+&#39;, &#39;&#3=
9;, d)}&quot;<br>
=A0# optional<br>
-DEPENDS +=3D &quot;udev alsa-lib glib-2.0 dbus \<br>
+DEPENDS +=3D &quot;udev alsa-lib glib-2.0 dbus gconf \<br>
=A0 =A0 =A0 =A0 =A0 =A0 ${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;bl=
uetooth&#39;, &#39;bluez4&#39;, &#39;&#39;, d)}&quot;<br>
<br>
=A0SRC_URI =3D &quot;<a href=3D"http://0pointer.de/lennart/projects/pulseau=
dio/pulseaudio-${PV}.tar.gz" target=3D"_blank">http://0pointer.de/lennart/p=
rojects/pulseaudio/pulseaudio-${PV}.tar.gz</a> \<br>
diff --git a/meta/recipes-multimedia/pulseaudio/<a href=3D"http://pulseaudi=
o_2.1.bb" target=3D"_blank">pulseaudio_2.1.bb</a> b/meta/recipes-multimedia=
/pulseaudio/<a href=3D"http://pulseaudio_2.1.bb" target=3D"_blank">pulseaud=
io_2.1.bb</a><br>


index a10b953..d25b424 100644<br>
--- a/meta/recipes-multimedia/pulseaudio/<a href=3D"http://pulseaudio_2.1.b=
b" target=3D"_blank">pulseaudio_2.1.bb</a><br>
+++ b/meta/recipes-multimedia/pulseaudio/<a href=3D"http://pulseaudio_2.1.b=
b" target=3D"_blank">pulseaudio_2.1.bb</a><br>
@@ -1,6 +1,6 @@<br>
=A0require pulseaudio.inc<br>
<br>
-PR =3D &quot;r7&quot;<br>
+PR =3D &quot;r8&quot;<br>
<br>
=A0DEPENDS +=3D &quot;libjson gdbm speex libxml-parser-perl-native&quot;<br=
>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.7.10<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br>

--f46d043be0bee36d2804cd43d78a--

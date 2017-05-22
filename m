Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id B1C79779C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 14:46:18 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id j13so18397666qta.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 07:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=taJ6qn1qySKxF/xDrRAZJsy4agF3o6aJSzGE7PTd+fM=;
	b=oJHBOgHluC3N/Z74DlhR9CyEUwle+23mMLQRV8Akf35Cm1NbWMVTWKuwi3JUQzDVJ/
	czTwAYIJxFEzbRs9c5Lss2qVcQ5ksst4JA/hqgJ1iJSrobCPPl18DAI1mdT8pB+ZVaFV
	S6IcNTpjs6NCBKVRf1uyYjhKZcteSPJGJZGQMO5pF+QliAonnbWh/TqPxJ2F7CN0guhM
	5+XEXVbeYCmqsMqCZWLh+QtQyUTKZbDbT0EeLwOQfWQFDPJqXA5CovJtddQvw7FPlMiR
	PT3Ql8Y41gnVvWLLgdjiSBUrHUB8094Bl+GzFoi/Pn+OegcmZ9/y5wklIhpRTgqywyF/
	hkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=taJ6qn1qySKxF/xDrRAZJsy4agF3o6aJSzGE7PTd+fM=;
	b=ok5H9cEqfbFcoCF7ikJ+WMChqwRppmYpsas+j/+yrgCRDs2CI1ON7ySGkr6kWTfprC
	rI5sJnZkXsyK/BPEHeVYvevNakGdw1tjmZfQKRErWW5Fzy5Z0IlYjVD1N7xO2sClPUzS
	Ko3+8xOvBaFPCSIY8I/Esy7Whmf7qeZirr1xmj9iDKWwOqLoigqG5t0khlj1qIOVmpb8
	powf/J5Wl9LXSUUqhw80E5WIC5vzY9XIQgL2q65JPDZyQs+hA+5ilAz5cDGnDCjJfY8S
	36DY9kILpx5J+dzIkwp88lGd/wXT4cWAndLNwUGnNnEFlJ1u2Ycp9S7ZfZ/3I7lH+nzj
	WuqA==
X-Gm-Message-State: AODbwcDpKrJ7QNcCYq/R4ywkS7lJt1BAIPrmJn/1XRkxISei83qQ6qdM
	6hoSNSEd9JBn+QyFSOSilXszvAP/GQ==
X-Received: by 10.237.34.58 with SMTP id n55mr21481575qtc.117.1495464379469;
	Mon, 22 May 2017 07:46:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.182.109 with HTTP; Mon, 22 May 2017 07:46:19 -0700 (PDT)
In-Reply-To: <20170522050042.42403-11-raj.khem@gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
	<20170522050042.42403-11-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 22 May 2017 10:46:19 -0400
Message-ID: <CADkTA4M-3HipxJL7GnE9FJkK1hKJQ9EOjJpvUpyom8WNgbcGnw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/15] linux-yocto: Enable drm by default
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
X-List-Received-Date: Mon, 22 May 2017 14:46:19 -0000
Content-Type: multipart/alternative; boundary="001a113e36941cd66905501defa7"

--001a113e36941cd66905501defa7
Content-Type: text/plain; charset="UTF-8"

On Mon, May 22, 2017 at 1:00 AM, Khem Raj <raj.khem@gmail.com> wrote:

> Helps in running XFCE on virtualbox with HD
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto/drm.cfg | 10 ++++++++++
>  meta/recipes-kernel/linux/linux-yocto_4.9.bb  |  2 ++
>  2 files changed, 12 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto/drm.cfg
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto/drm.cfg
> b/meta/recipes-kernel/linux/linux-yocto/drm.cfg
> new file mode 100644
> index 0000000000..5c694ccc57
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto/drm.cfg
> @@ -0,0 +1,10 @@
> +CONFIG_DRM=y
> +CONFIG_DRM_TTM=y
> +CONFIG_DRM_VMWGFX=y
> +CONFIG_DRM_VMWGFX_FBCON=y
> +CONFIG_FB=y
> +CONFIG_FB_CFB_FILLRECT=y
> +CONFIG_FB_CFB_COPYAREA=y
> +CONFIG_FB_CFB_IMAGEBLIT=y
> +CONFIG_FB_DEFERRED_IO=y
> +CONFIG_FB_MODE_HELPERS=y
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
> b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
> index 309d4a7a4f..011ba3bbe6 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
> @@ -26,6 +26,8 @@ SRC_URI = "git://git.yoctoproject.org/
> linux-yocto-4.9.git;name=machine;branch=${
>
>  LINUX_VERSION ?= "4.9.27"
>
> +SRC_URI += "file://drm.cfg"
>


If anything gets added to the default configurations, they need to go into
the kernel-cache
and then be included by the relevant kernel types there.

If you want, I can take care of switching things to that format.

Bruce


> +
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
>  KMETA = "kernel-meta"
> --
> 2.13.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113e36941cd66905501defa7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, May 22, 2017 at 1:00 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">Helps in running XFCE on v=
irtualbox with HD<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<wbr>linux-yocto/drm.cfg | 10 ++++++++++<br=
>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.9.bb" rel=
=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto_4.9.bb</a>=C2=A0 |=C2=A0=
 2 ++<br>
=C2=A02 files changed, 12 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/<wbr>linux-yocto/drm.cfg=
<br>
<br>
diff --git a/meta/recipes-kernel/linux/<wbr>linux-yocto/drm.cfg b/meta/reci=
pes-kernel/linux/<wbr>linux-yocto/drm.cfg<br>
new file mode 100644<br>
index 0000000000..5c694ccc57<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/<wbr>linux-yocto/drm.cfg<br>
@@ -0,0 +1,10 @@<br>
+CONFIG_DRM=3Dy<br>
+CONFIG_DRM_TTM=3Dy<br>
+CONFIG_DRM_VMWGFX=3Dy<br>
+CONFIG_DRM_VMWGFX_FBCON=3Dy<br>
+CONFIG_FB=3Dy<br>
+CONFIG_FB_CFB_FILLRECT=3Dy<br>
+CONFIG_FB_CFB_COPYAREA=3Dy<br>
+CONFIG_FB_CFB_IMAGEBLIT=3Dy<br>
+CONFIG_FB_DEFERRED_IO=3Dy<br>
+CONFIG_FB_MODE_HELPERS=3Dy<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.9.bb=
" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.9.bb</a> b/meta/r=
ecipes-kernel/linux/<a href=3D"http://linux-yocto_4.9.bb" rel=3D"noreferrer=
" target=3D"_blank">li<wbr>nux-yocto_4.9.bb</a><br>
index 309d4a7a4f..011ba3bbe6 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.9.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.9.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.9.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.9.bb</a><br>
@@ -26,6 +26,8 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoprojec=
t.org/linux-yocto-4.9.git;name=3Dmachine;branch=3D${" rel=3D"noreferrer" ta=
rget=3D"_blank">git.yoctoproject.org/<wbr>linux-yocto-4.9.git;name=3D<wbr>m=
achine;branch=3D${</a><br>
<br>
=C2=A0LINUX_VERSION ?=3D &quot;4.9.27&quot;<br>
<br>
+SRC_URI +=3D &quot;file://drm.cfg&quot;<br></blockquote><div><br></div><di=
v><br></div><div>If anything gets added to the default configurations, they=
 need to go into the kernel-cache</div><div>and then be included by the rel=
evant kernel types there.</div><div><br></div><div>If you want, I can take =
care of switching things to that format.</div><div><br></div><div>Bruce</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
+<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.13.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--001a113e36941cd66905501defa7--

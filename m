Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RRU2w-0004Ga-Hq
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 20:24:22 +0100
Received: by faat2 with SMTP id t2so4841766faa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 11:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=YMzldtiPpKEGkcqbQSS2iLW3zxA7DeZ3BpM+5vgIwws=;
	b=uZA0W425O/emAbpEpTYVEegRbv1hs30m17eZmYn7GIbnvJDB0/qtnF3CQbg8tEFq0N
	VszrQC/3BdCBZ3qHrnLuDMJwK717k0WE0Z7PbkFiPWUXLsdR9MqB97vnUD7FL7hahzAe
	gICJmbbaxJ4fkN0fUWjLXRm+NA7MtISd3sAHI=
Received: by 10.152.102.148 with SMTP id fo20mr2789942lab.51.1321643876055;
	Fri, 18 Nov 2011 11:17:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Fri, 18 Nov 2011 11:17:25 -0800 (PST)
In-Reply-To: <8b14562502b9ccb4f72807a051e5b195ca31a25c.1321634793.git.tom.zanussi@intel.com>
References: <cover.1321634793.git.tom.zanussi@intel.com>
	<8b14562502b9ccb4f72807a051e5b195ca31a25c.1321634793.git.tom.zanussi@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Nov 2011 11:17:25 -0800
Message-ID: <CAMKF1sobZc0XAprRePk9jAswGVxzpO-i9Z+4HpOOrKbgfUZDmw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ia32-base.inc: new include file
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
X-List-Received-Date: Fri, 18 Nov 2011 19:24:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2011 at 8:59 AM,  <tom.zanussi@intel.com> wrote:
> From: Tom Zanussi <tom.zanussi@intel.com>
>
> The meta-intel BSPs currently have a number of machine settings common
> to all - factor these out into a common include file.
>
> Also add several new intel-specific XSERVER variables for building
> XSERVER variables in BSPs.
>

I think it belongs to bsp layer why do we need it in oe-core ?

> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> ---
> =C2=A0meta/conf/machine/include/ia32-base.inc | =C2=A0 58 +++++++++++++++=
++++++++++++++++
> =C2=A01 files changed, 58 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 meta/conf/machine/include/ia32-base.inc
>
> diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/=
include/ia32-base.inc
> new file mode 100644
> index 0000000..5cf2f4f
> --- /dev/null
> +++ b/meta/conf/machine/include/ia32-base.inc
> @@ -0,0 +1,58 @@
> +#
> +# base machine settings for ia32-architecture BSPs
> +#
> +
> +#
> +# common settings for Intel-based machines
> +#
> +MACHINE_FEATURES +=3D "kernel26 screen keyboard pci usbhost ext2 ext3 x8=
6 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a=
cpi serial usbgadget"
> +
> +MACHINE_EXTRA_RRECOMMENDS +=3D "kernel-modules eee-acpi-scripts"
> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "grub"
> +
> +IMAGE_FSTYPES +=3D "ext3 cpio.gz live"
> +
> +KERNEL_IMAGETYPE ?=3D "bzImage"
> +
> +SERIAL_CONSOLE ?=3D "115200 ttyS0"
> +
> +#
> +# glibc-related variables
> +#
> +GLIBC_ADDONS ?=3D "nptl"
> +GLIBC_EXTRA_OECONF +=3D "--with-tls"
> +
> +#
> +# kernel-related variables
> +#
> +PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
> +PREFERRED_VERSION_linux-yocto ?=3D "3.0%"
> +PREFERRED_PROVIDER_linux-libc-headers ?=3D "linux-libc-headers-yocto"
> +
> +#
> +# XSERVER subcomponents, used to build the XSERVER variable
> +#
> +XSERVER_IA32_BASE =3D "xserver-xorg \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-input-mouse \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-input-keyboard \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-input-evdev \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-input-synaptics \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mesa-dri \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> +
> +XSERVER_IA32_EXT =3D "xserver-xorg-extension-dri \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xserver-xorg-extension-dri2 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xserver-xorg-extension-glx \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xserver-xorg-extension-extmod \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xserver-xorg-extension-dbe \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xserver-xorg-module-libint10 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> +
> +XSERVER_IA32_I915 =3D "xf86-video-intel \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mesa-dri-driver-i965 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> +
> +XSERVER_IA32_EMGD =3D "emgd-driver-bin"
> +
> +XSERVER_IA32_VESA =3D "xf86-video-vesa"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



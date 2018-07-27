Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 882CE78CCF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:58:31 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id b5-v6so2800877qkg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 01:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=s4Pv/ISP3YuW9lf7M3klrPgySVFkNJHuZm45ajfiwTo=;
	b=uXA5NpBc7vBz6vNxqjRa1BLFFHir4EGzK5300hzmTwE5A2lYw4oKym3lftIpT5vEjz
	4QHANMgkId5E10Qk3NiTdYovrEtFyFyjUrZkaAu2QqTnPprj43yAkSWFX9FEkxfVAINh
	41puC92xw1btWvPN1vT+Dflkz3uF37CO748FQHGDVwH4wZ3sNWxMSqXRHscKVQW6C7Bc
	a8VfPfDLqLFDwH1VLLPe40mbxW48WTE6czQlpIlQ7ja2+t7CoflLpuuThZ4jCH2Dqr9L
	Lan3mSrMSLEb7NeRxF3gVcr5yEgKBIyLrLWyTeez1UDH94CS2GQwKjfYPrxE5K91rGJq
	1XcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=s4Pv/ISP3YuW9lf7M3klrPgySVFkNJHuZm45ajfiwTo=;
	b=BIdY+x+PhWoHemyDkmufYrFfZeAK2F0PbIaLELxNKx9EcX65e2Pq3Rj51aNwVxTq33
	XHRhYmGPZFD5ClHXdLxwmVYDL6acqtgeML3U/r0FIkKy5/6y3GSsZIbDCA/E3/WEQ5UQ
	X2rCoo4pm+f6yVPXYLRhmgfwVRs8FszCqbruPMBuSqbjKVXbRGBoAvYMW5JGUQKzN43D
	uilJPQR10bcBIhRA+5WMqo0rDSzFzBHVvtMxEW5mMMQqZidWofz7R4YCVh7hy2EJbEtk
	unhKOQokJA9haRhcAQ6CM4XPC5sJ5ix9X/soYddQFPEemurJqMrMtBI1yxtmKoHicDhA
	X5Rg==
X-Gm-Message-State: AOUpUlF9zfovYJRg9fOYXpZm6yFFpp40W3KUPTBlDLS2pVavVbEZtl+R
	NRV3oyp/zLJ0xpIPUFlVj6Brk+E+NeUt4KHDnTM=
X-Google-Smtp-Source: AAOMgpfQENLWLqC7lA8DHQQCiX3NJFgsTC02CIPgBfJNUSDUzfhZsn+Bya2o0mOkQ0Ru6r2QEgG5ZfSwjBLEAf9hb90=
X-Received: by 2002:a37:4a94:: with SMTP id
	x142-v6mr4924775qka.110.1532681912300; 
	Fri, 27 Jul 2018 01:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <1532649082-32531-1-git-send-email-christopher.w.clark@gmail.com>
In-Reply-To: <1532649082-32531-1-git-send-email-christopher.w.clark@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Jul 2018 01:58:06 -0700
Message-ID: <CAMKF1spD+uQEUO-p6=1yxAmE=sTtTcbeqWN8L6gj+Z4+zWq56w@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] binutils : enable x86_64-pep for producing EFI binaries on x86/x86-64
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
X-List-Received-Date: Fri, 27 Jul 2018 08:58:31 -0000
Content-Type: text/plain; charset="UTF-8"

LGTM
On Thu, Jul 26, 2018 at 4:51 PM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> On x86 and x86_64 architectures, add the x86_64-pep emulation support
> to the linker to enable production of Portable Executables for EFI
> binaries.
>
> Enables building the x86-64 EFI variant of the Xen hypervisor.
>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
> Changes in v3:
>
> * Use overrides rather than a function to add the configure flags.
>
> I've used a construction that should allow other layers to override a
> single variable to provide different extra targets if needed.
>
> * Only make this change for x86 and x86-64.
>
> The linker flag for x86-64 EFI binaries is known: x86_64-pep.
> Make this available on both x86-64 and x86, so multiarch is covered.
>
> The linker flag for constructing 32-bit x86 EFI binaries is not known by me,
> and is not easily discoverable via inspecting the binutils source or
> queries of the internet. 32-bit x86 UEFI appears to be very uncommon.
>
> * No change for the ARM architectures in this patch.
>
> I have no data on what linker flags are required for EFI on ARM,
> and again I'm drawing a blank via source inspection and internet
> query. If additional lines for arm and aarch64 are added later,
> they will fit well with the structure added by this patch.
>
> The ARM64 build of the Xen hypervisor does not need additional toolchain
> support for construction an EFI image as its PE/COFF header is coded in
> assembly.
>
> * Using gmail 'From'/'Author' address as it is preferred for contact.
>   S-o-b address as provided is required for attribution. Unchanged from v2.
>
>  meta/recipes-devtools/binutils/binutils.inc | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
> index 37813dd..9f06d94 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -74,12 +74,17 @@ EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
>                  --enable-deterministic-archives \
>                  --enable-plugins \
>                  ${LDGOLD} \
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
> +                ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
> +                ${ENABLE_EXTRA_TARGETS}"
>
>  LDGOLD_class-native = ""
>  LDGOLD_class-crosssdk = ""
>  LDGOLD ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default --enable-threads', '--enable-gold --enable-ld=default --enable-threads', d)}"
>
> +ARCH_EFI_EMULATION_x86-64 = "x86_64-pep"
> +ARCH_EFI_EMULATION_x86 = "x86_64-pep"
> +ENABLE_EXTRA_TARGETS ?= "--enable-targets=${ARCH_EFI_EMULATION}"
> +
>  # This is necessary due to a bug in the binutils Makefiles
>  # EXTRA_OEMAKE = "configure-build-libiberty all"
>
> --
> 2.7.4
>


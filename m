Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 28F6C71B50
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 15:27:41 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id 12so9400137iol.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 08:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=l9tsHJqFimmQ7EXyuFiteBKWf2qkAK+XOXbjp/CZJKQ=;
	b=kymKNB/S1xwAxV6BddwgN2s0qoiE5sXP4XuFW+2tNfa2wDq3iys2G2KyTUhMNDxoYP
	uGfJdFT9qlqHMRNoaEQVAeip+TuMhwfIAWGtR7hJPwwLKp/l/Rikok6pW+BT+rIkbwjw
	t4vXMimB16eLEkQGYFnuHF9Pjz5hcHUHylO4GBd3Tvw6ElPncGHxFtiYCGoCr8xUWXx0
	bEdSAZn3TpMErOuCW1CN4vAE0zCchW0UbwOC3+zDKgA+hJNpLJMjBEeopRfHrz0/bU8K
	5xPT0pGsFP53qso+BlkqD/wZCoEfQdiaLwBVMQtRjmC4OHCTYAMpF14K3LZzouq4Ggcr
	flAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=l9tsHJqFimmQ7EXyuFiteBKWf2qkAK+XOXbjp/CZJKQ=;
	b=iolM81W34Egc7fiaHO2dLXZ5HdeJIstWfaygNLGU8ahLqqMCfJ8+7IrvwXmu05+9Dg
	H4MsuyQx8E04hRz0wyxLgriGoWLRnwxyBlNcroF62zjAd51q7sacL7q/F7aJ8IHqNrfA
	EnTs+xQy1iH8DziGezX4F+A4qdLt1kU80vRBacJ2Gt5xLLlzb4ojteQJ7b7K69lc4tWh
	RPBgxzFMThK0dUhxqqadEgTy05wyM2rMLTkzMTEVMiS4dmdrZOH8jRxKt76gRE14d3eZ
	AlKkQFhRuyDa1kLhIbQqIlqNWyMfmt+kpFHWpjjWd/k1wYTt17SMCT9XiENnJBSN6bwk
	zQmA==
X-Gm-Message-State: AODbwcCMmZuqPMZLCDdmyJuVY2WWezRB1tnb5T2NMLaJkIzgVFdcC6Nj
	b9zDIOdC8nAN5g==
X-Received: by 10.107.17.14 with SMTP id z14mr16421108ioi.151.1496158063042;
	Tue, 30 May 2017 08:27:43 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	b62sm6043155itc.16.2017.05.30.08.27.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 May 2017 08:27:42 -0700 (PDT)
Date: Tue, 30 May 2017 11:27:39 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20170530152738.GA24515@linux-uys3>
References: <20170526212248.16374-1-twoerner@gmail.com>
	<1496100337.25229.147.camel@linuxfoundation.org>
	<CAHUNapREVWXEaWYDYon8cYByzXcAdEu=_uWMAHCbOjU6VXrghg@mail.gmail.com>
	<1496130475.25229.160.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1496130475.25229.160.camel@linuxfoundation.org>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: potentially enable texture float for gallium
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
X-List-Received-Date: Tue, 30 May 2017 15:27:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue 2017-05-30 @ 08:47:55 AM, Richard Purdie wrote:
> We should look at how Fedora "just bars float on llvmpipe and softpipe"
> and perhaps look at copying that? Not that we enable llvmpipe at the
> moment either mind so presumably we're using softpipe.

If you build for AMD's gizmo2 (meta-amd), it uses llvmpipe (although it's
doing a lot of its own stuff with mesa):

	http://git.yoctoproject.org/cgit/cgit.cgi/meta-amd/tree/common/recipes-graphics/mesa/mesa_git.bbappend?h=master


Here is the relevant part of Fedora's mesa.spec file for Fedora 25 (with line
numbers):

	 400 %configure \
	 401     %{?asm_flags} \
	 402     --enable-libglvnd \
	 403     --enable-selinux \
	 404     --enable-gallium-osmesa \
	 405     --with-dri-driverdir=%{_libdir}/dri \
	 406     --enable-egl \
	 407     --disable-gles1 \
	 408     --enable-gles2 \
	 409     --disable-xvmc \
	 410     %{?with_vdpau:--enable-vdpau} \
	 411     %{?with_vaapi:--enable-va} \
	 412     --with-egl-platforms=x11,drm,surfaceless%{?with_wayland:,wayland} \
	 413     --enable-shared-glapi \
	 414     --enable-gbm \
	 415     %{?with_omx:--enable-omx} \
	 416     %{?with_opencl:--enable-opencl --enable-opencl-icd} %{!?with_opencl:--disable-opencl} \
	 417     --enable-glx-tls \
	 418     --enable-texture-float=yes \
	 419 %if %{with_vulkan}
	 420     %{?vulkan_drivers} \
	 421 %endif
	 422     %{?with_llvm:--enable-gallium-llvm} \
	 423     %{?with_llvm:--enable-llvm-shared-libs} \
	 424     --enable-dri \
	 425 %if %{with_hardware}
	 426     %{?with_xa:--enable-xa} \
	 427     %{?with_nine:--enable-nine} \
	 428     --with-gallium-drivers=%{?with_vmware:svga,}%{?with_radeonsi:radeonsi,}%{?with_llvm:swrast,r600,}%{?with_freedreno:freedreno,}%{?with_etnaviv:etnaviv,}%{?with_vc4:vc4,}%{?with_ilo:ilo,}virgl,r300,nouveau \
	 429 %else
	 430     --with-gallium-drivers=%{?with_llvm:swrast,}virgl \
	 431 %endif
	 432     %{?dri_drivers}

--enable-texture-float (line 418) is always, unconditionally enabled. However,
mesa itself is then patched (for Fedora) so that the --enable-texture-float
configuration option doesn't have any effect on llvm and swrast. I.e. it is
easier to do this optional check in code than on the ./configure line:

	From 00bcd599310dc7fce4fe336ffd85902429051a0c Mon Sep 17 00:00:00 2001
	From: Igor Gnatenko <i.gnatenko.brain@gmail.com>
	Date: Sun, 20 Mar 2016 13:27:04 +0100
	Subject: [PATCH 2/4] hardware gloat

	Signed-off-by: Igor Gnatenko <i.gnatenko.brain@gmail.com>
	---
	 src/gallium/drivers/llvmpipe/lp_screen.c | 7 +++++++
	 src/gallium/drivers/softpipe/sp_screen.c | 7 +++++++
	 2 files changed, 14 insertions(+)

	diff --git a/src/gallium/drivers/llvmpipe/lp_screen.c b/src/gallium/drivers/llvmpipe/lp_screen.c
	index 4f61de8..3b0ec77 100644
	--- a/src/gallium/drivers/llvmpipe/lp_screen.c
	+++ b/src/gallium/drivers/llvmpipe/lp_screen.c
	@@ -411,6 +411,13 @@ llvmpipe_is_format_supported( struct pipe_screen *_screen,
	    if (!format_desc)
	       return FALSE;
	 
	+   if ((bind & PIPE_BIND_RENDER_TARGET) &&
	+       format != PIPE_FORMAT_R9G9B9E5_FLOAT &&
	+       format != PIPE_FORMAT_R11G11B10_FLOAT &&
	+       util_format_is_float(format)) {
	+      return FALSE;
	+   }
	+
	    assert(target == PIPE_BUFFER ||
		   target == PIPE_TEXTURE_1D ||
		   target == PIPE_TEXTURE_1D_ARRAY ||
	diff --git a/src/gallium/drivers/softpipe/sp_screen.c b/src/gallium/drivers/softpipe/sp_screen.c
	index 031602b..c279120 100644
	--- a/src/gallium/drivers/softpipe/sp_screen.c
	+++ b/src/gallium/drivers/softpipe/sp_screen.c
	@@ -358,6 +358,13 @@ softpipe_is_format_supported( struct pipe_screen *screen,
	    if (!format_desc)
	       return FALSE;
	 
	+   if ((bind & PIPE_BIND_RENDER_TARGET) &&
	+       format != PIPE_FORMAT_R9G9B9E5_FLOAT &&
	+       format != PIPE_FORMAT_R11G11B10_FLOAT &&
	+       util_format_is_float(format)) {
	+      return FALSE;
	+   }
	+
	    if (sample_count > 1)
	       return FALSE;
	 
	-- 
	2.7.4


Maybe this would be a better way forward? Enable it, always, in ./configure,
add the patch to check for it in the code itself, then you can build for all
the gallium targets (including swrast) and know that the patented code will
only kick in where it's supported in hardware (and thus patent-safe)?


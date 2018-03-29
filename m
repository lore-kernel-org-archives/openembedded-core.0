Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7403478434
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 14:06:32 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id t132-v6so8614631lfe.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 07:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hQ0Nih35t7ppKn811mPhaWEx6hml68Z4mxbDZjkEH+w=;
	b=HiNliReAndVyEEMW1WcOb0GMsqI3anqJ15F2W9DioK2raeREgLPBC4iPLsCm+8tso+
	Nr0vcfdGqMUHLXLv2CctpdbO1I/Se7U/4F08hKsinb4N8fsqY1rSBZ6Q3K7iL/eTy5gR
	YfjbRMc5b33x79aOcUV4qdLRzhSjAUXIRKA9nt/qF9HilBW0tjtVv2ayVfKNcQ+US5mS
	n9wkEHw7xPdH6tzPZaPJBzNTIpESPIu8EmuObLNFuAUYaGzD22PEoKjxEoEXJHGjzzkT
	aKGX/hyEsetsS0IowMAc/J+XDNcjn+/ONigpUBtCE27sY26SYsYTJpWW5BcuBqWxWY0C
	b/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hQ0Nih35t7ppKn811mPhaWEx6hml68Z4mxbDZjkEH+w=;
	b=P4NfnqpKnxf/SPG0rJ5O7PcziTSbmu/WiHKBZlD4SBP2OBCvNMLuVzgpOqONfWZohp
	At4u3oNWpA6FxQkq+p28GH7MWJb6+dwmc8xSMO0u7HnhURopKzDu4b13phtItzTNXJqN
	nPNSopXN9RKs8gvmTGnsA7F5x23AQIw1Cz1P3Zam6eH9BdcXffvtIMNzub9KgCHfKdz2
	YL+vylpPP4pJNxSa3c1y5C2LuUy1qwTCIrxNqQgh5hTRXqsDEW0Zp0pPmBk0XasO21+k
	pdQt2coRaQJnc7AIgvA6NvGLer9RnaUtmMQXVSxvfp+LSNvOsdO6klz/Vj4zVCcMucC/
	rdlA==
X-Gm-Message-State: AElRT7FcDvHy4NE2N14g7kj7jRXJxUif3mP/9SPdTRBjeoU+nCgjEb6J
	+4wQMi7Xw5x5QCO0ColiYcJ3FP5m/aYlG7G0DTDHmA==
X-Google-Smtp-Source: AIpwx48OANoAzTTQF1W5PawQEuxX81itwfjtZOACcBHL6lrr3V4ctFRDISpQ6UJX66jjYNYyVoEUUSRnJToi24cy2ts=
X-Received: by 10.46.134.25 with SMTP id a25mr5460403lji.87.1522332393066;
	Thu, 29 Mar 2018 07:06:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Thu, 29 Mar 2018 07:06:32 -0700 (PDT)
In-Reply-To: <1522332249-11760-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1522332249-11760-1-git-send-email-richard.purdie@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Mar 2018 10:06:32 -0400
Message-ID: <CADkTA4Ngz=bGTfP=EKKMeLbx0YB=hRQnKxX6m54=-2XyyZC5kQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] make-mod-scripts/kernel-devsrc: Fix objtool issues
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
X-List-Received-Date: Thu, 29 Mar 2018 14:06:32 -0000
Content-Type: text/plain; charset="UTF-8"

Looks good to me. Thanks for fixing this up .. amazing
how these pop up out of nowhere .. at almost always a
non opportune time!

Acked-by: Bruce Ashfield <bruce.ashfeld@windriver.com>

On Thu, Mar 29, 2018 at 10:04 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Kernels which use tools/objtool can now fail when building external modules
> due to objtool being missing, the generated files can also cause problems
> for kernel-devsrc.
>
> Ensure objtool is generated in make-mod-scripts by also calling
> "make prepare".
>
> For devsrc, delete the generated binaries since they'd be native
> binaries and unsuitable for the target.
>
> The oqqa kernel module tests also need to have the additional "make prepare"
> step added.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/runtime/cases/kernelmodule.py                  | 2 +-
>  meta/recipes-kernel/linux/kernel-devsrc.bb                   | 7 +++++++
>  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 3 ++-
>  3 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oeqa/runtime/cases/kernelmodule.py b/meta/lib/oeqa/runtime/cases/kernelmodule.py
> index 11ad7b7..de1a5aa 100644
> --- a/meta/lib/oeqa/runtime/cases/kernelmodule.py
> +++ b/meta/lib/oeqa/runtime/cases/kernelmodule.py
> @@ -28,7 +28,7 @@ class KernelModuleTest(OERuntimeTestCase):
>      @OETestDepends(['gcc.GccCompileTest.test_gcc_compile'])
>      def test_kernel_module(self):
>          cmds = [
> -            'cd /usr/src/kernel && make scripts',
> +            'cd /usr/src/kernel && make scripts prepare',
>              'cd /tmp && make',
>              'cd /tmp && insmod hellomod.ko',
>              'lsmod | grep hellomod',
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index c1b5b77..8bbfa23 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -69,6 +69,13 @@ do_install() {
>                  cp ${B}/arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
>          fi
>
> +        # Remove fixdep/objtool as they won't be target binaries
> +        for i in fixdep objtool; do
> +                if [ -e $kerneldir/tools/objtool/$i ]; then
> +                        rm -rf $kerneldir/tools/objtool/$i
> +                fi
> +        done
> +
>          chown -R root:root ${D}
>  }
>  # Ensure we don't race against "make scripts" during cpio
> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> index d63701e..97c58c5 100644
> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> @@ -22,5 +22,6 @@ EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="
>  do_configure() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>         oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> -                  -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts
> +                  -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts prepare
> +
>  }
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


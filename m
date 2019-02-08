Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6E26B7C583
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 15:43:02 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id t14so2851619lfk.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 07:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7QsVwbcANSnKGw/TyKvrdSnV2IckqvtcholdQAjQSkI=;
	b=WS5CYMwsvistJ39Jp0s0Dx3ibxIqk7OAWjFtjwCOjJqW5RgCU/YtsJd5Pb+CeTEwMM
	EpfUnpmwRgw4zbYTq3n813fduJIUKTXT0feKjofFrdYd4WOuX57WvrFthomzRYOJJ0e3
	YFJ0zDIdhzX0SrunEcoU/FzRi9d+Xkpdno7ZwtznagCQ+dWxVhCjJ1SZtQblpKcyUfdi
	D/VPlXgxnRkqWOH9se4qF4O8saPUIjVI1DHZyXf/iwlVPdW/EiWVMNlA8nS3qiugaJCz
	g6Bubxp2h79w3OfK6MUF/q1HdeC3AINZtDNzqLLx8nkEKz2urgfA/GH+jdr4hALLgqy/
	R5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7QsVwbcANSnKGw/TyKvrdSnV2IckqvtcholdQAjQSkI=;
	b=muu1FymhBh+5m7y+5he2YE/uc8T/1hFC+y2F+v2f/wrSrkFezFM4aZIVaNTgOBdUR6
	OgIrzsQNM+/c9fNoEX4cqLDpv2lFIrUnOkMjHcLKc7ovk/I5ulOyqZmttKdvYghROgIu
	YiPvP/Dd8BAY+q/zUD/41A1bT3IEowqqNTBrduj2HJyhqPmGtNFjGhE1raPWIu3pMZz5
	HKbMf1eL+XJMggbwt65PL5O89quz9CUk0TzeWBNrcdz2u5V+Mi83ARLk2TD8UEwcKM6d
	Tp3VUoTqHy3oCTo3gB62EExZwzmiyqacnUaIuc/oyzHo/ghYqGxFZLeblFivIqbGUARg
	d/hw==
X-Gm-Message-State: AHQUAuZsVcwlVeqPX7V68t0V3Vc+5Kh2i2cmYZvXHFzIhVuZo6QwR6Kp
	9OCgK2f0ffKnKGi6vSzfJXOD9013YG/TYanidng=
X-Google-Smtp-Source: AHgI3Ia8+PIb6FLn8LZ9wHf1NOZfQbmEi7CJKi2KxC2vQ5bX/A4pMcasKkx2UI5kT00N3lT7z/Hqjl/wE36JKhQQ2ig=
X-Received: by 2002:a19:4f15:: with SMTP id d21mr9049902lfb.86.1549640582692; 
	Fri, 08 Feb 2019 07:43:02 -0800 (PST)
MIME-Version: 1.0
References: <20190208153221.4335-1-abrodkin@synopsys.com>
In-Reply-To: <20190208153221.4335-1-abrodkin@synopsys.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 8 Feb 2019 10:42:51 -0500
Message-ID: <CADkTA4PoA5=XHbzS=dLcJOB92+Yc-=RDfNhTgNMPmOUEaL7sUg@mail.gmail.com>
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto: Add dependency on libgcc for ARC
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
X-List-Received-Date: Fri, 08 Feb 2019 15:43:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 8, 2019 at 10:32 AM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> As of now in case of ARC there's no in-kernel implementation of basic libgcc
> functions used for millicode, multiplication, division etc instead we simply
> link with libgcc.a which provides everything used by the compiler.

I'll grab this for my queue.

Cheers,

Bruce

>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> index 1ebfb606da..f191946f2a 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -26,6 +26,10 @@ DEPENDS_append_nios2 = " libgcc"
>  KERNEL_CC_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
>  KERNEL_LD_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
>
> +DEPENDS_append_arc = " libgcc"
> +KERNEL_CC_append_arc = " ${TOOLCHAIN_OPTIONS}"
> +KERNEL_LD_append_arc = " ${TOOLCHAIN_OPTIONS}"
> +
>  KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
>
>  KERNEL_FEATURES_append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
> --
> 2.16.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


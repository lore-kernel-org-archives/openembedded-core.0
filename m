Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 91F027851A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 10:31:27 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id z7-v6so11985255iti.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 03:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=U3dOjad34zK6xk7lEM6Fge1o3Dbhp6T+8Ii/In2ZmVE=;
	b=f5TCyPME5/qX/XKuNXdeOs2XdIp/XdacCjmMHbu8SjbF/2EWlHpfEgWOnWyfaKDY8x
	tbadBoY4z3QpwfeuX2AmpPkIdf1akIYzPm+ts0QIs1JTk94vgnmVMBL+c1lpe1PCKf/J
	d350kpSDXGcE9a+nZKM3w0zwHpNK6TbN+p597ns8GJbrgybaHLy+SM1owaemqdXdtuHJ
	wFaCnVexqmcVZWH3SwI/0y/ThlsobgN+U7IGlk4hn9Y3O9yNvC956eamhsNPguUEVoBw
	qARMB6d4DLCGBcUkqlqw9dkwlbnxpcT+VtbHdKwuTZXJTpHTPVu1iZ9AKPpjetsBetRb
	jSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=U3dOjad34zK6xk7lEM6Fge1o3Dbhp6T+8Ii/In2ZmVE=;
	b=Gaq5yCqfWrm69OLEXIVv30CLKfWrKmwiyisvltOW9HzYRy7aPAXXHKOhRFNlziLC5n
	6s9zfyStZEes8AT+Pr2vVMC7ujOUF6/LzIGGlyZf2zKfepYpUMDYMXWv3/86K6HY6LVZ
	Y23lnClUWV7bhlUwX7uykW9Gusuu4dHfSwKMr8qxLJZJ+ExCKuMxk6AGHl0xqffgyZax
	5osBnkYkQUY0XoXGbsoufEMR/maZGbWrg8XxXV/8bo9nVzUvkVRlTqewSCchOp4x/QUM
	Ehhb4EOGkJtbj3gefPZergdr6ZYN4o7pN8EWkL40M9r3FBA7t2b5txtlKh1B2wQMDxmD
	YkCA==
X-Gm-Message-State: AElRT7HPNXzl5DuLhgF4w5ZevejKGdK7eCKbiRSkM++HbWf+cKAScBHh
	V0V2AEeJ/MZNDQamHyRi2FWauxrMewevRX5eCK+QcQ==
X-Google-Smtp-Source: AIpwx49dMbAohUMcQThYCTqEjZ+13tFhuN9+xB234GlpWcnXpf7CivfOXSojLUlXSjEwx75aGibz2ljN0OvYUJJIQr0=
X-Received: by 2002:a24:4c0e:: with SMTP id
	a14-v6mr21952134itb.34.1522060288594; 
	Mon, 26 Mar 2018 03:31:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Mon, 26 Mar 2018 03:31:08 -0700 (PDT)
In-Reply-To: <1522042927-29046-1-git-send-email-kamensky@cisco.com>
References: <1522042927-29046-1-git-send-email-kamensky@cisco.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Mar 2018 11:31:08 +0100
Message-ID: <CAJTo0LY4JsGtTM1a==RQiRaemZ3__LpbBmQkBOLBi_+gJfBmxg@mail.gmail.com>
To: Victor Kamensky <kamensky@cisco.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: fix qemuarm64 intermediate kernel hang in raid6_select_algo func
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
X-List-Received-Date: Mon, 26 Mar 2018 10:31:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

An early winner of Patch of the Day in my books.

Thanks Victor!

Ross

On 26 March 2018 at 06:42, Victor Kamensky <kamensky@cisco.com> wrote:
> Backport fix from qemu mainline for intermediate qemuarm64 hang
> issue. Root caused in OE environment, issue with aarch64 qemu
> logic of executing instructions that reenabe interrupts. See patch
> commit message for more details.
>
> Upstream-Status: Backport
> Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> ---
>  ...te-a64-treat-DISAS_UPDATE-as-variant-of-D.patch | 67 ++++++++++++++++=
++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0001-arm-translate-a6=
4-treat-DISAS_UPDATE-as-variant-of-D.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-treat=
-DISAS_UPDATE-as-variant-of-D.patch b/meta/recipes-devtools/qemu/qemu/0001-=
arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch
> new file mode 100644
> index 0000000..f90cae6
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-treat-DISAS_=
UPDATE-as-variant-of-D.patch
> @@ -0,0 +1,67 @@
> +From a75a52d62418dafe462be4fe30485501d1010bb9 Mon Sep 17 00:00:00 2001
> +From: Victor Kamensky <kamensky@cisco.com>
> +Date: Fri, 23 Mar 2018 18:26:45 +0000
> +Subject: [PATCH] arm/translate-a64: treat DISAS_UPDATE as variant of
> + DISAS_EXIT
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +In OE project 4.15 linux kernel boot hang was observed under
> +single cpu aarch64 qemu. Kernel code was in a loop waiting for
> +vtimer arrival, spinning in TC generated blocks, while interrupt
> +was pending unprocessed. This happened because when qemu tried to
> +handle vtimer interrupt target had interrupts disabled, as
> +result flag indicating TCG exit, cpu->icount_decr.u16.high,
> +was cleared but arm_cpu_exec_interrupt function did not call
> +arm_cpu_do_interrupt to process interrupt. Later when target
> +reenabled interrupts, it happened without exit into main loop, so
> +following code that waited for result of interrupt execution
> +run in infinite loop.
> +
> +To solve the problem instructions that operate on CPU sys state
> +(i.e enable/disable interrupt), and marked as DISAS_UPDATE,
> +should be considered as DISAS_EXIT variant, and should be
> +forced to exit back to main loop so qemu will have a chance
> +processing pending CPU state updates, including pending
> +interrupts.
> +
> +This change brings consistency with how DISAS_UPDATE is treated
> +in aarch32 case.
> +
> +CC: Peter Maydell <peter.maydell@linaro.org>
> +CC: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> +CC: qemu-stable@nongnu.org
> +Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> +Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> +Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> +Message-id: 1521526368-1996-1-git-send-email-kamensky@cisco.com
> +Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> +Upstream-Status: Backport
> +---
> + target/arm/translate-a64.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> +index 31ff047..327513e 100644
> +--- a/target/arm/translate-a64.c
> ++++ b/target/arm/translate-a64.c
> +@@ -13378,12 +13378,12 @@ static void aarch64_tr_tb_stop(DisasContextBas=
e *dcbase, CPUState *cpu)
> +         case DISAS_UPDATE:
> +             gen_a64_set_pc_im(dc->pc);
> +             /* fall through */
> +-        case DISAS_JUMP:
> +-            tcg_gen_lookup_and_goto_ptr();
> +-            break;
> +         case DISAS_EXIT:
> +             tcg_gen_exit_tb(0);
> +             break;
> ++        case DISAS_JUMP:
> ++            tcg_gen_lookup_and_goto_ptr();
> ++            break;
> +         case DISAS_NORETURN:
> +         case DISAS_SWI:
> +             break;
> +--
> +2.7.4
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


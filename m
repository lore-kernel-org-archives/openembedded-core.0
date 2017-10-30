Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 086F560269
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 15:20:08 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id r25so11887737pgn.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 08:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5BBn7+MdBc1OLUGBcBXtdpZPN2M9ZQbGmcYDsuehdCc=;
	b=NPiP4qX77HUW7ngm/HTiT3I2WnlujFuSBKypFxR3gmQ85+C4mTDaYDdivMf574v1C5
	bpEq/HkCpc0xOGoEPlmbY4zryGwEVzXv9PPDCOa0MV35qshsJwDfOwnMRvvDUPWjeRDZ
	to2MMsnEWhh7thxs2H8ZTnkpTVMg+TtRhuj3bAYRkxEIyCUNY2uLFjr2i4KnUJFfWKRi
	F0AxF+PY2pMul1lWvLDhpH3pYKtb5V1gBMbt7Pc4fQuPSp19fPBz/8Tz2bZ/Ihs4G08L
	gZsV3JJ99K8T9ciEBYNRnnHm+/Gv7DAE1e4rgFoeOtUx/Td86pHolTrFtjB7Mlh07QJs
	gBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5BBn7+MdBc1OLUGBcBXtdpZPN2M9ZQbGmcYDsuehdCc=;
	b=Ec0hKbchO4JdQdtVCclRsu4JvZjR143OePHq44eHQQg6hfJ2zjbOqUiLQTqFccA/iJ
	OlMlDl5u6hYCzdWbdvvCvmUWkfx5ckLSr5JcQ9aXaCj39xwUryxUo7JAO8kqQCCG9JNS
	AaSlJyp0EcUtg0qwWx/khrV8PlNwrI4/NyLKBWnlEenJGL1HQzdzkjW9fI59PR6Nmfz/
	6R+hY6j/0YqUZHpmIm3KdGoxgHtA1vaN0Bwijm5+ku5d56XWU8RufAFWu4JMMc+Kvi2X
	LjYk7D/uKELqkukAc2u6ENrOBD5vq63FU322he0Fxtiba8yd91CZN167p6NnXiBfRDaC
	bTjw==
X-Gm-Message-State: AMCzsaWoz7XNQLyylMaSf2txjy180aCcW79XYiNuxew/2PhktjYqyyP4
	39v9S0zaGMHmZ6Vf1OjcgkbZ+7bhFTg1kbLqi20=
X-Google-Smtp-Source: ABhQp+SFPuaE/KkDqM+je2fHkDvyrIUVgwSo8oK4+EE1R8KPQkRyjj6vDLsGqfdXvLtKqwo50d3w+Ux/UOcT2xgTO8Y=
X-Received: by 10.84.128.97 with SMTP id 88mr7785449pla.161.1509376810107;
	Mon, 30 Oct 2017 08:20:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Mon, 30 Oct 2017 08:19:39 -0700 (PDT)
In-Reply-To: <8b5afe37-5ead-0bda-3293-141f5d297a65@windriver.com>
References: <cover.1509097262.git.Qi.Chen@windriver.com>
	<4a6127f002e0fa3552e1dbdec8b8d9f94265384a.1509097263.git.Qi.Chen@windriver.com>
	<CAMKF1sqQ6E6vKD8rtpF4MXR=6ceOWKnmU9h5gLMWQFc87xSjZw@mail.gmail.com>
	<8b5afe37-5ead-0bda-3293-141f5d297a65@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Oct 2017 08:19:39 -0700
Message-ID: <CAMKF1sqoMFeKtMOr1UDCU9Y2LuKDqMJruLyjMdXCFW1k+6fVSQ@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc: fix miscompilation on mips64
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
X-List-Received-Date: Mon, 30 Oct 2017 15:20:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 30, 2017 at 2:45 AM, ChenQi <Qi.Chen@windriver.com> wrote:
> On 10/28/2017 01:40 AM, Khem Raj wrote:
>
> On Fri, Oct 27, 2017 at 2:43 AM, Chen Qi <Qi.Chen@windriver.com> wrote:
>
> We've observed strange behaviour of `systemctl status <xxx> on qemumips64.
> The output of the command is like `systemctl show <xxx>', which is
> incorrect.
>
> This patch is from gcc bugzilla's attachment.
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81803
>
> The patch hasn't been merged into gcc. But it does solve the above problem.
>
> This looks ok. Can you help by providing your testing results to gcc
> bugzilla
> so the patch can then be submitted to gcc ml.
>
>
> Some updates in this issue.
>
> 1) I've provided information in gcc bugzilla. The author says that he's
> going to submit the patch to gcc mailing list.
>
> 2) I've update remote branch to fix a typo ('mips4' --> 'mips64').
>
>   git://git.pokylinux.org/poky-contrib ChenQi/bug12266
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/bug12266
>
>
> 3) 'core-image-sato + testimage' has been tested on other qemu machines
> including qemux86-64, qemux86, qemumips, qemuppc, qemuarm64.
>

thanks I have tested this fix locally. its good to apply

> Best Regards,
> Chen Qi
>
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-7.2.inc              |  1 +
>  .../fix-miscompilation-for-O1-on-mips64el.patch    | 35
> ++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.2/fix-miscompilation-for-O1-on-mips64el.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc
> b/meta/recipes-devtools/gcc/gcc-7.2.inc
> index 5883bc6..04edad7 100644
> --- a/meta/recipes-devtools/gcc/gcc-7.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-7.2.inc
> @@ -75,6 +75,7 @@ SRC_URI = "\
>             file://0048-gcc-Enable-static-PIE.patch \
>             file://fix-segmentation-fault-precompiled-hdr.patch \
>
> file://0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch \
> +           file://fix-miscompilation-for-O1-on-mips64el.patch \
>             ${BACKPORTS} \
>  "
>  BACKPORTS = "\
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/fix-miscompilation-for-O1-on-mips64el.patch
> b/meta/recipes-devtools/gcc/gcc-7.2/fix-miscompilation-for-O1-on-mips64el.patch
> new file mode 100644
> index 0000000..28020b0
> --- /dev/null
> +++
> b/meta/recipes-devtools/gcc/gcc-7.2/fix-miscompilation-for-O1-on-mips64el.patch
> @@ -0,0 +1,35 @@
> +This patch comes from https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81803
> +
> +Author: mpf <mpf@138bc75d-0d04-0410-961f-82ee72b054a4>
> +
> +This patch hasn't been merged into gcc. But it does solve the problem of
> +strange behaviour of `systemd status <xxx>' on qemumips64.
> +
> +Upstream-Status: Pending [Taken from gcc bugzilla's attachment]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + gcc/lra-constraints.c | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/gcc/lra-constraints.c b/gcc/lra-constraints.c
> +index c8bc9b9a66f..6d319662b09 100644
> +--- a/gcc/lra-constraints.c
> ++++ b/gcc/lra-constraints.c
> +@@ -4235,7 +4235,12 @@ curr_insn_transform (bool check_only_p)
> +                         && (goal_alt[i] == NO_REGS
> +                             || (simplify_subreg_regno
> +                                 (ira_class_hard_regs[goal_alt[i]][0],
> +-                                 GET_MODE (reg), byte, mode) >= 0)))))
> ++                                 GET_MODE (reg), byte, mode) >= 0))))
> ++                    || (type != OP_IN
> ++                        && GET_MODE_PRECISION (mode)
> ++                        < GET_MODE_PRECISION (GET_MODE (reg))
> ++                        && GET_MODE_SIZE (GET_MODE (reg)) <=
> UNITS_PER_WORD
> ++                        && WORD_REGISTER_OPERATIONS))
> +               {
> +                 /* An OP_INOUT is required when reloading a subreg of a
> +                    mode wider than a word to ensure that data beyond the
> +--
> +2.13.0
> +
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


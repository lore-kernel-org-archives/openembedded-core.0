Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 30DA16E650
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 23:38:02 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id i12-v6so11288660otl.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 16:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Rknrl22i4AMRlZXJlsuuVrkVYw2B2J0XTVjWXf6pMkg=;
	b=cbnSLTsoHkIVUvkSFPpH5HUbT0R2+FLVzGs2DXGR/mtyTgpTDNa1DMXCA0Cwrc4nLo
	FKR87of6qVdpKW1PlWbfI9tgiFO+ezN/irbp0nHrwJXYiWZR8BdcAbMSg3ah+fSWsA/L
	wV2vvFVFTo2YSqAhNwphrMwmRKcOuN9tBJeSPS7FwwY1EnONzOKcRmDdkDCOUscxCz6B
	SZkPMoZIB48FzUQv11IHOw6Vdj5M5767IDtKwfsjiCZvmvI+dvlhTD8Uhzl9VBbQbmV7
	l9cRfs/xldqh6D04Lvu/5apJKvokt2p0HX2Xnx8+xSzT0PoYolr3zDpVejDdAu2GT5sg
	8zLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Rknrl22i4AMRlZXJlsuuVrkVYw2B2J0XTVjWXf6pMkg=;
	b=mJpYpbrdzSdhWdaWo0pNaJslfx9xvzDBknpvjXWkKlgLhIcYwz8MLFD/d9WnKc/u/F
	pBrjTU4k+ooSuSC/0NDdYEeg+IY2O4MO1DP16uMQX9WZDAiA3dEaeHXd0yErqAVvRMm9
	VkPncSxGTDYIPY3d7vBVFl2w426ww0kVtCmoZ1NkIyJ5inNzJFIZul28rY3WEoZDpgvw
	7F+kgqJnSJDO9Tp6E93rtL3+hetUUqnGn6XubIdN37jM+B/zanzLrufA0GcSSdyRARk1
	aO4/XxYJoOGpcNUIHtoHfUbJc5ZeQjivOwExHLbYnTqzLSBs5nnHZ/a4lYN+AmdR2EBm
	IEzg==
X-Gm-Message-State: APzg51BWBizl+0K7CkcFDf4nufzIgLwpNfz/xtW1vS8nONl9A1bkkNNN
	kBbQjjfAwWG0ZBSFQeqnvVr1hvhm0gQYDosOP5aBUg==
X-Google-Smtp-Source: ANB0VdZn26Hpsxu7q2KI5SKhQHDSUD0URulOT2ZwiKcLXMrvcSddUhUA2k3vzbGK8/AEO5UKmfi+6RNMLkKhkT/tB9U=
X-Received: by 2002:a9d:798a:: with SMTP id
	h10-v6mr24411407otm.13.1537486684018; 
	Thu, 20 Sep 2018 16:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <1537327601-24881-1-git-send-email-liu.ming50@gmail.com>
In-Reply-To: <1537327601-24881-1-git-send-email-liu.ming50@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Sep 2018 00:37:52 +0100
Message-ID: <CAJTo0LbJXyJj9aa=kMLrmvtJJhd5pCrygSWOqjfErWeNvtFfEw@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: enable virgl driver for qemux86/qemux86-64
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
X-List-Received-Date: Thu, 20 Sep 2018 23:38:03 -0000
Content-Type: text/plain; charset="UTF-8"

I'm assuming you have a local config to turn on gallium, as that isn't
enabled by default.

Ross
On Wed, 19 Sep 2018 at 04:28, <liu.ming50@gmail.com> wrote:
>
> From: Ming Liu <liu.ming50@gmail.com>
>
> virgl driver should be enabled for qemux86/qemux86-64 machines, or else
> it will cause runtime issue due to virtio_gpu driver missing.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 5afd0db..8d0e2cb 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -91,6 +91,8 @@ GALLIUMDRIVERS_LLVM33_ENABLED = "${@oe.utils.version_less_or_equal('MESA_LLVM_RE
>  GALLIUMDRIVERS_LLVM = "r300,svga,nouveau${@',${GALLIUMDRIVERS_LLVM33}' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
>  GALLIUMDRIVERS_append_x86 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
>  GALLIUMDRIVERS_append_x86-64 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
> +GALLIUMDRIVERS_append_qemux86 = ",virgl"
> +GALLIUMDRIVERS_append_qemux86-64 = ",virgl"
>  # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
>  PACKAGECONFIG[gallium]      = "--enable-texture-float --with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
>  MESA_LLVM_RELEASE ?= "6.0"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


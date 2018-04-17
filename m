Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id C5656744A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 20:52:31 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id s18so39104797wrg.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 13:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Cp/O50pj70JYqmvAySByfsACzFwrEB/8xyKB7zMNnwc=;
	b=UPeS0WWry21NUdYeLaMsE8TGTcMsQBxyKvGFttAvqgj8+MQ3KoL28jIeFlaU/AHEee
	15ywoiVSYbFcRwJovpfLFoeWxe8inRq2TTw/mDKni58kxlQ4gtIEvbdFv/39IyGmNtah
	gMEBCCJtD9B9vOTmk4Jahz/34We/ThDgHKajJJ+go4ZSiZAZQJ4bTxIN7spc+e+v8Mzp
	2clLdvBTY8tAs4H6/cR6IjHJ5zjQXXak1PcR7rP0ILzzhoO/AQXENSpkivTI6ufSFob6
	8vWbSf9zlxduIbEDcQyw2yttueNprVX1LYsDmMgzZaqnkCCdZewykAvby6Vp2RxwErbl
	Kvag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Cp/O50pj70JYqmvAySByfsACzFwrEB/8xyKB7zMNnwc=;
	b=FrzBlIUlgoT2YcfIsZrPO9j9flrGrZ4g3Vn76VqxrYZqFL3n3rSidk4d69M8qjnBmc
	DifxrGEgzGfC6I+LtkJtuf426kg7nar0NH3hoWBjmnBF34pMvTATPDxCMUzqVgvoxfUw
	JjXnCpsqQQlhEsh27S964auaJHg1gpugz2AhEdTm7e6Q7z01zY69D0t0CW0mdqxLRdCR
	TxiNWFsZiOVptQTGVcYOKINs2ymU8ARVmklwmFbXHi68hepn6+oUht39oPO5xPiy3H+X
	6q2TUN7y0OcKy7795jVtyQn6f7B+DFRok8EbFMhyn5XcgS9JQxC8ZX4dK8DsMOiq56FQ
	4Opw==
X-Gm-Message-State: ALQs6tAQ7As1BHRTrT5118nLffPH/iNx51BhAqZkceo0cbNA4okDCS2v
	YvYOLdLft0StB6rdM1r/7AitEksVmS5I52ENfeY=
X-Google-Smtp-Source: AIpwx49uvVWn43HVH6wL6IB+qfoUSsmCYjYUNYMXivHAFQs4mlDOQOnhhNj+npMbXNU6WCSFq8CdM8H8Y9AQEEeWizc=
X-Received: by 10.223.130.206 with SMTP id 72mr649095wrc.60.1523998352236;
	Tue, 17 Apr 2018 13:52:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.99 with HTTP; Tue, 17 Apr 2018 13:52:31 -0700 (PDT)
In-Reply-To: <1523908979-32369-1-git-send-email-alistair.francis@wdc.com>
References: <1523908979-32369-1-git-send-email-alistair.francis@wdc.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 17 Apr 2018 13:52:31 -0700
Message-ID: <CAJ86T=VRts8m1QJb-hui1ievJhX-J9ngLUffTotLuzf-Z9dinw@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-kernel/linux: Enable NUMA Kconfig from DISTRO_FEATURES
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
X-List-Received-Date: Tue, 17 Apr 2018 20:52:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 16, 2018 at 1:02 PM, Alistair Francis
<alistair.francis@wdc.com> wrote:
> If the user has set numa as a distro feature enable NUMA support in the
> kernel config.

Isn't NUMA something which would be machine specific rather than
distro specific?

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/recipes-kernel/linux/files/numa.cfg  | 4 ++++
>  meta/recipes-kernel/linux/linux-yocto.inc | 3 +++
>  2 files changed, 7 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux/files/numa.cfg
>
> diff --git a/meta/recipes-kernel/linux/files/numa.cfg b/meta/recipes-kernel/linux/files/numa.cfg
> new file mode 100644
> index 0000000..bb0f9ab
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/numa.cfg
> @@ -0,0 +1,4 @@
> +CONFIG_NUMA=y
> +CONFIG_ACPI_NUMA=y
> +CONFIG_NUMA_BALANCING=y
> +CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> index 3bb872a..cf97cd1 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -28,6 +28,9 @@ KERNEL_LD_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
>
>  KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
>
> +SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'numa', ' file://numa.cfg', '', d)}"
> +KERNEL_FEATURES_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
> +
>  # A KMACHINE is the mapping of a yocto $MACHINE to what is built
>  # by the kernel. This is typically the branch that should be built,
>  # and it can be specific to the machine or shared
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


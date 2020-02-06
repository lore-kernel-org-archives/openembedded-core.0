Return-Path: <jupiter.hce@gmail.com>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id B3CB260D36
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 10:07:45 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id g12so4600908ild.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 02:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Gd2+JZzFkoKUWklNG5+brRpIOCEiUfz37TbEfjbEb3c=;
	b=X5/hQZ9S91p0CRFvC4ZYNOvYTXhQ1zeExoUMcit+UOhiSGm/4YwC90YxJ/xA1TQzIL
	fOraLzhSvtyLnDaskSxKs7vMiYNAXIXu1tYLV10Go+QwfHBJoP/BRek8/SmowGu/JMWW
	dCsRaS4iG36qg5KW6/h5agMhKdHGJDHHZHunEodWsxZJG8O9crZ0BMibIkFaDYc+5LjQ
	zUE5esSkczCHKQazMzVKFbKqxlhWyuGJJytVAnwIf2HBBo3RzFa436/I+iQU5ytW9+RT
	n9TanYfjHe2dSNnrr1lwqxpxySZ9eIHMqPaGqcMeiDU7mGlKYdImgWL0wdn4c//rhs00
	WMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Gd2+JZzFkoKUWklNG5+brRpIOCEiUfz37TbEfjbEb3c=;
	b=EdyLGkhd+BmiOF1dz6tKBKEEbOI0V176Q4wIl6tWiuiITyUgdRUtzasouwLmgrhX4Y
	KjxVtXqgfwqnaSkHkQZx33WPb+kPWqzlSwqV5XLLJz+xG2iADXcd8l2TnyHu8UbJKqJ9
	04TqjzV3IjH9wmqFQrEzOakhLr6tU/Yr/39dgAkJilahjHTV5fx6K8guREZf6Wbx5HLW
	MB92y/QM8OA7ebBJ+6RHaRkiU18yullUiLi4QYmkGbv3LMJT5GoEB/mlKV5gm6zrkFzg
	pBBbBVjGP+10uEx+v1RPP2o8kS8LaWKFDskpGVnLA3ywefkOIS0npy5LGnV/z8U16EFZ
	1WdQ==
X-Gm-Message-State: APjAAAW/dXtis8mjtVoVTFMv9onroKCMDdXKBvy3XD5URDsG0BQgCHqL
	XKdbZ65v0WjWCCNj+vdXT/Lv4fWC3M+41jBE3lY=
X-Google-Smtp-Source: APXvYqx6AVfuHNvGV9iwLVYl53PvfmiWfpvM2kRiZ9JCvzH6xbuEpaognGIAYI6Pl7oXmSPXyKrHKm0ZFO/A8NqYHVc=
X-Received: by 2002:a92:5855:: with SMTP id m82mr2972634ilb.302.1580983666658; 
	Thu, 06 Feb 2020 02:07:46 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP;
	Thu, 6 Feb 2020 02:07:46 -0800 (PST)
In-Reply-To: <CAAx3WaDGin=NcQk3X4=MTK8RfTrNO=LvrG+LbAyrWFUnWgU9aQ@mail.gmail.com>
References: <CAA=hcWSCZROrpDBWV5ZAA+LV6j0cjRSKxyjonOfWS4mCZAtdHg@mail.gmail.com>
	<CAAx3WaDGin=NcQk3X4=MTK8RfTrNO=LvrG+LbAyrWFUnWgU9aQ@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Thu, 6 Feb 2020 21:07:46 +1100
Message-ID: <CAA=hcWSAbcf9GchJN_+-DzMDYJQfMKBGYHmJzRNwY5P_szMvOg@mail.gmail.com>
To: Gabriele Zampieri <gabbla.malist@gmail.com>
Cc: Meta Freescale <meta-freescale@yoctoproject.org>,
	Yocto discussion list <yocto@yoctoproject.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Support UBI u-boot
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
X-List-Received-Date: Thu, 06 Feb 2020 10:07:46 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks Gabriele and Andy,

On 2/6/20, Gabriele Zampieri <gabbla.malist@gmail.com> wrote:
> Hi JH,
>
> have you tried what we suggested you in your last thread? More specifically
> adding your defconfig and tweaking it through menuconfig. and then specify
> the UBOOT_MACHINE.

Yes, as I posted in another thread, the MTD, UBI are all set in my
Linux kernel defconfig, I have also added UBOOT_CONFIG = "nand" in my
layer machine config.

What I missed is u-boot overlay, as you and Andy alluded. I added
UBOOT_CONFIG[nand] += "mx6ull_14x14_evk_nand_config", but strange
enough, that mx6ull_14x14_evk_nand_config, did not set CONFIG_CMD_UBI
in its config.

I think I need to add an appended recipes-bsp to my layer just like I
added the recipes-kernel to my layer to overwrite kernel defconfig, I
need to overwrite u-boot defconfig.

In kernel, to overwrite defconfig, I run bitbake -c menuconfig
virtual/kernel, how can I generate u-boot defconfig, to run bitbake -c
menuconfig u-boot?

Thank you.

Kind regards,

- jh


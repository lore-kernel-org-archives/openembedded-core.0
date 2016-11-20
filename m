Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0AECC6FFCC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Nov 2016 19:31:37 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id p9so22422473vkd.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Nov 2016 11:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6Jogh7hGCvCP8AFiY8vaPE4FRojRToXT4aNB+lX4ymI=;
	b=Vi97LD2SvFeiNdwtQqSkwRfsIQGrZhpGY4zrjcAxP442tYZZQ6U6B/bRSnw5WQg5H/
	NXUk3BgI1GVpzz3Uuh06TgwrqtRysXpzSMLMyrG76jwuro0ZUAb+N5B/D8QoVZ3t3XP7
	4TTqDBMaYnfNr4PZvBrNcOtdkTDfabCeEIDyUdUqy5WrOBgyRVONJFxmuMPHmlXxVn53
	qmi/nCMFyTcVHTv6E3T6sdjMGvlCM5EhrW6bS0prt0bsM3iWubrXFA+u/n3HBrVRGLBU
	CrNt5HhaFsNo5mbpn+GmBgTyJrlQn1h7zZAUoyYSZHZoRz2y14Xsyd70I99XRD3xEgqQ
	Lh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6Jogh7hGCvCP8AFiY8vaPE4FRojRToXT4aNB+lX4ymI=;
	b=Yvego6WxCJAydAmFSRdo8Lz5XKfPfLctrltiFwoQRhWUzwgVJW1I9bOvxUKm85gp3K
	5kTuu6Z6vhLuETBoksb0julm/PR6qSGT1YuCIDpUOUsmCTP87b+gKAJBx2cSEeCPirV7
	BuRs1drtuPbNOXGxXI/KaYW+rMhQuqbdIw/loLjFy4blTi++FV44X1vhF6xtXlZ7I+tw
	pFvKkfjOQiFpNksSvUjqZeoYV4J41Ra+f8jPmc7bAwYYhapB2TZOs/67XibPpu9IlVZH
	/+9Vyx75rF2KxjRcV++cil9vPL9QSVsTbzNT7AwJyY9LKIjPUf4cFfQkOb04u8h9yEjW
	Vj2g==
X-Gm-Message-State: AKaTC03LITWwt2FTttYheTt8E4vWxrz4TSSzUtOAPB6agzJkJdsP4A0RE11nV+8bQKFFLFwE3/F5cCNdmFx+lQ==
X-Received: by 10.31.153.195 with SMTP id b186mr5101557vke.140.1479670299025; 
	Sun, 20 Nov 2016 11:31:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Sun, 20 Nov 2016 11:31:08 -0800 (PST)
In-Reply-To: <1479643823-11675-4-git-send-email-herve.jourdain@neuf.fr>
References: <1479643823-11675-1-git-send-email-herve.jourdain@neuf.fr>
	<1479643823-11675-4-git-send-email-herve.jourdain@neuf.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Nov 2016 11:31:08 -0800
Message-ID: <CAMKF1srm_KQ+QEtmaWzgTcsL_hxXhMQbGBVjXhA17hW-vH-PLA@mail.gmail.com>
To: Herve Jourdain <herve.jourdain@neuf.fr>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 3/3] Add a tune file for cortexa53, valid for 32 bits and 64 bits
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
X-List-Received-Date: Sun, 20 Nov 2016 19:31:38 -0000
Content-Type: text/plain; charset=UTF-8

Is there any advantage of having all these tunes for armv8 as well ?

On Sun, Nov 20, 2016 at 4:10 AM, Herve Jourdain <herve.jourdain@neuf.fr> wrote:
> Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
> ---
>  meta/conf/machine/include/tune-cortexa53.inc | 43 ++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 meta/conf/machine/include/tune-cortexa53.inc
>
> diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machine/include/tune-cortexa53.inc
> new file mode 100644
> index 0000000..1d2947f
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-cortexa53.inc
> @@ -0,0 +1,43 @@
> +DEFAULTTUNE ?= "cortexa53-32"
> +
> +require conf/machine/include/arm/arch-armv8.inc
> +
> +TUNEVALID[cortexa53] = "Enable Cortex-A53 specific processor optimizations"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa53', ' -mcpu=cortex-a53 ', '',d)}"
> +
> +# Extra tune selections
> +AVAILTUNES += "cortexa53-32"
> +ARMPKGARCH_tune-cortexa53-32 ?= "cortexa53"
> +TUNE_FEATURES_tune-cortexa53-32 = "${TUNE_FEATURES_tune-armv8-neon-crc} cortexa53"
> +BASE_LIB_tune-cortexa53-32 = "lib"
> +TUNE_PKGARCH_tune-cortexa53-32 = "cortexa53-32"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa53-32 = "${PACKAGE_EXTRA_ARCHS_tune-armv8-neon-crc} cortexa53-32 cortexa53-neon-fp-armv8"
> +
> +AVAILTUNES += "cortexa53crypto-32"
> +ARMPKGARCH_tune-cortexa53crypto-32 ?= "cortexa53"
> +TUNE_FEATURES_tune-cortexa53crypto-32 = "${TUNE_FEATURES_tune-armv8-neon-crypto-crc} cortexa53"
> +BASE_LIB_tune-cortexa53crypto-32 = "lib"
> +TUNE_PKGARCH_tune-cortexa53crypto-32 = "cortexa53crypto-32"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa53crypto-32 = "${PACKAGE_EXTRA_ARCHS_tune-armv8-neon-crypto-crc} cortexa53-32 cortexa53-crypto-neon-fp-armv8"
> +
> +AVAILTUNES += "cortexa53hf-32"
> +ARMPKGARCH_tune-cortexa53hf-32 ?= "cortexa53"
> +TUNE_FEATURES_tune-cortexa53hf-32 = "${TUNE_FEATURES_tune-armv8hf-neon-crc} cortexa53"
> +BASE_LIB_tune-cortexa53hf-32 = "lib"
> +TUNE_PKGARCH_tune-cortexa53hf-32 = "cortexa53hf-32"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa53hf-32 = "${PACKAGE_EXTRA_ARCHS_tune-armv8hf-neon-crc} cortexa53hf-32 cortexa53hf-neon-fp-armv8"
> +
> +AVAILTUNES += "cortexa53hfcrypto-32"
> +ARMPKGARCH_tune-cortexa53hfcrypto-32 ?= "cortexa53"
> +TUNE_FEATURES_tune-cortexa53hfcrypto-32 = "${TUNE_FEATURES_tune-armv8hf-neon-crypto-crc} cortexa53"
> +BASE_LIB_tune-cortexa53hfcrypto-32 = "lib"
> +TUNE_PKGARCH_tune-cortexa53hfcrypto-32 = "cortexa53hfcrypto-32"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa53hfcrypto-32 = "${PACKAGE_EXTRA_ARCHS_tune-armv8hf-neon-crypto-crc} cortexa53hf-32 cortexa53hf-crypto-neon-fp-armv8"
> +
> +AVAILTUNES += "cortexa53-64"
> +ARMPKGARCH_tune-cortexa53-64 ?= "cortexa53"
> +TUNE_FEATURES_tune-cortexa53-64 = "${TUNE_FEATURES_tune-aarch64} cortexa53"
> +BASE_LIB_tune-cortexa53-64 = "lib64"
> +TUNE_PKGARCH_tune-cortexa53-64 = "cortexa53-64"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa53-64 = "${PACKAGE_EXTRA_ARCHS_tune-aarch64} cortexa53-64"
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


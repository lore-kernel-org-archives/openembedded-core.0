Return-Path: <daiane.list@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id DCBDB71B45
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 18:23:36 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id b124so7898292qke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 11:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=g4vYtlT1Rt6GmWaEU7KBWBghg9wzOPiZZdGmZo9r7bQ=;
	b=aGYbEsdeXTW8w+ChedbYqnUgreOrUmxuHVJtWB/HQXRsDYSX9RrezGtetNjvW6rMid
	Ai4q9T5lqpaD4IGPOs6rRfe85qf6Qx8lj8r3Irngwb33OAJIMO4UNoPVq85Gc3eurF4Z
	jJHr1G3cnK0oA33tCUTmBUb9KctJx7Kv+1y46VDVbKLl0leKWWtKuBCYwAshJKZAO/1N
	JFX0/v41nOzTurxINyf+Ur6u3TXyuVCEMojNYvEy0FI/kL5D86Bf+PcMskAXCE12Kzsn
	QeWJrD9Mfx8JS62uq0UmFS5FJXG6HVZx20G2a7cOgQIj3X1kfQ3xO6mRizB8XcMRp0T0
	avZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=g4vYtlT1Rt6GmWaEU7KBWBghg9wzOPiZZdGmZo9r7bQ=;
	b=OvkkIioxiT0eXsuQJHi+Lq28sfKTyU5ZkvB5x6H91S2J2adxSNoyhPqQ8D+NCD07fM
	tmC4cp5BMaY4KF6qsFjwEghzQ0ScCfkzubIpup3o4M1VSJlog5e/997km/ZUlP62gZFf
	h94bMb5GWeCtfEi3NOFOHCm/58oyyAD1jxB4SpduK9CjqWagBaP88x5niXOv/8X0juhG
	jv2ZV0zl9GsdhXjrABtBT3czlzQhCBQ8UpXcbKHqyFp+E+hWfCGcoEHUCAvjQ5uFZHIW
	FWHJ6miFpgoc87CvEPob2QPObzvfBf0nykUzJ7qWU7v4QIfryGrG2mJDnDYVoFjH54Kb
	e+Pw==
X-Gm-Message-State: AMCzsaXe8D78fwzYzVw74UDiPbyc4JDyc4hf9wNAHY2/7So0fmUur/Nj
	YSa6+LWKJYF1zlrKGOuqPr3Yk6fgspXq+znka8I=
X-Google-Smtp-Source: AOwi7QBPmt5oIhkGCCwrvPcwwn9AgT8B/5+1zbqrR7vELDFLLaPnYGvYFI1DcB2fb++7OxXXnT3pzaJ4QCAsyuwv8CM=
X-Received: by 10.55.155.79 with SMTP id d76mr16649879qke.288.1507227818079;
	Thu, 05 Oct 2017 11:23:38 -0700 (PDT)
MIME-Version: 1.0
Sender: angolini@gmail.com
X-Google-Sender-Delegation: angolini@gmail.com
Received: by 10.140.93.225 with HTTP; Thu, 5 Oct 2017 11:23:37 -0700 (PDT)
In-Reply-To: <20171005180006.2956-1-otavio@ossystems.com.br>
References: <20171005180006.2956-1-otavio@ossystems.com.br>
From: Daiane Angolini <daiane.list@gmail.com>
Date: Thu, 5 Oct 2017 15:23:37 -0300
X-Google-Sender-Auth: VdCsyP1QFl_4tj0SBI-WU9yOmOY
Message-ID: <CA+jg_OVmUitTVa87zNFqPXQ-nJiCO+wF2nr0J+DL-W9NdYSzSg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-firmware: Split i.MX SDMA firmwares
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
X-List-Received-Date: Thu, 05 Oct 2017 18:23:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 5, 2017 at 3:00 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> This splits out the i.MX SDMA firmwares for i.MX6 and i.MX7 SoCs. This
> also includes the required runtime provides, conflicts and replaces
> for the old firmware-imx which was provided by NXP BSP layer.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Reviewed-by: Daiane Angolini <daiane.angolini@nxp.com>

> ---
>
>  .../recipes-kernel/linux-firmware/linux-firmware_git.bb | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> index 6798ace639..cb923e8a7b 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> @@ -46,6 +46,7 @@ LICENSE = "\
>      & Firmware-ralink_a_mediatek_company_firmware \
>      & Firmware-ralink-firmware \
>      & Firmware-rtlwifi_firmware \
> +    & Firmware-imx-sdma_firmware \
>      & Firmware-siano \
>      & Firmware-tda7706-firmware \
>      & Firmware-ti-connectivity \
> @@ -104,6 +105,7 @@ LIC_FILES_CHKSUM = "\
>      file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435 \
>      file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd \
>      file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
> +    file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9 \
>      file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5 \
>      file://LICENCE.tda7706-firmware.txt;md5=835997cf5e3c131d0dddd695c7d9103e \
>      file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec \
> @@ -164,6 +166,7 @@ NO_GENERIC_LICENSE[Firmware-ralink_a_mediatek_company_firmware] = "LICENCE.ralin
>  NO_GENERIC_LICENSE[Firmware-ralink-firmware] = "LICENCE.ralink-firmware.txt"
>  NO_GENERIC_LICENSE[Firmware-rtlwifi_firmware] = "LICENCE.rtlwifi_firmware.txt"
>  NO_GENERIC_LICENSE[Firmware-siano] = "LICENCE.siano"
> +NO_GENERIC_LICENSE[Firmware-imx-sdma_firmware] = "LICENSE.sdma_firmware"
>  NO_GENERIC_LICENSE[Firmware-tda7706-firmware] = "LICENCE.tda7706-firmware.txt"
>  NO_GENERIC_LICENSE[Firmware-ti-connectivity] = "LICENCE.ti-connectivity"
>  NO_GENERIC_LICENSE[Firmware-ti-keystone] = "LICENCE.ti-keystone"
> @@ -239,6 +242,8 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
>               ${PN}-gplv2-license ${PN}-carl9170 \
>               ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-qca \
>               \
> +             ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
> +             \
>               ${PN}-iwlwifi-license ${PN}-iwlwifi \
>               ${PN}-iwlwifi-135-6 \
>               ${PN}-iwlwifi-3160-7 ${PN}-iwlwifi-3160-8 ${PN}-iwlwifi-3160-9 \
> @@ -550,6 +555,17 @@ FILES_${PN}-whence-license = "${nonarch_base_libdir}/firmware/WHENCE"
>
>  RDEPENDS_${PN}-bnx2-mips += "${PN}-whence-license"
>
> +# For imx-sdma
> +LICENSE_${PN}-imx-sdma          = "Firmware-imx-sdma_firmware"
> +
> +FILES_${PN}-imx-sdma-imx6q = "${nonarch_base_libdir}/firmware/imx/sdma/sdma-imx6q.bin"
> +
> +RPROVIDES_${PN}-imx-sdma-imx6q = "firmware-imx-sdma-imx6q"
> +RREPLACES_${PN}-imx-sdma-imx6q = "firmware-imx-sdma-imx6q"
> +RCONFLICTS_${PN}-imx-sdma-imx6q = "firmware-imx-sdma-imx6q"
> +
> +FILES_${PN}-imx-sdma-imx7d = "${nonarch_base_libdir}/firmware/imx/sdma/sdma-imx7d.bin"
> +
>  # For iwlwifi
>  LICENSE_${PN}-iwlwifi           = "Firmware-iwlwifi_firmware"
>  LICENSE_${PN}-iwlwifi-135-6     = "Firmware-iwlwifi_firmware"
> @@ -713,6 +729,7 @@ LICENSE_${PN} = "\
>      & Firmware-radeon \
>      & Firmware-ralink_a_mediatek_company_firmware \
>      & Firmware-ralink-firmware \
> +    & Firmware-imx-sdma_firmware \
>      & Firmware-siano \
>      & Firmware-tda7706-firmware \
>      & Firmware-ti-connectivity \
> --
> 2.14.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


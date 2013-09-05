Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id BB558615E3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 01:04:31 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id j6so1458725oag.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 18:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=FXDqo7q35zpn/Ik4DnzItV3KoSuy4VlN/G3k8BmYNCE=;
	b=Cul+3ei9+IJkLyrf/xbNDOaxG2a6hg6Ku866DJm5wVRnbAO6XQvNdRr4OtYHvPngvR
	2PoAAhdhorP80E/XvSEP8nIfZOsjpDLhdxHnWutMy+fIb4zffMEKlwmfD8NGynlqBy/i
	UtE5LnuVNmK7D4QTSyQOcbpWWxOXOeWSL42zbaoz/P/4frONq6dXpd0T6xQ3X2OAX6//
	XYoq1NYYk+1AdIX7EPkOdkjhQIp1e8jDShWEnhaf9vJfDdqRTf6B2ECeM8nuESRBPHxn
	SVJT8GciVzJsIFQKXMFRyntj3ubtDMs1I1O63hmQuDTCtX1+SxAgpfiSfR4r/gMhPvVk
	hsig==
MIME-Version: 1.0
X-Received: by 10.182.38.228 with SMTP id j4mr4373053obk.94.1378343073126;
	Wed, 04 Sep 2013 18:04:33 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 4 Sep 2013 18:04:33 -0700 (PDT)
In-Reply-To: <b2e7d64bcfed785d28da77202d46157f4ce7dfd6.1378339881.git.dvhart@linux.intel.com>
References: <cover.1378339881.git.dvhart@linux.intel.com>
	<b2e7d64bcfed785d28da77202d46157f4ce7dfd6.1378339881.git.dvhart@linux.intel.com>
Date: Wed, 4 Sep 2013 22:04:33 -0300
X-Google-Sender-Auth: 9XzL4Ei97_stayo67duoe1Msiz4
Message-ID: <CAP9ODKqGdoGoaNh9e_3gZ5A+HhCDq-_wCVygYKHcShajCNXyvg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Poky <poky@yoctoproject.org>, yunguo.wei@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] linux-firmware: Update SRCREV, pull in iwlwifi-7260 support
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
X-List-Received-Date: Thu, 05 Sep 2013 01:04:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 4, 2013 at 9:18 PM, Darren Hart <dvhart@linux.intel.com> wrote:
> Fixes [YOCTO #5110]
>
> Add support for the iwlwifi 7260 adapters. This creates a new package
> and includes support in the default linux-firmware (everything) package.
>
> Update the iwlwifi and radeon license checksums. Extensions to the
> copyright date ranges were the only change to the LICENSE files.
>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> Cc: yunguo.wei@windriver.com
> ---
>  .../linux-firmware/linux-firmware_git.bb           |   10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> index 3825889..1b7db08 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> @@ -7,12 +7,12 @@ SECTION = "kernel"
>
>  LICENSE = "Proprietary"
>
> -LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=e56b405656593a0c97e478513051ea0e \
> +LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=9c2faab1bfca55e1510d6bde67206f9c \
>                      file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
>                      file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
>                      file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd \
>                      file://LICENCE.qla2xxx;md5=4005328a134054f0fa077bdc37aa64f2 \
> -                    file://LICENCE.iwlwifi_firmware;md5=11545778abf78c43d7644d4f171ea1c7 \
> +                    file://LICENCE.iwlwifi_firmware;md5=8b938534f77ffd453690eb34ed84ae8b \
>                      file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36 \
>                      file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
>                      file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
> @@ -23,10 +23,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=e56b405656593a0c97e478513051ea0e \
>                      file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f \
>                     "
>
> -SRCREV = "c530a75c1e6a472b0eb9558310b518f0dfcd8860"
> +SRCREV = "600caefd83a406540b2a789be6415e44c9b87add"
>  PE = "1"
>  PV = "0.0+git${SRCPV}"
> -PR = "r1"
> +PR = "r0"

I know this is OK but I'd prefer to omit the PR when it is r0;
specially now we use PRServer.

>  SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"
>
> @@ -172,10 +172,12 @@ ALTERNATIVE_TARGET_linux-firmware-bcm4334[brcmfmac-sdio.bin] = "/lib/firmware/br
>
>  RDEPENDS_${PN}-iwlwifi-6000g2a-5 = "${PN}-iwlwifi-license"
>  RDEPENDS_${PN}-iwlwifi-6000g2b-6 = "${PN}-iwlwifi-license"
> +RDEPENDS_${PN}-iwlwifi-7260-7 = "${PN}-iwlwifi-license"
>
>  FILES_${PN}-iwlwifi-license =   "/lib/firmware/LICENCE.iwlwifi_firmware"
>  FILES_${PN}-iwlwifi-6000g2a-5 = "/lib/firmware/iwlwifi-6000g2a-5.ucode"
>  FILES_${PN}-iwlwifi-6000g2b-6 = "/lib/firmware/iwlwifi-6000g2b-6.ucode"
> +FILES_${PN}-iwlwifi-7260-7 = "/lib/firmware/iwlwifi-7260-7.ucode"
>
>  FILES_${PN} += "/lib/firmware/*"
>
> --
> 1.7.9.5
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


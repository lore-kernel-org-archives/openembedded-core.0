Return-Path: <nathan@nathanrossi.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id CCBFD60190
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 05:28:40 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id h133so464989ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 21:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LWD+kLw2kAF9EDcbHEleMaCsHsx1U4Ym17Wyihwi6Wo=;
	b=LmwSsh9N8LcoZyGPvPF9D9pBPOOGNrTN11zPENJhIMgSJwkxoB+zQ1JK47riTRb5Vx
	iCCoNkUpKSeiZoe8gjZOjLS36p1AzBE/5I09aed3U75Dmp5i3CDTvtWN7uTxYZM16O+/
	zrgRNuI88C4c5NO/20ZJRIOKWYShhRah0eN54AbMTv+55CApv1N6mQpHL1D6dFF56ZOA
	WM1a2sJP4sPerKg+sN8jce+qPZ+y9pu75m4xSvxo4xdi73Xdg4VlC5ie8UWGk/w3TWmQ
	COiPf27nnIpLcPVDg0J6RSKNzVeTQPNM8wZDbMkD1ZjVpvbpF7goA7ZWVgQ0TaChJwmR
	4Fsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LWD+kLw2kAF9EDcbHEleMaCsHsx1U4Ym17Wyihwi6Wo=;
	b=EItsHCUAkVnIlfDEEl9j3E1zNz790Y8mFyx0q5Nia+rL4t4ctFxGsKw8aC7Z2ImkaW
	AAtJ2d68yihrcoGzF/uRo8VFI3VYcqnzU/UmzK+o2463J2u1T5Xp8Uzz2C63MG/6rqay
	H2SqewFdg2eOlpyvptkElswRCsjJxrBjJTO792W1f6mlXiPZiFyCFwfx0F/e5rJuJ2XW
	SdznkkYvAdtFl2nykXuRQ6JCs4z913VMigkE5Xhp0b7pxW9/uuG42bYonPfilKszUnwG
	EMhaB6sKgN7EsuHoyJXlp9pKiE9Kxt10yPEAKTCNe5yjY0y2Ir55U6DTC/Y6lzpqNjYY
	fZ3g==
X-Gm-Message-State: AKaTC01HZ53k9ab3Tu60bZWykJUeSFhTH5LiRIlwI3hoDxpgwuAbGejc3zd1Mm1xxG/DyJelNVLAHbuwm3/3eA==
X-Received: by 10.107.46.227 with SMTP id u96mr1781686iou.58.1479878922343;
	Tue, 22 Nov 2016 21:28:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.249.10 with HTTP; Tue, 22 Nov 2016 21:28:41 -0800 (PST)
In-Reply-To: <20161021120728.22639-3-nathan@nathanrossi.com>
References: <20161021120728.22639-1-nathan@nathanrossi.com>
	<20161021120728.22639-3-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Wed, 23 Nov 2016 15:28:41 +1000
Message-ID: <CA+aJhH0CDFtJ=W8+FN68nuDJhzAwXBOLOfXmoAci8egJ5bzgAg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-fitimage.bbclass: Don't assume KERNEL_IMAGETYPE == fitImage
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
X-List-Received-Date: Wed, 23 Nov 2016 05:28:41 -0000
Content-Type: text/plain; charset=UTF-8

Just pinging these patches, to see if there were any issues or
comments. I realize I sent them just before a release so it was very
likely they would get lost in the noise.

Thanks,
Nathan

On 21 October 2016 at 22:07, Nathan Rossi <nathan@nathanrossi.com> wrote:
> The name of the output image for a fitImage that contains a ramdisk
> should match the same as for the fitImage that does not contain a
> ramdisk. As such it should not be assumed that KERNEL_IMAGETYPE is
> "fitImage". This change explicitly sets the name of the output
> ramdisk/initramfs to start with fitImage as does the non-ramdisk output.
>
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 5c9e76b9ac..55529b161f 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -419,11 +419,11 @@ kernel_do_deploy_append() {
>
>                 if [ -n "${INITRAMFS_IMAGE}" ]; then
>                         echo "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
> -                       its_initramfs_base_name="${KERNEL_IMAGETYPE}-its-${INITRAMFS_IMAGE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
> -                       its_initramfs_symlink_name=${KERNEL_IMAGETYPE}-its-${INITRAMFS_IMAGE}-${MACHINE}
> +                       its_initramfs_base_name="fitImage-its-${INITRAMFS_IMAGE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
> +                       its_initramfs_symlink_name=fitImage-its-${INITRAMFS_IMAGE}-${MACHINE}
>                         install -m 0644 fit-image-${INITRAMFS_IMAGE}.its ${DEPLOYDIR}/${its_initramfs_base_name}.its
> -                       fit_initramfs_base_name="${KERNEL_IMAGETYPE}-${INITRAMFS_IMAGE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
> -                       fit_initramfs_symlink_name=${KERNEL_IMAGETYPE}-${INITRAMFS_IMAGE}-${MACHINE}
> +                       fit_initramfs_base_name="fitImage-${INITRAMFS_IMAGE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
> +                       fit_initramfs_symlink_name=fitImage-${INITRAMFS_IMAGE}-${MACHINE}
>                         install -m 0644 arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} ${DEPLOYDIR}/${fit_initramfs_base_name}.bin
>                 fi
>
> --
> 2.9.3


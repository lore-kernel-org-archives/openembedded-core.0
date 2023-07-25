Return-Path: <rehn.andreas86@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A00C001E0
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 12:01:23 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web10.18472.1690286479407683619
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 05:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=chCscUp4;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: rehn.andreas86@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-444c42f608aso1792376137.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 05:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690286478; x=1690891278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vAEZUhRJ04cznvO+UG6/CT6gUwdE015rb3Dgo4L3umc=;
        b=chCscUp43Vmbs8EOjIu4FlnjFHS6sYD+mLVMAS9r0QeHT2Bn8b4MpT9uFGnLftCart
         0l8C3qGTOTsQZyfQ031qpwh88S2cZwfULtEppW55N2JJ1FdDwNBQVJ+rAiyUGzkOO9MN
         Ykh8g7nxqbEXkLuS/B4FJ6GQQU0R6iwHOfPxnimeI1JGxAuHIUcVtYRzUzIc2c+Piu+3
         +3mIWEPjW2wgVIR59NR5g0gnS0Z1RTrQVg370a0Cw18j5eKy4TlLC1BMNnqLRhYy4cf+
         gZs/HD8/UGFdY5tB5FPn6hzWoxJ4NUXgXyfM5YQ+KksluuvJvsq3z2tAdRg45Yc2CQrU
         QgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690286478; x=1690891278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAEZUhRJ04cznvO+UG6/CT6gUwdE015rb3Dgo4L3umc=;
        b=jPA+OyfhGizGI6Tc+AgiTqV9gDN9cAQw0OpKi2a8ipLCC+xItNbrCkhY6v+rvJacrx
         smg9gvGsGCeXR9O+u+gKcrg1031WhwLnBMhbQYbAZV09jvzvVH4UDy7IewAMAfT+e0II
         uzSzybXn7N2M6p8O5a9KLnzDhW1C6NrklxNuAzXaOzpJz61BVUG6OcB3IAFU1bHw1Nh7
         cVEbart7Iaw2/W+Hq4I8LWEsFl2d8LsKyerV8NV8OvUBGElWZ5fL895d7vJ6XBYgplo8
         opfK6av1tulr5Bj5Bkb0noqAeJkk/Lp6I98GHe2Dq0a5oUJrl/GIDUvY8aTm42Tk8u+D
         7G8w==
X-Gm-Message-State: ABy/qLbaYJvpOsqtASncoQo6A1paKGNdvnVga65WKkMoFgK2SBnn9CDD
	4pmXsfCDflZlZv1ZMWuPpdCIeDzCb/0NxVlsW2w+u+2iiK0=
X-Google-Smtp-Source: APBJJlHIWqWb8X3J0UZsXKVfVAeRi7xsKM8Q4sQ+qr61RSm2DskD+FhUH306ue1evW9PnK6yjgyS+K0VwCHE+pGlDgc=
X-Received: by 2002:a67:f254:0:b0:447:4b52:5c8 with SMTP id
 y20-20020a67f254000000b004474b5205c8mr264889vsm.26.1690286478066; Tue, 25 Jul
 2023 05:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <7JrI.1690277290613913360.PhKO@lists.openembedded.org> <CANNYZj_tCWzW84+yVSRXECpodY=XetmNXzVbMgwcQR5Cn-zORA@mail.gmail.com>
In-Reply-To: <CANNYZj_tCWzW84+yVSRXECpodY=XetmNXzVbMgwcQR5Cn-zORA@mail.gmail.com>
From: Andreas Rehn <rehn.andreas86@gmail.com>
Date: Tue, 25 Jul 2023 14:01:07 +0200
Message-ID: <CAPmT5DeEKag1p7kebruEyVH2T0nFKxEXw9GOHTSvwKvajf5Lmg@mail.gmail.com>
Subject: Re: [OE-core] dunfell: poky 3.1.27 - full linux-firmware always in image
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000018084806014e7d98"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 12:01:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184838

--00000000000018084806014e7d98
Content-Type: text/plain; charset="UTF-8"

hey alex,
thx for have a look

before

linux-firmware-mt7601u-license
linux-firmware-mt7601u
linux-firmware-ralink-license
linux-firmware-ralink
linux-firmware-rtl8168
linux-firmware-rtl8188
linux-firmware-rtl8192ce
linux-firmware-rtl8192cu
linux-firmware-rtl8192eu
linux-firmware-rtl8192su
linux-firmware-rtl8723
linux-firmware-rtl8821
linux-firmware-rtl-license
linux-firmware-whence-license

after

libz1 aarch64 1.2.11-r0
linux-firmware all 1:20230515-r0
linux-firmware-adsp-sst all 1:20230515-r0
linux-firmware-adsp-sst-license all 1:20230515-r0
linux-firmware-amlogic-vdec all 1:20230515-r0
linux-firmware-amlogic-vdec-license all 1:20230515-r0
linux-firmware-ar3k all 1:20230515-r0
linux-firmware-ar3k-license all 1:20230515-r0
linux-firmware-ar9170 all 1:20230515-r0
linux-firmware-ath10k all 1:20230515-r0
linux-firmware-ath10k-license all 1:20230515-r0
linux-firmware-ath11k all 1:20230515-r0
linux-firmware-ath6k all 1:20230515-r0
linux-firmware-ath9k all 1:20230515-r0
linux-firmware-atheros-license all 1:20230515-r0
linux-firmware-bcm-0bb4-0306 all 1:20230515-r0
linux-firmware-bcm43143 all 1:20230515-r0
linux-firmware-bcm43236b all 1:20230515-r0
linux-firmware-bcm43241b0 all 1:20230515-r0
linux-firmware-bcm43241b4 all 1:20230515-r0
linux-firmware-bcm43241b5 all 1:20230515-r0
linux-firmware-bcm43242a all 1:20230515-r0
linux-firmware-bcm4329 all 1:20230515-r0
linux-firmware-bcm4329-fullmac all 1:20230515-r0
linux-firmware-bcm4330 all 1:20230515-r0
linux-firmware-bcm4334 all 1:20230515-r0
linux-firmware-bcm43340 all 1:20230515-r0
linux-firmware-bcm4335 all 1:20230515-r0
linux-firmware-bcm43362 all 1:20230515-r0
linux-firmware-bcm4339 all 1:20230515-r0
linux-firmware-bcm43430 all 1:20230515-r0
linux-firmware-bcm43430a0 all 1:20230515-r0
linux-firmware-bcm43455 all 1:20230515-r0
linux-firmware-bcm4350 all 1:20230515-r0
linux-firmware-bcm4350c2 all 1:20230515-r0
linux-firmware-bcm4354 all 1:20230515-r0
linux-firmware-bcm4356 all 1:20230515-r0
linux-firmware-bcm4356-pcie all 1:20230515-r0
linux-firmware-bcm43569 all 1:20230515-r0
linux-firmware-bcm43570 all 1:20230515-r0
linux-firmware-bcm4358 all 1:20230515-r0
linux-firmware-bcm43602 all 1:20230515-r0
linux-firmware-bcm4366b all 1:20230515-r0
linux-firmware-bcm4366c all 1:20230515-r0
linux-firmware-bcm4371 all 1:20230515-r0
linux-firmware-bcm4373 all 1:20230515-r0
linux-firmware-bcm43xx all 1:20230515-r0
linux-firmware-bcm43xx-hdr all 1:20230515-r0
linux-firmware-bnx2-mips all 1:20230515-r0
linux-firmware-broadcom-license all 1:20230515-r0
linux-firmware-carl9170 all 1:20230515-r0
linux-firmware-cypress-license all 1:20230515-r0
linux-firmware-gplv2-license all 1:20230515-r0
linux-firmware-i915 all 1:20230515-r0
linux-firmware-i915-license all 1:20230515-r0
linux-firmware-ibt all 1:20230515-r0
linux-firmware-ibt-11-5 all 1:20230515-r0
linux-firmware-ibt-12-16 all 1:20230515-r0
linux-firmware-ibt-17 all 1:20230515-r0
linux-firmware-ibt-20 all 1:20230515-r0
linux-firmware-ibt-hw-37-7 all 1:20230515-r0
linux-firmware-ibt-hw-37-8 all 1:20230515-r0
linux-firmware-ibt-license all 1:20230515-r0
linux-firmware-ibt-misc all 1:20230515-r0
linux-firmware-ice all 1:20230515-r0
linux-firmware-ice-license all 1:20230515-r0
linux-firmware-imx-sdma-imx6q all 1:20230515-r0
linux-firmware-imx-sdma-imx7d all 1:20230515-r0
linux-firmware-imx-sdma-license all 1:20230515-r0
linux-firmware-iwlwifi all 1:20230515-r0
linux-firmware-iwlwifi-135-6 all 1:20230515-r0
linux-firmware-iwlwifi-3160-17 all 1:20230515-r0
linux-firmware-iwlwifi-6000-4 all 1:20230515-r0
linux-firmware-iwlwifi-6000g2a-6 all 1:20230515-r0
linux-firmware-iwlwifi-6000g2b-6 all 1:20230515-r0
linux-firmware-iwlwifi-6050-5 all 1:20230515-r0
linux-firmware-iwlwifi-7260 all 1:20230515-r0
linux-firmware-iwlwifi-7265 all 1:20230515-r0
linux-firmware-iwlwifi-7265d all 1:20230515-r0
linux-firmware-iwlwifi-8000c all 1:20230515-r0
linux-firmware-iwlwifi-8265 all 1:20230515-r0
linux-firmware-iwlwifi-9000 all 1:20230515-r0
linux-firmware-iwlwifi-license all 1:20230515-r0
linux-firmware-iwlwifi-misc all 1:20230515-r0
linux-firmware-license all 1:20230515-r0
linux-firmware-liquidio all 1:20230515-r0
linux-firmware-lontium-license all 1:20230515-r0
linux-firmware-lt9611uxc all 1:20230515-r0
linux-firmware-marvell-license all 1:20230515-r0
linux-firmware-mt7601u all 1:20230515-r0
linux-firmware-mt7601u-license all 1:20230515-r0
linux-firmware-netronome all 1:20230515-r0
linux-firmware-netronome-license all 1:20230515-r0
linux-firmware-nvidia-gpu all 1:20230515-r0
linux-firmware-nvidia-license all 1:20230515-r0
linux-firmware-nvidia-tegra all 1:20230515-r0
linux-firmware-nvidia-tegra-k1 all 1:20230515-r0
linux-firmware-pcie8897 all 1:20230515-r0
linux-firmware-pcie8997 all 1:20230515-r0
linux-firmware-qat all 1:20230515-r0
linux-firmware-qat-license all 1:20230515-r0
linux-firmware-qca all 1:20230515-r0
linux-firmware-qcom-adreno-a2xx all 1:20230515-r0
linux-firmware-qcom-adreno-a3xx all 1:20230515-r0
linux-firmware-qcom-adreno-a4xx all 1:20230515-r0
linux-firmware-qcom-adreno-a530 all 1:20230515-r0
linux-firmware-qcom-adreno-a630 all 1:20230515-r0
linux-firmware-qcom-adreno-a650 all 1:20230515-r0
linux-firmware-qcom-adreno-a660 all 1:20230515-r0
linux-firmware-qcom-apq8096-audio all 1:20230515-r0
linux-firmware-qcom-apq8096-modem all 1:20230515-r0
linux-firmware-qcom-license all 1:20230515-r0
linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno all 1:20230515-r0
linux-firmware-qcom-sc8280xp-lenovo-x13s-audio all 1:20230515-r0
linux-firmware-qcom-sc8280xp-lenovo-x13s-compat all 1:20230515-r0
linux-firmware-qcom-sc8280xp-lenovo-x13s-compute all 1:20230515-r0
linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors all 1:20230515-r0
linux-firmware-qcom-sdm845-audio all 1:20230515-r0
linux-firmware-qcom-sdm845-compute all 1:20230515-r0
linux-firmware-qcom-sdm845-modem all 1:20230515-r0
linux-firmware-qcom-sm8250-audio all 1:20230515-r0
linux-firmware-qcom-sm8250-compute all 1:20230515-r0
linux-firmware-qcom-venus-1.8 all 1:20230515-r0
linux-firmware-qcom-venus-4.2 all 1:20230515-r0
linux-firmware-qcom-venus-5.2 all 1:20230515-r0
linux-firmware-qcom-venus-5.4 all 1:20230515-r0
linux-firmware-qcom-vpu-1.0 all 1:20230515-r0
linux-firmware-qcom-vpu-2.0 all 1:20230515-r0
linux-firmware-qcom-yamato-license all 1:20230515-r0
linux-firmware-radeon all 1:20230515-r0
linux-firmware-radeon-license all 1:20230515-r0
linux-firmware-ralink all 1:20230515-r0
linux-firmware-ralink-license all 1:20230515-r0
linux-firmware-rs9113 all 1:20230515-r0
linux-firmware-rs9116 all 1:20230515-r0
linux-firmware-rtl-license all 1:20230515-r0
linux-firmware-rtl8168 all 1:20230515-r0
linux-firmware-rtl8188 all 1:20230515-r0
linux-firmware-rtl8192ce all 1:20230515-r0
linux-firmware-rtl8192cu all 1:20230515-r0
linux-firmware-rtl8192eu all 1:20230515-r0
linux-firmware-rtl8192su all 1:20230515-r0
linux-firmware-rtl8723 all 1:20230515-r0
linux-firmware-rtl8821 all 1:20230515-r0
linux-firmware-sd8686 all 1:20230515-r0
linux-firmware-sd8688 all 1:20230515-r0
linux-firmware-sd8787 all 1:20230515-r0
linux-firmware-sd8797 all 1:20230515-r0
linux-firmware-sd8801 all 1:20230515-r0
linux-firmware-sd8887 all 1:20230515-r0
linux-firmware-sd8897 all 1:20230515-r0
linux-firmware-sd8997 all 1:20230515-r0
linux-firmware-ti-connectivity-license all 1:20230515-r0
linux-firmware-usb8997 all 1:20230515-r0
linux-firmware-vt6656 all 1:20230515-r0
linux-firmware-vt6656-license all 1:20230515-r0
linux-firmware-whence-license all 1:20230515-r0
linux-firmware-wl12xx all 1:20230515-r0
linux-firmware-wl18xx all 1:20230515-r0
linux-firmware-wlcommon all 1:20230515-r0

Am Di., 25. Juli 2023 um 11:52 Uhr schrieb Alexander Kanavin <
alex.kanavin@gmail.com>:

> On Tue, 25 Jul 2023 at 11:28, Andreas <rehn.andreas86@gmail.com> wrote:
> > i encountered issues with the new poky release on dunfell.
> > explicitly linux-firmware: commit hash
> a04b507d39d668a02b7ebd990c94194cde16bf2f
> >
> > i building dunfell images since 1,5 years and my images are normaly 1,9
> GB big.
> > however since Sunday 23.07, the image size increases by 1GB due to the
> full firmware installation.
> >
> > i double checked it with the previous commit
> 0bf993da8b6e6511a4123ed15421bdd76a4c1f38 and the image size is as expected.
> >
> > i hope someone is able to help, because this is an unexpected behavior.
> >
> > PS: this my first post so please have mercy on me. :)
>
> Can you enable buildhistory as described in
> https://docs.yoctoproject.org/dev/dev-manual/build-quality.html
> then build linux-firmware before and after the change, then run
> buildhistory-diff? That should highlight where the size increase come
> from in its packaging.
>
> You can also manually inspect linux-firmware's ${WORKDIR}/packages-spit/.
>
> Alex
>


Andreas

--00000000000018084806014e7d98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>hey alex,</div><div>thx for have a l=
ook</div><div><br></div>before<br><br>linux-firmware-mt7601u-license<br>lin=
ux-firmware-mt7601u<br>linux-firmware-ralink-license<br>linux-firmware-rali=
nk<br>linux-firmware-rtl8168<br>linux-firmware-rtl8188<br>linux-firmware-rt=
l8192ce<br>linux-firmware-rtl8192cu<br>linux-firmware-rtl8192eu<br>linux-fi=
rmware-rtl8192su<br>linux-firmware-rtl8723<br>linux-firmware-rtl8821<br>lin=
ux-firmware-rtl-license<br>linux-firmware-whence-license<br><br>after<br><b=
r>libz1 aarch64 1.2.11-r0<br>linux-firmware all 1:20230515-r0<br>linux-firm=
ware-adsp-sst all 1:20230515-r0<br>linux-firmware-adsp-sst-license all 1:20=
230515-r0<br>linux-firmware-amlogic-vdec all 1:20230515-r0<br>linux-firmwar=
e-amlogic-vdec-license all 1:20230515-r0<br>linux-firmware-ar3k all 1:20230=
515-r0<br>linux-firmware-ar3k-license all 1:20230515-r0<br>linux-firmware-a=
r9170 all 1:20230515-r0<br>linux-firmware-ath10k all 1:20230515-r0<br>linux=
-firmware-ath10k-license all 1:20230515-r0<br>linux-firmware-ath11k all 1:2=
0230515-r0<br>linux-firmware-ath6k all 1:20230515-r0<br>linux-firmware-ath9=
k all 1:20230515-r0<br>linux-firmware-atheros-license all 1:20230515-r0<br>=
linux-firmware-bcm-0bb4-0306 all 1:20230515-r0<br>linux-firmware-bcm43143 a=
ll 1:20230515-r0<br>linux-firmware-bcm43236b all 1:20230515-r0<br>linux-fir=
mware-bcm43241b0 all 1:20230515-r0<br>linux-firmware-bcm43241b4 all 1:20230=
515-r0<br>linux-firmware-bcm43241b5 all 1:20230515-r0<br>linux-firmware-bcm=
43242a all 1:20230515-r0<br>linux-firmware-bcm4329 all 1:20230515-r0<br>lin=
ux-firmware-bcm4329-fullmac all 1:20230515-r0<br>linux-firmware-bcm4330 all=
 1:20230515-r0<br>linux-firmware-bcm4334 all 1:20230515-r0<br>linux-firmwar=
e-bcm43340 all 1:20230515-r0<br>linux-firmware-bcm4335 all 1:20230515-r0<br=
>linux-firmware-bcm43362 all 1:20230515-r0<br>linux-firmware-bcm4339 all 1:=
20230515-r0<br>linux-firmware-bcm43430 all 1:20230515-r0<br>linux-firmware-=
bcm43430a0 all 1:20230515-r0<br>linux-firmware-bcm43455 all 1:20230515-r0<b=
r>linux-firmware-bcm4350 all 1:20230515-r0<br>linux-firmware-bcm4350c2 all =
1:20230515-r0<br>linux-firmware-bcm4354 all 1:20230515-r0<br>linux-firmware=
-bcm4356 all 1:20230515-r0<br>linux-firmware-bcm4356-pcie all 1:20230515-r0=
<br>linux-firmware-bcm43569 all 1:20230515-r0<br>linux-firmware-bcm43570 al=
l 1:20230515-r0<br>linux-firmware-bcm4358 all 1:20230515-r0<br>linux-firmwa=
re-bcm43602 all 1:20230515-r0<br>linux-firmware-bcm4366b all 1:20230515-r0<=
br>linux-firmware-bcm4366c all 1:20230515-r0<br>linux-firmware-bcm4371 all =
1:20230515-r0<br>linux-firmware-bcm4373 all 1:20230515-r0<br>linux-firmware=
-bcm43xx all 1:20230515-r0<br>linux-firmware-bcm43xx-hdr all 1:20230515-r0<=
br>linux-firmware-bnx2-mips all 1:20230515-r0<br>linux-firmware-broadcom-li=
cense all 1:20230515-r0<br>linux-firmware-carl9170 all 1:20230515-r0<br>lin=
ux-firmware-cypress-license all 1:20230515-r0<br>linux-firmware-gplv2-licen=
se all 1:20230515-r0<br>linux-firmware-i915 all 1:20230515-r0<br>linux-firm=
ware-i915-license all 1:20230515-r0<br>linux-firmware-ibt all 1:20230515-r0=
<br>linux-firmware-ibt-11-5 all 1:20230515-r0<br>linux-firmware-ibt-12-16 a=
ll 1:20230515-r0<br>linux-firmware-ibt-17 all 1:20230515-r0<br>linux-firmwa=
re-ibt-20 all 1:20230515-r0<br>linux-firmware-ibt-hw-37-7 all 1:20230515-r0=
<br>linux-firmware-ibt-hw-37-8 all 1:20230515-r0<br>linux-firmware-ibt-lice=
nse all 1:20230515-r0<br>linux-firmware-ibt-misc all 1:20230515-r0<br>linux=
-firmware-ice all 1:20230515-r0<br>linux-firmware-ice-license all 1:2023051=
5-r0<br>linux-firmware-imx-sdma-imx6q all 1:20230515-r0<br>linux-firmware-i=
mx-sdma-imx7d all 1:20230515-r0<br>linux-firmware-imx-sdma-license all 1:20=
230515-r0<br>linux-firmware-iwlwifi all 1:20230515-r0<br>linux-firmware-iwl=
wifi-135-6 all 1:20230515-r0<br>linux-firmware-iwlwifi-3160-17 all 1:202305=
15-r0<br>linux-firmware-iwlwifi-6000-4 all 1:20230515-r0<br>linux-firmware-=
iwlwifi-6000g2a-6 all 1:20230515-r0<br>linux-firmware-iwlwifi-6000g2b-6 all=
 1:20230515-r0<br>linux-firmware-iwlwifi-6050-5 all 1:20230515-r0<br>linux-=
firmware-iwlwifi-7260 all 1:20230515-r0<br>linux-firmware-iwlwifi-7265 all =
1:20230515-r0<br>linux-firmware-iwlwifi-7265d all 1:20230515-r0<br>linux-fi=
rmware-iwlwifi-8000c all 1:20230515-r0<br>linux-firmware-iwlwifi-8265 all 1=
:20230515-r0<br>linux-firmware-iwlwifi-9000 all 1:20230515-r0<br>linux-firm=
ware-iwlwifi-license all 1:20230515-r0<br>linux-firmware-iwlwifi-misc all 1=
:20230515-r0<br>linux-firmware-license all 1:20230515-r0<br>linux-firmware-=
liquidio all 1:20230515-r0<br>linux-firmware-lontium-license all 1:20230515=
-r0<br>linux-firmware-lt9611uxc all 1:20230515-r0<br>linux-firmware-marvell=
-license all 1:20230515-r0<br>linux-firmware-mt7601u all 1:20230515-r0<br>l=
inux-firmware-mt7601u-license all 1:20230515-r0<br>linux-firmware-netronome=
 all 1:20230515-r0<br>linux-firmware-netronome-license all 1:20230515-r0<br=
>linux-firmware-nvidia-gpu all 1:20230515-r0<br>linux-firmware-nvidia-licen=
se all 1:20230515-r0<br>linux-firmware-nvidia-tegra all 1:20230515-r0<br>li=
nux-firmware-nvidia-tegra-k1 all 1:20230515-r0<br>linux-firmware-pcie8897 a=
ll 1:20230515-r0<br>linux-firmware-pcie8997 all 1:20230515-r0<br>linux-firm=
ware-qat all 1:20230515-r0<br>linux-firmware-qat-license all 1:20230515-r0<=
br>linux-firmware-qca all 1:20230515-r0<br>linux-firmware-qcom-adreno-a2xx =
all 1:20230515-r0<br>linux-firmware-qcom-adreno-a3xx all 1:20230515-r0<br>l=
inux-firmware-qcom-adreno-a4xx all 1:20230515-r0<br>linux-firmware-qcom-adr=
eno-a530 all 1:20230515-r0<br>linux-firmware-qcom-adreno-a630 all 1:2023051=
5-r0<br>linux-firmware-qcom-adreno-a650 all 1:20230515-r0<br>linux-firmware=
-qcom-adreno-a660 all 1:20230515-r0<br>linux-firmware-qcom-apq8096-audio al=
l 1:20230515-r0<br>linux-firmware-qcom-apq8096-modem all 1:20230515-r0<br>l=
inux-firmware-qcom-license all 1:20230515-r0<br>linux-firmware-qcom-sc8280x=
p-lenovo-x13s-adreno all 1:20230515-r0<br>linux-firmware-qcom-sc8280xp-leno=
vo-x13s-audio all 1:20230515-r0<br>linux-firmware-qcom-sc8280xp-lenovo-x13s=
-compat all 1:20230515-r0<br>linux-firmware-qcom-sc8280xp-lenovo-x13s-compu=
te all 1:20230515-r0<br>linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors al=
l 1:20230515-r0<br>linux-firmware-qcom-sdm845-audio all 1:20230515-r0<br>li=
nux-firmware-qcom-sdm845-compute all 1:20230515-r0<br>linux-firmware-qcom-s=
dm845-modem all 1:20230515-r0<br>linux-firmware-qcom-sm8250-audio all 1:202=
30515-r0<br>linux-firmware-qcom-sm8250-compute all 1:20230515-r0<br>linux-f=
irmware-qcom-venus-1.8 all 1:20230515-r0<br>linux-firmware-qcom-venus-4.2 a=
ll 1:20230515-r0<br>linux-firmware-qcom-venus-5.2 all 1:20230515-r0<br>linu=
x-firmware-qcom-venus-5.4 all 1:20230515-r0<br>linux-firmware-qcom-vpu-1.0 =
all 1:20230515-r0<br>linux-firmware-qcom-vpu-2.0 all 1:20230515-r0<br>linux=
-firmware-qcom-yamato-license all 1:20230515-r0<br>linux-firmware-radeon al=
l 1:20230515-r0<br>linux-firmware-radeon-license all 1:20230515-r0<br>linux=
-firmware-ralink all 1:20230515-r0<br>linux-firmware-ralink-license all 1:2=
0230515-r0<br>linux-firmware-rs9113 all 1:20230515-r0<br>linux-firmware-rs9=
116 all 1:20230515-r0<br>linux-firmware-rtl-license all 1:20230515-r0<br>li=
nux-firmware-rtl8168 all 1:20230515-r0<br>linux-firmware-rtl8188 all 1:2023=
0515-r0<br>linux-firmware-rtl8192ce all 1:20230515-r0<br>linux-firmware-rtl=
8192cu all 1:20230515-r0<br>linux-firmware-rtl8192eu all 1:20230515-r0<br>l=
inux-firmware-rtl8192su all 1:20230515-r0<br>linux-firmware-rtl8723 all 1:2=
0230515-r0<br>linux-firmware-rtl8821 all 1:20230515-r0<br>linux-firmware-sd=
8686 all 1:20230515-r0<br>linux-firmware-sd8688 all 1:20230515-r0<br>linux-=
firmware-sd8787 all 1:20230515-r0<br>linux-firmware-sd8797 all 1:20230515-r=
0<br>linux-firmware-sd8801 all 1:20230515-r0<br>linux-firmware-sd8887 all 1=
:20230515-r0<br>linux-firmware-sd8897 all 1:20230515-r0<br>linux-firmware-s=
d8997 all 1:20230515-r0<br>linux-firmware-ti-connectivity-license all 1:202=
30515-r0<br>linux-firmware-usb8997 all 1:20230515-r0<br>linux-firmware-vt66=
56 all 1:20230515-r0<br>linux-firmware-vt6656-license all 1:20230515-r0<br>=
linux-firmware-whence-license all 1:20230515-r0<br>linux-firmware-wl12xx al=
l 1:20230515-r0<br>linux-firmware-wl18xx all 1:20230515-r0<br>linux-firmwar=
e-wlcommon all 1:20230515-r0<br></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Am Di., 25. Juli 2023 um 11:52=C2=A0Uhr sch=
rieb Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.k=
anavin@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Tue, 25 Jul 2023 at 11:28, Andreas &lt;<a href=3D"mailto:rehn=
.andreas86@gmail.com" target=3D"_blank">rehn.andreas86@gmail.com</a>&gt; wr=
ote:<br>
&gt; i encountered issues with the new poky release on dunfell.<br>
&gt; explicitly linux-firmware: commit hash a04b507d39d668a02b7ebd990c94194=
cde16bf2f<br>
&gt;<br>
&gt; i building dunfell images since 1,5 years and my images are normaly 1,=
9 GB big.<br>
&gt; however since Sunday 23.07, the image size increases by 1GB due to the=
 full firmware installation.<br>
&gt;<br>
&gt; i double checked it with the previous commit 0bf993da8b6e6511a4123ed15=
421bdd76a4c1f38 and the image size is as expected.<br>
&gt;<br>
&gt; i hope someone is able to help, because this is an unexpected behavior=
.<br>
&gt;<br>
&gt; PS: this my first post so please have mercy on me. :)<br>
<br>
Can you enable buildhistory as described in<br>
<a href=3D"https://docs.yoctoproject.org/dev/dev-manual/build-quality.html"=
 rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/dev/dev=
-manual/build-quality.html</a><br>
then build linux-firmware before and after the change, then run<br>
buildhistory-diff? That should highlight where the size increase come<br>
from in its packaging.<br>
<br>
You can also manually inspect linux-firmware&#39;s ${WORKDIR}/packages-spit=
/.<br>
<br>
Alex<br>
</blockquote></div><br clear=3D"all"><div><br></div>Andreas<br></div>

--00000000000018084806014e7d98--


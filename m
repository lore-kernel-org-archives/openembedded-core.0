Return-Path: <rsalveti@rsalveti.net>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id AF02B73285
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 May 2017 18:44:18 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id m78so1854534vkf.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 May 2017 11:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rsalveti-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FpCwNRS/C0isR7mS0vViLHw3aj3uieGyBneNioMYW3U=;
	b=W4prqW374f0t7SCUlRH0UrvNbz2BAHb01zsr3YWbcECyRRhJjd/EzE5ekd74ENUfAB
	o1P/RsG+DoCs56Lp1MZ8ZuRrlO3ADblbyUAyhrRggjZjVS2iM5NU7Nt6O74F2Q27lOxM
	kuSxO5HKgQabMocJ7D2y+yWoplX8iYNSOTui62SK5O4W3zJ5wsqHPYuqHJ9K+p1PNbHH
	xMJNp2omq7f+2bnRubftolOXvbgu4bgfntY0GxfxyqgqLQDZ7qUF7qXHtKPIUTQ+PH22
	EtfhHwfeQYbTzqa2FBwWYWbohumxXYMVHomOQg/Hv6gDl5mRAopioIFbND3fPkCcyk8a
	aAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FpCwNRS/C0isR7mS0vViLHw3aj3uieGyBneNioMYW3U=;
	b=ONcru5T7AWZV7LWPaAQ9QHmul3yAiKx6ayZA+TX6tQytdXZDU1Q24thesgVy8+4tm3
	1zYA+M1/mM+0CZwmeNHRQVN6P7iBv11Hq3P7fFrCicZ5t9HxE/+Xhe63j1t8siyDjTKp
	HSY7uu+B3JZIGNR3VmaUOoEwTpBbFVy2fUzXjccnvnAVfvkX8vHa9K/mt4Ksy6WoRWqj
	yHLUN3rQzIoIAsSJYeOp+Tq928yRcbND/fV+s6dJ7ytAT+VVP0DqDb0jCb+nXDS3kvdo
	Vq8XToguXcQCCB8r0gzNJCSBAarUNKDE0qc1Mdxnjgv/7vVzhfTsN33e8onffE4Tc727
	sfIg==
X-Gm-Message-State: AN3rC/4yDGq88pwG10nQ/KstrQwK+eZjfW4OFQ5AcPjmcwinNpybC63G
	Zi/3W9wvl8OeVpAXOUNEfQwMT82/BQ==
X-Received: by 10.31.96.8 with SMTP id u8mr7089714vkb.124.1494096259275; Sat,
	06 May 2017 11:44:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.182.207 with HTTP; Sat, 6 May 2017 11:43:38 -0700 (PDT)
In-Reply-To: <CAMKF1srckZcTgRBDxw8mZ9Sxo=-w26fBbS_BVi0MhpGpAeAOdQ@mail.gmail.com>
References: <1494014554-8069-1-git-send-email-rsalveti@rsalveti.net>
	<CAMKF1srckZcTgRBDxw8mZ9Sxo=-w26fBbS_BVi0MhpGpAeAOdQ@mail.gmail.com>
From: Ricardo Salveti <rsalveti@rsalveti.net>
Date: Sat, 6 May 2017 15:43:38 -0300
Message-ID: <CAHYQr0oniZOLNZqwTk1dhhWzbs5+0ccvZaYuRaMVZZFEViXE5w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-firmware: package Qualcomm QCA firmware
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
X-List-Received-Date: Sat, 06 May 2017 18:44:18 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 5, 2017 at 6:33 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, May 5, 2017 at 4:03 PM Ricardo Salveti <rsalveti@rsalveti.net>
> wrote:
>>
>> Firmware files for the QCA61x4 ROME BT family chips. Firmware shares the
>> same license as used by ath10k.
>>
>> Signed-off-by: Ricardo Salveti <rsalveti@rsalveti.net>
>> ---
>>  meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>> b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>> index be5bdbd..143e8dd 100644
>> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>> @@ -231,7 +231,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
>>               ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330
>> ${PN}-bcm4334 ${PN}-bcm43340 ${PN}-bcm4339 ${PN}-bcm43430 ${PN}-bcm4354 \
>>               ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k \
>>               ${PN}-gplv2-license ${PN}-carl9170 \
>> -             ${PN}-ar3k-license  ${PN}-ar3k  ${PN}-ath10k-license
>> ${PN}-ath10k  \
>> +             ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license
>> ${PN}-ath10k ${PN}-qca \
>>               \
>>               ${PN}-iwlwifi-license ${PN}-iwlwifi \
>>               ${PN}-iwlwifi-135-6 \
>> @@ -292,6 +292,7 @@ LICENSE_${PN}-ar3k = "Firmware-qualcommAthos_ar3k"
>>  LICENSE_${PN}-ar3k-license = "Firmware-qualcommAthos_ar3k"
>>  LICENSE_${PN}-ath10k = "Firmware-qualcommAthos_ath10k"
>>  LICENSE_${PN}-ath10k-license = "Firmware-qualcommAthos_ath10k"
>> +LICENSE_${PN}-qca = "Firmware-qualcommAthos_ath10k"
>
> It seems you are not using this so may be it can be removed ?

It's used just to define the license of the package itself, otherwise
it will use the entire list of licenses available in the recipe itself, like:

diff -Naur a/linux-firmware-qca b/linux-firmware-qca
--- a/linux-firmware-qca    2017-05-05 14:19:25.000000000 -0300
+++ b/linux-firmware-qca     2017-05-06 15:41:31.293203659 -0300
@@ -5,7 +5,7 @@
 PKGE: 1
 PKGV: 0.0+git0+b14134583c
 PKGR: r0
-LICENSE_linux-firmware-qca: Firmware-qualcommAthos_ath10k
+LICENSE:     Firmware-Abilis     & Firmware-adsp_sst     &
Firmware-agere     & Firmware-amdgpu     & Firmware-amd-ucode     &
Firmware-atheros_firmware     & Firmware-atmel     &
Firmware-broadcom_bcm43xx     & Firmware-ca0132     & Firmware-cavium
   & Firmware-chelsio_firmware     & Firmware-cw1200     &
Firmware-dib0700     & Firmware-e100     & Firmware-ene_firmware     &
Firmware-fw_sst_0f28     & Firmware-go7007     & Firmware-GPLv2     &
Firmware-hfi1_firmware     & Firmware-i2400m     & Firmware-i915     &
Firmware-ibt_firmware     & Firmware-it913x     &
Firmware-iwlwifi_firmware     & Firmware-IntcSST2     &
Firmware-kaweth     & Firmware-Marvell     & Firmware-moxa     &
Firmware-myri10ge_firmware     & Firmware-nvidia     & Firmware-OLPC
  & Firmware-ath9k-htc     & Firmware-phanfw     & Firmware-qat     &
Firmware-qla1280     & Firmware-qla2xxx     &
Firmware-qualcommAthos_ar3k     & Firmware-qualcommAthos_ath10k     &
Firmware-r8a779x_usb3     & Firmware-radeon     &
Firmware-ralink_a_mediatek_company_firmware     &
Firmware-ralink-firmware     & Firmware-rtlwifi_firmware     &
Firmware-siano     & Firmware-tda7706-firmware     &
Firmware-ti-connectivity     & Firmware-ti-keystone     &
Firmware-ueagle-atm4-firmware     & Firmware-via_vt6656     &
Firmware-wl1251     & Firmware-xc4000     & Firmware-xc5000     &
Firmware-xc5000c     & WHENCE
 DESCRIPTION: Firmware files for use with Linux kernel.
 SUMMARY: Firmware files for use with Linux kernel
 RDEPENDS_linux-firmware-qca: linux-firmware-ath10k-license

Thanks,
-- 
Ricardo Salveti de Araujo


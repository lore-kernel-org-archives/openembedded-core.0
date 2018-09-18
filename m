Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id EF613796B7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 10:38:28 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 42Dzx1613Vz1qwCZ;
	Tue, 18 Sep 2018 12:38:29 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 42Dzx15mcDz1qr2X;
	Tue, 18 Sep 2018 12:38:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id tkNQrlo0MCUX; Tue, 18 Sep 2018 12:38:29 +0200 (CEST)
X-Auth-Info: 189mea7JHYXz94eK5Rl2q7KX81Gu8RZr43zYxxpvKPM=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 18 Sep 2018 12:38:28 +0200 (CEST)
To: Leon Woestenberg <leon@sidebranch.com>
References: <1536616603-9502-1-git-send-email-leon@sidebranch.com>
	<CAO5Uq5S43E3cXUSEVJP8-dKtuqR-XaqrN+6fhHfy6QESLRh7_w@mail.gmail.com>
	<AB33E724-81C2-43BC-8169-6100CABAA375@sidebranch.com>
	<CAO5Uq5ToXbUR2Pv9PwQOPp-F+5CbwvuPwy84Kfz7HWUzx2ohFA@mail.gmail.com>
	<CAO5Uq5Rws0YP5_y-CSXhKKSrHe1BZiSQsYFQHH9AABFgjKWv=g@mail.gmail.com>
	<4F5C8364-78D3-41EF-B239-B641651A2F64@sidebranch.com>
	<CAO5Uq5TMF-dTZA=dS4QqioRGvycNWeZHC_QWh6FViohLrAy76w@mail.gmail.com>
	<CAMjhiJi9awJ-WVs+Y4V=cqy8JT+qbb=5txQzFVM741inkmzFuQ@mail.gmail.com>
	<d36ea830-9aa0-5e3e-140d-d0e2788175aa@denx.de>
	<CAMjhiJgR1xe_uikpD+07pKDjeBw7er6efV04P3ygMAPfnTUu6w@mail.gmail.com>
	<c2748bb0-22b3-0f25-72e7-519c940e2430@denx.de>
	<CAMjhiJgRa6_z3AGZWKpA7sgtLaa4mYK_-b05-t0aimsDKyo7dg@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <da056905-c114-097d-8dbc-f4a398872933@denx.de>
Date: Tue, 18 Sep 2018 12:35:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMjhiJgRa6_z3AGZWKpA7sgtLaa4mYK_-b05-t0aimsDKyo7dg@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] kernel.bbclass: do not deploy fitImage; kernel-fitimage.bbclass does that.
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
X-List-Received-Date: Tue, 18 Sep 2018 10:38:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/18/2018 12:22 PM, Leon Woestenberg wrote:
> Hi Marek,

Hi,

> On Tue, Sep 18, 2018 at 12:12 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 09/18/2018 12:01 PM, Leon Woestenberg wrote:
>>> Hi Marek,
>> Could you _please_ stop top-posting ?
> 
>  Yes.
> 
>>
>>> one of the issues I saw was that both kernel.bbclass and
>>> kernel-fitImage.bbclass deployed the FIT image into the deploy/images/
>>> subfolder.
>>>
>>> My fix was to make the kernel.bbclass ignore "fitImage" during
>>> deployment. This is also the fix I saw from Xilinx.
>>
>> If I recall correctly, meta-xilinx had their own horribly hacked
>> fitImage bbclass, are you sure it's not interfering here ?
>>
> Yes I am sure it's not.
> 
>>
>>> (Another fix I have pending is that bundled initramfs images (i.e that
>>> go inside the kernel binary) where also seperately packed inside the FIT
>>> image.)
>>
>> Separate initrd is already supported.
> 
> 
> There is no exception for INITRAMFS_IMAGE_BUNDLE in
> kernel-fitimage.bbclass. The initramfs will be packed inside the FIT,
> in addition of also being packed inside the kernel.

So why would you use initramfs_image_bundle with fitImage when you can
pack the initrd into the fitImage instead ?

> My local fix has this:
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass
> b/meta/classes/kernel-fitimage.bbclass
> index a4d7aca..17addab 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -475,7 +475,9 @@ addtask assemble_fitimage before do_install after do_compile
> 
>  do_assemble_fitimage_initramfs() {
>         if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
> -               test -n "${INITRAMFS_IMAGE}" ; then
> +               test -n "${INITRAMFS_IMAGE}" && \
> +               test ! -n "${INITRAMFS_IMAGE_BUNDLE}"; then
> +
>                 cd ${B}
>                 fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its
> fitImage-${INITRAMFS_IMAGE} 1
>         fi
> @@ -483,6 +485,18 @@ do_assemble_fitimage_initramfs() {
> 
>  addtask assemble_fitimage_initramfs before do_deploy after do_install
> 
> +do_assemble_fitimage_bundled_initramfs() {
> +       if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
> +               test -n "${INITRAMFS_IMAGE}" && \
> +               test -n "${INITRAMFS_IMAGE_BUNDLE}"; then
> +
> +               cd ${B}
> +               fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its
> fitImage-${INITRAMFS_IMAGE}
> +       fi
> +}
> +
> +addtask assemble_fitimage_bundled_initramfs before do_deploy after
> do_bundle_initramfs
> +
> 
> 
> Regards,
> 
> Leon.
> 


-- 
Best regards,
Marek Vasut


Return-Path: <leon@sidebranch.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 665C779631
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 10:22:31 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id k14-v6so1412022edr.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 03:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mAXvqSfpWYAIRTPBzDrzxwmGQZv156+wzyZycM+XRO8=;
	b=sOAXCgR+AkQFLTLrqOiJDkSPcvwXvuV9wWlW8h2BlEBtjUcXnVuw0ckBVJKJkAYkHS
	QfjTd/iw7PwKiKdglddG/AkOS9qUZ5UHGNF9vcuUiTM5My8vQZqD7zaIU8JQPUyS69yT
	5OvWk7OloUDSM2s81SfpdT9TtDrm18f6SD5s87dKS2U+OewZUuZtjBNHqqi+vm43G5ZP
	cfMfB++TeJ4NYWvEIuKg+4qnkoY47CwB1JD04iWBNVPxn/BbzrPenx4psA4Ys4lsfPLK
	Q4bY1QiPKE2/avg+OwhpwfAUGq2krZADtkIQeyIJxcUXGhEDCRpiFmWhyigQvloBqyKx
	zPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mAXvqSfpWYAIRTPBzDrzxwmGQZv156+wzyZycM+XRO8=;
	b=LmmX/DncTGO8hv1Deqm1dNDg+Nk3ut8U2oaYKpy8xv8NF9LIxFBFe4+i2u0XqaREcw
	Mky1J+gDXm0FuDnjaOPZdDbevl6FKn9siNDx3Gws40wAaD944/kvG7xZi+fY6ZrMIQnT
	LTz+RUegJk5Cl2tWfXMljbBP5UlyCA/xRerytdtDsSHbiJy/qypiZIthloCwLzAw3xGv
	TaLXzkRd7SwMzR5l+y8Bv8XsxgDtj/bhX2F+Q6XB6iwAMaJwmi97gfnA90w6Zjn6SSGU
	1PLV/b3s0v3gHpPsvFMLvYR36Kdb+hZ7/qZqC/SWNHve0r1KRsutrSQBgbBVuu9//OBk
	+QWQ==
X-Gm-Message-State: APzg51BOpkTafdbwh+xaoOE9vDPPv560WwTGNuIo8wvYbybU7ynDtJ0L
	E0LPMKvUjVHZlkQhNAaPWT2MIjfsSZVVAIUZhSE7Ww==
X-Google-Smtp-Source: ANB0Vdb2wxxedV2oM29uzxztTwFDmDUDNG34JRdGRgeetaDjRTK4jWMWR+6m5s69L4L6Y5RWIjR+pn/427H7hpbRs1I=
X-Received: by 2002:a50:b37a:: with SMTP id
	r55-v6mr50805152edd.145.1537266152086; 
	Tue, 18 Sep 2018 03:22:32 -0700 (PDT)
MIME-Version: 1.0
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
In-Reply-To: <c2748bb0-22b3-0f25-72e7-519c940e2430@denx.de>
From: Leon Woestenberg <leon@sidebranch.com>
Date: Tue, 18 Sep 2018 12:22:22 +0200
Message-ID: <CAMjhiJgRa6_z3AGZWKpA7sgtLaa4mYK_-b05-t0aimsDKyo7dg@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
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
X-List-Received-Date: Tue, 18 Sep 2018 10:22:31 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, Sep 18, 2018 at 12:12 PM Marek Vasut <marex@denx.de> wrote:
>
> On 09/18/2018 12:01 PM, Leon Woestenberg wrote:
> > Hi Marek,
> Could you _please_ stop top-posting ?

 Yes.

>
> > one of the issues I saw was that both kernel.bbclass and
> > kernel-fitImage.bbclass deployed the FIT image into the deploy/images/
> > subfolder.
> >
> > My fix was to make the kernel.bbclass ignore "fitImage" during
> > deployment. This is also the fix I saw from Xilinx.
>
> If I recall correctly, meta-xilinx had their own horribly hacked
> fitImage bbclass, are you sure it's not interfering here ?
>
Yes I am sure it's not.

>
> > (Another fix I have pending is that bundled initramfs images (i.e that
> > go inside the kernel binary) where also seperately packed inside the FIT
> > image.)
>
> Separate initrd is already supported.


There is no exception for INITRAMFS_IMAGE_BUNDLE in
kernel-fitimage.bbclass. The initramfs will be packed inside the FIT,
in addition of also being packed inside the kernel.

My local fix has this:

diff --git a/meta/classes/kernel-fitimage.bbclass
b/meta/classes/kernel-fitimage.bbclass
index a4d7aca..17addab 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -475,7 +475,9 @@ addtask assemble_fitimage before do_install after do_compile

 do_assemble_fitimage_initramfs() {
        if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
-               test -n "${INITRAMFS_IMAGE}" ; then
+               test -n "${INITRAMFS_IMAGE}" && \
+               test ! -n "${INITRAMFS_IMAGE_BUNDLE}"; then
+
                cd ${B}
                fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its
fitImage-${INITRAMFS_IMAGE} 1
        fi
@@ -483,6 +485,18 @@ do_assemble_fitimage_initramfs() {

 addtask assemble_fitimage_initramfs before do_deploy after do_install

+do_assemble_fitimage_bundled_initramfs() {
+       if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
+               test -n "${INITRAMFS_IMAGE}" && \
+               test -n "${INITRAMFS_IMAGE_BUNDLE}"; then
+
+               cd ${B}
+               fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its
fitImage-${INITRAMFS_IMAGE}
+       fi
+}
+
+addtask assemble_fitimage_bundled_initramfs before do_deploy after
do_bundle_initramfs
+


Regards,

Leon.


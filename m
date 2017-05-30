Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1B638781C8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 17:15:35 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id b84so97781190wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 10:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eFu5QVeWJp8quWZ5FgBS0zmEyCp48qxkOt92zmD7SSI=;
	b=lP3wL8zSlJECjSDDZy2Hjdg3O+74NonMhQMO7nmmh0CXQLPugYW1as7yQL/MxdG3Jc
	WpNwNnZrysLKTKN17jUD6297ptwwO1BoZ/CMpJoKMQX/1utWAgTko3WsVoahvGdGslD+
	y5SChoHBFTIVuWoOeYKjJd68rH6mC7lho5GkxAi5CX/E9ZyAfRJOzyiOV92iFSt+QOwo
	/EaGreskodhZMH9QV6FZSLwTTLCSo9iFzcCS6YGxy0cBfRT0sKVfq/QUWWOlnF6zQBPJ
	a2HWEZWgBfq93DznsiPwZgkTBmAWxTJuQZ0XfST7kIlPbYsdWuCHhC5L+bai7qCJBKKs
	w5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eFu5QVeWJp8quWZ5FgBS0zmEyCp48qxkOt92zmD7SSI=;
	b=XbPViTD/cmxBzrb2xXxzPW3DyhsblVXicc7DkjCK4Jn6Usk2N4SxFWkFY9irBmaws9
	uUGOFzFsQhAPvXHunRkTb+8puAyKkDHSHRTbrCPSgstXJKgcfQdc1W258gWE7UTheK0B
	/noKOSRp5lByc91pxV+HTHk5JdyRG2hw0BLXq5DiZySLkh0/WF9LYfIoLwFqt2yC1sei
	cIqPewXmupGXwYf5n5seV1iLPOWV3eMIXy9J2ZA9c38Jh72L967djnVinCr5anKFn2VB
	FEP/AbR0X1ifpjbHEQZ7gcjc/51h1N/S2JyDcq4W9Q+wKyDgTrKMKIoFsfYRtLqdr75B
	Tn4A==
X-Gm-Message-State: AODbwcB9DpRra0uEzi2Gr63fVFgfBIRCZgEn0QLF04yq0YgNwOzFQl+n
	mr5aKXzMDNCB7I/1NM6TEJBT9Z/i5g==
X-Received: by 10.28.74.1 with SMTP id x1mr2610454wma.95.1496164536395; Tue,
	30 May 2017 10:15:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.176.148 with HTTP; Tue, 30 May 2017 10:15:35 -0700 (PDT)
In-Reply-To: <CAP71WjxkYLeEaO5CfUjbEaON=j2pwRkjMDUxkyYafPAEt2qW1w@mail.gmail.com>
References: <CAP71WjxkYLeEaO5CfUjbEaON=j2pwRkjMDUxkyYafPAEt2qW1w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 30 May 2017 10:15:35 -0700
Message-ID: <CAJ86T=VS+ThYpfakL=oHDbDt9ogmoq4E6A95S0YVdxXNxfwRRg@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: KERNEL_IMAGETYPES and Image.gz
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
X-List-Received-Date: Tue, 30 May 2017 17:15:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 29, 2017 at 2:13 PM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> hi,
>
> i am trying to set  KERNEL_IMAGETYPES="Image.gz" in my machine conf
> file. But it doesn't work. I am seeing this error during
> kernel_do_compile():
>
> run.do_compile.30019: cannot open Image: No such file
>
> In fact the code snippet that tries to compress the Image file into
> Image.gz expects the Image file to be in ${B}, but when compiling
> kernel Image is actually in ${B}/arch/arm64/boot:
>
> $ find tmp-rpb-glibc/work/dragonboard_410c-linaro-linux/linux-linaro-qcomlt/
> -name Image
> tmp-rpb-glibc/work/dragonboard_410c-linaro-linux/linux-linaro-qcomlt/4.9-r0/build/arch/arm64/boot/Image
>
> The piece of code in question is in kernel.bbclass:
>
>   gzip -9c < "${typeformake}" > "${KERNEL_OUTPUT_DIR}/${type}"
> It really sounds to me like something obvious is missing, i doubt I
> would be the first one to try Image.gz..

You may be the first to try for a non-MIPS machine.

MIPS is a little special in that the MIPS kernel doesn't support self
extracting compressed kernels (zImage, etc), so MIPS machines are the
most likely to make use of a gzipped vmlinux image (which will then be
decompressed by the bootloader) and KERNEL_IMAGETYPES="vmlinux.gz"
works OK.

If a compressed kernel is required, most non-MIPS machines use a self
extracting image.

> Any thoughts?
>
> thanks
> nico
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


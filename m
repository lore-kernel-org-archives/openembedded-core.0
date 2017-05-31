Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8D22977794
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 04:21:23 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d127so1140065wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 21:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Je1o/Z0+mJUwGbLFv1eddbx6Y9RekLo4vxmEjjnQaUA=;
	b=Q9+kdlplFWAvlwHQp+XlWp/plSNCEbHJwXy7wABWi6F+zwPXxvc+KCyupjWVDj4ZH+
	9METB7ZyhxrVqyma1HfV/HcUtNs6KVIRPEDannWYM4Jh+/jSGwouqadOasKXwqEjBfgI
	ShpCnvvpIMsGhI0X4v8/O4IaysSRa98xCTXsSbj9FPZph/hqW5pXGxC35fyTUn1htDJh
	/Noc6ZtICLhS8WEZa0M8yX5aAwWMQIsouYv+4x7wfr6HJyXdwhwFj6Ftr2cBnGl3Bfd0
	nVqDdCuWYkWwDhnUrMkW1EIbYo5PgHdZh42whdzswePMD7bGAP7HdTMzBxGfjz8X+AOs
	+iJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Je1o/Z0+mJUwGbLFv1eddbx6Y9RekLo4vxmEjjnQaUA=;
	b=Gn2L12+2H+wBuUWRLDAzq1++w5xvyGReADrryZQtWPyFoYD8F7EQMQd4iz6nSsuAIy
	SVBznJkfi160vfFPFXWi/RWKM2KK2Uw3s3+jymccV7BH8OmHTtSzS5ti4qSj68hYBN3r
	DrQrO0Zl38Fmdf5lFKd0tvQyj8v1eiDO9xTLrOd08PX+eMauKrgqJMFittOcC68JZPt6
	TWmk/7SmaGRtXSMz60OiAxzRE2eyst/cjAEHINh+2jIJ0EvHm/PgJdcPb94dztv0tUqO
	FJX8/vc/KDuQl+v4YMJ+7eGMScJhhYwt1MJcAaXB4jDfjXo/aCERS2tG45Bna5Nm5RLB
	ux5w==
X-Gm-Message-State: AODbwcAMcQ1ZcC9+RechLuxU8Bz0gq5IdjFy3IB1lwK2DzeUnQtVN651
	ZWcJ/+RmV+T61SlqA47eBbXP+KPnbsdh
X-Received: by 10.80.137.56 with SMTP id e53mr19519690ede.67.1496204483904;
	Tue, 30 May 2017 21:21:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Tue, 30 May 2017 21:20:53 -0700 (PDT)
In-Reply-To: <CAP9ODKr2pzFF-i5UPch30TZWasYdYzEwTZFgro=Ma-cROdv51w@mail.gmail.com>
References: <20170530171523.37470-1-raj.khem@gmail.com>
	<CAP9ODKr2pzFF-i5UPch30TZWasYdYzEwTZFgro=Ma-cROdv51w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 May 2017 21:20:53 -0700
Message-ID: <CAMKF1sp09ghfm4F2Qf1tfQgZxLV0GQi1_AFTP0ie_sSms+OjoA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] gstreamer1.0-plugins-bad: Fix missing library with bcm egl
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
X-List-Received-Date: Wed, 31 May 2017 04:21:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 30, 2017 at 7:25 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Tue, May 30, 2017 at 2:15 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> userland graphics driver provided libegl for rpi depends upon
>> symbols from vchostif library, therefore add it to linker cmdline
>>
>> helps with loadng gst-gl plugins on rpi
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Has it been send upstream?
>

not yet, there is another patch to userland which needs to be upstreamed
first. http://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi/tree/recipes-graphics/userland/userland/0011-build-shared-library-for-vchostif.patch
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


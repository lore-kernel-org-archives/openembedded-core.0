Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 303CD78242
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 14:48:41 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id v72so2994538ywa.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 07:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=s/xzF9awQUmZ3mueZAxoKLX1Y6mDZNrwTRPlHLaYwbk=;
	b=NWS1dTje9OxAT+P9D3Mr4w4Pb7aDSLRXs2LveazGHSc9GmusPE/HsnB3TsrsdW6YZ3
	QsBLi+G/V5bLcURtTr3/2ZKWnuGauKWh1WzUwB+ZeP5Wbh+4FLJPTY+oK3kJAQT34EBS
	LDwTxnSv05AGJ7U8iFQw6qCG/65D4UlRJsuqtxVwE7Gi4tPl0F7/VcAS//EMt3SDwkil
	+exZNg5xuzsAAy7Rfcq9SC+t36pcbaEfmp9+nKu7GRZiGsbjBFymDLPm6+OLtS8vN+9L
	Y+djpXNfEEHiGegYgVq4VSnfHKvBrpXsUkTOQ5Uf80Bdn2qyh+n4YOpLrSa8kLDshRlY
	iB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=s/xzF9awQUmZ3mueZAxoKLX1Y6mDZNrwTRPlHLaYwbk=;
	b=WHXo4gZQ1+fTeQO2eD5aMQoeJ9Gl+dm8EjgA7MrIH7TMbvmtA5eB6gtnfvqH5Magsj
	Tk26JILg63I/pEo8P2zseAXF2zdGCM/0AhGhkEeo8qRHgJ7zL7yv00jWWzqVaPAHFxf9
	gCk/6YF2FXb7GDky6tGIYDRJsenv2yy7PEsEnYX1sv8zTrPEK82GyFOJUgXfVbSREFmd
	CzaMSxYZ1Euq0dAuZM38I6gWLCSzUL2d5y4mdrs9/q41dY+Ph7lEUU1IduHEhlkWgLED
	cVN1Cp75LRWP1UAfK18WdiNpuoFxjvtdsqiTkap5ATVzLiZGf5Dsr9/WsmNyK0yU+eqk
	U40Q==
X-Gm-Message-State: AHPjjUiKInzxN5tN8ACE11HHItlYJlqkxnlAZpD7I3gYOuCeA+e1tqs6
	+axAAVgeoLAag/XY6QG+Fo+gLtlw
X-Received: by 10.37.203.88 with SMTP id b85mr1778323ybg.24.1506005322812;
	Thu, 21 Sep 2017 07:48:42 -0700 (PDT)
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com.
	[209.85.223.181]) by smtp.gmail.com with ESMTPSA id
	i206sm610239ywg.27.2017.09.21.07.48.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Sep 2017 07:48:41 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f181.google.com with SMTP id m103so11296040iod.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 07:48:41 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCd3hEQWkXX5JwzD0p6gIGrNpKfvvey15dg5Mw4kVpfzIgemLqrvuKh/+DrTzWukzm8Yivy8F4Y+zC4l2rVCRw=
X-Received: by 10.202.76.132 with SMTP id z126mr2482976oia.100.1506005320593; 
	Thu, 21 Sep 2017 07:48:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.66.149 with HTTP; Thu, 21 Sep 2017 07:48:39 -0700 (PDT)
In-Reply-To: <20170921143747.GH30205@bill-the-cat>
References: <20170921135833.11007-1-otavio@ossystems.com.br>
	<20170921143747.GH30205@bill-the-cat>
Date: Thu, 21 Sep 2017 11:48:39 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpzHSkyt7ZdCD2C5WdhbzJ66+CW-Gg9c5i3XkX90yGZSQ@mail.gmail.com>
Message-ID: <CAP9ODKpzHSkyt7ZdCD2C5WdhbzJ66+CW-Gg9c5i3XkX90yGZSQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v9] kernel-devicetree.bbclass: Add support to generate append to kernel
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
X-List-Received-Date: Thu, 21 Sep 2017 14:48:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 21, 2017 at 11:37 AM, Tom Rini <trini@konsulko.com> wrote:
> On Thu, Sep 21, 2017 at 10:58:33AM -0300, Otavio Salvador wrote:
>
>> The are use cases where the Device Tree appended to the kernel is
>> convinient, so we generate the bundle concatenating the kernel (and
>> potentionally the initramfs) and the Device Tree binaries.
>>
>> To enable it, set KERNEL_DEVICETREE_BUNDLE variable to '1'
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> [snip]
>> diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
>> index 72814ca224..6e08be4b70 100644
>> --- a/meta/classes/kernel-devicetree.bbclass
>> +++ b/meta/classes/kernel-devicetree.bbclass
>> @@ -1,6 +1,13 @@
>>  # Support for device tree generation
>> -PACKAGES_append = " kernel-devicetree"
>> +PACKAGES_append = " \
>> +    kernel-devicetree \
>> +    ${@['kernel-image-zimage-bundle', ''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
>> +"
>>  FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMAGEDEST}/*.dtbo"
>> +FILES_kernel-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
>
> Frankly, the most common use case today for still needing to concat the
> dtb to the zImage is for very legacy U-Boot where 'bootz' doesn't exist,
> so we need uImage (which is in turn why we need to patch the kernel
> build process, or manually run mkimage, it must be (zImage + dtb) +
> uImage-header).

There is also the use case of a single binary to boot. We use it in a
customer project and we found it quite useful.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


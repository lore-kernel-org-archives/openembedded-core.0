Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 529E177A8F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 22:38:01 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id f8-v6so13635771ljk.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 15:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Yqz/tdDtduAj/pl5Kafz0nDSGSLov1Epcj9ErI5jVko=;
	b=E/mPlAXI+RgdzJU2Fjp8xESYrQ3BQQRJ6q0ZrLSYVjNUQdOOBCmmC3rA0JzsvIIizs
	oYVEnRPjZCu5FYfH0syIz+gMpT9Rc8BiGIj3echJIaIP3kHIquV4LY6fZhiOf4N6q+xF
	oUGiys6zyDc6soEzpXoDLMYgTSXULIGKXnxoRBi2xeF9g7j9xN6vrOjKXunV1XybqlVr
	VJrjKy7l4o1zrXugVKMtkeKZtTHUzUW5AkTXlCeN2WX11tCyZAFh5eIbD/yRazMzRBJc
	2qCTfY/02AbWyJiFWIB/slCbIVAqwpnG8VVFig2nV1j9txrGzB5fAM4oUteexc8yLa2K
	Qvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Yqz/tdDtduAj/pl5Kafz0nDSGSLov1Epcj9ErI5jVko=;
	b=RUt9iTEjbwlxCw/3adgd6nQX1ARPjBBw5KhFTOaBqtsw1BYepYNFXpcVNWN1dWlGmH
	h1TG6h4sK88j8K+gZ2ipHpHot3ybY3x2GyjussnCqKbI+rTGqcwqJOeOV3Yr8ovzHPSr
	eJ/+VmvqcZzDybOcFo335Ci5CvrkuD1H/773JRuotsPp4nvi00NMPTOvUsJjQrlMqVpw
	onmcHGpsY0BWIfOcv0d+ed4Ee5xThN5mL6OU99aKOSGYb54J5fNZa3i/JIaW7M+r5fNw
	VnYdxu+zGHiT732vBZKMiX442j9+tDpQbCFwIVMrBQZ8iE13i8/9S8cZWuwBEsd4FYSi
	Ig4w==
X-Gm-Message-State: AOUpUlHEfB3w+ZKFA3f4lQjvJ/qAEHCXgw4qke1iBEUDEv7ejr9zZQXm
	wfcu4aVhnhpEHNa0tVvO2meROYdYa3zIA0+oiwc=
X-Google-Smtp-Source: AAOMgpfm8LogmFg2urVCCGfJNeYwMbClm2T+ajmqU7X82ul0s/7RMJgbVeR/ffWOD97HizfSjLWG/dFXAGbayAZgmp4=
X-Received: by 2002:a2e:8185:: with SMTP id
	e5-v6mr11128228ljg.93.1531780681841; 
	Mon, 16 Jul 2018 15:38:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:8749:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 15:37:31
	-0700 (PDT)
In-Reply-To: <CAMKF1sprbtHUg7AB7dAZYWcoBBBNT6=v_Dz0dhAtu8Vem1WDgQ@mail.gmail.com>
References: <20180716210731.22173-1-alistair.francis@wdc.com>
	<CAMKF1sprbtHUg7AB7dAZYWcoBBBNT6=v_Dz0dhAtu8Vem1WDgQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jul 2018 15:37:31 -0700
Message-ID: <CAKmqyKMrbGuXB1iuHnbYiG1=j5Tszg8RbScM9H4oqCBcawYG7A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ndctl: Add the NDCTL package
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
X-List-Received-Date: Mon, 16 Jul 2018 22:38:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 16, 2018 at 2:20 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>
> On Mon, Jul 16, 2018 at 2:07 PM Alistair Francis <alistair.francis@wdc.com>
> wrote:
>>
>> Add the NDCTL package (the libnvdimm utility library). This is based
>> on the work from the meta-luv layer with a version bump.
>
>
> I am not sure if it is a core candidate as yet
> We can accept it into meta-oe and if it get useful for multiple
> architectures later we can propose it into oe-core

Ok, resubmitted to meta-oe.

Alistair

>
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  meta/recipes-core/ndctl/ndctl_git.bb | 34 ++++++++++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>  create mode 100644 meta/recipes-core/ndctl/ndctl_git.bb
>>
>> diff --git a/meta/recipes-core/ndctl/ndctl_git.bb
>> b/meta/recipes-core/ndctl/ndctl_git.bb
>> new file mode 100644
>> index 0000000000..3bf54e74bf
>> --- /dev/null
>> +++ b/meta/recipes-core/ndctl/ndctl_git.bb
>> @@ -0,0 +1,34 @@
>> +SUMMARY = "libnvdimm utility library"
>> +DESCRIPTION = "Utility library for managing the libnvdimm \
>> +(non-volatile memory device) sub-system in the Linux kernel. \
>> +The LIBNVDIMM subsystem provides support for three types of \
>> +NVDIMMs, namely,PMEM, BLK, and NVDIMM devices that can \
>> +simultaneously support both PMEM and BLK mode access."
>> +HOMEPAGE =
>> "https://git.kernel.org/cgit/linux/kernel/git/nvdimm/nvdimm.git/tree/Documentation/nvdimm/nvdimm.txt?h=libnvdimm-for-next"
>> +LICENSE = "GPLv2+"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=e66651809cac5da60c8b80e9e4e79e08"
>> +
>> +inherit autotools-brokensep pkgconfig module-base
>> +
>> +SRCREV = "0d6aeeabec9d271e08c12e4cf679b59946e20156"
>> +SRC_URI = "git://github.com/pmem/ndctl.git"
>> +
>> +DEPENDS = "virtual/kernel kmod udev json-c"
>> +
>> +PV = "v61+git${SRCPV}"
>> +S = "${WORKDIR}/git"
>> +
>> +EXTRA_OECONF += "--enable-test --enable-destructive --disable-docs"
>> +
>> +do_configure_prepend() {
>> +    ${S}/autogen.sh
>> +}
>> +
>> +do_install_append() {
>> +        install -d ${D}${bindir}
>> +        install -m 755 ${WORKDIR}/ndctl_runner ${D}${bindir}
>> +}
>> +
>> +COMPATIBLE_HOST='(x86_64).*'
>> +
>> +FILES_${PN} += "/usr/share/bash-completion/completions/ndctl"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


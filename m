Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 44C046FEF6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 14:05:20 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id j2so21085246qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 07:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jNko6iW79RIfLnAVCj/EsH+T3QmQ5vCdEtuEbkKDb+I=;
	b=QYJrZW1/9cBz0wr+tZShBF8bxtIIHxt24mJhb8eSOZMBUFPfIkCi5dsUDf6vwXRo3z
	VUShZ1PkK5/3sQRmUAFaL8RvVbzgtb0Krgc9ES2Ywc4RI8j8fJPQ3eeqplptkHXt44Cp
	5tXcAXVd8f0ZlzBUqrQ0KEX/pmB0Kcry4jSxfCHMMyDF67MdxHHSNsvKjfFlkBRWDz/f
	PLGxWLqnq8kMal3RifkEYOkuwUEoRADCi690HIAD8YfxEGs0be5aYzVHC4I2lBZKdsRq
	ZFjIvJz0dlLNLVxakaAxgGFJ+JVmfUUUc6v3u8IBrXdNPnPdzumYhrWcfEmepBICq0Iu
	12jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jNko6iW79RIfLnAVCj/EsH+T3QmQ5vCdEtuEbkKDb+I=;
	b=MCC5oykvWuuGcGcY78ebvTYZGIhLdwdzK66HlGxvktymlG13lE4SdOf7ffnfWIKveC
	Ju4ITwvgaoErXkxehxTZI47gHsSk0R0Jb+LMTp1qgoNauuhHr9EQPtYVTmgBEFHgXJ4F
	9nNwH6hEtvG1+fFuJkoD5GFVVB1Ee4eAbdABRrvjHta/qD9EXJmoUAf0fWaGRvrkQvG+
	mbbFwkAF1ykeWRspV5l8mwdZNOYkhuGdjfxM2qn7F6cFqbfuHm0k41FvjcErVLOeZe1l
	2wGJujXi3ZXxmjxUUCh+l+nOzIP4HIgjYtv/PdfySwSQARZnGO64rA0yzeFVRPC5Fhzj
	Jq4A==
X-Gm-Message-State: ALyK8tI16b0ksXgkJERr2fMJvtExl+EzC86HQ/jdFonKpNuEKnOTQ3jlJTCLJ2Z7xV+u5WHdA7pTOC4O2IOpKw==
X-Received: by 10.55.39.141 with SMTP id n135mr5227695qkn.149.1466777121584;
	Fri, 24 Jun 2016 07:05:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Fri, 24 Jun 2016 07:04:52 -0700 (PDT)
In-Reply-To: <576CD0F6.2050408@windriver.com>
References: <1458264628.9397.10.camel@intel.com>
	<576CD0F6.2050408@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Jun 2016 07:04:52 -0700
Message-ID: <CAMKF1sorf1ALWRyUj=CPG5be=gdC1Zw8=2H9Ef-QWg4OTJTrPg@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] grub: add -Wno-error=trampolines to native CFLAGS
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
X-List-Received-Date: Fri, 24 Jun 2016 14:05:24 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 23, 2016 at 11:19 PM, ChenQi <Qi.Chen@windriver.com> wrote:
> Hi,
>
> Is the error still there for gcc6 without this option for CFLAGS?
> The problem is that gcc on some old hosts don't support this option.

how old is the host. We should start recommending minimum required GCC
version on build host.
Sometimes a newer gcc is available for older distros too as alternative package.

>
> Best Regards,
> Chen Qi
>
> On 03/18/2016 09:30 AM, Randle, William C wrote:
>>
>> Previous patch was not against master. Updated against master branch.
>>
>> Fixes YOCTO 9201
>> Adds -Wno-error=trampolines to native CFLAGS prevent multiple compile
>> errors when using gcc 5.3.0 for gentoo.
>>
>> Signed-off-by: Bill Randle <william.c.randle@intel.com>
>> ---
>>   meta/recipes-bsp/grub/grub-efi_2.00.bb | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb
>> b/meta/recipes-bsp/grub/grub-efi_2.00.bb
>> index 4e80e18..ca73234 100644
>> --- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
>> +++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
>> @@ -35,6 +35,10 @@ EXTRA_OECONF = "--with-platform=efi
>> --disable-grub-mkfont \
>>     EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile',
>> '--enable-largefile ac_cv_sizeof_off_t=8', '--disable-largefile', d)}"
>>   +# ldm.c:114:7: error: trampoline generated for nested function 'hook'
>> [-Werror=trampolines]
>> +# and many other places in the grub code when compiled with some native
>> gcc 5.3 compilers
>> +CFLAGS_append_class-native = " -Wno-error=trampolines"
>> +
>>   do_install_class-native() {
>>      install -d ${D}${bindir}
>>      install -m 755 grub-mkimage ${D}${bindir}
>> --
>> 2.5.0
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


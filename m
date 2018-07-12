Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8D05578421
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 17:22:22 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id v71-v6so7824786itb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 10:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=zEFy2YJZo2JMIdRe3rfwB8Uh4VkgBw6ikI6WEOF1ErU=;
	b=WzX97omK87eSaR1py7y8R+BQWVn7q76V00TQ25QHQyhTrCwKbngmAbCh1wOKYlnZwc
	L5UF7QCl0Nw8+8178pfJnENjZDxaZ3PGD0U6pwmTojEDH/q+NOjkbC6UBG1J2IKzWbt4
	ELBtlYYK5qNGsZej6SXml9jtR77dYdSdbzXG9c5Mytqt/+BhLsSsB6vPgUiQAL3BEpsf
	FYNGVhX3pgIPMOkjyevzzVgoWDlW+9CZu/Rv8KEij4rGeehWBZJsjYeCZzN6zrZS3ngu
	tVS67FT5Xw1zdGetVLZ9+C3A8K+ibl5VkYmyKod3Iz81P1/V3XZ2/YxqrziCKYApZ2eI
	zDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=zEFy2YJZo2JMIdRe3rfwB8Uh4VkgBw6ikI6WEOF1ErU=;
	b=UDGIeIFCkfIpCcZ4frrR74g5vxuBPsgc+2qPJvcPHiX3etZJ6XZ6bs6ZBMhmwfItvp
	zSWqeZksN/+rdK2tMm3qCa1EO8uHf+oLAJsYa16CmWsnZ3ENiboxE1X/Qfl5bywBYPih
	tMvwZ/BiO5bdr8jYF6xkltj5+lmiDXyn33C++EfnXebdmj2bMF/B+fNPDBPuGaXApvkw
	Fbghec3KU17GlasHq1kN0gDJC8UYpKA0nPWvsKM6NQXMRLrHBb+UphrKJrTZVNfiJcPH
	h4FBiqH2QTBmgcI/Ud0a3JRacmfqP7FoOdVcIhQfsV5W/xoWliFDa0637whfjDszxY+t
	lDXw==
X-Gm-Message-State: AOUpUlHsACfknJ4ZuR4Bh065LikY8+x3L+ZBAwzbtJJW2YbJJbswzqB8
	tDZ/6yLAt3aXvlAYSpVTm6mC/gw2
X-Google-Smtp-Source: AAOMgpeQA30fJBtUb93iCPxwv8EkwL12XeCJ08hAI9S1kJjCkL0wr467ZY0+B3V1wBU8/RlUb57ipw==
X-Received: by 2002:a24:4a15:: with SMTP id
	k21-v6mr2109673itb.128.1531416143104; 
	Thu, 12 Jul 2018 10:22:23 -0700 (PDT)
Received: from [10.252.231.15] ([192.160.73.22])
	by smtp.gmail.com with ESMTPSA id
	a7-v6sm1852346ioc.25.2018.07.12.10.22.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jul 2018 10:22:22 -0700 (PDT)
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1531151586-30557-1-git-send-email-bruce.ashfield@windriver.com>
	<8e3f9ec13333061ecb0125e153df668abe8da1b9.camel@linuxfoundation.org>
	<47b99eac-867c-9cca-ac43-4d5a06760ed3@windriver.com>
	<c0baf80e5943135f4f65a93d849ee68419065c45.camel@linuxfoundation.org>
	<dee40069-d36a-2b70-56f6-5b52f3c1e7c4@windriver.com>
	<f7a60084dfdcbe937ad60021adb1fa6bec88eeff.camel@linuxfoundation.org>
	<d56fb567-09bd-2c35-28c0-00807a4a2f2d@windriver.com>
	<a443bc36-036f-89d2-be6b-b0a5d2d31d98@gmail.com>
	<bb435abc-76fe-a4f7-6b1a-75b1d41549ed@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <b61d4c26-7024-6090-5c72-37d040c6f5de@gmail.com>
Date: Thu, 12 Jul 2018 11:22:17 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <bb435abc-76fe-a4f7-6b1a-75b1d41549ed@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Thu, 12 Jul 2018 17:22:22 -0000
X-Groupsio-MsgNum: 113449
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="ZkVaNQKxAi59ca7L9xSSLGrygz84xaSS0"

--ZkVaNQKxAi59ca7L9xSSLGrygz84xaSS0
Content-Type: multipart/mixed; boundary="ZNe0jtdg5fOCrYa6QYNIKCzYHbiDLVfJB";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <b61d4c26-7024-6090-5c72-37d040c6f5de@gmail.com>
Subject: Re: [OE-core] [PATCH v2] kernel-devsrc: restructure for out of tree
 (and on target) module builds
References: <1531151586-30557-1-git-send-email-bruce.ashfield@windriver.com>
 <8e3f9ec13333061ecb0125e153df668abe8da1b9.camel@linuxfoundation.org>
 <47b99eac-867c-9cca-ac43-4d5a06760ed3@windriver.com>
 <c0baf80e5943135f4f65a93d849ee68419065c45.camel@linuxfoundation.org>
 <dee40069-d36a-2b70-56f6-5b52f3c1e7c4@windriver.com>
 <f7a60084dfdcbe937ad60021adb1fa6bec88eeff.camel@linuxfoundation.org>
 <d56fb567-09bd-2c35-28c0-00807a4a2f2d@windriver.com>
 <a443bc36-036f-89d2-be6b-b0a5d2d31d98@gmail.com>
 <bb435abc-76fe-a4f7-6b1a-75b1d41549ed@windriver.com>
In-Reply-To: <bb435abc-76fe-a4f7-6b1a-75b1d41549ed@windriver.com>

--ZNe0jtdg5fOCrYa6QYNIKCzYHbiDLVfJB
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/12/18 11:07 AM, Bruce Ashfield wrote:
> On 2018-07-12 1:02 PM, Khem Raj wrote:
>> On 7/12/18 7:55 AM, Bruce Ashfield wrote:
>>> On 2018-07-12 9:53 AM, Richard Purdie wrote:
>>>> On Thu, 2018-07-12 at 09:49 -0400, Bruce Ashfield wrote:
>>>>> On 2018-07-10 5:41 PM, Richard Purdie wrote:
>>>>>> On Tue, 2018-07-10 at 12:38 -0400, Bruce Ashfield wrote:
>>>>>>> On 07/10/2018 06:21 AM, Richard Purdie wrote:
>>>>>>>> On Mon, 2018-07-09 at 11:53 -0400, Bruce Ashfield wrote:
>>>>>>>
>>>>>>> I'll try the other configs, but clearly I have something
>>>>>>> different in
>>>>>>> my x86-64 build.
>>>>>>>
>>>>>>> I can't run the self tests directly, but am copying the files
>>>>>>> onto my
>>>>>>> qemu session and running things myself:
>>>>>>>
>>>>>>> root@qemux86-64:/lib/modules/4.14.48-yocto-standard/build# make
>>>>>>> ARCH=3Dx86
>>>>>>> scripts prepare
>>>>>>> Makefile:950: "Cannot use CONFIG_STACK_VALIDATION=3Dy, please
>>>>>>> install
>>>>>>> libelf-dev, libelf-devel or elfutils-libelf-devel"
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CHK=C2=A0=C2=A0=C2=A0=C2=A0 script=
s/mod/devicetable-offsets.h
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYSTBL=C2=A0 arch/x86/include/gene=
rated/asm/syscalls_32.h
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYSHDR=C2=A0 arch/x86/include/gene=
rated/asm/unistd_32_ia32.h
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYSHDR=C2=A0 arch/x86/include/gene=
rated/asm/unistd_64_x32.h
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYSTBL=C2=A0 arch/x86/include/gene=
rated/asm/syscalls_64.h
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYSHDR=C2=A0 arch/x86/include/gene=
rated/uapi/asm/unistd_32.h
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYSHDR=C2=A0 arch/x86/include/gene=
rated/uapi/asm/unistd_64.h
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYSHDR=C2=A0 arch/x86/include/gene=
rated/uapi/asm/unistd_x32.h
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HOSTCC=C2=A0 arch/x86/tools/relocs=
_32.o
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HOSTCC=C2=A0 arch/x86/tools/relocs=
_64.o
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HOSTCC=C2=A0 arch/x86/tools/relocs=
_common.o
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HOSTLD=C2=A0 arch/x86/tools/relocs=

>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CHK=C2=A0=C2=A0=C2=A0=C2=A0 includ=
e/config/kernel.release
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CHK=C2=A0=C2=A0=C2=A0=C2=A0 includ=
e/generated/uapi/linux/version.h
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CHK=C2=A0=C2=A0=C2=A0=C2=A0 includ=
e/generated/utsrelease.h
>>>>>>> Makefile:950: "Cannot use CONFIG_STACK_VALIDATION=3Dy, please
>>>>>>> install
>>>>>>> libelf-dev, libelf-devel or elfutils-libelf-devel"
>>>>>>>
>>>>>>> root@qemux86-64:/tmp# make
>>>>>>> make -C /usr/src/kernel M=3D/tmp modules
>>>>>>> make[1]: Entering directory '/lib/modules/4.14.48-yocto-
>>>>>>> standard/build'
>>>>>>> Makefile:950: "Cannot use CONFIG_STACK_VALIDATION=3Dy, please
>>>>>>> install
>>>>>>> libelf-dev, libelf-devel or elfutils-libelf-devel"
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Building modules, stage 2.
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MODPOST 1 modules
>>>>>>> make[1]: Leaving directory '/lib/modules/4.14.48-yocto-
>>>>>>> standard/build'
>>>>>>> root@qemux86-64:/tmp# insmod hellomod.ko
>>>>>>> [=C2=A0 419.211616] hellomod: loading out-of-tree module taints
>>>>>>> kernel.
>>>>>>> [=C2=A0 419.212586] Hello world!
>>>>>>>
>>>>>>> This is on the core-image-kernel-dev image, which is the one that=

>>>>>>> I created to test all this.
>>>>>>>
>>>>>>> What image is that using ? some sato sdk one ?
>>>>>>
>>>>>> We really need to find you a way to run these. The problem is the
>>>>>> qemu
>>>>>> graphics piece? You can't have a dummy vncserver or something to
>>>>>> direct
>>>>>> them at?
>>>>>>
>>>>>> The image is a core-image-sato-sdk...
>>>>>
>>>>> I was able to trigger the objtool issue with this image, looking at=

>>>>> fixing it and the other arches now.
>>>>
>>>> Since its image related, is it a missing package dependency? Just
>>>> curious why its happening with some images but not your test ones...=

>>>
>>> It is. I have extra toolchain elements being installed in
>>> core-image-kernel-dev
>>> that hold things together (i.e. the kernel's objtool doesn't need to
>>> be built).
>>>
>>> The obvious fix is to just add an RDEPENDS, but I'm being stubborn
>>> and trying to make it build on target, since the build of objtool fro=
m
>>> the kernel source is showing me some sort of include path issue that
>>> I'd like to sort out:
>>>
>>> =C2=A0=C2=A0 CC /lib/modules/4.14.48-yocto-standard/build/tools/objto=
ol/exec-cmd.o
>>> exec-cmd.c: In function 'get_pwd_cwd':
>>> exec-cmd.c:49:4: error: implicit declaration of function 'strlcpy'; d=
id
>>> you mean 'strncpy'? [-Werror=3Dimplicit-function-declaration]
>>> =C2=A0=C2=A0=C2=A0=C2=A0 strlcpy(cwd, pwd, PATH_MAX);
>>> =C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~
>>> =C2=A0=C2=A0=C2=A0=C2=A0 strncpy
>>> exec-cmd.c:49:4: error: nested extern declaration of 'strlcpy'
>>> [-Werror=3Dnested-externs]
>>> cc1: all warnings being treated as errors
>>>
>>
>> Kernel has this function defined in tools/include/linux/string.h so
>>
>=20
> Well yes, a grep locates that :D
>=20
>=20
>> however it has it like this
>>
>> #if defined(__GLIBC__) && !defined(__UCLIBC__)
>> extern size_t strlcpy(char *dest, const char *src, size_t size);
>> #endif
>>
>> Which means it will not work for musl and we need to ensure that we
>> use -D_GNU_SOURCE for it to be included from standard musl headers
>=20
> I've never built or supported musl, and since this is using the
> in kernel Makefiles, etc, it isn't something I can patch or fix
> outside of linux-yocto.
>=20
> I'm just worried about the glibc cases, we can do follow up patches
> later.
>=20
you dont have to defer since you are already touching this area you
might very well address this too.
Once the -I path is figured out. All we need is ensure -D_GNU_SOURCE is
added to CFLAGS in same place.

> Bruce
>=20
>>
>>
>>> Cheers,
>>>
>>> Bruce
>>>
>>>>
>>>> Cheers,
>>>>
>>>> Richard
>>>>
>>>
>>
>>
>=20



--ZNe0jtdg5fOCrYa6QYNIKCzYHbiDLVfJB--

--ZkVaNQKxAi59ca7L9xSSLGrygz84xaSS0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCW0eOSQAKCRC7BTNVkZ0z
FIcWAJ0d53ld+MShd7Xoz0M9HVj5W48XFACeLl9/gHFRWk+AjZq9V1OTcZgvYGw=
=15It
-----END PGP SIGNATURE-----

--ZkVaNQKxAi59ca7L9xSSLGrygz84xaSS0--

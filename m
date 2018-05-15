Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1809274D7F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 19:23:40 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id f3-v6so913856uan.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 12:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=NkCabKwf7Bhz/i7KNauCRwY5++lU0Z5QhRJgQ2AudJQ=;
	b=pPyJMwJXf2Xlr5zgcnI8s5f0hP6obQB1dlrkwdhnM2n2APuLv8UQS8byQvt+ikR0rW
	XDhnl6CpSfyncotYur5YP0impcV4sLAtHVPbhJxZBdjKVD4KtGeutAysNAEwCjkIeInF
	EB7HsPiHkWgbaaZ/qfmXRJWlnW61M0ljDtQ6ZaX4OkiI7sgEyP3JKQ1pihWYVzwf2qP+
	2nkB6soGkm+ZKCpBCukTUyxZkSwAhhXH/sX3gGBext8uZxKKIj4kkGzNpROWMwkVtiFu
	9rvC0jwD5QDqmI9UmgNafqM6+bPxPsxIP82Ydh8p4Z81J6sarwl1IfiTll8HA0yLQ3Eg
	iLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=NkCabKwf7Bhz/i7KNauCRwY5++lU0Z5QhRJgQ2AudJQ=;
	b=Atx7cH/C84A6GRhW/N8W+/P5UGxzEI0c5oPwhAGUi8SouiAdzmMOWEApNqQ7LrKGXy
	lQ2TxIKfiudmBepkWKYXVTkDFm3iuOBQYkXYNzps5nQWzzRQ8H8nlJt3jOB7eIeU7BlZ
	lQ8Y50ENqNPrv61VtE8rjkqi688F3T2ma9ulGMtDdx/IDJ9pTTt8OjXCe40x0HabAhoW
	GPVZJC1yzPbyUXf4RHX5S4C+so3Tg5pUPHmea37nlQo06Q0iq7Ja51ZD6dokXhPu4Wrp
	/jbknnczLzwGnQGx/khOEM+OofPuGzOrYFATOXfGpaSia9pgBeTKKZh/eQE9+l2F95PI
	PWoQ==
X-Gm-Message-State: ALKqPwfYOJEnO3JZDu9znhCaikaWai0YezwU0ygSlQHtMsmNi2B/Fso3
	KBY2bhcF+QVLQR0UJb5w2I+9vhmx9RHsxy6oKcs=
X-Google-Smtp-Source: AB8JxZo86Tc/MNYP08lCp5zrAraD0LuiJntwrKNXlmNCkqCfjJwUxmPd/MTsfMpmzaj++0v+Vta9+ypcPHbLpMLLbFY=
X-Received: by 2002:ab0:2054:: with SMTP id
	g20-v6mr18232920ual.150.1526412221635; 
	Tue, 15 May 2018 12:23:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.48.148 with HTTP; Tue, 15 May 2018 12:23:41 -0700 (PDT)
In-Reply-To: <CAJTo0LZ5-2Bubqj4xu8tGXvxm1SataL5gXyfRudZn_d+0e+JnQ@mail.gmail.com>
References: <1526337230-25723-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LZ5-2Bubqj4xu8tGXvxm1SataL5gXyfRudZn_d+0e+JnQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 15 May 2018 12:23:41 -0700
Message-ID: <CAJ86T=WH0ZDhLpWpoVndJ-gCXafgsAMTUGsjp_sb3mfsooP-Cw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel.bbclass: avoid duplicates in KERNEL_IMAGETYPE_FOR_MAKE
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
X-List-Received-Date: Tue, 15 May 2018 19:23:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 15, 2018 at 6:48 AM, Burton, Ross <ross.burton@intel.com> wrote=
:
> Hi Andre,
>
> The autobuilder is failing in mips64 builds and I suspect this patch
> is to blame.  For example
> https://autobuilder.yocto.io/builders/nightly-mips64/builds/1001.

Yes.

  $ bitbake-diffsigs ... ...
  basehash changed from 4c73c2d1e35cbb6229786c026945a8b7 to
1fc1b817a40ff6510533d3a3f3c06492
  Variable KERNEL_IMAGETYPE_FOR_MAKE value changed:
  "[-vmlinux.bin-] vmlinux {+vmlinux.bin+}"

I've sent a v3.

> Ross
>
> On 14 May 2018 at 23:33, Andre McCurdy <armccurdy@gmail.com> wrote:
>> Currently if KERNEL_IMAGETYPES contains both vmlinux and vmlinux.gz,
>> KERNEL_IMAGETYPE_FOR_MAKE will end up containing two copies of
>> vmlinux, which will result in two calls to "make vmlinux" from
>> kernel_do_compile().
>>
>> Avoid duplicating vmlinux in KERNEL_IMAGETYPE_FOR_MAKE plus some
>> minor non-functional updates to formatting and comments.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  v2: refresh + make typeformake a set based on suggestion from Martin Hu=
ndeb=C3=B8ll
>>
>>  meta/classes/kernel.bbclass | 28 ++++++++++++++++------------
>>  1 file changed, 16 insertions(+), 12 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 6595a04..68d2185 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -62,32 +62,36 @@ python __anonymous () {
>>      type =3D d.getVar('KERNEL_IMAGETYPE') or ""
>>      alttype =3D d.getVar('KERNEL_ALT_IMAGETYPE') or ""
>>      types =3D d.getVar('KERNEL_IMAGETYPES') or ""
>> -    kname =3D d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
>>      if type not in types.split():
>>          types =3D (type + ' ' + types).strip()
>>      if alttype not in types.split():
>>          types =3D (alttype + ' ' + types).strip()
>>      d.setVar('KERNEL_IMAGETYPES', types)
>>
>> +    # KERNEL_IMAGETYPES may contain a mixture of image types supported =
directly
>> +    # by the kernel build system and types which are created by post-pr=
ocessing
>> +    # the output of the kernel build system (e.g. compressing vmlinux -=
>
>> +    # vmlinux.gz in kernel_do_compile()).
>> +    # KERNEL_IMAGETYPE_FOR_MAKE should contain only image types support=
ed
>> +    # directly by the kernel build system.
>>      if not d.getVar('KERNEL_IMAGETYPE_FOR_MAKE'):
>> -        # some commonly used kernel images aren't generated by the kern=
el build system, such as vmlinux.gz
>> -        # typeformake lists only valid kernel make targets, and post pr=
ocessing can be done after the kernel
>> -        # is built (such as using gzip to compress vmlinux)
>> -        typeformake =3D types.replace('vmlinux.gz', 'vmlinux')
>> -        d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
>> +        typeformake =3D set()
>> +        for type in types.split():
>> +            if type =3D=3D 'vmlinux.gz':
>> +                type =3D 'vmlinux'
>> +            typeformake.add(type)
>> +
>> +        d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', ' '.join(typeformake))
>> +
>> +    kname =3D d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
>> +    imagedest =3D d.getVar('KERNEL_IMAGEDEST')
>>
>>      for type in types.split():
>>          typelower =3D type.lower()
>> -        imagedest =3D d.getVar('KERNEL_IMAGEDEST')
>> -
>>          d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
>> -
>>          d.setVar('FILES_' + kname + '-image-' + typelower, '/' + imaged=
est + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + typ=
e)
>> -
>>          d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' % (knam=
e, typelower))
>> -
>>          d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-%s-${=
KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>> -
>>          d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
>>
>>      image =3D d.getVar('INITRAMFS_IMAGE')
>> --
>> 1.9.1
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>


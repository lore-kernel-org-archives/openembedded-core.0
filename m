Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3AA8371C3D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 03:46:20 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 64so2366172wme.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 19:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1CtwDFivkViyPKEpHjgZS0T5PlVzsHN+g1SILF7hR0w=;
	b=GQ+erOsSKBQDs1FTFdcjqCdCzcRF+F+LHVkgy9AIZQaJyr5OQ0i8R8Zmtep8QNuNGk
	/nLn+CVr03nP5powotNm8UjpJlSkhjOUBDbu4jjCUlfn1jytXL4ndai2XR1pVj2NEc4B
	XELxGTfzOrNqbCA+kSreum4xLf/+auylxChvNlaqQPasQB5ByVTANjOS4ALy9oU9d/Y3
	B3my5JLjjC6gEv5YLKMytK1nZyTTpHBiqGCpKKafFqAH3QyvF5Fkt5rLLLrgQdtiCtD2
	BAAz/7ASuH5N4MPObaQ6yW1eOsxXMyZQANVNOySDuk4+m6nV+ueUf4FxbYRzSl5J9+da
	3RVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1CtwDFivkViyPKEpHjgZS0T5PlVzsHN+g1SILF7hR0w=;
	b=pq1ZpBRlhAjqMxmzjYtTf5LzjPlkr0+FlYN+3TsBIx+agxGXTJ+Y3ko6bAioUgEyiv
	7TtchS8s86Q/sA4yMTrQVrGrMorzlaBkDxcuC5rESBif51cLOEPUarEh9EcQaEiGy/MK
	u2l/sEQSRyLX5H0Yx3rCuaRSgoEo2DjLqPCR71O1W5yp5mwizjsajzzwKbTInpFIUf1M
	5LLczb786k4EX23PRxm8SZjRSWOaY9BBLDqlJyx6cnL3TSWuPSoGOEvCnyP/QvchvjVh
	4LrPXcTm3qhyglo+txcY2Sd+Y7zjsAy+YjfqW7ZUXzpzJt7UdEh9keeQNHvo0+NG9zOA
	tn6w==
X-Gm-Message-State: AKGB3mL6+QW4k9MXLVnxWUpy0eC65axHHqIUxR5pqOm2++1oM//ueeRV
	BVAQ/crcS56S9iRLGEq+kBrnnvVnE17MIU6Ec/Q=
X-Google-Smtp-Source: ACJfBouYfok0pTm0HVaUiO7LZQYc4HdPEl9Y54mZHh2wL8wwAChtpRqYbuSdWzUUapmQMu8sijMcb9jw5p+u4pGlHT0=
X-Received: by 10.28.199.75 with SMTP id x72mr609682wmf.87.1513136781766; Tue,
	12 Dec 2017 19:46:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.68 with HTTP; Tue, 12 Dec 2017 19:46:21 -0800 (PST)
In-Reply-To: <CAN33hf9ntsO=MfoRExd==qHBTV5h0tgkAZqZTzr9R-yQK5ZcUQ@mail.gmail.com>
References: <20171212024917.14550-1-allenwild93@gmail.com>
	<1513068908.30397.2.camel@andred.net>
	<CAN33hf_0Y1=fCKmFYeCCZdVcEGyMjeUZHSkMzMiZP0z1VC5jmA@mail.gmail.com>
	<CAN33hf9ntsO=MfoRExd==qHBTV5h0tgkAZqZTzr9R-yQK5ZcUQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 12 Dec 2017 19:46:21 -0800
Message-ID: <CAJ86T=VyfS-2ssrj8h5qJtB4RM6fFGCvMQi=EgKdX6Ret-AcDw@mail.gmail.com>
To: Allen Wild <allenwild93@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] syslinux: always use the BFD linker
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
X-List-Received-Date: Wed, 13 Dec 2017 03:46:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2017 at 6:42 PM, Allen Wild <allenwild93@gmail.com> wrote:
> Oops, forgot mail the list when sending my first reply.
>
> I tried appending LDFLAGS, but it doesn't work for syslinux. It's
> during do_install, not do_compile, that $(LD) is called directly to
> link libutil.elf, libcom32.elf, libgpl.elf, and ldlinux.elf.
>
> A python-free but more intrusive appropach to fix this could be to add
> a new variable e.g. HOST_LDNAME in bitbake.conf and incorporate it
> into the definition of LD. It would default to "ld" but could be
> overridden by recipes like syslinux where appending LDFLAGS doesn't
> work.
>
> If we don't expect the bitbake.conf definition of LD to change,
> syslinux could also just simply redefine LD =3D
> "${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"

If you don't need to modify the value of LD in the bitbake environment
(only the value seen by Make) perhaps try something like this:

  LD=3D'${LD} -fuse-ld=3Dbfd"

passed on the Make command line?

> Thoughts?
> --Allen
>
> On Tue, Dec 12, 2017 at 4:46 PM, Allen Wild <allenwild93@gmail.com> wrote=
:
>>> Hm, other recipes that have this need typically simply do:
>>>
>>> LDFLAGS_append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold=
', ' -fuse-ld=3Dbfd ', '', d)}"
>>>
>>> Would a similar approach work here, too? Instead of this big change.
>>
>> I thought about that, but grepping the Makefiles appeared to show many
>> usages of $(LD) directly rather than using gcc as the linker, so I
>> assumed it wouldn't work.
>>
>> However, I just looked more closely at my log.do_compile and I don't
>> see anything appear to call LD directly, everything is getting run
>> through x86_64-oe-linux-gcc.
>> Clearly the LD variable passed to make affects this consistently, but
>> now I don't know why. I'll try appending LDFLAGS and see if that
>> works.
>>
>> Regards,
>> Allen
>>
>> On Tue, Dec 12, 2017 at 3:55 AM, Andr=C3=A9 Draszik <git@andred.net> wro=
te:
>>> On Mon, 2017-12-11 at 21:49 -0500, Allen Wild wrote:
>>>> Syslinux compiles successfully with Gold, but at runtime Isolinux fail=
s
>>>> to boot, getting stuck at the version screen without loading the menu.
>>>> Forcing the BFD linker fixes this.
>>>>
>>>> To future-proof, use an inline python replace rather than duplicating
>>>> the definition of LD in bitbake.conf
>>>
>>> Hm, other recipes that have this need typically simply do:
>>>
>>> LDFLAGS_append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold=
', ' -fuse-ld=3Dbfd ', '', d)}"
>>>
>>> Would a similar approach work here, too? Instead of this big change.
>>>
>>> Cheers,
>>> Andre'
>>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


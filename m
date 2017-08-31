Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 36BE5783DD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 20:31:38 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id r203so607489oih.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 13:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=cYA4pUGwVlmaFnsB+kNZjWGIofmZ9DvMFHPIg8s8id8=;
	b=urCIf3MAuifJODZcKSClGhv5InYkV99y2Dvfiz3tdsPxc7QhkJzqHYVnVied7Ma/9h
	sXXLYGxwFu4Xab5XvVyheyrsNN8NzEA5IlEVoRwRjErOX3K0WaezfmOBraLn1SnRtYUt
	7339vpFvaf3zYA5wHARrBRKYKaec6FM9oP/6LGT4+b7wqBBzHEdNJ0sqGCWTF1mFH1uN
	KSfQ/Occf66YVZdEUEeThaJYonOV/eS33KxDN6FlwNU9zsDXg3y14nyJJhfN48cI2Lfx
	57Oc8lMKYAgvcNP8GpM4dCzv2xYIxJ+/nf758RUGsC0+v7AzYg6M44FJfqMZorQj3Rwl
	jxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=cYA4pUGwVlmaFnsB+kNZjWGIofmZ9DvMFHPIg8s8id8=;
	b=NlOMyv0t1S5XfsEdn2NQT2zFRDpyLq+/Q2St7JBr+aQBWCmjmiXyAyt4c6+MzUEuWy
	GyJwqxt300ZDTcYIdO5u08dGyCmCaYbDA8qPUev1aJi6I3zRsp/6jCmwSu0vr2yuKOVb
	uKyUclTyqz/qn7/TDtv98ukrEIzUBztW9mVEOsEspLHa3zh8SiL+nMBf5nhRzv+D2mXb
	Lbwi+HLlh2SRmpPS5eD+fyJXOMqLL9OS4XSFZctVNG3FyCadp9gkFqUBLKEFY+Q53FKt
	JeVMeOiry8k5Uu7opKMUYHUk50RbiPEzUE6Em4vtbLZOeUT1P4TtuUVYB1miEO/E5an0
	N4ow==
X-Gm-Message-State: AHYfb5hxKbg/NK2yR7dV2T9m7TwVKs+K+f3w6OZw3xfe6wOUzHM/dqn8
	oGhJsqr7jc4PiDLHeuE=
X-Received: by 10.202.53.7 with SMTP id c7mr6393699oia.232.1504211493012;
	Thu, 31 Aug 2017 13:31:33 -0700 (PDT)
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com.
	[209.85.218.41])
	by smtp.gmail.com with ESMTPSA id k13sm754176oib.7.2017.08.31.13.31.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Aug 2017 13:31:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f41.google.com with SMTP id t75so6299151oie.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 13:31:27 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb6FQSUbeUw0EXFbML3eIHf6Ila2DIRwmDralNh4zqbPhzp3v3ZzpcFJwMhjGP0xdi3WAua88kOpAjrKfI+67ZQ=
X-Received: by 10.202.105.11 with SMTP id e11mr224729oic.67.1504211481903;
	Thu, 31 Aug 2017 13:31:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.37 with HTTP; Thu, 31 Aug 2017 13:31:21 -0700 (PDT)
In-Reply-To: <CAP9ODKoZCkBhe-1JtKwBSuye-cONe0DGu-7Y-GGRytyTN8H=Vw@mail.gmail.com>
References: <20170816181539.5327-1-otavio@ossystems.com.br>
	<CAP9ODKpOcrd7h5AcgW2zxPHPvkhrgAByZEvF-tzsb-iOGxh_PA@mail.gmail.com>
	<4839097.lYi3dlrNZm@crde-port-20.cahors.local>
	<CAP9ODKoZCkBhe-1JtKwBSuye-cONe0DGu-7Y-GGRytyTN8H=Vw@mail.gmail.com>
Date: Thu, 31 Aug 2017 17:31:21 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrDFdUrFfx0cuV=_t9WG4x9_F0_-iZyjJMc-8K88TBhmA@mail.gmail.com>
Message-ID: <CAP9ODKrDFdUrFfx0cuV=_t9WG4x9_F0_-iZyjJMc-8K88TBhmA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] Revert "kernel: Fix symlinks"
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
X-List-Received-Date: Thu, 31 Aug 2017 20:31:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello guys,

On Wed, Aug 30, 2017 at 6:16 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Tue, Aug 22, 2017 at 12:40 PM, David Vincent <freesilicon@gmail.com> w=
rote:
>> On vendredi 18 ao=C3=BBt 2017 14:44:30 CEST Otavio Salvador wrote:
>>> On Wed, Aug 16, 2017 at 3:15 PM, Otavio Salvador
>>>
>>> <otavio@ossystems.com.br> wrote:
>>> > This reverts commit c7bc46b9bc29dd0953ab8d63b50fa105bb66892e.
>>> >
>>> > The commit has broken the alternatives concept as it is managed by
>>> > links controlled by the alternatives system. That said the failing
>>> > case identified (which some bootloaders fail to load the file) seems
>>> > to be due a misuse of the alternative system.
>>> >
>>> > Cc: Christopher Larson <chris_larson@mentor.com>
>>> > Cc: Ross Burton <ross.burton@intel.com>
>>> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>>
>>> I ended forgetting to add the commit author on Cc. Adding now :-)
>>
>> This issue has been discussed here : http://lists.openembedded.org/piper=
mail/
>> openembedded-core/2017-April/135923.html
>>
>> Reverting this patch to solve the alternative problem cannot be a defini=
tive
>> solution as it breaks boot on some boards. IMHO, I'd rather break the
>> alternative system than boot (full disclosure : I use opkg's update-
>> alternatives).
>>
>> As already said, absolute paths cannot be used in bootloaders since it m=
ay
>> point to an invalid location (rootfs may not be mounted). I do not have
>> another solution with plain 'ls', but I think we should find a way to be=
tter
>> handle all cases than going back and forth on this patch.
>>
>> FYI, this is my use case : I have a bootloader which resides in EEPROM, =
but
>> needs to boot kernels that can be upgraded. Therefore, I rely on a fixed=
 path
>> to the last kernel / devicetree on a specific partition outside rootfs.
>
> I understand the problem you are fixing but the solution in use is wrong.
>
> We should stop using the update-alternatives for the kernel and device
> tree files and instead just use plain symbolic links. Abusing of
> update-alternatives is just wrong.
>
> In fact, the update-alternatives for this specific use case is broken
> as the database is elsewhere and so the link cannot be managed
> properly.

I am struggling on how to properly fix this problem ...

 - update-alternatives: due the use of a central database and the full
path links, some bootloaders are broken

 - using plain symbolic links is problematic especially when we remove
a kernel package. What should we do?

The plain symbolic link seems to be the best option but it does not
allow that multiple kernel versions are going to be installed in
parallel.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


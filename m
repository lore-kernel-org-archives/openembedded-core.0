Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3D444796E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 17:54:26 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id l143-v6so690464vke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 10:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FETkiqUQyezE6Hi4vzCibgFdEjPnwi7pi4anbCI9oYA=;
	b=DPkMpSXsHHXFAYf023sQBluW+WxVDyZ9T+jUU/fuMdIWclLnWMBY6dUwhpzgQofl46
	P3Ekh2KKGAzANrw049SkFl3ggcGeXpVr99pMXVyrxq4o10IZhPquqGpdoKGgI6zUk9hL
	K2LnOt64ZIRUtW5f7mbG4Lf5tOZsVbOOPCW47Gj6f4VSfsKLtVe+DpKM2kpCU7BsUBE2
	nlA2ymN9lC8qsHt9sSBVlL2kceej+gRIOIIUNPlv+S7agkebOXOXB5fvbj+B9c8VtIkW
	w1b461wYSTLemVwsyTNI8HSnJXlJKEqM0lDiCUerYgp8E+oB4OzddOdqtf4CTrV7eGBi
	1IwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FETkiqUQyezE6Hi4vzCibgFdEjPnwi7pi4anbCI9oYA=;
	b=a4fxfcTWm8VzGklVe55NgOadWnJn1PgJ9VgG4I6llKBdqbIchEI2rZAkDv3lo+EW48
	vJskZMxDDGZV1aO/SpithooxZPCeGzdnZg0HZh8VnD9S+LkPqB5l0ieJIQzWJeC5ojos
	ZTBqID29Ef0P3/U7vNIFsF7zMQK4SyPruwPJqRbMFk2gCJ/QCFkHF0EmK4e9gnPsU54z
	NIKYf47yVPQHbqZsonKi2lQ9dxAGpSL5SPbvC97YJXD7T1zDNkaZg7sYb3UPEqOM7Tss
	Rh3WImtde2QL5ZXbwsXWKkEe+VEW2/aG/d4OArLd2LkD134K1kWxjKULILT3sh2MR52O
	OUCw==
X-Gm-Message-State: APzg51ChD+oaqbDZR5Gdln/g9eWuZ8i8OItp5tA/Djovaz52/cd6293N
	Z5koD+a2JZ2tvYl59tB7zCvP/dUPf4eWNq6Xve8=
X-Google-Smtp-Source: ANB0VdbfCWggwmn3gK5FwP7w9MBJEaPbb+YDSbpCQ0M+T+5zXcKzAP/b2+eznhR/fwXHbxRSqz+o9JL1XsA3wOL62Ws=
X-Received: by 2002:a1f:be13:: with SMTP id
	o19-v6mr7072807vkf.22.1536602067120; 
	Mon, 10 Sep 2018 10:54:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2904:0:0:0:0:0 with HTTP; Mon, 10 Sep 2018 10:54:26
	-0700 (PDT)
In-Reply-To: <CA+chaQdkmKDwrAT1Cq-tYApxMKHrSx36QDdLEAHaXp4GO+h0UA@mail.gmail.com>
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<b0f6196af47cab59f634fbffea7121a684dd4ad0.1535451643.git.alex.kanavin@gmail.com>
	<CA+chaQfSBfzWoDKkWH0arU388zqewFMVKQ+bJwo4TMABZhAiog@mail.gmail.com>
	<a12df2950bb8cbe607429ba26247543ba63367af.camel@linuxfoundation.org>
	<CAMKF1spTfZD2B19zQFH+PhAytChCe1k-05ma2QQ9TCVp3TNrgw@mail.gmail.com>
	<fbe407b0f91278f2d416884eb1d737af30a20808.camel@linuxfoundation.org>
	<CAMKF1sp9uBnKKKu5nTKu_dS2=onTJvOgeroNDQtNx4DrWqBeRg@mail.gmail.com>
	<CAJ86T=V2QTuiz=KzNzZeyLKyvZd6m+ZPKmkP+tZwhfM_=fTASg@mail.gmail.com>
	<CAMKF1sqWuf8sQj7TA_G-prWpOB5mtXo7F8k_K0bj2ufHXRa6Yg@mail.gmail.com>
	<CANNYZj9rQ-vFT09JPs0pJ46HEYK8_UNzA5Di9G6OXosHOKt3mQ@mail.gmail.com>
	<20180905085322.GA1795@jama>
	<e7847d5e6eb6103ddf02e6da14a1449227e5665a.camel@linuxfoundation.org>
	<CAMKF1sqynK2-5b9ex5fcLW3s2XTH086Ajps_-50stxVvGX9xLQ@mail.gmail.com>
	<CAJ86T=V78dXJH8rOdN2LAshL8UqsC5aJ_njU8Dra9M=tCcBhgg@mail.gmail.com>
	<CA+chaQdkmKDwrAT1Cq-tYApxMKHrSx36QDdLEAHaXp4GO+h0UA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 10 Sep 2018 10:54:26 -0700
Message-ID: <CAJ86T=VhxA4nq=UhBcU24qPci5E7C8PRHtG=rrhSCT8AjLSRZA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/6] openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the default version
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
X-List-Received-Date: Mon, 10 Sep 2018 17:54:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 5, 2018 at 8:55 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> https://wiki.debian.org/OpenSSL-1.1 says it will cause runtime bugs like
> segmentation faults or just misbehaving applications.
>
> On Wed, Sep 5, 2018 at 5:45 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Wed, Sep 5, 2018 at 8:15 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> > On Wed, Sep 5, 2018 at 7:45 AM Richard Purdie
>> > <richard.purdie@linuxfoundation.org> wrote:
>> >>
>> >> On Wed, 2018-09-05 at 10:53 +0200, Martin Jansa wrote:
>> >> > But patching the components to use libssl10 might actually work
>> >> > (unlike
>> >> > just changing DEPENDS to openssl10).
>> >> >
>> >> > It's not only conflicting in build-time in RSS, but it will conflict
>> >> > on target as well. You either need to migrate all components included
>> >> > in image to 1.1 or all stay on 1.0.
>> >>
>> >> That isn't quite the case. For OE-Core we have images using both 1.0
>> >> (openssh) and 1.1 installed together. Its true there are some issues if
>> >> you try and parallel install both the -dev packages but normal target
>> >> images are working.
>> >>
>> >> We could probably "fix" the -dev images to an extent by making 1.1
>> >> replace 1.0 dev pieces.
>> >>
>> >> The build time sysroot problem is harder unfortunately, I've ideas
>> >> about things we might be able to do but haven't experimented as yet.
>> >>
>> >
>> > If runtime conflicts are clear
>>
>> I don't think the runtime issues are clear.
>>
>> Being able to install both versions of openssl on the target and have
>> them be used by different applications is one case (already solved by
>> different sonames).
>>
>> But the builds that are failing in meta-oe are a different case - a
>> single application is indirectly linked against both versions of
>> openssl. Loading two versions of openssl into the same address space
>> at runtime hasn't been solved... and may not be realistically solvable
>> - e.g. what happens if code in an app compiled against openssl 1.1
>> tries to share an openssl data type with code in a library compiled
>> against openssl 1.0?
>>

Any further comments?

How are the meta-oe world builds looking now after the recent fixes?
Are there still issues?


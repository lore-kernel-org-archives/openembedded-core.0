Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id BC36A7F1BA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 19:39:35 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id z8so1214507ioh.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 11:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/H4d36G/WzmqYNazPBuPCDzbuOpT8NxCeqKoPvDrEiA=;
	b=gq7YreUYG6rU/rIMWWa+AbARSb92o+KkJ+5PCXFT2PMEHvFZ2IGFmGukVpcFTA5zRK
	h4mL9PfwUOVkAydBLWPPZefIDX05TteA2QhcCiozj1gatT4nCFXP3uVIkvpvco3DJ9LB
	zsZrdDH+WSfBD9KubtISKe4zB4Prb7+ViBP7yel793FiFUHnkOhoKsnDIG7xcOHwCcOU
	GUVHd7gcAks7SuT5rZGdZs33oH1nBIZlVFE0YazGq2lUIVuwfloC7IJj2ApWlgOsU3hV
	trwmFxV7ezRiNcxEA0HA9Kg13kqxhLrnSZ52nHfoiFLNfJ9NB0wSqPj2zcKtuOo6365/
	e/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/H4d36G/WzmqYNazPBuPCDzbuOpT8NxCeqKoPvDrEiA=;
	b=pXFXSTqKziAJvAfcmKHXW60Fk6s0evgO9dzDk9CTqrbGDJREL42K3lpIVDCThiahZ7
	lCSjMDPxG2ULnz4nvwAGsAfOWGm6pvynZz2iNog0FQoXKm5GTP7DdkD7sYu136q3yagE
	kSUNZSJTh9HAlOq4lm90c9LH34T7hAw2xpaoHWMYR8iCrx/Ma0VN4XF4weTULYNSqYw7
	9TRyl8c1RAcmUp+opHM5wUm87dELk7UrUo2jcLfHll+cu2rmwuy6zKfR0uDOToMXoGAT
	+7ODDVOszgwRv8mirXuw+mSex8KsEbKBoEByxRhk/etfvfmapvPx08OxWFcc4EB6DyNY
	2MuQ==
X-Gm-Message-State: APjAAAVU1OM0pbPW/WfM3ZpJduPNDj7dsFYaaAITCCUuFA2/4lpDowi0
	pURY71T/SFWoda88tq/UxAWlEtWnUFKzzOw7YNM=
X-Google-Smtp-Source: APXvYqzn7e56kQgtoO9qksrt9JHcMrR8enaBl6xgoiXLOVqrxC9yQRoX1yZ7ApmJUIAmwbBU149xX8xAuqw67CnVve4=
X-Received: by 2002:a5e:9b15:: with SMTP id j21mr12763888iok.108.1576352376752;
	Sat, 14 Dec 2019 11:39:36 -0800 (PST)
MIME-Version: 1.0
References: <1575472180-11923-1-git-send-email-wangmy@cn.fujitsu.com>
	<699e48bc46b4e96c13393b2d61dbe366c3c88825.camel@linuxfoundation.org>
	<CANNYZj8u8ZkM1ZbbKnXpnUL8LtUwChAtJRi3pfsfeek3BzEa8Q@mail.gmail.com>
	<CALbNGRSHCS1B_SfjWuGVmgh9t+=A=jPFU5ZY4hnvz1rJCJbdMw@mail.gmail.com>
	<CANNYZj_-MimTZeueDybg87q=CrDGs5FTo07EH7DoBu-1gWjVxQ@mail.gmail.com>
	<CAMKF1sry2H9eCDUvsNThpN8xRcsoxruV5kDonfmRj_uJtQ+H-Q@mail.gmail.com>
	<CANNYZj9YEHYYZBvXL11JoO8L3Ge2jwQ4J3OUtVkEhUN--oFasg@mail.gmail.com>
In-Reply-To: <CANNYZj9YEHYYZBvXL11JoO8L3Ge2jwQ4J3OUtVkEhUN--oFasg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 14 Dec 2019 20:39:25 +0100
Message-ID: <CALbNGRSep_pf08bnP=tVUPoc1yN8c5vr2MU4pMzOMxxJXU9tqg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Denys Dmytriyenko <denys@ti.com>, Jon Mason <Jon.Mason@arm.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nss: 3.45 -> 3.47.1
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
X-List-Received-Date: Sat, 14 Dec 2019 19:39:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 14, 2019 at 7:28 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Sat, 14 Dec 2019 at 17:29, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> > This option is only available with gyp, and not plain Makefiles unfortunately. And the way I read it,
>> > it's not actually possible to disable :-/
>> >
>>
>> nss is used in quite a few apps, and disabling armv7a is not a good
>> option, plus hw crypto is only in armv8
>> thing.
>
>
> I guess I could patch that bit to make it conditional then. It is not actually mandatory, it's just that they don't have a config switch to disable it.
>
> In oe-core the only user of nss is rpm, and we're going to switch it over to openssl or gcrypt.
Grepped around a bit and there are some recipes: most prominent are
firefox / chromium and V8 derived as qtwebengine / some recipes in
meta-netwoerking. / libreoffice

I bet there workarounds for those recipes possible but if Alex can add
some configuration it would save at us trouble/efforts.

Still am not convinced that armv7 was kicked out by intention. Am no
expert but what hardware do moz-people have in mind when writing in
their Makefile:

ifeq ($(CPU_ARCH),arm)
$(OBJDIR)/$(PROG_PREFIX)aes-armv8$(OBJ_SUFFIX): CFLAGS +=
-march=armv8-a -mfpu=crypto-neon-fp-armv8
$(OBJDIR)/$(PROG_PREFIX)gcm-arm32-neon$(OBJ_SUFFIX): CFLAGS += -mfpu=neon
endif

Maybe I should ask ask them...

CU

Andreas


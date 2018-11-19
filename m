Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
	[209.85.167.181])
	by mail.openembedded.org (Postfix) with ESMTP id D8C736C18D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 16:54:20 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id b141so16793033oii.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 08:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QfZtdBh9fl0TqP/yuk4Ns9KAdskp7MaZ7wkNV1tW6FM=;
	b=OoOGJLaSq8liHPzCSmL0Ty02vuVyCpblteKztKZuXnqnV8Jy1uOtzdHSX27mY1wPlm
	D8bq2v/JMOHSaV7m6lM89xEXicrKszg4KHs3qN0RTYCHHd8ykIQYxJTUHFdbrxR9rcUH
	auHLp4VxfUO9IXM1q+HfbsGKT5FCbvihEmG7Hfp7PyU0lVBjhmRT1hdF24689iua6+/v
	28yebPJsHzu39DwCC9J/d9c/06KPFGOearbwu1/5q2ZoS24LMveIdpzv7rJhXBtt/wyC
	/c509sfb0j0+i+qp4ci6+pCcsneT7cYD1n8TfIn4/cDtltxu5aY4heh/gXyLj1COuPNy
	mllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QfZtdBh9fl0TqP/yuk4Ns9KAdskp7MaZ7wkNV1tW6FM=;
	b=K93Gfuevp/AfSnoGyKPWmg4cYJzgVg2GLhFvU9GUDwi+IokfDvGDxDofgNfefCd3oW
	r0ZOCzv1FRKehmFRhSHoDky1FrSzySl314AyBuro+GrrDCJZafJZH2qMLKp93i24uh1T
	IuiFauy5z9LxR5C8uoRnlJ6wTEResQgvJOzQsqBj0XnctAU99KvehNSPwBB/8WiODtYG
	1EvM5WZ0Dg9oMruswYXbD+kvuAiPjFmC2RELkx895lOFLk2wEs/CXpt6V26XGJAFvQO2
	mO+kdmO9m7s/u6/ylACHt2rD3rYn/xDmcwHsdXp6A35qoAbZ3zMZZazTRhD2Mo15G6Av
	QdiA==
X-Gm-Message-State: AGRZ1gJCNthh6Hi31c+oXoGDr5az52t6WNNUBJMgEUS7o7/YBIKbLfxJ
	1O1WkoF8TIlae/z5baqSHPOorgA0N70l3KoVV/o=
X-Google-Smtp-Source: AJdET5eFPwmCajGwoldc2d/IuPRArQLUO6/GL9qipYbZsDCURwhNB1JdSyk8x9r6+oZNQDWHRTC+BOcZ2xHbYrXh8cA=
X-Received: by 2002:aca:4b4f:: with SMTP id y76mr7799885oia.88.1542646461833; 
	Mon, 19 Nov 2018 08:54:21 -0800 (PST)
MIME-Version: 1.0
References: <20181117144457.A7B74440002@auh.yoctoproject.org>
	<be32ec5d-9c69-0625-10a2-a32b587bc02a@gmail.com>
	<CANNYZj-0azx-FS8J8uT=tHWteoVyq5rUCyCeBv-+cqoB=HK2vg@mail.gmail.com>
	<31066f04-438f-94a1-8050-b4fa6d1cfbad@gmail.com>
	<CANNYZj8_+TEy3xLQt6dUrVD9TUw1QwXJWDiT7QBEH6sX5J-5yg@mail.gmail.com>
	<edbbacd3-a911-1473-be1e-c5d406134bc7@gmail.com>
In-Reply-To: <edbbacd3-a911-1473-be1e-c5d406134bc7@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Nov 2018 17:54:09 +0100
Message-ID: <CANNYZj9=ZgmwAL9wRxcqLuBxZSGQMPFmKrLmCbY39NHuSABQzA@mail.gmail.com>
To: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] Upgrade status: 2018-11-17
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
X-List-Received-Date: Mon, 19 Nov 2018 16:54:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Nov 2018 at 16:11, Marek Vasut <marek.vasut@gmail.com> wrote:
> > For what it's worth, u-boot does not currently compile for qemux86:
> >
> > | {standard input}: Assembler messages:
> > | {standard input}:26553: Error: junk at end of line, first
> > unrecognized character is `@'
> > | {standard input}:26659: Error: junk at end of line, first
> > unrecognized character is `@'
> > | {standard input}:26553: Error: can't resolve `end.7689'
> > {.u_boot_list_2_pci_driver_entry_3 section} - `start.7686'
> > {.u_boot_list_2_pci_driver_entry_1 section}
> > | {standard input}:26659: Error: can't resolve `end.7689'
> > {.u_boot_list_2_pci_driver_entry_3 section} - `start.7686'
> > {.u_boot_list_2_pci_driver_entry_1 section}
> > | /home/alexander/development/poky/build/tmp/work/qemux86-poky-linux/u-boot/1_2018.07-r0/git/scripts/Makefile.build:278:
> > recipe for target 'drivers/pci/pci-uclass.o' failed
> > | make[2]: *** [drivers/pci/pci-uclass.o] Error 1
> > | /home/alexander/development/poky/build/tmp/work/qemux86-poky-linux/u-boot/1_2018.07-r0/git/Makefile:1377:
> > recipe for target 'drivers/pci' failed
>
> That's gcc 8, right ? It's fixed in newer versions.

That however does prevent AUH from doing the upgrade, as it first
attempts to compile the base version. Once this is resolved, you
should be getting three separate patches for the three recipes -
turning that into a single patch is very non-trivial, as devtool
(which actually does recipe modification) simply cannot operate on
more than one recipe in a single transaction.

Alex

Alex


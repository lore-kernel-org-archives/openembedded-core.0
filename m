Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1B25774FDD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 08:36:51 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id i5-v6so28439383otf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 01:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=spQANBxFISpF3iehDrMnTZe3inRSV1DqzWGfNZmcrcU=;
	b=JVFr0E1W8jvLEdVYFcldydKjeKZAugYaEqFzUgOGCD0rOhoYVJKoVHv7vAFExFCW9q
	tBA+zdkdl5DoL2Iw1KADBb2oMXGKL7NQT6Fwqbdm0DV+sfY4bNFdatEbBJQqaID2CnK1
	3ytpP8qhGAauvdIylQttrafMakqIYWriql2tdTUxmfIytlG1vzJYxXGVFEMxpqfgTlG4
	KSQqPgCLmcE6ceph2cUDWbVXwxbj/iYai+BUkX4qrHe78LL8GOfzITWTktmNBRc6y/Nj
	ITBtE8tGHTxRTKXCc4r43Gs5LcwUMRn8ltdWJF8ypyIRFx9HDOZ+Xu9UOlA7f9Fzp9om
	3kgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=spQANBxFISpF3iehDrMnTZe3inRSV1DqzWGfNZmcrcU=;
	b=OjGdN5p4hZ9S8Jq9kLl0hhIzR9w2RsNSKoxxLwxu6RkyZcPsNByjcUfIMeJtAYUSkS
	h89X/vEXlJNTYomuO3Vr7LbbM5Dp7Cj+EIjJe8Q+PeqVxlRJWBq897HQkyn8sJhwEXky
	TdvklpU0746ulAtnmHjd/vXEBzPKIGSQ9+pcNsZ+0XKw2LxtneaZTZZlbLcxk0RdnpAu
	6ftoGuTJrGLhDgPFSy6N/xTa3sYa+grZXIrYbOEfdgUcjW5T/iO7QFPcRglZisUL4TbL
	UQCVENUn23Wot1H1TXXsS6qZ31MwiDkychQmNRCmuQO3mYQdEKw2vvaK7Rbsvt4ijpHM
	mM0g==
X-Gm-Message-State: APt69E0T2EZsXjtFArdhZryIzwK77ULI3Nom0EyVWF9DcKP/0EiBmIa5
	hQ5lVVDsNpHgITF2v/JqN/0FiavQZZnSKE2BlFo=
X-Google-Smtp-Source: ADUXVKJgij78B2kKvM9YDwPsG/pOb0hsjJ+4sPf9m3TmKkZJcb/7wltZmB4cUY26CH2AvctBXI2uJRTWUNzkU7AfQj0=
X-Received: by 2002:a9d:4609:: with SMTP id y9-v6mr762674ote.259.1527842212870;
	Fri, 01 Jun 2018 01:36:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP;
	Fri, 1 Jun 2018 01:36:52 -0700 (PDT)
In-Reply-To: <5B10DBE5.5050603@windriver.com>
References: <20180531062031.40334-1-mingli.yu@windriver.com>
	<1527772404.16911.155.camel@linuxfoundation.org>
	<5B10A3D7.20309@windriver.com>
	<CANNYZj_3y_uP4a188SREALPvpBL=xnu=QZAW9s7V9iSG2a-t9Q@mail.gmail.com>
	<5B10DBE5.5050603@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 Jun 2018 11:36:52 +0300
Message-ID: <CANNYZj_saa2orMaM15wGZuDF8W0=JmAuz2eADMA5zjwknvSByw@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boost: Improve reproducibility
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
X-List-Received-Date: Fri, 01 Jun 2018 08:36:52 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-01 8:38 GMT+03:00 Yu, Mingli <mingli.yu@windriver.com>:

> I did investigate the path a lot before send out the patch, but didn't
> figure out why it introduce the path for make_x86_64_sysv_elf_gas.o whose
> source file is make_x86_64_sysv_elf_gas.S.
>
> Anyway, I will try to dig more.
>
> If you have any ideas, welcome to help provide some hint.

I'm not an expert in symbol tables and what goes into them, but I
strongly suspect the full path is introduced by linker because that .S
file has two assembly labels (trampoline, finish). The other two
assembly files have no such labels, and so their file paths are not
added to the .so. I'm also not sure why there needs to be a full path,
as opposed to just the file name, as is the case for .c files (maybe
to avoid clashes with labels of the same name in different files?).

We should probably just strip that one specific .o file before it's
linked into the library. Or if there is a way to prevent the labels
from being written into the symbol table by the assembler, we can use
that too. Sadly boost has its own build system, so doing such custom
tweaks may be tricky.

Alex


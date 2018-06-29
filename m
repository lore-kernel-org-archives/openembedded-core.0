Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id F0304752A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 19:56:01 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id a17-v6so5070273ljd.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 12:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6ubFstYmFydfD9tC2kz+DPADaGEtRngJDdiW4QxvaNA=;
	b=cRVvkQ98TMDp5+m9DAy36opftPM84PVX2lOVufnes8k/0Yuz2n7lgzEkUaRHovuvUi
	/7Ky0g5gNTtJjjcIHyF2JwbdJEzEGaS1nRFQNwl9YKBVyALRZ3cG9rNC98l87mmPvm2n
	le+kvYhD/+2bOC7GHfApLawTjeUu+U9g/FgfDWmtf1wHKJpL0lkaYwRCWCR06XVoDhNX
	oZ4/j9ifoQCD1NLJ2G4wWzT6FjmGLNBoWPzFEz0haXZrct6VjH0lkWQ2NWglvmjtner7
	c7TFrTw8lLf/j7ZtpTB375IX62ky+BJje3CjEeV8P/73Kxa7AiB0co7dEXhKU5PGfHjT
	xLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6ubFstYmFydfD9tC2kz+DPADaGEtRngJDdiW4QxvaNA=;
	b=I1otNlMye8DfIDcuQr90r2xG6EQ9Zr6eac0V8fCOFoTIfDU6D1Wq5H4x3hhrgcYiG/
	yzbNTAiRV8tBHhazMdzaRGgP/fy9NbtZo1m6rzl1hHEr2iFjuXXkUC4mUbrIL8skGn7f
	+TIYm9w5b3jy2OegKVu+L17jB2qtWKcgg+wzGuA8SEBYWS+bZNClLFb9fC8tnbhFWG/A
	ieAmYDHacol7rilrlVUj7C8KuWXEWxtr/ii7pDXG+QFZEXEjLz3QLCHpvXs3NLz0SC+4
	pSbw2MJPuhm2khGiNTkBnSW7A7a7kLl9CUZ1d1x3avRtpxjxBxucUuzjQcf3Ncvh4T2t
	bnYw==
X-Gm-Message-State: APt69E2m18fRmntJXgfQhtT76DbiviqyEW0zCQLdcNJQ1DBMKd+wFsWw
	x9GBT0E9PNtFl0EiZWHE8H3wlyRef3XRoV/JehI=
X-Google-Smtp-Source: AAOMgpdZwsW7DtMmc73f23qIh/TJISsA+hEGpXu4uEQhRz6kE3BVDlNlSwriGrksllAY/tq8KDmOh1V7HDDJgWGyzv4=
X-Received: by 2002:a2e:8807:: with SMTP id x7-v6mr6807936ljh.98.1530302162584;
	Fri, 29 Jun 2018 12:56:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:45d6:0:0:0:0:0 with HTTP; Fri, 29 Jun 2018 12:55:31
	-0700 (PDT)
In-Reply-To: <CAMKF1sqR8n1QpZXfbFUnVQiVsAWUdUMvZ6jkty1tPfP_axUf6g@mail.gmail.com>
References: <20180525155636.116866-1-alistair.francis@wdc.com>
	<CAKmqyKPDm7i+9xbuFy0BinoT5fGDj6+rUEK5XDyow0NcE-biqA@mail.gmail.com>
	<CAMKF1sqR8n1QpZXfbFUnVQiVsAWUdUMvZ6jkty1tPfP_axUf6g@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 29 Jun 2018 12:55:31 -0700
Message-ID: <CAKmqyKOhDL1wD278Vj=dj0FWAHHvdN-X8ZmjRTt5Ga_dGRWc2Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-kernel/linux: Enable NUMA Kconfig from MACHINE_FEATURES
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
X-List-Received-Date: Fri, 29 Jun 2018 19:56:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 19, 2018 at 12:46 PM, Khem Raj <raj.khem@gmail.com> wrote:
> This is good to apply

Ping!

Alistair

>
> On Tue, Jun 19, 2018 at 11:09 AM Alistair Francis <alistair23@gmail.com>
> wrote:
>>
>> On Fri, May 25, 2018 at 8:56 AM, Alistair Francis
>> <alistair.francis@wdc.com> wrote:
>> > If the user has set numa in their MACHINE_FEATURES we should enable
>> > NUMA support in the kernel config.
>> >
>> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> > Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>
>> Ping!
>>
>> Alistair
>>
>> > ---
>> >  meta/recipes-kernel/linux/linux-yocto.inc | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>> > b/meta/recipes-kernel/linux/linux-yocto.inc
>> > index 3bb872a32a..a8ac237656 100644
>> > --- a/meta/recipes-kernel/linux/linux-yocto.inc
>> > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>> > @@ -28,6 +28,8 @@ KERNEL_LD_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
>> >
>> >  KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
>> >
>> > +KERNEL_FEATURES_append = " ${@bb.utils.contains('MACHINE_FEATURES',
>> > 'numa', 'features/numa/numa.scc', '', d)}"
>> > +
>> >  # A KMACHINE is the mapping of a yocto $MACHINE to what is built
>> >  # by the kernel. This is typically the branch that should be built,
>> >  # and it can be specific to the machine or shared
>> > --
>> > 2.17.0
>> >


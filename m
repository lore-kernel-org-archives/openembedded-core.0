Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1034E75474
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 12:01:34 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id l22-v6so17902595oib.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 05:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qv+SqNjXjhYlA8UUM2tpFQKR+SlD3bMU4kdEGe0Ol6s=;
	b=KDyGmbXKWEavphoqnFNnlJPdPOFMVmAZhGXlSm2PY6TXbndycJS+IkXv+NJNGHtDTU
	POw/seT6O3IqZKgOVfYBbeSqsKfrqbVdDyKITQ/4FiyYcBC2XAg1NEe5HJ2c6v9p/iqv
	OjztqJabMxhqf96xUnSOXvHT6FRoP5ENHvl/dkkE/dQE2HZtYowNXBgj45R/gtb0sVic
	s/cwe033Her09Nl4wZWxTGqgiDQLQtjc5NCRfdGs4+mqeIQdgxpgMUeCVIMM1BdRm2Ua
	fsfrjD95GrNlt6+rt5tONKHFhJuV78rJ0/MXKh3NeIygNrn91LKOQao95agL1we3sTEM
	ptdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qv+SqNjXjhYlA8UUM2tpFQKR+SlD3bMU4kdEGe0Ol6s=;
	b=uIFz4yXKTIcR71md2PghHicavVyfqZXoCYAryGvYIlxSwwVDyIN8xD542IgaQApque
	vnjmvMnOIbedMoE00szSnTUIsSXl5dzR8pzCAxsQwgzpI+D8zLJMdPRT3mE73+7VDl7a
	RHadnhC3AC/nhn8hVNR/rqMGpIb9ej7unTW6XvWCsvO4NViYDL1P3xIpmEwt78wpka8x
	FeFsuFyHmSF6eqSiMa0AwAlHrjZbFuMmux+TtJAYx3fVTxGb6Q92ujXbPfJEDosI3Lur
	pI9Pf8TGXuyirlFOVKle1PkZIbuFcJAf5jMHhsUzBfw4FSMYV8dvmOMYtq9kOfKpQ82c
	TNww==
X-Gm-Message-State: APt69E2XW6TVzUekUocBnF0IlF5bqC7l3SzmfQsaN3B2+SIksasDxp+r
	kXXY1+pkOXIstY6V6AMQY0JIlk+BCk4lEaxjjUM=
X-Google-Smtp-Source: ADUXVKJtMHuCkL/Xv8Mn7HkC3ef/kjWSofOK1EGelANYNMHtAhESNhAA45JxZi9z1DAjeeeEapDm2upl5uqxMQI7MDQ=
X-Received: by 2002:aca:5094:: with SMTP id
	e142-v6mr8722341oib.190.1529409696069; 
	Tue, 19 Jun 2018 05:01:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Tue, 19 Jun 2018 05:01:35
	-0700 (PDT)
In-Reply-To: <CAJTo0La2eicsFUCAPOktYs110iFdOrFWNzLXC+EeeRrDzBHtNQ@mail.gmail.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-12-alexander.kanavin@linux.intel.com>
	<32602a82-f07d-3c69-2305-3f0f17f4c9dc@windriver.com>
	<CAJTo0La2eicsFUCAPOktYs110iFdOrFWNzLXC+EeeRrDzBHtNQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Jun 2018 15:01:35 +0300
Message-ID: <CANNYZj8wmcMwQjbRU1Weg3ggZSJFGjW6z7pnhax7sTwE105ieg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/14] meson: update to 0.46.0 -- broke systemd on qemuppc
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
X-List-Received-Date: Tue, 19 Jun 2018 12:01:35 -0000
Content-Type: text/plain; charset="UTF-8"

The order of arguments to compiler and linker matters. I remember that
when converting recipes from autotools to meson, I had to fix the
order to be exactly same, or some weird, arch-specific issues arose.
Can you check the precise command line in both working and broken
case, and what has changed there?

Alex

2018-06-19 12:59 GMT+03:00 Burton, Ross <ross.burton@intel.com>:
> On 19 June 2018 at 06:03, Randy MacLeod <randy.macleod@windriver.com> wrote:
>> It seems that this meson update broke systemd on qemuppc.
>> I'll look into it a more tomorrow but below is what I know so far.
>> It looks like the libsystemd-shared.so size increased by 18% despite
>> the build flags being the same!
>>
>> Despite my IRC handle, I'm a meson newbie so any tips will
>> be appreciated. I'll work on getting meson/ninja to be more
>> verbose tomorrow to track down what really changed.
>>
>>
>> I recently started testing qemuppc by booting
>> core-image-minimal with systemd as init. It fails with:
>>
>>    /sbin/init: error while loading shared libraries:
>>       /lib/systemd/libsystemd-shared-237.so: R_PPC_REL24 relocation at
>> 0x0054574c for symbol `strlen' out of range
>>
>> or in some cases:
>>
>>   systemd[1]: \
>>      unhandled signal 11 at b804b784 nip 0070d184 lr 008ee1ac code 1
>>   Kernel panic - not syncing: \
>>      Attempted to kill init! exitcode=0x0000000b
>> when running:
>>     runqemu slirp nographic qemuppc ext4
>>
>> The error only appears when using the distro poky-lsb
>> or a security template in the WR builds.
>
> Khem suggests that this is due to the new gcc and PIE on PPC being
> bust, but even after passing no-pie this is still happening for me.
>
> Ross


Return-Path: <marek.vasut@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id B2D396C120
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 15:11:06 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id g131so5291785wmg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 07:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ymB4aJs4X9Gna78HsctnRK4CxuRHFV0va6HzONPfs4E=;
	b=Pk833bAsb6UQI9TKtfIcIVXcjYRC8zOxSLsIJtp0DfrJPO/nMCqSGl57SkQF/XmxqE
	U65xpzo/Xh5T1948iwPht3nhFSKOIsROaSQxuFrkhx9rL2aJ/V5wROeNdtZU0pwn2uGA
	ug7278ZzHz2oBY4HJuQKnOdKIMv92DMNF64FUz/MAIu+GxrB2eAtWRYDE/ljvP42Mgc8
	CUMPboaIkJJY0r06uWelBZIdyaQy9hqa16guClHgnR9iov7i/4SPbH76LJulxvu5GJQ/
	a/yw1z8AWkDB/Obncet3dlbuBp+qOclXf94OEqi0E9i+JnzBHYCdvLQcsXdRa0Ut02sN
	zwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ymB4aJs4X9Gna78HsctnRK4CxuRHFV0va6HzONPfs4E=;
	b=Xm+/liMp7ajEURK7AOsPS/8B3pNAkxnnPkQcnB0mpv2RQFAWVEyhkraOschyHuSdSk
	pXq4aYrIjKBgRitI+Rr9kcBND7DPhis6TvxJ5Jr5bT2oa+yeg3BBmA7BZE5FQjAicYYz
	DGjA30aPy6aZN/uo+EYwonZLowpQOcDYn73eDsIV04Y1nY0r4d5fxGrtQLVNGU9ODY6A
	Pn7KzsUJJ/Tz4ETzIV1888Oj76jdHJEjOv3KxP/865mscwtigZ9BcBYS3BpLVCjVmulv
	LLneZsZWZ7x7/zlzVoEngSIliTt3jLhpg3C+W6+6VnvPkVwTN6fHNEfCDpw+FGjj4Osm
	MHUQ==
X-Gm-Message-State: AGRZ1gJ8SLojlVdZ+JHJgemM6aw+ExSyLsNCaps99xT3xlJZgdGrKCra
	UFcnN5SdH9gnyYtSsWzHg742Vsq3
X-Google-Smtp-Source: AFSGD/X0S/PB9bK922QZmQ28ijjuwRrtPWBAN9uUFoi6enhKOBXI0Gxh7odCz2hN1oRf7DL7P5gbjQ==
X-Received: by 2002:a1c:9183:: with SMTP id t125mr7248280wmd.79.1542640267005; 
	Mon, 19 Nov 2018 07:11:07 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz.
	[86.49.110.70]) by smtp.gmail.com with ESMTPSA id
	h203-v6sm33374234wma.38.2018.11.19.07.11.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Nov 2018 07:11:06 -0800 (PST)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20181117144457.A7B74440002@auh.yoctoproject.org>
	<be32ec5d-9c69-0625-10a2-a32b587bc02a@gmail.com>
	<CANNYZj-0azx-FS8J8uT=tHWteoVyq5rUCyCeBv-+cqoB=HK2vg@mail.gmail.com>
	<31066f04-438f-94a1-8050-b4fa6d1cfbad@gmail.com>
	<CANNYZj8_+TEy3xLQt6dUrVD9TUw1QwXJWDiT7QBEH6sX5J-5yg@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <edbbacd3-a911-1473-be1e-c5d406134bc7@gmail.com>
Date: Mon, 19 Nov 2018 16:11:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj8_+TEy3xLQt6dUrVD9TUw1QwXJWDiT7QBEH6sX5J-5yg@mail.gmail.com>
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
X-List-Received-Date: Mon, 19 Nov 2018 15:11:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/19/2018 04:04 PM, Alexander Kanavin wrote:
> On Sun, 18 Nov 2018 at 16:05, Marek Vasut <marek.vasut@gmail.com> wrote:
>> Heh, I spent quite some time to make sure U-Boot builds on the targets
>> AUH uses for it's auto update stuff, exactly to let it update U-Boot so
>> I won't have to do it manually.
> 
> For what it's worth, u-boot does not currently compile for qemux86:
> 
> | {standard input}: Assembler messages:
> | {standard input}:26553: Error: junk at end of line, first
> unrecognized character is `@'
> | {standard input}:26659: Error: junk at end of line, first
> unrecognized character is `@'
> | {standard input}:26553: Error: can't resolve `end.7689'
> {.u_boot_list_2_pci_driver_entry_3 section} - `start.7686'
> {.u_boot_list_2_pci_driver_entry_1 section}
> | {standard input}:26659: Error: can't resolve `end.7689'
> {.u_boot_list_2_pci_driver_entry_3 section} - `start.7686'
> {.u_boot_list_2_pci_driver_entry_1 section}
> | /home/alexander/development/poky/build/tmp/work/qemux86-poky-linux/u-boot/1_2018.07-r0/git/scripts/Makefile.build:278:
> recipe for target 'drivers/pci/pci-uclass.o' failed
> | make[2]: *** [drivers/pci/pci-uclass.o] Error 1
> | /home/alexander/development/poky/build/tmp/work/qemux86-poky-linux/u-boot/1_2018.07-r0/git/Makefile:1377:
> recipe for target 'drivers/pci' failed

That's gcc 8, right ? It's fixed in newer versions.

-- 
Best regards,
Marek Vasut


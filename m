Return-Path: <marek.vasut@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id BDC0E6B7C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 22:08:27 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v6so11819239wrr.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 14:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8SFjW/G0R0E3l8aXuc4/fhv3/ZDygu4ZugzL3VYrAPE=;
	b=oA65sMrJ+oeaqyldpAbyg2W6jt+4r9JdNERt359bRMDbSklXbvLnuT9TisBZL1Vd+e
	unLHYXqrPI/ZBYYIKuBjgJGSh8KHTtVdeQ4nR511Aavhl0XrjiesSN4YMaXh9DTnf6f0
	I11OFECtY+shtx8+1DO9lNWoEWpPwFb5gDW/bZP70Z573ftX+9x+2mxtnzimn04boz71
	JYmAdTJR253ZlzAhz607CdsJ/kmRWpCCY5SwGKiUZ/6CrfI6d9qrLnFfdwipxuOxTMfl
	gT2OtGLx0UUAGI+5oMHaJrQVbvbTvHxfFugQG6XNR3QYgw5mKkXwbJa2lEyUdrDNEfch
	qDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8SFjW/G0R0E3l8aXuc4/fhv3/ZDygu4ZugzL3VYrAPE=;
	b=mcUzWCu9DweIcNro56+wR02fV4NykwNycpRNg/GZK7arbC2JrICJ7WgIs5ct0nN5tX
	AQT+i2XQrj0MoE6g5pqQhRiy3aGd0X1aogiyJXWm5WG30rSXJnuxMnHZ1raf66nTT/JG
	To8ux1ZZVd2T11jwxN2iD99juVIPJhurTWIOU98nr0AhLcLn1uSvB7sRoYs9Nyrya70m
	FBtUOs/BkTjQuH6/fWZ5lNFe+1oONkmpN9R9lWh8erAxA4fwLrRqDkA4xbhLoNEHPtGx
	ACRNIgX1b2AKM8uGbpAEMhveEnoYKIzRugsV/V+EY3NmkG1051n6GFtIXDtdbyzYRumB
	y7cg==
X-Gm-Message-State: AA+aEWYM2+aJ70MZQ9plm5S9t3NItYVFJqPhyzNGATBNU29xfXDjhva1
	L2S7uHjBwzc1X4QK0JdPppfBGmQeTKc=
X-Google-Smtp-Source: AFSGD/UxViU72ynOUKRtDHda07zQMyuWkTaxC0isUbZih2JyqPHVUr+4e37l+niN9litjRz3QHXkCg==
X-Received: by 2002:adf:db51:: with SMTP id f17mr7026861wrj.90.1542665308036; 
	Mon, 19 Nov 2018 14:08:28 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz.
	[86.49.110.70]) by smtp.gmail.com with ESMTPSA id
	h1-v6sm11898686wrs.46.2018.11.19.14.08.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Nov 2018 14:08:27 -0800 (PST)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20181117144457.A7B74440002@auh.yoctoproject.org>
	<be32ec5d-9c69-0625-10a2-a32b587bc02a@gmail.com>
	<CANNYZj-0azx-FS8J8uT=tHWteoVyq5rUCyCeBv-+cqoB=HK2vg@mail.gmail.com>
	<31066f04-438f-94a1-8050-b4fa6d1cfbad@gmail.com>
	<CANNYZj8_+TEy3xLQt6dUrVD9TUw1QwXJWDiT7QBEH6sX5J-5yg@mail.gmail.com>
	<edbbacd3-a911-1473-be1e-c5d406134bc7@gmail.com>
	<CANNYZj9=ZgmwAL9wRxcqLuBxZSGQMPFmKrLmCbY39NHuSABQzA@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <7d926545-562f-81ce-96dc-4f10999487ed@gmail.com>
Date: Mon, 19 Nov 2018 23:08:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj9=ZgmwAL9wRxcqLuBxZSGQMPFmKrLmCbY39NHuSABQzA@mail.gmail.com>
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
X-List-Received-Date: Mon, 19 Nov 2018 22:08:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/19/2018 05:54 PM, Alexander Kanavin wrote:
> On Mon, 19 Nov 2018 at 16:11, Marek Vasut <marek.vasut@gmail.com> wrote:
>>> For what it's worth, u-boot does not currently compile for qemux86:
>>>
>>> | {standard input}: Assembler messages:
>>> | {standard input}:26553: Error: junk at end of line, first
>>> unrecognized character is `@'
>>> | {standard input}:26659: Error: junk at end of line, first
>>> unrecognized character is `@'
>>> | {standard input}:26553: Error: can't resolve `end.7689'
>>> {.u_boot_list_2_pci_driver_entry_3 section} - `start.7686'
>>> {.u_boot_list_2_pci_driver_entry_1 section}
>>> | {standard input}:26659: Error: can't resolve `end.7689'
>>> {.u_boot_list_2_pci_driver_entry_3 section} - `start.7686'
>>> {.u_boot_list_2_pci_driver_entry_1 section}
>>> | /home/alexander/development/poky/build/tmp/work/qemux86-poky-linux/u-boot/1_2018.07-r0/git/scripts/Makefile.build:278:
>>> recipe for target 'drivers/pci/pci-uclass.o' failed
>>> | make[2]: *** [drivers/pci/pci-uclass.o] Error 1
>>> | /home/alexander/development/poky/build/tmp/work/qemux86-poky-linux/u-boot/1_2018.07-r0/git/Makefile:1377:
>>> recipe for target 'drivers/pci' failed
>>
>> That's gcc 8, right ? It's fixed in newer versions.
> 
> That however does prevent AUH from doing the upgrade, as it first
> attempts to compile the base version. Once this is resolved, you
> should be getting three separate patches for the three recipes -
> turning that into a single patch is very non-trivial, as devtool
> (which actually does recipe modification) simply cannot operate on
> more than one recipe in a single transaction.

I wonder how AUH works with other recipes then, I don't think U-Boot is
the only recipe in the tree which shares a common .inc file ?

-- 
Best regards,
Marek Vasut


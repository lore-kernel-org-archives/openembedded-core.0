Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
	[209.85.167.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9A90D6AC00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 15:04:17 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id c206so19948662oib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 07:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=72CUfi8gg0/zBEYn47hxQmIzSdtaCRyUnAXDlSBvcW4=;
	b=VoCJgRJY/UzSeqfFciYM+atKrZLE4X8SRoWHlXeueKLEV5+8s8kj+vGBc6XROVPjQw
	XnC1r2+oKhbCfxh/XswSbhG1bkozpbGQ8A8W5+85S04bN6ZyU34/TeUjUCjyXEqvb0+7
	05tOE89cdS2i19d9GLv468a8vTnjTxjXfxYmAzPQAHsngjmhNmRg/tzd2NdRMSnjyM0F
	XwwGmNkjZ+T+imZnWvBvp1VA7HwiX6bUjG0dgVI1jrZmmTWnEOC4yHLymXv+hb7w82ip
	zBKeXp32KaYbvCtdYxrbuCyiWGYjSyvqFvM2aHLBnZ1R+o59oa1v6yeGy8MgH3iBRNvD
	W81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=72CUfi8gg0/zBEYn47hxQmIzSdtaCRyUnAXDlSBvcW4=;
	b=DeIlbW6qgya6Nb4bLt1kZl6nqMWGt7USDbIc8ZSDf9ALyiHHHL/u2wJz6IjgsrTBkf
	Tlb66OY8ki09n6jfNZiqOUYiSrxcMjhHuEgONq46Go2mrFDYIENMwy4jPaXijE8DuFGO
	XX4zZRC8Po0APDg2qFkFdUujx0TCM7mCUkaeeWPYwD8LJB7sEg4pH3hN+mBzxY+w/jwb
	7cQ5F6bm2dFA2qx1MVqtky99+0NQEMJa969FeQybKMFTXm4ONJzfWa9lBSfNel+FajVD
	gP1c6iq78MY9ZcyagrjPctaubEq/gjgbe6pUXI3Kj3i8ywamlxtVZpuwy4sSP2oUvuqk
	dmZw==
X-Gm-Message-State: AGRZ1gJJkJbEZMjL03Y7miH8SMM7VhkFzdsNSaFy4LZR5Suh47KUIQnt
	oHlUkhzhGQrOaHmKNUKkbOpWoM9uP5O/2VF/Tl8=
X-Google-Smtp-Source: AJdET5cSoINikoFWw3ZDh05w/OsQBceUJm2/4pOqI3hEz3l/FSi67PZmLI1YnVQYQmUEKL0oAS1911dUX6tzD962xIA=
X-Received: by 2002:aca:b784:: with SMTP id
	h126-v6mr7642634oif.298.1542639858648; 
	Mon, 19 Nov 2018 07:04:18 -0800 (PST)
MIME-Version: 1.0
References: <20181117144457.A7B74440002@auh.yoctoproject.org>
	<be32ec5d-9c69-0625-10a2-a32b587bc02a@gmail.com>
	<CANNYZj-0azx-FS8J8uT=tHWteoVyq5rUCyCeBv-+cqoB=HK2vg@mail.gmail.com>
	<31066f04-438f-94a1-8050-b4fa6d1cfbad@gmail.com>
In-Reply-To: <31066f04-438f-94a1-8050-b4fa6d1cfbad@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Nov 2018 16:04:07 +0100
Message-ID: <CANNYZj8_+TEy3xLQt6dUrVD9TUw1QwXJWDiT7QBEH6sX5J-5yg@mail.gmail.com>
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
X-List-Received-Date: Mon, 19 Nov 2018 15:04:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Nov 2018 at 16:05, Marek Vasut <marek.vasut@gmail.com> wrote:
> Heh, I spent quite some time to make sure U-Boot builds on the targets
> AUH uses for it's auto update stuff, exactly to let it update U-Boot so
> I won't have to do it manually.

For what it's worth, u-boot does not currently compile for qemux86:

| {standard input}: Assembler messages:
| {standard input}:26553: Error: junk at end of line, first
unrecognized character is `@'
| {standard input}:26659: Error: junk at end of line, first
unrecognized character is `@'
| {standard input}:26553: Error: can't resolve `end.7689'
{.u_boot_list_2_pci_driver_entry_3 section} - `start.7686'
{.u_boot_list_2_pci_driver_entry_1 section}
| {standard input}:26659: Error: can't resolve `end.7689'
{.u_boot_list_2_pci_driver_entry_3 section} - `start.7686'
{.u_boot_list_2_pci_driver_entry_1 section}
| /home/alexander/development/poky/build/tmp/work/qemux86-poky-linux/u-boot/1_2018.07-r0/git/scripts/Makefile.build:278:
recipe for target 'drivers/pci/pci-uclass.o' failed
| make[2]: *** [drivers/pci/pci-uclass.o] Error 1
| /home/alexander/development/poky/build/tmp/work/qemux86-poky-linux/u-boot/1_2018.07-r0/git/Makefile:1377:
recipe for target 'drivers/pci' failed


Alex


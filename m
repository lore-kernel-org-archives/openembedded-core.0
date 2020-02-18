Return-Path: <marek.belisko@gmail.com>
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail.openembedded.org (Postfix) with ESMTP id D4A646157A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 06:37:51 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id p23so23520393edr.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 22:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WefOljf8fdhmjWPE5xhjjCetqPi5nsbB6AvHzk0HJ3g=;
	b=milyCRdePcZEV76StfhQxZv1SbR0Ww9badKvRcFCd0+FJEm9oZCLy97bqi/fVapN7q
	C5N8iatUtbzCVRDNk/0bGzngNS1eWXOugNnzwqSpwJ2bFAhnBW2oiwzmZDFWUmlltZSO
	T6UZpx5bmPWJr0hbyQTq1F8P/3qjwL2uQMDwNLeznwmfwPaVa/WZZGrokxCrz1t5NqpV
	zbfIU0Lsn4VDV0LH/JH5MV+TEWWHMcKk4HWFFun33IDvx6iUeBq0RBfxQ2ySPeeXXjtr
	lxXjD5kdu4IJOb/cY6p5IvDBZOtl+Fr/fEVaSGUWtWh68RT7Vdr2yCEVWL9dLr7MiZvb
	qlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WefOljf8fdhmjWPE5xhjjCetqPi5nsbB6AvHzk0HJ3g=;
	b=ttSTgbgs/szeo3yywPt8LY1TAU0FGJp5vsQdvy8i2UaIpAiXgaEJWAPDpRJHiN8QYk
	aKH+dR/hi+sHY4R/x3NxtpNGY2wZzkbGZJ5EKl7TJhBLdazQlyX8Jdxo0SO/4/ThTLHK
	ULW64sQPB5HNlYXIW6dXscQKb4jvNgOe3jENM4QItnntJiipRaEKzypFbQPK0jpKSva8
	P1IprIn9mYg0uJWGY/AmHIUhBGR011eXcDBidfcwNgHTz13u6kKwbv9Lia3kZKgf4iHy
	XXQ3pVM+BWbn4ULb0bodHQfucW8OFSceXE+74jdE2+jMq+DVdHgaLsClXwFl8QEwyw2E
	To9A==
X-Gm-Message-State: APjAAAWed/gbvQU67DV3hgCCwxw8oKxtbA4CebZZFzxY9fzZoic8958Q
	lPHnn7yFqzvoayAHoBx+z0RfZ7GQCupRrggrl0o=
X-Google-Smtp-Source: APXvYqzoTQoAxeXWAJlgpBBzqpoJGTz4kgwTP7iOZv+FJnkh+V75pB+m7sIHaMLuXtf5bQt1b9HzU4KEmfCFtK8sDxo=
X-Received: by 2002:a50:ab5b:: with SMTP id t27mr17383922edc.229.1582007872419;
	Mon, 17 Feb 2020 22:37:52 -0800 (PST)
MIME-Version: 1.0
References: <CAA=hcWTDqhJEE7MXFY9rvN93nf8=nWvshLoXKF3EMXYGLmZGbA@mail.gmail.com>
In-Reply-To: <CAA=hcWTDqhJEE7MXFY9rvN93nf8=nWvshLoXKF3EMXYGLmZGbA@mail.gmail.com>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 18 Feb 2020 07:37:41 +0100
Message-ID: <CAAfyv34yO7bSR9GBod1bXpD0sFnsSETsJQAzcmSgyY0orGtfcg@mail.gmail.com>
To: JH <jupiter.hce@gmail.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Change RO rootfs failed RF Kill Switch Status and Failed to start Run pending postinsts
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
X-List-Received-Date: Tue, 18 Feb 2020 06:37:52 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, Feb 18, 2020 at 2:00 AM JH <jupiter.hce@gmail.com> wrote:
>
> Hi,
>
> Apologize for the cross posting.
>
> I am running kernel 4.19.75 on iMX6 customized device with WiFi and 4G
> LTE, it was running well in an RW rootfs. After I have just changed
> rootfs to RO UBIFS partition, it failed RF Kill and postinsts I
> suspect both try write to the RO and failed, any advice how to fix it?
> Despite it failed RF Kill and postinsts, it was still working.
>
> [    6.097762] UBIFS (ubi0:2): UBIFS: mounted UBI device 0, volume 2,
> name "rootfs-volume", R/O mode
> ..............
> [    6.151932] VFS: Mounted root (ubifs filesystem) readonly on device 0:13.
> .................
> [  OK  ] Listening on Load/Save RF Kill Switch Status /dev/rfkill Watch.
>          Starting Load/Save RF Kill Switch Status...
> [FAILED] Failed to start Load/Save RF Kill Switch Status.
> See 'systemctl status systemd-rfkill.service' for details.
Can you pls provide output of systemctl status systemd-rfkill
There should be some more info what issue is.
>
> [FAILED] Failed to start Run pending postinsts.
> See 'systemctl status run-postinsts.service' for details.
Pls this one also: systemctl status run-postinsts
> ...............
> root#
>
> Thank you.
>
> Kind regards,
>
> - jh
> 

BR,

marek


Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
	[209.85.166.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4CFE3610CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 04:35:25 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id i11so7835474ioi.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 20:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TUcXvtRx45Y+TZ52Ol/EkqkzI32zvHfIfp9ABJYLpog=;
	b=QOUEdj2awMSDsHUYaWS7FIU3Rjs7FxXUK8MOc5tBpgUhgFFASAdR1ZBGXmWl96iF3y
	FupXapPp5hnVBEto8/yhXCeHdcBZ/GX+5G0yew17AB/7cpwB1FGQpDFjwWoewl0Gc3DR
	7Xbiz0EU9j8OUju4MFTLJJLx1FT/HKvsmGXyHcFgeRnpKJVovqi44E6MZs3uRilp1BJ/
	xGhqiGnAQcV2Ma9xovHOABu4QvNWY2PBkd9dZKJ4gkhNMTewJCvDPvmimzC6DWUDn2fQ
	58fZNrQCw694of/x73HTAzsPBJrVGoe1A4fYe+LPP4Lid/Xo0uA/UfrHCt9IB90SxCdd
	Beew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TUcXvtRx45Y+TZ52Ol/EkqkzI32zvHfIfp9ABJYLpog=;
	b=mDhXUhN50w7gJsShxFTzSxHkxxSx/OVyn8UnhVhXFA/HOjdtYu/ZnTsny/uGqEvdOM
	tw8ANg9IpA03GjSv5m5qZQXMvm5QB0eT4kQITXbOA9ykeozC20j1W/3AWmoR2LnS1F4+
	Y8eO2DamvHCEhP2BsTt50dYD4LiN4J7+lIrrBcWH6/Gc8aoVxkVz1C8hVnXJmgr/Q+qc
	FhlLbxIMbjkA4PkA5D3Wkdm0pBpiLmiPyafAdLg//aUj/3OxQ0de8Mf9zR36Z857hME2
	3Ce1vyCTdhbiNuYviOuyNQeWRi9ZTqTiAYMOQw+sHgAuqLes0B9ezAROdOqr4ykfOaO9
	EXsQ==
X-Gm-Message-State: APjAAAUxiEtKEjxy9WI191i9NeEijeagr/h4DYLFIK1EWeOhj61jPIjt
	RavxUgF89Po64cP3wq0kMKLZZEhlcUwgqqPqSXk=
X-Google-Smtp-Source: APXvYqzuJ8+MKyZupZqpupr12gG9m3qPLdz9X2HRBPDd3EEoZTOsqe4KhfFrVPWtcy0wBoThKgP/0zBkQrXCV05Y0/U=
X-Received: by 2002:a6b:d912:: with SMTP id r18mr13828656ioc.306.1582000526158;
	Mon, 17 Feb 2020 20:35:26 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Mon, 17 Feb 2020 20:35:25
	-0800 (PST)
In-Reply-To: <CAA=hcWTDqhJEE7MXFY9rvN93nf8=nWvshLoXKF3EMXYGLmZGbA@mail.gmail.com>
References: <CAA=hcWTDqhJEE7MXFY9rvN93nf8=nWvshLoXKF3EMXYGLmZGbA@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Tue, 18 Feb 2020 15:35:25 +1100
Message-ID: <CAA=hcWQ_6n4Sy66GoYxLgFJu-CwtaS1m-vAT_wVMTgDZ2qkarg@mail.gmail.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Change RO rootfs failed RF Kill Switch Status and Failed to start Run pending postinsts
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
X-List-Received-Date: Tue, 18 Feb 2020 04:35:25 -0000
Content-Type: text/plain; charset="UTF-8"

It also seems mwifiex_sdio tried to write to RO rootfs and failed and
triggled RF Killm, does mwifiex_sdio needs some system directories for
RW?

[   26.636845] mwifiex_sdio mmc0:0001:1: mwifiex_process_cmdresp: cmd 0x242 fain
         Starting Load/Save RF Kill Switch Status...
[   26.852990] mwifiex_sdio mmc0:0001:1: info: MWIFIEX VERSION: mwifiex 1.0 (14
[   26.861518] mwifiex_sdio mmc0:0001:1: driver_version = mwifiex 1.0 (14.68.36
[FAILED] Failed to start Load/Save RF Kill Switch Status.
See 'systemctl status systemd-rfkill.service' for details.
         Starting Load/Save RF Kill Switch Status...
[FAILED] Failed to start Load/Save RF Kill Switch Status.
See 'systemctl status systemd-rfkill.service' for details.
         Starting Load/Save RF Kill Switch Status...
[FAILED] Failed to start Load/Save RF Kill Switch Status.
See 'systemctl status systemd-rfkill.service' for details.
         Starting Load/Save RF Kill Switch Status...




On 2/18/20, JH <jupiter.hce@gmail.com> wrote:
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
> [    6.151932] VFS: Mounted root (ubifs filesystem) readonly on device
> 0:13.
> .................
> [  OK  ] Listening on Load/Save RF Kill Switch Status /dev/rfkill Watch.
>          Starting Load/Save RF Kill Switch Status...
> [FAILED] Failed to start Load/Save RF Kill Switch Status.
> See 'systemctl status systemd-rfkill.service' for details.
>
> [FAILED] Failed to start Run pending postinsts.
> See 'systemctl status run-postinsts.service' for details.
> ...............
> root#
>
> Thank you.
>
> Kind regards,
>
> - jh
>


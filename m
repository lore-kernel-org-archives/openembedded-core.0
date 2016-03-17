Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8FD456E5CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 18:17:52 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l68so937611wml.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 11:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=ON12PhMZGKd7o/VK35/GkX70eVixDIsfFCVQrfEjQmU=;
	b=F+R1NzlUyEnKCy7S5GwV/UElMWlVijAvIuMWN4cvkQyDH1rPTPVsMf5aiBlvXYzbGC
	MSDZL8H/OMxERwGQPmgzub/cOs+VhZIgVhawF6FrI0a30e2SMF9gk3HAG+gWC6fKYhDX
	rUsiUH9duFIW2KHZkjayNltwyPp6fe6YXDn3erXsicOa4I6RaFxg2AxjwDooycmfXN/A
	+8kfVmjcJyQy1VuuItrf+HXDvYsiMH3AwNh21/EWtWnDb4df2tFcXjq+yEy2HE2P7jvk
	xmnX07eo2PizIcN3HhZwgcl3WYkqenRAmsKGeGc9utxOld2SAq85Ufnkz6SpaASbo+dS
	2kDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=ON12PhMZGKd7o/VK35/GkX70eVixDIsfFCVQrfEjQmU=;
	b=nFGCp06Ryv5jSpXhKYoh+81EfBCWMi0KsOYy4vwyEcbLi0+6c+iyDUJYFapjgVcBLd
	SzChuqQdGV2OBxFndmsFj9hlkB1WEt1SbWUlcNHuwny5rM2pbQKtzFcUDVz8Mplm1JHs
	n5/t3RBxgiZ0xIMeY+oB1JIqFIiTL/C02G6AuKkTIwh6224Zwhc+xIGPRp3c3Vm+IOtK
	fr8WcGd7W6R4Pa3HB973uNT2bbxyqE1uXOREkHOMakWQmFhnlrgv5W+0G1daEYZx13b5
	lQUAu+JBC9UYpehMHWEbxYUtShprI4hWYj1tGSmpnk8KP8qeTrOyAJApFYA7q8SeMb4O
	N8eQ==
X-Gm-Message-State: AD7BkJJlGNPnzlWfu05tmcUnF6Kvphq9AZVjtZpuUITB2iFs0mTbBlBipfOkFQ0nizD+Ghq241jelRmaRCpBPw==
MIME-Version: 1.0
X-Received: by 10.28.49.3 with SMTP id x3mr12098245wmx.4.1458238672917; Thu,
	17 Mar 2016 11:17:52 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Thu, 17 Mar 2016 11:17:52 -0700 (PDT)
In-Reply-To: <CAJTo0LZ_9NTAMLo9eYGKYa+W4L_QQWQXrROog2Bwn89pbxmRng@mail.gmail.com>
References: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
	<1458235169-9267-2-git-send-email-armccurdy@gmail.com>
	<CAJTo0LZ_9NTAMLo9eYGKYa+W4L_QQWQXrROog2Bwn89pbxmRng@mail.gmail.com>
Date: Thu, 17 Mar 2016 11:17:52 -0700
Message-ID: <CAJ86T=X=amcjcvmsUidKYTsUYHMO+LHEE5znv-t0Qv8KGZLyjA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] bitbake.conf: remove 'gobject-introspection-data' from DISTRO/MACHINE_FEATURES_BACKFILL
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
X-List-Received-Date: Thu, 17 Mar 2016 18:17:52 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 17, 2016 at 10:31 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 17 March 2016 at 17:19, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> -DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5
>> gobject-introspection-data"
>> -MACHINE_FEATURES_BACKFILL = "rtc gobject-introspection-data"
>> +DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5"
>> +MACHINE_FEATURES_BACKFILL = "rtc"
>
> So every BSP (apart from the qemu ones) would need to add the feature to
> MACHINE_FEATURES?
>
> Maybe we should remove from DISTRO backfill but keep backfilling for MACHINE
> features?

Or don't control via a MACHINE feature at all (which would also solve
the package PACKAGE_ARCH issue) ?

Each CPU tuning file would then instead need to somehow express "this
tuning target creates binaries which can / can't be run with qemu",
but maybe that's an improvement too - isn't it better to define and
maintain that information centrally in files controlled by oe-core
rather than leave it up to BSPs to get right?

> Ross


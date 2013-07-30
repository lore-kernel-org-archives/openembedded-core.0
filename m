Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f170.google.com (mail-ve0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id D9FA56B46A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 16:22:21 +0000 (UTC)
Received: by mail-ve0-f170.google.com with SMTP id 15so1632202vea.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 09:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=4sHkAi/qbbN5DuFwVitm5E2gTqTuKt9co/dsBmF0bCY=;
	b=INBw9OHEsJlueE3ijNS34kBsNa8ZAZIsjNyZINkBE75wn7NlM7Rf9WiJQWpwhyonTL
	lOORGZs9ECazYxua8++6NNtYzXcjNwR5lzqGcc3eBxV73ocDnDUC6gY7F0amoRVVOJ0x
	k9rJOCqZZVtqJLV+dAP6UXlZhynUf3QF1d+7evjd/TN+njbKkD9ddrfisi39sUKVCQDo
	sU1CrBI1fJ8R3pXS3akUD8b4vjA6Ab6/1C0/TcS6i4nbODFqcdgS625gghJH/Ni482XA
	LBx2asb6a2uwnkWb7hNg14t+8BO6T2f7QLPzTNh6r1aCyGwrUc8bWYSa2mI/j7lHYyP+
	pwEg==
X-Received: by 10.58.171.4 with SMTP id aq4mr27097845vec.26.1375201339848;
	Tue, 30 Jul 2013 09:22:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 30 Jul 2013 09:21:59 -0700 (PDT)
In-Reply-To: <1375200633.8017.29.camel@phil-desktop.brightsign>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<1375092018.6324.176.camel@phil-desktop.brightsign>
	<CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
	<1375093253.13247.5.camel@phil-desktop.brightsign>
	<CAOMwXhO6+sJWjKAKVh=y1gymGoSUNVgs+nV9fz8G8eo9WHyAkw@mail.gmail.com>
	<1375094111.13247.9.camel@phil-desktop.brightsign>
	<CAOMwXhMZ1w5j=aP_yPXb=k0=UOuinMS5ENAsXAdzcb42WxC0Og@mail.gmail.com>
	<CAOMwXhO2A75jPxM4FdU=XBgVRjsxW24hDVLOf8eub2Wp4CmGDA@mail.gmail.com>
	<1402aa377f6.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
	<CAOMwXhOjyAtjsRbiHT3ufeApZVvkEE47pgBhXDsE0wxeHOZJiQ@mail.gmail.com>
	<1402b178308.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
	<CAOMwXhPw4K+T82qs21UzFFT+-eCYz9vBRVfUNGs5smmHCTP=VQ@mail.gmail.com>
	<1375200633.8017.29.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Jul 2013 17:21:59 +0100
Message-ID: <CAJTo0LaS5xnYAuDLU0PpSeW7uCWmVcOZ3p=eMJETahActVALiQ@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQmSM32ORIQrVWfckTElYjdIsDEv0xpRRZDuXBiJuhKu+KPNAP4KlVmxpE6UUqHnACA5U3lL
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Tue, 30 Jul 2013 16:22:22 -0000
Content-Type: text/plain; charset=UTF-8

On 30 July 2013 17:10, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2013-07-30 at 16:55 +0100, Laszlo Papp wrote:
>
>> At any rate, can someone provide a helper change from the past for
>> PACKAGEGROUP like changes?
>
> Do you mean PACKAGECONFIG?  If so, just run "git log" in your oe-core
> tree and search for PACKAGECONFIG.

From experience I know that learning by example isn't always obvious
for PACKAGECONFIG, but the manual does explain it quite well:

http://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#var-PACKAGECONFIG

Ross


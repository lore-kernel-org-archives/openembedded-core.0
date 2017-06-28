Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2054B60234
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 13:32:29 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id b184so58973632wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 06:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=/YEt0PpnbDrCMQnNKCdT0qXiKoZNix4Lgn9qozKxWLA=;
	b=11u50hXYRR9ikQAdP7af92v7eBLMoqQ367oyZEuLcHUAeCDo2DHaF3jD4d2UKwJsdL
	94IledtDsRY2lRBla0GweaSj5kjgTjCjSoFj2OBhoaTelbaEwLxq7aO0iAAU1ejpqUFE
	sIOg9de9Kd9KA2vQyd81TKQpr/O4/NR9Eku7p6gd8A1h9VXXG7LEZQFYbCrzD2Ph9dlM
	mXuR6AnNwHvUR36AP5Ro8ygQRW6Hg4zQXT1T646hMu+nD7zg81FZFLFe4CkKRbjxihFx
	UDIpLwvX7HO158U7MhP5Lma7t8tw2i4F9CaBLBLFU+ocdVjBdrlMY/w8qRONz3kQpAy0
	1Q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=/YEt0PpnbDrCMQnNKCdT0qXiKoZNix4Lgn9qozKxWLA=;
	b=TLnhcT62pNtpgt93E73+hj3hXNnDQBTDKsEiaw3KPwO6FkMXkwmsWerwaQKdR+bWRN
	0nBipFCoWqzCnxL0AWBesUs43U9bH4Sb6YTLuBSDSPM5oWETl3ltBQapNX1RjrkmU5y4
	aHihO4OrHAYYW5eu/NpqRBCl1HDZqyWaSNv242qxHQ/ZvTGPWiwC66wmYPqwYjaUnFC8
	amLEGs66rG6KkqeNRjo6bnz75cGBUj7cAgaimeImAds0jXc+MX/whBmWm4My32aDmeZT
	yWsIkw1kaGid9EOkYTaFe4V6FTAElbB8FpTkOEMHg0noRpID631o6Xy/JZ6ELJojZD3X
	EdLQ==
X-Gm-Message-State: AKS2vOw6VTXxennTTudo8JS9NCpKU2U39c2tVEK+JMC2M4nImrcYMFwt
	mpqrIDfSGKloVlFbfT0=
X-Received: by 10.28.69.9 with SMTP id s9mr7843756wma.71.1498656750287;
	Wed, 28 Jun 2017 06:32:30 -0700 (PDT)
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com.
	[74.125.82.41])
	by smtp.gmail.com with ESMTPSA id v13sm7327623wmd.5.2017.06.28.06.32.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 06:32:29 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f41.google.com with SMTP id b184so58972603wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 06:32:29 -0700 (PDT)
X-Received: by 10.28.105.85 with SMTP id e82mr7654267wmc.122.1498656748845;
	Wed, 28 Jun 2017 06:32:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.176.5 with HTTP; Wed, 28 Jun 2017 06:32:27 -0700 (PDT)
In-Reply-To: <20170628073121.GA11425@linux.intel.com>
References: <cover.1498569961.git.ed.bartosh@linux.intel.com>
	<CAP9ODKopDxEYw9vereQjoHve=n2Of2v-3EHbxaiumZN3T0hH8Q@mail.gmail.com>
	<823180ba-066d-747d-8112-a110633a03a8@ossystems.com.br>
	<20170628073121.GA11425@linux.intel.com>
Date: Wed, 28 Jun 2017 10:32:27 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoxxaJv=QZXp5m=Qt14t36n1TPXS19D+Xs3eyrPDG79bg@mail.gmail.com>
Message-ID: <CAP9ODKoxxaJv=QZXp5m=Qt14t36n1TPXS19D+Xs3eyrPDG79bg@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/5] #11662 - wic should mount /boot
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
X-List-Received-Date: Wed, 28 Jun 2017 13:32:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 28, 2017 at 4:31 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> On Tue, Jun 27, 2017 at 05:41:45PM -0300, Fabio Berton wrote:
>> The last patch I sent is here:
>> https://patchwork.openembedded.org/patch/139252/
>>
>> We're using this patch internally with Pyro branch. I can rework to
>> apply on master.
>>
>> On 06/27/2017 05:35 PM, Otavio Salvador wrote:
>> >On Tue, Jun 27, 2017 at 10:28 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
>> >>The patchset also fixes long standing bug: wic updated fstab
>> >>inplace in rootfs directory. This causes other tasks working with
>> >>rootfs directory to produce incorrect results or crash. This is
>> >>fixed by copying rootfs to the temporary directory before updating
>> >>fstab.
>> >
>> >As you is working on this, please also include Fabio's patch on the
>> >patchset. It includes a command like option to disable fstab change at
>> >all. For delta-based updates this is imperative.
>> >
>> >Fabio, could you point him the last patch revision?
>> >
>
> Do we really need that?
>
> JFYI: Mount point in .wks is an optional field. It makes sense to use it only
> if partition needs to be mounted on boot. fstab will not be updated
> unless it's explicitly requested by specifying mount points in .wks

It should have support to not touch it. For images which we intend to
do delta updates, the content cannot be changed besides the original
rootfs generation. So yes, we need that.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


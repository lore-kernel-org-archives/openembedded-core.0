Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0C18A60767
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 05:33:42 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id g203so169640187iof.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 21:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=2gUTGCr9Adc8bY9669ufJ4rj/1PZWNktW+DcRKhTheQ=;
	b=K4ovUK1frL/rCZhNdm80tneXLDsgnL7GH2v5bM1oRhVqhIbopBRBByTmcCgUWgiKoF
	8/BuPIJEAugrHcu85vVQzNNxYOxBulkm5tecP8KDVznekbCDVkF50MjNmkFwqBls24Mk
	hyVwulzUu07fjQ0USxUPAoY+7mSRvYjbV29iyS4U/IFM6z3igKPeQ2VaFRyqAnq0lGAs
	i/BTPEv3l8hEL7ISnV4Edw4bdtR4Zmnw9j+oSgcKzSqllAry5Mashiw47L78wvhKpaaC
	WY5QoVstFPWHHJTyN/m3k3YBNcme5QNgp71AUCNeBBMdcxoPEbLIpSb1er6fcZwncgVw
	228A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=2gUTGCr9Adc8bY9669ufJ4rj/1PZWNktW+DcRKhTheQ=;
	b=SnGKg5r9JtQWYzGrU9emAgVX9KuLDT1krIs/fKkoMwGS7wNN03nda8zR56lM+VtB36
	OuyPQnSTXELBV1h94rDv34V/n3eSkApyQxuzaaIXqoTu5ixm6gnSE/65b6SUVOhLSeE1
	xdNslxhDOZanGy+MxS7YdD+uwC+u4pUMzhbIIAl/qNnpdKHvDEhnZCaMRafbXpnkDfaN
	uJ/cNhzgwadW06v3o8mm3YrqxUcPPAKCyBwTOq2MD+0aNGqwi2c6ovKswfEeSI9J0/Rl
	R7H9Pel/9G/V3rtgV/ueGRmIEfGiWM/1arbGlqJQ9MHebVJBXH6QLeMgP18u/xHBeWz/
	Cd4w==
X-Gm-Message-State: AD7BkJIxzZGfQbP0YmVSDvWvARO8e4utunjwi9ia4OuTt1ukKB4mwNqaIAJdFIMjbvY1+w==
X-Received: by 10.107.135.32 with SMTP id j32mr14883050iod.40.1457760823383;
	Fri, 11 Mar 2016 21:33:43 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	k5sm2251191igt.2.2016.03.11.21.33.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2016 21:33:42 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>
References: <1457750954-32065-1-git-send-email-twoerner@gmail.com>
	<CAMKF1sqBf1Hg8w8G3Xes9TAjVoQcAE=DuHvsfJxNcVArZ=+Gmw@mail.gmail.com>
	<56E39AD3.4000503@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56E3AA3D.4000105@gmail.com>
Date: Sat, 12 Mar 2016 00:33:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56E39AD3.4000503@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] buildhistory.bbclass: metadata-revs show repo parent
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
X-List-Received-Date: Sat, 12 Mar 2016 05:33:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

To me, the purpose of buildhistory's metadata-revs is to enable someone 
else (or myself in the future) to recreate a specific build, that's why 
I always save this file with any build artifacts. Simply saying "meta" 
isn't good enough because it doesn't specify which repository's "meta". 
So the purpose of this patch is to try to clarify which repositories 
we're talking about.

> Before:
>     meta              = master:00d3fd571a8d261d065b43f5cf3076a381843984
>     meta-oe           = master:a1e135a499998add7575682bf53db5e02e753580
>     meta-gnome        = master:a1e135a499998add7575682bf53db5e02e753580
>     meta-rpb          = master:203903ca6f4e8df09bef6ea3c6e899d07eca8df9
>     meta-96boards     = master:2be59f0d381b5ec173d7fc24f3ae14aaf47b8649
>     meta-qcom         = master:32fcda819acb8ec485d9ab05108d554f807bf75d
>     meta-browser      = master:a3789a4168fcd42f1cdf5b5febe2c779a9467919
>     meta-linaro-toolchain = 
> master:367f784b831938dc508b7d472342d2d0d6ed9769
>     meta              = master:37b61b059031e3c272a929b834e12fd83f46598c
>     meta-poky         = master:37b61b059031e3c272a929b834e12fd83f46598c
>
> After:
>     openembedded-core/meta = 
> master:00d3fd571a8d261d065b43f5cf3076a381843984
>     meta-openembedded/meta-oe = 
> master:a1e135a499998add7575682bf53db5e02e753580
>     meta-openembedded/meta-gnome = 
> master:a1e135a499998add7575682bf53db5e02e753580
>     meta-rpb          = master:203903ca6f4e8df09bef6ea3c6e899d07eca8df9
>     meta-96boards     = master:2be59f0d381b5ec173d7fc24f3ae14aaf47b8649
>     meta-qcom         = master:32fcda819acb8ec485d9ab05108d554f807bf75d
>     meta-browser      = master:a3789a4168fcd42f1cdf5b5febe2c779a9467919
>     meta-linaro/meta-linaro-toolchain = 
> master:367f784b831938dc508b7d472342d2d0d6ed9769
>     meta-poky/meta    = master:37b61b059031e3c272a929b834e12fd83f46598c
>     meta-poky/meta-poky = master:37b61b059031e3c272a929b834e12fd83f46598c

I have a second patch, now, that will generate the following output, 
which I think is even better:

     git://git.openembedded.org/openembedded-core.git
     openembedded-core/meta = 
master:00d3fd571a8d261d065b43f5cf3076a381843984

     git://git.openembedded.org/meta-openembedded
     meta-openembedded/meta-oe = 
master:a1e135a499998add7575682bf53db5e02e753580

     git://git.openembedded.org/meta-openembedded
     meta-openembedded/meta-gnome = 
master:a1e135a499998add7575682bf53db5e02e753580

     git://github.com/96boards/meta-rpb.git
     meta-rpb          = master:203903ca6f4e8df09bef6ea3c6e899d07eca8df9

     https://github.com/96boards/meta-96boards.git
     meta-96boards     = master:2be59f0d381b5ec173d7fc24f3ae14aaf47b8649

     https://github.com/ndechesne/meta-qcom.git
     meta-qcom         = master:32fcda819acb8ec485d9ab05108d554f807bf75d

     git://github.com/OSSystems/meta-browser.git
     meta-browser      = master:a3789a4168fcd42f1cdf5b5febe2c779a9467919

     git://git.linaro.org/openembedded/meta-linaro.git
     meta-linaro/meta-linaro-toolchain = 
master:367f784b831938dc508b7d472342d2d0d6ed9769

     git://git.yoctoproject.org/poky
     meta-poky/meta    = master:37b61b059031e3c272a929b834e12fd83f46598c

     git://git.yoctoproject.org/poky
     meta-poky/meta-poky = master:37b61b059031e3c272a929b834e12fd83f46598c

Frankly, there are too many forks and clones. There are too many 
meta-beaglebone or meta-odroid or meta-raspberrypi repositories. If six 
months from now I want to recreate a build I've done today, I'll need to 
know the repository, where it's from, and which commit was checked out. 
My latest patch provides that information.

Is this better?


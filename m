Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A175F71B21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 20:50:09 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u144so9986576wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 12:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=LI1xieq7QeR8tI0YiBGj8EA1zxWQSZXLdOcv8MM+V0M=;
	b=nZ3ddfQarxtV/upHG1MmU9yhVLzYPiILOF0hYxQJdqGfi+SVfW8zJBV5ewwQWkL19j
	npZU1iCiPBZz1GGaqSnN1K2ZnZPdAnTMq+sVt9oFHIRmHE3Lxar8NHKQb1Ha6IU5x5bh
	jAYjoB61XiF58minXbkEdxPxIYaAjedO8p01G5r/4m2BO06XqWE2O1t6mbr7zjSH8ceY
	6DrVkbTO0EOQ9/xjIVRqmBop13Z3CTcam1faXUdwkp+3tGQPt89ts/R4YeKL0RQg/FRw
	0cqDw2nZvmoPKggkO8MHohiIWoqUu0BFzTJCybqkSYr+3EBlFuChQFMaq+iobH/8ufCY
	BtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=LI1xieq7QeR8tI0YiBGj8EA1zxWQSZXLdOcv8MM+V0M=;
	b=ItpOGWCmp/8vEsArRoWJbx7mZwbriI0wpXUvN3tLR3Aa7EQJu0ZZtnC8SetV7xr49j
	GP8znjp1Xm74gv2dPuJmL1MhyAa8yJjaffm0t2QInpZEb7roJ4CZ0DxU9H4z2lGyP5OE
	EluXHjZ6MBsBJr63Uwahzrxx2aOBl8zhqXApeywTGJkHR948lWTKlAIuWKoZ6gvs+NFt
	QMLzvewBSNi2ZlvMIC4cBfgifsfsNEZXOaHkF11ZXWYHsEcOK6lszWJ7s6EpPLyFU/DY
	VeG0NxkDwDugx058XiEio0A3fJf1+0YlGw6Y/TAZhnR+mrsTxG1sGiE5Wq81Gd/Ko//F
	FszA==
X-Gm-Message-State: AKaTC00ylBga8nG3sXWsqYx+6cj4x0Ms5qqfZ01eCujv6UJbJ16RpEpbngaMtcWY5PoMEQ==
X-Received: by 10.194.96.110 with SMTP id dr14mr1042387wjb.209.1479502210609; 
	Fri, 18 Nov 2016 12:50:10 -0800 (PST)
Received: from [172.20.0.13] (ip4da29576.direct-adsl.nl. [77.162.149.118])
	by smtp.gmail.com with ESMTPSA id
	x188sm5255303wmx.4.2016.11.18.12.50.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Nov 2016 12:50:09 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1479492365.28508.113.camel@linuxfoundation.org>
Date: Fri, 18 Nov 2016 21:50:08 +0100
Message-Id: <C693ECD4-7EEE-497B-A937-670B441067D2@dominion.thruhere.net>
References: <CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com>
	<70e3fff2-d9a5-37c3-5e14-5dbcc4e4d37b@gmail.com>
	<1479492365.28508.113.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3251)
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Enabling uninative by default in oe-core?
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
X-List-Received-Date: Fri, 18 Nov 2016 20:50:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 18 nov. 2016, om 19:06 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:
>=20
> On Fri, 2016-11-18 at 08:28 -0800, akuster808 wrote:
>> On 11/17/2016 09:31 AM, Burton, Ross wrote:
>>> Background: uninative is a class that downloads a precompiled host
>>> glibc for use in the sysroot, thus isolating the native sysroot
>>> from the host environment.  This means greater sstate reuse, as
>>> instead of native builds being dependent on the host system they're
>>> able to be shared between all hosts.  There is a reference tarball
>>> hosted on www.yoctoproject.org, and the URL can be overridden by
>>> distros if you would prefer to build your own.
>>>=20
>>> We enable this in Poky so that we get greater reuse on the
>>> autobuilders, and due to some issues with the C++ ABI the eSDK
>>> generation in master now requires uninative to be enabled.  The
>>> question is: do we now enable uninative by default in oe-core's
>>> nodistro (pointing at the yoctoproject tarball), or do we keep it
>>> disabled by default and require the user to enable uninative if
>>> they wish to build an eSDK?
>> =20
>> If Poky wants the default to use a prebuilt uninative that is fine,
>> but it should be not be the default in OE.  In the spirit of Bitbake,
>> uninative should be a build dependency for eSDK with the option of
>> using a prebuilt one.
>=20
> Its not that simple. Using uninative requires certain options passed =
in
> when compiling native recipes for example, e.g. to pick particular C++
> abis. If you start the build without those set (since uninative is
> disabled), you can't get native sstate built in the right way for it =
to
> work with eSDK. We could of course add a new BBCLASSEXTEND, "native2"
> which is native specially for use in the eSDK but that seems silly.
>=20
> I guess we could move the configuration uninative requires into global
> bitbake.conf but not require the actual binary shim to be enabled. =
That
> would let eSDK work in OE-Core just not make OE-Core require =
uninative.
> It would mean the compiler options for native would be a little
> different. That might be an acceptable compromise?

It would be for me.

regards,

Koen=


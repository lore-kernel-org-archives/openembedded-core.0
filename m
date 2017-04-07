Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1F89D77BAD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 14:24:18 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id o21so82100470wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Apr 2017 07:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=uEvj7TGZMU/GVP2vDHrytwamv/VAOl5KUlKmDOa9TJ8=;
	b=oVA+mngf6c3iA9iosY+8lK4Z5LMjgMlk4KsyWQCv728oCMLYhdjYOnO9OTcUukFf2i
	dyX2CZRGwzcNoaM+v09XiBJ1ov9qspyOp6u9b2WN0R/cCYvZN3UK+feCJRds+5KkgKUg
	tIm1lzqo+jP9K6GSsKxiYXrLRfICFMAmiel8WJ1aCb7//K9ljMWREZ3UImRKp++myYNz
	wQZHF8oCeuSYzsb5cm93N22Q5LNsNC2eaO4Vht4wvj+NPfEJmyQDGwWX4Li4J1lzyuos
	niiNjdZTGf1TPyBiUilqhrv4fVmyE0blQO/EMGRyy/yEVf9dc3oeoG9waLsZxJ5pi27J
	vWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uEvj7TGZMU/GVP2vDHrytwamv/VAOl5KUlKmDOa9TJ8=;
	b=YrgeRgI3sagYp6TjyENIm9cFKNmxFZlZcMmzrKm2jGUe/ni+BTClrxaW/ALURJ2kWJ
	NXQH3mExfT6y/RsjcfpR0m5vGzOSE2p4H7Sd39gTG0kf43cqhzzcfzW25hrKFVaho62T
	l79c5r6lRdpvf/F3hiAoBit8pz4LJMHDau60iZtG5BQb5jwIwxs/dK4aTkh//29ZfzsN
	fia70407ZgmYRawqFe8mEDU2YX2dDWPJ3lqncterJfcwHYCfabQxoEODMN1TX7Vj9bzj
	qrPZrBRLW4WqilySW27zUazgeYYWYSfkxYdOqSvm7Y9pc/PqUCxUU6akvL9VVaoQyDHM
	Fq5Q==
X-Gm-Message-State: AFeK/H1KPYFoEWvvXZFLTURFK8KVKgx3uTEMMkMdi+Bl4ZBK6UKDz0XC/hj8Yp/oFw5Ln//F9C5OnHDmPaJGDQ==
X-Received: by 10.223.128.194 with SMTP id 60mr27865422wrl.175.1491575059343; 
	Fri, 07 Apr 2017 07:24:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Fri, 7 Apr 2017 07:23:48 -0700 (PDT)
In-Reply-To: <CABcZANnLVci9_USGAYj7F7Fg3-+Z_08ySHa-YwSuGWBGsXXoKg@mail.gmail.com>
References: <cover.1491484515.git.joshua.g.lock@intel.com>
	<CABcZANnLVci9_USGAYj7F7Fg3-+Z_08ySHa-YwSuGWBGsXXoKg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Apr 2017 07:23:48 -0700
Message-ID: <CAMKF1sqe-Nt8iP-1HzuyTi0m1oa3uK8i92VNorjYa+bFDp4M3w@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Fixes for building on Fedora 26 (Alpha)
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
X-List-Received-Date: Fri, 07 Apr 2017 14:24:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 7, 2017 at 7:02 AM, Christopher Larson <kergoth@gmail.com> wrot=
e:
>
>
> On Thu, Apr 6, 2017 at 6:23 AM, Joshua Lock <joshua.g.lock@intel.com> wro=
te:
>>
>> As Fedora 26 has a new gcc [1] and a new system pkg-config implementatio=
n
>> [2] I
>> wanted to do some testing on that host OS so that we might be able to ge=
t
>> some
>> fixes in before Pyro/2.3 is released.
>>
>> The following series were the only changes required to start building (I
>> have
>> tested core-image-minimal, core-image-base and core-image-sato) on Fedor=
a
>> 26.
>>
>> 1. https://fedoraproject.org/wiki/Changes/GCC7
>> 2.
>> https://fedoraproject.org/wiki/Changes/pkgconf_as_system_pkg-config_impl=
ementation
>
>
> Quite interesting. I started poking at pkgconf a while back =E2=80=94
> https://github.com/kergoth/meta-kergoth-wip/tree/master/meta-pkgconf.

Thanks Chris, I think this is almost there then
a little bit of rework and proposal for 2.4. I think
you should own this feature for next release if you
have time.

> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


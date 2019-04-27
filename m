Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1ADBF7D00E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2019 09:32:53 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id h18so7849547wml.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2019 02:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=mhL/uyoHKF39wtJAd1imkeX7sW2QajKeHIZge0UPRx0=;
	b=FfzWF6tczp7CST/SRZCCzn1WPMvZ9dhVcp64Z7xtKLiosKRBp5sjuWCF8O3oH9tf8M
	+AV7x1YY7KH487O9NGJxIaxrFtK6iwgDu+ojf2LE6DoFPFq0SikdVwxJrMEteV3F9Y9k
	Q67ykSUV+AKbU1SeN+/lKUEJ9/kmLiVDA2Kz0rmwmlmNH3oIga18zxzUiejRY5012jdB
	Pnqd7bMIbqBgsP4XXHBHRGME3qS4pvkFqssq9Ubdot9P5qlCKDtzA2q1ORXJ3vigqO9j
	QVRZSw4WWwYMyeqiE7i8aeQd+DZc3Vv9/klYPyKUyIQ4vS1A9XE4k3nT1sxcI14oPVmz
	kF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=mhL/uyoHKF39wtJAd1imkeX7sW2QajKeHIZge0UPRx0=;
	b=mJfJhSXCFBs0RXp/zuAOEWo93KRwUl7OrQ/Y/H6lGu3Ze/kJaekdGq4GLtBe7FY52Q
	jro4Jc07PBWPck7Tm2XzFsQOFlrFmz+E3CnSH1sLgU3WhqVr8T4ya9kdRnf4dbI3r48l
	svKK/ZqWNfJCHuMR+qf7ehOUTN24TDvdXKZ5vdAkjYCv7aa1G2Dpfrj2BfW80DN+cZdX
	i8zmyJnvUlFlNyUqfmU4PAEViB7WnLCNi0KkgqjeuJn5FgfMjvTwLPEZ8VXfqgxwur21
	v+hQn7Io0E+YB2VkMV9PxFnLkuDA40G82R3A1G+1rT5fQSXaP1IHctCXbEYPQplaIPP5
	tdCQ==
X-Gm-Message-State: APjAAAWSVs+qC8VPuXG7GvObaOX1ilT6ZU4621vEQmZJe2sAJe6R3lBC
	EuRI2PQciAScOWcN00ZE9kQ=
X-Google-Smtp-Source: APXvYqxbWia8XV9FFHk1jJ7CNsfhkvc1D7pVhI0Hr6C0Adquc+TJpjjRBSzpQAP1AEri0uMZUpXWfQ==
X-Received: by 2002:a1c:a914:: with SMTP id s20mr1015750wme.55.1556357574725; 
	Sat, 27 Apr 2019 02:32:54 -0700 (PDT)
Received: from ?IPv6:2a02:8109:b5c0:1267:f14e:659c:1edd:c8ce?
	([2a02:8109:b5c0:1267:f14e:659c:1edd:c8ce])
	by smtp.gmail.com with ESMTPSA id
	y133sm31036064wmd.2.2019.04.27.02.32.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Apr 2019 02:32:53 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16E227)
In-Reply-To: <7e08518b4381a936e225eccdadee24a5a5521000.camel@linuxfoundation.org>
Date: Sat, 27 Apr 2019 11:32:53 +0200
Message-Id: <CE98D515-E3E6-445D-BDFF-574A1F0F031E@gmail.com>
References: <20190425135557.8967-1-fabio.berton@ossystems.com.br>
	<c05b9ebe4d9e79e34897851477e3c9b2a9e7602b.camel@linuxfoundation.org>
	<7e08518b4381a936e225eccdadee24a5a5521000.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC, v5] mesa: Convert recipe to use meson build system
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
X-List-Received-Date: Sat, 27 Apr 2019 09:32:54 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

This one is not about Mesa but rather failure to build recently updated vte-=
native due to host gcc being too ancient?

Alex

> On 26 Apr 2019, at 15.56, Richard Purdie <richard.purdie@linuxfoundation.o=
rg> wrote:
>=20
>> On Fri, 2019-04-26 at 14:55 +0100, Richard Purdie wrote:
>>> On Thu, 2019-04-25 at 10:55 -0300, Fabio Berton wrote:
>>>  - Remove all non related meson patches
>>>  - Change radeon driver to r100
>>>  - Add python3-mako-native gettext-native to DEPENDS
>>>=20
>>> Based on https://patchwork.openembedded.org/patch/158748/
>>>=20
>>> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>>=20
>> I think this breaks musl at runtime:
>>=20
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/538/ste=
ps/7/logs/step1c
>>=20
>> Specifically:
>>=20
>> [     5.224] (EE) Failed to load
>> /usr/lib/xorg/modules/extensions/libglx.so: Error relocating
>> /usr/lib/libGL.so.1: alphasort: initial-exec TLS resolves to dynamic
>> definition in /usr/lib/libGL.so.1
>=20
> and also:
>=20
> https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/457856/raw
>=20
> oe-selftest -r runtime_test.TestImage.test_testimage_virgl_gtk=20
>=20
> Cheers,
>=20
> Richard
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


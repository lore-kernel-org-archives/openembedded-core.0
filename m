Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id E27C27461C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 09:25:40 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id t67so2744814wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 02:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=vrAUfzjTVHAaRiVQ6ZvyZxMqTToZhyyzs+kNxK2ID0M=;
	b=RXkzRvWe/GMorRcbj2y39PsvmlPozpsdY2QfsOn0ukqwyhpcSIKfW5K2MzJLsd3IfY
	UA9PLgmuxHe4yiZF4XjUkKCcyb4pp109M1XM0gIjxhdz+SXGU9k7WCqWfJ6g8ag275JU
	7CamlLB2pmWDbYbeFsQorWjpQSG4BDTHaAXk4x10ooge/o9cJqdKWg4ZmngL1Ot574hl
	Y40xSAEZT7uLwoh7Yl/Be7QLI5SMZckTkwmWDfzl6Zum1BenZ0dcxuEmqN9HrI+q04bC
	CnyQwJlNcRm/4VYSGqM8H0lBAVu//tDibFnk1rGgjI+3ZsgXcARkD3HkiSKMvaCP5psR
	0nXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=vrAUfzjTVHAaRiVQ6ZvyZxMqTToZhyyzs+kNxK2ID0M=;
	b=Aiaxt3HfeFiSMoj/Ky0hzSkpd0A5Ijglcj59N3xuJ0qv3OdxCqLe7HDA9iN+JxUs6i
	ssGU4jWdZPvwJuZw2mS0p76Sgwpl5mdapiv9uPRJ5s5SHU9B4FXl9wQJoQ5+NsHR3Tp0
	7NwCaUZk9HjCLfZOHE7s9xyu+L0ZZ8/His79S5UdaFKa6HqVTWCkrvevjpM7PyabxBTh
	XYuTxvrG1YaVI62VvKIamNp6ZRAdE8Yd4doH7+1QCLm3n8/6wBHHW4sRKRzqbMtq5wJ7
	4EkzkRyiOt8vEKnNMU2CDgKtNYtLhOdcFIS1W0fhoMnRye5j+V8NmrtZb2x6KYIXjvDw
	XTyg==
X-Gm-Message-State: ALQs6tDMq7rLOhUOZ6ri2Lsd63hzKBGKMadbCJs8Zs1WS1iJ012nfZSP
	0IQ234zfrBh1y/2R0fafo9nvEg==
X-Google-Smtp-Source: AIpwx4/dzjMVMy3q9NWGaORdiBW4QHpBd29Gre3EwY+HF3COKPjdro2EcWlpzlkxaJ8qOxkRxCO04w==
X-Received: by 10.80.175.2 with SMTP id g2mr8526640edd.84.1523438741172;
	Wed, 11 Apr 2018 02:25:41 -0700 (PDT)
Received: from [172.20.0.85] ([185.47.135.167])
	by smtp.gmail.com with ESMTPSA id s21sm617220edd.96.2018.04.11.02.25.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Apr 2018 02:25:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.15\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1523291792.2942.100.camel@linuxfoundation.org>
Date: Wed, 11 Apr 2018 11:25:38 +0200
Message-Id: <9C357BAC-079B-4392-BF6F-D06CBEBEC242@dominion.thruhere.net>
References: <20180409115657.16651-1-koen.kooi@linaro.org>
	<20180409115657.16651-2-koen.kooi@linaro.org>
	<1523291792.2942.100.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3445.6.15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] bind: fix openSSL detection when using multiarch
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
X-List-Received-Date: Wed, 11 Apr 2018 09:25:41 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> Op 9 apr. 2018, om 18:36 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:
>=20
> On Mon, 2018-04-09 at 13:56 +0200, Koen Kooi wrote:
>> In multiarch /usr/include and /usr/lib/<tuple/ are not on the same
>> level anymore. This change will pass a correct includedir, but a
>> wrong libdir, but the linker picks it up anyway.
>>=20
>> Tested on multiarch and regular build.
>=20
> How far off working is mulitarch for OE-Core?

With the current state of OE-core =E2=80=98bitbake bash=E2=80=99 does =
the right things. I have a few patches that make more things work, but =
those need more testing.

> The reason I ask is I'd like to understand the scope of the changes
> needed to support it. It also influences whether these are sumo or =
post
> 2.5 changes.

So far all the changes are real bugfixes, like stopping recipes from =
doing  =E2=80=98basename libdir=E2=80=99 to get base_libdir. For things =
like python I=E2=80=99m running into problems where upstream does the =
right thing, but the OE multilib patches break that.

There is one change that will need careful consideration if it is meant =
for sumo, it looks like the sysroot code treats libdir differently from =
base_libdir:

	[koen@fedora-vm build-rpb]$ ls =
tmp-rpb-glibc/work/dragonboard_410c-linaro-linux/rpb-console-image/1.0-r0/=
recipe-sysroot-native/lib/
	x86_64-linux

	[koen@fedora-vm build-rpb]$ ls =
tmp-rpb-glibc/work/dragonboard_410c-linaro-linux/rpb-console-image/1.0-r0/=
recipe-sysroot-native/usr/lib/
	aarch64-linaro-linux   libcomps.so                libexpat.a     =
     libgdbm_compat.so             libgthread-2.0.so.0.5400.3  =
libmpc.so.3.1.0           libparted-fs-resize.so.0.0.1  libpython3.so    =
      libtermcap.so
	[..]
	libcheck.so.0.0.0      libelf.so.1                =
libgdbm_compat.a    libgthread-2.0.so.0           libmpc.so.3            =
     libparted-fs-resize.so.0  libpython3.5m.so.1.0          =
libssl.so.1.0.2

E2fsprogs installs into base_libdir, which gets the multiarch treatment, =
and mkfs.ext4 fails to find its libs during image generation.=20

Regardless of all that, <start handwaving> a lot <stop handwaving> of =
recipes will need packaging fixes, which should not go into a release =
branch like sumo, so, personally, I=E2=80=99d move it post sumo.

regards,

Koen=


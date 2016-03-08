Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id BBD8F731A8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 02:26:09 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id fl4so1777005pad.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 18:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=ASlVTMXtepcataSSq4cMQWgzd2nvEEHJJMGyicLzhc0=;
	b=jV9erAGuiWSZlcW1JpY8WY2BF/VhGrCyRlvkFPEqNqXS0Y6oDLVJYYuvH3cxKWkgNT
	LgRFMgyEaNIxf8kZpaDTnHN5teSB4nCFZ2tpemFL4MdFk/LCTwzHa5F346GQOLKROV7N
	uIe3/PaZ3kkUTsmiE6T20o9XiWgk5Zw6806QIBfIBP2OBj7IUXftNewJslFb9hI8txmE
	sVqtO4I8CY8jWwN6bzZ8BdKfqVP3xrPgR7YF3EvJl4RbbYF9TdEnR9LjbUoaOLS4/wcN
	zVRPS5F8gQoMml5k7kJtvUXqIYpIDA6LiRNvk/6IaeJfmzXN06eUv+LS/2NqkLUBkWgd
	fvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=ASlVTMXtepcataSSq4cMQWgzd2nvEEHJJMGyicLzhc0=;
	b=RhLRAdw9hkkIVSyXilv6nEv7dTuN3t/8ihQziN6JvT+5gW/x+QReUtR3hTG12wl8J2
	XLCDzjSk0H/kZti2AheX4nrdqfpy9cPEX20J+L6uqAaRaA7G3iMNaxTZKfBkpC5JlGEA
	z9TfERl3mVSWlBw0kfOcbIbyhSQUzktSwCED0gDiuhfAilBigmgixUvIkx+/RmLQEpMh
	L7BfpO433Z1qOTcTv7RMpZiyAXjsFxxVEQTSbjyRFX/hqGkrNd7wNzWWIIWieOBrY08Z
	KazxcpBUgXsVXiMGMCnub/7PmZ/s6U8quvC/U+jTdEgVsEv23Tu/U5bvgeI6wmwEbKIG
	YZXA==
X-Gm-Message-State: AD7BkJICFdT9geZXRcqKknmahtIqIa8TFNqBS4s45c3ByN5QyUNEVcJHCmdi9GSrI6FAzQ==
X-Received: by 10.66.65.137 with SMTP id x9mr37816870pas.137.1457403969962;
	Mon, 07 Mar 2016 18:26:09 -0800 (PST)
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com.
	[209.85.192.170]) by smtp.gmail.com with ESMTPSA id
	fk10sm498913pab.33.2016.03.07.18.26.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Mar 2016 18:26:08 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f170.google.com with SMTP id 63so1718262pfe.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 18:26:07 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.32.5 with SMTP id g5mr11299983pfg.95.1457403967618; Mon,
	07 Mar 2016 18:26:07 -0800 (PST)
Received: by 10.67.3.163 with HTTP; Mon, 7 Mar 2016 18:26:07 -0800 (PST)
In-Reply-To: <CAP9ODKq7M5kMuaQGeoUSssTEvhsnK-j-LqLeKQ6AqXJVoaeViQ@mail.gmail.com>
References: <1457361291-14009-1-git-send-email-daniel.dragomir@windriver.com>
	<1457361291-14009-2-git-send-email-daniel.dragomir@windriver.com>
	<CAP9ODKq7M5kMuaQGeoUSssTEvhsnK-j-LqLeKQ6AqXJVoaeViQ@mail.gmail.com>
Date: Mon, 7 Mar 2016 23:26:07 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrM+q11scZdSsKnzeKACvPj2u7RTBb=t8V+XYuvONzdHA@mail.gmail.com>
Message-ID: <CAP9ODKrM+q11scZdSsKnzeKACvPj2u7RTBb=t8V+XYuvONzdHA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][master] Add tune for 32-bit ARMv8-a
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
X-List-Received-Date: Tue, 08 Mar 2016 02:26:09 -0000
Content-Type: text/plain; charset=UTF-8

Hello Daniel,

On Mon, Mar 7, 2016 at 9:55 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Mon, Mar 7, 2016 at 11:34 AM, Daniel Dragomir
> <daniel.dragomir@windriver.com> wrote:
>> This patch adds tunes for 32-bit armv8 platforms. The user can select
>> the vector floating-point instruction set: vfpv4 or fp-armv8
>> and the thumb, neon, crc and crypto extensions.
>>
>> Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
>
> First I would like to thank you for working on this. This is very
> helpful and a good step in extending the ARMv8 platform support in
> OE-Core.
>
> I think you should also change the arch-arm64.inc file to use the
> armv8a.inc file. So it is more consistent.

When I tried to use armv8at-crc-crypto-fp-armv8-neon as default tune,
it fails with:

Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH
(armv8a-crc-crypto-fp-armv8-vfp).

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


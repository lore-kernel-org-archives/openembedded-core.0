Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 87A127F7B5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 16:15:31 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id x7so7571801pgl.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 08:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=ipkXYfKGaHoQKmR9OvPFFoTmK91Or8dKQyi/ON2obMI=;
	b=S8ZpZ5x2TG2eAtCwLo+k9giCZ5v3OUib8Vhp5TsVnKk09VfU0256BEZbNOQd5qLZpB
	BcoWHp0cTjxDj1+ynpIXQpUeXnXwuSfjJwJI1mhTxk5mtd0ByvNlAysErdWSiFVOs+tA
	VtVqD9WS6oGJUmDXhRkxk3N6cwdihLglGEw56T9jr5gAwsDZyaeJMm3VUfNXh7PDx/F6
	I0Pg8ZU4HqIeir6NI0Y7XwpOLeSWaVYGMfK/eaa5qgj+2QQ7MiqijMAX176hlvJRlTKn
	ZolDdzpgtfjt2ByuUepcSDXolFDNnn9u8g7YVOuiDPnmRdqzi5qcj8rW93EeYBB4qGkl
	Sx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=ipkXYfKGaHoQKmR9OvPFFoTmK91Or8dKQyi/ON2obMI=;
	b=oq5n1aFuPAz/d4K/GIJ4HMNeQ71DsjLG98su7NjnEazM2carT++WnYmrat+WH7XvmH
	TGIbISFhrO9UX7CrBgdwJKpOv6Mi78MToTTpMshrfIX87XAMuS7utq+Ch2P/KmcREx52
	+WunCwEWfL7QPUk37oRqe1esbe99Rz6MaK7/+9hzMDLrmBqXCNtBOVR0w1Ymc+1w95ke
	sKu8rqeHzoMlnVokCyejCbf4u//vfq/1IqM0XXydniQWS+Lzce/QdE0+tFzbpezb2/Pm
	ghf2jLh1kMoE9AMIdflsF3cq8CUA0t2Rl+SkLZtQLqCJKC7jSguye0PqiF+h+bxGCZaM
	7jUA==
X-Gm-Message-State: APjAAAV6nHqU4bWTnQPoBEuUXSmpaUthPMcXnrMPNuQQHsYiMV5o3k1n
	WchsVdHXZ5yCDB3bcQvcnVA30wAjABM=
X-Google-Smtp-Source: APXvYqyxrxJwNqhgs6WkJklhvYtiSSexBzaCByEDdM8ilAORHK/iNs/2NeEh4i4EpqGzq0tMAuIAwQ==
X-Received: by 2002:a65:66c4:: with SMTP id c4mr27070318pgw.429.1577031332287; 
	Sun, 22 Dec 2019 08:15:32 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:6c98:6c:25c3:7121?
	([2601:202:4180:a5c0:6c98:6c:25c3:7121])
	by smtp.gmail.com with ESMTPSA id
	c19sm21862895pfc.144.2019.12.22.08.15.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 22 Dec 2019 08:15:31 -0800 (PST)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20191205222617.31872-1-pkj@axis.com>
	<67f9adf18b174290bd5fc91b8aa00c66@XBOX03.axis.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	mQINBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABtCFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT6JAj0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
	FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
	vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
	ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
	IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
	g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
	rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
	FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
	wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
	t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
	aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
	oRoyDxC5Ag0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAGJAiUEGAEI
	AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
	mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
	ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
	vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
	JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
	EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
	dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
	/mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
	PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
	ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
	8CS2NxU=
Message-ID: <8803b6ee-3c95-331f-a34f-bd8ddca0ee32@gmail.com>
Date: Sun, 22 Dec 2019 08:15:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <67f9adf18b174290bd5fc91b8aa00c66@XBOX03.axis.com>
Subject: Re: [master][zeus][PATCH] cairo: Adapt license for cairo-dbg and cairo-src based on contents
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
X-List-Received-Date: Sun, 22 Dec 2019 16:15:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/22/19 5:00 AM, Peter Kjellerstedt wrote:
> *ping*
for master or zeus or both?

- armin
>
> //Peter
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-
>> bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
>> Sent: den 5 december 2019 23:26
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [master][zeus][PATCH] cairo: Adapt license for cairo-
>> dbg and cairo-src based on contents
>>
>> Introduce a PACKAGECONFIG "trace" to disable cairo-trace (the only
>> part of the code licensed as GPL-3.0, and which is normally packaged
>> separately in cairo-perf-utils). By disabling this, we can adapt the
>> licenses for cairo-dbg and cairo-src so that they do not include
>> "GPLv3+" when trace is disabled and thus they can be used also when,
>> e.g., GPL-3.0 is blacklisted in INCOMPATIBLE_LICENSE.
>>
>> The "trace" PACKAGECONFIG is enabled by default for backwards
>> compatibility.
>>
>> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> ---
>>  meta/recipes-graphics/cairo/cairo_1.16.0.bb | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-
>> graphics/cairo/cairo_1.16.0.bb
>> index e3de3f6164..36a7b3c180 100644
>> --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
>> +++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
>> @@ -17,6 +17,10 @@ LICENSE_${PN}-doc = "MPL-1.1 | LGPLv2.1"
>>  LICENSE_${PN}-gobject = "MPL-1.1 | LGPLv2.1"
>>  LICENSE_${PN}-script-interpreter = "MPL-1.1 | LGPLv2.1"
>>  LICENSE_${PN}-perf-utils = "GPLv3+"
>> +# Adapt the licenses for cairo-dbg and cairo-src depending on whether
>> +# cairo-trace is being built.
>> +LICENSE_${PN}-dbg = "(MPL-1.1 |
>> LGPLv2.1)${@bb.utils.contains('PACKAGECONFIG', 'trace', ' & GPLv3+', '',
>> d)}"
>> +LICENSE_${PN}-src = "(MPL-1.1 |
>> LGPLv2.1)${@bb.utils.contains('PACKAGECONFIG', 'trace', ' & GPLv3+', '',
>> d)}"
>>
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
>>
>> @@ -40,7 +44,8 @@ X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
>>
>>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)}
>> \
>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11
>> xcb', '', d)} \
>> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',
>> 'opengl', '', d)}"
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',
>> 'opengl', '', d)} \
>> +                   trace"
>>
>>  PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-
>> xlib,${X11DEPENDS}"
>>  PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
>> @@ -49,6 +54,7 @@ PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--
>> disable-valgrind,valgrind"
>>  PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
>>  PACKAGECONFIG[glesv2] = "--enable-glesv2,--disable-
>> glesv2,virtual/libgles2"
>>  PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
>> +PACKAGECONFIG[trace] = "--enable-trace,--disable-trace"
>>
>>  EXTRA_OECONF += " \
>>      ${@bb.utils.contains('TARGET_FPU', 'soft', '--disable-some-floating-
>> point', '', d)} \
>> --
>> 2.21.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



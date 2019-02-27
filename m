Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 007257CB92
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 01:30:10 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id z39so17451786qtz.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 17:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UmtqBSuoLGyzO4+K0QdsKYo7IU1r/JdWXGWCz/RJ2bI=;
	b=mv6HBDiELPbdWXiOOH6+RAjDS/cZC7UlqtJxjIsU9fA+FsCU6xFcmJ+KQU+eK0lTj5
	XwPjjDJeIIBT79Ucij6rogYW36ibE8eKYWTKelsa9ZLi4AxIGjlQFFplUYHXtPxyCWiw
	n/VxTUu9FP1+icFPM6pExJU6SnlfIPDMRmSmcGvCewQk5gfOW7s3bO/YUJ17DcaxzpYb
	UDliIUztHD4fs/I759VJcjnq0+CIhXtMCm68szGPsq3e86XOxN0zpCASmMK4AcpdEzAY
	yUL0hVt48IXqdOcadMgNhmnXeK3nuZs6BseYUOMofCxjUh8wBQCMI0A+DGiaV5OaqvOH
	mPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UmtqBSuoLGyzO4+K0QdsKYo7IU1r/JdWXGWCz/RJ2bI=;
	b=U6tsnlwJ2nxz0oQtprCPaj1wjG++mEHJZ9uEXPt+s70WtctJiFv2VgGnk+avjy9qPX
	ze+tl4C+HiWfTz508uJkNKSTH7sIgqiyxKsJSUTCAYliYWfntYukXz+s4Qo+LRGsNcJf
	9ZxrX/hWIYPJsccqxvMOWWTK8m6q2IviODoi2FqHYvfn7dD9JoL+qR+KrzuCwZppLmV7
	eGgVUgBmaINs9lK2vae7rnf3XXGflG/oxAtWEOCq/OTybziejMQTWpuZYqKxeC9Qx2yZ
	K4bDhECeG+NurgVcWN5S4yd0KLE+e7KZGaiJ88fm5oHRGvPKGTnYOlq7ORRyy52Uypyg
	silA==
X-Gm-Message-State: AHQUAubO3/1F53eA6st+uaYUQDLZCyAjDhoi0T5QqpOn9ksq5NjbTQiH
	tHlWsIic2VyxQFuflzroy3RYZPj7S0+yPrKCZ34=
X-Google-Smtp-Source: AHgI3IY48pQazYH+cDseMlZW6iqLV3/3IUxdJSgKclRrAk8DYdIVJyBU2r0uTdXpx4g5KFWP8zGKyqpwQ09V3p1cKJ4=
X-Received: by 2002:aed:3a09:: with SMTP id n9mr14439347qte.196.1551231011703; 
	Tue, 26 Feb 2019 17:30:11 -0800 (PST)
MIME-Version: 1.0
References: <20190225231742.13855-1-raj.khem@gmail.com>
	<20190225231742.13855-2-raj.khem@gmail.com>
	<CA+chaQeG6F_D0Tv3dMqk=F8kR-2Th8-6e4Y_VRL50PkCiOpnjQ@mail.gmail.com>
In-Reply-To: <CA+chaQeG6F_D0Tv3dMqk=F8kR-2Th8-6e4Y_VRL50PkCiOpnjQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Feb 2019 17:29:45 -0800
Message-ID: <CAMKF1soDQ=+wgQh_Xp0mDA-dudrkni1GFTcvgsOM9FL7hd6vtg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] mesa-gl: Set PACKAGECONFIG for target
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
X-List-Received-Date: Wed, 27 Feb 2019 01:30:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 26, 2019 at 5:17 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Fixes e.g.:
> ERROR: weston-5.0.0-r0 do_prepare_recipe_sysroot: The file /usr/lib/libEGL.so.1.0.0 is installed by both mesa-gl and libhybris, aborting
>
> but there is still:
> ERROR: weston-5.0.0-r0 do_prepare_recipe_sysroot: The file /usr/include/KHR/khrplatform.h is installed by both mesa-gl and libhybris, aborting
>
> I believe this header wasn't included in mesa-gl before recent changes, maybe something else needs to be filtered out?
>

Yes, https://patchwork.freedesktop.org/patch/166596/
worked in past but does not work anymore with latest version
maybe a regression or may be it will work with meson.
irrespective of what/where gets fixed, this patch helps us to move

For rpi layer, I have fixed it like this
https://github.com/YoeDistro/meta-raspberrypi/commit/46dbdbb1f9059dcd36e032a074023ac9c78be4aa

probably, that fix should be made to main mesa-gl recipe itself so all
can use it.

> On Tue, Feb 26, 2019 at 12:18 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> mesa.inc uses PACKAGECONFIG_class-target override to setup default
>> packageconfigs, which means that when we build mesa-gl for target then
>> it does no honor the ??= setting we have in mesa-gl recipe, and ends up
>> compiling egl, gles2 as well, which is not intended.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-graphics/mesa/mesa-gl_18.3.4.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa-gl_18.3.4.bb b/meta/recipes-graphics/mesa/mesa-gl_18.3.4.bb
>> index 73267eb4f0..d4b1c1c454 100644
>> --- a/meta/recipes-graphics/mesa/mesa-gl_18.3.4.bb
>> +++ b/meta/recipes-graphics/mesa/mesa-gl_18.3.4.bb
>> @@ -7,3 +7,4 @@ PROVIDES = "virtual/libgl virtual/mesa"
>>  S = "${WORKDIR}/mesa-${PV}"
>>
>>  PACKAGECONFIG ??= "opengl dri ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>> +PACKAGECONFIG_class-target = "opengl dri ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>> --
>> 2.20.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


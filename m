Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id D0F4F6100E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 01:39:59 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id v2so7762102qkj.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 17:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Vc8Jkdenu0lWO1cJdgedlUerfUzJC+STsewIhzrVmh8=;
	b=LGCJKDkru7yqSP1WlOFXzNiEMECvRNbmZ7xF4iJSRMuh354yfImCP1xk6HiQUsHGzl
	mYv/LcnvgiLIJdMzI+QiiwuoSLgbTbYM67q8cYPSJu70P+R3NpjGNhDlejQDNMurXSVL
	yatK2977qPDhcIRICfJ7d86WP0qbzbJi0I3e3DXX95pruMwob9JboeLSi9cLiz2G9pef
	ZEjaNhWbCYActqUwZoC5avkHgzh8VBfEApR3eepF0OkfLa4F809hasTsWYVraVo/F0LY
	kF33NZepBafF6YFT8nxDvV+6OVFHSadrb+ZSPS1c+OBztNid1tCmdvbyy+iw+EDerAHI
	HEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Vc8Jkdenu0lWO1cJdgedlUerfUzJC+STsewIhzrVmh8=;
	b=h613MmyhU5c2dl0Pd7vdQY/5/hn6vopZAfOpWr7k2kwOd8/DknkqjAdEKoV/AyXbly
	vGekAHJjk8F00Ou2jg70csG153RX4uPfrIDa0Fy/BzXp3EjKjvd3h3ClmcoUQGWYEP7S
	O7mIihJ5VsVLqY5dBw05KjIE4QpeScaYp0NP0EPGTYWJ3UIHxY6w8D8AxYqcZG89y+R8
	l7Q6/eCtNu3uboCHxrfNwymNuF0LGdyEI8UR+fnewOYFR8I1795vuXt9orj1yZWM4/5v
	Z1k/trUmhcKMl5NRb9OvdtiEHWn/wXTK4tfpyelf+83ApJVJyOjQMt5TFAtjzpRHSvho
	LwgA==
X-Gm-Message-State: APjAAAUMvg8jfNr9brHHpmTgxnweIPVBwDDVnV7efaxoyTenytD8MP0w
	kVyn/ZkVaje9OtcwsjP5JtnJ98TPKg2Ynxz0Ojk=
X-Google-Smtp-Source: APXvYqz3X/pWRQHQx2HQmPyyTTfMeF1gaEaG2n9H4e00SdazewreIgXPWVp0P0eSn22+YND6HFvdUpHF35+1MUWlu0k=
X-Received: by 2002:ae9:ef96:: with SMTP id d144mr392157qkg.337.1581644400455; 
	Thu, 13 Feb 2020 17:40:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581575578.git.raj.khem@gmail.com>
	<CANNYZj_T=J2fs39fpPKQjC5rGSg_opTeUGzPokeiU-5jwhRzTQ@mail.gmail.com>
	<CAMKF1sqJTPVFALwd0qx+zfWq3MsmhVL=n58CDMns1MwJH2mTsw@mail.gmail.com>
	<CANNYZj_C7i+2QKaFqjiDh0DFYYuYO7eY72wTR9NKz9JEjDtjCA@mail.gmail.com>
	<CAMKF1sot=-RJ0O-HLQRHWsi4OUHhUKsyi9WzoZiXOJrvaX_QGw@mail.gmail.com>
	<CANNYZj_7pG5EGjOR2BW3beJ3J__37GR29XZFaRotvuG9KFCnOQ@mail.gmail.com>
	<CAMKF1sp_fEAyuGxgxUG=bXuVEMm01NG+g6Vqz29Pseht0nPQDw@mail.gmail.com>
	<CANNYZj_tT5QSvyqhk-dOThThcO-rM-jT6PrTwM4pt8y7sPVSxQ@mail.gmail.com>
In-Reply-To: <CANNYZj_tT5QSvyqhk-dOThThcO-rM-jT6PrTwM4pt8y7sPVSxQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Feb 2020 17:39:34 -0800
Message-ID: <CAMKF1spgO92JJAaVCP26veEsedY_FAziNn6zi9cbpuy2_ofmSg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] recipe updates, testing fixes
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
X-List-Received-Date: Fri, 14 Feb 2020 01:40:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2020 at 2:05 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Thu, 13 Feb 2020 at 22:37, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>>
>>> Merging these patches will exclude rpm from images, and so will mask th=
e issue, so it's not orthogonal.
>>
>>
>> are you actively working to fix the test case ?
>> In that case it would be justified to hold them
>
>
> The test case that is failing for you (with ipk/opkg and core-image-sato-=
sdk) is passing just fine on the autobuilder [1], so I am missing informati=
on on how to reproduce. I have requested this information from you here [2]=
 and got no answer so far. Or is it some other test that is failing? That i=
sn't entirely clear.
>

autobuilder runs poky, to reproduce this you will need to use
oe-core+bitbake checkout

and then for qemux86-64

bitbake -ctestimage core-image-sato-sdk-ptest

it might also work in poky setup if you remove
PACKAGE_CLASSES ?=3D "package_rpm"
from local.conf

> [1] https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/155=
4/steps/8/logs/step1c
>
> [2] http://lists.openembedded.org/pipermail/openembedded-core/2020-Februa=
ry/292774.html
>
> Alex


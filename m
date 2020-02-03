Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 584EB60C6E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 20:51:10 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w15so20137836wru.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 12:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=WIojnB5TkFWlfv7amAFjlf+SWLebwgjMoZypKJD2Po0=;
	b=NN2LGEVRNw69Ko31ESzfOfGNW7/IjbsR4ab19cQWIE4+4v+an0S5y7a2sveBqZWY1h
	VRKPEah+IZEsD45s97BG2nXwNbMLXkLTgM9QabbfPFoY0+meV1/DQnhUuxkDsqlmdCBQ
	uAbSb4w34ydpGokSP/QrCotUZZYG7NWck9PHUVReyavj/agSjLZWfWfGgr+vdIBuSuQF
	ineh545rEXQ2f20+ZW42mjg9hzv2DoXn8fb/z5wDbMn4Oy64m9jAwaT/MxCMnZkBwP1w
	N6N4kjXu2uWkokSiBH1cSy0/B7QKT9TzUpWzY0vH7rR6swTVkHYTgKXCS9LrNzHIxzLn
	h3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=WIojnB5TkFWlfv7amAFjlf+SWLebwgjMoZypKJD2Po0=;
	b=cfEzAeOe3tVeIwvrKO+AZTq6OoVS+l9Otpe/kfe6lKpf+WRC551+Geh1ZamIpDzVe1
	oUojM1au06VZiQ8pgNfLHSBPUUlCBNuYxJLPVs3i1JOQP3zw4cd6+rlb7M0NVlRCGFVj
	roYs+A+MgRP3MRZUK+eltI7rXVitgF//9D+fAL5aCJCtFSWqIj/kbV6FLorY9G0n17DC
	GN2LXD9LmMML+MuBerrYfwna8NAPuX4/McEWWCzXZIU3PYZV5u8oXiR69bImbevOWXPW
	VZ0gLZHY1+WmhteSinp6f19PGgBES7Yv5C7Gh6nLOMsvmctNfRZqM/WEiFlHNfwO+4QY
	cPFw==
X-Gm-Message-State: APjAAAUgx7xlNk/pKfm+SYlLVAwCfOHuVob5e2bJkw6yOR9urBY19K76
	tlAZrUHGyEEMgvS4WzVTIrc=
X-Google-Smtp-Source: APXvYqw7OUcjEL3Hmuh92Kg8TEaykCD+gU3wDQvg05ZyRe6fZL/c4NFiPvfaZlybhZrZd5lU00s8nA==
X-Received: by 2002:adf:ec0d:: with SMTP id x13mr17281755wrn.400.1580763070982;
	Mon, 03 Feb 2020 12:51:10 -0800 (PST)
Received: from ?IPv6:2a02:2450:1011:56f:d820:600f:75bc:29ea?
	([2a02:2450:1011:56f:d820:600f:75bc:29ea])
	by smtp.gmail.com with ESMTPSA id
	v14sm27408735wrm.28.2020.02.03.12.51.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Feb 2020 12:51:10 -0800 (PST)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16G102)
In-Reply-To: <CAO5Uq5THBhHjkOH+r-yP3Y3nJF2KdVetoffmd2Cvy0LzSKzD+g@mail.gmail.com>
Date: Mon, 3 Feb 2020 21:51:09 +0100
Message-Id: <EAC0C485-76C4-441F-B123-C3407E1D247E@gmail.com>
References: <20200127231306.46105-1-alex.kiernan@gmail.com>
	<b672e48f8e33b9ea75b9772321f2db0951b38942.camel@linuxfoundation.org>
	<CAO5Uq5SGEmZCDvfMN=d=q_m40OohtLozOHBmRji8snYj4MZEeg@mail.gmail.com>
	<CAO5Uq5SG16CTCdNT1O7DgGc2Y4qUXrDU8VU1f9ox_WCL0a1kgg@mail.gmail.com>
	<CAO5Uq5THBhHjkOH+r-yP3Y3nJF2KdVetoffmd2Cvy0LzSKzD+g@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Upgrade 243.2 -> 243.4-latest
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
X-List-Received-Date: Mon, 03 Feb 2020 20:51:10 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Since move to 243 latest needs further work, how about moving straight to 24=
4?

Alex

> On 3 Feb 2020, at 21.26, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>=20
>> On Mon, Feb 3, 2020 at 7:55 PM Alex Kiernan <alex.kiernan@gmail.com> wrot=
e:
>>=20
>> Hi Richard
>>=20
>>> On Mon, Feb 3, 2020 at 2:13 PM Alex Kiernan <alex.kiernan@gmail.com> wro=
te:
>>>=20
>>> On Mon, Feb 3, 2020 at 10:26 AM Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>=20
>>>>> On Mon, 2020-01-27 at 23:13 +0000, Alex Kiernan wrote:
>>>>> Update to latest on the 243 stable branch. This includes (amongst othe=
r
>>>>> fixes) seccomp filter changes which fix failures with glibc 2.31, e.g.=

>>>>>=20
>>>>>  systemd-journald[543]: Assertion 'clock_gettime(map_clock_id(clock_id=
), &ts) =3D=3D 0' failed at src/basic/time-util.c:55, function now(). Aborti=
ng.
>>>>>=20
>>>>> Rebase 0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch=

>>>>>=20
>>>>> Drop 0001-unit-file.c-consider-symlink-on-filesystems-like-NFS.patch,
>>>>> fixed in 5c0224c7bf3c ("Handle d_type =3D=3D DT_UNKNOWN correctly").
>>>>>=20
>>>>> Drop 0001-seccomp-more-comprehensive-protection-against-libsec.patch,
>>>>> fixed in 70e8c1978a9a ("seccomp: real syscall numbers are >=3D 0").
>>>>=20
>>>> Unfortunately something in this causes:
>>>>=20
>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/109/builds/412
>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/413
>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/1545
>>>>=20
>>>=20
>>> That's disappointing...
>>>=20
>>=20
>> I'm failing to reproduce this - am I right in thinking the error I
>> should be looking for is this one:
>>=20
>> [ 3.997360] ide-cd: hdc: tray open
>> [ 3.999321] print_req_error: I/O error, dev hdc, sector 8388592 flags 807=
00
>>=20
>> or some variation on it?
>>=20
>> I've got testimage running across a number of the images I think are
>> the ones that are being run and I can't get any of them to fail.
>>=20
>=20
> Scratch that... it looks like one of the local changes is necessary to
> cause this - I'd foolishly reused an external source tree rather than
> just letting devtool deal with it.
>=20
> --=20
> Alex Kiernan
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


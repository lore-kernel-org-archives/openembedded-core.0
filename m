Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 991CA719F1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 17:38:29 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id n6so13409787qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 10:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eeAUayXuFQxKm80ciWYcay5rahPn+Vr2Ttx6rFR8O0E=;
	b=zCLqmhrL0VFdod2it4qWtJArwGQwbx+PwgbZaX5ea9QSH2nP8MsKfrLQma+QW9rnWj
	mnuWjD2JP0BFcPQdnE4hZZ4tWNhLLhPB2T2rjvszj1FJ41FHsvGKpbId6ayCW8sQnHUP
	pAVQ5+XKSdt4/v0qn9V6oXH4wxIwCAey4z96NkfZTOTmstoZJCF8duGA7WjViIA4gg0L
	NZWNHS/gbTW9g7lKnHPRKVSKzGjI96oDYB+SeOWEJFLOvKJomgZGdTsAfF7Aj/j01nkq
	yBylaH9PyBnCxd2JMAw/dtNRDspquscOAo3kPqlEUg+7NM1bwggZgQwU5Lxj6FdmuNsU
	cWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eeAUayXuFQxKm80ciWYcay5rahPn+Vr2Ttx6rFR8O0E=;
	b=A44c8UY6DLQp/aYzqZHGLGjpyUWRqBb+SvwyyTv6kD6gKQ295ROvM5BXh3kIgJvesf
	9ljIzjh7TiKA91HRPYZl31B7oYztTEfiKI7sAT2+5FT6cK43KgoKzZ1DEOQcC+2Rtx5E
	gbBpxM1JMPe/x6yk+C9p7d2CQ7D8klGv9mCUJZo4lWahSwd9XFRWPeDGn4bxZvLrKOAY
	SsQBIURGjFL0z9Uoo4WcU7TvwjY8vwrivBikRfDrvyi6BgJw8d6Z2AT2AkHYlBaS0v7/
	ZaGr0R2oWVur17Yo6Sozrh7IatTL14yPPNo8rPyxnO9EugqTM9TiJzPzIilOR/ZiLiT3
	82yA==
X-Gm-Message-State: ABUngve0WQ3v/IT6GXRyufO7cVSWl7FXRiTvlKCmqRGKu7dEmOSYJe4KaDN0/Ku4wLHjZ/NAJu/MOrXzeOV74OX/
X-Received: by 10.200.53.69 with SMTP id z5mr4346409qtb.64.1478108310468; Wed,
	02 Nov 2016 10:38:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Wed, 2 Nov 2016 10:38:10 -0700 (PDT)
In-Reply-To: <CD9B1D56-5BF3-4334-B0E7-B07BA2F4061F@gmail.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
	<fced9d20130046ffaf6daa1fe7d619098fdf91c6.1478013702.git.alexander.kanavin@linux.intel.com>
	<CAJTo0Laf3ZkyWqz2qY8Evj2R3OB1swBzfWeAZ9D+y3hFXjSecg@mail.gmail.com>
	<CD9B1D56-5BF3-4334-B0E7-B07BA2F4061F@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Nov 2016 17:38:10 +0000
Message-ID: <CAJTo0LZ3VFzECpoMJ4gW74KKxB4_eB-ZXhaYHeU5s0HfH4+y5g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/13] icu: update to 58.1
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
X-List-Received-Date: Wed, 02 Nov 2016 17:38:29 -0000
Content-Type: multipart/alternative; boundary=001a11405858c916e4054054e8af

--001a11405858c916e4054054e8af
Content-Type: text/plain; charset=UTF-8

On 2 November 2016 at 17:22, Khem Raj <raj.khem@gmail.com> wrote:

> the _l functions were added as aliases for ABI compatibility reasons,
> however, it should work well and is compatible with glibc versions. however
> its not defined that
>

They won't work as "proper" strtod_l takes a locale argument whereas musl
just points it at strtod and ignores the passed locale, so the behaviour
will be different.

Ross

--001a11405858c916e4054054e8af
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 November 2016 at 17:22, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div>the _l functions were added a=
s aliases for ABI compatibility reasons, however, it should work well and i=
s compatible with glibc versions. however its not defined that</div><div></=
div></blockquote></div><br>They won&#39;t work as &quot;proper&quot; strtod=
_l takes a locale argument whereas musl just points it at strtod and ignore=
s the passed locale, so the behaviour will be different.</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11405858c916e4054054e8af--

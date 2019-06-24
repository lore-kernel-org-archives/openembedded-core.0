Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id ED84F6C1F6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 02:41:31 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id x144so1373759lfa.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 19:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yD2fcxpM093MKYXMEitYL8XAlUNEsVwZL1GsnyaObTw=;
	b=Bd0mN5RNsrdFyucD4E8fHhTYENWDcp13Dh2y+tcbK91njJbuubtWcRqMrIcoHXRBv8
	bV5rOZuG3X0xpXaT3C1yOKq/qjFE02F0UnFo4Mc8sy/m4DcsS386964LaJ9nv9O6r9Gg
	Y0RBWAyrt0MpFewojko8A7ZorCra+95HLw4DLNdCKaYusBnzwdx3Gq9Gg6+crjk0I7Zq
	+4X25MEHLPKRNe5HVBSsrhR2dsopFRSse6EJJfBU52htCmdCtG9i/mKcpWxhiZiG0I1O
	WrcvyZt+ZLAAO2hnjnd9M1ug7slPxQ0X991W6r8bkNszyzj+GG+tQEoZZJXiLRRytc7D
	Tiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yD2fcxpM093MKYXMEitYL8XAlUNEsVwZL1GsnyaObTw=;
	b=nJpzDSApgzw6tzV/qwBS5Uv06hkBVYsjmT3ZMlNSzg1PCpHIYzogE7xpwpZ4qMYtWb
	nIajZVWyUH8THIvSBCKjLWsquIp70vE77urmxJ7KvyGJj2/1p31YGwSGwBsvFHwrW1Zg
	wHsemdRdl5F7mHc9Vhkx8sH+HGZcLsXgGV7PxDmuG2+I8NPOsylkPHqQ7oACahA4sS4z
	qs3OHgZ95++uiRLkXAqVlC53lzHhpdQfqQwQgoRds22Wy1WxUzZGR0SOk/2g3jP9ki+F
	o0PPymIfY20sbcDsAd0rCh6AovEN/GRbxXLqIVAWBvsIcULiqW/hOFdFwq/xoHWPo3wd
	7PPg==
X-Gm-Message-State: APjAAAWB1KyRZievCOyiJJbSpshGwpsQLa9pT3nCY+u3PrTOufrFV6Tt
	0hdWqlcmBDHq7p3WQSbQY99g6UYQPoBqx/NmPFo=
X-Google-Smtp-Source: APXvYqxdAua8TBaC3ZcsNTazuoXp4JRTY6SlcTSgrJkehEgQoGwM0LoBKAho71Ug+ThPoZIhowbPdmwobtJrWRP42sU=
X-Received: by 2002:a19:bec1:: with SMTP id o184mr43865401lff.86.1561344092536;
	Sun, 23 Jun 2019 19:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
	<0f5adba2f96da9396faa1e70f9eed84118cf735e.1559950879.git.timothy.t.orling@linux.intel.com>
	<CAMKF1sq5aOZ+6CSP+G88+JCYd4zMb6ZSe5MP5KWSSofPRbe4Ow@mail.gmail.com>
	<CANx9H-DLg1_vSEi1bBSSLCmycdyEa2MiJjZ9d=Owsc5bsR-GBA@mail.gmail.com>
In-Reply-To: <CANx9H-DLg1_vSEi1bBSSLCmycdyEa2MiJjZ9d=Owsc5bsR-GBA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 23 Jun 2019 19:41:05 -0700
Message-ID: <CAKmqyKO_33RpiC4PS6vVTBUz=0Bnc7F5zbGt7mmr6VHU1rK_vA@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] scons.bbclass: use python3-scons
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
X-List-Received-Date: Mon, 24 Jun 2019 02:41:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 20, 2019 at 5:22 PM Tim Orling <ticotimo@gmail.com> wrote:
>
>
>
> On Thu, Jun 20, 2019 at 6:37 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Fri, Jun 7, 2019 at 5:50 PM Tim Orling
>> <timothy.t.orling@linux.intel.com> wrote:
>> >
>> > SCons has supported python3 since 3.0.0 release, use it.
>> >
>> > [YOCTO #13381]
>> >
>> > Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
>> > ---
>> >  meta/classes/scons.bbclass | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
>> > index 9ee7d1587d..a8ddae35f7 100644
>> > --- a/meta/classes/scons.bbclass
>> > +++ b/meta/classes/scons.bbclass
>> > @@ -1,4 +1,4 @@
>> > -DEPENDS += "python-scons-native"
>> > +DEPENDS += "python3-scons-native"
>> >
>>
>> some packages haven't upgraded to py3 but use scons see
>> https://errors.yoctoproject.org/Errors/Details/249271/
>
>
>
> Thank you for reporting this. I was of course expecting some breakage and am committed to fixes. Please do report any other issues.

This also breaks the gpsd install, I tried upgrading to the latest
release and that didn't help. I am going to send a patch for the
upgrade which I tested with this patch reverted.

Alistair

>
> Latest mongo release appears to be 4.3.0 and appears to support python3:
>
> https://github.com/mongodb/mongo/blob/89e7419a897b2270931c9c029abf6de555d83e0f/SConstruct
>
> Is this an aceptable upgrade? I am not savvy on which versions are desirable.
>
>>
>> >  EXTRA_OESCONS ?= ""
>> >
>> > --
>> > 2.20.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


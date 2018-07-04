Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8D4789A3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 05:06:00 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id t4-v6so2302780vke.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2018 22:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=85/lHg3SiEk+mRpZQ8xMe6uEOFZKAPigAKa7yCRoCgk=;
	b=sDv+A8yZ0QQ16ewtJrGX4zNKnsqf9sPfxoWTZCXGVqfmmvueLlNvQMCUHq03sperJ7
	HDVfupmDnVCQmw9IFWBwCnWqB4F/jImKY8/iVH7xldtmPbW99F9MFbFRupyUz7FO0W7f
	t9dhbU3y9QiKBQIijxJPB3iqSOezAIkQmDrnqmoRMqrOqXY9T5bHe+PU6uQGkSKEzJVQ
	XS6HNtIk8AH4yx3MthceZsaOYCDtuKhLxJGIntMLSB4f4mdEyK61EDbunSJ8ut2YC62F
	24Bjj8uQlBLpq/02UfLiNNPu2bHFRWj+c4cRktjCAZotYq0Sk+6eExxjVxWO82MglOGw
	sEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=85/lHg3SiEk+mRpZQ8xMe6uEOFZKAPigAKa7yCRoCgk=;
	b=Yg3LVCO2XJ79+PUuq0j57ftpmKlQ4w7qN6Cz7U006Duiqz762fRQzqy6gta4sjtpxC
	TXbjBSBkTlQQ/sr+0g47q+Yy4LHh5SNVl6OFNAuU9uUrDM5DN+DkGXJECXHtyFToE2SW
	6zY1xWvU4hm9883a9sIKbEpAxLPEfGZ5PH4idl15fHRwG3sG3DCcmoBP2efIQbkRvCTe
	CFT+wfHZSApMVCWbyZFTpuNoIGs8IVYtSviH7A3kjrNO/Vy/tFtPjqKm6UxAW8yTl+jA
	z7rMx0uAew0sFEg22i0jVaj8RdSmQSJqAiDMH31ItwXxrdsCvfLy62GZMOBDi2g+dLDa
	Fxrg==
X-Gm-Message-State: APt69E1AFbqPLXkSmu6bXQb8jLoNbhonopZcmPDx3pJ8RZnioQwJFIiA
	CzxgG/cdjEg2JR2a9mjsnvUctPPMk3y8fmGnmGg=
X-Google-Smtp-Source: AAOMgpdzP1NNDeVQ8MCH8eyzlIJm97m2FVumqFtkRXDeIkRU0g4wOYhhrtKeK8IYwdwFTIdwBLtBM6mpF0VRJ9sUsXk=
X-Received: by 2002:a1f:9d16:: with SMTP id g22-v6mr241975vke.5.1530680761198; 
	Tue, 03 Jul 2018 22:06:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Tue, 3 Jul 2018 22:06:00 -0700 (PDT)
In-Reply-To: <CABcZANkGsmoBG=L=RsaJ07TDA6tU6vM5gxiP+m2ER=9BABEqpg@mail.gmail.com>
References: <1530665722-23464-1-git-send-email-armccurdy@gmail.com>
	<CABcZANkGsmoBG=L=RsaJ07TDA6tU6vM5gxiP+m2ER=9BABEqpg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 3 Jul 2018 22:06:00 -0700
Message-ID: <CAJ86T=WKTCDwSekWRR6mp-C1YQrPe3uhd6o+=gxKNo0ez+kWLg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-setuptools.inc: avoid using += with an over-ride
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
X-List-Received-Date: Wed, 04 Jul 2018 05:06:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 3, 2018 at 8:15 PM, Christopher Larson <kergoth@gmail.com> wrote:
> On Tue, Jul 3, 2018 at 5:55 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> An over-ride replaces the original value regardless of whether or
>> not it's set up with +=. As replacing the original value seems to be
>> the intention here, drop the += to make it more explicit. Also some
>> minor recipe formatting tweaks.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>
> Technically this is not the case, not precisely. += is appending to any
> existing DEPENDS_class-native value, and only *then* is the override applied
> to replace DEPENDS. So it's not appending to DEPENDS, it's appending to
> DEPENDS_class-native.

Yes, that's what I said, or at least tried to. It doesn't matter if
you assign to the over-ride directly or use += to append to it... it's
still an over-ride which completely replaces the original value.

> In this case, it's most likely doing it this way in
> the .inc so it's possible for the recipe including it to define
> DEPENDS_class-native alongside DEPENDS before the inclusion, but this is
> largely pointless, since they can always += to it *after* the inclusion
> instead. So I think you're good, most likely it's still fine to remove it,
> but I wanted to clarify, as there *are* times when this is a useful thing to
> do.

Right. I did look into the recipe, the include and the various classes
it uses fairly carefully and I'm pretty sure this is the right fix.

As to whether allowing += with an over-ride is a useful feature of the
language I'm not sure. There are other ways to achieve the same result
but it's a huge trap for new users who assume that it behaves like a
conditional append - I've seen that bug many times.

> --> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics


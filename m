Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RE4qa-0002bc-0n
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 21:52:12 +0200
Received: by wwf27 with SMTP id 27so474037wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 12:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=RN56XxYpbA9Pen4iaA4OJP8kmbtlKhP6BTtopljdNv0=;
	b=jwfuwOT6ibFZLdHurQr1MyvG8EDCHdQbhRCGT1LcUM6OQdHwgUnR0mjYMlWjlayg+X
	eD0ivtwQrHBrOi42ZV9DivlcXnqcYyuv9uqoYb+WHU795md8bHJd9yacLt/Mdm0AC1NF
	9XFAPOfFrkD98+zDC6/SRxjgjW9W5MUTZ4kZ8=
Received: by 10.216.72.72 with SMTP id s50mr170634wed.39.1318448510141; Wed,
	12 Oct 2011 12:41:50 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.160.80 with HTTP; Wed, 12 Oct 2011 12:41:30 -0700 (PDT)
In-Reply-To: <4E95E97B.10707@gravedo.de>
References: <cover.1318405370.git.Martin.Jansa@gmail.com>
	<49a800f40bd08aa23d227dccafd34b3e59a7ccb5.1318405370.git.Martin.Jansa@gmail.com>
	<4E954984.7020202@eukrea.com> <4E95D811.7090105@gravedo.de>
	<1E1E70C9-6B15-497F-8571-78D2EF0CD081@dominion.thruhere.net>
	<4E95DDD0.7020302@gravedo.de>
	<E575A7CF-9F72-418C-8143-9BA2701599BC@dominion.thruhere.net>
	<4E95E97B.10707@gravedo.de>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 12 Oct 2011 12:41:30 -0700
X-Google-Sender-Auth: -7fhVHeqKJCQmNcIFp9kObXx7yI
Message-ID: <CABcZANk9ayj8CfwmFTfj=_LBKQgdw4PwrQL2P+A-8d730_bc+g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core 1/4] qt4-embedded: remove dependency on tslib and use std. linux input
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Oct 2011 19:52:12 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 12, 2011 at 12:24 PM, Simon Busch <morphis@gravedo.de> wrote:
> On 12.10.2011 21:09, Koen Kooi wrote:
>>> What is breaking qt:e in this case? For me it's just a feature reduction
>>> and not a break (as qt:e still works fine with the linux input interface).
>>
>> When your TS is suddenly uncalibrated and jittery, it's a breakage, not a feature reduction.
>
> You're talking here about one case where tslib is needed to get a
> working touchscreen. But there are even cases where tslib is not needed
> to get a working touchscreen.

The base should be the bare min necessary to function in the common
case, in my opinion. Touchscreens that don't require calibration are
few and far between, so making the majority of machines with
touchscreens have to override it seems far from ideal.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics



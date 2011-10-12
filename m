Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RE4Dk-0001Zx-6V
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 21:12:04 +0200
Received: by wyh5 with SMTP id 5so1126112wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 12:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=zZRiryd3Vtk/hG2dZ5ZxCGiqnVO2vupppd2aH7XXXkM=;
	b=QXUuzmOac48pWivMX4L9Ql4dE56jDIB1ezcMEUbANoYiOy92yfRjM+wwvJoy/mT9Ek
	v3+M79vxkOri7KRVXO8ZYp7BlZpPtW/+m00paXTg0RzC0nw7caFCWSNXe1Nf38m6+3SP
	ov9D/ptPQHqFyOeOHcSP0DPvgLVAdaLx+nKGs=
Received: by 10.216.136.3 with SMTP id v3mr2972461wei.39.1318446381326; Wed,
	12 Oct 2011 12:06:21 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.160.80 with HTTP; Wed, 12 Oct 2011 12:04:58 -0700 (PDT)
In-Reply-To: <E9665FD1-F0CD-4ADB-941C-68FC58674D08@dominion.thruhere.net>
References: <cover.1318405370.git.Martin.Jansa@gmail.com>
	<49a800f40bd08aa23d227dccafd34b3e59a7ccb5.1318405370.git.Martin.Jansa@gmail.com>
	<4E954984.7020202@eukrea.com>
	<E9665FD1-F0CD-4ADB-941C-68FC58674D08@dominion.thruhere.net>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 12 Oct 2011 12:04:58 -0700
X-Google-Sender-Auth: cXWd64WuDvFmmLG0D-B_pYKoMgg
Message-ID: <CABcZAN=AZZjPcf6apKW82nOGF0K_9+3mmLx+5+uVmgLR7p9P+A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Wed, 12 Oct 2011 19:12:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2011 at 2:20 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> Op 12 okt. 2011, om 10:02 heeft Eric B=C3=A9nard het volgende geschreven:
>
>> Hi,
>>
>> Le 12/10/2011 09:45, Martin Jansa a =C3=A9crit :
>>> From: Simon Busch<morphis@gravedo.de>
>>>
>>> In most cases we don't need tslib in std. configuration as touchscreen =
access in most
>>> devices today is done with linux input interface. If some specific mach=
ine has a need for
>>> tslib support it should add the dependency in it's machine layer again =
and modify the
>>> profile script accordingly.
>>>
>> When using a resistive touchscreen, tslib is a common solution to handle=
 calibration and raw value processing : do you think this is a good thing t=
o remove this ?
>
> We ran into this at work and like Eric, I'm curious how calibration (and =
e.g. dejitter) works in the linux-input world combined with qt/e.

Not directly applicable, but I keep meaning to take a look at
http://atrey.karlin.mff.cuni.cz/~metan/evfilter/ - it seems quite
interesting.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics



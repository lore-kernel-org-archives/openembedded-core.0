Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SCdkm-0008Va-S6
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 23:16:32 +0200
Received: by qcso7 with SMTP id o7so283062qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 14:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=d8lusHbasuhshkPZsK/L25POOt2+9NeU0k5ymwONMKA=;
	b=0HL44Q+e/duWkqWp3SCRQ72Y5w+opLsgQUg36xRy7xTCOCdhsCzXDL9DWIm7YegIDh
	gDPhcBcLws7g9HG5MIF6CFFwdB+KjOYO2tsHPy7mskoNBBK+dhkqWeO+09nmD0RNbu41
	PcpXI3BVwWcTIU5R04MftTN3rEzpckSpPxTi1g9BGjZz2dpvMSfb5Ot/ca6cU35Q+XWE
	xiBtCY4C3zjBp0bOopm9SX5TRMjwkCBsSmVlMjJFxmv8rMsxLVXrvAa/8iJ5ZsGAO4Pt
	kADrKbz636Js0uVBIjhEQHqKY6b2xbQ+NAaqguYyqJFMP4O1N394PwhKofjugYYmEy0R
	194Q==
Received: by 10.224.207.70 with SMTP id fx6mr34380936qab.79.1332882451308;
	Tue, 27 Mar 2012 14:07:31 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.158.11 with HTTP; Tue, 27 Mar 2012 14:07:11 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1203271537460.30650@oneiric>
References: <alpine.DEB.2.02.1203271537460.30650@oneiric>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 27 Mar 2012 14:07:11 -0700
X-Google-Sender-Auth: -dB4tML8dOqrrth0BsHrRv7x9Hk
Message-ID: <CABcZAN=ALr4ARn_JW6O0MCffCt59pdT9yFx4y9bGWGYEJUaNag@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: first of several posts to clarify/document OE issues for beginners
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
X-List-Received-Date: Tue, 27 Mar 2012 21:16:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 27, 2012 at 2:00 PM, Robert P. J. Day <rpjday@crashcourse.ca> w=
rote:
> =C2=A0the setup: =C2=A0for better or worse, i and a local colleague are
> submitting a proposal to give a 1/2-day tutorial on OE/yocto at this
> year's ottawa linux symposium:
>
> =C2=A0http://www.linuxsymposium.org/2012/
>
> and my plan is to start from the absolute basics and walk attendees
> through the really simple operations they can do with OE, building up
> to (ideally) using yocto to configure and build an image for a
> pandaboard ES. =C2=A0along the way, there will be explanations of how to
> create and customize recipes and layers, how to define a whole new BSP
> and so on. =C2=A0but the most important part of all of this will be
> stressing the fundamentals -- what one can do beginning with an
> absolutely minimal OE/bitbake setup and slowly checking out additional
> layers.
>
> =C2=A0to that end, i'm going to start with nothing more than a git clone
> of oe-core and bitbake and demonstrate how much one can do with only
> that. =C2=A0obviously, with just that, you're restricted to generating on=
ly
> basic QEMU images but that's enough to demonstrate a great deal of OE.

Sounds interesting. I'm sure there are plenty of folks that could
benefit from such a thing. Good luck with it.
--=20
Christopher Larson



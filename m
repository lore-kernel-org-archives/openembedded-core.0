Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UPo6G-0002lL-BC
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 08:01:52 +0200
Received: by mail-ee0-f54.google.com with SMTP id e51so34622eek.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 22:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=VOIk92BSRzeGrhqfAaRQabQynBqPkCXQhV3pUDEvxUE=;
	b=VGfSjt72jZphVVn1NK5wpv0Fjs5VXMDBbg1Pp0a2NgINyg9Rnr3aOtQa5SowYMUdrC
	1LgDE2fa/NqxMBqjIH5lbkh+qRQeqAi0uVHKnzbJLhj+U1BIX6vPl/GJjto1tMM9GoJW
	XeDQGDiEyCecxf9MXEg3mfB0XXTREYqYIdGQzOkrd26I9MNjSzhYy4LG2YfQjY7lrmKX
	wjoBeltXYrMa/QKWVVGCItpHdcx7dlBF85b3qDxsMWePVE1rPlB+pkVKap3gsJZMpSgy
	rv/eHPuGsEiYbk6ht6RuSz/TPZyRgcqcloKpm7bZJ4PlPc0Zv3+nW94UtRE9b7/FBfr1
	kxhg==
X-Received: by 10.15.43.73 with SMTP id w49mr1913496eev.12.1365572659248;
	Tue, 09 Apr 2013 22:44:19 -0700 (PDT)
Received: from ?IPv6:2001:610:612::31a6:4231:f81d:656?
	([2001:610:612:0:31a6:4231:f81d:656])
	by mx.google.com with ESMTPS id q5sm41554853eeo.17.2013.04.09.22.44.17
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 22:44:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20130409190616.GE2474@jama>
Date: Wed, 10 Apr 2013 07:44:19 +0200
Message-Id: <929FF6AF-2956-41F0-92E5-E08C5C966909@dominion.thruhere.net>
References: <1365517275-30955-1-git-send-email-m.cavallini@koansoftware.com>
	<CAJTo0LZ6tKy0pDvPzdNw+z80NkXHB0kX7HxntsY_Hd+u3pUPwg@mail.gmail.com>
	<20130409174646.GD2474@jama>
	<C59D9F91-BDCD-496F-B6DA-8C6BB5990939@dominion.thruhere.net>
	<20130409190616.GE2474@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQnSdAY5XIwrnuOyOLoRb7hgFvnUos3OkWSgD2Wv2hue2W3LJRCoS5S9sifaska+6eJ9eGC9
Cc: Marco Cavallini <m.cavallini@koansoftware.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe][meta-oe][PATCH 2/4] xterm: add latest version of xterm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2013 06:02:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 apr. 2013, om 21:06 heeft Martin Jansa <martin.jansa@gmail.com> het =
volgende geschreven:

> On Tue, Apr 09, 2013 at 08:01:21PM +0200, Koen Kooi wrote:
>>=20
>> Op 9 apr. 2013, om 19:46 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:
>>=20
>>> On Tue, Apr 09, 2013 at 03:26:58PM +0100, Burton, Ross wrote:
>>>> On 9 April 2013 15:21, Marco Cavallini <koansoftware@gmail.com> =
wrote:
>>>>> * Recipe taken from oe-classic
>>>>> * Required by xinput-calibrator
>>>>=20
>>>> oe-core already ships not one but two terminal emulators, let's not
>>>> add another one.  Can we make this configurable in the recipe =
somehow
>>>> and default to use matchbox-terminal (which is in the Sato images)?
>>>>=20
>>>> Long-term, alternatives along the lines of Debian's
>>>> x-terminal-emulator is probably something we want.  Then again I'm
>>>> still not entirely sure why this is even spawning a terminal in the
>>>> first place.
>>>=20
>>> u-a is not enough, we also need VIRTUAL-RUNTIME-x-terminal-emulator =
for
>>> other recipes to RDEPENDS/RSUGGESTS/RRECOMMENDS on if they need some
>>> terminal (and don't care which one will be used).
>>=20
>> Isn't this what xdg-utils are for?
>=20
> Maybe I'm missing something, but I don't see how xdg-utils will help
> bitbake to find suitable runtime provider for =
"any-x-terminal-emulator".

Ah, I thought you were after runtime resolving of that, sorry.=



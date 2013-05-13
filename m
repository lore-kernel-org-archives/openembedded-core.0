Received: from mail-ea0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UbpMC-0000U3-Lo
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 11:47:54 +0200
Received: by mail-ea0-f170.google.com with SMTP id f15so1975348eak.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 02:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=JCezG9TklgrUbxdzl2/Vm6NugLrxt+402HnRs/PMqgI=;
	b=JsGKyiKd0JXhGhSbGyRaGgj9ZluBRWlbs1y8w0GA9GIngNwGaqtEwp8T5ZSINcgYVZ
	Bn7bkLt/BtYFNlIQugOhR/L99UWMtuZfg086p60IgaFHl5xufGKTbDc5vPaPOU6sf4HJ
	DrgueTETMiQRQyqNDus5pENJxHXu3w7DcFzP4TTNMyOeg3GULdf0XZn2KOxzldNrcaO5
	pZQnqi7owtpWJGPRmzEB5ghDUe48ec0fYqME1GWDXyTma5nswXJiBFUTKgIyYQ90gY09
	8PoorEhJmcit40CmLyjVn9kCxBtBPGcfFVRgD0lKrAkn8o7HO0msvRj79ip4epqSMMSx
	7B8A==
X-Received: by 10.14.0.129 with SMTP id 1mr76036190eeb.43.1368437379302;
	Mon, 13 May 2013 02:29:39 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id s8sm21606996eeo.4.2013.05.13.02.29.37
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 May 2013 02:29:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <5190A747.6090403@communistcode.co.uk>
Date: Mon, 13 May 2013 11:29:36 +0200
Message-Id: <A84A36D5-C3ED-4D82-A5AB-AF4C7CA6805F@dominion.thruhere.net>
References: <1368356739-17625-1-git-send-email-sgw@linux.intel.com>
	<9E4F6205-6171-4D60-A669-609A49F763C1@gmail.com>
	<518FD2F2.5070105@linux.intel.com>
	<020E3790-121B-49E9-87E3-55ACA9095B10@gmail.com>
	<5190166A.5050000@windriver.com>
	<5190A747.6090403@communistcode.co.uk>
To: ml@communistcode.co.uk
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQmFjArN6lnz7kkez1okO2fTYt8b4zB/1UlI0ShkEVSohZRIgvpZI3p4fejaHd1slmW0k59N
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] tcmode-default: Set 4.8 as default
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
X-List-Received-Date: Mon, 13 May 2013 09:48:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 mei 2013, om 10:41 heeft Jack Mitchell <ml@communistcode.co.uk> =
het volgende geschreven:

> On 12/05/13 23:23, Bruce Ashfield wrote:
>> On 13-05-12 5:49 PM, Khem Raj wrote:
>>>=20
>>> On May 12, 2013, at 10:35 AM, Saul Wold <sgw@linux.intel.com> wrote:
>>>=20
>>>> On 05/12/2013 09:29 AM, Khem Raj wrote:
>>>>> Hi Saul
>>>>>=20
>>>>> There is one serious problem that I ran into was that qemuarm 3.8 =
kernel segfaulted
>>>>> is it working for you ?
>>>>>=20
>>>> Nope your right there does appear to be a problem with ARM, I =
thought we where have sanity test issues again, I just completed a build =
and verified that I get a Kernel paninc with 3.8 Kernel and 4.8 GCC.
>>>>=20
>>>> Not ready yet!
>>>>=20
>>>> Khem, are you looking into it?  I have CC'ed Bruce for the kernel =
also.
>>>=20
>>> haven't looked into the problem in detail. Its one of those either a =
problem in gcc or gcc uncovering a latent bug in kernel.
>>=20
>> I'll get myself set up and do a build on Monday, see if anything =
obvious
>> pops up (i.e. start with the latest and see if it works, then bisect
>> back). I'm already poking at mips64, so I can do this in parallel.
>>=20
>> Bruce
>>=20
>>>=20
>>>=20
>>=20
>=20
> I know the beaglebone kernel was segfaulting on me until Koen updated =
to 3.8.11, I think it included some important backports. Would =
definitely be worth a try, Koen can point to you to commit which fixed =
it, I seem to have lost the link into the IRC nether.

I'm fairly sure this is the one:=20
=09
	=
http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit=
/?id=3D84237e8d1b43b896a86e14928993901993ede254

I only tested the 3.8.10 -> 3.811 update in one go, so it could a =
different patch.

regars,

Koen=



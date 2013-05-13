Received: from mail-pb0-f51.google.com ([209.85.160.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Uc1Mq-0004Pw-1W
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 00:37:20 +0200
Received: by mail-pb0-f51.google.com with SMTP id wy7so4806692pbc.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 15:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=TpHX4EvRyUc/nxPYDA68nc6IFtf5gtaZfkJrAQW4W44=;
	b=NJwc8HgEG7jrzeHIlfLJgVfolhlWa3yvTzs4pcc+cMYcG072NhX0wCSFbw8y4uHh6o
	xS/EduxkZi3f+NwQFosyzjeti3lKmGeTePFbULgItfiMvXeaFMP7SkgGkUpxh+nSYevj
	exOB5zyC4IfAunwvdM+8TgQbZzcVIEf5bOPTRBadii7gdy91mz+lguouPT3cpaIuWxI3
	jiscVO6L/+G6DQjrU4H4BtisMJwbs1AYaeoCgAnvK4yVVGXLAvHCuufR47CZpXosHwHK
	JGRPsvfgdzLuqUcfUl7+BDjDcFEN/S7EcBqAYkc0qt+0R1GbkMQHjMkZnvFNpl9hkBnf
	f7kQ==
X-Received: by 10.66.19.201 with SMTP id h9mr31547627pae.188.1368483545103;
	Mon, 13 May 2013 15:19:05 -0700 (PDT)
Received: from vjalali-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	fm2sm16476908pab.13.2013.05.13.15.19.03 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 May 2013 15:19:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <alpine.DEB.2.02.1305131805100.28372@oneiric>
Date: Mon, 13 May 2013 15:19:04 -0700
Message-Id: <A5DB8053-5E16-47A6-B83D-70F75EE5C592@gmail.com>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapTS=bCegKdFntAnaSja5rZ08c-J9aAzbQiuSTJLk6w3Bw@mail.gmail.com>
	<203C5055-E0F5-42E6-A607-DE8F2EE36D5C@gmail.com>
	<CAHUNapT_QZr6OwgbyahtxQ16DuRZSgbQrTYg63k-qark8H-_Rw@mail.gmail.com>
	<CADkTA4PzaR2ERLBArRSPxpX5U=NtXfG4_2NBBymMwmONZQSV6Q@mail.gmail.com>
	<CAHUNapTYnSeB0yfXdxtRjqk49y8VHO9KPR_RjxgsN5rWCvDvdg@mail.gmail.com>
	<alpine.DEB.2.02.1305131536070.2354@oneiric>
	<CAHUNapSAjqkiNCy4bBxp_7JLmMDRc0omMYggfgZ33KhbEyqbZw@mail.gmail.com>
	<alpine.DEB.2.02.1305131558330.23405@oneiric>
	<CADkTA4MSXBhGpZAzUzdWTZEgvsvkXp9EOO8PPgKX2-LSw3pTgA@mail.gmail.com>
	<alpine.DEB.2.02.1305131650030.12354@oneiric>
	<CADkTA4O7Ls7sPfKXcLnR_ordcHKnGqkPCRtrDjWm7xXeUDgqaA@mail.gmail.com>
	<alpine.DEB.2.02.1305131805100.28372@oneiric>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Mailer: Apple Mail (2.1503)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Add qemumips64 machine support
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
X-List-Received-Date: Mon, 13 May 2013 22:37:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Robert and Trevor

so whats your cross-gcc version ?
should be in tmpdir under

=
sysroots/x86_64-linux/usr/bin/mips64-angstrom-linux/mips64-angstrom-linux-=
gcc -v

On May 13, 2013, at 3:07 PM, "Robert P. J. Day" <rpjday@crashcourse.ca> =
wrote:

> On Mon, 13 May 2013, Bruce Ashfield wrote:
>=20
>> On Mon, May 13, 2013 at 4:51 PM, Robert P. J. Day =
<rpjday@crashcourse.ca> wrote:
>>> On Mon, 13 May 2013, Bruce Ashfield wrote:
>>>=20
>>>> That's all you need, here's my output:
>>>>=20
>>>> root@qemumips64:~# uname -a
>>>> Linux qemumips64 3.8.11-yocto-standard #1 PREEMPT Mon May 13 =
15:47:58
>>>> EDT 2013 mips64 GNU/Linux
>>>>=20
>>>> That's built from scratch on Yocto master. So clearly there's
>>>> something strange going on in the failing configs.
>>>=20
>>>   i attached a screenshot of the last part of the boot which =
includes
>>> the call trace, if that's of any interest.
>>=20
>> That's the same trace the Trevor saw, and that Khem and I have seen =
(and fixed)
>> a few times.
>>=20
>> I'm betting everyone is using a different SRCREV for the kernel that =
I am, since
>> I've built and booted this multiple times.
>>=20
>> Can you dump your board and meta top commits to the thread ?
>=20
>  for posterity, i'm wikifying my config and build attempt:
>=20
> http://www.crashcourse.ca/wiki/index.php/Adding_MIPS64_QEMU_machine
>=20
> so i don't have to repeat stuff.
>=20
> rday
>=20
> --=20
>=20
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, =
CANADA
>                        http://crashcourse.ca
>=20
> Twitter:                                       =
http://twitter.com/rpjday
> LinkedIn:                               =
http://ca.linkedin.com/in/rpjday
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D




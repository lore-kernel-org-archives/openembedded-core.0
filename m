Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QYkwT-0004pP-Bc
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 22:19:29 +0200
Received: from STOEXMBXC03.domain01.net
	([fe80:0000:0000:0000:99c4:3913:164.170.217.90]) by
	stoexhubfe01.domain01.net
	([10.12.10.6]) with mapi; Mon, 20 Jun 2011 22:15:56 +0200
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jun 2011 22:20:00 +0200
Thread-Topic: [OE-core] Linux 3.0-rcX (was Re: [RFC] qemu* kernel configs)
Thread-Index: Acwvhtx/4WbIbcvuTGS/8eN5TyDJqg==
Message-ID: <7207EB6A-7E96-45CE-81C0-A0B8C830B35E@chargestorm.se>
References: <8DD6CF6F-60B5-4DC0-95BC-3E47550A46FB@dominion.thruhere.net>
	<BANLkTimOnk0XvkfEqP25aOWK0_C7swHvzQ@mail.gmail.com>
	<3486EC57-81AC-4105-AC78-2721DF62E4FF@dominion.thruhere.net>
	<BANLkTi=ws6VEaWRBkDZ8-G5MWgRohNS=Kg@mail.gmail.com>
	<419BA759-C865-411F-BE59-060EBDD74258@dominion.thruhere.net>
	<BANLkTikzAUvWedb0Umy3GhwOtWKhZXRSWA@mail.gmail.com>
	<20110620184433.GA3427@chargestorm.se>
	<BANLkTikMX0owttHu2hbgpzvbJQcDPFf=4g@mail.gmail.com>
In-Reply-To: <BANLkTikMX0owttHu2hbgpzvbJQcDPFf=4g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: Linux 3.0-rcX (was Re: [RFC] qemu* kernel configs)
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
X-List-Received-Date: Mon, 20 Jun 2011 20:19:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 20 jun 2011, at 21:19, "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote=
:

> On Mon, Jun 20, 2011 at 2:44 PM, Anders Darander <anders@chargestorm.se> =
wrote:
>> I'm currently just curious, as I've played a little with 3.0-rcX in my
>> sparetime, and I've got a patch series in a local tree that at least
>> builds 3.0-rcX (and also removes some of the support for 2.4-kernels).
>> I've haven't yet looked into libc-headers, just enough to build the
>> 3.0-rcX kernel.
>=20
> My first focus is (and largely was) getting our qemu* patches and meta
> data up and
> running on the 3.0 kernel. I've booted most of the qemu variants now, wit=
h
> qemuppc consuming time to find some missing interrupts at the moment.

Ah, good to know. Then it is probably time for me to update my modified=20
linux-yocto recipe, to get the latest patches form  linux-yocto-dev.git.

> That was done from a purely kernel point of view. Setting the version to
> 2.6.40 was a temporary work around to focus on the kernel items.

Ok, sounds like a good move.

> I'm now starting into the fallout to the rest of the build and dependent
> packages. I'm staying away from 2.4 removal at the moment. So if you've
> got some patches to send, I'd be happy to save them, it would save me
> some time!

Sure, I'll try to get an RFC out tomorrow evening, shown what I've got sofa=
r. I started from the other end, trying to get all the kernel-build related=
 classes work for both 2.6.X and 3.X. There is definitely a lot more that c=
ould / should get removed in the end; but at least I've got a 3.0-rcX kerne=
l successfully built.

Regards,
Anders=



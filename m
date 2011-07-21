Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19BdezyPA02xpxaS9ixdFy5lQP+D6cJMLc=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qk1pk-0002si-Ig
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 00:35:09 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6LMV0QU028805
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 17:31:01 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <4E286EE4.3020502@mentor.com>
Date: Thu, 21 Jul 2011 17:30:59 -0500
Message-Id: <EF91174D-BB2C-43BF-9AAC-5E47779E9766@kernel.crashing.org>
References: <BBB3C9E0-A02C-4375-8075-5DD2C6588AB4@kernel.crashing.org>	<CAMKF1srHzFH9PpmKcSMFhSRUstGnt6Pf-z6pirXQFWTpci0vWg@mail.gmail.com>	<4E285C54.5000308@mentor.com>
	<CAMKF1spLfWX4ANoyAjzypTHpwBUJjOhRKT4Asg22=qw1qPcHQA@mail.gmail.com>
	<4E286EE4.3020502@mentor.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: siteinfo split between powerpc-common & powerpc-linux
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
X-List-Received-Date: Thu, 21 Jul 2011 22:35:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 21, 2011, at 1:24 PM, Tom Rini wrote:

> On 07/21/2011 11:20 AM, Khem Raj wrote:
>> On Thu, Jul 21, 2011 at 10:05 AM, Tom Rini <tom_rini@mentor.com> =
wrote:
>>> On 07/21/2011 09:48 AM, Khem Raj wrote:
>>>> On Thu, Jul 21, 2011 at 5:17 AM, Kumar Gala =
<galak@kernel.crashing.org> wrote:
>>>>> Why do we have a split between powerpc-common & powerpc-linux?
>>>>>=20
>>>>> I assume powerpc-linux is used and picked up for =
powerpc-linux-uclibc in addition to normal powerpc-linux.
>>>>>=20
>>>>> I'm looking at adding powerpc64 support and powerpc-common is all =
kinda of broken for it.  I'd like to just merge powerpc-common & =
powerpc-linux (as powerpc-linux 32-bit) for now and start a new =
powerpc-common that refactors 32/64 commonalities.
>>>>>=20
>>>>> Unless someone says otherwise about the meaning of these files.
>>>>=20
>>>> powerpc-common is shared between uclibc and eglibc at present and =
may
>>>> be shared with other OSes that may build with OE in future.
>>>> traditionally powerpc-common implicitly implied 32bit so I am not
>>>> surprised if its broken for ppc64. You could add powerpc64-common
>>>> and leave 32bit alone. See how its done for mips64 in oe.dev
>>>>=20
>>>> http://git.openembedded.org/cgit.cgi/openembedded/tree/site
>>>=20
>>> I'd argue that what we do for mips today is also wrong and I'm going =
to
>>> try and fix it as soon as I can.  In these cases we should have:
>>> common, common-linux, common-$libc, mips-common, mips-linux,
>>> mips64-linux and if needed mips64-linux-libc.
>>=20
>> yes that structure would be desirable. It would need a bit of =
overhaul
>> and lot of testing.
>> since you have something setup for your import from oe stuff for =
same.
>> may be you can take a stab at it
>=20
> Yeah, it's on my list now that the first step is really in :)  I hope =
to
> get the obvious bits rebased and tested and posted today at least, and
> then get to finishing the obvious bits and start trying the less =
obvious
> ones.  Glad you fixed uclibc, btw, that had me scratching my head on a
> few things we do today :)

Started an initial attempt at this for PPC and posted some RFC patches.  =
Take a look and we can go from there.

- k=



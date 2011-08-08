Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18asG+DXUZa+PCLQHAhDmJev589FShRevM=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QqS6W-0008TB-V9
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 17:51:01 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p78FkVB7009684
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Aug 2011 10:46:32 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1312815314.14274.213.camel@rex>
Date: Mon, 8 Aug 2011 10:46:32 -0500
Message-Id: <3C6E0A52-0FD9-4951-9D39-4B433F76B20D@kernel.crashing.org>
References: <F410F4D8-44AB-45D2-9DB5-1122C8F47077@kernel.crashing.org>
	<1312815314.14274.213.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: how to pass or set specific gcc flags?
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
X-List-Received-Date: Mon, 08 Aug 2011 15:51:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 8, 2011, at 9:55 AM, Richard Purdie wrote:

> On Sun, 2011-08-07 at 12:08 -0500, Kumar Gala wrote:
>> We'd like to pass:
>>=20
>> --enable-targets=3Dall
>>=20
>> on ppc when we target a 64-bit platform but happen to build a 32-bit
>> toolchain & rootfs, its useful to still have 64-bit support in the
>> compiler to build a 64-bit kernel if desired in this scenario.  Also,
>> this seems useful for the multilib situation.
>>=20
>> Wondering what the best way of doing this.  Adding something into the
>> tune-ppcFOOBAR file but not sure how to do that so it gets picked up
>> by the right toolchain pass.  And what do we even override?  I
>> suggested adding a GCC_EXTRA_OECONF.
>=20
> I'd caution against this since we don't currently handle packaging of
> toolchains directly using multilibs and I suspect the compiler =
wouldn't
> bootstrap properly either.
>=20
> Its not the compiler itself I worry about but pieces like libc and
> libgcc.

I dont think they have any issue with --enable-targets on ppc.

The issue is I'm trying to look at this based on our customer view =
point.  The majority of our customers that would utilize 64-bit are =
going to want to start with a 32-bit rootfs and than add some 64-bit =
bits to it.  Rather than the other way.

This is one reason I'm asking about how to deal with tune-ppce5500.inc =
and 32-bit vs 64-bit.

Now it might be ok short term since we have 2 toolchains, etc for =
multilib.  However at some point (shortly) we have to address this.

I think the 2 toolchains is UGLY and confusing to customers/users.  =
While I understand it from the point of view on how to take steps to get =
multilib going it doesn't mean we shouldnt start thinking about how to =
address these issues.

- k



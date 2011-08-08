Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/4g+q54herZIgUSVnJ5WbLMiDRi8vU57A=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QqSak-0000tV-3K
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 18:22:16 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p78GHXV1025012
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Aug 2011 11:17:37 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94DE904276@orsmsx504.amr.corp.intel.com>
Date: Mon, 8 Aug 2011 11:17:34 -0500
Message-Id: <6EDCDDBA-A5A5-4452-BFB1-2924310E8EAD@kernel.crashing.org>
References: <F410F4D8-44AB-45D2-9DB5-1122C8F47077@kernel.crashing.org>
	<9DA5872FEF993D41B7173F58FCF6BE94DE904276@orsmsx504.amr.corp.intel.com>
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
X-List-Received-Date: Mon, 08 Aug 2011 16:22:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

That's passing flags to gcc, I mean passing flags to how gcc is =
configured

- k

On Aug 8, 2011, at 10:53 AM, Kamble, Nitin A wrote:

> Kumar,
> Look at the meta/conf/machine/include/ia32/arch-ia32.inc where we have =
done special flags passing to gcc & other tools.
>=20
> Nitin
>=20
>=20
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf =
Of
>> Kumar Gala
>> Sent: Sunday, August 07, 2011 10:09 AM
>> To: Patches and discussions about the oe-core layer
>> Subject: [OE-core] how to pass or set specific gcc flags?
>>=20
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
>> tune-ppcFOOBAR file but not sure how to do that so it gets picked up =
by
>> the right toolchain pass.  And what do we even override?  I suggested
>> adding a GCC_EXTRA_OECONF.
>>=20
>> - k
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




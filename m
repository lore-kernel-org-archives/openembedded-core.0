Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1+pQ13gGBwXUzI7M06U4yJuhQCNw3V1apk=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QoEp3-000101-C3
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 15:15:50 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p72DBOBN024506
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2011 08:11:25 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1312217833.2344.511.camel@rex>
Date: Tue, 2 Aug 2011 08:11:25 -0500
Message-Id: <9C87AA3D-2AE6-4C57-B903-0D939E577BB8@kernel.crashing.org>
References: <1312208500-13381-1-git-send-email-galak@kernel.crashing.org>
	<1312209045.30326.515.camel@phil-desktop>
	<4727DFCB-0AA2-43D1-A0CA-58717D815FE8@kernel.crashing.org>
	<1312214835.30326.528.camel@phil-desktop>
	<4E36D800.1050906@mentor.com> <1312217833.2344.511.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] gcc: Add ability for tune files to pass in configure options to gcc
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
X-List-Received-Date: Tue, 02 Aug 2011 13:15:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 1, 2011, at 11:57 AM, Richard Purdie wrote:

> On Mon, 2011-08-01 at 09:44 -0700, Tom Rini wrote:
>> On 08/01/2011 09:07 AM, Phil Blundell wrote:
>>> On Mon, 2011-08-01 at 09:37 -0500, Kumar Gala wrote:
>>>> Not sure I understand the statement about disambiguate the =
resulting compilers, on PPC where I intend to utilize this we'd have the =
toolchains already named something like:
>>>=20
>>> The thing about disambiguating was that, if you're going to modify =
the
>>> configure opts for gcc-cross based (indirectly) on ${MACHINE} you =
need
>>> to consider what happens if you have a single build directory that's
>>> being used for multiple MACHINEs.
>>=20
>> What, I think, Kumar is driving at is why are you saying MACHINE when
>> it's a per core tune he's doing.  eg, every e5500 would do =
--with-cpu=3De5500
>=20
> The question is whether we'd like to get to the point of having more
> toolchains or less toolchains. I'd personally like to get to the point
> of less toolchains (e.g. one per arch) rather than more of them. We
> already pass all the appropriate flags around in the ADT/sdk code and =
in
> our own cross builds, we could easily add those to the default target
> environment too. This would actually make it clearer what is going on =
to
> the end user too rather than hiding the details into the gcc
> compilation.
>=20
> So all things considered, I don't think this is the best way to go...
>=20

How is this done or exported to the user of an ADT/sdk toolchain?

- k=



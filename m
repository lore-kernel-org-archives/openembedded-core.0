Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19S1XTSLVcRSw099BYG0vcVDrWPc+Nr4KU=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qr9lS-0003LO-7j
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 16:28:11 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7AENZG8004306;
	Wed, 10 Aug 2011 09:23:36 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <4E428C20.5030809@mlbassoc.com>
Date: Wed, 10 Aug 2011 09:23:35 -0500
Message-Id: <003F5792-C038-4996-9D00-AA9E6F4E5151@kernel.crashing.org>
References: <1312912632.14274.312.camel@rex>	
	<C10D3FB0CD45994C8A51FEC1227CE22F2FA76750B1@shsmsx502.ccr.corp.intel.com>	
	<27DA7A3C-0FE9-43CA-963C-F6217A1D2C9F@kernel.crashing.org>	
	<1312981676.14274.376.camel@rex> <1312982631.14274.379.camel@rex>	
	<4E4288F0.2010904@mlbassoc.com> <1312983621.14274.383.camel@rex>
	<4E428C20.5030809@mlbassoc.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: populate_sdk: We need to ensure that the SDK sysroot reflects PACKAGE_ARCH
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
X-List-Received-Date: Wed, 10 Aug 2011 14:28:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 10, 2011, at 8:48 AM, Gary Thomas wrote:

> On 2011-08-10 07:40, Richard Purdie wrote:
>> On Wed, 2011-08-10 at 07:34 -0600, Gary Thomas wrote:
>>> On a related thought to these changes - how does this play if
>>> you use multiple SDKs for different, but somewhat related, =
architectures?
>>> I'd like to create a simple SDK (just toolchain mostly) using =
'meta-toolchain'
>>> for both armv5te and armv7a and install them simultaneously on the =
same
>>> host.  My previous attempts at this fell flat as there were a number =
of
>>> files marked as "arm" (i.e. not armv5te or arvm7a) that were common =
between
>>> the two SDK packages, but they didn't seem to be identical.
>>=20
>> This is supposed to work but wouldn't due to the issue and the patch
>> I've proposed. Whether that is the only issue I don't know.
>=20
> I'll be glad to test this once you've worked it out.
>=20
>>=20
>> Can you remember which files we're talking about here?
>=20
> Not right off - there were just a ton of directories with only arm in =
the
> path that seemed to be architecture dependent.  I think it's all =
related to
> TARGET_SYS vs MULTIMACH_TARGET_SYS and how/where they are used.
>=20
>>=20
>>> With these changes, will it be possible to support such sets of =
multiple
>>> toolchains?  (No, ADT is not the answer - I just want the =
toolchains)
>>=20
>> ADT uses meta-toolchain-* so its all related.
>=20
> Fair enough, I just don't want to have to use ADT just to install a =
toolchain.

And this is also something we're wanting to work to allow different PPC =
toolchain variants to live together

- k=



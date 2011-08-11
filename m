Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX197byZtFEh5mwKh0OqRDPF9iwnsN0OGKQw=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QraUR-0001Ak-Cy
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 21:00:23 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7BItkWQ009084;
	Thu, 11 Aug 2011 13:55:46 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1313088076.14274.461.camel@rex>
Date: Thu, 11 Aug 2011 13:55:48 -0500
Message-Id: <13C07736-A436-4459-A5D7-24FEB5726576@kernel.crashing.org>
References: <1312484099-29314-1-git-send-email-galak@kernel.crashing.org>
	<4E437883.90406@intel.com>
	<1D98D492-1D74-49DE-A884-C919AFF30BDD@kernel.crashing.org>
	<1313076641.14274.431.camel@rex> <1313088076.14274.461.camel@rex>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: use ${base_lib} to match gcc default configuration
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
X-List-Received-Date: Thu, 11 Aug 2011 19:00:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 11, 2011, at 1:41 PM, Richard Purdie wrote:

> On Thu, 2011-08-11 at 16:30 +0100, Richard Purdie wrote:
>> On Thu, 2011-08-11 at 01:47 -0500, Kumar Gala wrote:
>>> revert this is not acceptable as that will break ppc64 builds.
>>>=20
>>> I think you need to look at 64bithack.patch and if we really should =
be using it for multilib builds.
>>=20
>> This just sounds like gcc totally ignores the the library directory
>> we're using and that is plain wrong :(.
>>=20
>> I'd much prefer gcc didn't make assumptions in this case and did what
>> were were configuring it to do. That is why there is that 64bit hack
>> there and I think gcc should be honouring however we configure the
>> library directories, not doing what it thinks is best...
>=20
> I did more digging and this really just highlights why we have that
> 64bit "hack" patch in the first place.
>=20
> GCC has internal multilib 'magic' which assumes certain library layout
> in the 64 bit case. The implication is if you build 64 bit, you cannot
> have baselib !=3D "lib64". Whilst I can understand this on desktop =
system,
> I'd suggest our build system has a better idea what its doing than =
most
> and can cope without hardcoding things.
>=20
> This is why the default builds in the gcc config are set to "." by =
that
> patch, that respects whatever base_libdir is set to. I'd suggest we do
> this for x86, pcc and mips 64 bit and revert the origin baselib patch,
> but this time better improve the patch documentation about why this is
> necessary.
>=20
> Cheers,
>=20
> Richard

Khem had some feelings on this so I'll let him chime in

- k=



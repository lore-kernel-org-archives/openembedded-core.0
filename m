Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1+LkbU0cI06TYpApSZnRN+TN4IbmekqmtI=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QzUsB-0000Ua-4G
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 16:37:35 +0200
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p82EVlYL022090
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Sep 2011 09:32:38 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <5755C992-C736-4714-9DE3-761E3E74C6F8@kernel.crashing.org>
Date: Fri, 2 Sep 2011 09:32:37 -0500
Message-Id: <2E905612-1500-4061-B4DF-76AF100F7ADA@kernel.crashing.org>
References: <5755C992-C736-4714-9DE3-761E3E74C6F8@kernel.crashing.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: Adding TARGET_VECTOR
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
X-List-Received-Date: Fri, 02 Sep 2011 14:37:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 25, 2011, at 9:35 AM, Kumar Gala wrote:

> We have some packages like flac that are aware of vectorization that =
may or may not exist on a given processor.  I was wondering if adding =
something like TARGET_VECTOR similar to TARGET_FPU made sense as a way =
for recipes to decide on how to set various vectorization flags if =
needed.
>=20
> I was looking at this mostly from the PPC side in which we have:
>=20
> TARGET_VECTOR =3D "" /* processor has no vector hw */
> TARGET_VECTOR =3D "altivec" /* processor has AltiVec support */
> TARGET_VECTOR =3D "spe" /* processor has signal processing engine =
support */
> TARGET_VECTOR =3D "vsx" /* processor has Vector-Scalar Extension */
>=20
> Not sure what makes sense for x86, ARM, or MIPS.

Any comments on this?

- k=



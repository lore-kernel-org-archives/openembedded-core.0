Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19i0pd2SdJbtllJqoL7fZazAWWCG20H/jI=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QntzE-00056E-Jp
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 17:00:57 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p71EuW2W009123
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 09:56:33 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <4E36BDFA.4020409@windriver.com>
Date: Mon, 1 Aug 2011 09:56:34 -0500
Message-Id: <24530743-BB87-468D-908B-4321D5C8D9F6@kernel.crashing.org>
References: <1312208782-14078-1-git-send-email-galak@kernel.crashing.org>
	<4E36BDFA.4020409@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] eglibc_2.13: Add support for handling sqrt & sqrtf on powerpc
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
X-List-Received-Date: Mon, 01 Aug 2011 15:00:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 1, 2011, at 9:53 AM, Mark Hatle wrote:

> On 8/1/11 9:26 AM, Kumar Gala wrote:
>> Some of powerpc's dont support the fsqrt[s] instructions so we need =
an
>> implementation of the library functions for those processors.
>>=20
>> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
>> ---
>> .../recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch |  538 =
++++++++++++++++++++
>> meta/recipes-core/eglibc/eglibc_2.13.bb            |    3 +-
>> 2 files changed, 540 insertions(+), 1 deletions(-)
>> create mode 100644 =
meta/recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch
>=20
> I'm a bit confused by this patch.  Why is gcc even generating (or =
trying to) the
> fsqrt instructions on cores that don't have it?  Did someone optimize =
gcc so
> that it always requires fsqrt on PPC?  (This is horribly broken =
behavior BTW...)
>=20
> As for the patch, I don't object.. but this just looks like the wrong =
solution
> to me..
>=20

Mark, the issue isn't w/gcc but glibc itself.  It will use inline asm of =
the 'fsqrt[s]' instruction.  This we need a different implementation of =
the math lib functions for these cores.

- k=



Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19azlaYW8xTBxeMluus8XlaC+Qk3tk4NHM=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QoSBk-0000OF-3c
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 05:32:08 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p733R7bK023795;
	Tue, 2 Aug 2011 22:27:09 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <4E38892E.5090509@linux.intel.com>
Date: Tue, 2 Aug 2011 22:27:08 -0500
Message-Id: <CCEBBFC0-9BA4-40E0-9A77-9BDE823FAEA6@kernel.crashing.org>
References: <1312208782-14078-1-git-send-email-galak@kernel.crashing.org>
	<115F44DD-4174-4BC3-B268-AE9EC4CB8BCD@kernel.crashing.org>
	<4E38892E.5090509@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 03 Aug 2011 03:32:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 2, 2011, at 6:33 PM, Saul Wold wrote:

> On 08/02/2011 04:15 PM, Kumar Gala wrote:
>>=20
>> On Aug 1, 2011, at 9:26 AM, Kumar Gala wrote:
>>=20
>>> Some of powerpc's dont support the fsqrt[s] instructions so we need =
an
>>> implementation of the library functions for those processors.
>>>=20
>>> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
>>> ---
>>> .../recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch |  538 =
++++++++++++++++++++
>>> meta/recipes-core/eglibc/eglibc_2.13.bb            |    3 +-
>>> 2 files changed, 540 insertions(+), 1 deletions(-)
>>> create mode 100644 =
meta/recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch
>>=20
>> What about this patch?
>>=20
>> - k
>=20
> Kumar,
>=20
> I have this one staged in a testing area.
>=20
> Sau!

thanks, hopefully the 'binutils: Add support for powerpc e5500 core' as =
well

- k=



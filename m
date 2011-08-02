Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/EqyjdtY6W4SEOzpDPl3/KpQXAZub4dJI=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QoM92-0007ik-UO
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 23:04:57 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p72L0YcE030406
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2011 16:00:34 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1312317548.2344.612.camel@rex>
Date: Tue, 2 Aug 2011 16:00:35 -0500
Message-Id: <992464A7-1010-4A47-BFAA-A7F93C683C99@kernel.crashing.org>
References: <1312312720-20828-1-git-send-email-galak@kernel.crashing.org>
	<1312317548.2344.612.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] tune/arch-powerpc64: keep insync with arch-powerpc.inc
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
X-List-Received-Date: Tue, 02 Aug 2011 21:04:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 2, 2011, at 3:39 PM, Richard Purdie wrote:

> On Tue, 2011-08-02 at 14:18 -0500, Kumar Gala wrote:
>> * Add DEFAULTTUNE setting
>> * Sync TUNE_PKGARCH with:
>> 	commit 20f285728219c1efcc23d8e861902c212893c68d
>> 	Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>> 	Date:   Tue Aug 2 12:40:06 2011 +0100
>>=20
>> 	    tune/ppc: Fix various TUNE_PKGARCH issues
>=20
> Quick question, are all ppc64 cores ppc32 capable or not?
>=20
> Cheers,
>=20
> Richard

yes

- k

>=20
>> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
>> ---
>> .../machine/include/powerpc/arch-powerpc64.inc     |    5 +++++
>> 1 files changed, 5 insertions(+), 0 deletions(-)
>>=20
>> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc =
b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
>> index a965d59..daad355 100644
>> --- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
>> +++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
>> @@ -1,8 +1,13 @@
>> +DEFAULTTUNE ?=3D "powerpc64"
>> +
>> TUNEVALID[m64] =3D "Power ELF64 standard ABI"
>> TUNE_CONFLICTS[m64] =3D "m32 nf"
>> TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "m64", =
"-m64", "", d)}"
>> TUNE_ARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], =
"powerpc64", "", d)}"
>>=20
>> +PPCPKGARCH =3D "${TUNE_ARCH}"
>> +TUNE_PKGARCH ?=3D "${PPCPKGARCH}"
>> +
>> AVAILTUNES +=3D "powerpc64"
>> TUNE_FEATURES_tune-powerpc64 ?=3D "m64 fpu-hard"
>> BASE_LIB_tune-powerpc64 =3D "lib64"
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




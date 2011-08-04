Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX185NnOvnn1bSop47cmk/TFrdL058cudABg=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qp3hb-00039d-Bt
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 21:35:31 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p74JV5xe012491;
	Thu, 4 Aug 2011 14:31:06 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <4E3AEE66.9020608@linux.intel.com>
Date: Thu, 4 Aug 2011 14:31:07 -0500
Message-Id: <9716906E-6EFF-47CA-8B95-156A70F931CE@kernel.crashing.org>
References: <1312483886-31682-1-git-send-email-galak@kernel.crashing.org>
	<4E3AEE66.9020608@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf/powerpc64: Set baselib to 'lib64' for ppc64
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
X-List-Received-Date: Thu, 04 Aug 2011 19:35:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 4, 2011, at 2:09 PM, Saul Wold wrote:

> On 08/04/2011 11:51 AM, Kumar Gala wrote:
>> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
>> ---
>>  meta/conf/bitbake.conf |    4 +++-
>>  1 files changed, 3 insertions(+), 1 deletions(-)
>>=20
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 6f0b42c..1d83459 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -7,7 +7,9 @@
>>  #
>>=20
>>  # Used by multilib code to change the library paths
>> -baselib =3D "lib"
>> +baselib =3D "${BASELIB}"
>> +BASELIB =3D "lib"
> Should the be ?=3D
>=20
>> +BASELIB_powerpc64 =3D "lib64"
>>=20
> And this located in the arch-powerpc64 file?
>=20
> Sau!

This is what Richard recommend (that we do this just in bitbake.conf).  =
I don't think this can live in arch-powerpc64 and things work properly =
for it to be picked up everywhere it needs be.

- k



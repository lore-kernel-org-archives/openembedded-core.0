Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18gx5WkCPxmqjJ5vANix/BqidPZaO988rY=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QopEK-0005BB-8N
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 06:08:20 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7443vJu006332
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 23:03:58 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1312390439.2344.706.camel@rex>
Date: Wed, 3 Aug 2011 23:03:57 -0500
Message-Id: <979DCE00-39AF-4DF4-B5EE-97E662FAEDAF@kernel.crashing.org>
References: <1312349222-27254-1-git-send-email-galak@kernel.crashing.org>
	<1312390439.2344.706.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH v2] image-mklibs.bbclass: Add powerpc64 arch support
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
X-List-Received-Date: Thu, 04 Aug 2011 04:08:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 3, 2011, at 11:53 AM, Richard Purdie wrote:

> On Wed, 2011-08-03 at 00:27 -0500, Kumar Gala wrote:
>> powerp64 dynamic loader is 'ld64.so.1'.
>>=20
>> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
>> ---
>> * Use correct name of ppc64 dynamic loader
>> * user ${baselib} so if we are /lib or /lib64 things work
>>=20
>> meta/classes/image-mklibs.bbclass |    3 +++
>> 1 files changed, 3 insertions(+), 0 deletions(-)
>>=20
>> diff --git a/meta/classes/image-mklibs.bbclass =
b/meta/classes/image-mklibs.bbclass
>> index 9f5a4ea..83f609c 100644
>> --- a/meta/classes/image-mklibs.bbclass
>> +++ b/meta/classes/image-mklibs.bbclass
>> @@ -19,6 +19,9 @@ mklibs_optimize_image_doit() {
>> 		powerpc | mips | microblaze )
>> 			dynamic_loader=3D"/lib/ld.so.1"
>> 			;;
>> +		powerpc64)
>> +			dynamic_loader=3D"/${baselib}/ld64.so.1"
>> +			;;
>> 		x86_64)
>> 			dynamic_loader=3D"/lib/ld-linux-x86-64.so.2"
>> 			;;
>=20
> Can we use ${base_libdir} there please?
>=20
> ${baselib} is really intended only for use to build the other
> expressions.
>=20
> We should probably use ${base_libdir} elsewhere in this file too. I =
also
> suspect prelinking of a multilib image may need work :/.

Sent a fixed patch for powerpc64 and a new patch to change everyone =
else.

- k=



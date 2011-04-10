Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q8wM1-0008L2-4t
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Apr 2011 17:15:10 +0200
Received: by iwn10 with SMTP id 10so5247688iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Apr 2011 08:12:57 -0700 (PDT)
Received: by 10.231.117.162 with SMTP id r34mr4425373ibq.38.1302448377266;
	Sun, 10 Apr 2011 08:12:57 -0700 (PDT)
Received: from [10.0.0.28] ([209.118.237.66])
	by mx.google.com with ESMTPS id i3sm3500744iby.57.2011.04.10.08.12.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Apr 2011 08:12:55 -0700 (PDT)
References: <cover.1301923706.git.josh@linux.intel.com>
	<52BC8856-1494-4AC6-B04F-0A9DC5A8AB2B@dominion.thruhere.net>
	<1302088073.2355.3.camel@scimitar> <20110410015223.GA672@denix.org>
In-Reply-To: <20110410015223.GA672@denix.org>
Mime-Version: 1.0 (iPhone Mail 8G4)
Message-Id: <4171961B-5671-4411-80AB-11A99D364310@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8G4)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 10 Apr 2011 08:12:45 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Clutter-1.6 fix
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
X-List-Received-Date: Sun, 10 Apr 2011 15:15:13 -0000
X-List-Received-Date: Sun, 10 Apr 2011 15:15:13 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 9 apr. 2011 om 18:52 heeft Denys Dmytriyenko <denis@denix.org> het volgen=
de geschreven:

> On Wed, Apr 06, 2011 at 12:07:52PM +0100, Joshua Lock wrote:
>> On Mon, 2011-04-04 at 15:39 +0200, Koen Kooi wrote:
>>> Op 4 apr 2011, om 15:31 heeft Joshua Lock het volgende geschreven:
>>>=20
>>>> From: Joshua Lock <josh@linux.intel.com>
>>>>=20
>>>> I found a couple of issues with the Clutter 1.6 recipes I submitted rec=
ently
>>>> which I've addressed in the attached patch.
>>>>=20
>>>> As an aside I've noticed that we have a COMPATIBLE_MACHINE line in
>>>> clutter.inc, I think we're going to need to find a more suitable mechan=
ism
>>>> for specifying compatible machines for this recipe set going forwards.
>>>>=20
>>>> Any ideas? Perhaps some MACHINE_FEATURE which must exist for Clutter (a=
nd
>>>> other GL dependent recipes) to build?
>>>=20
>>> What we did in OE .dev was:
>>>=20
>>> 1) introduce SOC_FAMILY to group, well, SOC families (e.g. OMAP3)
>>> 2) Extend base.bbclass to allow COMPATIBLE_MACHINE =3D $SOC_FAMILY.
>>> 3) Add COMPATIBLE_MACHINE =3D omap3 to the GLES recipes
>>> 4) DEPENDS_omap3 =3D libgles-omap3 in clutter.inc
>>>=20
>>> So for machines in the omap3 class it will build libgles-omap3 and not
>>> for others. So the compatibility is defined at the GL level instead of
>>> the clutter level.
>>=20
>> Thanks for sharing Koen. This sounds like a reasonable approach. I'd be
>> curious to hear if there are any objections before I try and work up a
>> patch series.
>=20
> FWIW, it would be very nice to bring SOC_FAMILY feature from OE to oe-core=
, as=20
> it's being heavily used in many TI recipes, not just omap3...

It is already in :)

fwiw, atmel is using it as well for at91




>=20
> --=20
> Denys
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



Received: from smtp21.4emm.com ([69.18.222.6])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1R40Pn-0007v6-93
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 03:06:55 +0200
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB21.4emm.local ([::1]) with mapi id 14.01.0289.001; Wed, 14 Sep 2011
	21:01:46 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Problem with new image-prelink
Thread-Index: Acxumoq/2ilmZmWnTuuyv8ZWELunbgAkC2oAAHA4PNAAJEvugAAQ8DpQABW1jIAAIK2pAAAG3eXAABW0MQAADb2k0A==
Date: Thu, 15 Sep 2011 01:01:44 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF18ECD1@MBX20.4emm.local>
References: <840A81C1B782724A8EB52725BD519EFF18E621@MBX20.4emm.local>
	<4E6A3770.4060307@windriver.com>
	<840A81C1B782724A8EB52725BD519EFF18E85D@MBX20.4emm.local>
	<4E6E1C1D.7010500@windriver.com>
	<840A81C1B782724A8EB52725BD519EFF18E950@MBX20.4emm.local>
	<1315905402.2519.116.camel@phil-desktop>	<4E6FFAC6.60404@windriver.com>
	<840A81C1B782724A8EB52725BD519EFF18EAAF@MBX20.4emm.local>
	<4E70BA82.60606@windriver.com>
In-Reply-To: <4E70BA82.60606@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: Re: Problem with new image-prelink
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
X-List-Received-Date: Thu, 15 Sep 2011 01:06:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Mark Hatle
> Sent: Wednesday, 14 September 2011 10:30 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] Problem with new image-prelink
>=20
> On 9/13/11 8:33 PM, James Limbouris wrote:
> >> -----Original Message-----
> >> From: openembedded-core-bounces@lists.openembedded.org
> >> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of
> >> Mark Hatle
> >> Sent: Wednesday, 14 September 2011 8:52 AM
> >> To: openembedded-core@lists.openembedded.org
> >> Subject: Re: [OE-core] Problem with new image-prelink
> >>
> >> Please try the new version of the prelinker.  I just sent a pull reque=
st for it,
> >> but there was a missing typecast on a printf.  This was causing proble=
ms on
> >> various systems, and likely could be causing the issue that you observ=
ed on
> >> ARM
> >> as well.
> >>
> >> I did build the latest version for the ARM target, and successfully ra=
n it there
> >> under QEMU.
> >>
> >> --Mark
> >
> > Thanks Mark - all working, on host and target.
>=20
> Does this also resolve the initial issue you found, QT failing to work af=
ter
> prelinking?
>=20
> If not, I'd like to open a new defect on it and see if we can figure out =
the
> cause still...
>=20
> --Mark

Yes, the Qt app is running as well.

Thanks,
James



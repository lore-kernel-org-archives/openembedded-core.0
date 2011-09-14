Received: from smtp1.4emm.com ([69.18.222.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1R3eR5-0003qa-W8
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 03:38:48 +0200
Received: from HUB20.4emm.local (192.168.160.61) by HUB01.4emm.local
	(192.168.160.132) with Microsoft SMTP Server (TLS) id 8.2.254.0;
	Tue, 13 Sep 2011 21:33:37 -0400
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB20.4emm.local ([fe80::bd35:8b72:5ce1:12f%14]) with mapi id
	14.01.0289.001; Tue, 13 Sep 2011 21:33:37 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Problem with new image-prelink
Thread-Index: Acxumoq/2ilmZmWnTuuyv8ZWELunbgAkC2oAAHA4PNAAJEvugAAQ8DpQABW1jIAAIK2pAAAG3eXA
Date: Wed, 14 Sep 2011 01:33:36 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF18EAAF@MBX20.4emm.local>
References: <840A81C1B782724A8EB52725BD519EFF18E621@MBX20.4emm.local>
	<4E6A3770.4060307@windriver.com>
	<840A81C1B782724A8EB52725BD519EFF18E85D@MBX20.4emm.local>
	<4E6E1C1D.7010500@windriver.com>
	<840A81C1B782724A8EB52725BD519EFF18E950@MBX20.4emm.local>
	<1315905402.2519.116.camel@phil-desktop> <4E6FFAC6.60404@windriver.com>
In-Reply-To: <4E6FFAC6.60404@windriver.com>
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
X-List-Received-Date: Wed, 14 Sep 2011 01:38:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Mark Hatle
> Sent: Wednesday, 14 September 2011 8:52 AM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] Problem with new image-prelink
>=20
> Please try the new version of the prelinker.  I just sent a pull request =
for it,
> but there was a missing typecast on a printf.  This was causing problems =
on
> various systems, and likely could be causing the issue that you observed =
on
> ARM
> as well.
>=20
> I did build the latest version for the ARM target, and successfully ran i=
t there
> under QEMU.
>=20
> --Mark

Thanks Mark - all working, on host and target.

James



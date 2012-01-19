Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RnruZ-0003ib-0I
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 14:20:15 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Jan 2012 05:12:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113975987"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2012 05:12:07 -0800
Received: from pgsmsx101.gar.corp.intel.com (10.221.44.78) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 19 Jan 2012 21:12:06 +0800
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	PGSMSX101.gar.corp.intel.com (10.221.44.78) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Thu, 19 Jan 2012 21:12:05 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.21]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.229]) with mapi id
	14.01.0355.002; Thu, 19 Jan 2012 21:12:07 +0800
From: "Wang, Shane" <shane.wang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] core-image-foo: add summary to each
	image bb file
Thread-Index: AQHM1qnRAxjNDuYj2kaJ2OTkELiWkZYTqEgA
Date: Thu, 19 Jan 2012 13:12:04 +0000
Message-ID: <3AB6CE7F274E534CAFD089D127A8A1FC0FCC82E5@SHSMSX102.ccr.corp.intel.com>
References: <cover.1326976547.git.shane.wang@intel.com>
	<09ab90b65169616911ae3811421b374158b6453d.1326976547.git.shane.wang@intel.com>
	<1326977788.2511.60.camel@ted>
In-Reply-To: <1326977788.2511.60.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] core-image-foo: add summary to each image bb file
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
X-List-Received-Date: Thu, 19 Jan 2012 13:20:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

That could be. I originally thought they are DESCRIPTIONs.
But for CacheData in cache.py, it seems not description but summary is used=
.
Is it OK to change the code to make descriptions into CacheData?

--
Shane

Richard Purdie wrote on=A02012-01-19:

> Hi Shane,
>=20
> On Thu, 2012-01-19 at 20:38 +0800, Shane Wang wrote:
>> Add SUMMARY to each image bb file according to poky reference manual
> for Hob2 use later.
>=20
> I think this is good but shouldn't some of these be DESCRIPTIONs? The
> difference is that summary should be a one line summary (~max 72 chars)
> whilst DESCRIPTION can be multiple lines of text...
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
> _______________________________________________ Openembedded-core
> mailing list Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




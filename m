Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S9YJV-00047a-1Y
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 09:51:37 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Mar 2012 01:42:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120533333"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by azsmga001.ch.intel.com with ESMTP; 19 Mar 2012 01:42:45 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 19 Mar 2012 01:42:44 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.36]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.91]) with mapi id
	14.01.0355.002; Mon, 19 Mar 2012 16:42:42 +0800
From: "Wang, Shane" <shane.wang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 00/60] Package Upgrade
Thread-Index: AQHNA5YwoLa7EGH1TE2t5HMd22U7CZZxUL/g
Date: Mon, 19 Mar 2012 08:42:42 +0000
Message-ID: <3AB6CE7F274E534CAFD089D127A8A1FC23AEFE56@SHSMSX102.ccr.corp.intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
	<1331917154.18586.207.camel@ted>
In-Reply-To: <1331917154.18586.207.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 00/60] Package Upgrade
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
X-List-Received-Date: Mon, 19 Mar 2012 08:51:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote on=A02012-03-17:

> On Fri, 2012-03-16 at 08:52 +0800, Shane Wang wrote:
> So far I've noticed a few issues. This log has several of them:
>=20
> http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/316
> /ste ps/shell_33/logs/stdio
>=20
> alsa-utils has patch application issues
> libxxf86dg won't fetch due to a patch issue
> libpciaccess won't build on mips.
>=20
> In my own build logs I also noticed:
>=20
> WARNING: Missing sha256 SRC_URI checksum for
> /media/build1/sources/gdk-pixbuf-2.24.1.tar.xz, consider adding to the
> recipe: SRC_URI[sha256sum] =3D
> "da7a3f00db360913716368e19e336402755cafa93769f3cfa28a969303e4bee1 "
>=20
> Cheers,
>=20
> Richard

alsa-utils has patch application issue because Kang Kai upgraded to the lat=
est before me.
I will address the others issues these days.

--
Shane



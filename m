Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6D60F61BD6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 13:09:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Mar 2020 06:10:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,544,1574150400"; d="scan'208";a="246363115"
Received: from kmsmsx151.gar.corp.intel.com ([172.21.73.86])
	by orsmga006.jf.intel.com with ESMTP; 12 Mar 2020 06:09:59 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.189]) by
	KMSMSX151.gar.corp.intel.com ([169.254.10.150]) with mapi id
	14.03.0439.000; Thu, 12 Mar 2020 21:04:54 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "Mikko.Rapeli@bmw.de" <Mikko.Rapeli@bmw.de>
Thread-Topic: [OE-core] [PATCH] [zeus] aspell: CVE-2019-20433
Thread-Index: AQHV+E/1cDunrn+Y10OmnCzlq3irv6hEW9oAgAACg4CAAI12YA==
Date: Thu, 12 Mar 2020 13:04:53 +0000
Message-ID: <C0207330DF60C5409302EC78C3FE68F30349D9B0@PGSMSX101.gar.corp.intel.com>
References: <20200312092322.28506-1-stefan.ghinea@windriver.com>
	<67257554ffe08ac11b8f1cf3da115ba5a7e35fbd.camel@intel.com>
	<20200312123418.GR104502@korppu>
In-Reply-To: <20200312123418.GR104502@korppu>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [zeus] aspell: CVE-2019-20433
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Mar 2020 13:09:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Mikko.Rapeli@bmw.de <Mikko.Rapeli@bmw.de>
> Sent: Thursday, March 12, 2020 08:34 PM
> To: Mittal, Anuj <anuj.mittal@intel.com>
> Cc: openembedded-core@lists.openembedded.org; stefan.ghinea@windriver.com
> Subject: Re: [OE-core] [PATCH] [zeus] aspell: CVE-2019-20433
>=20
> On Thu, Mar 12, 2020 at 12:25:21PM +0000, Mittal, Anuj wrote:
> > It looks like this is changing the API. I wonder if this would need
> > any other change or break something elsewhere in OE-core, meta-oe?
> >
> > http://aspell.net/buffer-overread-ucs.txt
>=20
> Debian classified issues as minor and fixed only by updating to 0.60.8:

They were applied to 0.60.7:

https://salsa.debian.org/debian/aspell/-/commit/ab3214b1e758646c5a995d277ac=
80f6d04566149

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D935128

I think that "minor" categorization is for versions where it wasn't fixed. =
The NVD severity at the top says medium and it has been assigned a score of=
 9.1.

>=20
> https://security-tracker.debian.org/tracker/CVE-2019-20433
>=20
> https://metadata.ftp-master.debian.org/changelogs//main/a/aspell/aspell_0=
.60.8-
> 1_changelog
>=20
> Maybe whitelist for stable branches and update to new version on master?
>=20

Whitelisting doesn't sound the right thing to do here especially since this=
 is a valid problem.

Thanks,

Anuj


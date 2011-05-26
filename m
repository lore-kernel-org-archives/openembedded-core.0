Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QPaGA-0002CO-MF
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 15:05:55 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 May 2011 06:02:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,272,1304319600"; 
   d="scan'208";a="8105952"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by fmsmga002.fm.intel.com with ESMTP; 26 May 2011 06:02:34 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 26 May 2011 21:02:34 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Thu, 26 May 2011 21:02:33 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 May 2011 21:02:31 +0800
Thread-Topic: [OE-core] [PATCH 2/5] conf/bitbake.conf: Added variables for
	PR service.
Thread-Index: AcwboxEOl5sVfB+FS+eevJV0mwDbGgAAKW/Q
Message-ID: <C10D3FB0CD45994C8A51FEC1227CE22F232DBFB114@shsmsx502.ccr.corp.intel.com>
References: <82b5b89412bfcac2d4586d183a3b6a516b5a0f35.1306401007.git.lianhao.lu@intel.com>
	<a24e8ddae8f503f60c9151aab0f35627393ed285.1306401007.git.lianhao.lu@intel.com>
	<1306411147.2525.326.camel@phil-desktop>
	<C10D3FB0CD45994C8A51FEC1227CE22F232DBFB10B@shsmsx502.ccr.corp.intel.com>
	<1306414026.2525.337.camel@phil-desktop>
In-Reply-To: <1306414026.2525.337.camel@phil-desktop>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] conf/bitbake.conf: Added variables for PR service.
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
X-List-Received-Date: Thu, 26 May 2011 13:05:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Phil Blundell wrote on 2011-05-26:
> On Thu, 2011-05-26 at 20:43 +0800, Lu, Lianhao wrote:
>> The problem is that in OE-core the default -deb/-dbg packages are
>> all using EXTENDPV, as well as some other recipes. Do you mean we
>> should make them all using EXTENDPKGV instead of EXTENDPV?
>=20
> As far as I can tell, yes, that would be the right thing to do.
> That's what I was thinking of when I mentioned the "couple of uses" befor=
e.
> The only reason I hesitate is that, although the current behaviour
> looks like it should be wrong, nobody has actually complained about it
> and that makes me wonder if I have misunderstood something.
>=20
> I guess someone needs to do a few tests to figure out what exactly is
> going on there.  But I am fairly sure that creating a hybrid PV+PKGR
> is not a good thing to do; it should be either one thing or the other,
> and as far as I know everything on the output side should be using PKGxx.
>=20

Maybe all the recipes are using the PKGV default value (?=3D ${PV}, so this=
 just happens to make EXTENDPKGV equal to EXTENDPV. In what situation we sh=
ould use EXTENDPV but not EXTENDPKGV then?

Best Regards,
Lianhao





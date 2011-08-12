Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QrqmL-0003HP-T6
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 14:23:58 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 12 Aug 2011 05:19:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,362,1309762800"; 
   d="scan'208";a="6498966"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Aug 2011 05:19:23 -0700
Received: from pgsmsx151.gar.corp.intel.com (172.30.236.41) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 12 Aug 2011 20:19:23 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX151.gar.corp.intel.com (172.30.236.41) with Microsoft SMTP Server
	(TLS) id 14.1.323.3; Fri, 12 Aug 2011 20:19:22 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Fri, 12 Aug 2011 20:19:21 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 12 Aug 2011 20:19:21 +0800
Thread-Topic: [OE-core] [RFC] Performance Issue: Build time increases
Thread-Index: AcxY3+Q7j2KdTaQtQOKHoAE2smdTGAACNjug
Message-ID: <C10D3FB0CD45994C8A51FEC1227CE22F2FA7A17F22@shsmsx502.ccr.corp.intel.com>
References: <4E450925.7060101@windriver.com>
In-Reply-To: <4E450925.7060101@windriver.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [RFC] Performance Issue: Build time increases
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
X-List-Received-Date: Fri, 12 Aug 2011 12:23:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Robert Yang wrote on 2011-08-12:
>=20
> Hi folks,
>=20
> The build time of core-image-sato increases about 5 ~ 10 minutes than
> the following commit:
>=20
> commit 5af197b55a4b779f1ec93186f0723026949ba2b5
> Author: Liping Ke <liping.ke@intel.com>
> Date:   Fri Jun 3 08:22:40 2011 +0800
>=20
>      cache: Implement multiple extra cache fields request support

I think this patch only stores extra information in an extra cache. It only=
 affects the parsing time, and I don't think there will be 5 min difference=
. How about comparing the "bitbake -e" time with and without the patch(by d=
eleting all the cache files before running bitbake).

Best Regards,
-Lianhao

> On my host,
> 1) the build time of 5af197b55a4b779f1ec93186f0723026949ba2b5 is:
>=20
> real    208m26.133s
> user    241m29.280s
> sys     47m0.630s
>=20
> 2) and: 068839698fe192d8846c0ed4db65861448e8e524 is:
>=20
> real    217m39.687s
> user    255m34.150s
> sys     48m21.510s
>=20
>=20
> I use the bisect build method to find out which patch causes the time
> increases, but the build time is not stable on my host(Ubuntu 11.04
> 64bit), e.g., the build time of 1) is 208m at the first build, then
> "git co other_commit" and build it, after about 10 builds, then go
> back to build 5af197b55a4b779f1ec, the build time will increases about
> 8 minutes, I have stopped the X and cron, at. This may have relationship =
with the linux distribution and disk.
>=20
> So I have to restart the build, reboot the machine by two days, and go
> on the build. It would be better if anyone has other good method.
>=20
> I think that for the next release(e.g., yocto 1.2), we can find a
> clean and stable machine(for the distribution, maybe RHEL is more
> stable than Ubuntu) to check the build time weekly, so that we can notice=
 the performance issue early.
>





Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 6E3E460745
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 00:48:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jan 2018 16:48:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,361,1511856000"; d="scan'208";a="22008620"
Received: from pgsmsx108.gar.corp.intel.com ([10.221.44.103])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jan 2018 16:48:23 -0800
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.108]) by
	PGSMSX108.gar.corp.intel.com ([169.254.8.194]) with mapi id
	14.03.0319.002; Mon, 15 Jan 2018 08:48:22 +0800
From: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
To: "ed.bartosh@linux.intel.com" <ed.bartosh@linux.intel.com>
Thread-Topic: [OE-core] [PATCHv2 0/5] Enable wic in eSDK
Thread-Index: AQHTiuym6V/CcGo/QU2J9gXQ2xcVW6NvcVuAgAStu1A=
Date: Mon, 15 Jan 2018 00:48:22 +0000
Message-ID: <50B33AC5ED75F74F991980326F1C438D1F1D621E@PGSMSX103.gar.corp.intel.com>
References: <cover.1515681706.git.rebecca.swee.fun.chang@intel.com>
	<20180112092059.3sja5c337jinx4nv@linux.intel.com>
In-Reply-To: <20180112092059.3sja5c337jinx4nv@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNDNlZmU3NDEtMWViZi00ZTc4LTk3ZWUtZjY5YzI5YmE1ZDUyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjIuNS4xOCIsIlRydXN0ZWRMYWJlbEhhc2giOiJOcUxSaitST3VjMDEzOU9sdFZHamVKSUVOSEExdDhOSGo3cjloQ1lueFlCQjFwTnRnV2UyXC9LXC82ZUZlMlhidnoifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 0/5] Enable wic in eSDK
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
X-List-Received-Date: Mon, 15 Jan 2018 00:48:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes. The tests are in development. Stay tuned.

> -----Original Message-----
> From: Ed Bartosh [mailto:ed.bartosh@linux.intel.com]
> Sent: Friday, January 12, 2018 5:21 PM
> To: Chang, Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCHv2 0/5] Enable wic in eSDK
>=20
> On Thu, Jan 11, 2018 at 10:55:18PM +0800,
> rebecca.swee.fun.chang@intel.com wrote:
> > Hi all,
> >
> > As the subject called out: this patch series enable wic in eSDK.
> > The details of what I have done are documented within the commit messag=
e.
> > Basically wic requires an OE build environment, but we are using a
> > different environment setup script in eSDK. Hence, I have added some
> > code for wic to explicitly export bitbake variables within eSDK. I
> > have also make wic to use the shared code in scriptpath for oe lib and
> > bitbake path addition to sys.path.
> >
> > I have run the changes on wic oe-selftest and the tests are passing.
> > What's next: I think it would better to have some test cases for wic
> > within eSDK if this series are merged.
> >
>=20
> Would it make sense to cover this new functionality by tests?
>=20
> >
> > The following changes since commit
> 364f8bcfcbd04e722490f363ad36a15fb7066ba7:
> >
> >   linux-firmware: Bump revision to 65b1c68c (2018-01-11 10:26:07
> > +0000)
> >
> > are available in the Git repository at:
> >
> >   git://push.yoctoproject.org/poky-contrib rebeccas/wic-dev
> >
> > Chang Rebecca Swee Fun (5):
> >   scripts/wic: use scriptpath module to find bitbake path and oe lib
> >     path
> >   scripts/wic: append bitbake executable file path in eSDK environment
> >   scripts/wic: fix error of import wic module in eSDK environment
> >   scripts/wic: explicitly set BUILDDIR within eSDK
> >   classes/populate_sdk_ext: support wic in eSDK
> >
> >  meta/classes/populate_sdk_ext.bbclass |  2 +-
> >  scripts/wic                           | 23 ++++++++++++++++++-----
> >  2 files changed, 19 insertions(+), 6 deletions(-)
> >
> > --
> > 2.15.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --
> --
> Regards,
> Ed


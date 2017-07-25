Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9E6EF7833C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 06:38:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6P6cxSx011068
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 23:38:59 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([fe80::d894:a649:cd4c:89b7]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0294.000;
	Mon, 24 Jul 2017 23:38:58 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "BURTON, ROSS" <ross.burton@intel.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2] ncurses: add SYSROOT_DESTDIR for
	siteconfig_gencache
Thread-Index: AQHS5dNNSEaLfOMVwkyg0JzsrmjvqKImr43ggBX8z6CAJ6kc4A==
Date: Tue, 25 Jul 2017 06:38:58 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B83D0CC@ALA-MBD.corp.ad.wrs.com>
References: <cover.1496218782.git.jackie.huang@windriver.com>
	<22aa14ac1a926e97fb676743cb1e440ff2aaae1f.1496218782.git.jackie.huang@windriver.com>
	<CAJTo0LbG_JMejjRPoK+g4Kq5+G8eszwPj4+oWcUjhpJ4-7esNg@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA014B7F1F6C@ALA-MBD.corp.ad.wrs.com> 
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.95]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ncurses: add SYSROOT_DESTDIR for siteconfig_gencache
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
X-List-Received-Date: Tue, 25 Jul 2017 06:38:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> > >
> > >
> > > On 31 May 2017 at 09:27, <jackie.huang@windriver.com> wrote:
> > > +EXTRASITECONFIG =3D "CFLAGS=3D'${CFLAGS} -
> > I${SYSROOT_DESTDIR}${includedir}'"
> > >
> > > Why is this ncurses specific, it sounds like something which will imp=
act all
> users
> > of siteconfig?
>=20
> Ping.
>=20
> Is my explanation clear enough? What's the suggestion if it's not accepta=
ble?

Ping.

Thanks,
Jackie

>=20
> Thanks,
> Jackie
>=20
> >
> > My original issue is not ncurses specific, that is:
> > After switching to RSS, the siteconfig cache files in ACLOCALDIR setup =
by
> > autotools.bbclass was dropped, so searching
> > the path ACLOCALDIR for siteconfig files ended up with nothing, which c=
aused
> > some package (like openhpi) fail to configure,
> > so the "PATCH 2/2" change it back to search SITECONFIG_SYSROOTCACHE.
> >
> > But I met the second issue after the that:
> > util-linux depends on ncurses but the siteinfo in ncurses_config which =
is
> > populated to SITECONFIG_SYSROOTCACHE  is not correct:
> > ac_cv_header_curses_h=3D${ac_cv_header_curses_h=3Dno}
> > ac_cv_header_ncurses_h=3D${ac_cv_header_ncurses_h=3Dno}
> >
> > then it fails to build (it should be the same issue for other package t=
hat depend
> > on ncurses), so this patch is needed.
> > And the patch will only impact the packages that depend on ncurses, for=
 those
> > without dependency on ncurses, there
> > is no ncurses_config at all in their own recipe-sysroot.
> >
> > Thanks,
> > Jackie
> >
> > >
> > > Ross
> > >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core


Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E8A1D782D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 06:31:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7O6VDJ0018648
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Aug 2017 23:31:13 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.209]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Wed, 23 Aug 2017 23:31:13 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>, "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] [PATCH] boost: add python to default PACKAGECONFIG
	options
Thread-Index: AQHTG4AEWVh7122takuejULtbCxCfqKRP6wAgABca4D//+37MIABgsRw
Date: Thu, 24 Aug 2017 06:31:13 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B870CF0@ALA-MBD.corp.ad.wrs.com>
References: <20170822074219.8490-1-jackie.huang@windriver.com>
	<CAJ86T=U1Wp8heeowiTNTwQd9vjmbP6AvSFYe8V8UYuSGQrs7Mw@mail.gmail.com>
	<1503431754.32591.130.camel@linuxfoundation.org>
	<e08e7388-4240-0201-197b-8040d4dfb761@windriver.com>
	<1B858668EC6A94408DCA5225FDFA85AA014B86FA85@ALA-MBD.corp.ad.wrs.com>
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA014B86FA85@ALA-MBD.corp.ad.wrs.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.90]
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: add python to default PACKAGECONFIG options
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
X-List-Received-Date: Thu, 24 Aug 2017 06:31:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Huang, Jie (Jackie)
> Sent: Wednesday, August 23, 2017 16:02
> To: MacLeod, Randy; Richard Purdie; Andre McCurdy
> Cc: OE Core mailing list
> Subject: Re: [OE-core] [PATCH] boost: add python to default PACKAGECONFIG
> options
>=20
>=20
>=20
> > -----Original Message-----
> > From: MacLeod, Randy
> > Sent: Wednesday, August 23, 2017 09:27
> > To: Richard Purdie; Andre McCurdy; Huang, Jie (Jackie)
> > Cc: OE Core mailing list
> > Subject: Re: [OE-core] [PATCH] boost: add python to default PACKAGECONF=
IG
> > options
> >
> > On 2017-08-22 03:55 PM, Richard Purdie wrote:
> > > On Tue, 2017-08-22 at 12:51 -0700, Andre McCurdy wrote:
> > >> On Tue, Aug 22, 2017 at 12:42 AM,  <jackie.huang@windriver.com>
> > >> wrote:
> > >>>
> > >>> From: Jackie Huang <jackie.huang@windriver.com>
> > >>>
> > >>> We want to provide python libs by default, and some other
> > >>> popular Linux distributions like redhat/fedora does the same.
> > >> Has something changed? Is there anything in oe-core or meta-oe which
> > >> now needs boost python support enabled?
> > >
> > > Does it even actually build on all arches? >
> > > I'm rather behind with patch review right now as people are putting s=
o
> > > many patches out there with what seems like minimal testing and
> > > expecting me/Ross and the autobuilder to figure out the problems for
> > > them.
> > >
> > > Each time one fails, it blocks the queue with the rest of them in and=
 I
> > > have to retest until I get something clean.
> > >
> > > Testing this change is quite a way down my priority list I'm afraid.
> > >
> >
> > Maybe this is better done in our distro configuration.
> >
> > We're trying to minimize differences with oe-core and
> > the boost python support doesn't seem to be much of an
> > impact based on looking at logs rather than a having a
> > detailed understanding of boost.
> >
> > We've had this commit in our local branch since before:
> >
> > CommitDate: Wed Dec 21 22:16:31 2016 -0800
> >
> >      boost: add python to default PACKAGECONFIG options
> >
> >      We want to provide python libs by default, and some other
> >      popular Linux distributions like redhat/fedora does the same.
> >
> >      (LOCAL REV: NOT UPSTREAM) -- sent to oe-core on 20160930
> >
> > so it certainly builds for all qemu* for glibc configurations.
> >
> > I'll see if we can add musl builds to our automated builds tonight.
> >
> > Jackie,
> >
> > Did/Can you build for musl?
>=20
> No, I didn't build for musl yet, but yes, I can and will do the test with=
 musl
> and fix issues as needed.

I tested for all qemu* with:
$ for i in qemuarm qemuarm64 qemux86 qemux86-64 qemuppc qemumips qemumips64=
; do MACHINE=3D"$i" TCLIBC=3Dmusl bitbake boost

And all passed, could you point me out what the failure is caused by this p=
atch?=20

Thanks,
Jackie

>=20
> > Do you have any idea of the impact of this config on users that are not
> > interested in the python interface with boost?
>=20
> I don't think there is any impact, each library is packaged into a separa=
te
> package named with boost-<lib name>
>=20
> > What's the additional cost in compile time?
>=20
> A quick test indicates that it's less than 1 second:
>=20
> $ grep -r 'Elapsed time:' 20170823073306/boost-1.64.0-r0/do_compile
> 20170823075302/boost-1.64.0-r0/do_compile
> 20170823073306/boost-1.64.0-r0/do_compile:Elapsed time: 50.96 seconds
> 20170823075302/boost-1.64.0-r0/do_compile:Elapsed time: 51.63 seconds
>=20
> Thanks,
> Jackie
>=20
> >
> >
> >
> > There certainly are a rush of package updates and other changes
> > coming in; apologies for the lack of warning and late arrivals.
> > Other than doing more testing and explaining what tests were done,
> > what else can we do to help?
> >
> >
> > ../Randy
> >
> >
> > > Cheers,
> > >
> > > Richard
> > >
> > >
> >
> >
> > --
> > # Randy MacLeod. SMTS, Linux, Wind River
> > Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON,
> > Canada, K2K 2W5
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


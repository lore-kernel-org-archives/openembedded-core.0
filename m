Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6784878353
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 02:14:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7H2EX8s018774
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 19:14:34 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.209]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Wed, 16 Aug 2017 19:14:33 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/2] rootfs-postcommands: split
	ssh_allow_empty_password
Thread-Index: AQHS8WpxLhZBp5Cds0mCFDti/+XOsqJkPPYggCPZupA=
Date: Thu, 17 Aug 2017 02:14:32 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B86548D@ALA-MBD.corp.ad.wrs.com>
References: <cover.1498803976.git.jackie.huang@windriver.com>
	<1B858668EC6A94408DCA5225FDFA85AA014B83D0B8@ALA-MBD.corp.ad.wrs.com>
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA014B83D0B8@ALA-MBD.corp.ad.wrs.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.91]
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] rootfs-postcommands: split	ssh_allow_empty_password
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
X-List-Received-Date: Thu, 17 Aug 2017 02:14:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping again.

I don't see any comment or rejection on this, do I miss anything?

Thanks,
Jackie

> -----Original Message-----
> From: Huang, Jie (Jackie)
> Sent: Tuesday, July 25, 2017 14:34
> To: Huang, Jie (Jackie); openembedded-core@lists.openembedded.org
> Subject: RE: [OE-core] [PATCH 0/2] rootfs-postcommands: split
> ssh_allow_empty_password
>=20
> Ping.
>=20
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > jackie.huang@windriver.com
> > Sent: Friday, June 30, 2017 14:30
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 0/2] rootfs-postcommands: split
> > ssh_allow_empty_password
> >
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > --
> > The following changes since commit
> > de7914954571ea8e717f56b6d6df13157b0973bc:
> >
> >   scripts/contrib/patchreview: add new script (2017-06-29 13:01:32 +010=
0)
> >
> > are available in the git repository at:
> >
> >   git://git.pokylinux.org/poky-contrib.git jhuang0/d_ssh-allow-
> empty_170630_0
> >   http://git.pokylinux.org/cgit.cgi//log/?h=3Djhuang0/d_ssh-allow-
> > empty_170630_0
> >
> > Jackie Huang (2):
> >   dropbear: add default config file to disable root login
> >   rootfs-postcommands: split ssh_allow_empty_password
> >
> >  meta/classes/image.bbclass                         |  2 +-
> >  meta/classes/rootfs-postcommands.bbclass           | 25
> +++++++++++++++++++-
> > --
> >  meta/recipes-core/dropbear/dropbear.inc            |  3 +++
> >  .../dropbear/dropbear/dropbear.default             |  2 ++
> >  4 files changed, 28 insertions(+), 4 deletions(-)
> >  create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear.defaul=
t
> >
> > --
> > 2.11.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core


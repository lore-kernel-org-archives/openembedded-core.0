Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 36F12782E0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 05:47:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5F5lTMI010419
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 22:47:29 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([fe80::d894:a649:cd4c:89b7]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Wed, 14 Jun 2017 22:47:29 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/2] siteinfo: fix siteinfo_get_files to work
	with	RSS
Thread-Index: AQHS2efgN1tEqcEsQUeSwNXIXqFopaIlgZjg
Date: Thu, 15 Jun 2017 05:47:28 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B7F04AC@ALA-MBD.corp.ad.wrs.com>
References: <cover.1496218782.git.jackie.huang@windriver.com>
In-Reply-To: <cover.1496218782.git.jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.168]
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] siteinfo: fix siteinfo_get_files to work with	RSS
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
X-List-Received-Date: Thu, 15 Jun 2017 05:47:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> jackie.huang@windriver.com
> Sent: Wednesday, May 31, 2017 16:27
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 0/2] siteinfo: fix siteinfo_get_files to work w=
ith RSS
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> --
> The following changes since commit
> 4aa6cdfe9f069ecd976c1257702fe8ff28c57f07:
>=20
>   tune-mips32*.inc: use consistent comments across all three .inc files (=
2017-05-
> 30 10:14:33 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.pokylinux.org/poky-contrib.git jhuang0/d_siteinfo_170531_0
>   http://git.pokylinux.org/cgit.cgi//log/?h=3Djhuang0/d_siteinfo_170531_0
>=20
> Jackie Huang (2):
>   ncurses: add SYSROOT_DESTDIR for siteconfig_gencache
>   siteinfo: fix siteinfo_get_files to work with RSS
>=20
>  meta/classes/autotools.bbclass        |  2 +-
>  meta/classes/siteinfo.bbclass         | 15 ++++-----------
>  meta/recipes-core/ncurses/ncurses.inc |  2 ++
>  3 files changed, 7 insertions(+), 12 deletions(-)
>=20
> --
> 2.11.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


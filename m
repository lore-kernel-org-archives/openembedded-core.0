Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1DF1788C2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Dec 2017 02:08:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBM28pAR022018
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 18:08:51 -0800
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.62]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0361.001;
	Thu, 21 Dec 2017 18:08:39 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/2 v2] glibc: fixes for nscd and libnss-db
Thread-Index: AQHTU6XbDhJwwAOIpEihfeLlRZsSNKNO65Yg
Date: Fri, 22 Dec 2017 02:08:37 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA01566B9AEB@ALA-MBC.corp.ad.wrs.com>
References: <cover.1509604697.git.jackie.huang@windriver.com>
In-Reply-To: <cover.1509604697.git.jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.100]
MIME-Version: 1.0
Subject: Re: [PATCH 0/2 v2] glibc: fixes for nscd and libnss-db
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
X-List-Received-Date: Fri, 22 Dec 2017 02:08:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Ping, I didn't see any objection on this, but it's not merged yet, do I mis=
s anything?

Thanks,
Jackie

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> jackie.huang@windriver.com
> Sent: Thursday, November 02, 2017 14:41
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 0/2 v2] glibc: fixes for nscd and libnss-db
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> v2 comments:
> Add a note for external toolchain in the commit log.
>=20
> --
> The following changes since commit
> 514a808f21c37b6ad704ce397bb2740ecc9a93bc:
>=20
>   ref-manual: Updates to "Image Generation" section. (2017-10-30 15:55:08
> +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.pokylinux.org/poky-contrib.git jhuang0/d_nscd_171102_0
>   http://git.pokylinux.org/cgit.cgi//log/?h=3Djhuang0/d_nscd_171102_0
>=20
> Jackie Huang (2):
>   glibc: re-package for libnss-db
>   glibc/nscd: do not cache for netgroup by default
>=20
>  meta/recipes-core/glibc/glibc-package.inc | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> --
> 2.11.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


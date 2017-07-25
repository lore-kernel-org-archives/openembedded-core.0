Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 64C1D71B9C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 06:33:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6P6XbIf022045
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 23:33:38 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([fe80::d894:a649:cd4c:89b7]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Mon, 24 Jul 2017 23:33:37 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/2] rootfs-postcommands: split
	ssh_allow_empty_password
Thread-Index: AQHS8WpxLhZBp5Cds0mCFDti/+XOsqJkPPYg
Date: Tue, 25 Jul 2017 06:33:36 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B83D0B8@ALA-MBD.corp.ad.wrs.com>
References: <cover.1498803976.git.jackie.huang@windriver.com>
In-Reply-To: <cover.1498803976.git.jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.95]
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
X-List-Received-Date: Tue, 25 Jul 2017 06:33:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> jackie.huang@windriver.com
> Sent: Friday, June 30, 2017 14:30
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 0/2] rootfs-postcommands: split
> ssh_allow_empty_password
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> --
> The following changes since commit
> de7914954571ea8e717f56b6d6df13157b0973bc:
>=20
>   scripts/contrib/patchreview: add new script (2017-06-29 13:01:32 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.pokylinux.org/poky-contrib.git jhuang0/d_ssh-allow-empty_1706=
30_0
>   http://git.pokylinux.org/cgit.cgi//log/?h=3Djhuang0/d_ssh-allow-
> empty_170630_0
>=20
> Jackie Huang (2):
>   dropbear: add default config file to disable root login
>   rootfs-postcommands: split ssh_allow_empty_password
>=20
>  meta/classes/image.bbclass                         |  2 +-
>  meta/classes/rootfs-postcommands.bbclass           | 25 ++++++++++++++++=
+++-
> --
>  meta/recipes-core/dropbear/dropbear.inc            |  3 +++
>  .../dropbear/dropbear/dropbear.default             |  2 ++
>  4 files changed, 28 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear.default
>=20
> --
> 2.11.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


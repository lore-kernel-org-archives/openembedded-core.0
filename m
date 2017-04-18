Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 66E3B71AC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 09:16:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3I9GpZ6023025
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 02:16:52 -0700
Received: from ALA-MBC.corp.ad.wrs.com ([fe80::fcbe:9b7:1141:89a1]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Tue, 18 Apr 2017 02:16:50 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/2] systemd: fixes for debug-shell service
Thread-Index: AQHSjNfu1967upBHRU+WN8gwLQK2LqHLL0zA
Date: Tue, 18 Apr 2017 09:16:50 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B722181@ALA-MBC.corp.ad.wrs.com>
References: <cover.1487745605.git.jackie.huang@windriver.com>
In-Reply-To: <cover.1487745605.git.jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.111]
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] systemd: fixes for debug-shell service
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
X-List-Received-Date: Tue, 18 Apr 2017 09:16:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> jackie.huang@windriver.com
> Sent: Wednesday, February 22, 2017 14:42
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 0/2] systemd: fixes for debug-shell service
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> --
> The following changes since commit
> e436a6398684d2872cb541f1cfb0f67b3618d15a:
>=20
>   layer.conf: bump version for change in eSDK selftest behaviour (2017-02=
-19
> 09:39:03 -0800)
>=20
> are available in the git repository at:
>=20
>   git://git.pokylinux.org/poky-contrib.git jhuang0/d_debug-shell_170222_1
>   http://git.pokylinux.org/cgit.cgi//log/?h=3Djhuang0/d_debug-shell_17022=
2_1
>=20
> Jackie Huang (2):
>   initscripts: split sushell into sub package
>   systemd: add dependency on initscripts-sushell for selinux
>=20
>  meta/recipes-core/initscripts/initscripts_1.0.bb | 5 +++--
>  meta/recipes-core/systemd/systemd_232.bb         | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
>=20
> --
> 2.8.3
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


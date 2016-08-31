Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DE15E60621
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 05:31:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7V5V04h003314
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 22:31:00 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.206]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Tue, 30 Aug 2016 22:30:59 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 00/17] control ipv6 support based on
	DISTRO_FEATURES
Thread-Index: AQHR/Fat9H3ovnhVBkifxKCxfMjz5qBimFKg
Date: Wed, 31 Aug 2016 05:30:58 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA0131063DBD@ALA-MBB.corp.ad.wrs.com>
References: <cover.1471857001.git.jackie.huang@windriver.com>
In-Reply-To: <cover.1471857001.git.jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.203]
MIME-Version: 1.0
Subject: Re: [PATCH 00/17] control ipv6 support based on	DISTRO_FEATURES
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
X-List-Received-Date: Wed, 31 Aug 2016 05:31:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

I don't see a comment or rejection on these, will these be merged soon?

Thanks,
Jackie

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-
> bounces@lists.openembedded.org] On Behalf Of jackie.huang@windriver.com
> Sent: Monday, August 22, 2016 5:06 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 00/17] control ipv6 support based on DISTRO_FEA=
TURES
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> There is ipv6 configure option for these packages, and we need to them
> to be controled by DISTRO_FEATURES.
>=20
> Tested with and without ipv6 in DISTRO_FEATURES on qemux86-64 and qemuarm=
.
>=20
> --
> The following changes since commit f078ccf1ac60488169853724c35126cc056f97=
5d:
>=20
>   bitbake: siggen: Fix file variable typo in compare_sigfiles (2016-08-20=
 16:11:29 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.pokylinux.org/poky-contrib.git jhuang0/r_ipv6_160822_0
>   http://git.pokylinux.org/cgit.cgi//log/?h=3Djhuang0/r_ipv6_160822_0
>=20
> Jackie Huang (17):
>   apr: control ipv6 support based on DISTRO_FEATURES
>   libice: control ipv6 support based on DISTRO_FEATURES
>   libpcap: control ipv6 support based on DISTRO_FEATURES
>   libsm: control ipv6 support based on DISTRO_FEATURES
>   libxfont: control ipv6 support based on DISTRO_FEATURES
>   libxml2: control ipv6 support based on DISTRO_FEATURES
>   libxmu: control ipv6 support based on DISTRO_FEATURES
>   lighttpd: control ipv6 support based on DISTRO_FEATURES
>   nfs-utils: control ipv6 support based on DISTRO_FEATURES
>   nspr: control ipv6 support based on DISTRO_FEATURES
>   psmisc: control ipv6 support based on DISTRO_FEATURES
>   pulseaudio: control ipv6 support based on DISTRO_FEATURES
>   rsync: use rsync.inc to avoid duplicated codes
>   rsync: control ipv6 support based on DISTRO_FEATURES
>   wget: control ipv6 support based on DISTRO_FEATURES
>   xauth: control ipv6 support based on DISTRO_FEATURES
>   xhost: control ipv6 support based on DISTRO_FEATURES
>=20
>  meta/recipes-connectivity/libpcap/libpcap.inc      |  5 ++++-
>  .../nfs-utils/nfs-utils_1.3.3.bb                   |  5 ++++-
>  meta/recipes-core/libxml/libxml2_2.9.4.bb          |  5 ++++-
>  meta/recipes-devtools/rsync/rsync.inc              |  7 ++----
>  meta/recipes-devtools/rsync/rsync_2.6.9.bb         | 25 ++++++----------=
------
>  meta/recipes-devtools/rsync/rsync_3.1.2.bb         |  8 ++++++-
>  meta/recipes-extended/lighttpd/lighttpd_1.4.39.bb  |  5 ++++-
>  meta/recipes-extended/psmisc/psmisc.inc            |  3 +++
>  meta/recipes-extended/wget/wget.inc                |  5 +++--
>  meta/recipes-graphics/xorg-app/xauth_1.0.9.bb      |  3 +++
>  meta/recipes-graphics/xorg-app/xhost_1.0.7.bb      |  3 +++
>  meta/recipes-graphics/xorg-lib/libice_1.0.9.bb     |  3 ++-
>  meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb      |  3 +++
>  meta/recipes-graphics/xorg-lib/libxfont_1.5.1.bb   |  3 +++
>  meta/recipes-graphics/xorg-lib/libxmu_1.1.2.bb     |  3 +++
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |  2 ++
>  meta/recipes-support/apr/apr_1.5.2.bb              |  3 +++
>  meta/recipes-support/nspr/nspr_4.12.bb             |  3 +++
>  18 files changed, 62 insertions(+), 32 deletions(-)
>=20
> --
> 2.8.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


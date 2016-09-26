Return-Path: <anujx.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2AA0D60125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 01:05:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 25 Sep 2016 18:05:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,396,1470726000"; d="scan'208";a="1045794138"
Received: from pgsmsx105.gar.corp.intel.com ([10.221.44.96])
	by fmsmga001.fm.intel.com with ESMTP; 25 Sep 2016 18:05:40 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.45]) by
	PGSMSX105.gar.corp.intel.com ([169.254.4.70]) with mapi id
	14.03.0248.002; Mon, 26 Sep 2016 09:05:39 +0800
From: "Mittal, AnujX" <anujx.mittal@intel.com>
To: Armin Kuster <akuster808@gmail.com>, "akuster@mvista.com"
	<akuster@mvista.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/9] Jethro pull request
Thread-Index: AQHSFz5rJGvsMi+EJ0yuMSVUCCwPx6CK9R/A
Date: Mon, 26 Sep 2016 01:05:38 +0000
Message-ID: <DFCB2C9E62139C41B3FDE8F2B46593310A19B928@PGSMSX101.gar.corp.intel.com>
References: <cover.1474815558.git.akuster808@gmail.com>
In-Reply-To: <cover.1474815558.git.akuster808@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZjVlMzQ0YjctYjJmNC00ZDUwLTg0MzMtOWJjNzkzZjUyMzQ5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6IjE1WUgrTU1uUnNCbENuXC95RzBONU00MWF2RTZ2STBmRGRSdUErY1cxaU93PSJ9
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [PATCH 0/9] Jethro pull request
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
X-List-Received-Date: Mon, 26 Sep 2016 01:05:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Armin Kuster
> Sent: Sunday, September 25, 2016 11:05 PM
> To: akuster@mvista.com; openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 0/9] Jethro pull request
>=20
> Please consider these changes for Jethro
>=20
> The following changes since commit
> c9c85df86cd2270b144fa824ef76adedd3636c8a:
>=20
>   util-linux: Security fix for CVE-2016-5011 (2016-09-23 23:21:43 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib akuster/jethro-nex=
t
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-
> contrib/log/?h=3Dakuster/jethro-next
>=20
> Armin Kuster (9):
>   openssl: Security fix CVE-2016-2180
>   openssl: Security fix CVE-2016-8181
>   openssl: Security fix CVE-2016-2182
>   openssl: Security fix CVE-2016-6304

I think there's a typo here. Shouldn't this be CVE-2016-6302?

>   openssl: Security fix CVE-2016-6303
>   openssl: Security fix CVE-2016-6304
>   openssl: Security fix CVE-2016-6303

And, this CVE-2016-6306?

>   tzdata: update to 2016f
>   tzcode-native: update to 2016f
>=20
>  .../openssl/openssl/CVE-2016-2180.patch            |  44 ++++
>  .../openssl/openssl/CVE-2016-2181_p1.patch         |  91 ++++++++
>  .../openssl/openssl/CVE-2016-2181_p2.patch         | 239
> +++++++++++++++++++++
>  .../openssl/openssl/CVE-2016-2181_p3.patch         |  30 +++
>  .../openssl/openssl/CVE-2016-2182.patch            |  70 ++++++
>  .../openssl/openssl/CVE-2016-6302.patch            |  53 +++++
>  .../openssl/openssl/CVE-2016-6303.patch            |  36 ++++
>  .../openssl/openssl/CVE-2016-6304.patch            |  75 +++++++
>  .../openssl/openssl/CVE-2016-6306.patch            |  71 ++++++
>  .../recipes-connectivity/openssl/openssl_1.0.2h.bb |   9 +
>  ...code-native_2016e.bb =3D> tzcode-native_2016f.bb} |   8 +-
>  .../tzdata/{tzdata_2016e.bb =3D> tzdata_2016f.bb}    |   4 +-
>  12 files changed, 724 insertions(+), 6 deletions(-)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-
> 2180.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-
> 2181_p1.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-
> 2181_p2.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-
> 2181_p3.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-
> 2182.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-
> 6302.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-
> 6303.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-
> 6304.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-
> 6306.patch
>  rename meta/recipes-extended/tzcode/{tzcode-native_2016e.bb =3D> tzcode-
> native_2016f.bb} (68%)
>  rename meta/recipes-extended/tzdata/{tzdata_2016e.bb =3D> tzdata_2016f.b=
b}
> (98%)
>=20
> --
> 2.7.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


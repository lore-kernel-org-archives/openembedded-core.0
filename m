Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 26B4A6C765
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 13:59:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Jan 2014 05:59:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,729,1384329600"; d="scan'208";a="473091155"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by orsmga002.jf.intel.com with ESMTP; 27 Jan 2014 05:59:02 -0800
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.202]) by
	IRSMSX101.ger.corp.intel.com ([163.33.3.153]) with mapi id
	14.03.0123.003; Mon, 27 Jan 2014 13:58:33 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/4] Comms PUs
Thread-Index: AQHPF1CpQz9yWhMukkKmzxBTDbyNBJqYoQBg
Date: Mon, 27 Jan 2014 13:58:33 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16CF6C68@IRSMSX105.ger.corp.intel.com>
References: <cover.1390381388.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1390381388.git.cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] Comms PUs
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
X-List-Received-Date: Mon, 27 Jan 2014 13:59:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Cristian Iorga
Sent: Wednesday, January 22, 2014 11:04 AM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 0/4] Comms PUs

The following changes since commit 6e7047434fc1570146ebc94254412b99b1c4cab4=
:

  poky.ent: Fixed broken OE_LISTS_URL. (2014-01-21 21:58:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dciorga/PUs

Cristian Iorga (4):
  neard: upgrade to 0.14
  libpcap: upgrade to 1.5.3
  minicom: upgrade to 2.7
  connman: upgrade to 1.21

 meta/recipes-connectivity/connman/connman.inc                  |  7 ++----=
-
 .../connman/{connman_1.20.bb =3D> connman_1.21.bb}               |  5 ++--=
-
 .../libpcap/{libpcap_1.5.2.bb =3D> libpcap_1.5.3.bb}             |  7 ++--=
---
 meta/recipes-connectivity/neard/neard_0.10.bb                  | 10 ------=
----
 meta/recipes-connectivity/neard/neard_0.14.bb                  |  9 ++++++=
+++
 .../0001-fix-minicom-h-v-return-value-is-not-0.patch           |  0
 .../{minicom-2.6.2 =3D> minicom}/allow.to.disable.lockdev.patch  |  0
 .../minicom/{minicom_2.6.2.bb =3D> minicom_2.7.bb}               |  6 +++-=
--
 8 files changed, 18 insertions(+), 26 deletions(-)  rename meta/recipes-co=
nnectivity/connman/{connman_1.20.bb =3D> connman_1.21.bb} (68%)  rename met=
a/recipes-connectivity/libpcap/{libpcap_1.5.2.bb =3D> libpcap_1.5.3.bb} (77=
%)  delete mode 100644 meta/recipes-connectivity/neard/neard_0.10.bb
 create mode 100644 meta/recipes-connectivity/neard/neard_0.14.bb
 rename meta/recipes-extended/minicom/{minicom-2.6.2 =3D> minicom}/0001-fix=
-minicom-h-v-return-value-is-not-0.patch (100%)  rename meta/recipes-extend=
ed/minicom/{minicom-2.6.2 =3D> minicom}/allow.to.disable.lockdev.patch (100=
%)  rename meta/recipes-extended/minicom/{minicom_2.6.2.bb =3D> minicom_2.7=
.bb} (77%)

--
1.8.3.2

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core


Return-Path: <wei.tee.ng@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AE96475874
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 01:32:46 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 20 Jul 2015 18:32:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,512,1432623600"; d="scan'208";a="609743154"
Received: from pgsmsx106.gar.corp.intel.com ([10.221.44.98])
	by orsmga003.jf.intel.com with ESMTP; 20 Jul 2015 18:32:47 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.200]) by
	PGSMSX106.gar.corp.intel.com ([169.254.9.250]) with mapi id
	14.03.0224.002; Tue, 21 Jul 2015 09:32:42 +0800
From: "Ng, Wei Tee" <wei.tee.ng@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 0/2] [OE-core][master][dizzy] Enable Marvel 8897 Wifi
	feature
Thread-Index: AQHQugWRG140Mn28lUmQrmgxXVY5eZ3lNh/A
Date: Tue, 21 Jul 2015 01:32:42 +0000
Message-ID: <B4FF7F2787593E4CA07131C98D4AD41A01C47404@PGSMSX101.gar.corp.intel.com>
References: <1436418620-16592-1-git-send-email-wei.tee.ng@intel.com>
In-Reply-To: <1436418620-16592-1-git-send-email-wei.tee.ng@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] [master][dizzy] Enable Marvel 8897 Wifi feature
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
X-List-Received-Date: Tue, 21 Jul 2015 01:32:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, are these included?

Best Regards,
Wei Tee

> -----Original Message-----
> From: Ng, Wei Tee
> Sent: Thursday, July 9, 2015 1:10 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Ng, Wei Tee
> Subject: [PATCH 0/2] [OE-core][master][dizzy] Enable Marvel 8897 Wifi fea=
ture
>=20
> From: Ng Wei Tee <wei.tee.ng@intel.com>
>=20
> Hi all,
>=20
> I would like to add hostapd and iw configuration for enabling Marvell 889=
7 Wifi
> feature. Hostapd and iw configuration were created in the recipes-connect=
ivity
> layer to enable Marvell 8897 module function in AP mode and STA mode.
>=20
> Please review and provide feedback if any.
>=20
> This patch is target to merge in openembedded-core master and dizzy branc=
h.
> Thanks.
>=20
> Regards,
> Wei Tee
>=20
> Ng Shui Lei (2):
>   recipes-connectivity: Add hostapd configuration for enabling Marvell
>     8897 WiFi feature
>   recipes-connectivity: Add iw configuration for enabling Marvell 8897
>     WiFi feature
>=20
>  .../hostapd/hostapd-2.2/defconfig                  |  145 ++++++++++++++=
++++++
>  .../hostapd/hostapd-2.2/hostapd.service            |   11 ++
>  meta/recipes-connectivity/hostapd/hostapd-2.2/init |   58 ++++++++
>  meta/recipes-connectivity/hostapd/hostapd_2.2.bb   |   48 +++++++
>  ....sh-don-t-use-git-describe-for-versioning.patch |   40 ++++++
>  meta/recipes-connectivity/iw/iw_3.8.bb             |   27 ++++
>  6 files changed, 329 insertions(+)
>  create mode 100644 meta/recipes-connectivity/hostapd/hostapd-
> 2.2/defconfig
>  create mode 100644 meta/recipes-connectivity/hostapd/hostapd-
> 2.2/hostapd.service
>  create mode 100644 meta/recipes-connectivity/hostapd/hostapd-2.2/init
>  create mode 100644 meta/recipes-connectivity/hostapd/hostapd_2.2.bb
>  create mode 100644 meta/recipes-connectivity/iw/iw-3.8/0001-iw-version.s=
h-
> don-t-use-git-describe-for-versioning.patch
>  create mode 100644 meta/recipes-connectivity/iw/iw_3.8.bb
>=20
> --
> 1.7.9.5



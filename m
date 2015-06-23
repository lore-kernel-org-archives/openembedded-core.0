Return-Path: <wei.tee.ng@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 299D260125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 02:07:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 22 Jun 2015 19:07:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,663,1427785200"; d="scan'208";a="732643462"
Received: from pgsmsx102.gar.corp.intel.com ([10.221.44.80])
	by fmsmga001.fm.intel.com with ESMTP; 22 Jun 2015 19:07:16 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.200]) by
	PGSMSX102.gar.corp.intel.com ([10.221.44.80]) with mapi id
	14.03.0224.002; Tue, 23 Jun 2015 10:06:23 +0800
From: "Ng, Wei Tee" <wei.tee.ng@intel.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/3] [dizzy] Enable Marvell 8897 Wifi feature
Thread-Index: AQHQrVedzSPeiS08O0etgQL/bJTODp25VQNg
Date: Tue, 23 Jun 2015 02:06:23 +0000
Message-ID: <B4FF7F2787593E4CA07131C98D4AD41A01C435C9@PGSMSX101.gar.corp.intel.com>
References: <1434699981-8983-1-git-send-email-wei.tee.ng@intel.com>
	<5588BC3C.7020800@gmail.com>
In-Reply-To: <5588BC3C.7020800@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] [dizzy] Enable Marvell 8897 Wifi feature
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
X-List-Received-Date: Tue, 23 Jun 2015 02:07:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

Thanks for accepting the linux-firmware changes in dizzy branch.

Regarding to the two new recipes, is it possible to add the two new recipes=
 in master branch
so that it can be backport to dizzy/fido branch? My target is to enable hos=
tapd and iw features
in dizzy branch. Hope to get some advice from you. Thank you

Regards,
Wei Tee

> -----Original Message-----
> From: akuster808 [mailto:akuster808@gmail.com]
> Sent: Tuesday, June 23, 2015 9:54 AM
> To: Ng, Wei Tee; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 0/3] [dizzy] Enable Marvell 8897 Wifi featu=
re
>=20
> Wei Tee,
>=20
> I am ok with the firmware change but not adding two new recipes. A better
> place may be in fido.
>=20
> regards,
> Armin
>=20
> On 06/19/2015 12:46 AM, wei.tee.ng@intel.com wrote:
> > From: Ng Wei Tee <wei.tee.ng@intel.com>
> >
> > Hi all,
> >
> > I would like to add hostapd and iw configuration for enabling Marvell
> > 8897 Wifi feature. Hostapd and iw configuration were created in the
> > recipes-connectivity layer to enable Marvell 8897 module function in
> > AP Mode and STA mode.
> >
> > This also package the Marvell pci8897 and usb8897 in the
> > recipes-kernel/linux-firmware and intel iwlwifi firmware copyright
> > years changed. Please review and provide feedback if any.
> >
> > This patch is target to merge in openembedded-core dizzy branch.
> >
> > Regards,
> > Wei Tee
> >
> > Ng Shui Lei (2):
> >    recipes-connectivity: Add hostapd configuration for enabling Marvell
> >      8897 WiFi feature
> >    recipes-connectivity: Add iw configuration for enabling Marvell 8897
> >      WiFi feature
> >
> > Ng Wei Tee (1):
> >    linux-firmware: Package Marvell pci8897 and usb8897 firmware
> >
> >   .../hostapd/hostapd-2.2/defconfig                  |  145 +++++++++++=
+++++++++
> >   .../hostapd/hostapd-2.2/hostapd.service            |   11 ++
> >   meta/recipes-connectivity/hostapd/hostapd-2.2/init |   58 ++++++++
> >   meta/recipes-connectivity/hostapd/hostapd_2.2.bb   |   48 +++++++
> >   ....sh-don-t-use-git-describe-for-versioning.patch |   40 ++++++
> >   meta/recipes-connectivity/iw/iw_3.8.bb             |   27 ++++
> >   .../linux-firmware/linux-firmware_git.bb           |   19 ++-
> >   7 files changed, 345 insertions(+), 3 deletions(-)
> >   create mode 100644 meta/recipes-connectivity/hostapd/hostapd-
> 2.2/defconfig
> >   create mode 100644 meta/recipes-connectivity/hostapd/hostapd-
> 2.2/hostapd.service
> >   create mode 100644 meta/recipes-connectivity/hostapd/hostapd-2.2/init
> >   create mode 100644 meta/recipes-connectivity/hostapd/hostapd_2.2.bb
> >   create mode 100644 meta/recipes-connectivity/iw/iw-3.8/0001-iw-
> version.sh-don-t-use-git-describe-for-versioning.patch
> >   create mode 100644 meta/recipes-connectivity/iw/iw_3.8.bb
> >


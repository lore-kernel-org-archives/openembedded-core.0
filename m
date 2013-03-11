Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UF3eU-00062f-Bt
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 15:24:36 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Mar 2013 07:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,822,1355126400"; d="scan'208";a="212741912"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Mar 2013 07:07:35 -0700
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Mon, 11 Mar 2013 14:06:28 +0000
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.244]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.245]) with mapi id
	14.01.0355.002; Mon, 11 Mar 2013 14:06:28 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 0/2] BlueZ 5.3 new package
Thread-Index: AQHOHmBPxmF3sv3n502RhR1dOW67dpigg+9A
Date: Mon, 11 Mar 2013 14:06:28 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB162157B8@IRSMSX102.ger.corp.intel.com>
References: <1363010209-18220-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1363010209-18220-1-git-send-email-cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Re: [PATCH 0/2] BlueZ 5.3 new package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 14:24:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

This is an EXPERIMENTAL bluez5 new package.
This will not replace bluez4 and it is not an upgrade path from bluez4.

Given the fact that not a lot of components has been updated to work with b=
luez5, this package is largely untested.
It has been provided in the hope that for YP 1.5 release, the entire Blueto=
oth stack and related/dependent components will get updated.

Most probably bugs related to this package and/or related/dependent compone=
nts will be fixed in 1.5 release, not in 1.4 timeframe.

The scope with this PU is to provide developers the needed tools/technologi=
es in order to upgrade software to BlueZ5 BT stack.
This stack has support for BT4.0 with the appropriate Linux kernel.

Feedback for this upgrade is much appreciated.

Regards,
Cristian


Cristian Iorga
Linux Software Engineer
Open Source Technology Center
Intel


-----Original Message-----
From: Iorga, Cristian=20
Sent: Monday, March 11, 2013 3:57 PM
To: openembedded-core@lists.openembedded.org
Cc: Iorga, Cristian
Subject: [PATCH 0/2] BlueZ 5.3 new package

- BlueZ 5 v5.3 experimental new package;
- bluez5 package does not replace bluez4 package,
  as a lot of components that interact with bluez
  are not prepared to work correctly with bluez5;
- libical is added back, as it is a requirement for
  bluez OBEX feature.

Cristian Iorga (2):
  libical: add recipe back in oe-core
  bluez5: new package for v5.3

 .../bluez5/bluez5-5.3/bluetooth.conf               |   16 ++++++
 .../bluez5/bluez5-5.3/fix-udev-paths.patch         |   35 +++++++++++++
 meta/recipes-connectivity/bluez5/bluez5.inc        |   45 ++++++++++++++++=
+
 meta/recipes-connectivity/bluez5/bluez5_5.3.bb     |   35 +++++++++++++
 .../libical/files/pthread-fix.patch                |   52 ++++++++++++++++=
++++
 meta/recipes-support/libical/libical_0.48.bb       |   17 +++++++
 6 files changed, 200 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5-5.3/bluetooth.c=
onf
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5-5.3/fix-udev-pa=
ths.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5.inc
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.3.bb
 create mode 100644 meta/recipes-support/libical/files/pthread-fix.patch
 create mode 100644 meta/recipes-support/libical/libical_0.48.bb

--=20
1.7.10.4




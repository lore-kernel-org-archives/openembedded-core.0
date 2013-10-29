Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EBBE76D348
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 17:00:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Oct 2013 10:00:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,594,1378882800"; d="scan'208";a="424681258"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by fmsmga002.fm.intel.com with ESMTP; 29 Oct 2013 09:59:17 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.75]) by
	IRSMSX104.ger.corp.intel.com ([169.254.5.89]) with mapi id
	14.03.0123.003; Tue, 29 Oct 2013 16:59:16 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/2] glib-2.0 and bluez5 upgrades
Thread-Index: AQHO0BHixgYQzyJiQkqDqyIbe+E/k5oL8Csg
Date: Tue, 29 Oct 2013 16:59:15 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16CAEDF5@IRSMSX105.ger.corp.intel.com>
References: <cover.1382547468.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1382547468.git.cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] glib-2.0 and bluez5 upgrades
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
X-List-Received-Date: Tue, 29 Oct 2013 17:00:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.
Any comments?
/Cristian

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Cristian Iorga
Sent: Wednesday, October 23, 2013 8:00 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 0/2] glib-2.0 and bluez5 upgrades

The following changes since commit ffb440c37c3491fa5d9a1408341f7c15eacdc9ce=
:

  midori: exclude from self-hosted for mips64 (2013-10-23 07:18:54 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PU2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dciorga/PU2

Cristian Iorga (2):
  glib-2.0: upgrade to 2.38.1
  bluez5: upgrade to 5.10

 .../bluez5/{bluez5-5.7 =3D> bluez5-5.10}/bluetooth.conf                | 0
 meta/recipes-connectivity/bluez5/bluez5_5.10.bb                      | 5 +=
++++
 meta/recipes-connectivity/bluez5/bluez5_5.7.bb                       | 5 -=
----
 .../recipes-core/glib-2.0/{glib-2.0_2.38.0.bb =3D> glib-2.0_2.38.1.bb} | 4=
 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)  rename meta/recipes-conn=
ectivity/bluez5/{bluez5-5.7 =3D> bluez5-5.10}/bluetooth.conf (100%)  create=
 mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.10.bb
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.7.bb
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.38.0.bb =3D> glib-2.0_2.38.1=
.bb} (93%)

--
1.8.1.2

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core


Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3D2C66A960
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 05:50:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Jul 2013 22:50:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,748,1367996400"; d="scan'208";a="376841372"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by orsmga002.jf.intel.com with ESMTP; 25 Jul 2013 22:50:41 -0700
Received: from irsmsx153.ger.corp.intel.com (163.33.192.75) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Fri, 26 Jul 2013 06:50:39 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.64]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.218]) with mapi id
	14.03.0123.003; Fri, 26 Jul 2013 06:50:39 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Saul Wold <sgw@linux.intel.com>, "'Patches and discussions about the
	oe-core layer'" <openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>
Thread-Topic: Thoughts about bluez4 and bluez5
Thread-Index: AQHOiVN0Vw1tM5H8tUqvXj0b/PhQx5l2dF+Q
Date: Fri, 26 Jul 2013 05:50:38 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16C0E71D@IRSMSX105.ger.corp.intel.com>
References: <51F15115.3040008@linux.intel.com>
In-Reply-To: <51F15115.3040008@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Re: Thoughts about bluez4 and bluez5
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
X-List-Received-Date: Fri, 26 Jul 2013 05:50:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Saul, Ross,

I think that for the time being libasound-module-bluez should be libasound-=
module-bluez5.
We will get back to it after 1.5, when all components will be ready for Blu=
eZ 5.
On the second issue, can you please go into details? I am not following exa=
ctly.
Regards,
Cristian

-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]=20
Sent: Thursday, July 25, 2013 7:24 PM
To: 'Patches and discussions about the oe-core layer'; Iorga, Cristian; Bur=
ton, Ross
Subject: Thoughts about bluez4 and bluez5



Cristi, Ross:

There is currently a PREFERRED_PROVIDER issue with bluez4 and bluez5 and I =
am beginning to think we need to distinguish the libasound-module-bluez wit=
h libasound-module-bluez5.

I am also seeing some areas where we might need a virtual/bluez to allow re=
cipes to enable features in places like connman and ofono

Thoughts?



--=20
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System



Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 3769E6D478
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 17:54:37 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Nov 2013 09:54:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="386684255"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by azsmga001.ch.intel.com with ESMTP; 08 Nov 2013 09:54:38 -0800
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.75]) by
	IRSMSX101.ger.corp.intel.com ([163.33.3.153]) with mapi id
	14.03.0123.003; Fri, 8 Nov 2013 17:54:36 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Steve Sakoman <sakoman@gmail.com>, "Patches and discussions about the
	oe-core layer" <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC] wpa-supplicant - enable
	CONFIG_CTRL_IFACE_DBUS_NEW	in config
Thread-Index: AQHO3JfoJOOv+VEE80GXQT8cqnVnU5obnVmQ
Date: Fri, 8 Nov 2013 17:54:35 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16CB2D41@IRSMSX105.ger.corp.intel.com>
References: <CAGDS+nkupBrwgBBTbZzSnnB9pjaf2P6gMuQHn6QAZjfkFqi7ww@mail.gmail.com>
In-Reply-To: <CAGDS+nkupBrwgBBTbZzSnnB9pjaf2P6gMuQHn6QAZjfkFqi7ww@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Re: [RFC] wpa-supplicant - enable CONFIG_CTRL_IFACE_DBUS_NEW	in config
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
X-List-Received-Date: Fri, 08 Nov 2013 17:54:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Steve,
I don't know any reason, might be a mistake.
Please enable the option.

Regards,
Cristian

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Steve Sakoman
Sent: Friday, November 8, 2013 5:33 PM
To: Patches and discussions about the oe-core layer
Subject: [OE-core] [RFC] wpa-supplicant - enable CONFIG_CTRL_IFACE_DBUS_NEW=
 in config

I've begun using Yocto 1.5 (dora) for several client projects over the past=
 few weeks.

I noticed that images that included connman and wpa-supplicant always faile=
d to enable the wifi technology properly.  The visible error indication in =
the log:

src/technology.c:technology_get() No matching drivers found for wifi

After many hours of debugging I finally figured out that this was due to a =
missing option in wpa-supplicant (CONFIG_CTRL_IFACE_DBUS_NEW)

Adding a bbappend for wpa-supplicant with this option enabled fixed the iss=
ue and connman now handles wifi interfaces as expected.

Was there a particular reason CONFIG_CTRL_IFACE_DBUS_NEW wasn't enabled?

Steve
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core


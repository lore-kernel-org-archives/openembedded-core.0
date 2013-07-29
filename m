Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id E88BF60958
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 06:42:10 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 28 Jul 2013 23:42:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,767,1367996400"; d="scan'208";a="274650927"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Jul 2013 23:41:52 -0700
Received: from irsmsx153.ger.corp.intel.com (163.33.192.75) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Mon, 29 Jul 2013 07:41:36 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.64]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.218]) with mapi id
	14.03.0123.003; Mon, 29 Jul 2013 07:41:35 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Saul Wold <sgw@linux.intel.com>, "'Patches and discussions about the
	oe-core layer'" <openembedded-core@lists.openembedded.org>
Thread-Topic: Thoughts about bluez4 and bluez5
Thread-Index: AQHOiVN0Vw1tM5H8tUqvXj0b/PhQx5l2dF+QgATEK/D///DdAIAAESaw
Date: Mon, 29 Jul 2013 06:41:35 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16C0F05B@IRSMSX105.ger.corp.intel.com>
References: <51F15115.3040008@linux.intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB16C0F03E@IRSMSX105.ger.corp.intel.com>
	<51F60E30.5030200@linux.intel.com>
In-Reply-To: <51F60E30.5030200@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
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
X-List-Received-Date: Mon, 29 Jul 2013 06:42:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

OK, thanks, will handle it this week.
Regards,
/Cristian

-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]=20
Sent: Monday, July 29, 2013 9:40 AM
To: Iorga, Cristian; 'Patches and discussions about the oe-core layer'
Cc: Burton, Ross
Subject: Re: Thoughts about bluez4 and bluez5

On 07/28/2013 11:34 PM, Iorga, Cristian wrote:
> Back from the past!!
>
> -----Original Message-----
> From: Iorga, Cristian
> Sent: Friday, July 26, 2013 8:51 AM
> To: 'Saul Wold'; 'Patches and discussions about the oe-core layer';=20
> Burton, Ross
> Subject: RE: Thoughts about bluez4 and bluez5
>
> Hi Saul, Ross,
>
> I think that for the time being libasound-module-bluez should be libasoun=
d-module-bluez5.
> We will get back to it after 1.5, when all components will be ready for B=
lueZ 5.
This can not wait until after 1.5, it's a note and needs to be addressed no=
w. Martin has also reported this issue to you as well.

> On the second issue, can you please go into details? I am not following e=
xactly.

It's possible for new version of ofono or connman to want to use bluez5, vi=
a the PACKAGECONFIG settings, we need to allow that to happen with out havi=
ng to embed bluez4 vs bluez5 in the recipe, this can be done with a virtual=
/bluez style of declartion you can see examples of this for virtual/libc an=
d in the meta/conf/distro/include/default-providers.inc file

Sau!

> Regards,
> Cristian
>
> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Thursday, July 25, 2013 7:24 PM
> To: 'Patches and discussions about the oe-core layer'; Iorga,=20
> Cristian; Burton, Ross
> Subject: Thoughts about bluez4 and bluez5
>
>
>
> Cristi, Ross:
>
> There is currently a PREFERRED_PROVIDER issue with bluez4 and bluez5 and =
I am beginning to think we need to distinguish the libasound-module-bluez w=
ith libasound-module-bluez5.
>
> I am also seeing some areas where we might need a virtual/bluez to=20
> allow recipes to enable features in places like connman and ofono
>
> Thoughts?
>
>
>


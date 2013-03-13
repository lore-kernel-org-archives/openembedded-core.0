Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UFom2-0007FW-4c
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 17:43:34 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Mar 2013 09:26:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,838,1355126400"; d="scan'208";a="305651791"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by fmsmga002.fm.intel.com with ESMTP; 13 Mar 2013 09:26:47 -0700
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Wed, 13 Mar 2013 16:26:38 +0000
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.244]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.185]) with mapi id
	14.01.0355.002; Wed, 13 Mar 2013 16:26:40 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, Koen Kooi
	<koen@dominion.thruhere.net>
Thread-Topic: [OE-core] [PATCH 2/2] bluez5: new package for v5.3
Thread-Index: AQHOIAaga5eBsG0HEUSbvhgxUuKykpijzq9A
Date: Wed, 13 Mar 2013 16:26:40 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16216760@IRSMSX102.ger.corp.intel.com>
References: <1363010209-18220-1-git-send-email-cristian.iorga@intel.com>
	<1363010209-18220-3-git-send-email-cristian.iorga@intel.com>
	<20130312070053.GE9724@jama.dyndns-home.com>
	<CAJTo0LZtUg+fUrLd6sVfSk1gQrauyq60ukMg5jh-_kcgeaK0Lg@mail.gmail.com>
	<20130312100713.GJ9724@jama.dyndns-home.com>
	<CAJTo0LZdYx9RLJ9an7LnALUOL5PkeUapnrMA5GyiDROcgwXbKw@mail.gmail.com>
	<923A8385-1063-4C78-92ED-9441F19E338B@dominion.thruhere.net>
	<CAJTo0Las40Ezm=3St_tJVsVrPP4Aa4+ZLP+wd7ssAAMxGgqVeQ@mail.gmail.com>
In-Reply-To: <CAJTo0Las40Ezm=3St_tJVsVrPP4Aa4+ZLP+wd7ssAAMxGgqVeQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] bluez5: new package for v5.3
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
X-List-Received-Date: Wed, 13 Mar 2013 16:43:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

Judging from what I have read on mailing lists, there is a good chance a lo=
t of components will be ready to switch to bluez5 in 6 months timeframe.

Regards,
Cristian

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Burton, Ross
Sent: Wednesday, March 13, 2013 6:20 PM
To: Koen Kooi
Cc: Martin Jansa; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] bluez5: new package for v5.3

On 13 March 2013 02:14, Koen Kooi <koen@dominion.thruhere.net> wrote:
> At the risk of sounding snarky while making a real recommendation: Why=20
> not do it oe-core > style and completely remove bluez 4.x at the start=20
> of the 1.5 cycle and work through the breakage?  I guess that means I=20
> volunteer to help with that :)

Is the world going to migrate to the bluez5 API in six months?  I was expec=
ting to have to carry bluez4 and 5 for at least one or two cycles.  We have=
 a similar issue with GStreamer 0.10 and 1.0 - we could drop 0.10 and port =
what ships in oe-core, but the subsequent breakage would cause a riot.

Ross

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



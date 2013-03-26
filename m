Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UKRGH-0007mb-SS
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 11:37:50 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 Mar 2013 03:20:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,911,1355126400"; d="scan'208";a="276047010"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by azsmga001.ch.intel.com with ESMTP; 26 Mar 2013 03:20:47 -0700
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Tue, 26 Mar 2013 10:20:43 +0000
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.244]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.245]) with mapi id
	14.01.0355.002; Tue, 26 Mar 2013 10:20:43 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, Martin Jansa
	<martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH V3 0/2] BlueZ 5.3 new package
Thread-Index: AQHOKVmhCx8oCbeNBU2/6MCQzHHDspi2k5CAgAAD5ACAAAtFAIAAAwOAgAEdsWA=
Date: Tue, 26 Mar 2013 10:20:42 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB1621A5B5@IRSMSX102.ger.corp.intel.com>
References: <1364216841-32600-1-git-send-email-cristian.iorga@intel.com>
	<C39A6084-A254-4AE2-A9DD-49B88EDCB164@dominion.thruhere.net>
	<CAJTo0Lb9e4j-O2R5_wvkH=2APWYMZDnFw0pxj_YheeHZfUBdig@mail.gmail.com>
	<20130325170346.GD7539@jama>
	<CAJTo0La=nhQTjNMLB=WwyOi-2akWsrj83m=1fbD9Y52y8+HxuQ@mail.gmail.com>
In-Reply-To: <CAJTo0La=nhQTjNMLB=WwyOi-2akWsrj83m=1fbD9Y52y8+HxuQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 0/2] BlueZ 5.3 new package
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
X-List-Received-Date: Tue, 26 Mar 2013 10:37:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

I will test today an install path for bluez5 using the opkg manager in a ex=
istent image.

I will keep you updated.

Regards,
Cristian

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Burton, Ross
Sent: Monday, March 25, 2013 7:15 PM
To: Martin Jansa
Cc: Koen Kooi; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V3 0/2] BlueZ 5.3 new package

On 25 March 2013 17:03, Martin Jansa <martin.jansa@gmail.com> wrote:
> But opkg will still error out because of missing RPROVIDES, no?

I'll admit that I didn't test an upgrade path, but the scenario I can see a=
ctually happening is that the distro flips its applications from
bluez4 to bluez5 so they rdepend on bluez5 now.  bluez5 will get pulled in =
through that dependency, nothing depends on bluez4 anymore, so opkg should =
remove bluez4.  bluez4 and bluez5 don't expose the same ABI so they are not=
 suitable RPROVIDES for eachother.

Ross

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



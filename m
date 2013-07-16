Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 12F696B218
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 14:50:53 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 16 Jul 2013 07:50:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,677,1367996400"; d="scan'208";a="269013628"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Jul 2013 07:50:52 -0700
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 16 Jul 2013 15:49:56 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.52]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.125]) with mapi id
	14.03.0123.003; Tue, 16 Jul 2013 15:49:56 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH V3 0/2] BlueZ 5 experimental recipes
Thread-Index: AQHOgjCeaubcFOGEK0CctiFa2wh4c5lnTdOAgAARH8D///LAAIAAERew
Date: Tue, 16 Jul 2013 14:49:56 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16C05A9F@IRSMSX105.ger.corp.intel.com>
References: <1373984927-21039-1-git-send-email-cristian.iorga@intel.com>
	<1373985229.2651.84.camel@phil-desktop.brightsign>
	<969F26A8BAB325438E7EB80D3C3134FB16C05A76@IRSMSX105.ger.corp.intel.com>
	<51E55D0C.4080605@linux.intel.com>
In-Reply-To: <51E55D0C.4080605@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 0/2] BlueZ 5 experimental recipes
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
X-List-Received-Date: Tue, 16 Jul 2013 14:50:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This will happen only when bluez5 will be a replacement for bluez4, which i=
s not the case now, but it will be when everything else is ready for bluez5=
.

-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]=20
Sent: Tuesday, July 16, 2013 5:48 PM
To: Iorga, Cristian
Cc: Phil Blundell; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V3 0/2] BlueZ 5 experimental recipes

On 07/16/2013 07:36 AM, Iorga, Cristian wrote:
> " why having it be so is not a very good thing."
>
> Sorry, I did not understood this part.
>
> Judging by my investigation, is RREPLACES needed or not?
>
I believe that RREPLACES is not needed, it could cause problems if a feed b=
uilds the bluez5 packages but does not want to use them, without the RREPLA=
CES it requires a conscious effort on the target to get the update.

The upgrade case is exactly why we should not have RREPLACES.

Sau!

> /Cristian
>
> -----Original Message-----
> From: Phil Blundell [mailto:pb@pbcl.net]
> Sent: Tuesday, July 16, 2013 5:34 PM
> To: Iorga, Cristian
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH V3 0/2] BlueZ 5 experimental recipes
>
> On Tue, 2013-07-16 at 17:28 +0300, Cristian Iorga wrote:
>> Observe my investigation below in order to decide if RREPLACES is needed=
.
>> Conclusion: BlueZ 5.x will be eventually an upgrade path for an=20
>> already installed embedded device. As such, RREPLACES is needed for a sy=
stem-wide upgrade.
>
> It wasn't very obvious to me that these results make a compelling case fo=
r bluez4 needing to RREPLACE bluez5.  Indeed, this section:
>
> root@qemux86:~# opkg install bluez5
> Multiple replacers for bluez5, using first one (bluez4).
> Package bluez4 is already installed on root.
> root@qemux86:~# opkg list-installed | grep bluez
> bluez4 - 4.101-r6.0
> libasound-module-bluez - 4.101-r6.0
>
> ... seems to illustrate (modulo the usual amount of opkg craziness) why h=
aving it be so is not a very good thing.
>
> p.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


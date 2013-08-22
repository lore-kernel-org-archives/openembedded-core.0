Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E93C96B10F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 17:34:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2013 10:34:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,935,1367996400"; d="scan'208";a="390484329"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga002.fm.intel.com with ESMTP; 22 Aug 2013 10:34:01 -0700
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Thu, 22 Aug 2013 18:32:55 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.64]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.10]) with mapi id
	14.03.0123.003; Thu, 22 Aug 2013 18:32:55 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [CONSOLIDATED PULL 00/62] Python3, Packge Exlude and
	more (Initial ACK Please)!
Thread-Index: AQHOn05x7AhxK4sw9U+nbh/jr6OpHJmhfFfA
Date: Thu, 22 Aug 2013 17:32:54 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16C1928F@IRSMSX105.ger.corp.intel.com>
References: <cover.1377150822.git.sgw@linux.intel.com>
	<CAJTo0LYJhy5Qxn2Mbom5vgyiM_d_H+TvU0mCyUHp01ZVoeYvMQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYJhy5Qxn2Mbom5vgyiM_d_H+TvU0mCyUHp01ZVoeYvMQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/62] Python3, Packge Exlude and more (Initial ACK Please)!
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
X-List-Received-Date: Thu, 22 Aug 2013 17:34:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

So your advice is to keep hicolor-icon-theme and also add sato theme?
Regards,
Cristian

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Burton, Ross
Sent: Thursday, August 22, 2013 6:44 PM
To: Saul Wold
Cc: Paul Eggleton; OE-core
Subject: Re: [OE-core] [CONSOLIDATED PULL 00/62] Python3, Packge Exlude and=
 more (Initial ACK Please)!

On 22 August 2013 06:58, Saul Wold <sgw@linux.intel.com> wrote:
> Cristian Iorga (4):
>   packagegroup-self-hosted: pcmanfm integration

This also adds xprop.  Is that a dependency of something else, or should it=
 be removed?

>   build-appliance-image: changing the icon theme to sato

You'll want to keep hicolor-icon-theme installed, as it provides the skelet=
on structure for icons.

Ross
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core


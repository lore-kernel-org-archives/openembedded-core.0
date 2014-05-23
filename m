Return-Path: <Zongchun.Yu@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com (unknown
	[207.46.163.140])
	by mail.openembedded.org (Postfix) with ESMTP id 3F74D605B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 05:44:24 +0000 (UTC)
Received: from BLUPR03CA036.namprd03.prod.outlook.com (10.141.30.29) by
	BLUPR03MB470.namprd03.prod.outlook.com (10.141.78.142) with Microsoft
	SMTP Server (TLS) id 15.0.944.11; Fri, 23 May 2014 05:44:25 +0000
Received: from BY2FFO11FD037.protection.gbl (2a01:111:f400:7c0c::151) by
	BLUPR03CA036.outlook.office365.com (2a01:111:e400:879::29) with
	Microsoft SMTP Server (TLS) id 15.0.949.11 via Frontend Transport;
	Fri, 23 May 2014 05:44:24 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.1) by
	BY2FFO11FD037.mail.protection.outlook.com (10.1.14.222) with Microsoft
	SMTP Server (TLS) id 15.0.949.9 via Frontend Transport;
	Fri, 23 May 2014 05:44:24 +0000
Received: from b4052702 (b40527-02.ap.freescale.net [10.193.20.88])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s4N5iKcr028187; Thu, 22 May 2014 22:44:21 -0700
From: Zongchun YU <b40527@freescale.com>
To: "'Burton, Ross'" <ross.burton@intel.com>
References: <1400226321-5201-1-git-send-email-b40527@freescale.com>
	<CAJTo0Lar8Hbc1Gsa3k631M697ZHDOufJ1k7ugTUU=AWXaHjMAQ@mail.gmail.com>
	<000501cf70f0$2f2d17a0$8d8746e0$@com>
	<CAJTo0LavgOS4HyXLB2ur6PsH3yAaWW7SQf5qFcoz1yia_uMfqA@mail.gmail.com>
	<003001cf7311$13ceec40$3b6cc4c0$@com>
	<CAJTo0LbFKcv+riCYiNSJ0vOZHb4j6hi5hfLNpFya=pAkMyZ1kg@mail.gmail.com>
In-Reply-To: <CAJTo0LbFKcv+riCYiNSJ0vOZHb4j6hi5hfLNpFya=pAkMyZ1kg@mail.gmail.com>
Date: Fri, 23 May 2014 13:45:08 +0800
Message-ID: <006d01cf764a$2b710b80$82532280$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
thread-index: Ac9zRzlnFmefgEaTTKuVou1qI1DdrgC/zANQ
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.1; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(199002)(189002)(51704005)(50986999)(93916002)(62966002)(76176999)(561944003)(74502001)(14726001)(92566001)(92726001)(50226001)(4396001)(6806004)(77156001)(61296002)(77096999)(99396002)(74662001)(81342001)(33646001)(33716001)(31966008)(44976005)(50466002)(83322001)(81542001)(21056001)(76482001)(87936001)(88136002)(23676002)(83072002)(85852003)(80022001)(59696002)(89996001)(46102001)(20776003)(96836002)(79102001)(64706001)(87286001)(26826002)(77982001)(47776003)(2656002)(84116002);
	DIR:OUT; SFP:; SCL:1; SRVR:BLUPR03MB470;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:gate-tx3.freescale.com; A:1; MX:1; LANG:en; 
X-Forefront-PRVS: 0220D4B98D
Received-SPF: Fail (: domain of freescale.com does not designate
	192.88.168.1 as permitted sender) receiver=; client-ip=192.88.168.1;
	helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.1)
	smtp.mailfrom=Zongchun.Yu@freescale.com; 
X-OriginatorOrg: freescale.com
Cc: 'OE-core' <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] Add api-doc class
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
X-List-Received-Date: Fri, 23 May 2014 05:44:29 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: zh-cn

>>It's not opt-in: once a recipe is using doxygen.bbclass then it has a =
build dependency on doxygen-native and *will* generate documentation.
>>This is needless overhead if you don't intend to read the =
documentation.
>
> I think if you intend to read the documentation. Just inherit this =
class. If not. there is no need to inherit this class.

So you're suggesting that if a user wants documentation generated they =
should know what recipes they can add "inherit api-doc" to?

I'll repeat my proposal: every recipe that can generate doxygen =
documentation inherits a doxygen class, and that class can look at a =
distro-level variable along the likes of GENERATE_API_DOCS (which a =
hypothetical non-stub gtk-doc class can also respect).
[Zongchun] OK. Can you explain the details to use GENERATE_API_DOCS? I =
am not sure the meaning. Thanks.



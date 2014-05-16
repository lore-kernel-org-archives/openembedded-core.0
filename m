Return-Path: <Zongchun.Yu@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com (unknown
	[207.46.163.188])
	by mail.openembedded.org (Postfix) with ESMTP id 9758465E58
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 10:18:12 +0000 (UTC)
Received: from BLUPR03CA032.namprd03.prod.outlook.com (10.141.30.25) by
	BLUPR03MB020.namprd03.prod.outlook.com (10.255.208.42) with Microsoft
	SMTP Server (TLS) id 15.0.944.11; Fri, 16 May 2014 10:18:12 +0000
Received: from BN1AFFO11FD038.protection.gbl (2a01:111:f400:7c10::194) by
	BLUPR03CA032.outlook.office365.com (2a01:111:e400:879::25) with
	Microsoft SMTP Server (TLS) id 15.0.949.11 via Frontend Transport;
	Fri, 16 May 2014 10:18:12 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD038.mail.protection.outlook.com (10.58.52.242) with
	Microsoft SMTP Server (TLS) id 15.0.939.9 via Frontend Transport;
	Fri, 16 May 2014 10:18:11 +0000
Received: from b4052702 (b40527-02.ap.freescale.net [10.193.20.88])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s4GAI8ZG027189;
	Fri, 16 May 2014 03:18:10 -0700
From: Zongchun YU <b40527@freescale.com>
To: "'Burton, Ross'" <ross.burton@intel.com>
References: <1400226321-5201-1-git-send-email-b40527@freescale.com>
	<CAJTo0Lar8Hbc1Gsa3k631M697ZHDOufJ1k7ugTUU=AWXaHjMAQ@mail.gmail.com>
In-Reply-To: <CAJTo0Lar8Hbc1Gsa3k631M697ZHDOufJ1k7ugTUU=AWXaHjMAQ@mail.gmail.com>
Date: Fri, 16 May 2014 18:18:26 +0800
Message-ID: <000501cf70f0$2f2d17a0$8d8746e0$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
thread-index: Ac9w6sEEAr0Fozf0Sg6t7uZoj+voxQAAPnDg
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(6009001)(199002)(189002)(77982001)(87286001)(2656002)(59696002)(84676001)(21056001)(81342001)(76482001)(46102001)(83072002)(23676002)(97736001)(85852003)(89996001)(61296002)(81542001)(87936001)(81156002)(99396002)(76176999)(77096999)(64706001)(80022001)(96836002)(4396001)(50986999)(62966002)(77156001)(44976005)(83322001)(79102001)(84116002)(20776003)(47776003)(68736004)(50466002)(69596002)(6806004)(92726001)(92566001)(50226001)(74662001)(74502001)(31966008)(33646001)(33716001)(14726001);
	DIR:OUT; SFP:; SCL:1; SRVR:BLUPR03MB020;
	H:az84smr01.freescale.net; FPR:; MLV:sfv;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Forefront-PRVS: 02135EB356
Received-SPF: Fail (: domain of freescale.com does not designate
	192.88.158.2 as permitted sender) receiver=; client-ip=192.88.158.2;
	helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
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
X-List-Received-Date: Fri, 16 May 2014 10:18:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: zh-cn

>>As this class is specific to doxygen, please call it doxygen.bbclass.
[Zongchun] I agree and will change it in the next patch.
>>Also I think this should be opt-in not forcibly enabled as not =
everyone would want API documentation to be generated.
[Zongchun] Yes. it is opt-in. the source code of packages should be =
written follow the rules of doxygen. If not. doxygen will not generate =
docs.
>>Pretty sure you'll want to run doxygen after do_compile in case the =
documentation is generated from files built at compile time.  But don't =
most packages that use doxygen invoke it themselves?  You're also not =
actually installing the documentation anywhere.
[Zongchun] doxygen just use source code(follow the rules of doxygen) of =
packages to generate docs. not use files built at compile time. Some =
packages may just need to fetch and patch the source code and then =
generate docs. the configure file of doxygen have options to specify the =
generated docs types and location. Whether install the docs may depend =
the packages.



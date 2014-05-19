Return-Path: <Zongchun.Yu@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com (unknown
	[207.46.163.143])
	by mail.openembedded.org (Postfix) with ESMTP id 12F9965EB4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 03:18:31 +0000 (UTC)
Received: from DM2PR03CA002.namprd03.prod.outlook.com (10.141.52.150) by
	BY2PR03MB026.namprd03.prod.outlook.com (10.255.240.40) with Microsoft
	SMTP Server (TLS) id 15.0.944.11; Mon, 19 May 2014 03:18:30 +0000
Received: from BL2FFO11FD038.protection.gbl (2a01:111:f400:7c09::185) by
	DM2PR03CA002.outlook.office365.com (2a01:111:e400:2414::22) with
	Microsoft SMTP Server (TLS) id 15.0.944.11 via Frontend Transport;
	Mon, 19 May 2014 03:18:30 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD038.mail.protection.outlook.com (10.173.161.134) with
	Microsoft
	SMTP Server (TLS) id 15.0.949.9 via Frontend Transport; Mon, 19 May 2014
	03:18:29 +0000
Received: from b4052702 (b40527-02.ap.freescale.net [10.193.20.88])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s4J3IQwa021785;
	Sun, 18 May 2014 20:18:27 -0700
From: Zongchun YU <b40527@freescale.com>
To: "'Burton, Ross'" <ross.burton@intel.com>
References: <1400226321-5201-1-git-send-email-b40527@freescale.com>
	<CAJTo0Lar8Hbc1Gsa3k631M697ZHDOufJ1k7ugTUU=AWXaHjMAQ@mail.gmail.com>
	<000501cf70f0$2f2d17a0$8d8746e0$@com>
	<CAJTo0LavgOS4HyXLB2ur6PsH3yAaWW7SQf5qFcoz1yia_uMfqA@mail.gmail.com>
In-Reply-To: <CAJTo0LavgOS4HyXLB2ur6PsH3yAaWW7SQf5qFcoz1yia_uMfqA@mail.gmail.com>
Date: Mon, 19 May 2014 11:18:57 +0800
Message-ID: <003001cf7311$13ceec40$3b6cc4c0$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
thread-index: Ac9w8mz9z4tvbLt0SSy53vIIFyT3rwCGEoWg
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(6009001)(199002)(189002)(21056001)(50466002)(89996001)(96836002)(68736004)(69596002)(46102001)(44976005)(92566001)(23676002)(33716001)(76482001)(50986999)(59696002)(92726001)(31966008)(87286001)(77096999)(77982001)(85852003)(19580395003)(76176999)(93916002)(83072002)(81156002)(81342001)(87936001)(77156001)(99396002)(2656002)(74502001)(84116002)(74662001)(88136002)(6806004)(50226001)(33646001)(83322001)(4396001)(79102001)(81542001)(64706001)(20776003)(47776003)(80022001)(61296002)(62966002);
	DIR:OUT; SFP:; SCL:1; SRVR:BY2PR03MB026;
	H:az84smr01.freescale.net; FPR:; MLV:sfv;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Forefront-PRVS: 021670B4D2
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
X-List-Received-Date: Mon, 19 May 2014 03:18:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: zh-cn

>It's not opt-in: once a recipe is using doxygen.bbclass then it has a =
build dependency on doxygen-native and *will* generate documentation.
>This is needless overhead if you don't intend to read the =
documentation.

I think if you intend to read the documentation. Just inherit this =
class. If not. there is no need to inherit this class.

>You can't assert that the documentation is solely generated on the =
shipped files in the tarballs: what if some of the files are =
machine-generated?  Or if with for example DBus, the doxygen is =
generated?
>I've nothing against a doxygen class and would like to also see a =
gtk-doc class that isn't a stub, with a single distribution-level =
"generate API documentation" variable controlling them.  But the =
documentation has to be generated at build time, and I think it's fair =
to assume that is a package has API documentation then "make" will build =
it, otherwise the method to build the documentation will be different =
for every package.
>For example, DBus has a Doxyfile.in at the top of the source tree, so =
not only does configure needs to run to generate a Doxyfile but that =
Doxyfile is written to ${B}, not ${S}.

OK. You are right. What about configure task? Maybe we should adjust =
this task before it. Doxyfile(or other name) is the file which will be =
used by doxygen. It is one part of source code to be maintain.

Zongchun



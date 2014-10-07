Return-Path: <Lauren.Post@freescale.com>
X-Greylist: delayed 917 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 07 Oct 2014 15:39:53 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0105.outbound.protection.outlook.com [65.55.169.105])
	by mail.openembedded.org (Postfix) with ESMTP id D8C786B7CA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Oct 2014 15:39:53 +0000 (UTC)
Received: from CY1PR0301MB0700.namprd03.prod.outlook.com (25.160.159.142) by
	CY1PR0301MB0699.namprd03.prod.outlook.com (25.160.159.141) with
	Microsoft
	SMTP Server (TLS) id 15.0.1049.19; Tue, 7 Oct 2014 15:24:35 +0000
Received: from CY1PR0301MB0700.namprd03.prod.outlook.com ([25.160.159.142]) by
	CY1PR0301MB0700.namprd03.prod.outlook.com ([25.160.159.142]) with
	mapi id 15.00.1044.008; Tue, 7 Oct 2014 15:24:35 +0000
From: Lauren Post <Lauren.Post@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Multiple issues building from dizzy or master
Thread-Index: Ac/iQsvC7/qyE+FWQruCM8wynhzxgQ==
Date: Tue, 7 Oct 2014 15:24:35 +0000
Message-ID: <e777247650f44526919fb4737b79b0a6@CY1PR0301MB0700.namprd03.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.88.168.50]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB0699;
x-forefront-prvs: 035748864E
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(107046002)(74316001)(21056001)(107886001)(97736003)(229853001)(2351001)(77096002)(87936001)(105586002)(106356001)(2656002)(4396001)(99286002)(46102003)(122556002)(95666004)(40100002)(80022003)(54356999)(99396003)(108616004)(76576001)(31966008)(66066001)(76482002)(120916001)(86362001)(50986999)(101416001)(85306004)(92566001)(33646002)(20776003)(64706001)(85852003)(110136001)(24736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB0699;
	H:CY1PR0301MB0700.namprd03.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Multiple issues building from dizzy or master
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
X-List-Received-Date: Tue, 07 Oct 2014 15:39:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

We've been trying for a few weeks to move all our builds to master (yesterd=
ay dizzy for poky which is the same) and been having random strange problem=
s on multiple jenkins machines we do our daily builds on.  I talked to Otav=
io about it but wonder if we are missing something.    I'd appreciate any i=
deas.   We can build our kernel and uboot fine but when we try to build a m=
ore complex image with qt5 we have not succeeded any build since yesterday.

As of today we are now getting errors in db compilation
On both locally and on Jenkins we keep getting a db compile error as of tod=
ay.
./db_cxx.h:59:22: fatal error: iostream.h: No such file or directory
 #include <iostream.h>
                      ^
---------------------------------------------------------------------
For last week we've been battling random gcc_runtime configure errors only =
on Jenkins machines. =20

This is the configure error.
checking dynamic linker characteristics... configure: error: Link tests are=
 not allowed after GCC_NO_EXECUTABLES.

---------------------------------------------------------------------------=
----------------------------
As of yesterday morning, we are also having many unpack errors on many file=
s that are disappearing from our downloads before unpack.  The fetch is wor=
king but then when it unpacks the package has disappeared from downloads.  =
I've seen this on multiple components (libx11, xproto, inputproto, util-lin=
ux).  Seems to happen more often with rm_work set but I've seen it without =
it set.

I'd appreciate any ideas.  The only one I can reproduce locally is the db e=
rror above but the others seem to only happen on Jenkins machines.  We have=
 4 different Jenkins machines all of which can't build on the master branch=
 but have built fine for months on daisy and dora branches. =20

By the way you can't set your gcc to 4.8.2 - liburcu breaks if you try to u=
se the older compiler.  So not sure if any of the gcc runtime issues are re=
lated to the new gcc version.   Not sure if we should keep gcc 4.8.2 in diz=
zy if it can't be used.

Thanks for any ideas.  I've tried everything I can think of.

Lauren Post
i.MX Freescale=20


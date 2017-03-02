Return-Path: <bevenson@melinkcorp.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0131.outbound.protection.outlook.com [104.47.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 58D84775CC
	for <Openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 19:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=Melink.onmicrosoft.com; s=selector1-melinkcorp-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=6F3o5fOjFjBS6ZkvcAy446Zu68Y8Rv2mUeiqX7nuFoM=;
	b=PgvGTw08AxVp0GXJ2TJSpPzhlFSc7EqKf0F/W6IppmnHIB0jPLvXYhAtuMC3UZrWp6KfJGKPLlvx+BPA5G4BNARo7tjNuqossnXdKQcj3Z6BdCoXyy1e72pWO2aX4R44LTzUSz5XtbcjeFsLp/T1gDItSl/0vKOrIcltvMIh9KA=
Received: from DM5PR05MB2954.namprd05.prod.outlook.com (10.168.176.142) by
	DM5PR05MB2955.namprd05.prod.outlook.com (10.168.176.143) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.947.2; Thu, 2 Mar 2017 19:51:48 +0000
Received: from DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) by
	DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) with mapi id
	15.01.0947.012; Thu, 2 Mar 2017 19:51:48 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Bryan Evenson <bevenson@melinkcorp.com>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: util-linux: Multiple alternatives issues preventing clean
	upgrades
Thread-Index: AdKTjPuMek9rcNcYS0K7WVvSiIPJjw==
Date: Thu, 2 Mar 2017 19:51:47 +0000
Message-ID: <DM5PR05MB2954172F214E73E5C531A936BB280@DM5PR05MB2954.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: melinkcorp.com; dkim=none (message not signed)
	header.d=none;melinkcorp.com; dmarc=none action=none
	header.from=melinkcorp.com;
x-originating-ip: [98.100.91.242]
x-microsoft-exchange-diagnostics: 1; DM5PR05MB2955;
	7:YoJgrUYUdHk7YdqtQ2C+D5zyWs6Y1YjsBZNanQqxk1i968O4/gYC69TeQ9K9CTeuB9CLBzZLczTwzJtdlTh2qytmQK7N57KGL9AO3s2qj4ozWnrRtjlCY7To4fhOHjyp7fyYPXnoqCF6kI761vpRcwXa0rWZaIKxEyZ9GWzxCFwvuj8aytV+nmn4fCd6oV3hc8Rec7C6+lWVTF4JN8BBP8DppKl14Sglrsw2JJmVy/i0OifYBPRzvMn03xUjgi/zBquJeuzzzJ1vO7oEvos7SWtEJMDHY1PJTWYi5WWgSbHgT4pfGgdxAoCxfUuO0yrD0ZWWPZ8ciCpaHUK8EVApBA==
x-forefront-antispam-report: SFV:SKI; SCL:-1SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39450400003)(13464003)(377454003)(38730400002)(74316002)(6246003)(53546006)(7736002)(305945005)(53936002)(966004)(122556002)(33656002)(2501003)(450100001)(229853002)(189998001)(6506006)(6306002)(55016002)(25786008)(6436002)(54356999)(50986999)(99286003)(9686003)(92566002)(77096006)(102836003)(3846002)(6116002)(8676002)(66066001)(8936002)(81166006)(2906002)(2900100001)(86362001)(5660300001)(3280700002)(3660700001)(7696004)(1720100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR05MB2955;
	H:DM5PR05MB2954.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-ms-office365-filtering-correlation-id: 78631395-c39b-4783-0d8f-08d461a5900a
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:DM5PR05MB2955;
x-microsoft-antispam-prvs: <DM5PR05MB2955B34E74B9DCF5B1E44A9EBB280@DM5PR05MB2955.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6041248)(20161123558025)(20161123555025)(20161123560025)(20161123562025)(20161123564025)(6072148);
	SRVR:DM5PR05MB2955; BCL:0; PCL:0; RULEID:; SRVR:DM5PR05MB2955; 
x-forefront-prvs: 023495660C
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2017 19:51:47.8236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR05MB2955
Subject: Re: util-linux: Multiple alternatives issues preventing clean upgrades
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
X-List-Received-Date: Thu, 02 Mar 2017 19:51:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I've made some progress but I'm afraid I still have a few more questions.

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Bryan Evenson
> Sent: Wednesday, March 01, 2017 9:22 AM
> To: Openembedded-core@lists.openembedded.org
> Subject: [OE-core] util-linux: Multiple alternatives issues preventing cl=
ean
> upgrades
>=20
> I am using opkg for package management, and before moving to a more
> recent branch (currently on dizzy) I'm doing some firmware upgrade tests =
to
> make sure I have a clean upgrade process.  For my testing I flash an imag=
e
> using our current production image and then do firmware upgrade from the
> command line by doing "opkg update; opkg upgrade --download-only; opkg
> upgrade" and checking what errors pop up.  I am currently testing upgradi=
ng
> to the jethro branch and I am seeing some errors in regards to util-linux=
.  I
> see the following errors during upgrade:
>=20
> * check_data_file_clashes: Package util-linux-sulogin wants to install fi=
le
> /sbin/sulogin.util-linux
>         But that file is already provided by package  * util-linux
> update-alternatives: Error: cannot register alternative readprofile to
> /usr/sbin/readprofile since it is already registered to /sbin/readprofile
> * pkg_run_script: package "util-linux-readprofile" postinst script return=
ed
> status 1.
> * opkg_configure: util-linux-readprofile.postinst returned 1.
>=20
> The first error I traced down to being related to this commit:
> http://git.openembedded.org/openembedded-core/commit/meta/recipes-
> core/util-linux?h=3Djethro&id=3D4bde182ed236243547929dd98763f1c09eddd097
>=20

I added the following line to util-linux.inc:
RREPLACES_util-linux-sulogin =3D "util-linux"

After adding this line, then opkg acknowledged that util-linux-sulogin repl=
aced the files that were previously owned by util-linux and the error went =
away.  Looking at the commit log on master in the util-linux directory, it =
looks like util-linux is being split up into even more packages.  Should th=
e proper RREPLACES be added for each package that was split out?

> The second error I traced down to being related to this commit:
> http://git.openembedded.org/openembedded-core/commit/meta/recipes-
> core/util-linux?h=3Djethro&id=3D43424eb3c8bf03a2f9ec331b78dd4040dd39eacd
>=20

From the command line on the target I entered the line:
update-alternatives --remove readprofile /sbin/readprofile

After that I issued "opkg upgrade" again and the postinstall script for uti=
l-linux-readprofile finished without issue.  I'm a little baffled why the o=
ld link wasn't removed.  Is there something that needs to be added to the p=
ostinstall script to remove the old link prior to adding the new one?

Thanks,
Bryan

> I know this is all related to alternatives, but that's about as far as my
> knowledge extends in this area.  Yes, everything is running okay but I'd =
like to
> clean up problems like this if possible.  Does anyone have any suggestion=
s on
> what would need to change in the util-linux recipe to clean up these erro=
rs?
>=20
> Thanks,
> Bryan
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


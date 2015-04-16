Return-Path: <bevenson@melinkcorp.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0122.outbound.protection.outlook.com [207.46.100.122])
	by mail.openembedded.org (Postfix) with ESMTP id 36AFD65CAC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 13:53:15 +0000 (UTC)
Received: from BN3PR0501MB1089.namprd05.prod.outlook.com (25.160.113.11) by
	BN3PR0501MB1411.namprd05.prod.outlook.com (25.160.117.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.136.25; Thu, 16 Apr 2015 13:53:15 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com (25.160.113.12) by
	BN3PR0501MB1089.namprd05.prod.outlook.com (25.160.113.11) with
	Microsoft SMTP
	Server (TLS) id 15.1.136.25; Thu, 16 Apr 2015 13:53:14 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) by
	BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) with
	mapi id 15.01.0136.026; Thu, 16 Apr 2015 13:53:14 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Bryan Evenson <bevenson@melinkcorp.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: sysvinit upgrade woes
Thread-Index: AdB2xX/0SWNQQOrTTmqRDk7i+oHZ/QBheQog
Date: Thu, 16 Apr 2015 13:53:14 +0000
Message-ID: <BN3PR0501MB1090F9B31066CC3E7AB72B5EBBE40@BN3PR0501MB1090.namprd05.prod.outlook.com>
References: <BN3PR0501MB10906F787AE8EB17CD7558C6BBE60@BN3PR0501MB1090.namprd05.prod.outlook.com>
In-Reply-To: <BN3PR0501MB10906F787AE8EB17CD7558C6BBE60@BN3PR0501MB1090.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 007371890099E4007372D6
authentication-results: melinkcorp.com; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0501MB1089;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0501MB1411; 
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(13464003)(51704005)(164054003)(54356999)(76176999)(50986999)(86362001)(19580395003)(66066001)(46102003)(107886001)(19580405001)(76576001)(77156002)(62966003)(450100001)(15975445007)(1720100001)(74316001)(40100003)(2501003)(2656002)(2950100001)(4001410100001)(2900100001)(87936001)(102836002)(99286002)(33656002)(92566002)(122556002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0501MB1089;
	H:BN3PR0501MB1090.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-microsoft-antispam-prvs: <BN3PR0501MB10894DC1CEAD356F66F01588BBE40@BN3PR0501MB1089.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:BN3PR0501MB1089; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0501MB1089; 
x-forefront-prvs: 0548586081
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2015 13:53:14.2741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0501MB1089
X-OriginatorOrg: melinkcorp.com
Subject: Re: sysvinit upgrade woes
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
X-List-Received-Date: Thu, 16 Apr 2015 13:53:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

All,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Bryan Evenson
> Sent: Tuesday, April 14, 2015 11:26 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] sysvinit upgrade woes
>=20
> I am using opkg for package management and sysvinit for init.  I am testi=
ng a
> large jump on an upgrade and I have been having a few issues.  One issue =
I
> have traced to sysvinit's upgrade, but I'm unsure how to remedy the
> solution.
>=20
> At some point during the upgrade process, opkg records what the new
> version is of all the packages getting installed.  However, when I upgrad=
e
> sysvinit causes sysvinit to restart before opkg has recorded which packag=
es
> were just installed.  So opkg thinks that it didn't upgrade anything even
> though all packages were upgraded.  I verified that if I call "opkg upgra=
de" for
> all packages that require upgrade except for sysvinit that opkg correctly
> records which packages were upgraded.  However, the end user doesn't
> have that kind of control, so upgrading in this manner is not an option.
>=20
> Has anyone else seen a similar issue?  Any ideas on how to hold off sysvi=
nit
> from restarting until after opkg has finished recording its information?
>=20

I've found the problem but don't yet have a good solution.  At the end of t=
he sysvinit-inittab pkg_postinst script is the line:

	kill -HUP 1

This kills init before opkg has finished doing its job.  On my system, I've=
 added a .bbappend with a pk_postinst script as follows for items that requ=
ire a reboot after installation:

    touch /var/run/reboot-required
    echo "${PN}" >>/var/run/reboot-required.pkgs

After my system performs firmware upgrade, it checks if /var/run/reboot-req=
uired exists and then reboots the system.  So on my system, I changed the p=
kg_postinst script for sysvinit-inittab to replace the "kill -HUP 1" with t=
he reboot required notations.

Is there some suitable solution that would be reasonable to change in the s=
ysvinit-inittab recipe that would work for other people?

Regards,
Bryan

> Thanks,
> Bryan
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


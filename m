Return-Path: <bevenson@melinkcorp.com>
X-Greylist: delayed 85948 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 31 Mar 2015 13:02:27 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bn0107.outbound.protection.outlook.com [157.56.110.107])
	by mail.openembedded.org (Postfix) with ESMTP id 5F67873CBC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 13:02:27 +0000 (UTC)
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com (25.160.113.12) by
	BN3PR0501MB1092.namprd05.prod.outlook.com (25.160.113.139) with
	Microsoft
	SMTP Server (TLS) id 15.1.118.21; Tue, 31 Mar 2015 12:28:27 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) by
	BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) with
	mapi id 15.01.0125.002; Tue, 31 Mar 2015 12:28:27 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Mark Hatle
	<mark.hatle@windriver.com>
Thread-Topic: [OE-core] Verification on how TARGET_CFLAGS is set
Thread-Index: AdBq6sgwEqQG9EV+T/2vz5aas/+PuAAPTRwAAABav4AAAknEAAAdwlRw
Date: Tue, 31 Mar 2015 12:28:27 +0000
Message-ID: <BN3PR0501MB109038A56A57CC04DE09E55CBBF40@BN3PR0501MB1090.namprd05.prod.outlook.com>
References: <BN3PR0501MB1090B5CDC1B3FF89CCC4D286BBF50@BN3PR0501MB1090.namprd05.prod.outlook.com>
	<1427747268.14020.326.camel@linuxfoundation.org>
	<5519B425.1040906@windriver.com>
	<1427751808.14020.327.camel@linuxfoundation.org>
In-Reply-To: <1427751808.14020.327.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [98.100.91.242]
authentication-results: linuxfoundation.org; dkim=none (message not signed)
	header.d=none;
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0501MB1092;
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(51704005)(479174004)(13464003)(24454002)(377454003)(52314003)(377424004)(66066001)(2656002)(87936001)(19580405001)(2950100001)(76576001)(2900100001)(54356999)(50986999)(76176999)(40100003)(93886004)(102836002)(46102003)(122556002)(74316001)(99286002)(1720100001)(77156002)(19580395003)(92566002)(15975445007)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0501MB1092;
	H:BN3PR0501MB1090.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-microsoft-antispam-prvs: <BN3PR0501MB1092CC13361856B8D624A3C6BBF40@BN3PR0501MB1092.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:BN3PR0501MB1092; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0501MB1092; 
x-forefront-prvs: 0532BF6DC2
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2015 12:28:27.3943 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0501MB1092
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Verification on how TARGET_CFLAGS is set
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
X-List-Received-Date: Tue, 31 Mar 2015 13:02:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard and Mark,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Richard Purdie
> Sent: Monday, March 30, 2015 5:43 PM
> To: Mark Hatle
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] Verification on how TARGET_CFLAGS is set
>=20
> On Mon, 2015-03-30 at 15:37 -0500, Mark Hatle wrote:
> > On 3/30/15 3:27 PM, Richard Purdie wrote:
> > > On Mon, 2015-03-30 at 13:09 +0000, Bryan Evenson wrote:
> > >> I am about to upgrade to the dizzy branch.  I have a built a bootabl=
e
> > >> image on my test build machine, and now I'm going to be applying
> > >> changes to the system I use for building production images.  I'm
> > >> planning on deleting my tmp directory to force a re-build of
> > >> everything.  Since I'm rebuilding everything anyway, I'm taking a
> > >> deeper look at the CFLAGS related settings and I'm getting a little
> > >> lost in the logic.  I'd like to verify these settings before I start
> > >> rebuilding everything.
> > >>
> > >> If I'm following the default logic correctly in bitbake.conf, by
> > >> default TARGET_CFLAGS will be set to "-O2 -pipe -g
> > >> -feliminate-unused-debug-types".  I want the default TARGET_CFLAGS
> for
> > >> my production image to be "-O2 -pipe".  What's the suggested variabl=
e
> > >> to change, and where, to get this final value?  Do I set TARGET_CFLA=
GS
> > >> directly, or do I set SELECTED_OPTIMIZATIONS or even
> > >> FULL_OPTIMIZATIONS?  Do I set it in local.conf or should I be settin=
g
> > >> it somewhere else?
> > >
> > > If I remember rightly, you need the -g option there to generate the -=
dbg
> > > packages correctly. The target system binaries won't change since we
> > > separate out the debug data into separate files as part of the packag=
ing
> > > process.
> > >
> > > You therefore can gain some build performance from turning that off b=
ut
> > > your runtime won't alter much (other than the debuglink ID which is a
> > > few bytes).
> >
> > I strongly caution people against removing '-g' from their production b=
uilds.
> > If you do, you will no longer have any way to do any type of production=
/field
> > debug.  As Richard indicated the -g will cause the symbols and debug in=
formation
> > to get separated into special -dbg packages that you generally don't di=
stribute
> > on a production device -- but those same -dbg package (preserved) can b=
e later
> > used for debugging of production devices.

In my situation this is kind of a moot point, as I've never been able to su=
ccessfully get gdb to work.  It has been a while since I've tried, so I gue=
ss I could give it another go.

> >
> > This is why the default is what it is.
> >
> > The difference in executable size between -g (split debug) and w/o -g, =
is
> > usually around 15 - 30 bytes.  Roughly the length of the path to the
> executable
> > and/or library plus ".debug/" (7 characters)
>=20
> Are you sure its even that? I thought it was literally just the debug ID
> code and the paths to debug were assumed by the debug tools which would
> search several locations for a matching ID?

Is that all that it is?  I was under the impression that adding -g adds the=
 debug symbols to the executable, not just the hooks to include the debug s=
ymbols.  If the -g flag really does just add a few bytes to each executable=
, then I won't worry about it.

Regards,
Bryan

>=20
> Cheers,
>=20
> Richard
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


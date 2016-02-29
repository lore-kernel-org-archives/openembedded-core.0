Return-Path: <prvs=8609f9632=Mikko.Rapeli@bmw.de>
Received: from esa10.bmw.c3s2.iphmx.com (esa10.bmw.c3s2.iphmx.com
	[68.232.139.98])
	by mail.openembedded.org (Postfix) with ESMTP id 80591731A3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 14:19:57 +0000 (UTC)
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
	esa10.bmw.c3s2.iphmx.com with ESMTP/TLS; 29 Feb 2016 15:19:57 +0100
Received: from unknown (HELO esabb5.muc) ([160.50.100.47]) by esagw6.muc with
	ESMTP/TLS; 29 Feb 2016 15:19:56 +0100
Received: from smuch57a.muc (HELO SMUCH57A.europe.bmw.corp) ([160.46.137.109])
	by esabb5.muc with ESMTP/TLS; 29 Feb 2016 15:19:35 +0100
Received: from SMUCM65A.europe.bmw.corp ([160.46.134.155]) by
	SMUCH57A.europe.bmw.corp ([160.46.137.109]) with mapi id 14.03.0248.002;
	Mon, 29 Feb 2016 15:19:35 +0100
From: <Mikko.Rapeli@bmw.de>
To: <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 0/3] Add initial capability to check CVEs for
	recipes
Thread-Index: AQHRb8YPTPKRB7zS1kqsvPG9SjQg2J88n/SAgAAQYICAAAu0AIABLzSAgAUcSACAAACZAA==
Date: Mon, 29 Feb 2016 14:19:34 +0000
Message-ID: <20160229141934.GQ6210@loska>
References: <cover.1456327117.git.mariano.lopez@linux.intel.com>
	<20160225121421.GB6210@loska> <20160225122912.GC6210@loska>
	<20160225132748.GD6210@loska> <20160225140942.GE6210@loska>
	<20160226081455.GH6210@loska>
	<CAJTo0LYAD76f7qOjAhyZF3NAgBo79ewUGKOT=8REWrnSK+cw7Q@mail.gmail.com>
In-Reply-To: <CAJTo0LYAD76f7qOjAhyZF3NAgBo79ewUGKOT=8REWrnSK+cw7Q@mail.gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.44.99]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Add initial capability to check CVEs for recipes
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
X-List-Received-Date: Mon, 29 Feb 2016 14:19:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <26FD0C5965D30B4EB54B8378D6686FEB@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 29, 2016 at 02:17:26PM +0000, Burton, Ross wrote:
> On 26 February 2016 at 08:14, <Mikko.Rapeli@bmw.de> wrote:
>=20
> > 17:45:37  *** 0013:        with open(patch_file, "r") as f:
> > 17:45:37      0014:            patch_text =3D f.read()
> > 17:45:37      0015:
> > 17:45:37      0016:        # Search for the "CVE: " line
> > 17:45:37      0017:        match =3D cve_match.search(patch_text)
> > 17:45:37 Exception: IOError: [Errno 2] No such file or directory:
> > '/home/builder/src/base/build/tmp/work/corei7-64-linux/mailx/12.5-r2/he=
irloom-mailx_12.5-1.diff'
> > 17:45:37
> > 17:45:37 ERROR: Function failed: do_cve_check
> >
> > So could this be caused by cve-check changes or is this just a side eff=
ect
> > of some other recipe problems?
> >
>=20
> Do you have rm_work enabled?

Yes.

-Mikko=


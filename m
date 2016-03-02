Return-Path: <prvs=8628ffc52=Mikko.Rapeli@bmw.de>
Received: from esa10.bmw.c3s2.iphmx.com (esa10.bmw.c3s2.iphmx.com
	[68.232.139.98])
	by mail.openembedded.org (Postfix) with ESMTP id 016FA77086
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 06:32:54 +0000 (UTC)
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
	esa10.bmw.c3s2.iphmx.com with ESMTP/TLS; 02 Mar 2016 07:32:55 +0100
Received: from unknown (HELO esabb3.muc) ([160.50.100.30]) by esagw4.muc with
	ESMTP/TLS; 02 Mar 2016 07:32:55 +0100
Received: from smuch53a.muc (HELO SMUCH53A.europe.bmw.corp) ([160.46.137.113])
	by esabb3.muc with ESMTP/TLS; 02 Mar 2016 07:32:55 +0100
Received: from SMUCM65A.europe.bmw.corp ([160.46.134.155]) by
	SMUCH53A.europe.bmw.corp ([160.46.137.113]) with mapi id 14.03.0248.002;
	Wed, 2 Mar 2016 07:32:53 +0100
From: <Mikko.Rapeli@bmw.de>
To: <mariano.lopez@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 0/3] Add initial capability to check CVEs for
	recipes
Thread-Index: AQHRb8YPTPKRB7zS1kqsvPG9SjQg2J88n/SAgAAQYICAAAu0AIABLzSAgAUcSACAAACZAIABof2AgAEARwA=
Date: Wed, 2 Mar 2016 06:32:52 +0000
Message-ID: <20160302063252.GB18519@loska>
References: <cover.1456327117.git.mariano.lopez@linux.intel.com>
	<20160225121421.GB6210@loska> <20160225122912.GC6210@loska>
	<20160225132748.GD6210@loska> <20160225140942.GE6210@loska>
	<20160226081455.GH6210@loska>
	<CAJTo0LYAD76f7qOjAhyZF3NAgBo79ewUGKOT=8REWrnSK+cw7Q@mail.gmail.com>
	<20160229141934.GQ6210@loska> <56D5B219.8050204@linux.intel.com>
In-Reply-To: <56D5B219.8050204@linux.intel.com>
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
X-List-Received-Date: Wed, 02 Mar 2016 06:32:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1B6D833172D81045809784AB23AE4938@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2016 at 09:15:37AM -0600, Mariano Lopez wrote:
>=20
>=20
> On 02/29/2016 08:19 AM, Mikko.Rapeli@bmw.de wrote:
> >On Mon, Feb 29, 2016 at 02:17:26PM +0000, Burton, Ross wrote:
> >>On 26 February 2016 at 08:14, <Mikko.Rapeli@bmw.de> wrote:
> >>
> >>>17:45:37  *** 0013:        with open(patch_file, "r") as f:
> >>>17:45:37      0014:            patch_text =3D f.read()
> >>>17:45:37      0015:
> >>>17:45:37      0016:        # Search for the "CVE: " line
> >>>17:45:37      0017:        match =3D cve_match.search(patch_text)
> >>>17:45:37 Exception: IOError: [Errno 2] No such file or directory:
> >>>'/home/builder/src/base/build/tmp/work/corei7-64-linux/mailx/12.5-r2/h=
eirloom-mailx_12.5-1.diff'
> >>>17:45:37
> >>>17:45:37 ERROR: Function failed: do_cve_check
> >>>
> >>>So could this be caused by cve-check changes or is this just a side ef=
fect
> >>>of some other recipe problems?
> >>>
> >>Do you have rm_work enabled?
> >Yes.
> >
> >-Mikko
>=20
> I think I have found the problem, when you do devshell it will execute
> do_unpack and the cve_check task must run after that for some recipes. Tr=
y
> this:
>=20
> addtask cve_check after do_unpack before do_build

Thanks, with this change the scan builds pass on dizzy.

-Mikko=


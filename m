Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id C559378B6F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 17:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 38F0F18430;
	Mon, 11 Jun 2018 19:44:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id It-5iUWLTE0o; Mon, 11 Jun 2018 19:44:37 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 598251841E;
	Mon, 11 Jun 2018 19:44:37 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 451BD1E08D;
	Mon, 11 Jun 2018 19:44:37 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 396A91E08B;
	Mon, 11 Jun 2018 19:44:37 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon, 11 Jun 2018 19:44:37 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 2D80BDD9;
	Mon, 11 Jun 2018 19:44:37 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 11 Jun 2018 19:44:36 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 11 Jun 2018 19:44:36 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Mon, 11 Jun 2018 19:44:36 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [v5][PATCH] busybox: update to 1.28.4
Thread-Index: AQHUATtLE+0LS6zqYkaP/l2c5Lv2F6RavX3wgABDX4CAAARQgIAAS3mg
Date: Mon, 11 Jun 2018 17:44:36 +0000
Message-ID: <2cef220c1c5e4593ade1dc75d82c97bd@XBOX02.axis.com>
References: <1528690704-338-1-git-send-email-akuster808@gmail.com>
	<9739bd9dd81149458033ba72cb7ce411@XBOX02.axis.com>
	<bb38520f-85d7-9e63-83a6-76477073285a@gmail.com>
	<6D4566C9E07A8D4DAB6F935696920A8424601721@ATVIES991UAMSX.ww300.siemens.net>
In-Reply-To: <6D4566C9E07A8D4DAB6F935696920A8424601721@ATVIES991UAMSX.ww300.siemens.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [v5][PATCH] busybox: update to 1.28.4
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
X-List-Received-Date: Mon, 11 Jun 2018 17:44:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Marko, Peter
> Sent: den 11 juni 2018 16:58
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [v5][PATCH] busybox: update to 1.28.4
>=20
> On 06/11/2018 04:43 PM, akuster808 wrote:
> > On 06/11/2018 01:45 AM, Peter Kjellerstedt wrote:
> >> -----Original Message-----
> >> From: openembedded-core-bounces@lists.openembedded.org
> >> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> >> Of Armin Kuster
> >> Sent: den 11 juni 2018 06:18
> >> To: akuster808@gmail.com; openembedded-core@lists.openembedded.org
> >> Subject: [OE-core] [v5][PATCH] busybox: update to 1.28.4
> >>
> >> refactored busybox-udhcpc-no_deconfig.patch for this update
> >> updated 1.28.3
> >>
> >> [v1]
> >> removed patches included in update:
> >> busybox/CVE-2011-5325.patch
> >> busybox/CVE-2017-15873.patch
> >> busybox/busybox-CVE-2017-16544.patch
> >>
> >> [v2]
> >> Add back busybox-udhcpc-no_deconfig.patch ti SRC_URI, missed earlier
> >>
> >> [v3]
> >> Update defconfig based on feedback
> >>
> >> [v4]
> >> Decided to update again.
> >> 1.28.4
> >>
> >> [v5]
> >> rebased change do to changes in master
> >> squashed .cfg into defconfig and remove files
> >> Delete busybox-fix-lzma-segfaults.patch which is included in updated.
> >>
> >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >=20
> > The commit message should be rewritten to document the final commit,
> > without any patch series references. They belong after --- below.
> >
> > Done that before and folks complained so I started included with
> > files got removed. May I suggest updating the process so we can be
> > consistent.
> >
> > - armin

I am not saying you should leave out information from the commit=20
message about what the patch changes, it should just be written=20
(and rewritten for each patch version if necessary) so that it=20
documents the last version of the patch. Any information about=20
what changed between patch versions should go below the --- (or=20
in the cover letter) as that is only relevant for the patch=20
review process. Once the commit is integrated into the target=20
branch, the patch versions no longer exist and having references=20
to them in the commit message then only leads to confusion.

> Isn't cover letter the place to put these "history" comments?
> Commit message should contain just normal change description.
>=20
> Peter

If there is a cover letter, then that is probably preferred,=20
otherwise after the --- in the respective patches.

//Peter



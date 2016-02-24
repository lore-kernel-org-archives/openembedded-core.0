Return-Path: <radzy@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 90D616FF4E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 22:59:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1OMxDPi020307
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Feb 2016 14:59:13 -0800 (PST)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.108]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0248.002;
	Wed, 24 Feb 2016 14:59:13 -0800
From: "Radzykewycz, T (Radzy)" <radzy@windriver.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] what is the priority of wildcarded .bbappend files?
Thread-Index: AQHRb0No7IllwdGp9kSZ1B/C/B6NAJ88MGUAgAANEwCAABY3gP//exJy
Date: Wed, 24 Feb 2016 22:59:13 +0000
Message-ID: <33006C99F5A5194A9B7A7715DFA3E383EB81CFA2@ALA-MBB.corp.ad.wrs.com>
References: <20160224152850.164043qmdvkuzbeo@astoria.ccjclearline.com>
	<CABcZAN=RefHwBnF+8oEu6uDmxe-LCMoVs94XK=MOEsr7VmJ6xw@mail.gmail.com>
	<20160224163304.55482wad36phjtmo@astoria.ccjclearline.com>,
	<1629258.jkM8Gdqopn@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <1629258.jkM8Gdqopn@peggleto-mobl.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.216.89]
MIME-Version: 1.0
Cc: Christopher Larson <clarson@kergoth.com>
Subject: Re: what is the priority of wildcarded .bbappend files?
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
X-List-Received-Date: Wed, 24 Feb 2016 22:59:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


________________________________________
On Wednesday, February 24, 2016 2:52 PM, Paul Eggleton said:
> On Wed, 24 Feb 2016 16:33:04 Robert P. J. Day wrote:
> > Quoting Christopher Larson <clarson@kergoth.com>:
> > > All appends that apply to a given recipe will be applied to that reci=
pe.
> > > Order is determined solely by layer priority.
> >
> >    wait ... so *all* bbappend files that match a recipe will be applied=
?
> > i'm embarrassed that i didn't know that, is that mentioned in the
> > documentation somewhere?
>=20
> Surprisingly we don't currently state this explicitly, though it's implie=
d. We
> should work this into the relevant part of the bitbake manual and the "Us=
ing
> .bbappend Files" section of the dev manual. Scott could you add that to y=
our
> todo list?

If there is any way to determine the order that the bbappend files
are included, that would be helpful.  As well as determining what
order patches will be applied (which is, I suspect, determined
in part by what order the bbappend files are included)..

Enjoy!

				-- radzy


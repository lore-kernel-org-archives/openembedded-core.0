Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B178E70703
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 15:04:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 Oct 2014 08:03:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,692,1406617200"; d="scan'208";a="603409029"
Received: from ncmcquil-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 10 Oct 2014 08:03:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Fri, 10 Oct 2014 16:03:25 +0100
Message-ID: <1796874.7cz1rBMpRa@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.1 (Linux/3.16.3-200.fc20.x86_64; KDE/4.14.1; x86_64; ; )
In-Reply-To: <54377059.10606@topic.nl>
References: <54354CBD.6040506@topic.nl>
	<CAP9ODKpERB+agUBv3-BgPM3JRBQiZ-QKVhONvuSkRFUWi_ZkqQ@mail.gmail.com>
	<54377059.10606@topic.nl>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: Request to move "gitpkgv.bbclass" from meta-oe to oe-core
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
X-List-Received-Date: Fri, 10 Oct 2014 15:04:25 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Mike,

On Friday 10 October 2014 07:36:25 Mike Looijmans wrote:
> On 10/10/2014 12:15 AM, Otavio Salvador wrote:
> > On Thu, Oct 9, 2014 at 4:56 PM, Richard Purdie
> >=20
> > <richard.purdie@linuxfoundation.org> wrote:
> >> On Thu, 2014-10-09 at 10:16 +0200, Mike Looijmans wrote:
> >>> =EF=BB=BFIn partial reply to my own question, this has been discu=
ssed 2 years
> >>> ago, but apparently nothing ever came out of it.
> >>>=20
> >>> http://lists.openembedded.org/pipermail/openembedded-core/2012-Fe=
bruary/
> >>> 056050.html
> >>>=20
> >>> So once more the request to be able to get sane version strings f=
or git
> >>> repos. Can we please just move gitpkgv. That's like five minutes =
work,
> >>> and if anyone (e.g. me) feels like building something better, he =
or she
> >>> is free do submit that and get rid of the gitpkgv class once it's=

> >>> obsolete.
> >>=20
> >> I do feel quite strongly that this is something which should get
> >> improved in the fetcher itself. That is why I've pushed back on th=
e
> >> patch since if I take it into OE-Core, there is even less incentiv=
e to
> >> fix the real problem...
> >=20
> > Mike I am also an user of gitpkgv but I must to agree with Richard
> > here. Moving this to OE-Core will just make it worse. It is way bet=
ter
> > to prepare a patch and add support for it on the fetcher code of
> > BitBake.
>=20
> Give me some pointers on what you're talking about here, and I'll be =
happy
> to try and implement it. Currently I have no idea as to what is "wron=
g"
> with the gitpkgv approach, and I also have no clue as to what it is y=
ou
> want to have implemented in the git fetcher.

The code would go into the fetcher itself i.e. lib/bb/fetch2/git.py and=
=20
lib/bb/fetch2/__init__.py.=20

I'm not sure whether it would be a case of setting a variable in order =
to have=20
the value of SRCPV within OE (which calls bb.fetch2.get_srcrev() ) retu=
rn the=20
"git describe" style version instead of the current one, or whether we =
would=20
preserve the separate GITPKGVTAG variable for that purpose. (The GITPKG=
V case=20
is already handled by the current behaviour of SRCPV, right?)

FWIW there is an open bug covering this issue:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2872

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


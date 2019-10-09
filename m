Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 12B7D7F47A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2019 02:04:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Oct 2019 19:04:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,273,1566889200"; d="scan'208";a="205604338"
Received: from salujahi-mobl.gar.corp.intel.com (HELO linux.fritz.box)
	([10.249.74.106])
	by orsmga002.jf.intel.com with ESMTP; 08 Oct 2019 19:04:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Wed, 09 Oct 2019 15:02:37 +1300
Message-ID: <2401250.Mp7qUkyezG@linux.fritz.box>
Organization: Intel Corporation
In-Reply-To: <CAMKF1sp+NJk26a5Rzav3ZxCfGSsZt-6SuiBPt+VYjMymkJtdmg@mail.gmail.com>
References: <1570473350-6427-1-git-send-email-chandana.kalluri@xilinx.com>
	<e18958c001784a0ca0d5c2ff73fa2e42@XBOX03.axis.com>
	<CAMKF1sp+NJk26a5Rzav3ZxCfGSsZt-6SuiBPt+VYjMymkJtdmg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [master][PATCH] devtool: Add --remove-work option for devtool reset command
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
X-List-Received-Date: Wed, 09 Oct 2019 02:04:51 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Wednesday, 9 October 2019 6:39:34 AM NZDT Khem Raj wrote:
> On Tue, Oct 8, 2019 at 10:37 AM Peter Kjellerstedt <
> peter.kjellerstedt@axis.com> wrote:
>=20
> > > -----Original Message-----
> > > From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> > > core-bounces@lists.openembedded.org> On Behalf Of Chandana Kalluri
> > > Sent: den 8 oktober 2019 04:14
> > > To: Paul Eggleton <paul.eggleton@linux.intel.com>
> > > Cc: Patches and discussions about the oe-core layer <openembedded-
> > > core@lists.openembedded.org>
> > > Subject: Re: [OE-core] [OE-Core][master][PATCH] devtool: Add --remove-
> > > work option for devtool reset command
> > >
> > > Hi Paul,
> > >
> > > Any thoughts on implementing this as a separate command  as suggested
> > > by Khem?
> >
> > For what it's worth, I think the original suggested solution with a new
> > option to the existing `devtool reset` and `devtool finish` commands is
> > the better one.
>=20
>=20
> Yeah thinking about it again we already have two commands which would need
> same functionality it=E2=80=99s not good to introduce a third one althoug=
h I think
> the usability of current solution will be a bit nicer if it was independe=
nt
> option

devtool reset does have a -a option:
  --all, -a       Reset all recipes (clear workspace)

It won't delete anything that no longer corresponds to a recipe in the=20
workspace (i.e. previously reset/finished), but is that the issue that peop=
le=20
are trying to solve here?

(I could see the utility of having an option to completely remove the=20
workspace and everything in it - I've had to write a script to do that to s=
ave=20
time for running the devtool oe-selftest tests for example, but I don't kno=
w=20
how common that use case actually is for others.)

Cheers
Paul

=2D-=20

Paul Eggleton
Intel Open Source Technology Centre




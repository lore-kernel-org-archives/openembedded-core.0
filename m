Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 212346B20C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 14:18:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Jul 2013 07:18:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,778,1367996400"; d="scan'208";a="378912133"
Received: from unknown (HELO helios.localnet) ([10.252.122.217])
	by orsmga002.jf.intel.com with ESMTP; 30 Jul 2013 07:18:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 30 Jul 2013 15:18:17 +0100
Message-ID: <10500377.RxauFUiAWr@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAP9ODKrysra+zBOTmpYiMMoaoM2gfXqJDRKE1PNa2YNzWpPRxg@mail.gmail.com>
References: <1374223150-16033-1-git-send-email-andre.draszik@linaro.org>
	<CAP71WjyRkp0TM9vLfX6jFG-E6TWZuUjZeUTSnEefvJA1VOb5yA@mail.gmail.com>
	<CAP9ODKrysra+zBOTmpYiMMoaoM2gfXqJDRKE1PNa2YNzWpPRxg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] directfb: don't patch pkg-config files
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
X-List-Received-Date: Tue, 30 Jul 2013 14:18:19 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Friday 19 July 2013 14:52:00 Otavio Salvador wrote:
> On Fri, Jul 19, 2013 at 11:46 AM, Nicolas Dechesne
>=20
> <nicolas.dechesne@linaro.org> wrote:
> > On Fri, Jul 19, 2013 at 10:39 AM, Andr=E9 Draszik <andre.draszik@li=
naro.org>
> >=20
> > wrote:
> >> We are currently getting build failures of projects that rely on
> >> being able to access DirectFB's internal include directories, as
> >> returned via pkg-config, since the include paths returned by
> >> pkg-config are incomplete.
> >>=20
> >> The reason for that is the patch that is being removed with this
> >> change. It modified the cflags returned by pkg-config in an
> >> incorrect way, causing us to miss important include paths:
> >>=20
> >> For reference, pkg-config output with incorrect patch applied:
> >>   ad@bril0118 #513 ~> pkg-config --cflags directfb-internal
> >>=20
> >> -D_GNU_SOURCE -D_REENTRANT
> >> -I<builddir>/tmp/sysroots/<machine>/usr/include/directfb
> >> -I<builddir>/tmp/sysroots/<machine>/usr/include
> >>=20
> >> Now, with the incorrect patch removed, the output is as expected:
> >>   ad@bril0118 #514 ~> pkg-config --cflags directfb-internal
> >>=20
> >> -D_GNU_SOURCE -D_REENTRANT
> >> -I<builddir>/tmp/sysroots/<machine>/usr/include/directfb-internal
> >> -I<builddir>/tmp/sysroots/<machine>/usr/include/directfb
> >>=20
> >> Overall, the removed patch is not needed - pkg-config does the rig=
ht
> >> thing these days and we can simply use the correctly working upstr=
eam
> >> versions of all DirectFB .pc files.
> >>=20
> >> Signed-off-by: Andr=E9 Draszik <andre.draszik@linaro.org>
> >=20
> > i reviewed and tested this patch against a QT4e image build. it loo=
ks good
> > to me, and that offending patch being removed seems to come from qu=
ite
> > ancient stuff.
> >=20
> > Tested-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> >=20
> > any chance this can get into 'dylan', too?
>=20
> Paul, I think it is your business ;-)

Indeed. I've added it to my paule/dylan-next branch for testing.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0E8D372207
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 15:32:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 18 May 2015 08:32:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,453,1427785200"; d="scan'208";a="731200147"
Received: from jmcmill1-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.0.158])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2015 08:32:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Christopher Larson <clarson@kergoth.com>
Date: Mon, 18 May 2015 16:32:36 +0100
Message-ID: <3693019.ZXHb2MZYRx@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.7-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <CABcZAN=iM=U1F01=Gpt_vCdksSht8LPU5mAYHBvq_qn4pdt8mQ@mail.gmail.com>
References: <55555B65.80600@windriver.com>
	<1616768.92EeT3bkJG@peggleto-mobl.ger.corp.intel.com>
	<CABcZAN=iM=U1F01=Gpt_vCdksSht8LPU5mAYHBvq_qn4pdt8mQ@mail.gmail.com>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Add something like bitbake -cmenuconfig <recipe> ?
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
X-List-Received-Date: Mon, 18 May 2015 15:32:40 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday 18 May 2015 08:15:05 Christopher Larson wrote:
> On Mon, May 18, 2015 at 5:04 AM, Paul Eggleton <
> paul.eggleton@linux.intel.com> wrote:
> > On Monday 18 May 2015 08:52:04 Otavio Salvador wrote:
> > > On Mon, May 18, 2015 at 5:45 AM, Paul Eggleton
> > > <paul.eggleton@linux.intel.com> wrote:
> > > >=20
> > > > On Monday 18 May 2015 09:52:50 Robert Yang wrote:
> > > >> On 05/17/2015 05:34 AM, Richard Purdie wrote:
> > > >> > On Fri, 2015-05-15 at 10:35 +0800, Robert Yang wrote:
> > > >> >> Is is useful/possible if we add something like bitbake <rec=
ipe>
> > > >> >> -cmenuconfig, just like kernel's make menuconfig ?
> > > >> >>=20
> > > >> >> We can use the menuconfig to config the vars such as MACHIN=
E,
> > > >> >> DL_DIR, DISTRO_FEATURES, MACHINE_FEATURES and all the varia=
bles
> > > >> >> which are configurable, I think that this would help the ne=
wbie a
> > > >> >> lot.
> > > >> >>=20
> > > >> >> I think that we can add a menuconfig.bbclass (or other name=
s) to
> > > >> >> do this, and I'd like to work on it.
> > > >> >=20
> > > >> > Why would you want to specify a <recipe> when configuring MA=
CHINE?
> > > >> > I understand why you're thinking this but it isn't well thou=
ght out
> > > >> > and in this form would confuse users more than help them.
> > > >> >=20
> > > >> > I don't think the system will even parse without a valid MAC=
HINE,
> > > >> > let alone execute tasks.
> > > >>=20
> > > >> I meant that we need something to help configure the build eas=
ier, it
> > > >> can generate something like local.conf.append, not configure t=
he
> > > >> recipe.
> > > >>
> > > >> The example "bitbake <recipe> -cmenuconfig" wasn't right enoug=
h, it's
> > > >> just a rough thought, we can use the current default local.con=
f
> > > >> (MACHINE =3D qemux86) to make system parse.
> > > >>=20
> > > >> The problem is that we have many bbclasses in oe-core, a lot o=
f them
> > > >> has specify configurations, and also a lot of vars in the conf=
 file
> > > >> such as bitbake.conf, it's not easy to know how and what to co=
nfig,
> > > >> especially, for newbies. The "bitbake -cmenuconfig" maybe not =
a good
> > > >> idea, I think that we need something to help config the build
> > > >> (generate local.conf) easier, do you have any suggestions, ple=
ase ?
> > > >=20
> > > > This is likely the direction we will be going in with the Toast=
er web
> > > > UI - with a web-based tool we can present a much friendlier int=
erface
> > > > and have the chance to link to other information, for example w=
e can
> > > > link to the appropriate manual section for individual variables=
 (and
> > > > in future error messages, classes, etc.), analyse the output of=
 the
> > > > build, manage multiple sets of configuration, etc. These are th=
ings
> > > > that would be difficult to do practically from the command line=
.
> > >=20
> > > Toaster is nice but we shouldn't stop improving cmdline use as th=
e
> > > first won't work for some use-cases.
> >=20
> > Sure, I'm pointing out that this kind of thing is being worked on i=
n a
> > slightly different context, it's not that nothing is being done in =
this
> > area.
>=20
> A good first step for both may be to add more typing information to t=
he
> metadata, so the UI can present something more intelligent than a bun=
ch of
> text boxes for text input. I expect that would be useful for any
> configuration UI, whether toaster or console.

Indeed, this is something I'd like to see as well. There are already=20=

situations where we need to know the type of various variables (e.g. in=
=20
buildhistory, where we have some of the variable typing hardcoded in th=
e=20
absence of proper definition within the metadata).

> I=E2=80=99d certainly find a curses / menuconfig style interface to b=
e interesting,
> I=E2=80=99m sure there are folks who would find it useful, as long as=
 it=E2=80=99s done
> well.

Sure, I wouldn't object to it either, but the important thing is someon=
e not=20
only needs to create it, but also maintain it in the future. Ideally it=
 would=20
also make use of some underlying definitions / code that would be re-us=
able=20
elsewhere (as you're suggesting).

> My question would be, how does the UI determine what variables to pre=
sent?
> Do we hardcode the list of variables they might want to edit, or prov=
ide
> that information in the metadata in some fashion?

I'd certainly prefer to define as much as possible in the metadata. Tru=
th be=20
told we have defined a bit more than I'd like in the way of OE-specific=
=20
knowledge in Toaster itself; my intent was that we'd come back and clea=
n up a=20
lot of it later where practical, but of course that does mean improving=
 what=20
we expose on the metadata side, and sometimes that's really quite diffi=
cult.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


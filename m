Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DC4477677E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 15:39:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 12 Aug 2015 08:39:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,662,1432623600"; d="scan'208";a="782773156"
Received: from menright-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.21.215])
	by orsmga002.jf.intel.com with ESMTP; 12 Aug 2015 08:39:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Christopher Larson <clarson@kergoth.com>
Date: Wed, 12 Aug 2015 16:39:39 +0100
Message-ID: <2536742.huSDkQAn41@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.3-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CABcZANmTfoP62-VSynUNe5BjhrPpkW-ynA84=4exsi+FiSeHQg@mail.gmail.com>
References: <cover.1438667914.git.Qi.Chen@windriver.com>
	<d788ed7b766bcccc2238278d3eca6a45c8a7f3f2.1438667914.git.Qi.Chen@windriver.com>
	<CABcZANmTfoP62-VSynUNe5BjhrPpkW-ynA84=4exsi+FiSeHQg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/8] Extensible SDK: allow for installation without preparing build system
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
X-List-Received-Date: Wed, 12 Aug 2015 15:39:42 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Chris / Qi,

On Monday 10 August 2015 08:39:01 Christopher Larson wrote:
> On Sun, Aug 9, 2015 at 8:18 PM, Chen Qi <Qi.Chen@windriver.com> wrote=
:
> > When publishing SDK, what we want is basically its metadata and sst=
ate
> > cache objects. We don't want the SDK to be prepared with running bi=
tbake
> > as it takes time which reproduces meaningless output for the publis=
hed
> > SDK.
> >=20
> > So this patch adds an option to allow for SDK to be extracted witho=
ut
> > preparing the build system.
> >=20
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>=20
> I expect the intent behind the preparation was for it to be a build f=
rom
> 100% sstate, but that=E2=80=99s not actually the case on all systems.=
 If that=E2=80=99s the
> case, maybe it should be run with locked sigs and ignore failure, to =
avoid
> doing a real from-scratch build at install time.

I agree this is definitely a problem. In fact, I'm fairly sure the lock=
ed sigs=20
functionality isn't working as it was originally intended to - last I c=
hecked=20
it looked like it was warning and then going ahead and running the task=
; by=20
default it was supposed to just extract the sstate package. I think we'=
ll need=20
to deal with that separately as all this patch does is make the extract=
ion=20
optional (in order to support the publishing script).

As an aside it would be nice if we could hide this -n option in the hel=
p when=20
not building the extensible SDK, but on the other hand refactoring thin=
gs so=20
that would be possible would likely be more effort than it's worth.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


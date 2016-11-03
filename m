Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C1DDF6FEE0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 19:24:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 03 Nov 2016 12:24:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,440,1473145200"; d="scan'208";a="1080232230"
Received: from bkarakos-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.187.65])
	by fmsmga002.fm.intel.com with ESMTP; 03 Nov 2016 12:24:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Fri, 04 Nov 2016 08:24:17 +1300
Message-ID: <6783364.C7oXlEDqjX@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.10-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1478200444.13356.108.camel@intel.com>
References: <6511599a-ddb1-77b0-f42e-69afeaa60cae@linux.intel.com>
	<CABcZAN=6WvHcfyUj5hYmFG6nYoYTkYLrqO6s70v31bYNn85iXg@mail.gmail.com>
	<1478200444.13356.108.camel@intel.com>
MIME-Version: 1.0
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: using devtool for rebasing patches
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
X-List-Received-Date: Thu, 03 Nov 2016 19:24:27 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Thu, 03 Nov 2016 20:14:04 Patrick Ohly wrote:
> On Thu, 2016-11-03 at 10:14 -0700, Christopher Larson wrote:
> > On Thu, Nov 3, 2016 at 9:35 AM, Alexander Kanavin
> >=20
> > <alexander.kanavin@linux.intel.com> wrote:
> >         What you need to do here is to use git am --reject, which
> >         would partially apply the patch, then find all the *.rej fi=
les
> >         and let the user manually edit them in, then complete the
> >         patch application with git am --continue.
> >=20
> > With -3, it=E2=80=99ll merge it into the file with conflict markers=
, which is
> > a lot more pleasant to deal with than .rej files, even without the
> > merge-base being available.
>=20
> That's also what I would prefer.
>=20
> To deal with recipes that have something other than git as source one=

> could create a local git repo with a branch that contains two commits=

> (old version and new version), apply the patches on a second branch o=
n
> top of the old version, then do the normal rebase with conflictstyle =
=3D
> diff3. At least I find that configstyle useful and have it in my
> ~/.gitconfig.

FYI this is what "devtool upgrade" already does. It's just that it's ge=
ared=20
towards upgrading so it expects the version to be changing at the same =
time.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


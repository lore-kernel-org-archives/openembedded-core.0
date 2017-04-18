Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 729C960116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 03:56:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 17 Apr 2017 20:56:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,217,1488873600"; d="scan'208";a="1120577451"
Received: from jessechi-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.175.145])
	by orsmga001.jf.intel.com with ESMTP; 17 Apr 2017 20:56:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Apr 2017 15:56:15 +1200
Message-ID: <67843133.83SE4N7RMn@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <CALbNGRSe-WDecX=v+uj=PCnGe6hTTJ7J2MK4j3=ynF=mkbLZmA@mail.gmail.com>
References: <20170413154453.24792-1-schnitzeltony@googlemail.com>
	<CAJTo0La4Uf5VWhz0Ou7_MH2AYFnBPs2OObt-FAkKJuYhJE49KQ@mail.gmail.com>
	<CALbNGRSe-WDecX=v+uj=PCnGe6hTTJ7J2MK4j3=ynF=mkbLZmA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] bitbake.conf: add unzip to HOSTTOOLS
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
X-List-Received-Date: Tue, 18 Apr 2017 03:56:19 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Friday, 14 April 2017 8:34:27 AM NZST Andreas M=FCller wrote:
> On Thu, Apr 13, 2017 at 5:57 PM, Burton, Ross <ross.burton@intel.com> wro=
te:
> > On 13 April 2017 at 16:53, Andreas M=FCller <schnitzeltony@googlemail.c=
om>
> >=20
> > wrote:
> >> OK - but why do I see this error in do_unpack?
> >=20
> > What recipe and task?
> >=20
> > Ross
>=20
> It is not that simple and it drives me mad (as usual :)
>=20
> Failing recipes were [1-2]. They failed in task (do_)unpack.
>=20
> For unknown reasons case [1] (polyphone) works fine now. OK - I pulled
> oe-core again (40 commits) - this is what I usually do when things
> fail but I cannot see what commit has mended the issue for case [1].

There was this fix which may have resolved the issue (it mentions svn,
but the fix wasn't specific to that):

http://cgit.openembedded.org/openembedded-core/commit/?id=3Db32fbfc85b14059=
f0bfdeeffe2c52f8d3c20f276

Cheers,
Paul

=2D-=20

Paul Eggleton
Intel Open Source Technology Centre


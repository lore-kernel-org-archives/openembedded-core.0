Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 96C046A667
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 15:52:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Jun 2013 08:52:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,838,1363158000"; d="scan'208";a="350955706"
Received: from unknown (HELO helios.localnet) ([10.252.122.12])
	by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2013 08:52:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Steve Sakoman <sakoman@gmail.com>
Date: Mon, 10 Jun 2013 16:52:04 +0100
Message-ID: <2108518.UseegX70O5@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-23-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <CAGDS+nkNmA+BctPBDVoH_dHxKJqJ+ECLy5Rv0Yy=9HgOnd=+zg@mail.gmail.com>
References: <CAGDS+nnQjF9P9s61--FW+_1gs_-qbcugmKt7-xd2i6gwkVFpRw@mail.gmail.com>
	<20130610150755.33deefce@e6520eb>
	<CAGDS+nkNmA+BctPBDVoH_dHxKJqJ+ECLy5Rv0Yy=9HgOnd=+zg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qt4e-demo-image with meta-fsl-arm: successful build?
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
X-List-Received-Date: Mon, 10 Jun 2013 15:52:05 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Monday 10 June 2013 08:43:38 Steve Sakoman wrote:
> On Mon, Jun 10, 2013 at 6:07 AM, Eric B=E9nard <eric@eukrea.com> wrot=
e:
> > Le Mon, 10 Jun 2013 05:58:42 -0700,
> >=20
> > Steve Sakoman <sakoman@gmail.com> a =E9crit :
> >> I haven't begun debugging yet, but I had 2 initial thoughts as to =
why
> >> the X error message:
> >>=20
> >> 1. The qtdemo init seems to be written to support both x and x-fre=
e
> >> setups, so perhaps the init is getting confused
> >> 2. I had built the x11-free version of qt prior to the qte version=
, so
> >> perhaps that causes the issue
> >>=20
> >> I started a clean build just in case #2 is the cause.
> >=20
> > OK #2 is clearly a situation I avoid here as this created me some
> > troubles in the past.
>=20
> And it created issues for me too :-)
>=20
> A clean build of qt4e-demo-image works.  A clean build of a similar
> image based on qt4-x11-free however is broken as described in my
> original post.
>=20
> Clearly one must choose either qt4-x11-free or qt4e, having both in
> the same build setup is broken (perhaps by design)

I can say this is not by design. The two should be able to coexist (whi=
ch is=20
why the library names are different); if they currently cannot we need =
to figure=20
out why that is and get it fixed.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


Return-Path: <jonathan.rajotte-julien@efficios.com>
X-Greylist: delayed 326 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 17 Feb 2020 16:53:44 UTC
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
	by mail.openembedded.org (Postfix) with ESMTP id DF5F061185
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 16:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 57DC2247708;
	Mon, 17 Feb 2020 11:48:19 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id fQGcIUdEvvYZ; Mon, 17 Feb 2020 11:48:19 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id EE359247448;
	Mon, 17 Feb 2020 11:48:18 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com EE359247448
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1581958099;
	bh=5pa++iG3nrV3d2NkFDwIg93QVcuhO+HEoRxJtxgBckY=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=fYnnaHp0EgWVL7LA8VZy0ayXNQxkgNbtvMibq3TeEqCj59wFKSHVoQqPU0p71FR7O
	FeCRnm25UPeE0nL5FAJvt3X0e7q2dhjW1WkogWlNPAVMtWKyMmlw53n67fgyOq2e4t
	MHBa4aRtK5QpkViwAnNUYIBPw30gS2odVlHqqBJY4TyuEkz3uLZ/Fa3Xb9gurSiwrp
	6IyfVa+dtuBhN2dG3k8OhwtUQD7XICceLsq/1sg2mqKfxpLZhnUEQpqSvWg+V22Pyh
	4QkiCNPBsWm+Xje2mWL1i+Qk4TWWyYgTJj6f/hT97IzjbLNOg+U4/pcNmPdgtjdlgD
	+SkzOm6nWa3KQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gvqGoMQpbCCK; Mon, 17 Feb 2020 11:48:18 -0500 (EST)
Received: from joraj-alpa (192-222-181-218.qc.cable.ebox.net [192.222.181.218])
	by mail.efficios.com (Postfix) with ESMTPSA id BDD0824724A;
	Mon, 17 Feb 2020 11:48:18 -0500 (EST)
Date: Mon, 17 Feb 2020 11:48:18 -0500
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200217164818.GC17818@joraj-alpa>
References: <20200217105930.902-1-wallinux@gmail.com>
	<ac6d6a63-124f-099f-d1ff-e3092b506341@gmail.com>
	<CANNYZj-nk-txm1rUGd8ABY10ZQ=DkMEA0CexQsMDinuQxaTmkA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-nk-txm1rUGd8ABY10ZQ=DkMEA0CexQsMDinuQxaTmkA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] babeltrace: update to 1.5.8
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
X-List-Received-Date: Mon, 17 Feb 2020 16:53:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 17, 2020 at 12:43:43PM +0100, Alexander Kanavin wrote:
> Also, there=E2=80=99s now a babeltrace 2, so we should update to that r=
ather ?

Babeltrace 1.5.x and Babeltrace 2 are "setup" to be co-installed.

Currently lttng-tools depends on babeltrace 1.5 for testing (the "babeltr=
ace"
excutable). We plan to make the switch officialy in the upcoming months.

We recommend (upstream) that if a Babeltrace2 recipe is to be exposed tha=
t it is
done so in parallel to a Babeltrace 1.5.x recipe and that the default be
Babeltrace 1.5.x for now. AFAIK all tests from lttng-tools do pass when u=
sing
Babeltrace2 and babeltrace2 is full compatible (CLI) with babeltrace 1.5.=
x.

Still, we recommended that for now 1.5.x be the default.

Cheers

>=20
> Alex
>=20
> On Mon 17. Feb 2020 at 12.03, Jacob Kroon <jacob.kroon@gmail.com> wrote=
:
>=20
> > On 2/17/20 11:59 AM, Anders Wallin wrote:
> > > updated HOMEPAGE to http://babeltrace.org/
> > > updated LICENSE to include LGPLv2.1
> > >
> > > Signed-off-by: Anders Wallin <wallinux@gmail.com>
> > > ---
> > >   meta/recipes-kernel/lttng/babeltrace_1.5.8.bb | 20 ++++++++++++++=
+++++
> > >   1 file changed, 20 insertions(+)
> > >   create mode 100644 meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
> > >
> > > diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
> > b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
> > > new file mode 100644
> > > index 0000000000..b6b7653037
> > > --- /dev/null
> > > +++ b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
> > > @@ -0,0 +1,20 @@
> > > +SUMMARY =3D "Babeltrace - Trace Format Babel Tower"
> > > +DESCRIPTION =3D "Babeltrace provides trace read and write librarie=
s in
> > host side, as well as a trace converter, which used to convert LTTng =
2.0
> > traces into human-readable log."
> > > +HOMEPAGE =3D "http://babeltrace.org/"
> > > +BUGTRACKER =3D "https://bugs.lttng.org/projects/babeltrace"
> > > +LICENSE =3D "MIT & GPLv2 & LGPLv2.1"
> > > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D76ba15dd76a248e1dd526bc=
a0e2125fa"
> > > +
> > > +DEPENDS =3D "glib-2.0 util-linux popt bison-native flex-native"
> > > +
> > > +SRC_URI =3D "git://
> > git.linuxfoundation.org/diamon/babeltrace.git;branch=3Dstable-1.5"
> > > +SRCREV =3D "054a54ae10b01a271afc4f19496c041b10fb414c"
> > > +UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)$"
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +inherit autotools pkgconfig
> > > +
> > > +EXTRA_OECONF =3D "--disable-debug-info"
> > > +
> > > +ASNEEDED =3D ""
> > >
> >
> > Looks like this patch adds a new recipe for 1.5.8, and keeps the 1.5.=
7
> > recipe. Was that intentional ?
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--=20
Jonathan Rajotte-Julien
EfficiOS


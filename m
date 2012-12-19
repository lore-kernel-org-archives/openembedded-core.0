Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TlHNf-00087M-P7
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 12:00:08 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Dec 2012 02:44:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,316,1355126400"; d="scan'208";a="259582114"
Received: from unknown (HELO helios.localnet) ([10.252.122.248])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2012 02:45:15 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Date: Wed, 19 Dec 2012 10:45:14 +0000
Message-ID: <2128976.L3Pq5tyagE@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-19-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <CAOHjBZsawyuAo4zrzoSd3R5GypV=BiNEHc-JD5STmz1mR80G3Q@mail.gmail.com>
References: <CAOHjBZvW_wovoRDXuk=sbc-sgf64zLjsZYwDv+1UnXgkrLE_Nw@mail.gmail.com>
	<alpine.DEB.2.02.1212141209200.9553@oneiric>
	<CAOHjBZsawyuAo4zrzoSd3R5GypV=BiNEHc-JD5STmz1mR80G3Q@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: gcc-4.7.inc wrong FILESPATH setting?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2012 11:00:11 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday 17 December 2012 14:51:59 Giuseppe Condorelli wrote:
> 2012/12/14 Robert P. J. Day <rpjday@crashcourse.ca>
>=20
> > On Fri, 14 Dec 2012, Giuseppe Condorelli wrote:
> > > 2012/12/14 Robert P. J. Day <rpjday@crashcourse.ca>
> > >=20
> > >       On Fri, 14 Dec 2012, Marko Kati=C4=87 wrote:
> > >       > On Fri, 2012-12-14 at 17:41 +0100, Giuseppe Condorelli wr=
ote:
> > >       > > Hi All,
> > >       > >=20
> > >       > > I've seen that, in the given .inc file, the FILESPATH i=
s
> >=20
> > statically
> >=20
> > >       > > set to
> > >       > >=20
> > >       > > FILESPATH =3D "${FILE_DIRNAME}/gcc-4.7"
> > >       > >=20
> > >       > > This seems to avoid any FILESEXTRAPATHS_prepend usage o=
n
> >=20
> > append file.
> >=20
> > >       > > I need to add further patches for gcc-4.7.2 in my own m=
eta
> >=20
> > layer but
> >=20
> > >       > > if I set the FILESEXTRAPATHS_prepend as usual
> > >       > > nothing happens, sources are taken only from the direct=
ory set
> >=20
> > by
> >=20
> > >       > > FILESPATH.
> > >       > > Also I saw this setting was different in the past
> > >       > >=20
> > >       > > FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}=
/gcc-4.7'
> >=20
> > ], d)}"
> >=20
> > >   i'm fairly sure i posted on this recently.  base.bbclass
> > >=20
> > > *explicitly* sets FILESPATH to a set of variations thusly:
> > >=20
> > > FILESPATH =3D "${@base_set_filespath(["${FILE_DIRNAME}/${BP}",
> >=20
> > "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
> >=20
> > > which works fine with the recipes in the underlying oe-core layer=
.
> > >=20
> > >   however, when you use FILESEXTRAPATHS_prepend, you get addition=
al
> > >=20
> > > directories based on *only* the name you specify.  so if you do:
> > >=20
> > > FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> > >=20
> > > are you thinking you should also get all variations of "gcc-4.7"?=

> > > because that's not what's going to happen.
> > >=20
> > > I'm sorry, I've not catched your last sentence. I set (as in the
> > > past) the FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
> > > also updating the SRC_URI inside the .bbappend file to use the
> > > sources available in the gcc directory available in my own layer.=

> > >=20
> >   did you also set THISDIR just above that?
>=20
> No, I don't set it. Is it necessary now?

No, THISDIR is set automatically, you should not set it yourself.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre



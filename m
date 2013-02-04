Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U2Oxv-0007cT-65 for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 17:32:24 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r14GLNNu017851; Mon, 4 Feb 2013 16:21:30 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id h13xr15ydgMJ; Mon,  4 Feb 2013 16:21:29 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r14GLP01017831
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 4 Feb 2013 16:21:27 GMT
Message-ID: <1359994568.14071.162.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: David =?ISO-8859-1?Q?Nystr=F6m?= <david.c.nystrom@gmail.com>
Date: Mon, 04 Feb 2013 16:16:08 +0000
In-Reply-To: <510FCFAC.4050909@gmail.com>
References: <cover.1359706204.git.sgw@linux.intel.com>
	<510FCFAC.4050909@gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r14GLNNu017851
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/69] master-next & MUT (post M3)
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
X-List-Received-Date: Mon, 04 Feb 2013 16:32:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2013-02-04 at 16:11 +0100, David Nystr=C3=B6m wrote:
> On 02/01/2013 09:19 AM, Saul Wold wrote:
> > Richard,
> >
> > Here is a group of M4 patches and updates that have been
> > pending. I fixed a small issue I found with the package.bbclass
> > changes in gkt-icon-cache.bbclass
> >
> > I have included the DEB Incremental image set along with
> > the READ-Only Rootfs changes, this way they can get broader
> > views and usage by the community.
> >
> > I have also include the GCC Multilib changes.
> >
> > I just started the AB on MUT without some failing patches
> > (netbase and flex).
> >
> > Please watch it's status, There was a failure in the x86 GRUB
> > build which may also point back to Flex.
> >
> > Sau!
> >
> > This include
> > The following changes since commit 1489a69cecb1dcc3502a4c24beaea81e6c=
a6dacc:
> >
> >    harfbuzz: fix install of version.h (2013-01-31 12:29:18 +0000)
> >
> > are available in the git repository at:
> >
> >    git://git.openembedded.org/openembedded-core-contrib sgw/stage
> >    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/lo=
g/?h=3Dsgw/stage
> >
> >
> > David Nystr=C3=B6m (1):
> >    Lets face it, adding python dependencies is really a painful manua=
l
> >      process, due to setuptools/distutils, ignoring anything other th=
an
> >      python dependencies.
>=20
>=20
> Please drop above as well, it was an RFC meant to stir up some=20
> discussion, not meant for inclusion.

It didn't make it past my review since the commit message isn't
appropriate. Your second version looks better and is queued in
master-next though.

Cheers,

Richard




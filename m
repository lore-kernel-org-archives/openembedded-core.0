Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RIDl5-0005mO-Ez
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 08:11:39 +0200
Received: by bkat8 with SMTP id t8so7973673bka.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2011 23:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=j6Vv3xhCaDBtj0VnT8lVfZ7eI2V/J7JRGjWwMcO3fCA=;
	b=qib9NjuSTUlUFpkwSceEyIM3TuKeroh9EnSSt2ZZU6G5/eQOLIfOBE5MB+hjcUgR1V
	QYiw6A4KIesUf700TiElKOQ9BL7TcG8CovPj9l5FLOANBupide/7/NaB+bvr+8951db5
	Oru2iUgpYnB/2eKJAXkjh6dVaKvHGS9YOGDyc=
Received: by 10.204.139.87 with SMTP id d23mr15991696bku.67.1319436343090;
	Sun, 23 Oct 2011 23:05:43 -0700 (PDT)
Received: from localhost ([94.230.152.246]) by mx.google.com with ESMTPS id
	rc12sm22287367bkb.10.2011.10.23.23.05.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Oct 2011 23:05:41 -0700 (PDT)
Date: Mon, 24 Oct 2011 08:05:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111024060535.GA3602@jama.jama.net>
References: <cover.1318547063.git.nitin.a.kamble@intel.com>
	<70807dd62c2c498616cc544869bd710b351b7212.1318547063.git.nitin.a.kamble@intel.com>
	<20111014081939.GC3542@jama.jama.net>
	<20111014091136.GE3542@jama.jama.net>
	<9DA5872FEF993D41B7173F58FCF6BE94E33A6D8D@orsmsx504.amr.corp.intel.com>
	<20111023062813.GC3497@jama.jama.net>
	<9DA5872FEF993D41B7173F58FCF6BE94E33A6EBB@orsmsx504.amr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94E33A6EBB@orsmsx504.amr.corp.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [review/test 3/5] python, python-native: upgrade from 2.6.6 to 2.7.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Oct 2011 06:11:39 -0000
X-Groupsio-MsgNum: 11505
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 23, 2011 at 05:07:30PM -0700, Kamble, Nitin A wrote:
> Hi Martin,
>   I tested python inside qemux86-64 and it was working fine. I could test=
 small python scripts working as expected.
> Thanks,
> Nitin

For me it builds only after I've upgraded host's glibc version to 2.14
while using eglibc-2.14 for qemux86-64.

When I had glibc-2.13 on host and eglibc-2.14 for qemux86-64 it fails
like this:

/OE/shr-core/tmp/sysroots/x86_64-linux/usr/bin/python: /lib64/libc.so.6:
version `GLIBC_2.14' not found (required by
/OE/shr-core/tmp/work/x86_64-oe-linux/python-2.7.2-r0.0/Python-2.7.2/libpyt=
hon2.7.so.1.0)

as reported here:
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-October/011230.=
html

>=20
>=20
> > -----Original Message-----
> > From: Martin Jansa [mailto:martin.jansa@gmail.com]
> > Sent: Saturday, October 22, 2011 11:28 PM
> > To: Kamble, Nitin A
> > Cc: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] [review/test 3/5] python, python-native: upgrade
> > from 2.6.6 to 2.7.2
> >=20
> > On Sat, Oct 22, 2011 at 04:54:00PM -0700, Kamble, Nitin A wrote:
> > > Hi Martin,
> > >   I have kept my python work at nitin/python branch on poky contrib.
> > the 2.7.2 python is working for all arches except arm. And I am going
> > on vacation for few days, and I could not finish the python arm issue
> > arm, so if you get a chance you can look into the arm issue, if you
> > have not resolved it already then I will look into it again once I am
> > back from my vacation on 13th Nov.
> >=20
> > Hi Nitin,
> >=20
> > I've tried already and failed, but I'll try again and I guess qemux86-
> > 64 (linking to host libc and failing if it's not same version as the
> > one in
> > sysroot) is also still broken and should be taken care of too, right?
> >=20
> > Regards,
> >=20
> > > > -----Original Message-----
> > > > From: openembedded-core-bounces@lists.openembedded.org
> > > > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > > > Of Martin Jansa
> > > > Sent: Friday, October 14, 2011 2:12 AM
> > > > To: Patches and discussions about the oe-core layer
> > > > Subject: Re: [OE-core] [review/test 3/5] python, python-native:
> > > > upgrade from 2.6.6 to 2.7.2
> > > >
> > > > On Fri, Oct 14, 2011 at 10:19:39AM +0200, Martin Jansa wrote:
> > > > > On Thu, Oct 13, 2011 at 04:06:13PM -0700,
> > nitin.a.kamble@intel.com
> > > > wrote:
> > > > > > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> > > > > >
> > > > >
> > > > > This patch does not apply after
> > > > > 9f9612d15acc6ee3b71f52bdb3f1ec4cb56b1a17
> > > > >
> > > > > can you rebase on top of oe-core?
> > > > >
> > > > > Also please drop
> > > > > DEFAULT_PREFERENCE =3D "-27"
> > > > >
> > > > > we have only one python version so I guess it's not usefull at
> > all
> > > > > anymore
> > > > >
> > > > > I'll apply it manually, test it here.. and report if those
> > modules
> > > > are
> > > > > build later..
> > > >
> > > > seems the same as with previous version..
> > > >
> > > > log.do_compile full of
> > > > /OE/shr-core/tmp/sysroots/x86_64-linux/usr/lib/libpython2.7.so:
> > file
> > > > not recognized: File format not recognized
> > > > collect2: ld returned 1 exit status
> > > >
> > > > and only built module is sqlite
> > > > OE @ ~/shr-core/tmp/work/armv4t-oe-linux-gnueabi/python-2.7.2-r0.0
> > $
> > > > ls Python-2.7.2/build/lib.linux-x86_64-2.7/
> > > > _sqlite3.so
> > > >
> > > > while with 2.6 we had a lot of modules $ ls
> > > > Python-2.6.6/build/lib.linux-x86_64-2.6/
> > > > _bisect.so          _codecs_jp.so    _ctypes.so        _fileio.so
> > > > _json.so             _random.so   _testcapi.so  bz2.so
> > > > datetime.so         itertools.so  parser.so    spwd.so
> > > > unicodedata.so
> > > > _bytesio.so         _codecs_kr.so    _ctypes_test.so
> > _functools.so
> > > > _locale.so           _socket.so   _weakref.so   cPickle.so
> > fcntl.so
> > > > math.so       pyexpat.so   strop.so    zlib.so
> > > > _codecs_cn.so       _codecs_tw.so    _curses.so        _hashlib.so
> > > > _lsprof.so           _sqlite3.so  array.so      cStringIO.so
> > > > future_builtins.so  mmap.so       readline.so  syslog.so
> > > > _codecs_hk.so       _collections.so  _curses_panel.so  _heapq.so
> > > > _multibytecodec.so   _ssl.so      audioop.so    cmath.so
> > gdbm.so
> > > > nis.so        resource.so  termios.so
> > > > _codecs_iso2022.so  _csv.so          _elementtree.so   _hotshot.so
> > > > _multiprocessing.so  _struct.so   binascii.so   crypt.so
> > grp.so
> > > > operator.so   select.so    time.so
> > > >
> > > > Can you please test that you have non-empty python-syslog python-
> > > > resource python-elementtree python-fcntl python-zlib?
> > > > And test build for qemuarm, because I guess that it links to -
> > native
> > > > libpython2.7 when you're building qemux86 on x86 host.
> > > >
> > > > But it seems that python runtime works now, thanks!
> > > >
> > > > Regards,
> > > > --
> > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >=20
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6lAC8ACgkQN1Ujt2V2gBzX1gCeMPSF7H+Bz2Ffi1Xbgf8UQcYj
LAEAniJPaBkbmJOeepltBBJJhDARdYCb
=Iyjz
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--

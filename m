Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REdtS-0001Rq-1v
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 11:17:30 +0200
Received: by bkat8 with SMTP id t8so1740748bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 02:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=u8sC4gMewfzDssmCjlOIRmXQxhNj22ygiOeEyw8icLk=;
	b=h5TUuG8Cwj5uNbZUDH9js7xfu+nBPHTNIPOcgw9rK4NBZ1Up3Ita2XDH0d405NNKzy
	Ru9dLhYEzAdJpG701HyUmaj9RN2ds5KZxPXIzSa0C58c/SSImp+QL4Aki1JgTWeqJVTP
	fOeih+nCWwKPP+oZ0PPgg9X9nC3Oy6bm+G9qU=
Received: by 10.204.134.19 with SMTP id h19mr6048758bkt.79.1318583504346;
	Fri, 14 Oct 2011 02:11:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r12sm7688123bkw.5.2011.10.14.02.11.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Oct 2011 02:11:43 -0700 (PDT)
Date: Fri, 14 Oct 2011 11:11:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111014091136.GE3542@jama.jama.net>
References: <cover.1318547063.git.nitin.a.kamble@intel.com>
	<70807dd62c2c498616cc544869bd710b351b7212.1318547063.git.nitin.a.kamble@intel.com>
	<20111014081939.GC3542@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20111014081939.GC3542@jama.jama.net>
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
X-List-Received-Date: Fri, 14 Oct 2011 09:17:30 -0000
X-Groupsio-MsgNum: 10997
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jKBxcB1XkHIR0Eqt"
Content-Disposition: inline

--jKBxcB1XkHIR0Eqt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 14, 2011 at 10:19:39AM +0200, Martin Jansa wrote:
> On Thu, Oct 13, 2011 at 04:06:13PM -0700, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >=20
>=20
> This patch does not apply after
> 9f9612d15acc6ee3b71f52bdb3f1ec4cb56b1a17
>=20
> can you rebase on top of oe-core?
>=20
> Also please drop
> DEFAULT_PREFERENCE =3D "-27"
>=20
> we have only one python version so I guess it's not usefull at all
> anymore
>=20
> I'll apply it manually, test it here.. and report if those modules are
> build later..

seems the same as with previous version..=20

log.do_compile full of
/OE/shr-core/tmp/sysroots/x86_64-linux/usr/lib/libpython2.7.so: file not re=
cognized: File format not recognized
collect2: ld returned 1 exit status

and only built module is sqlite
OE @ ~/shr-core/tmp/work/armv4t-oe-linux-gnueabi/python-2.7.2-r0.0 $ ls Pyt=
hon-2.7.2/build/lib.linux-x86_64-2.7/
_sqlite3.so

while with 2.6 we had a lot of modules
$ ls Python-2.6.6/build/lib.linux-x86_64-2.6/
_bisect.so          _codecs_jp.so    _ctypes.so        _fileio.so     _json=
=2Eso             _random.so   _testcapi.so  bz2.so        datetime.so     =
    itertools.so  parser.so    spwd.so     unicodedata.so
_bytesio.so         _codecs_kr.so    _ctypes_test.so   _functools.so  _loca=
le.so           _socket.so   _weakref.so   cPickle.so    fcntl.so          =
  math.so       pyexpat.so   strop.so    zlib.so
_codecs_cn.so       _codecs_tw.so    _curses.so        _hashlib.so    _lspr=
of.so           _sqlite3.so  array.so      cStringIO.so  future_builtins.so=
  mmap.so       readline.so  syslog.so
_codecs_hk.so       _collections.so  _curses_panel.so  _heapq.so      _mult=
ibytecodec.so   _ssl.so      audioop.so    cmath.so      gdbm.so           =
  nis.so        resource.so  termios.so
_codecs_iso2022.so  _csv.so          _elementtree.so   _hotshot.so    _mult=
iprocessing.so  _struct.so   binascii.so   crypt.so      grp.so            =
  operator.so   select.so    time.so

Can you please test that you have non-empty python-syslog python-resource p=
ython-elementtree python-fcntl python-zlib?=20
And test build for qemuarm, because I guess that it links to -native libpyt=
hon2.7 when you're building qemux86 on x86 host.

But it seems that python runtime works now, thanks!

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jKBxcB1XkHIR0Eqt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6X/MgACgkQN1Ujt2V2gBzz/gCeOVDeIysEinTPU7i8mwNadGSZ
0hMAmQFci6ds016DVzUuugsJNIei5zy0
=aD+A
-----END PGP SIGNATURE-----

--jKBxcB1XkHIR0Eqt--

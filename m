Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1REgZk-0007bI-Ed
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 14:09:20 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Oct 2011 05:03:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,346,1315206000"; d="scan'208";a="73646645"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2011 05:03:31 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx604.amr.corp.intel.com ([10.250.113.17]) with mapi;
	Fri, 14 Oct 2011 05:03:30 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2011 05:03:29 -0700
Thread-Topic: [OE-core] [review/test 3/5] python, python-native: upgrade
	from 2.6.6 to 2.7.2
Thread-Index: AcyKUVc13Lhis7vCSniBc/753kRozgAFwUxg
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E0BCF084@orsmsx504.amr.corp.intel.com>
References: <cover.1318547063.git.nitin.a.kamble@intel.com>
	<70807dd62c2c498616cc544869bd710b351b7212.1318547063.git.nitin.a.kamble@intel.com>
	<20111014081939.GC3542@jama.jama.net>
	<20111014091136.GE3542@jama.jama.net>
In-Reply-To: <20111014091136.GE3542@jama.jama.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 14 Oct 2011 12:09:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Friday, October 14, 2011 2:12 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [review/test 3/5] python, python-native: upgrade
> from 2.6.6 to 2.7.2
>=20
> On Fri, Oct 14, 2011 at 10:19:39AM +0200, Martin Jansa wrote:
> > On Thu, Oct 13, 2011 at 04:06:13PM -0700, nitin.a.kamble@intel.com
> wrote:
> > > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> > >
> >
> > This patch does not apply after
> > 9f9612d15acc6ee3b71f52bdb3f1ec4cb56b1a17
> >
> > can you rebase on top of oe-core?
Ok, I will do the rebase and send new commits. I was getting into some unre=
lated issues with the top of the oecore, hence I was using the 1.1 edison b=
ranch to do this work.

> >
> > Also please drop
> > DEFAULT_PREFERENCE =3D "-27"

Done in my branch.

> >
> > we have only one python version so I guess it's not usefull at all
> > anymore
> >
> > I'll apply it manually, test it here.. and report if those modules
> are
> > build later..
>=20
> seems the same as with previous version..
>=20
> log.do_compile full of
> /OE/shr-core/tmp/sysroots/x86_64-linux/usr/lib/libpython2.7.so: file
> not recognized: File format not recognized
> collect2: ld returned 1 exit status

I am not seeing this error.

>=20
> and only built module is sqlite
> OE @ ~/shr-core/tmp/work/armv4t-oe-linux-gnueabi/python-2.7.2-r0.0 $ ls
> Python-2.7.2/build/lib.linux-x86_64-2.7/
> _sqlite3.so
>=20
> while with 2.6 we had a lot of modules
> $ ls Python-2.6.6/build/lib.linux-x86_64-2.6/
> _bisect.so          _codecs_jp.so    _ctypes.so        _fileio.so
> _json.so             _random.so   _testcapi.so  bz2.so
> datetime.so         itertools.so  parser.so    spwd.so
> unicodedata.so
> _bytesio.so         _codecs_kr.so    _ctypes_test.so   _functools.so
> _locale.so           _socket.so   _weakref.so   cPickle.so    fcntl.so
> math.so       pyexpat.so   strop.so    zlib.so
> _codecs_cn.so       _codecs_tw.so    _curses.so        _hashlib.so
> _lsprof.so           _sqlite3.so  array.so      cStringIO.so
> future_builtins.so  mmap.so       readline.so  syslog.so
> _codecs_hk.so       _collections.so  _curses_panel.so  _heapq.so
> _multibytecodec.so   _ssl.so      audioop.so    cmath.so      gdbm.so
> nis.so        resource.so  termios.so
> _codecs_iso2022.so  _csv.so          _elementtree.so   _hotshot.so
> _multiprocessing.so  _struct.so   binascii.so   crypt.so      grp.so
> operator.so   select.so    time.so

I am seeing these .so modules built:
$ find image/ | grep "\.so"
image/usr/lib/python2.7/lib-dynload/_codecs_tw.so
image/usr/lib/python2.7/lib-dynload/mmap.so
image/usr/lib/python2.7/lib-dynload/resource.so
image/usr/lib/python2.7/lib-dynload/_random.so
image/usr/lib/python2.7/lib-dynload/termios.so
image/usr/lib/python2.7/lib-dynload/_codecs_jp.so
image/usr/lib/python2.7/lib-dynload/strop.so
image/usr/lib/python2.7/lib-dynload/_io.so
image/usr/lib/python2.7/lib-dynload/syslog.so
image/usr/lib/python2.7/lib-dynload/_codecs_hk.so
image/usr/lib/python2.7/lib-dynload/_testcapi.so
image/usr/lib/python2.7/lib-dynload/_collections.so
image/usr/lib/python2.7/lib-dynload/_socket.so
image/usr/lib/python2.7/lib-dynload/future_builtins.so
image/usr/lib/python2.7/lib-dynload/_csv.so
image/usr/lib/python2.7/lib-dynload/operator.so
image/usr/lib/python2.7/lib-dynload/parser.so
image/usr/lib/python2.7/lib-dynload/crypt.so
image/usr/lib/python2.7/lib-dynload/_elementtree.so
image/usr/lib/python2.7/lib-dynload/nis.so
image/usr/lib/python2.7/lib-dynload/_lsprof.so
image/usr/lib/python2.7/lib-dynload/_multiprocessing.so
image/usr/lib/python2.7/lib-dynload/_codecs_kr.so
image/usr/lib/python2.7/lib-dynload/cmath.so
image/usr/lib/python2.7/lib-dynload/_multibytecodec.so
image/usr/lib/python2.7/lib-dynload/array.so
image/usr/lib/python2.7/lib-dynload/bz2.so
image/usr/lib/python2.7/lib-dynload/_codecs_cn.so
image/usr/lib/python2.7/lib-dynload/_ssl.so
image/usr/lib/python2.7/lib-dynload/cStringIO.so
image/usr/lib/python2.7/lib-dynload/_json.so
image/usr/lib/python2.7/lib-dynload/_ctypes_test.so
image/usr/lib/python2.7/lib-dynload/_struct.so
image/usr/lib/python2.7/lib-dynload/itertools.so
image/usr/lib/python2.7/lib-dynload/zlib.so
image/usr/lib/python2.7/lib-dynload/spwd.so
image/usr/lib/python2.7/lib-dynload/_codecs_iso2022.so
image/usr/lib/python2.7/lib-dynload/audioop.so
image/usr/lib/python2.7/lib-dynload/math.so
image/usr/lib/python2.7/lib-dynload/ossaudiodev.so
image/usr/lib/python2.7/lib-dynload/_bisect.so
image/usr/lib/python2.7/lib-dynload/_hotshot.so
image/usr/lib/python2.7/lib-dynload/_curses.so
image/usr/lib/python2.7/lib-dynload/select.so
image/usr/lib/python2.7/lib-dynload/linuxaudiodev.so
image/usr/lib/python2.7/lib-dynload/time.so
image/usr/lib/python2.7/lib-dynload/pyexpat.so
image/usr/lib/python2.7/lib-dynload/cPickle.so
image/usr/lib/python2.7/lib-dynload/fcntl.so
image/usr/lib/python2.7/lib-dynload/binascii.so
image/usr/lib/python2.7/lib-dynload/_functools.so
image/usr/lib/python2.7/lib-dynload/_sqlite3.so
image/usr/lib/python2.7/lib-dynload/_heapq.so
image/usr/lib/python2.7/lib-dynload/datetime.so
image/usr/lib/python2.7/lib-dynload/readline.so
image/usr/lib/python2.7/lib-dynload/_curses_panel.so
image/usr/lib/python2.7/lib-dynload/gdbm.so
image/usr/lib/python2.7/lib-dynload/_locale.so
image/usr/lib/python2.7/lib-dynload/_hashlib.so
image/usr/lib/python2.7/lib-dynload/unicodedata.so
image/usr/lib/python2.7/lib-dynload/grp.so
image/usr/lib/python2.7/lib-dynload/_ctypes.so
image/usr/lib/libpython2.7.so.1.0
image/usr/lib/libpython2.7.so

>=20
> Can you please test that you have non-empty python-syslog python-
> resource python-elementtree python-fcntl python-zlib?
> And test build for qemuarm, because I guess that it links to -native
> libpython2.7 when you're building qemux86 on x86 host.
>=20
I tested for qemumips, and it worked like qemux86. I think qemuarm will not=
 be different, I will give it a try.

Thanks,
Nitin

> But it seems that python runtime works now, thanks!
>=20
> Regards,
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



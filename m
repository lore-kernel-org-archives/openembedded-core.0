Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RI8AW-0000md-OK
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 02:13:33 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Oct 2011 17:07:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,395,1315206000"; d="scan'208";a="29405869"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Oct 2011 17:07:34 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.226.128) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sun, 23 Oct 2011 17:07:32 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx606.amr.corp.intel.com ([10.22.226.128]) with mapi;
	Sun, 23 Oct 2011 17:07:31 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 23 Oct 2011 17:07:30 -0700
Thread-Topic: [OE-core] [review/test 3/5] python, python-native: upgrade
	from 2.6.6 to 2.7.2
Thread-Index: AcyRTPbuvZdsFizaR5KJ5KOt8wGRaQAk9rYQ
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E33A6EBB@orsmsx504.amr.corp.intel.com>
References: <cover.1318547063.git.nitin.a.kamble@intel.com>
	<70807dd62c2c498616cc544869bd710b351b7212.1318547063.git.nitin.a.kamble@intel.com>
	<20111014081939.GC3542@jama.jama.net>
	<20111014091136.GE3542@jama.jama.net>
	<9DA5872FEF993D41B7173F58FCF6BE94E33A6D8D@orsmsx504.amr.corp.intel.com>
	<20111023062813.GC3497@jama.jama.net>
In-Reply-To: <20111023062813.GC3497@jama.jama.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 24 Oct 2011 00:13:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Martin,
  I tested python inside qemux86-64 and it was working fine. I could test s=
mall python scripts working as expected.
Thanks,
Nitin


> -----Original Message-----
> From: Martin Jansa [mailto:martin.jansa@gmail.com]
> Sent: Saturday, October 22, 2011 11:28 PM
> To: Kamble, Nitin A
> Cc: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [review/test 3/5] python, python-native: upgrade
> from 2.6.6 to 2.7.2
>=20
> On Sat, Oct 22, 2011 at 04:54:00PM -0700, Kamble, Nitin A wrote:
> > Hi Martin,
> >   I have kept my python work at nitin/python branch on poky contrib.
> the 2.7.2 python is working for all arches except arm. And I am going
> on vacation for few days, and I could not finish the python arm issue
> arm, so if you get a chance you can look into the arm issue, if you
> have not resolved it already then I will look into it again once I am
> back from my vacation on 13th Nov.
>=20
> Hi Nitin,
>=20
> I've tried already and failed, but I'll try again and I guess qemux86-
> 64 (linking to host libc and failing if it's not same version as the
> one in
> sysroot) is also still broken and should be taken care of too, right?
>=20
> Regards,
>=20
> > > -----Original Message-----
> > > From: openembedded-core-bounces@lists.openembedded.org
> > > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > > Of Martin Jansa
> > > Sent: Friday, October 14, 2011 2:12 AM
> > > To: Patches and discussions about the oe-core layer
> > > Subject: Re: [OE-core] [review/test 3/5] python, python-native:
> > > upgrade from 2.6.6 to 2.7.2
> > >
> > > On Fri, Oct 14, 2011 at 10:19:39AM +0200, Martin Jansa wrote:
> > > > On Thu, Oct 13, 2011 at 04:06:13PM -0700,
> nitin.a.kamble@intel.com
> > > wrote:
> > > > > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> > > > >
> > > >
> > > > This patch does not apply after
> > > > 9f9612d15acc6ee3b71f52bdb3f1ec4cb56b1a17
> > > >
> > > > can you rebase on top of oe-core?
> > > >
> > > > Also please drop
> > > > DEFAULT_PREFERENCE =3D "-27"
> > > >
> > > > we have only one python version so I guess it's not usefull at
> all
> > > > anymore
> > > >
> > > > I'll apply it manually, test it here.. and report if those
> modules
> > > are
> > > > build later..
> > >
> > > seems the same as with previous version..
> > >
> > > log.do_compile full of
> > > /OE/shr-core/tmp/sysroots/x86_64-linux/usr/lib/libpython2.7.so:
> file
> > > not recognized: File format not recognized
> > > collect2: ld returned 1 exit status
> > >
> > > and only built module is sqlite
> > > OE @ ~/shr-core/tmp/work/armv4t-oe-linux-gnueabi/python-2.7.2-r0.0
> $
> > > ls Python-2.7.2/build/lib.linux-x86_64-2.7/
> > > _sqlite3.so
> > >
> > > while with 2.6 we had a lot of modules $ ls
> > > Python-2.6.6/build/lib.linux-x86_64-2.6/
> > > _bisect.so          _codecs_jp.so    _ctypes.so        _fileio.so
> > > _json.so             _random.so   _testcapi.so  bz2.so
> > > datetime.so         itertools.so  parser.so    spwd.so
> > > unicodedata.so
> > > _bytesio.so         _codecs_kr.so    _ctypes_test.so
> _functools.so
> > > _locale.so           _socket.so   _weakref.so   cPickle.so
> fcntl.so
> > > math.so       pyexpat.so   strop.so    zlib.so
> > > _codecs_cn.so       _codecs_tw.so    _curses.so        _hashlib.so
> > > _lsprof.so           _sqlite3.so  array.so      cStringIO.so
> > > future_builtins.so  mmap.so       readline.so  syslog.so
> > > _codecs_hk.so       _collections.so  _curses_panel.so  _heapq.so
> > > _multibytecodec.so   _ssl.so      audioop.so    cmath.so
> gdbm.so
> > > nis.so        resource.so  termios.so
> > > _codecs_iso2022.so  _csv.so          _elementtree.so   _hotshot.so
> > > _multiprocessing.so  _struct.so   binascii.so   crypt.so
> grp.so
> > > operator.so   select.so    time.so
> > >
> > > Can you please test that you have non-empty python-syslog python-
> > > resource python-elementtree python-fcntl python-zlib?
> > > And test build for qemuarm, because I guess that it links to -
> native
> > > libpython2.7 when you're building qemux86 on x86 host.
> > >
> > > But it seems that python runtime works now, thanks!
> > >
> > > Regards,
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



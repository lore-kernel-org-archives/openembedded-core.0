Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1USNlF-0002j3-Ko for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 10:30:42 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3H8DTmd006784; Wed, 17 Apr 2013 09:13:29 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id b9FS23MKQrMX; Wed, 17 Apr 2013 09:13:29 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3H8DMjt006772
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 17 Apr 2013 09:13:24 +0100
Message-ID: <1366186370.25282.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Wed, 17 Apr 2013 09:12:50 +0100
In-Reply-To: <CALbNGRTMUkavk8669XUPf+YMEBTibUPhpnHh35xYG4eENO-ktw@mail.gmail.com>
References: <cover.1364456659.git.raj.khem@gmail.com>
	<ddbbb594a0a4c3ff64bb5e4ce0be895a5e2f0193.1364456659.git.raj.khem@gmail.com>
	<20130328122110.GA5105@jama>
	<35803143-FAED-48CC-9FD1-1E216B3A575C@gmail.com>
	<A54391FA-3CD5-4290-A92B-EE3477A2EEAE@dominion.thruhere.net>
	<D8B28775-1426-427F-B7CB-E10164FAF197@gmail.com>
	<CALbNGRSs_t4EbStjw4S6djPiL3xJDRQ0U0MvS820f1OkC7Q6cQ@mail.gmail.com>
	<1364824441.24754.20.camel@localhost>
	<CALbNGRSqEdebP4WsrH9xrW30k+MuxfaXousVfNfjdufS4yCfSw@mail.gmail.com>
	<CAJTo0LZGADsne_bKyDDTX2Vt4QX=pfv+Vr27Xi93B8C_S3WJkg@mail.gmail.com>
	<CALbNGRRCFyiD+6eY1xMe6o8dqtpuyf6YAEa7xKZ=f8wBv262uA@mail.gmail.com>
	<CAJTo0Ladru_hAgyL32SX8bDet3euSFz9Jf=jiJxBJqiNv8eseQ@mail.gmail.com>
	<CALbNGRQ+BqGarZWxmtj50S4rJbDtNPGqB=eWvotBVdVAcviedQ@mail.gmail.com>
	<CALbNGRTMUkavk8669XUPf+YMEBTibUPhpnHh35xYG4eENO-ktw@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r3H8DTmd006784
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: Upgrade to 199
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
X-List-Received-Date: Wed, 17 Apr 2013 08:30:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2013-04-17 at 09:47 +0200, Andreas M=C3=BCller wrote:
> On Fri, Apr 12, 2013 at 1:01 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
> > On Fri, Apr 12, 2013 at 12:53 PM, Burton, Ross <ross.burton@intel.com=
> wrote:
> >> Hi Andreas,
> >>
> >> On 12 April 2013 11:46, Andreas M=C3=BCller <schnitzeltony@googlemai=
l.com> wrote:
> >>> It is Fedora 14 and I don't have the time to update the machine.
> >>
> >> Genuinely shocked that they shipped GNU make 3.82 without the patche=
s
> >> to make it work.
> >>
> >>> Since there seems no support for little poor old-fashioned people l=
ike
> >>> me: Is there a configuration option so I can force to build
> >>> make-native on that machine (checked local.conf.sample /
> >>> site.conf.sample / yocto reference manual but did not find a hint)?
> >>
> >> From a quick look, BASEDEPENDS_append =3D " make-native" might do th=
e trick.
> >>
> > Thanks
> >
> This came too early because - before I tested it. I get
>=20
> NOTE: multiple providers are available for make-native (make-native,
> remake-native)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match make-native
> NOTE: Preparing runqueue
> ERROR: Unbuildable tasks were found.
> These are usually caused by circular dependencies and any circular
> dependency chains found will be printed below. Increase the debug
> level to see a list of unbuildable tasks.
>=20
> Identifying dependency loops (this may take a short while)...
>=20
> ERROR: An uncaught exception occured in runqueue, please see the failur=
e below:
> ERROR: Running idle function
> Traceback (most recent call last):
>   File "/home/andreas/oe-core/sources/bitbake/lib/bb/runqueue.py",
> line 300, in find_chains(taskid=3D175, prev_chain=3D[14, 15, 19, 20, 16=
,
> 17, 174, 178, 179, 175]):
>                      if scan:
>     >                    find_chains(revdep, copy.deepcopy(prev_chain))
>                      for dep in explored_deps[revdep]:
>   File "/home/andreas/oe-core/sources/bitbake/lib/bb/runqueue.py",
> line 300, in find_chains(taskid=3D176, prev_chain=3D[14, 15, 19, 20, 16=
,
> 17, 174, 178, 179, 175, 176]):
>                      if scan:
>     >                    find_chains(revdep, copy.deepcopy(prev_chain))
>                      for dep in explored_deps[revdep]:
>   File "/home/andreas/oe-core/sources/bitbake/lib/bb/runqueue.py",
> line 300, in find_chains(taskid=3D1142, prev_chain=3D[14, 15, 19, 20, 1=
6,
> 17, 174, 178, 179, 175, 176, 1142]):
>                      if scan:
>     >                    find_chains(revdep, copy.deepcopy(prev_chain))
>                      for dep in explored_deps[revdep]:
>   File "/home/andreas/oe-core/sources/bitbake/lib/bb/runqueue.py",
> line 300, in find_chains(taskid=3D1143, prev_chain=3D[14, 15, 19, 20, 1=
6,
> 17, 174, 178, 179, 175, 176, 1142, 1143]):
>                      if scan:
>     >                    find_chains(revdep, copy.deepcopy(prev_chain))
>                      for dep in explored_deps[revdep]:
>   File "/home/andreas/oe-core/sources/bitbake/lib/bb/runqueue.py",
> line 301, in find_chains(taskid=3D1139, prev_chain=3D[14, 15, 19, 20, 1=
6,
> 17, 174, 178, 179, 175, 176, 1142, 1143, 1139]):
>                          find_chains(revdep, copy.deepcopy(prev_chain))
>     >                for dep in explored_deps[revdep]:
>                          if dep not in total_deps:
> KeyError: 1140
>=20
> NOTE: Tasks Summary: Attempted 0 tasks of which 0 didn't need to be
> rerun and all succeeded.
>=20
> Summary: There was 1 WARNING message shown.
> Summary: There were 3 ERROR messages shown, returning a non-zero exit c=
ode.
>=20
>=20
> bitbake make-native works fine.
>=20
> What other options do I have to force build of make-native. Why I
> insist: On both of my machines (Fedora 14 / 15) build of systemd
> fails.

In local.conf do something like:

DEPENDS_append_pn-systemd =3D " make-native"

By adding make-native to the base dependencies you've introduced
circular dependencies and the circular dependency handling code in
bitbake is breaking for unknown reasons. That code is fairly broken at
this point unfortunately (someone should file a bug) but its beyond what
we can fix in 1.4 at this point.

Cheers,

Richard




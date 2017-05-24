Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id C95EC780C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 10:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id DD99518092;
	Wed, 24 May 2017 12:03:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id GMnjuPnNCyBL; Wed, 24 May 2017 12:03:53 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 7E4B91831B;
	Wed, 24 May 2017 12:03:53 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 686BB1A088;
	Wed, 24 May 2017 12:03:53 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CC6E1A07F;
	Wed, 24 May 2017 12:03:53 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed, 24 May 2017 12:03:53 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 4FC851AE3;
	Wed, 24 May 2017 12:03:53 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 24 May 2017 12:03:53 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 24 May 2017 12:03:52 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Wed, 24 May 2017 12:03:53 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Joshua Watt <jpewhacker@gmail.com>, Randy Witt
	<randy.e.witt@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] openssh: Atomically generate host keys
Thread-Index: AQHSxtH9tkiyG8k3skSQqXn1vxkEFaIB9PoAgAAOigCAAB/igIAACTSAgAAhrgCAAQ0ggA==
Date: Wed, 24 May 2017 10:03:53 +0000
Message-ID: <410d6a00d45b4b1fa84dd0e36196f753@XBOX02.axis.com>
References: <20170507013304.30165-1-JPEWhacker@gmail.com>
	<CAJTo0Lafr6dearC1uiQpumEUHA9ggAC59MhtvFWVvYi-Oc_8TQ@mail.gmail.com>
	<CAJdd5GZeT8h7qXfKF=XM7Q0kKoMgQSxNprqhWz7wYv_vBquzTQ@mail.gmail.com>
	<09a43b20-0aa0-beed-f019-762bb23d0a79@linux.intel.com>
	<CAJdd5GadD1wBi_GcWQRk92pW8WG-oUQcATLDemWXcZkCax+pjA@mail.gmail.com>
	<CAJdd5GZWc73h2hgGk=LboLfYkMPOME1yLoLCZyK5hCy79_TV+w@mail.gmail.com>
In-Reply-To: <CAJdd5GZWc73h2hgGk=LboLfYkMPOME1yLoLCZyK5hCy79_TV+w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: Atomically generate host keys
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
X-List-Received-Date: Wed, 24 May 2017 10:03:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Joshua Watt
> Sent: den 23 maj 2017 21:57
> To: Randy Witt <randy.e.witt@linux.intel.com>
> Cc: OE-core <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH] openssh: Atomically generate host keys
>=20
> On Tue, May 23, 2017 at 12:56 PM, Joshua Watt <jpewhacker@gmail.com>
> wrote:
> > On Tue, May 23, 2017 at 12:23 PM, Randy Witt
> > <randy.e.witt@linux.intel.com> wrote:
> >> On 05/23/2017 08:29 AM, Joshua Watt wrote:
> >>>
> >>> On Tue, May 23, 2017 at 9:37 AM, Burton, Ross
> <ross.burton@intel.com>
> >>> wrote:
> >>>>
> >>>>
> >>>> On 7 May 2017 at 02:33, Joshua Watt <jpewhacker@gmail.com> wrote:
> >>>>>
> >>>>>
> >>>>> +if [ ! -f "$NAME" ]; then
> >>>>> +    echo "  generating ssh $TYPE key..."
> >>>>> +    ssh-keygen -q -f "${NAME}.tmp" -N '' -t $TYPE
> >>>>> +
> >>>>> +    # Sync to ensure data is written to temp file before
> renaming
> >>>>> +    sync
> >>>>> +
> >>>>> +    # Move (Atomically rename) files
> >>>>> +    # Rename the .pub file first, since the check that triggers
> a
> >>>>> +    # key generation is based on the private file.
> >>>>> +    mv -f "${NAME}.tmp.pub" "${NAME}.pub"
> >>>>> +    sync
> >>>>> +
> >>>>> +    mv -f "${NAME}.tmp" "${NAME}"
> >>>>> +    sync
> >>>>> +fi
> >>>>>
> >>>>
> >>>> All of these syncs seem quite enthusiastic, are they really
> needed?
> >>>> Writing
> >>>> the file to a temporary name and then mving it to the real name
> should
> >>>> result in either no file or a complete file in the event of power
> loss,
> >>>> surely?
> >>>
> >>>
> >>> My understanding (and observation) of most journal file systems is
> >>> that only metadata (i.e. directory entries and such) are journaled
> in
> >>> typical usage. The first sync is necessary in this case to ensure
> that
> >>> the actual file data gets put on the disk before we rename the
> files,
> >>> otherwise in the event of interruption journaled rename might get
> >>> replayed but have garbage data. The second one is more of a "force
> >>> operation order" sync to make sure the public file is written
> before
> >>> the private one, as a reordering would cause problems. The last
> sync
> >>> is the most optional, but I've seen it take minutes for disk to
> sync
> >>> contents if no one calls "sync", so it is very possible that all
> our
> >>> work of regenerating keys would be for naught if power is
> interrupted
> >>> in the meantime.
> >>>
> >>> I think some of these syncs can be removed. Namely, the first and
> >>> third one. The second one needs to be there, but can server double
> >>> duty of syncing data to disk and enforcing the order between the
> >>> public and private rename. It does mean we could get a state where
> the
> >>> public key exists but is garbage, but this should be OK because the
> >>> private key won't exist and it would be regenerated.
> >>>
> >>> The third sync can be removed and I can put one final sync at the
> end
> >>> after all keys are generated to ensure we won't go through all the
> >>> effort of regenerating the (last) key again in the event of
> >>> interruption shortly after, unless you would prefer I didn't.
> >>>
> >>
> >> The typical convention for this is,
> >>
> >> 1. Update file data.
> >> 2. sync file
> >> 3. sync containing directory
> >> 4. mv file to new location
> >> 5. sync directory containing new file (although I've seen this step
> left out
> >> before)
> >>
> >> https://lwn.net/Articles/457672/ is a good example which is linked
> from
> >> https://lwn.net/Articles/457667/
> >>
> >> But one of the important parts vs your code, is also that the
> example is
> >> only calling sync on the files/directory needed, vs calling "sync"
> with no
> >> arguments which is going to cause all data in all filesystem caches
> to be
> >> flushed.
> >
> > Ah, OK. That makes sense, I will update sync to specify the
> > files/directory explicitly.
>=20
> FWIW, I did some tests on the sync behavior:
>=20
> It appears that older versions of the sync command ignore any
> arguments and just call sync(). From Ubuntu 14.04:
> $ strace sync foo
> ...
> write(2, "sync: ", 6sync: )                   =3D 6
> write(2, "ignoring all arguments", 22)  =3D 22
> write(2, "\n", 1)                       =3D 1
> sync()                                  =3D 0
> ...
>=20
> The same is true for the (default) busybox version of sync on master
> (again verified with strace), but it doesn't complain nosily about it.

Busybox has a separate fsync applet to do file synchronization, but it=20
is not enabled in the default OE-core configuration...

> I looked at the coreutils code, and sync was changed to respect
> arguments in January of 2015
> (8b2bf5295f353016d4f5e6a2317d55b6a8e7fd00) and only call fsync() on
> the provided arguments (if any are provided).
>=20
> Either way, adding the arguments to the sync call in my patch won't
> hurt because it is forward compatible, even though it won't be
> optimally efficient currently because the sync command currently
> simply calls sync()

//Peter



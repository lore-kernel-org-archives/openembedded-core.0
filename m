Return-Path: <prvs=122729fd1=Mikko.Rapeli@bmw.de>
Received: from esa9.bmw.c3s2.iphmx.com (esa9.bmw.c3s2.iphmx.com
	[68.232.133.110])
	by mail.openembedded.org (Postfix) with ESMTP id D2A116C4CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 12:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1565787053; x=1597323053;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=nup6Gze4oa6MZjH6zWNMtwHhD2mACT6QMO8BZvGJOts=;
	b=eKDZ3H5g/5Nw3ReQ81IkbHS0790ovvBEf4IjPi6uo2XAMyHosJuHvVyz
	5jrh8qfc0aV98Bn3u1S8Z+eEA6y3VxHUPWhinBzouazPswJhViPQ0HABP
	/r5P+Rkg7DJ4D/AA4dH2dRuCIR4r84K6qLpSxGLbPh+sg8+EOAufThPQU 0=;
IronPort-SDR: agATpQA20Vm0SZIUfPl8gTxzBh6Y84RdHcgIIoC7ozx2+RZHPthe58FoaXRivdm8cGJdDdGOd+
	Br2dcYhgyhJhwPgV4gsFUCm3VsM4KVYrRwCaNilgFT9ebSz6ITs2zVvJ+5PFTI1qIVuxiszAd9
	g7RL6DPrjkBzvZ7myHwOlBxrBmo4HVwgmDomyNwlutdQg2BC25zS9yKxpCTMLeH0np2KuVno4F
	CyfGI8sxEuJysfzapfWrCnf02JkRoisE8IwEdvJ02A+whac5wVAD+plZcNRWnWZEkghfAsXxyX
	K20=
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa9.bmw.c3s2.iphmx.com with ESMTP/TLS; 14 Aug 2019 14:50:38 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw5.muc with ESMTP/TLS;
	14 Aug 2019 14:50:15 +0200
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp)
	([160.48.96.46])
	by esabb2.muc with ESMTP/TLS; 14 Aug 2019 14:50:15 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10j.europe.bmw.corp
	(160.48.96.46) with Microsoft SMTP Server (TLS;
	Wed, 14 Aug 2019 14:50:15 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Wed, 14 Aug 2019 14:50:15 +0200
From: <Mikko.Rapeli@bmw.de>
To: <alex.kanavin@gmail.com>
Thread-Topic: [OE-core] Long delays with latest bitbake (was: [PATCH 1/7]
	insane.bbclass: in file-rdeps do not look into RDEPENDS recursively)
Thread-Index: AdVRTDpM70Pk7GnyTXqYsVociWcc2AAWRKoAABV2goAAIcBwAAAAaVqAAAEWWoAAAXmZgA==
Date: Wed, 14 Aug 2019 12:50:15 +0000
Message-ID: <20190814125014.GC3459@hiutale>
References: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
	<33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
	<2a106fcffc331009abdb6498ffe8c4f3c99ee80b.camel@linuxfoundation.org>
	<CANNYZj9HHxJa5NKWU9r09NXgBy8aD0RTkugQ-k6esVNCTVOa6w@mail.gmail.com>
	<6551fb5303bcc8dbf3a9d55a1aa6a9ecd2baeb13.camel@linuxfoundation.org>
	<CANNYZj_7t+dB0FOUjGocHLzACtLquqqGV3R1awiQe=27JwQa3Q@mail.gmail.com>
In-Reply-To: <CANNYZj_7t+dB0FOUjGocHLzACtLquqqGV3R1awiQe=27JwQa3Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.33]
MIME-Version: 1.0
Cc: peter.kjellerstedt@axis.com, openembedded-core@lists.openembedded.org
Subject: Re: Long delays with latest bitbake (was: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively)
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
X-List-Received-Date: Wed, 14 Aug 2019 12:50:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8B9FFC010BF5674FA76332397A6B54A5@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2019 at 02:08:01PM +0200, Alexander Kanavin wrote:
> On Wed, 14 Aug 2019 at 13:36, <richard.purdie@linuxfoundation.org> wrote:
>=20
> > On Wed, 2019-08-14 at 13:25 +0200, Alexander Kanavin wrote:
> > > On Tue, 13 Aug 2019 at 21:18, Richard Purdie <
> > > richard.purdie@linuxfoundation.org> wrote:
> > > > I had a glance at the profile output from master-next and the
> > > > problem
> > > > wasn't where I thought it would be, it was in the scheduler code.
> > > > That
> > > > is good as those classes are effectively independent of the other
> > > > changes and hence are a separate fix.
> > > >
> > > > I've put a patch in -next which takes the above test to 36s which
> > > > is
> > > > close to the older bitbake.
> > > >
> > > > Could be interesting to see how it looks for others and different
> > > > workloads.
> > >
> > > I just tried the same test I did yesterday with
> > > ab56d466452148e5fce330d279d13e2495eceb1f. Unfortunately it doesn't
> > > seem to improve things much: bitbake is stuck at "NOTE: Executing
> > > Tasks" for 15 minutes now.
> >
> > This might sound slightly crazy but can you try commenting out this
> > line in runqueue.py:
> >
> > logger.debug(2, "Holding off tasks %s" %
> > pprint.pformat(self.holdoff_tasks))
> >
> > ?
> >
>=20
> Even crazier is the outcome: it helped! The whole thing completed after
> 15m49secons (with much of the time going to the empty task spin), that's
> some 3 minutes slower, but certainly it's usable again.
>=20
> I have not enabled the hash server at any point.

Indeed, commenting that debug statement out removes few minutes of the
bitbake preparation times.

Here is a time stamped output from master branch:

2019-08-14_14:29:24 =20
2019-08-14_14:29:35  Initialising tasks...done.
2019-08-14_14:32:41  Checking sstate mirror object availability...done.
2019-08-14_14:32:41  Sstate summary: Wanted 436 Found 426 Missed 10 Current=
 2407 (97% match, 99% complete)
2019-08-14_14:32:41  NOTE: Executing Tasks
2019-08-14_14:32:52  NOTE: Setscene tasks completed

And with the comment removed:

2019-08-14_14:35:10 =20
2019-08-14_14:35:21  Initialising tasks...done.
2019-08-14_14:35:30  Checking sstate mirror object availability...done.
2019-08-14_14:35:30  Sstate summary: Wanted 436 Found 426 Missed 10 Current=
 2407 (97% match, 99% complete)
2019-08-14_14:35:30  NOTE: Executing Tasks

And just in case back to master branch state:

2019-08-14_14:41:32 =20
2019-08-14_14:41:43  Initialising tasks...done.
2019-08-14_14:45:02  Checking sstate mirror object availability...done.
2019-08-14_14:45:02  Sstate summary: Wanted 436 Found 426 Missed 10 Current=
 2407 (97% match, 99% complete)
2019-08-14_14:45:02  NOTE: Executing Tasks

I did not flush caches in between and I stopped the builds once bitbake sta=
rted doing stuff, so I think sstate cache was completely buffered in memory
from file system and IO delays did not affect the timings.

Change to poky was exactly:

--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -2216,7 +2216,7 @@ class RunQueueExecute:
             for dep in self.sqdata.sq_covered_tasks[tid]:
                 if dep not in self.runq_complete:
                     self.holdoff_tasks.add(dep)
-        logger.debug(2, "Holding off tasks %s" % pprint.pformat(self.holdo=
ff_tasks))
+        # logger.debug(2, "Holding off tasks %s" % pprint.pformat(self.hol=
doff_tasks))
=20
     def process_possible_migrations(self):
         changes =3D False

-Mikko=


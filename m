Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
	[209.85.166.51])
	by mail.openembedded.org (Postfix) with ESMTP id 737F26064C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Feb 2020 07:27:34 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id x1so4129792iop.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Feb 2020 23:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ZQ/zP6XhuzBokseN3ZkXZlJqfNcnUXCEv28nrfQmHuo=;
	b=ZWzz6QPzQb+zl/Uo9LlCNMF9LO9Z2HI2awwsDGFSVbv7iyVrS8NpIhi8ca7SAX2clv
	hXymx3Kz71ia+ai+3qtBh1Ifz+RgFEuS+1KzOGQuazdkz9Dq32fz47PRJhoj5ai6Vysl
	GcrxpMAWdOkHz0l/XyQ+ZI9D7sZiKG6RhwVO+7HuPORX1jZP8KSEvw3DN2YduKqiDHLm
	J2KDOWdJYPZvCaKHeR4hMxTT+M0sjikyTAN7AJb1xR7wLxLNpHaIq3hSRjKrwaHGEUnZ
	nXyEmcU2MxmLik+Eipw00yGsqSUojLBx2uWdvIhgARjZwsqHtQhVvbqmNxVNiTWYQVH0
	dFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ZQ/zP6XhuzBokseN3ZkXZlJqfNcnUXCEv28nrfQmHuo=;
	b=M3at6eShRFZBoUX5ik1iKenCArHtLUuyYXAlrvmEGMJUJanSZt6C4FGErM3Kfj386T
	bkigMJbOenuawbHNnT1r5dg2PC7nS8ht7uDGWM1thnJpHmfBSIERQugrV+rT8G5NaAn3
	4N86EBphpIti9puTRMSRIK8l5yZ6jkJgK3jAXxABfjqr0AcnP+jqydOzqP4wni+iQU0S
	wASVGUV/vzNtj3W8ztrlDpgLPduhdE+18uVV33l8tJJVXj2+w/KZrC4LFJk5/v42cegR
	KYOcrI366tdJcJaLBrjVYrnBkn2DmSp2Di0zcTO0iUnOzeKmSdQbx/dD+548SsrsERuV
	VBdA==
X-Gm-Message-State: APjAAAWUT/40PXrcemVqajznLUM1xudguIZb9uM0sHf4wQ9Gz4u1QDR4
	V+Sc8c+pBlFA6uyLzdxiJfhk+YAvkC++uM44OEh+FrCr
X-Google-Smtp-Source: APXvYqw2tFcKqLbh9dZsCPLdcnb+PPtCURyIe4AhEqO0Pf00KfGYEGTBBlBWW52YwcTJNV7W0QBfCuPyu3Acd8xVcbk=
X-Received: by 2002:a6b:f80a:: with SMTP id o10mr4867813ioh.144.1581233255081; 
	Sat, 08 Feb 2020 23:27:35 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5QPxrnkPhjeO3s79AAYF55nPtR3OL0iuL9rqCvN-OmpfA@mail.gmail.com>
	<ad681bbf95efbeb211cbbe00dd73a4e2ce7cf335.camel@linuxfoundation.org>
	<BN6PR1201MB248222EF01FA45459B7BC0BE8B1C0@BN6PR1201MB2482.namprd12.prod.outlook.com>
	<6109c3315b8a215881c134441b74d0753820b5c8.camel@linuxfoundation.org>
	<CAO5Uq5T1k-ZMZwpsDOeE+aQOJMBZ0PQSzC1jeS+iw=20bxyogA@mail.gmail.com>
	<BN6PR1201MB248219E5E090A8B5691CCB098B1E0@BN6PR1201MB2482.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR1201MB248219E5E090A8B5691CCB098B1E0@BN6PR1201MB2482.namprd12.prod.outlook.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 9 Feb 2020 07:27:23 +0000
Message-ID: <CAO5Uq5Q5gR_Pyfve_Dr+gSZ29xxCKS-J4NUyKSLS8GXDp0LzbQ@mail.gmail.com>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Cache unihash ... doesn't match BB_UNIHASH ...
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
X-List-Received-Date: Sun, 09 Feb 2020 07:27:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 9, 2020 at 12:23 AM chris.laplante@agilent.com
<chris.laplante@agilent.com> wrote:
>
> Hi Richard,
>
> > > > Anecdotally, we are running Zeus for nightly builds with three
> > > > multiconfigs. I cherry-picked your "bitbake: fix2" and "bitbake:
> > > > fixup" patches and haven't seen any of the BB_UNIHASH errors since.
> > > > Granted it's only been a week. But before that, hash equiv +
> > > > multiconfig was unusable due to the BB_UNIHASH errors.
> > >
> > > That is a really helpful data point, thanks. I should probably clean =
up
> > > those bitbake patches and get them merged then, I couldn't decide if
> > > they were right or not...
> > >
> >
> > I just picked all your pending changes out of master-next into our
> > local patch queue - will let you know how it looks when it's finished
> > cooking!
>
> There are two small issues I have observed.
>
> One is occasionally I get a lot of undeterministic metadata errors when B=
B_CACHE_POLICY =3D "cache", multiconfig, and hash equiv are enabled. The er=
rors are all on recipes for which SRCREV =3D "${AUTOREV}". It doesn't alway=
s happen. But it did just now when I rebased our "zeus-modified" branch ont=
o the upstream "zeus" branch, to get the changes starting with 7dc72fde6ede=
b5d6ac6b3832530998afeea67cbc.
>
> Two is that, sometimes "Initializing tasks" stage appears stuck at 44% fo=
r a couple minutes. I traced it down to this code in runqueue.py (line 1168=
 on zeus):
>
>         # Iterate over the task list and call into the siggen code
>         dealtwith =3D set()
>         todeal =3D set(self.runtaskentries)
>         while len(todeal) > 0:
>             for tid in todeal.copy():
>                 if len(self.runtaskentries[tid].depends - dealtwith) =3D=
=3D 0:
>                     dealtwith.add(tid)
>                     todeal.remove(tid)
>                     self.prepare_task_hash(tid)
>
> When I instrument the loop to print out the size of "todeal", I see it de=
crease very slowly, sometimes only a couple at a time. I'm guessing this is=
 because prepare_task_hash is contacting the hash equiv server, in a serial=
 manner here. I'm over my work VPN which makes things extra slow. Is there =
an opportunity for batching here?
>

I've a new failure:

00:20:59.829  Traceback (most recent call last):
00:20:59.829    File
"/var/lib/jenkins/workspace/nanohub_master/poky/bitbake/lib/bb/server/proce=
ss.py",
line 278, in ProcessServer.idle_commands(delay=3D0.1,
fds=3D[<socket.socket fd=3D6, family=3DAddressFamily.AF_UNIX,
type=3DSocketKind.SOCK_STREAM, proto=3D0, laddr=3Dbitbake.sock>,
<socket.socket fd=3D18, family=3DAddressFamily.AF_UNIX,
type=3DSocketKind.SOCK_STREAM, proto=3D0, laddr=3Dbitbake.sock>,
<bb.server.process.ConnectionReader object at 0x7f831b7adb70>]):
00:20:59.829                   try:
00:20:59.829      >                retval =3D function(self, data, False)
00:20:59.829                       if retval is False:
00:20:59.829    File
"/var/lib/jenkins/workspace/nanohub_master/poky/bitbake/lib/bb/cooker.py",
line 1434, in buildTargetsIdle(server=3D<ProcessServer(ProcessServer-1,
started)>, rq=3D<bb.runqueue.RunQueue object at 0x7f82f5112f98>,
abort=3DFalse):
00:20:59.829                   try:
00:20:59.829      >                retval =3D rq.execute_runqueue()
00:20:59.829                   except runqueue.TaskFailure as exc:
00:20:59.829    File
"/var/lib/jenkins/workspace/nanohub_master/poky/bitbake/lib/bb/runqueue.py"=
,
line 1522, in RunQueue.execute_runqueue():
00:20:59.829               try:
00:20:59.829      >            return self._execute_runqueue()
00:20:59.829               except bb.runqueue.TaskFailure:
00:20:59.829    File
"/var/lib/jenkins/workspace/nanohub_master/poky/bitbake/lib/bb/runqueue.py"=
,
line 1488, in RunQueue._execute_runqueue():
00:20:59.829               if self.state is runQueueRunning:
00:20:59.829      >            retval =3D self.rqexe.execute()
00:20:59.829
00:20:59.829    File
"/var/lib/jenkins/workspace/nanohub_master/poky/bitbake/lib/bb/runqueue.py"=
,
line 1997, in RunQueueExecute.execute():
00:20:59.829                               else:
00:20:59.829      >
self.sqdata.outrightfail.remove(nexttask)
00:20:59.829                           if nexttask in self.sqdata.outrightf=
ail:

Just testing locally with:

diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index 71108eeed752..a94a9bb27ae2 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -1994,7 +1994,7 @@ class RunQueueExecute:
                             self.sq_task_failoutright(nexttask)
                             return True
                         else:
-                            self.sqdata.outrightfail.remove(nexttask)
+                            self.sqdata.outrightfail.discard(nexttask)
                     if nexttask in self.sqdata.outrightfail:
                         logger.debug(2, 'No package found, so
skipping setscene task %s', nexttask)
                         self.sq_task_failoutright(nexttask)



--=20
Alex Kiernan


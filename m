Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
	[209.85.166.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1F49A60CA0
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Feb 2020 16:25:21 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id m25so4879130ioo.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Feb 2020 08:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=WqDe/0YhuIivQLFM/ijeASiQ0TLgslN6yfaBOklRS4o=;
	b=iXF2ApkkCiL31kbc0pBgM4nxslZ0KKXpswb8fTmcSIFHmqimKuK2+BisY37Zt2O4+4
	F98CFnIE56ptJ4zvB1XTdigT4cZx3pg/003zngVLKC1z/GnBMwX+iM7jLn5kla1m0V82
	ZnR/3plxkTArA8GtSPOKtgYr+hZ/VG1hlmmeIhgNksEjdeuv/sB/IuqFJvvrJku1qf8F
	50PUpWd40Vizahray6t4Wm5rtr+bTHe73DhAnvvzPJoKQn/RSjGlxt+X2nC7FYJuEFkt
	xPonrDQNwH4eFTCX1zfTJinR6V8eQPna4OHkqIOZl5y5QbbJFu3x9L6KuYxANt333Id6
	4pZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=WqDe/0YhuIivQLFM/ijeASiQ0TLgslN6yfaBOklRS4o=;
	b=pREpDY0LVE/HsMgz4rImEe4QPVSJ9zIY2tHGzQngXcjv3STkNF94jqc+bHz8e83B5B
	TJYys58nt/uH1yCoO1UWwW3H/j3dCSLLwM+YkxNkCYgl14VbSBx4CdwGdj+LZt62hlx4
	mockgN+/kG3XZf3Ej7jdWaxLGoQvI1Fd2C+4x3XRyPrd0EnNJ0Flq2EO9N1J51PLH/Oy
	W6OEkHw4+qW1R5FYRzccEiEkd1ZvhLd+MbRUlUBtMlBQsBnzk97mFO7YVZaVitbxaWwB
	1ctmXvzxE2RQh/oUgSaqM3tytY3nvRsBVzrxXR2w2f74i9FzUyP71Pov8bis59kHLQWc
	q5ug==
X-Gm-Message-State: APjAAAV0v1DdZMK2CW0CRVV00N2VoQJWPC51MdW9eOEeQJ05sFXzC26u
	paoLJCTcv/WOUj6HOAT7U7IbLlg7gW5SXj58qUA=
X-Google-Smtp-Source: APXvYqwfBSr4o3uvm+lgnaUig1+Ng4A5gHlFz0vVrwvKtfOL8or8jRz8E44yUj5VtSfSo0apRvEZdi0PmY4VhiHTFMo=
X-Received: by 2002:a6b:3845:: with SMTP id f66mr6663870ioa.102.1581265522843; 
	Sun, 09 Feb 2020 08:25:22 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5QPxrnkPhjeO3s79AAYF55nPtR3OL0iuL9rqCvN-OmpfA@mail.gmail.com>
	<ad681bbf95efbeb211cbbe00dd73a4e2ce7cf335.camel@linuxfoundation.org>
	<BN6PR1201MB248222EF01FA45459B7BC0BE8B1C0@BN6PR1201MB2482.namprd12.prod.outlook.com>
	<6109c3315b8a215881c134441b74d0753820b5c8.camel@linuxfoundation.org>
	<CAO5Uq5T1k-ZMZwpsDOeE+aQOJMBZ0PQSzC1jeS+iw=20bxyogA@mail.gmail.com>
	<BN6PR1201MB248219E5E090A8B5691CCB098B1E0@BN6PR1201MB2482.namprd12.prod.outlook.com>
	<CAO5Uq5Q5gR_Pyfve_Dr+gSZ29xxCKS-J4NUyKSLS8GXDp0LzbQ@mail.gmail.com>
In-Reply-To: <CAO5Uq5Q5gR_Pyfve_Dr+gSZ29xxCKS-J4NUyKSLS8GXDp0LzbQ@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 9 Feb 2020 16:25:11 +0000
Message-ID: <CAO5Uq5TExuHymttsrn7jvdxSSah3fafRJvR+2VfPJ90NH6XDqw@mail.gmail.com>
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
X-List-Received-Date: Sun, 09 Feb 2020 16:25:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 9, 2020 at 7:27 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On Sun, Feb 9, 2020 at 12:23 AM chris.laplante@agilent.com
> <chris.laplante@agilent.com> wrote:
> >
> > Hi Richard,
> >
> > > > > Anecdotally, we are running Zeus for nightly builds with three
> > > > > multiconfigs. I cherry-picked your "bitbake: fix2" and "bitbake:
> > > > > fixup" patches and haven't seen any of the BB_UNIHASH errors sinc=
e.
> > > > > Granted it's only been a week. But before that, hash equiv +
> > > > > multiconfig was unusable due to the BB_UNIHASH errors.
> > > >
> > > > That is a really helpful data point, thanks. I should probably clea=
n up
> > > > those bitbake patches and get them merged then, I couldn't decide i=
f
> > > > they were right or not...
> > > >
> > >
> > > I just picked all your pending changes out of master-next into our
> > > local patch queue - will let you know how it looks when it's finished
> > > cooking!
> >
> > There are two small issues I have observed.
> >
> > One is occasionally I get a lot of undeterministic metadata errors when=
 BB_CACHE_POLICY =3D "cache", multiconfig, and hash equiv are enabled. The =
errors are all on recipes for which SRCREV =3D "${AUTOREV}". It doesn't alw=
ays happen. But it did just now when I rebased our "zeus-modified" branch o=
nto the upstream "zeus" branch, to get the changes starting with 7dc72fde6e=
deb5d6ac6b3832530998afeea67cbc.
> >
> > Two is that, sometimes "Initializing tasks" stage appears stuck at 44% =
for a couple minutes. I traced it down to this code in runqueue.py (line 11=
68 on zeus):
> >
> >         # Iterate over the task list and call into the siggen code
> >         dealtwith =3D set()
> >         todeal =3D set(self.runtaskentries)
> >         while len(todeal) > 0:
> >             for tid in todeal.copy():
> >                 if len(self.runtaskentries[tid].depends - dealtwith) =
=3D=3D 0:
> >                     dealtwith.add(tid)
> >                     todeal.remove(tid)
> >                     self.prepare_task_hash(tid)
> >
> > When I instrument the loop to print out the size of "todeal", I see it =
decrease very slowly, sometimes only a couple at a time. I'm guessing this =
is because prepare_task_hash is contacting the hash equiv server, in a seri=
al manner here. I'm over my work VPN which makes things extra slow. Is ther=
e an opportunity for batching here?
> >
>
> I've a new failure:
>
> 00:20:59.829  Traceback (most recent call last):
> 00:20:59.829    File
> "/var/lib/jenkins/workspace/nanohub_master/poky/bitbake/lib/bb/server/pro=
cess.py",
> line 278, in ProcessServer.idle_commands(delay=3D0.1,
> fds=3D[<socket.socket fd=3D6, family=3DAddressFamily.AF_UNIX,
> type=3DSocketKind.SOCK_STREAM, proto=3D0, laddr=3Dbitbake.sock>,
> <socket.socket fd=3D18, family=3DAddressFamily.AF_UNIX,
> type=3DSocketKind.SOCK_STREAM, proto=3D0, laddr=3Dbitbake.sock>,
> <bb.server.process.ConnectionReader object at 0x7f831b7adb70>]):
> 00:20:59.829                   try:
> 00:20:59.829      >                retval =3D function(self, data, False)
> 00:20:59.829                       if retval is False:
> 00:20:59.829    File
> "/var/lib/jenkins/workspace/nanohub_master/poky/bitbake/lib/bb/cooker.py"=
,
> line 1434, in buildTargetsIdle(server=3D<ProcessServer(ProcessServer-1,
> started)>, rq=3D<bb.runqueue.RunQueue object at 0x7f82f5112f98>,
> abort=3DFalse):
> 00:20:59.829                   try:
> 00:20:59.829      >                retval =3D rq.execute_runqueue()
> 00:20:59.829                   except runqueue.TaskFailure as exc:
> 00:20:59.829    File
> "/var/lib/jenkins/workspace/nanohub_master/poky/bitbake/lib/bb/runqueue.p=
y",
> line 1522, in RunQueue.execute_runqueue():
> 00:20:59.829               try:
> 00:20:59.829      >            return self._execute_runqueue()
> 00:20:59.829               except bb.runqueue.TaskFailure:
> 00:20:59.829    File
> "/var/lib/jenkins/workspace/nanohub_master/poky/bitbake/lib/bb/runqueue.p=
y",
> line 1488, in RunQueue._execute_runqueue():
> 00:20:59.829               if self.state is runQueueRunning:
> 00:20:59.829      >            retval =3D self.rqexe.execute()
> 00:20:59.829
> 00:20:59.829    File
> "/var/lib/jenkins/workspace/nanohub_master/poky/bitbake/lib/bb/runqueue.p=
y",
> line 1997, in RunQueueExecute.execute():
> 00:20:59.829                               else:
> 00:20:59.829      >
> self.sqdata.outrightfail.remove(nexttask)
> 00:20:59.829                           if nexttask in self.sqdata.outrigh=
tfail:
>
> Just testing locally with:
>
> diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
> index 71108eeed752..a94a9bb27ae2 100644
> --- a/bitbake/lib/bb/runqueue.py
> +++ b/bitbake/lib/bb/runqueue.py
> @@ -1994,7 +1994,7 @@ class RunQueueExecute:
>                              self.sq_task_failoutright(nexttask)
>                              return True
>                          else:
> -                            self.sqdata.outrightfail.remove(nexttask)
> +                            self.sqdata.outrightfail.discard(nexttask)
>                      if nexttask in self.sqdata.outrightfail:
>                          logger.debug(2, 'No package found, so
> skipping setscene task %s', nexttask)
>                          self.sq_task_failoutright(nexttask)
>

That change has got me a clean build to complete end to end, which a
rebuild is then successfully using the sstate-cache.

But something is upsetting sstate I'm serving back from the jenkins
box to a local build, as I'm getting different hashes for the same
sstate:

akiernan@akiernan-virtual-machine:~/nanohub/build$ find sstate-cache
-name '*quilt-native*populate_sysroot*' -ls
  2240468     40 -rw-rw-r--   1 akiernan akiernan    39406 Feb  9
13:53 sstate-cache/universal/ff/29/sstate:quilt-native:x86_64-linux:0.66:r0=
:x86_64:3:ff29b95eb35bba9a4c2e0857372991e6f08c0e9fcb72f76bc2dfbad5d12cade1_=
populate_sysroot.tgz.siginfo
  2241106     56 -rw-rw-r--   1 akiernan akiernan    53302 Feb  9
13:53 sstate-cache/universal/ff/29/sstate:quilt-native:x86_64-linux:0.66:r0=
:x86_64:3:ff29b95eb35bba9a4c2e0857372991e6f08c0e9fcb72f76bc2dfbad5d12cade1_=
populate_sysroot.tgz
  2634859     40 -rw-rw-r--   1 akiernan akiernan    39387 Feb  9
16:16 sstate-cache/universal/83/30/sstate:quilt-native:x86_64-linux:0.66:r0=
:x86_64:3:83309dcd3c0c7e2ab03ed24b2a5b8d6bf9e35e7b4c8c27373fd68513c8c2b29e_=
populate_sysroot.tgz.siginfo
  2634858     52 -rw-rw-r--   1 akiernan akiernan    52543 Feb  9
16:16 sstate-cache/universal/83/30/sstate:quilt-native:x86_64-linux:0.66:r0=
:x86_64:3:83309dcd3c0c7e2ab03ed24b2a5b8d6bf9e35e7b4c8c27373fd68513c8c2b29e_=
populate_sysroot.tgz
akiernan@akiernan-virtual-machine:~/nanohub/build$ bitbake-diffsigs
sstate-cache/universal/ff/29/sstate:quilt-native:x86_64-linux:0.66:r0:x86_6=
4:3:ff29b95eb35bba9a4c2e0857372991e6f08c0e9fcb72f76bc2dfbad5d12cade1_popula=
te_sysroot.tgz.siginfo
sstate-cache/universal/83/30/sstate:quilt-native:x86_64-linux:0.66:r0:x86_6=
4:3:83309dcd3c0c7e2ab03ed24b2a5b8d6bf9e35e7b4c8c27373fd68513c8c2b29e_popula=
te_sysroot.tgz.siginfo
NOTE: Starting bitbake server...
akiernan@akiernan-virtual-machine:~/nanohub/build$

Running dumpsig and diffing them manually I'm none the wiser - other
than variables being a in a different order in the two sstate files,
they're identical.

--=20
Alex Kiernan


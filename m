Return-Path: <ssinfod@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 21CA573929
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 14:31:17 +0000 (UTC)
Received: by wesx3 with SMTP id x3so28507326wes.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 07:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=RnR2w1BVLR1fuFbIiqoP8a5PGPweotwWByhKt/Z/DKQ=;
	b=OqDpsX5teATeG07Bu4wpy5mCnSNTPlpDuExosmQZRvGCSvsUXyfnG0DBBGfqoQbeE4
	JWKUlIVhcuF7LCHe7XeB3Y2xvkblhq9HkMbFsQHw91PoetMyOzseese8Q5UGukS4kdLE
	Y2anrA1iGaV9uSNQQvIN75TKWogSwTnYGJRuke0GKYIgMQE2NboF90pjv7KzsrEPiWvx
	B64XbTMLlTrPXi+g3dhrcJwLqdUQ22IbWrE8ajD4pW21bYIMTp8PHgRUEzHSq5i1Y97R
	ZWSYuEdKL3LiJ+uXrkUoNZ4RR0mi3KzQrFQQz7LE2oheQYXROaGGqBjCq4Gl1EXGM5nA
	HIZw==
MIME-Version: 1.0
X-Received: by 10.194.86.194 with SMTP id r2mr59910490wjz.41.1425911478381;
	Mon, 09 Mar 2015 07:31:18 -0700 (PDT)
Received: by 10.194.93.228 with HTTP; Mon, 9 Mar 2015 07:31:18 -0700 (PDT)
Date: Mon, 9 Mar 2015 10:31:18 -0400
Message-ID: <CAHUo2cxmz74Mw-z7i9MHB9-tm5srq5jhcG8XYrA8C8qcrQumGw@mail.gmail.com>
From: ss infod <ssinfod@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Problem with mesa_10.1.3.bb for angstrom on i.mx 6
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
X-List-Received-Date: Mon, 09 Mar 2015 14:31:19 -0000
Content-Type: multipart/alternative; boundary=089e0102faea267d020510dbe36d

--089e0102faea267d020510dbe36d
Content-Type: text/plain; charset=UTF-8

Hello,

I'm trying to build an angstrom image for an i.mx 6 (wandboard).
I'm able to build a console image but I have a problem when I build an
image which includes xfce or gnome.

My bitbake commands are:
MACHINE=wandboard-quad ./oebb.sh bitbake development-gnome-image
(or)
MACHINE=wandboard-quad ./oebb.sh bitbake development-xfce-image

The bitbake error is:

| configure: error: cannot enable egl_gallium without EGL
| Configure failed. The contents of all config.log files follows to aid
debugging
| ERROR: oe_runconf failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
/home/dev/WBD-ang/setup-scripts/build/tmp-angstrom_v2014_12-glibc/work/cortexa9hf-vfp-neon-mx6qdl-angstrom-linux-gnueabi/mesa/2_10.1.3-r0/temp/log.do_configure.8747)
ERROR: Task 4345
(/home/dev/WBD-ang/setup-scripts/sources/openembedded-core/meta/recipes-graphics/mesa/
mesa_10.1.3.bb, do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1376 tasks of which 1374 didn't need to be
rerun and 1 failed.
NOTE: Writing buildhistory
Waiting for 0 running tasks to finish:

It seems there is a configuration problem with mesa (3D) support.

Here is the list of commands I used to came to this conclusion. The last
commands gives the error.
git clone git://github.com/Angstrom-distribution/setup-scripts.git
cd setup-scripts/
git checkout angstrom-v2014.12-yocto1.7
MACHINE=wandboard-quad ./oebb.sh config wandboard-quad
source ./environment-angstrom-v2014.12
MACHINE=wandboard-quad ./oebb.sh update
MACHINE=wandboard-quad ./oebb.sh bitbake core-image-minimal
MACHINE=wandboard-quad ./oebb.sh bitbake development-xfce-image

Is there a way to build my image while disabling the mesa support ? (I want
a GUI but I don't need the 3D support).

Why is "mesa_10.1.3.bb" failing for this configuration ?

Thanks
ssinfod

--089e0102faea267d020510dbe36d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,<br></div><div><br></div><div>I&#39;m trying to=
 build an angstrom image for an <a href=3D"http://i.mx">i.mx</a> 6 (wandboa=
rd).</div><div>I&#39;m able to build a console image but I have a problem w=
hen I build an image which includes xfce or gnome.</div><div><br></div><div=
>My bitbake commands are:</div><div>MACHINE=3Dwandboard-quad ./oebb.sh bitb=
ake development-gnome-image</div><div>(or)</div><div>MACHINE=3Dwandboard-qu=
ad ./oebb.sh bitbake development-xfce-image</div><div><br></div><div>The bi=
tbake error is:</div><div><br></div><div>| configure: error: cannot enable =
egl_gallium without EGL</div><div>| Configure failed. The contents of all c=
onfig.log files follows to aid debugging</div><div>| ERROR: oe_runconf fail=
ed</div><div>| WARNING: exit code 1 from a shell command.</div><div>| ERROR=
: Function failed: do_configure (log file is located at /home/dev/WBD-ang/s=
etup-scripts/build/tmp-angstrom_v2014_12-glibc/work/cortexa9hf-vfp-neon-mx6=
qdl-angstrom-linux-gnueabi/mesa/2_10.1.3-r0/temp/log.do_configure.8747)</di=
v><div>ERROR: Task 4345 (/home/dev/WBD-ang/setup-scripts/sources/openembedd=
ed-core/meta/recipes-graphics/mesa/<a href=3D"http://mesa_10.1.3.bb">mesa_1=
0.1.3.bb</a>, do_configure) failed with exit code &#39;1&#39;</div><div>NOT=
E: Tasks Summary: Attempted 1376 tasks of which 1374 didn&#39;t need to be =
rerun and 1 failed.</div><div>NOTE: Writing buildhistory</div><div>Waiting =
for 0 running tasks to finish:</div><div><br></div><div>It seems there is a=
 configuration problem with mesa (3D) support.</div><div><br></div><div>Her=
e is the list of commands I used to came to this conclusion. The last comma=
nds gives the error.</div><div>git clone git://<a href=3D"http://github.com=
/Angstrom-distribution/setup-scripts.git">github.com/Angstrom-distribution/=
setup-scripts.git</a></div><div>cd setup-scripts/</div><div>git checkout an=
gstrom-v2014.12-yocto1.7</div><div>MACHINE=3Dwandboard-quad ./oebb.sh confi=
g wandboard-quad</div><div>source ./environment-angstrom-v2014.12</div><div=
>MACHINE=3Dwandboard-quad ./oebb.sh update</div><div>MACHINE=3Dwandboard-qu=
ad ./oebb.sh bitbake core-image-minimal</div><div>MACHINE=3Dwandboard-quad =
./oebb.sh bitbake development-xfce-image</div><div><br></div><div>Is there =
a way to build my image while disabling the mesa support ? (I want a GUI bu=
t I don&#39;t need the 3D support).</div><div><br></div><div>Why is &quot;<=
a href=3D"http://mesa_10.1.3.bb">mesa_10.1.3.bb</a>&quot; failing for this =
configuration ?</div><div><br></div><div>Thanks</div><div>ssinfod</div></di=
v>

--089e0102faea267d020510dbe36d--

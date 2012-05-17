Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SUxnq-00083z-Fz
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 12:19:26 +0200
Received: by yenl13 with SMTP id l13so1590341yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 03:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:from:date:message-id:subject:to:cc
	:content-type:x-gm-message-state;
	bh=JgjYpBcj3OCU2e3exkjsnc+bWLU+hfDyBOt1VVqhFYA=;
	b=N8L5ID6Z8VVfGC/kTSRsj9jNk4vf10hSxUaVHIG4QLDbohB/KalHAeLFK+Ag3M5xdi
	B/VxEtRZMULfEUCaDGK6BYgogeXIiPCSedk8ApWlAokn6V4M6tDlXv4W4pQsxcS1kGL4
	oG5j5hhnLLF38g3UkZhX50maYZJDCzEbTXhjtXxmBItoD3otl2gSztDrKRx2mXjteXp1
	InEpGDTDAr+ijbiO5ZuxpFq+c7OTHmvlCsQ0JwWz+0ImbLA5Lzb6gsX9nkHrwMx+N1Wl
	gvn0inFx3M08KiSRO3bt3D/MqpYWzGAbbN/ZC00hEF8pec/SAoVF5mUd/8FNr1vN8RJj
	EVJA==
Received: by 10.50.163.37 with SMTP id yf5mr4699078igb.40.1337249362138; Thu,
	17 May 2012 03:09:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.25.18 with HTTP; Thu, 17 May 2012 03:09:01 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 17 May 2012 13:09:01 +0300
Message-ID: <CAK18fxECi+PxHhW8pAm2URRE1ZF=h2_gEPXMvvioTQnhKGWYHw@mail.gmail.com>
To: openembedded <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmUSs05QTNoF9i4i1LIjU3CNh4PMmItNCEZ4ritF/oeTIVqXEsncNWPsEzr6BHcufppmTsi
Cc: Florin Sarbu <flocirel@gmail.com>
Subject: Linux-yocto 3.0 crashes at do_patch...
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
X-List-Received-Date: Thu, 17 May 2012 10:19:26 -0000
Content-Type: multipart/alternative; boundary=e89a8f646a8b34d59c04c038a1ab

--e89a8f646a8b34d59c04c038a1ab
Content-Type: text/plain; charset=ISO-8859-1

Today i ran into an issue that Florin Sarbu signaled sometime last week. It
seems like do_patch crashes while compiling linux 3.0:

ERROR: Logfile of failure stored in:
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/work/vexpressa9-poky-linux-gnueabi/linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4/temp/log.do_patch.10864
Log data follows:
| Branch meta-temp set up to track remote branch meta from origin.
| git reset --mixed 620917de59eeb934b9f8cf35cc2d95c1ac8ed0fc
| Deleted branch meta-temp (was 620917d).
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
line 434: yocto/standard/beagleboard-standard.scc: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
line 436: yocto/standard/beagleboard-standard.scc: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
line 437: yocto/standard/beagleboard-standard.scc: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
line 438: yocto/standard/beagleboard-standard.scc: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
line 441: yocto/standard/beagleboard-standard.scc: No such file or directory
| readlink: missing operand
| Try `readlink --help' for more information.
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmERROR: Function failed:
do_patch (see
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/work/vexpressa9-poky-linux-gnueabi/linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4/temp/log.do_patch.10864
for further information)
| p/sysroots/i686-linux/usr/bin/scc: line 399:
yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
|
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
line 399: yocto/standard/beagleboard-standard: No such file or directory
| ERROR. Could not find an excutable target for yocto/standard/base
| ERROR. Could not locate meta series for yocto/standard/beagleboard
| ERROR. Could not modify yocto/standard/base
NOTE: package
linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4:
task do_patch: Failed

I didn't have time to understand were is the source of this problem but i
suspect that is a sever-sided issue as this was reproducible yesterday even
if i didn't change anything in layers.

@g

--e89a8f646a8b34d59c04c038a1ab
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Today i ran into an issue that Florin Sarbu signaled sometime last week. It=
 seems like do_patch crashes while compiling linux 3.0:<div><br></div><div>=
<blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div><div>

ERROR: Logfile of failure stored in: /media/HDD-WRS/yocto/2012-05-10-discov=
ery-vea9/tmp/work/vexpressa9-poky-linux-gnueabi/linux-yocto-3.0.24+git1+34e=
0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc468=
1dd35-r4/temp/log.do_patch.10864</div>

<div>Log data follows:</div><div>| Branch meta-temp set up to track remote =
branch meta from origin.</div><div>| git reset --mixed 620917de59eeb934b9f8=
cf35cc2d95c1ac8ed0fc</div><div>| Deleted branch meta-temp (was 620917d).</d=
iv>

<div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-lin=
ux/usr/bin/updateme: line 434: yocto/standard/beagleboard-standard.scc: No =
such file or directory</div><div>| /media/HDD-WRS/yocto/2012-05-10-discover=
y-vea9/tmp/sysroots/i686-linux/usr/bin/updateme: line 436: yocto/standard/b=
eagleboard-standard.scc: No such file or directory</div>

<div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-lin=
ux/usr/bin/updateme: line 437: yocto/standard/beagleboard-standard.scc: No =
such file or directory</div><div>| /media/HDD-WRS/yocto/2012-05-10-discover=
y-vea9/tmp/sysroots/i686-linux/usr/bin/updateme: line 438: yocto/standard/b=
eagleboard-standard.scc: No such file or directory</div>

<div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-lin=
ux/usr/bin/updateme: line 441: yocto/standard/beagleboard-standard.scc: No =
such file or directory</div><div>| readlink: missing operand</div><div>

| Try `readlink --help&#39; for more information.</div><div>| /media/HDD-WR=
S/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc: line=
 399: yocto/standard/beagleboard-standard: No such file or directory</div>

<div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-lin=
ux/usr/bin/scc: line 399: yocto/standard/beagleboard-standard: No such file=
 or directory</div><div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tm=
p/sysroots/i686-linux/usr/bin/scc: line 399: yocto/standard/beagleboard-sta=
ndard: No such file or directory</div>

<div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-lin=
ux/usr/bin/scc: line 399: yocto/standard/beagleboard-standard: No such file=
 or directory</div><div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tm=
p/sysroots/i686-linux/usr/bin/scc: line 399: yocto/standard/beagleboard-sta=
ndard: No such file or directory</div>

<div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-lin=
ux/usr/bin/scc: line 399: yocto/standard/beagleboard-standard: No such file=
 or directory</div><div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tm=
p/sysroots/i686-linux/usr/bin/scc: line 399: yocto/standard/beagleboard-sta=
ndard: No such file or directory</div>

<div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-lin=
ux/usr/bin/scc: line 399: yocto/standard/beagleboard-standard: No such file=
 or directory</div><div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tm=
p/sysroots/i686-linux/usr/bin/scc: line 399: yocto/standard/beagleboard-sta=
ndard: No such file or directory</div>

<div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-lin=
ux/usr/bin/scc: line 399: yocto/standard/beagleboard-standard: No such file=
 or directory</div><div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tm=
p/sysroots/i686-linux/usr/bin/scc: line 399: yocto/standard/beagleboard-sta=
ndard: No such file or directory</div>

<div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-lin=
ux/usr/bin/scc: line 399: yocto/standard/beagleboard-standard: No such file=
 or directory</div><div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tm=
p/sysroots/i686-linux/usr/bin/scc: line 399: yocto/standard/beagleboard-sta=
ndard: No such file or directory</div>

<div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-lin=
ux/usr/bin/scc: line 399: yocto/standard/beagleboard-standard: No such file=
 or directory</div><div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tm=
p/sysroots/i686-linux/usr/bin/scc: line 399: yocto/standard/beagleboard-sta=
ndard: No such file or directory</div>

<div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-lin=
ux/usr/bin/scc: line 399: yocto/standard/beagleboard-standard: No such file=
 or directory</div><div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tm=
p/sysroots/i686-linux/usr/bin/scc: line 399: yocto/standard/beagleboard-sta=
ndard: No such file or directory</div>

<div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-lin=
ux/usr/bin/scc: line 399: yocto/standard/beagleboard-standard: No such file=
 or directory</div><div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tm=
p/sysroots/i686-linux/usr/bin/scc: line 399: yocto/standard/beagleboard-sta=
ndard: No such file or directory</div>

<div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmERROR: Function fai=
led: do_patch (see /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/work/=
vexpressa9-poky-linux-gnueabi/linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9e=
a99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4/temp/log.=
do_patch.10864 for further information)</div>

<div>| p/sysroots/i686-linux/usr/bin/scc: line 399: yocto/standard/beaglebo=
ard-standard: No such file or directory</div><div>| /media/HDD-WRS/yocto/20=
12-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc: line 399: yoct=
o/standard/beagleboard-standard: No such file or directory</div>

<div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-lin=
ux/usr/bin/scc: line 399: yocto/standard/beagleboard-standard: No such file=
 or directory</div><div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tm=
p/sysroots/i686-linux/usr/bin/scc: line 399: yocto/standard/beagleboard-sta=
ndard: No such file or directory</div>

<div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-lin=
ux/usr/bin/scc: line 399: yocto/standard/beagleboard-standard: No such file=
 or directory</div><div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tm=
p/sysroots/i686-linux/usr/bin/scc: line 399: yocto/standard/beagleboard-sta=
ndard: No such file or directory</div>

<div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-lin=
ux/usr/bin/scc: line 399: yocto/standard/beagleboard-standard: No such file=
 or directory</div><div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tm=
p/sysroots/i686-linux/usr/bin/scc: line 399: yocto/standard/beagleboard-sta=
ndard: No such file or directory</div>

<div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-lin=
ux/usr/bin/scc: line 399: yocto/standard/beagleboard-standard: No such file=
 or directory</div><div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tm=
p/sysroots/i686-linux/usr/bin/scc: line 399: yocto/standard/beagleboard-sta=
ndard: No such file or directory</div>

<div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-lin=
ux/usr/bin/scc: line 399: yocto/standard/beagleboard-standard: No such file=
 or directory</div><div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tm=
p/sysroots/i686-linux/usr/bin/scc: line 399: yocto/standard/beagleboard-sta=
ndard: No such file or directory</div>

<div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-lin=
ux/usr/bin/scc: line 399: yocto/standard/beagleboard-standard: No such file=
 or directory</div><div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tm=
p/sysroots/i686-linux/usr/bin/scc: line 399: yocto/standard/beagleboard-sta=
ndard: No such file or directory</div>

<div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-lin=
ux/usr/bin/scc: line 399: yocto/standard/beagleboard-standard: No such file=
 or directory</div><div>| /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tm=
p/sysroots/i686-linux/usr/bin/scc: line 399: yocto/standard/beagleboard-sta=
ndard: No such file or directory</div>

<div>| ERROR. Could not find an excutable target for yocto/standard/base</d=
iv><div>| ERROR. Could not locate meta series for yocto/standard/beagleboar=
d</div><div>| ERROR. Could not modify yocto/standard/base</div><div>NOTE: p=
ackage linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6=
b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4: task do_patch: Failed</div>

</div><div><br></div></blockquote>I didn&#39;t have time to understand were=
 is the source of this problem but i suspect that is a sever-sided issue as=
 this was reproducible yesterday even if i didn&#39;t change anything in la=
yers.</div>

<div><br></div><div>@g
</div>

--e89a8f646a8b34d59c04c038a1ab--

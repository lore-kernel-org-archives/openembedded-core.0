Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 377C671B31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 15:50:22 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id u138so4797788wmu.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 08:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F0ElL2OM3uQwjj8xnLSCGj2JSAi9B6FDfKktBDTB0BI=;
	b=Osb2CZvMHMAYkH028ARazRbh1+y+3OGOqgI1OBUps/3J+L13xgXDss9XAj3orjkdWM
	ZyxJvqUPBhYLIx9Sg7XP9++JFBjB6DG9WxewQkp0cXI7iX1+Tnl+nQst0Sv56JOcZRzo
	4PQUIRINFHIPtjqnhQP5j/p6LQO6dn1INCeHdHiJOyW02/p63QYCEfeK4YCToTbO0RyW
	CP48za/WCj9XBI4gKIAX0b5ZBpUReGwPYJuvTu/GN2nA/CASQG5WEtRwG8mIgSKij7cX
	qZEDblUZawdBOeUQCAZpiMLqaOsCkrmwzO5QqavKep9aSzx8xgKk8l11UVsYUXx9SkrS
	mqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F0ElL2OM3uQwjj8xnLSCGj2JSAi9B6FDfKktBDTB0BI=;
	b=s7ger/niuNJSTk3bRl49ErsQhLBI3OUAV6eag+d5LEFbx6FAhgaQod8bt6S7sBRU23
	zrxFfhEbDFSOau8JXXP+8Fo7npV7Hj1qefbPs4pVZygDQ9083JIXiT25oSRYNJC1Gr76
	/hnLMSOsaRd4i1PpF3kTESbnJf52x1MsmWvQ5SqEqBzm/R/4RWt+ZDfSHIdLuS1wqP2V
	S++NeSQ9e502UJJBGr6eYGOThOT8NyE9NlmIHKf59axX/AloEPostYehqjV9YWPPQarg
	5GQckTLx9ZQEHLgHiDZp3TETyZlaBvgUowFwohQ+D/2cEeMyXblMSBCuoOLG0RKqMwmB
	7W9w==
X-Gm-Message-State: AMCzsaXBqNf51mXQnaCJ9sBrVuVYtOaCqbxEQyvNTTEKSMCG8TCyJ4kn
	K6KP7iXFYUBr89si3BHKg3opmRXEMyDzwtT1qaTOzw==
X-Google-Smtp-Source: ABhQp+QxD624fAGJ73rOr/DpXWayKyFtZu/OG5IIz8uQKXq8dxghD/ou8lR8hFZ1lWy2YtPxHQKwwuWFA6xzDlWUThA=
X-Received: by 10.223.134.68 with SMTP id 4mr1089989wrw.67.1508169023462; Mon,
	16 Oct 2017 08:50:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Mon, 16 Oct 2017 08:50:22 -0700 (PDT)
In-Reply-To: <CAJTo0LbKoM94aUnrQ99iF470AE2cJ_Q0LgGOEp8VH-TzdwYu0Q@mail.gmail.com>
References: <20170913204659.1919-1-Martin.Jansa@gmail.com>
	<20170919151851.25093-1-Martin.Jansa@gmail.com>
	<CA+chaQeokk6Ao9QcRoC1_jb+HzOAn0hOyAK7NRxo4yT_38f1Sw@mail.gmail.com>
	<CAJTo0LbKoM94aUnrQ99iF470AE2cJ_Q0LgGOEp8VH-TzdwYu0Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 16 Oct 2017 17:50:22 +0200
Message-ID: <CA+chaQe8n2xuoz2nD207Gaw-oEw2PiqzYh5_nAFTGXJeO2kDTw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCHv2] insane.bbclass: Add do_qa_pseudo function to check for common errors listed in pseudo.log
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
X-List-Received-Date: Mon, 16 Oct 2017 15:50:23 -0000
Content-Type: multipart/alternative; boundary="001a1149243ae7a3f1055babf640"

--001a1149243ae7a3f1055babf640
Content-Type: text/plain; charset="UTF-8"

Yes, package-output.lock is very often the cause for "^inode mismatch":

martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep '^inode mismatch' | wc
-l
1485
martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep '^inode mismatch' |
grep package-output.lock | wc -l
1168

log.do_install also causes "^inode mismatch" in many cases:

martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep '^inode mismatch' |
grep -v package-output.lock | wc -l
317
martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep '^inode mismatch' |
grep -v package-output.lock | grep temp/log.do_install | wc -l
309

That leaves only couple other files:
martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep '^inode mismatch' |
grep -v package-output.lock | grep -v temp/log.do_install
inode mismatch:
'/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtbase/5.9.2+gitAUTOINC+73573fce29-r0/image/usr/include/qt5/QtNetwork/qt_temp.rhjRGj'
ino 691255 in db, 691256 in request.
inode mismatch: '/home/jenkins/.python-history' ino 1066494 in db, 1066493
in request.
inode mismatch: '/home/jenkins/.python-history' ino 1066494 in db, 1066493
in request.
inode mismatch: '/home/jenkins/.python-history' ino 1066729 in db, 1062665
in request.
inode mismatch: '/home/jenkins/.python-history' ino 1066729 in db, 1062665
in request.
inode mismatch:
'/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qt3d/5.9.2+gitAUTOINC+9d8c9ada16-r0/image/usr/include/qt5/Qt3DInput/qt_temp.rhjRGj'
ino 520536 in db, 520539 in request.
inode mismatch:
'/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libqofono/0.87+gitrAUTOINC+54435de3be-r0/image/usr/lib/libqofono-qt5/tests/qt_temp.rhjRGj'
ino 876399 in db, 876404 in request.
inode mismatch:
'/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libqofono/0.87+gitrAUTOINC+54435de3be-r0/image/usr/lib/libqofono-qt5/tests/qt_temp.rhjRGj'
ino 876404 in db, 876408 in request.

Similarly with "creat for", but there is more wide selection of files
triggering this one:
martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep -v
'inode mismatch' | grep 'creat for.* replaces'  | wc -l
1771
martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep -v
'inode mismatch' | grep 'creat for'  | grep package-output.lock | wc -l
198

for "creat for" the log.do_install appears only twice, but various
temp/run.* files are quite common cause:
martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep -v
'inode mismatch' | grep 'creat for.* replaces'  | grep temp/run | wc -l
294

pm-qa is triggering this on many files,
e.g. /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/pm-qa/0.5.2-r0/image/usr/bin/cpuhotplug_07.sh
martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep -v
'inode mismatch' | grep 'creat for.* replaces'  | grep temp/run -v  | grep
pm-qa | wc -l
229

martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep -v
'inode mismatch' | grep 'creat for.* replaces'  | grep temp/run -v  | grep
pm-qa | grep cpuhotplug_05.sh
creat for
'/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/pm-qa/0.5.2-r0/image/usr/bin/cpuhotplug_05.sh'
replaces existing 902737 ['NAMELESS FILE'].
creat for
'/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/pm-qa/0.5.2-r0/image/usr/bin/cpuhotplug_05.sh'
replaces existing 1264757 ['NAMELESS FILE'].
creat for
'/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/pm-qa/0.5.2-r0/image/usr/bin/cpuhotplug_05.sh'
replaces existing 976636 ['NAMELESS FILE'].
creat for
'/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/pm-qa/0.5.2-r0/image/usr/bin/cpuhotplug_05.sh'
replaces existing 576004 ['NAMELESS FILE'].
creat for
'/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/pm-qa/0.5.2-r0/image/usr/bin/cpuhotplug_05.sh'
replaces existing 986226 ['NAMELESS FILE'].

then stamps files
martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep -v
'inode mismatch' | grep 'creat for.* replaces'  | grep temp/run -v  | grep
-v pm-qa | grep -v package-output.lock | grep glibc/stamps | wc -l
130

so it looks pretty rancom, but most of these errors are replacing 'NAMELESS
FILE'
martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep -v
'inode mismatch' | grep 'creat for.* replaces' | grep 'NAMELESS FILE' | wc
-l
1632

which leaves only 139 other files:
martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep -v
'inode mismatch' | grep 'creat for.* replaces' | grep 'replaces.*NAMELESS
FILE' -v | wc -l
139

from which couple of them are package-output.lock again:
martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep -v
'inode mismatch' | grep 'creat for.* replaces' | grep 'replaces.*NAMELESS
FILE' -v | grep replaces.*package-output.lock | wc -l
31

and then random selection of builds, most of them from glibc-locale:
martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep -v
'inode mismatch' | grep 'creat for.* replaces' | grep 'replaces.*NAMELESS
FILE' -v | grep replaces.*package-output.lock -v | grep glibc-locale | wc -l
34
martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep -v
'inode mismatch' | grep 'creat for.* replaces' | grep 'replaces.*NAMELESS
FILE' -v | grep replaces.*package-output.lock -v | grep llvm | wc -l
3
martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep -v
'inode mismatch' | grep 'creat for.* replaces' | grep 'replaces.*NAMELESS
FILE' -v | grep replaces.*package-output.lock -v | grep linux-yocto | wc -l
7

"^creat ignored" is again mostly 195/202 package-output.lock:

martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep -v
'inode mismatch' | grep -v 'creat for.* replaces' | grep -v indicates |
grep -v '^Setup complete' | grep -v '^db cleanup' | grep -v '^pid ' | grep
-v '^ \[' | grep -v '^memory-to-file' | grep -v '^debug_logfile: ' | grep
'^creat ignored ' | wc -l
202
martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep -v
'inode mismatch' | grep -v 'creat for.* replaces' | grep -v indicates |
grep -v '^Setup complete' | grep -v '^db cleanup' | grep -v '^pid ' | grep
-v '^ \[' | grep -v '^memory-to-file' | grep -v '^debug_logfile: ' | grep
'^creat ignored ' | grep package-output.lock | wc -l
195
martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep -v
'inode mismatch' | grep -v 'creat for.* replaces' | grep -v indicates |
grep -v '^Setup complete' | grep -v '^db cleanup' | grep -v '^pid ' | grep
-v '^ \[' | grep -v '^memory-to-file' | grep -v '^debug_logfile: ' | grep
'^creat ignored ' | grep package-output.lock -v
creat ignored for existing file
'/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtbase/5.9.2+gitAUTOINC+73573fce29-r0/image/usr/include/qt5/QtNetwork/qt_temp.rhjRGj'.
creat ignored for existing file
'/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qt3d/5.9.2+gitAUTOINC+9d8c9ada16-r0/image/usr/include/qt5/Qt3DInput/qt_temp.rhjRGj'.
creat ignored for existing file
'/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libqofono/0.87+gitrAUTOINC+54435de3be-r0/image/usr/lib/libqofono-qt5/tests/qt_temp.rhjRGj'.
creat ignored for existing file
'/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libqofono/0.87+gitrAUTOINC+54435de3be-r0/image/usr/lib/libqofono-qt5/tests/qt_temp.rhjRGj'.
creat ignored for existing file
'/home/jenkins/oe/world/shr-core/tmp-glibc/sstate-control/index-armv5te.lock'.
creat ignored for existing file
'/home/jenkins/oe/world/shr-core/tmp-glibc/sstate-control/index-armv5te.lock'.
creat ignored for existing file
'/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/usermode/1.111-r0/build/po/.intltool-merge-cache'.

^dir err: also happens a lot in the log files where other issues appear as
well (because the QA check isn't triggered by this one):
martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep -v
'inode mismatch' | grep -v 'creat for.* replaces' | grep -v indicates |
grep -v '^Setup complete' | grep -v '^db cleanup' | grep -v '^pid ' | grep
-v '^ \[' | grep -v '^memory-to-file' | grep -v '^debug_logfile: ' | grep
'^creat ignored ' -v | grep '^dir err ' | wc -l
744

couple ^symlink err:
martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep -v
'inode mismatch' | grep -v 'creat for.* replaces' | grep -v indicates |
grep -v '^Setup complete' | grep -v '^db cleanup' | grep -v '^pid ' | grep
-v '^ \[' | grep -v '^memory-to-file' | grep -v '^debug_logfile: ' | grep
'^creat ignored ' -v | grep '^dir err ' -v | grep '^symlink err' | wc -l
223

martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep -v
'inode mismatch' | grep -v 'creat for.* replaces' | grep -v indicates |
grep -v '^Setup complete' | grep -v '^db cleanup' | grep -v '^pid ' | grep
-v '^ \[' | grep -v '^memory-to-file' | grep -v '^debug_logfile: ' | grep
'^creat ignored ' -v | grep '^dir err ' -v | grep '^symlink err' -v | grep
'^symlink mismatch: ' | wc -l
309

I fail to see useful patterns in this, maybe fixing the package-output.lock
might help to filter the noise a bit.

On Mon, Oct 16, 2017 at 5:10 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 16 October 2017 at 16:01, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> The world builds with this check applied show that *a lot* of components
>> report one of these errors and often many of errors, the most complete logs
>> from last couple days:
>>
>
> A lot of the errors in my logs were due to package-output.lock being
> accessed inside/outside pseudo context.  Can you grep all of your logs and
> collate some common patterns?
>
> Ross
>

--001a1149243ae7a3f1055babf640
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes, package-output.lock is very often the cause for =
&quot;^inode mismatch&quot;:</div><div><br></div><div>martin@jama ~/pseudo-=
qa $ cat log.world.qemu* | grep &#39;^inode mismatch&#39; | wc -l</div><div=
>1485</div><div>martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep &#39;^=
inode mismatch&#39; | grep package-output.lock | wc -l</div><div>1168</div>=
<div><br></div><div>log.do_install also causes &quot;^inode mismatch&quot; =
in many cases:</div><div><br></div><div><div>martin@jama ~/pseudo-qa $ cat =
log.world.qemu* | grep &#39;^inode mismatch&#39; | grep -v package-output.l=
ock | wc -l</div><div>317</div><div>martin@jama ~/pseudo-qa $ cat log.world=
.qemu* | grep &#39;^inode mismatch&#39; | grep -v package-output.lock | gre=
p temp/log.do_install | wc -l</div><div>309</div></div><div><br></div><div>=
That leaves only couple other files:</div><div><div>martin@jama ~/pseudo-qa=
 $ cat log.world.qemu* | grep &#39;^inode mismatch&#39; | grep -v package-o=
utput.lock | grep -v temp/log.do_install</div><div>inode mismatch: &#39;/ho=
me/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtbase=
/5.9.2+gitAUTOINC+73573fce29-r0/image/usr/include/qt5/QtNetwork/qt_temp.rhj=
RGj&#39; ino 691255 in db, 691256 in request.</div><div>inode mismatch: &#3=
9;/home/jenkins/.python-history&#39; ino 1066494 in db, 1066493 in request.=
</div><div>inode mismatch: &#39;/home/jenkins/.python-history&#39; ino 1066=
494 in db, 1066493 in request.</div><div>inode mismatch: &#39;/home/jenkins=
/.python-history&#39; ino 1066729 in db, 1062665 in request.</div><div>inod=
e mismatch: &#39;/home/jenkins/.python-history&#39; ino 1066729 in db, 1062=
665 in request.</div><div>inode mismatch: &#39;/home/jenkins/oe/world/shr-c=
ore/tmp-glibc/work/armv5te-oe-linux-gnueabi/qt3d/5.9.2+gitAUTOINC+9d8c9ada1=
6-r0/image/usr/include/qt5/Qt3DInput/qt_temp.rhjRGj&#39; ino 520536 in db, =
520539 in request.</div><div>inode mismatch: &#39;/home/jenkins/oe/world/sh=
r-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libqofono/0.87+gitrAUTOINC+5=
4435de3be-r0/image/usr/lib/libqofono-qt5/tests/qt_temp.rhjRGj&#39; ino 8763=
99 in db, 876404 in request.</div><div>inode mismatch: &#39;/home/jenkins/o=
e/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libqofono/0.87+git=
rAUTOINC+54435de3be-r0/image/usr/lib/libqofono-qt5/tests/qt_temp.rhjRGj&#39=
; ino 876404 in db, 876408 in request.</div></div><div><br></div><div>Simil=
arly with &quot;creat for&quot;, but there is more wide selection of files =
triggering this one:</div><div><div>martin@jama ~/pseudo-qa $ cat log.world=
.qemu* | grep -v &quot;grep -e&quot; | grep -v &#39;inode mismatch&#39; | g=
rep &#39;creat for.* replaces&#39;=C2=A0 | wc -l</div><div>1771</div></div>=
<div>martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v &quot;grep -e&=
quot; | grep -v &#39;inode mismatch&#39; | grep &#39;creat for&#39;=C2=A0 |=
 grep package-output.lock | wc -l<br></div><div><div>198</div></div><div><b=
r></div><div>for &quot;creat for&quot; the log.do_install appears only twic=
e, but various temp/run.* files are quite common cause:</div><div><div>mart=
in@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v &quot;grep -e&quot; | g=
rep -v &#39;inode mismatch&#39; | grep &#39;creat for.* replaces&#39;=C2=A0=
 | grep temp/run | wc -l</div><div>294</div></div><div><br></div><div>pm-qa=
 is triggering this on many files, e.g.=C2=A0/home/jenkins/oe/world/shr-cor=
e/tmp-glibc/work/core2-64-oe-linux/pm-qa/0.5.2-r0/image/usr/bin/cpuhotplug_=
07.sh</div><div><div>martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -=
v &quot;grep -e&quot; | grep -v &#39;inode mismatch&#39; | grep &#39;creat =
for.* replaces&#39;=C2=A0 | grep temp/run -v=C2=A0 | grep pm-qa | wc -l</di=
v><div>229</div></div><div><br></div><div><div>martin@jama ~/pseudo-qa $ ca=
t log.world.qemu* | grep -v &quot;grep -e&quot; | grep -v &#39;inode mismat=
ch&#39; | grep &#39;creat for.* replaces&#39;=C2=A0 | grep temp/run -v=C2=
=A0 | grep pm-qa | grep cpuhotplug_05.sh</div><div>creat for &#39;/home/jen=
kins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/pm-qa/0.5.2-=
r0/image/usr/bin/cpuhotplug_05.sh&#39; replaces existing 902737 [&#39;NAMEL=
ESS FILE&#39;].</div><div>creat for &#39;/home/jenkins/oe/world/shr-core/tm=
p-glibc/work/armv5te-oe-linux-gnueabi/pm-qa/0.5.2-r0/image/usr/bin/cpuhotpl=
ug_05.sh&#39; replaces existing 1264757 [&#39;NAMELESS FILE&#39;].</div><di=
v>creat for &#39;/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-lin=
ux/pm-qa/0.5.2-r0/image/usr/bin/cpuhotplug_05.sh&#39; replaces existing 976=
636 [&#39;NAMELESS FILE&#39;].</div><div>creat for &#39;/home/jenkins/oe/wo=
rld/shr-core/tmp-glibc/work/core2-64-oe-linux/pm-qa/0.5.2-r0/image/usr/bin/=
cpuhotplug_05.sh&#39; replaces existing 576004 [&#39;NAMELESS FILE&#39;].</=
div><div>creat for &#39;/home/jenkins/oe/world/shr-core/tmp-glibc/work/core=
2-64-oe-linux/pm-qa/0.5.2-r0/image/usr/bin/cpuhotplug_05.sh&#39; replaces e=
xisting 986226 [&#39;NAMELESS FILE&#39;].</div></div><div><br></div><div>th=
en stamps files</div><div><div>martin@jama ~/pseudo-qa $ cat log.world.qemu=
* | grep -v &quot;grep -e&quot; | grep -v &#39;inode mismatch&#39; | grep &=
#39;creat for.* replaces&#39;=C2=A0 | grep temp/run -v=C2=A0 | grep -v pm-q=
a | grep -v package-output.lock | grep glibc/stamps | wc -l</div><div>130</=
div></div><div><br></div><div>so it looks pretty rancom, but most of these =
errors are replacing &#39;NAMELESS FILE&#39;</div><div><div>martin@jama ~/p=
seudo-qa $ cat log.world.qemu* | grep -v &quot;grep -e&quot; | grep -v &#39=
;inode mismatch&#39; | grep &#39;creat for.* replaces&#39; | grep &#39;NAME=
LESS FILE&#39; | wc -l</div><div>1632</div></div><div><br></div><div>which =
leaves only 139 other files:</div><div><div>martin@jama ~/pseudo-qa $ cat l=
og.world.qemu* | grep -v &quot;grep -e&quot; | grep -v &#39;inode mismatch&=
#39; | grep &#39;creat for.* replaces&#39; | grep &#39;replaces.*NAMELESS F=
ILE&#39; -v | wc -l</div><div>139</div></div><div><br></div><div>from which=
 couple of them are package-output.lock again:</div><div><div>martin@jama ~=
/pseudo-qa $ cat log.world.qemu* | grep -v &quot;grep -e&quot; | grep -v &#=
39;inode mismatch&#39; | grep &#39;creat for.* replaces&#39; | grep &#39;re=
places.*NAMELESS FILE&#39; -v | grep replaces.*package-output.lock | wc -l<=
/div><div>31</div></div><div><br></div><div>and then random selection of bu=
ilds, most of them from glibc-locale:</div><div><div>martin@jama ~/pseudo-q=
a $ cat log.world.qemu* | grep -v &quot;grep -e&quot; | grep -v &#39;inode =
mismatch&#39; | grep &#39;creat for.* replaces&#39; | grep &#39;replaces.*N=
AMELESS FILE&#39; -v | grep replaces.*package-output.lock -v | grep glibc-l=
ocale | wc -l<br></div><div>34</div><div>martin@jama ~/pseudo-qa $ cat log.=
world.qemu* | grep -v &quot;grep -e&quot; | grep -v &#39;inode mismatch&#39=
; | grep &#39;creat for.* replaces&#39; | grep &#39;replaces.*NAMELESS FILE=
&#39; -v | grep replaces.*package-output.lock -v | grep llvm | wc -l</div><=
div>3</div></div><div><div>martin@jama ~/pseudo-qa $ cat log.world.qemu* | =
grep -v &quot;grep -e&quot; | grep -v &#39;inode mismatch&#39; | grep &#39;=
creat for.* replaces&#39; | grep &#39;replaces.*NAMELESS FILE&#39; -v | gre=
p replaces.*package-output.lock -v | grep linux-yocto | wc -l</div><div>7</=
div></div><div><br></div><div>&quot;^creat ignored&quot; is again mostly 19=
5/202 package-output.lock:</div><div><br></div><div><div>martin@jama ~/pseu=
do-qa $ cat log.world.qemu* | grep -v &quot;grep -e&quot; | grep -v &#39;in=
ode mismatch&#39; | grep -v &#39;creat for.* replaces&#39; | grep -v indica=
tes | grep -v &#39;^Setup complete&#39; | grep -v &#39;^db cleanup&#39; | g=
rep -v &#39;^pid &#39; | grep -v &#39;^ \[&#39; | grep -v &#39;^memory-to-f=
ile&#39; | grep -v &#39;^debug_logfile: &#39; | grep &#39;^creat ignored &#=
39; | wc -l</div><div>202</div><div>martin@jama ~/pseudo-qa $ cat log.world=
.qemu* | grep -v &quot;grep -e&quot; | grep -v &#39;inode mismatch&#39; | g=
rep -v &#39;creat for.* replaces&#39; | grep -v indicates | grep -v &#39;^S=
etup complete&#39; | grep -v &#39;^db cleanup&#39; | grep -v &#39;^pid &#39=
; | grep -v &#39;^ \[&#39; | grep -v &#39;^memory-to-file&#39; | grep -v &#=
39;^debug_logfile: &#39; | grep &#39;^creat ignored &#39; | grep package-ou=
tput.lock | wc -l</div><div>195</div><div>martin@jama ~/pseudo-qa $ cat log=
.world.qemu* | grep -v &quot;grep -e&quot; | grep -v &#39;inode mismatch&#3=
9; | grep -v &#39;creat for.* replaces&#39; | grep -v indicates | grep -v &=
#39;^Setup complete&#39; | grep -v &#39;^db cleanup&#39; | grep -v &#39;^pi=
d &#39; | grep -v &#39;^ \[&#39; | grep -v &#39;^memory-to-file&#39; | grep=
 -v &#39;^debug_logfile: &#39; | grep &#39;^creat ignored &#39; | grep pack=
age-output.lock -v=C2=A0</div><div>creat ignored for existing file &#39;/ho=
me/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtbase=
/5.9.2+gitAUTOINC+73573fce29-r0/image/usr/include/qt5/QtNetwork/qt_temp.rhj=
RGj&#39;.</div><div>creat ignored for existing file &#39;/home/jenkins/oe/w=
orld/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qt3d/5.9.2+gitAUTOINC=
+9d8c9ada16-r0/image/usr/include/qt5/Qt3DInput/qt_temp.rhjRGj&#39;.</div><d=
iv>creat ignored for existing file &#39;/home/jenkins/oe/world/shr-core/tmp=
-glibc/work/armv5te-oe-linux-gnueabi/libqofono/0.87+gitrAUTOINC+54435de3be-=
r0/image/usr/lib/libqofono-qt5/tests/qt_temp.rhjRGj&#39;.</div><div>creat i=
gnored for existing file &#39;/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/armv5te-oe-linux-gnueabi/libqofono/0.87+gitrAUTOINC+54435de3be-r0/image/u=
sr/lib/libqofono-qt5/tests/qt_temp.rhjRGj&#39;.</div><div>creat ignored for=
 existing file &#39;/home/jenkins/oe/world/shr-core/tmp-glibc/sstate-contro=
l/index-armv5te.lock&#39;.</div><div>creat ignored for existing file &#39;/=
home/jenkins/oe/world/shr-core/tmp-glibc/sstate-control/index-armv5te.lock&=
#39;.</div><div>creat ignored for existing file &#39;/home/jenkins/oe/world=
/shr-core/tmp-glibc/work/i586-oe-linux/usermode/1.111-r0/build/po/.intltool=
-merge-cache&#39;.</div></div><div><br></div><div>^dir err: also happens a =
lot in the log files where other issues appear as well (because the QA chec=
k isn&#39;t triggered by this one):</div><div><div>martin@jama ~/pseudo-qa =
$ cat log.world.qemu* | grep -v &quot;grep -e&quot; | grep -v &#39;inode mi=
smatch&#39; | grep -v &#39;creat for.* replaces&#39; | grep -v indicates | =
grep -v &#39;^Setup complete&#39; | grep -v &#39;^db cleanup&#39; | grep -v=
 &#39;^pid &#39; | grep -v &#39;^ \[&#39; | grep -v &#39;^memory-to-file&#3=
9; | grep -v &#39;^debug_logfile: &#39; | grep &#39;^creat ignored &#39; -v=
 | grep &#39;^dir err &#39; | wc -l</div><div>744</div></div><div><br></div=
><div>couple ^symlink err:</div><div><div>martin@jama ~/pseudo-qa $ cat log=
.world.qemu* | grep -v &quot;grep -e&quot; | grep -v &#39;inode mismatch&#3=
9; | grep -v &#39;creat for.* replaces&#39; | grep -v indicates | grep -v &=
#39;^Setup complete&#39; | grep -v &#39;^db cleanup&#39; | grep -v &#39;^pi=
d &#39; | grep -v &#39;^ \[&#39; | grep -v &#39;^memory-to-file&#39; | grep=
 -v &#39;^debug_logfile: &#39; | grep &#39;^creat ignored &#39; -v | grep &=
#39;^dir err &#39; -v | grep &#39;^symlink err&#39; | wc -l</div><div>223</=
div></div><div><br></div><div><div>martin@jama ~/pseudo-qa $ cat log.world.=
qemu* | grep -v &quot;grep -e&quot; | grep -v &#39;inode mismatch&#39; | gr=
ep -v &#39;creat for.* replaces&#39; | grep -v indicates | grep -v &#39;^Se=
tup complete&#39; | grep -v &#39;^db cleanup&#39; | grep -v &#39;^pid &#39;=
 | grep -v &#39;^ \[&#39; | grep -v &#39;^memory-to-file&#39; | grep -v &#3=
9;^debug_logfile: &#39; | grep &#39;^creat ignored &#39; -v | grep &#39;^di=
r err &#39; -v | grep &#39;^symlink err&#39; -v | grep &#39;^symlink mismat=
ch: &#39; | wc -l</div><div>309</div></div><div><br></div><div>I fail to se=
e useful patterns in this, maybe fixing the package-output.lock might help =
to filter the noise a bit.</div><div><br></div><div class=3D"gmail_extra"><=
div class=3D"gmail_quote">On Mon, Oct 16, 2017 at 5:10 PM, Burton, Ross <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blan=
k">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr"><span class=3D"gmail-">On 16 Octo=
ber 2017 at 16:01, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:mar=
tin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span=
> wrote:<br></span><div class=3D"gmail_extra"><div class=3D"gmail_quote"><s=
pan class=3D"gmail-"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr">The world builds with this check applied show that *a lot* of =
components report one of these errors and often many of errors, the most co=
mplete logs from last couple days:</div></blockquote><div><br></div></span>=
<div>A lot of the errors in my logs were due to package-output.lock being a=
ccessed inside/outside pseudo context.=C2=A0 Can you grep all of your logs =
and collate some common patterns?</div><span class=3D"gmail-HOEnZb"><font c=
olor=3D"#888888"><div><br></div><div>Ross</div></font></span></div></div></=
div>
</blockquote></div><br></div></div>

--001a1149243ae7a3f1055babf640--

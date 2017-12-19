Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 67CFF78438
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 16:09:20 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id i11so4659233wmf.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 08:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SA4tSrk3uP+755wBpqz/YkN6dyxKM1wnd+xn5HxCbjE=;
	b=kq2T+Z3Hm+5Tz/OHCXygKbJ0xllfR0UrfequwwJWgSvb0Vmguc0dEeRSru5Nums15J
	7S6qYyIZrUQzqZV32GZ3isRgt7d6Sk/S1OOOUH48PK7J7dbpJ+kfI7IxHvOevuhdKvlS
	ilNhjIuBaDhAO8fM2fgfEEkSoNMjDA0lxTCuPcUT+NKU8SDptNEvw4eJZzcXVYEXw9QL
	0a96bEZlxWpBLgU7ZENBSJS21p6w8mU/uysshZ0KdErgfiZH/0fiotHSc5bJ02G+aWt5
	6A0pyH9y7IifbN9/3rNcQPIa3e1DvLq34VcMKrYiolHPJDO0gYtr0P17+chDp8eynSa5
	rXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SA4tSrk3uP+755wBpqz/YkN6dyxKM1wnd+xn5HxCbjE=;
	b=PF3tJUEkuC3rCDx+K2FedHtjrBzynn4PjPpp0KiwYAtpSWajYDCysQ9dp0HDgTpyZb
	IT+PzmtuE5N/ZKaHbmU+FbdeJeLbqBbnr/w+H9PsCGZk7+22bYP/PLgcrHCLYue4GNAc
	NR8+1vj842Rxw7/WfK35zvIoqsgBapZvcijagwS4EClUR3vsGqg5N4hq1210hTxAhfgZ
	3w9Q7MlgttaYTO38bduJFlHpy/Lvw4jRxRIDjMyviDCveiANsS4UBr9QPbnpjKoQggmd
	dBg5HLEeVO2lM68Z6+R2Z7E+yYNHoM4zS6R1rLRBAqpCzuD7LDTf9tvGx9YQm0m2rpdd
	o9QA==
X-Gm-Message-State: AKGB3mJN+yA3Bl9KZx+4WyQr+Wjs08sSbygeRGWNiFiPwCCgMom0qTKd
	x9WeMIyvbmURTZwZHzcVttGmLfL2B7gp4pZDTCA=
X-Google-Smtp-Source: ACJfBouOwsORzWRPs9qvdZ9KZwMR4w0wHVC4NOGuyOW0QT2cAFRldzBmt+M+17jxJmQmJ3Cw8f9/1LQtU4fuQvGso9Y=
X-Received: by 10.28.27.206 with SMTP id b197mr4315426wmb.96.1513699761081;
	Tue, 19 Dec 2017 08:09:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.122.19 with HTTP; Tue, 19 Dec 2017 08:09:20 -0800 (PST)
In-Reply-To: <CA+chaQe8n2xuoz2nD207Gaw-oEw2PiqzYh5_nAFTGXJeO2kDTw@mail.gmail.com>
References: <20170913204659.1919-1-Martin.Jansa@gmail.com>
	<20170919151851.25093-1-Martin.Jansa@gmail.com>
	<CA+chaQeokk6Ao9QcRoC1_jb+HzOAn0hOyAK7NRxo4yT_38f1Sw@mail.gmail.com>
	<CAJTo0LbKoM94aUnrQ99iF470AE2cJ_Q0LgGOEp8VH-TzdwYu0Q@mail.gmail.com>
	<CA+chaQe8n2xuoz2nD207Gaw-oEw2PiqzYh5_nAFTGXJeO2kDTw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 19 Dec 2017 17:09:20 +0100
Message-ID: <CA+chaQe2rHG77WDSE=q1xpLpt5FmbMG-hwSkhrsP9oVUx03y-Q@mail.gmail.com>
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
X-List-Received-Date: Tue, 19 Dec 2017 16:09:20 -0000
Content-Type: multipart/alternative; boundary="001a114b3eb28e50cd0560b3b07c"

--001a114b3eb28e50cd0560b3b07c
Content-Type: text/plain; charset="UTF-8"

I've created
https://bugzilla.yoctoproject.org/show_bug.cgi?id=12434
to track this issue.

I get this QA error now 100% reproducible when the "right" do_package
sstate archive is being used, but still haven't found the root cause (aka
why/how this bad sstate archive was created in first place).

On Mon, Oct 16, 2017 at 5:50 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Yes, package-output.lock is very often the cause for "^inode mismatch":
>
> martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep '^inode mismatch' |
> wc -l
> 1485
> martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep '^inode mismatch' |
> grep package-output.lock | wc -l
> 1168
>
> log.do_install also causes "^inode mismatch" in many cases:
>
> martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep '^inode mismatch' |
> grep -v package-output.lock | wc -l
> 317
> martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep '^inode mismatch' |
> grep -v package-output.lock | grep temp/log.do_install | wc -l
> 309
>
> That leaves only couple other files:
> martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep '^inode mismatch' |
> grep -v package-output.lock | grep -v temp/log.do_install
> inode mismatch: '/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-
> oe-linux-gnueabi/qtbase/5.9.2+gitAUTOINC+73573fce29-r0/
> image/usr/include/qt5/QtNetwork/qt_temp.rhjRGj' ino 691255 in db, 691256
> in request.
> inode mismatch: '/home/jenkins/.python-history' ino 1066494 in db,
> 1066493 in request.
> inode mismatch: '/home/jenkins/.python-history' ino 1066494 in db,
> 1066493 in request.
> inode mismatch: '/home/jenkins/.python-history' ino 1066729 in db,
> 1062665 in request.
> inode mismatch: '/home/jenkins/.python-history' ino 1066729 in db,
> 1062665 in request.
> inode mismatch: '/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-
> oe-linux-gnueabi/qt3d/5.9.2+gitAUTOINC+9d8c9ada16-r0/
> image/usr/include/qt5/Qt3DInput/qt_temp.rhjRGj' ino 520536 in db, 520539
> in request.
> inode mismatch: '/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-
> oe-linux-gnueabi/libqofono/0.87+gitrAUTOINC+54435de3be-r0/
> image/usr/lib/libqofono-qt5/tests/qt_temp.rhjRGj' ino 876399 in db,
> 876404 in request.
> inode mismatch: '/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-
> oe-linux-gnueabi/libqofono/0.87+gitrAUTOINC+54435de3be-r0/
> image/usr/lib/libqofono-qt5/tests/qt_temp.rhjRGj' ino 876404 in db,
> 876408 in request.
>
> Similarly with "creat for", but there is more wide selection of files
> triggering this one:
> martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep
> -v 'inode mismatch' | grep 'creat for.* replaces'  | wc -l
> 1771
> martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep
> -v 'inode mismatch' | grep 'creat for'  | grep package-output.lock | wc -l
> 198
>
> for "creat for" the log.do_install appears only twice, but various
> temp/run.* files are quite common cause:
> martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep
> -v 'inode mismatch' | grep 'creat for.* replaces'  | grep temp/run | wc -l
> 294
>
> pm-qa is triggering this on many files, e.g. /home/jenkins/oe/world/
> shr-core/tmp-glibc/work/core2-64-oe-linux/pm-qa/0.5.2-r0/
> image/usr/bin/cpuhotplug_07.sh
> martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep
> -v 'inode mismatch' | grep 'creat for.* replaces'  | grep temp/run -v  |
> grep pm-qa | wc -l
> 229
>
> martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep
> -v 'inode mismatch' | grep 'creat for.* replaces'  | grep temp/run -v  |
> grep pm-qa | grep cpuhotplug_05.sh
> creat for '/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-
> oe-linux-gnueabi/pm-qa/0.5.2-r0/image/usr/bin/cpuhotplug_05.sh' replaces
> existing 902737 ['NAMELESS FILE'].
> creat for '/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-
> oe-linux-gnueabi/pm-qa/0.5.2-r0/image/usr/bin/cpuhotplug_05.sh' replaces
> existing 1264757 ['NAMELESS FILE'].
> creat for '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-
> linux/pm-qa/0.5.2-r0/image/usr/bin/cpuhotplug_05.sh' replaces existing
> 976636 ['NAMELESS FILE'].
> creat for '/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-
> oe-linux/pm-qa/0.5.2-r0/image/usr/bin/cpuhotplug_05.sh' replaces existing
> 576004 ['NAMELESS FILE'].
> creat for '/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-
> oe-linux/pm-qa/0.5.2-r0/image/usr/bin/cpuhotplug_05.sh' replaces existing
> 986226 ['NAMELESS FILE'].
>
> then stamps files
> martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep
> -v 'inode mismatch' | grep 'creat for.* replaces'  | grep temp/run -v  |
> grep -v pm-qa | grep -v package-output.lock | grep glibc/stamps | wc -l
> 130
>
> so it looks pretty rancom, but most of these errors are replacing
> 'NAMELESS FILE'
> martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep
> -v 'inode mismatch' | grep 'creat for.* replaces' | grep 'NAMELESS FILE' |
> wc -l
> 1632
>
> which leaves only 139 other files:
> martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep
> -v 'inode mismatch' | grep 'creat for.* replaces' | grep
> 'replaces.*NAMELESS FILE' -v | wc -l
> 139
>
> from which couple of them are package-output.lock again:
> martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep
> -v 'inode mismatch' | grep 'creat for.* replaces' | grep
> 'replaces.*NAMELESS FILE' -v | grep replaces.*package-output.lock | wc -l
> 31
>
> and then random selection of builds, most of them from glibc-locale:
> martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep
> -v 'inode mismatch' | grep 'creat for.* replaces' | grep
> 'replaces.*NAMELESS FILE' -v | grep replaces.*package-output.lock -v | grep
> glibc-locale | wc -l
> 34
> martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep
> -v 'inode mismatch' | grep 'creat for.* replaces' | grep
> 'replaces.*NAMELESS FILE' -v | grep replaces.*package-output.lock -v | grep
> llvm | wc -l
> 3
> martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep
> -v 'inode mismatch' | grep 'creat for.* replaces' | grep
> 'replaces.*NAMELESS FILE' -v | grep replaces.*package-output.lock -v | grep
> linux-yocto | wc -l
> 7
>
> "^creat ignored" is again mostly 195/202 package-output.lock:
>
> martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep
> -v 'inode mismatch' | grep -v 'creat for.* replaces' | grep -v indicates |
> grep -v '^Setup complete' | grep -v '^db cleanup' | grep -v '^pid ' | grep
> -v '^ \[' | grep -v '^memory-to-file' | grep -v '^debug_logfile: ' | grep
> '^creat ignored ' | wc -l
> 202
> martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep
> -v 'inode mismatch' | grep -v 'creat for.* replaces' | grep -v indicates |
> grep -v '^Setup complete' | grep -v '^db cleanup' | grep -v '^pid ' | grep
> -v '^ \[' | grep -v '^memory-to-file' | grep -v '^debug_logfile: ' | grep
> '^creat ignored ' | grep package-output.lock | wc -l
> 195
> martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep
> -v 'inode mismatch' | grep -v 'creat for.* replaces' | grep -v indicates |
> grep -v '^Setup complete' | grep -v '^db cleanup' | grep -v '^pid ' | grep
> -v '^ \[' | grep -v '^memory-to-file' | grep -v '^debug_logfile: ' | grep
> '^creat ignored ' | grep package-output.lock -v
> creat ignored for existing file '/home/jenkins/oe/world/shr-
> core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtbase/5.9.2+
> gitAUTOINC+73573fce29-r0/image/usr/include/qt5/QtNetwork/qt_temp.rhjRGj'.
> creat ignored for existing file '/home/jenkins/oe/world/shr-
> core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qt3d/5.9.2+
> gitAUTOINC+9d8c9ada16-r0/image/usr/include/qt5/Qt3DInput/qt_temp.rhjRGj'.
> creat ignored for existing file '/home/jenkins/oe/world/shr-
> core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libqofono/0.
> 87+gitrAUTOINC+54435de3be-r0/image/usr/lib/libqofono-qt5/
> tests/qt_temp.rhjRGj'.
> creat ignored for existing file '/home/jenkins/oe/world/shr-
> core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libqofono/0.
> 87+gitrAUTOINC+54435de3be-r0/image/usr/lib/libqofono-qt5/
> tests/qt_temp.rhjRGj'.
> creat ignored for existing file '/home/jenkins/oe/world/shr-
> core/tmp-glibc/sstate-control/index-armv5te.lock'.
> creat ignored for existing file '/home/jenkins/oe/world/shr-
> core/tmp-glibc/sstate-control/index-armv5te.lock'.
> creat ignored for existing file '/home/jenkins/oe/world/shr-
> core/tmp-glibc/work/i586-oe-linux/usermode/1.111-r0/build/
> po/.intltool-merge-cache'.
>
> ^dir err: also happens a lot in the log files where other issues appear as
> well (because the QA check isn't triggered by this one):
> martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep
> -v 'inode mismatch' | grep -v 'creat for.* replaces' | grep -v indicates |
> grep -v '^Setup complete' | grep -v '^db cleanup' | grep -v '^pid ' | grep
> -v '^ \[' | grep -v '^memory-to-file' | grep -v '^debug_logfile: ' | grep
> '^creat ignored ' -v | grep '^dir err ' | wc -l
> 744
>
> couple ^symlink err:
> martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep
> -v 'inode mismatch' | grep -v 'creat for.* replaces' | grep -v indicates |
> grep -v '^Setup complete' | grep -v '^db cleanup' | grep -v '^pid ' | grep
> -v '^ \[' | grep -v '^memory-to-file' | grep -v '^debug_logfile: ' | grep
> '^creat ignored ' -v | grep '^dir err ' -v | grep '^symlink err' | wc -l
> 223
>
> martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v "grep -e" | grep
> -v 'inode mismatch' | grep -v 'creat for.* replaces' | grep -v indicates |
> grep -v '^Setup complete' | grep -v '^db cleanup' | grep -v '^pid ' | grep
> -v '^ \[' | grep -v '^memory-to-file' | grep -v '^debug_logfile: ' | grep
> '^creat ignored ' -v | grep '^dir err ' -v | grep '^symlink err' -v | grep
> '^symlink mismatch: ' | wc -l
> 309
>
> I fail to see useful patterns in this, maybe fixing the
> package-output.lock might help to filter the noise a bit.
>
> On Mon, Oct 16, 2017 at 5:10 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
>
>> On 16 October 2017 at 16:01, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>>> The world builds with this check applied show that *a lot* of components
>>> report one of these errors and often many of errors, the most complete logs
>>> from last couple days:
>>>
>>
>> A lot of the errors in my logs were due to package-output.lock being
>> accessed inside/outside pseudo context.  Can you grep all of your logs and
>> collate some common patterns?
>>
>> Ross
>>
>
>

--001a114b3eb28e50cd0560b3b07c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve created<div><a href=3D"https://bugzilla.yoctoproj=
ect.org/show_bug.cgi?id=3D12434">https://bugzilla.yoctoproject.org/show_bug=
.cgi?id=3D12434</a><br></div><div>to track this issue.</div><div><br></div>=
<div>I get this QA error now 100% reproducible when the &quot;right&quot; d=
o_package sstate archive is being used, but still haven&#39;t found the roo=
t cause (aka why/how this bad sstate archive was created in first place).</=
div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon,=
 Oct 16, 2017 at 5:50 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Yes=
, package-output.lock is very often the cause for &quot;^inode mismatch&quo=
t;:</div><div><br></div><div>martin@jama ~/pseudo-qa $ cat log.world.qemu* =
| grep &#39;^inode mismatch&#39; | wc -l</div><div>1485</div><div>martin@ja=
ma ~/pseudo-qa $ cat log.world.qemu* | grep &#39;^inode mismatch&#39; | gre=
p package-output.lock | wc -l</div><div>1168</div><div><br></div><div>log.d=
o_install also causes &quot;^inode mismatch&quot; in many cases:</div><div>=
<br></div><div><div>martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep &#=
39;^inode mismatch&#39; | grep -v package-output.lock | wc -l</div><div>317=
</div><div>martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep &#39;^inode=
 mismatch&#39; | grep -v package-output.lock | grep temp/log.do_install | w=
c -l</div><div>309</div></div><div><br></div><div>That leaves only couple o=
ther files:</div><div><div>martin@jama ~/pseudo-qa $ cat log.world.qemu* | =
grep &#39;^inode mismatch&#39; | grep -v package-output.lock | grep -v temp=
/log.do_install</div><div>inode mismatch: &#39;/home/jenkins/oe/world/shr-<=
wbr>core/tmp-glibc/work/armv5te-<wbr>oe-linux-gnueabi/qtbase/5.9.2+<wbr>git=
AUTOINC+73573fce29-r0/<wbr>image/usr/include/qt5/<wbr>QtNetwork/qt_temp.rhj=
RGj&#39; ino 691255 in db, 691256 in request.</div><div>inode mismatch: &#3=
9;/home/jenkins/.python-<wbr>history&#39; ino 1066494 in db, 1066493 in req=
uest.</div><div>inode mismatch: &#39;/home/jenkins/.python-<wbr>history&#39=
; ino 1066494 in db, 1066493 in request.</div><div>inode mismatch: &#39;/ho=
me/jenkins/.python-<wbr>history&#39; ino 1066729 in db, 1062665 in request.=
</div><div>inode mismatch: &#39;/home/jenkins/.python-<wbr>history&#39; ino=
 1066729 in db, 1062665 in request.</div><div>inode mismatch: &#39;/home/je=
nkins/oe/world/shr-<wbr>core/tmp-glibc/work/armv5te-<wbr>oe-linux-gnueabi/q=
t3d/5.9.2+<wbr>gitAUTOINC+9d8c9ada16-r0/<wbr>image/usr/include/qt5/<wbr>Qt3=
DInput/qt_temp.rhjRGj&#39; ino 520536 in db, 520539 in request.</div><div>i=
node mismatch: &#39;/home/jenkins/oe/world/shr-<wbr>core/tmp-glibc/work/arm=
v5te-<wbr>oe-linux-gnueabi/libqofono/0.<wbr>87+gitrAUTOINC+54435de3be-r0/<w=
br>image/usr/lib/libqofono-qt5/<wbr>tests/qt_temp.rhjRGj&#39; ino 876399 in=
 db, 876404 in request.</div><div>inode mismatch: &#39;/home/jenkins/oe/wor=
ld/shr-<wbr>core/tmp-glibc/work/armv5te-<wbr>oe-linux-gnueabi/libqofono/0.<=
wbr>87+gitrAUTOINC+54435de3be-r0/<wbr>image/usr/lib/libqofono-qt5/<wbr>test=
s/qt_temp.rhjRGj&#39; ino 876404 in db, 876408 in request.</div></div><div>=
<br></div><div>Similarly with &quot;creat for&quot;, but there is more wide=
 selection of files triggering this one:</div><div><div>martin@jama ~/pseud=
o-qa $ cat log.world.qemu* | grep -v &quot;grep -e&quot; | grep -v &#39;ino=
de mismatch&#39; | grep &#39;creat for.* replaces&#39;=C2=A0 | wc -l</div><=
div>1771</div></div><div>martin@jama ~/pseudo-qa $ cat log.world.qemu* | gr=
ep -v &quot;grep -e&quot; | grep -v &#39;inode mismatch&#39; | grep &#39;cr=
eat for&#39;=C2=A0 | grep package-output.lock | wc -l<br></div><div><div>19=
8</div></div><div><br></div><div>for &quot;creat for&quot; the log.do_insta=
ll appears only twice, but various temp/run.* files are quite common cause:=
</div><div><div>martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v &qu=
ot;grep -e&quot; | grep -v &#39;inode mismatch&#39; | grep &#39;creat for.*=
 replaces&#39;=C2=A0 | grep temp/run | wc -l</div><div>294</div></div><div>=
<br></div><div>pm-qa is triggering this on many files, e.g.=C2=A0/home/jenk=
ins/oe/world/<wbr>shr-core/tmp-glibc/work/core2-<wbr>64-oe-linux/pm-qa/0.5.=
2-r0/<wbr>image/usr/bin/cpuhotplug_07.sh</div><div><div>martin@jama ~/pseud=
o-qa $ cat log.world.qemu* | grep -v &quot;grep -e&quot; | grep -v &#39;ino=
de mismatch&#39; | grep &#39;creat for.* replaces&#39;=C2=A0 | grep temp/ru=
n -v=C2=A0 | grep pm-qa | wc -l</div><div>229</div></div><div><br></div><di=
v><div>martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v &quot;grep -=
e&quot; | grep -v &#39;inode mismatch&#39; | grep &#39;creat for.* replaces=
&#39;=C2=A0 | grep temp/run -v=C2=A0 | grep pm-qa | grep cpuhotplug_05.sh</=
div><div>creat for &#39;/home/jenkins/oe/world/shr-<wbr>core/tmp-glibc/work=
/armv5te-<wbr>oe-linux-gnueabi/pm-qa/0.5.2-<wbr>r0/image/usr/bin/cpuhotplug=
_<wbr>05.sh&#39; replaces existing 902737 [&#39;NAMELESS FILE&#39;].</div><=
div>creat for &#39;/home/jenkins/oe/world/shr-<wbr>core/tmp-glibc/work/armv=
5te-<wbr>oe-linux-gnueabi/pm-qa/0.5.2-<wbr>r0/image/usr/bin/cpuhotplug_<wbr=
>05.sh&#39; replaces existing 1264757 [&#39;NAMELESS FILE&#39;].</div><div>=
creat for &#39;/home/jenkins/oe/world/shr-<wbr>core/tmp-glibc/work/i586-oe-=
<wbr>linux/pm-qa/0.5.2-r0/image/<wbr>usr/bin/cpuhotplug_05.sh&#39; replaces=
 existing 976636 [&#39;NAMELESS FILE&#39;].</div><div>creat for &#39;/home/=
jenkins/oe/world/shr-<wbr>core/tmp-glibc/work/core2-64-<wbr>oe-linux/pm-qa/=
0.5.2-r0/image/<wbr>usr/bin/cpuhotplug_05.sh&#39; replaces existing 576004 =
[&#39;NAMELESS FILE&#39;].</div><div>creat for &#39;/home/jenkins/oe/world/=
shr-<wbr>core/tmp-glibc/work/core2-64-<wbr>oe-linux/pm-qa/0.5.2-r0/image/<w=
br>usr/bin/cpuhotplug_05.sh&#39; replaces existing 986226 [&#39;NAMELESS FI=
LE&#39;].</div></div><div><br></div><div>then stamps files</div><div><div>m=
artin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v &quot;grep -e&quot; =
| grep -v &#39;inode mismatch&#39; | grep &#39;creat for.* replaces&#39;=C2=
=A0 | grep temp/run -v=C2=A0 | grep -v pm-qa | grep -v package-output.lock =
| grep glibc/stamps | wc -l</div><div>130</div></div><div><br></div><div>so=
 it looks pretty rancom, but most of these errors are replacing &#39;NAMELE=
SS FILE&#39;</div><div><div>martin@jama ~/pseudo-qa $ cat log.world.qemu* |=
 grep -v &quot;grep -e&quot; | grep -v &#39;inode mismatch&#39; | grep &#39=
;creat for.* replaces&#39; | grep &#39;NAMELESS FILE&#39; | wc -l</div><div=
>1632</div></div><div><br></div><div>which leaves only 139 other files:</di=
v><div><div>martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v &quot;g=
rep -e&quot; | grep -v &#39;inode mismatch&#39; | grep &#39;creat for.* rep=
laces&#39; | grep &#39;replaces.*NAMELESS FILE&#39; -v | wc -l</div><div>13=
9</div></div><div><br></div><div>from which couple of them are package-outp=
ut.lock again:</div><div><div>martin@jama ~/pseudo-qa $ cat log.world.qemu*=
 | grep -v &quot;grep -e&quot; | grep -v &#39;inode mismatch&#39; | grep &#=
39;creat for.* replaces&#39; | grep &#39;replaces.*NAMELESS FILE&#39; -v | =
grep replaces.*package-output.lock | wc -l</div><div>31</div></div><div><br=
></div><div>and then random selection of builds, most of them from glibc-lo=
cale:</div><div><div>martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -=
v &quot;grep -e&quot; | grep -v &#39;inode mismatch&#39; | grep &#39;creat =
for.* replaces&#39; | grep &#39;replaces.*NAMELESS FILE&#39; -v | grep repl=
aces.*package-output.lock -v | grep glibc-locale | wc -l<br></div><div>34</=
div><div>martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v &quot;grep=
 -e&quot; | grep -v &#39;inode mismatch&#39; | grep &#39;creat for.* replac=
es&#39; | grep &#39;replaces.*NAMELESS FILE&#39; -v | grep replaces.*packag=
e-output.lock -v | grep llvm | wc -l</div><div>3</div></div><div><div>marti=
n@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v &quot;grep -e&quot; | gr=
ep -v &#39;inode mismatch&#39; | grep &#39;creat for.* replaces&#39; | grep=
 &#39;replaces.*NAMELESS FILE&#39; -v | grep replaces.*package-output.lock =
-v | grep linux-yocto | wc -l</div><div>7</div></div><div><br></div><div>&q=
uot;^creat ignored&quot; is again mostly 195/202 package-output.lock:</div>=
<div><br></div><div><div>martin@jama ~/pseudo-qa $ cat log.world.qemu* | gr=
ep -v &quot;grep -e&quot; | grep -v &#39;inode mismatch&#39; | grep -v &#39=
;creat for.* replaces&#39; | grep -v indicates | grep -v &#39;^Setup comple=
te&#39; | grep -v &#39;^db cleanup&#39; | grep -v &#39;^pid &#39; | grep -v=
 &#39;^ \[&#39; | grep -v &#39;^memory-to-file&#39; | grep -v &#39;^debug_l=
ogfile: &#39; | grep &#39;^creat ignored &#39; | wc -l</div><div>202</div><=
div>martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v &quot;grep -e&q=
uot; | grep -v &#39;inode mismatch&#39; | grep -v &#39;creat for.* replaces=
&#39; | grep -v indicates | grep -v &#39;^Setup complete&#39; | grep -v &#3=
9;^db cleanup&#39; | grep -v &#39;^pid &#39; | grep -v &#39;^ \[&#39; | gre=
p -v &#39;^memory-to-file&#39; | grep -v &#39;^debug_logfile: &#39; | grep =
&#39;^creat ignored &#39; | grep package-output.lock | wc -l</div><div>195<=
/div><div>martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v &quot;gre=
p -e&quot; | grep -v &#39;inode mismatch&#39; | grep -v &#39;creat for.* re=
places&#39; | grep -v indicates | grep -v &#39;^Setup complete&#39; | grep =
-v &#39;^db cleanup&#39; | grep -v &#39;^pid &#39; | grep -v &#39;^ \[&#39;=
 | grep -v &#39;^memory-to-file&#39; | grep -v &#39;^debug_logfile: &#39; |=
 grep &#39;^creat ignored &#39; | grep package-output.lock -v=C2=A0</div><d=
iv>creat ignored for existing file &#39;/home/jenkins/oe/world/shr-<wbr>cor=
e/tmp-glibc/work/armv5te-<wbr>oe-linux-gnueabi/qtbase/5.9.2+<wbr>gitAUTOINC=
+73573fce29-r0/<wbr>image/usr/include/qt5/<wbr>QtNetwork/qt_temp.rhjRGj&#39=
;.</div><div>creat ignored for existing file &#39;/home/jenkins/oe/world/sh=
r-<wbr>core/tmp-glibc/work/armv5te-<wbr>oe-linux-gnueabi/qt3d/5.9.2+<wbr>gi=
tAUTOINC+9d8c9ada16-r0/<wbr>image/usr/include/qt5/<wbr>Qt3DInput/qt_temp.rh=
jRGj&#39;.</div><div>creat ignored for existing file &#39;/home/jenkins/oe/=
world/shr-<wbr>core/tmp-glibc/work/armv5te-<wbr>oe-linux-gnueabi/libqofono/=
0.<wbr>87+gitrAUTOINC+54435de3be-r0/<wbr>image/usr/lib/libqofono-qt5/<wbr>t=
ests/qt_temp.rhjRGj&#39;.</div><div>creat ignored for existing file &#39;/h=
ome/jenkins/oe/world/shr-<wbr>core/tmp-glibc/work/armv5te-<wbr>oe-linux-gnu=
eabi/libqofono/0.<wbr>87+gitrAUTOINC+54435de3be-r0/<wbr>image/usr/lib/libqo=
fono-qt5/<wbr>tests/qt_temp.rhjRGj&#39;.</div><div>creat ignored for existi=
ng file &#39;/home/jenkins/oe/world/shr-<wbr>core/tmp-glibc/sstate-control/=
<wbr>index-armv5te.lock&#39;.</div><div>creat ignored for existing file &#3=
9;/home/jenkins/oe/world/shr-<wbr>core/tmp-glibc/sstate-control/<wbr>index-=
armv5te.lock&#39;.</div><div>creat ignored for existing file &#39;/home/jen=
kins/oe/world/shr-<wbr>core/tmp-glibc/work/i586-oe-<wbr>linux/usermode/1.11=
1-r0/build/<wbr>po/.intltool-merge-cache&#39;.</div></div><div><br></div><d=
iv>^dir err: also happens a lot in the log files where other issues appear =
as well (because the QA check isn&#39;t triggered by this one):</div><div><=
div>martin@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v &quot;grep -e&q=
uot; | grep -v &#39;inode mismatch&#39; | grep -v &#39;creat for.* replaces=
&#39; | grep -v indicates | grep -v &#39;^Setup complete&#39; | grep -v &#3=
9;^db cleanup&#39; | grep -v &#39;^pid &#39; | grep -v &#39;^ \[&#39; | gre=
p -v &#39;^memory-to-file&#39; | grep -v &#39;^debug_logfile: &#39; | grep =
&#39;^creat ignored &#39; -v | grep &#39;^dir err &#39; | wc -l</div><div>7=
44</div></div><div><br></div><div>couple ^symlink err:</div><div><div>marti=
n@jama ~/pseudo-qa $ cat log.world.qemu* | grep -v &quot;grep -e&quot; | gr=
ep -v &#39;inode mismatch&#39; | grep -v &#39;creat for.* replaces&#39; | g=
rep -v indicates | grep -v &#39;^Setup complete&#39; | grep -v &#39;^db cle=
anup&#39; | grep -v &#39;^pid &#39; | grep -v &#39;^ \[&#39; | grep -v &#39=
;^memory-to-file&#39; | grep -v &#39;^debug_logfile: &#39; | grep &#39;^cre=
at ignored &#39; -v | grep &#39;^dir err &#39; -v | grep &#39;^symlink err&=
#39; | wc -l</div><div>223</div></div><div><br></div><div><div>martin@jama =
~/pseudo-qa $ cat log.world.qemu* | grep -v &quot;grep -e&quot; | grep -v &=
#39;inode mismatch&#39; | grep -v &#39;creat for.* replaces&#39; | grep -v =
indicates | grep -v &#39;^Setup complete&#39; | grep -v &#39;^db cleanup&#3=
9; | grep -v &#39;^pid &#39; | grep -v &#39;^ \[&#39; | grep -v &#39;^memor=
y-to-file&#39; | grep -v &#39;^debug_logfile: &#39; | grep &#39;^creat igno=
red &#39; -v | grep &#39;^dir err &#39; -v | grep &#39;^symlink err&#39; -v=
 | grep &#39;^symlink mismatch: &#39; | wc -l</div><div>309</div></div><div=
><br></div><div>I fail to see useful patterns in this, maybe fixing the pac=
kage-output.lock might help to filter the noise a bit.</div><div><div class=
=3D"h5"><div><br></div><div class=3D"gmail_extra"><div class=3D"gmail_quote=
">On Mon, Oct 16, 2017 at 5:10 PM, Burton, Ross <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><span class=3D"m_4890801203757336322gmail-">On 16 October=
 2017 at 16:01, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin=
.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> w=
rote:<br></span><div class=3D"gmail_extra"><div class=3D"gmail_quote"><span=
 class=3D"m_4890801203757336322gmail-"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr">The world builds with this check applied sho=
w that *a lot* of components report one of these errors and often many of e=
rrors, the most complete logs from last couple days:</div></blockquote><div=
><br></div></span><div>A lot of the errors in my logs were due to package-o=
utput.lock being accessed inside/outside pseudo context.=C2=A0 Can you grep=
 all of your logs and collate some common patterns?</div><span class=3D"m_4=
890801203757336322gmail-HOEnZb"><font color=3D"#888888"><div><br></div><div=
>Ross</div></font></span></div></div></div>
</blockquote></div><br></div></div></div></div>
</blockquote></div><br></div>

--001a114b3eb28e50cd0560b3b07c--

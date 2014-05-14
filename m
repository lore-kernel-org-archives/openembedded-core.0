Return-Path: <gary.robertson@linaro.org>
Received: from mail-vc0-f173.google.com (unknown [209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id D673C66007
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 13:04:14 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id il7so2369124vcb.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 06:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=CQ66SRqB6RGyQRo9DQo/B1C385mLTB0TtC+vulTO228=;
	b=MZfB5e31cUr1QZkpWrXESwwDt8bgvJzhhl1NdmSu+qMNfi0RFiLLj6z1nDWNl0hQs9
	h46PNfcNK3u2Vy+0lWadfsRwXlHnYZYSivqONlXdi93XPvols4FPY4tm5tb5qqQHfiLo
	8Fd3qzTYCNdqLi07ajWoKlmkf/3EmJ/ZOWaaXVb/OucBC5CtJ9JvK8BFPv1/VPiNPMN+
	LmR69mXPCv7fl4Q5VtYlbYeycNXrcHEdsgVOPtdFcwS4g8SE4cag4D0SCOl5ye2sTPpX
	94Uvy150+CmdWEKsJUwT5ibTxsQDhI5IJkaHH/7OoMYrKgrbA/JjUDNOW4Xf902XIPSN
	MOSA==
X-Gm-Message-State: ALoCoQmFtdCRO9837A90sWs37hfAdI9kA1qlIkPKPOKTNjxOp2YTzQFgXLvhdWEB1H9juf04qUPx
MIME-Version: 1.0
X-Received: by 10.58.112.8 with SMTP id im8mr1460676veb.35.1400072655250; Wed,
	14 May 2014 06:04:15 -0700 (PDT)
Received: by 10.58.141.170 with HTTP; Wed, 14 May 2014 06:04:15 -0700 (PDT)
In-Reply-To: <5372EC34.6010703@linux.intel.com>
References: <1397851967-24110-1-git-send-email-gary.robertson@linaro.org>
	<1398377346-19557-1-git-send-email-gary.robertson@linaro.org>
	<1398377346-19557-2-git-send-email-gary.robertson@linaro.org>
	<536D4FB7.6060709@linux.intel.com>
	<5372EC34.6010703@linux.intel.com>
Date: Wed, 14 May 2014 08:04:15 -0500
Message-ID: <CAF7YWnw93b=aR70e_aADZfdY+O5+fKsFGFbvyK9iXEWd-pCp4A@mail.gmail.com>
From: Gary Robertson <gary.robertson@linaro.org>
To: Saul Wold <sgw@linux.intel.com>
Cc: Mike Holmes <mike.holmes@linaro.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 1/1] rt-tests: bump version 0.87 => 0.89
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
X-List-Received-Date: Wed, 14 May 2014 13:04:22 -0000
Content-Type: multipart/alternative; boundary=047d7b2e544e46bc6704f95bd1ce

--047d7b2e544e46bc6704f95bd1ce
Content-Type: text/plain; charset=UTF-8

I believe I have identified and corrected the issues in the recipe and top
level Makefile.  However as an OE / bitibake newbie I am having some issues
with building/testing on qemux86, and building for our internal purposes on
ARM never seemed to show the problems.  I am currently focused on this,
expect to get some local assistance with the hurdles and hopefully will
have some closure today.

Gary Robertson


On Tue, May 13, 2014 at 11:08 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 05/09/2014 02:59 PM, Saul Wold wrote:
>
>> On 04/24/2014 03:09 PM, gary.robertson@linaro.org wrote:
>>
>>> From: Anders Roxell <anders.roxell@linaro.org>
>>>
>>> cyclictest was updated to correct some problems with CPU affinity
>>> selection
>>> and display of help and/or execution details.
>>> These patches were accepted by the maintainer of the cyclictest utility.
>>> The changes were reflected in an updated release of rt-tests - v0.89
>>> The cyclictest changes were successfully tested on both an ARM v7 and
>>> x86_64
>>> host environment.
>>> The OE recipe was updated locally to incorporate the newer rt-tests
>>> release
>>> and the resulting builds were verified for the same ARM v7 target
>>> and for qemux86.
>>> Patch files obsoleted by the rt-tests 0.89 release were removed from
>>> the recipe
>>>     deleted:
>>> meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-
>>> user-specified-PYLIB.patch
>>>
>>>     deleted:
>>> meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-
>>> install_hwlatdetect.patch
>>>
>>>  Did you test build hwlatdetect?  This seems to break the install process
>> for hwlatdetect which was part of this patch.
>>
>> There is also some additional files installed but not shipped in
>> /usr/src/backfile.
>>
>> Please test with hwlatdetect also.
>>
>>
> This issue has not been addressed yet and is causing build failures, can
> you please look into this.
>
>> ERROR: Function failed: do_install (log file is located at
>> /home/pokybuild/yocto-autobuilder/yocto-slave/
>> nightly-world/build/build/tmp/work/x86-pokymllib32-linux/
>> lib32-hwlatdetect/0.85-r0/temp/log.do_install.7871)
>> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-
>> autobuilder/yocto-slave/nightly-world/build/build/tmp/
>> work/x86-pokymllib32-linux/lib32-hwlatdetect/0.85-r0/
>> temp/log.do_install.7871
>> Log data follows:
>> | DEBUG: Executing shell function do_install
>> | NOTE: make -j 16 NUMA=0 PYLIB=/usr/lib/python2.7/dist-packages
>> install_hwlatdetect DESTDIR=/home/pokybuild/yocto-
>> autobuilder/yocto-slave/nightly-world/build/build/tmp/
>> work/x86-pokymllib32-linux/lib32-hwlatdetect/0.85-r0/image
>> SBINDIR=/usr/sbin MANDIR=/usr/share/man INCLUDEDIR=/usr/include
>> | make: *** No rule to make target `install_hwlatdetect'.  Stop.
>> | ERROR: oe_runmake failed
>>
>
>
> Thanks
>         Sau!
>
>
>
>
>  Thanks
>>      Sau!
>>
>>      deleted:
>>> meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
>>>
>>> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
>>> Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
>>> ---
>>>   ...1-rt-tests-Allow-for-user-specified-PYLIB.patch |   35 ----------
>>>   ...02-rt-tests-Break-out-install_hwlatdetect.patch |   68
>>> --------------------
>>>   .../files/added-missing-dependencies.patch         |   50
>>> --------------
>>>   meta/recipes-rt/rt-tests/rt-tests.inc              |    7 +-
>>>   .../{rt-tests_0.87.bb => rt-tests_0.89.bb}         |    0
>>>   5 files changed, 2 insertions(+), 158 deletions(-)
>>>   delete mode 100644
>>> meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-
>>> user-specified-PYLIB.patch
>>>
>>>   delete mode 100644
>>> meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-
>>> install_hwlatdetect.patch
>>>
>>>   delete mode 100644
>>> meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
>>>   rename meta/recipes-rt/rt-tests/{rt-tests_0.87.bb =>
>>> rt-tests_0.89.bb} (100%)
>>>
>>> diff --git
>>> a/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-
>>> user-specified-PYLIB.patch
>>> b/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-
>>> user-specified-PYLIB.patch
>>>
>>> deleted file mode 100644
>>> index 8b493eb..0000000
>>> ---
>>> a/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-
>>> user-specified-PYLIB.patch
>>>
>>> +++ /dev/null
>>> @@ -1,35 +0,0 @@
>>> -From 66765522b634952346f1a3ab7d00c7222a1f9361 Mon Sep 17 00:00:00 2001
>>> -Message-Id:
>>> <66765522b634952346f1a3ab7d00c7222a1f9361.1347419597.git.
>>> dvhart@linux.intel.com>
>>>
>>> -From: Darren Hart <dvhart@linux.intel.com>
>>> -Date: Tue, 11 Sep 2012 15:19:30 -0700
>>> -Subject: [PATCH 1/2] rt-tests: Allow for user-specified PYLIB
>>> -
>>> -Upstream-Status: Submitted
>>> -
>>> -Allow users (build systems) to specify PYLIB. This allows for a
>>> -cross-build-system to specify the target PYLIB rather than the host
>>> -PYLIB.
>>> -
>>> -Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>>> -CC: Clark Williams <williams@redhat.com>
>>> -CC: John Kacur <jkacur@redhat.com>
>>> ----
>>> - Makefile | 2 +-
>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>>> -
>>> -diff --git a/Makefile b/Makefile
>>> -index 3a82407..61e2f9f 100644
>>> ---- a/Makefile
>>> -+++ b/Makefile
>>> -@@ -23,7 +23,7 @@ endif
>>> - CFLAGS ?= -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include
>>> - LDFLAGS ?=
>>> -
>>> --PYLIB  := $(shell python -c 'import distutils.sysconfig;  print
>>> distutils.sysconfig.get_python_lib()')
>>> -+PYLIB  ?= $(shell python -c 'import distutils.sysconfig;  print
>>> distutils.sysconfig.get_python_lib()')
>>> -
>>> - ifndef DEBUG
>>> -     CFLAGS    += -O2
>>> ---
>>> -1.7.11.4
>>> -
>>> diff --git
>>> a/meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-
>>> install_hwlatdetect.patch
>>> b/meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-
>>> install_hwlatdetect.patch
>>>
>>> deleted file mode 100644
>>> index bc6136f..0000000
>>> ---
>>> a/meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-
>>> install_hwlatdetect.patch
>>>
>>> +++ /dev/null
>>> @@ -1,68 +0,0 @@
>>> -From af93e580d005a2bba6ed36528003af4cf631adb8 Mon Sep 17 00:00:00 2001
>>> -Message-Id:
>>> <af93e580d005a2bba6ed36528003af4cf631adb8.1347419597.git.
>>> dvhart@linux.intel.com>
>>>
>>> -In-Reply-To:
>>> <66765522b634952346f1a3ab7d00c7222a1f9361.1347419597.git.
>>> dvhart@linux.intel.com>
>>>
>>> -References:
>>> <66765522b634952346f1a3ab7d00c7222a1f9361.1347419597.git.
>>> dvhart@linux.intel.com>
>>>
>>> -From: Darren Hart <dvhart@linux.intel.com>
>>> -Date: Tue, 11 Sep 2012 14:51:10 -0700
>>> -Subject: [PATCH 2/2] rt-tests: Break out install_hwlatdetect
>>> -
>>> -Upstream-Status: Submitted
>>> -
>>> -Allow hwlatdetect to be installed independently of the rest of the
>>> -tests. This is convenient for build systems that package it separately
>>> -due to the python dependency.
>>> -
>>> -Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>>> -CC: Clark Williams <williams@redhat.com>
>>> -CC: John Kacur <jkacur@redhat.com>
>>> ----
>>> - Makefile | 18 +++++++++++-------
>>> - 1 file changed, 11 insertions(+), 7 deletions(-)
>>> -
>>> -diff --git a/Makefile b/Makefile
>>> -index 61e2f9f..636e63b 100644
>>> ---- a/Makefile
>>> -+++ b/Makefile
>>> -@@ -119,21 +119,15 @@ changelog:
>>> -     git log >ChangeLog
>>> -
>>> - .PHONY: install
>>> --install: all
>>> -+install: all install_hwlatdetect
>>> -     mkdir -p "$(DESTDIR)$(bindir)" "$(DESTDIR)$(mandir)/man4"
>>> -     mkdir -p "$(DESTDIR)$(srcdir)" "$(DESTDIR)$(mandir)/man8"
>>> -     cp $(TARGETS) "$(DESTDIR)$(bindir)"
>>> --    if test -n "$(PYLIB)" ; then \
>>> --        install -D -m 755 src/hwlatdetect/hwlatdetect.py
>>> $(DESTDIR)$(PYLIB)/hwlatdetect.py ; \
>>> --        rm -f "$(DESTDIR)$(bindir)/hwlatdetect" ; \
>>> --        ln -s $(PYLIB)/hwlatdetect.py
>>> "$(DESTDIR)$(bindir)/hwlatdetect" ; \
>>> --    fi
>>> -     install -D -m 644 src/backfire/backfire.c
>>> "$(DESTDIR)$(srcdir)/backfire/backfire.c"
>>> -     install -m 644 src/backfire/Makefile
>>> "$(DESTDIR)$(srcdir)/backfire/Makefile"
>>> -     gzip src/backfire/backfire.4 -c
>>> >"$(DESTDIR)$(mandir)/man4/backfire.4.gz"
>>> -     gzip src/cyclictest/cyclictest.8 -c
>>> >"$(DESTDIR)$(mandir)/man8/cyclictest.8.gz"
>>> -     gzip src/pi_tests/pi_stress.8 -c
>>> >"$(DESTDIR)$(mandir)/man8/pi_stress.8.gz"
>>> --    gzip src/hwlatdetect/hwlatdetect.8 -c
>>> >"$(DESTDIR)$(mandir)/man8/hwlatdetect.8.gz"
>>> -     gzip src/ptsematest/ptsematest.8 -c
>>> >"$(DESTDIR)$(mandir)/man8/ptsematest.8.gz"
>>> -     gzip src/sigwaittest/sigwaittest.8 -c
>>> >"$(DESTDIR)$(mandir)/man8/sigwaittest.8.gz"
>>> -     gzip src/svsematest/svsematest.8 -c
>>> >"$(DESTDIR)$(mandir)/man8/svsematest.8.gz"
>>> -@@ -141,6 +135,16 @@ install: all
>>> -     gzip src/backfire/sendme.8 -c
>>> >"$(DESTDIR)$(mandir)/man8/sendme.8.gz"
>>> -     gzip src/hackbench/hackbench.8 -c
>>> >"$(DESTDIR)$(mandir)/man8/hackbench.8.gz"
>>> -
>>> -+.PHONY: install_hwlatdetect
>>> -+install_hwlatdetect: hwlatdetect
>>> -+    if test -n "$(PYLIB)" ; then \
>>> -+        mkdir -p "$(DESTDIR)$(bindir)" "$(DESTDIR)$(mandir)/man8" ; \
>>> -+        install -D -m 755 src/hwlatdetect/hwlatdetect.py
>>> $(DESTDIR)$(PYLIB)/hwlatdetect.py ; \
>>> -+        rm -f "$(DESTDIR)$(bindir)/hwlatdetect" ; \
>>> -+        ln -s $(PYLIB)/hwlatdetect.py
>>> "$(DESTDIR)$(bindir)/hwlatdetect" ; \
>>> -+        gzip src/hwlatdetect/hwlatdetect.8 -c
>>> >"$(DESTDIR)$(mandir)/man8/hwlatdetect.8.gz" ; \
>>> -+    fi
>>> -+
>>> - .PHONY: release
>>> - release: clean changelog
>>> -     mkdir -p releases
>>> ---
>>> -1.7.11.4
>>> -
>>> diff --git
>>> a/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
>>> b/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
>>> deleted file mode 100644
>>> index e420282..0000000
>>> --- a/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
>>> +++ /dev/null
>>> @@ -1,50 +0,0 @@
>>> -From 82d28701486ba5a699544a168448bf93b1ccd7b1 Mon Sep 17 00:00:00 2001
>>> -From: Jackie Huang <jackie.huang@windriver.com>
>>> -Date: Thu, 6 Dec 2012 11:26:14 +0800
>>> -Subject: [PATCH] Added missing dependencies
>>> -
>>> -Upstream-Status: Submitted [linux-rt-users]
>>> -
>>> -The following targets missed dependency on librttest.a:
>>> -pi_stress
>>> -rt-migrate-test
>>> -hackbench
>>> -
>>> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>>> ----
>>> - Makefile |    6 +++---
>>> - 1 file changed, 3 insertions(+), 3 deletions(-)
>>> -
>>> -diff --git a/Makefile b/Makefile
>>> -index fd3cdb3..60707a7 100644
>>> ---- a/Makefile
>>> -+++ b/Makefile
>>> -@@ -68,14 +68,14 @@ cyclictest: cyclictest.o librttest.a
>>> - signaltest: signaltest.o librttest.a
>>> -     $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
>>> -
>>> --pi_stress: pi_stress.o
>>> -+pi_stress: pi_stress.o librttest.a
>>> -     $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
>>> -
>>> - hwlatdetect:  src/hwlatdetect/hwlatdetect.py
>>> -     chmod +x src/hwlatdetect/hwlatdetect.py
>>> -     ln -s src/hwlatdetect/hwlatdetect.py hwlatdetect
>>> -
>>> --rt-migrate-test: rt-migrate-test.o
>>> -+rt-migrate-test: rt-migrate-test.o librttest.a
>>> -     $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
>>> -
>>> - ptsematest: ptsematest.o librttest.a
>>> -@@ -96,7 +96,7 @@ sendme: sendme.o librttest.a
>>> - pip_stress: pip_stress.o librttest.a
>>> -     $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
>>> -
>>> --hackbench: hackbench.o
>>> -+hackbench: hackbench.o librttest.a
>>> -     $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
>>> -
>>> - librttest.a: rt-utils.o error.o rt-get_cpu.o
>>> ---
>>> -1.7.9.5
>>> -
>>> diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc
>>> b/meta/recipes-rt/rt-tests/rt-tests.inc
>>> index 81f4f2b..1d876b0 100644
>>> --- a/meta/recipes-rt/rt-tests/rt-tests.inc
>>> +++ b/meta/recipes-rt/rt-tests/rt-tests.inc
>>> @@ -1,10 +1,7 @@
>>> -# Version v0.87
>>> -SRCREV = "b0413ae5ed802004fb0c4af74a1757381fd2b91f"
>>> +# Version v0.89
>>> +SRCREV = "9164ec4db2645f52ffdd20e6d1b72bb0411ab40e"
>>>
>>>   SRC_URI =
>>> "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git \
>>> -           file://0001-rt-tests-Allow-for-user-specified-PYLIB.patch \
>>> -           file://0002-rt-tests-Break-out-install_hwlatdetect.patch \
>>> -           file://added-missing-dependencies.patch \
>>>              file://hackbench-fix-error-check.patch \
>>>   "
>>>
>>> diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.87.bb
>>> b/meta/recipes-rt/rt-tests/rt-tests_0.89.bb
>>> similarity index 100%
>>> rename from meta/recipes-rt/rt-tests/rt-tests_0.87.bb
>>> rename to meta/recipes-rt/rt-tests/rt-tests_0.89.bb
>>>
>>>

--047d7b2e544e46bc6704f95bd1ce
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I believe I have identified and corrected the issues =
in the recipe and top level Makefile.=C2=A0 However as an OE / bitibake new=
bie I am having some issues with building/testing on qemux86, and building =
for our internal purposes on ARM never seemed to show the problems.=C2=A0 I=
 am currently focused on this, expect to get some local assistance with the=
 hurdles and hopefully will have some closure today.<br>
<br></div>Gary Robertson<br></div><div class=3D"gmail_extra"><br><br><div c=
lass=3D"gmail_quote">On Tue, May 13, 2014 at 11:08 PM, Saul Wold <span dir=
=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@l=
inux.intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On 0=
5/09/2014 02:59 PM, Saul Wold wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 04/24/2014 03:09 PM, <a href=3D"mailto:gary.robertson@linaro.org" target=
=3D"_blank">gary.robertson@linaro.org</a> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Anders Roxell &lt;<a href=3D"mailto:anders.roxell@linaro.org" target=
=3D"_blank">anders.roxell@linaro.org</a>&gt;<br>
<br>
cyclictest was updated to correct some problems with CPU affinity<br>
selection<br>
and display of help and/or execution details.<br>
These patches were accepted by the maintainer of the cyclictest utility.<br=
>
The changes were reflected in an updated release of rt-tests - v0.89<br>
The cyclictest changes were successfully tested on both an ARM v7 and<br>
x86_64<br>
host environment.<br>
The OE recipe was updated locally to incorporate the newer rt-tests<br>
release<br>
and the resulting builds were verified for the same ARM v7 target<br>
and for qemux86.<br>
Patch files obsoleted by the rt-tests 0.89 release were removed from<br>
the recipe<br>
=C2=A0 =C2=A0 deleted:<br>
meta/recipes-rt/rt-tests/<u></u>files/0001-rt-tests-Allow-for-<u></u>user-s=
pecified-PYLIB.patch<br>
<br>
=C2=A0 =C2=A0 deleted:<br>
meta/recipes-rt/rt-tests/<u></u>files/0002-rt-tests-Break-out-<u></u>instal=
l_hwlatdetect.patch<br>
<br>
</blockquote>
Did you test build hwlatdetect? =C2=A0This seems to break the install proce=
ss<br>
for hwlatdetect which was part of this patch.<br>
<br>
There is also some additional files installed but not shipped in<br>
/usr/src/backfile.<br>
<br>
Please test with hwlatdetect also.<br>
<br>
</blockquote>
<br></div></div>
This issue has not been addressed yet and is causing build failures, can yo=
u please look into this.<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
ERROR: Function failed: do_install (log file is located at /home/pokybuild/=
yocto-<u></u>autobuilder/yocto-slave/<u></u>nightly-world/build/build/tmp/<=
u></u>work/x86-pokymllib32-linux/<u></u>lib32-hwlatdetect/0.85-r0/<u></u>te=
mp/log.do_install.7871)<br>

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-<u></u>autobuild=
er/yocto-slave/<u></u>nightly-world/build/build/tmp/<u></u>work/x86-pokymll=
ib32-linux/<u></u>lib32-hwlatdetect/0.85-r0/<u></u>temp/log.do_install.7871=
<br>

Log data follows:<br>
| DEBUG: Executing shell function do_install<br>
| NOTE: make -j 16 NUMA=3D0 PYLIB=3D/usr/lib/python2.7/dist-<u></u>packages=
 install_hwlatdetect DESTDIR=3D/home/pokybuild/yocto-<u></u>autobuilder/yoc=
to-slave/<u></u>nightly-world/build/build/tmp/<u></u>work/x86-pokymllib32-l=
inux/<u></u>lib32-hwlatdetect/0.85-r0/<u></u>image SBINDIR=3D/usr/sbin MAND=
IR=3D/usr/share/man INCLUDEDIR=3D/usr/include<br>

| make: *** No rule to make target `install_hwlatdetect&#39;. =C2=A0Stop.<b=
r>
| ERROR: oe_runmake failed<br>
</blockquote>
<br>
<br>
Thanks<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sau!<div class=3D"HOEnZb"><div class=3D"h5"><br=
>
<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Thanks<br>
=C2=A0 =C2=A0 =C2=A0Sau!<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 deleted:<br>
meta/recipes-rt/rt-tests/<u></u>files/added-missing-<u></u>dependencies.pat=
ch<br>
<br>
Signed-off-by: Anders Roxell &lt;<a href=3D"mailto:anders.roxell@linaro.org=
" target=3D"_blank">anders.roxell@linaro.org</a>&gt;<br>
Signed-off-by: Gary S. Robertson &lt;<a href=3D"mailto:gary.robertson@linar=
o.org" target=3D"_blank">gary.robertson@linaro.org</a>&gt;<br>
---<br>
=C2=A0 ...1-rt-tests-Allow-for-user-<u></u>specified-PYLIB.patch | =C2=A0 3=
5 ----------<br>
=C2=A0 ...02-rt-tests-Break-out-<u></u>install_hwlatdetect.patch | =C2=A0 6=
8<br>
--------------------<br>
=C2=A0 .../files/added-missing-<u></u>dependencies.patch =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 50<br>
--------------<br>
=C2=A0 meta/recipes-rt/rt-tests/rt-<u></u>tests.inc =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A07 +-<br>
=C2=A0 .../{<a href=3D"http://rt-tests_0.87.bb" target=3D"_blank">rt-tests_=
0.87.bb</a> =3D&gt; <a href=3D"http://rt-tests_0.89.bb" target=3D"_blank">r=
t-tests_0.89.bb</a>} =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00<br>
=C2=A0 5 files changed, 2 insertions(+), 158 deletions(-)<br>
=C2=A0 delete mode 100644<br>
meta/recipes-rt/rt-tests/<u></u>files/0001-rt-tests-Allow-for-<u></u>user-s=
pecified-PYLIB.patch<br>
<br>
=C2=A0 delete mode 100644<br>
meta/recipes-rt/rt-tests/<u></u>files/0002-rt-tests-Break-out-<u></u>instal=
l_hwlatdetect.patch<br>
<br>
=C2=A0 delete mode 100644<br>
meta/recipes-rt/rt-tests/<u></u>files/added-missing-<u></u>dependencies.pat=
ch<br>
=C2=A0 rename meta/recipes-rt/rt-tests/{<a href=3D"http://rt-tests_0.87.bb"=
 target=3D"_blank">rt-<u></u>tests_0.87.bb</a> =3D&gt;<br>
<a href=3D"http://rt-tests_0.89.bb" target=3D"_blank">rt-tests_0.89.bb</a>}=
 (100%)<br>
<br>
diff --git<br>
a/meta/recipes-rt/rt-tests/<u></u>files/0001-rt-tests-Allow-for-<u></u>user=
-specified-PYLIB.patch<br>
b/meta/recipes-rt/rt-tests/<u></u>files/0001-rt-tests-Allow-for-<u></u>user=
-specified-PYLIB.patch<br>
<br>
deleted file mode 100644<br>
index 8b493eb..0000000<br>
---<br>
a/meta/recipes-rt/rt-tests/<u></u>files/0001-rt-tests-Allow-for-<u></u>user=
-specified-PYLIB.patch<br>
<br>
+++ /dev/null<br>
@@ -1,35 +0,0 @@<br>
-From 66765522b634952346f1a3ab7d00c7<u></u>222a1f9361 Mon Sep 17 00:00:00 2=
001<br>
-Message-Id:<br>
&lt;<a href=3D"mailto:66765522b634952346f1a3ab7d00c7222a1f9361.1347419597.g=
it.dvhart@linux.intel.com" target=3D"_blank">66765522b634952346f1a3ab7d00c<=
u></u>7222a1f9361.1347419597.git.<u></u>dvhart@linux.intel.com</a>&gt;<br>

<br>
-From: Darren Hart &lt;<a href=3D"mailto:dvhart@linux.intel.com" target=3D"=
_blank">dvhart@linux.intel.com</a>&gt;<br>
-Date: Tue, 11 Sep 2012 15:19:30 -0700<br>
-Subject: [PATCH 1/2] rt-tests: Allow for user-specified PYLIB<br>
-<br>
-Upstream-Status: Submitted<br>
-<br>
-Allow users (build systems) to specify PYLIB. This allows for a<br>
-cross-build-system to specify the target PYLIB rather than the host<br>
-PYLIB.<br>
-<br>
-Signed-off-by: Darren Hart &lt;<a href=3D"mailto:dvhart@linux.intel.com" t=
arget=3D"_blank">dvhart@linux.intel.com</a>&gt;<br>
-CC: Clark Williams &lt;<a href=3D"mailto:williams@redhat.com" target=3D"_b=
lank">williams@redhat.com</a>&gt;<br>
-CC: John Kacur &lt;<a href=3D"mailto:jkacur@redhat.com" target=3D"_blank">=
jkacur@redhat.com</a>&gt;<br>
----<br>
- Makefile | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/Makefile b/Makefile<br>
-index 3a82407..61e2f9f 100644<br>
---- a/Makefile<br>
-+++ b/Makefile<br>
-@@ -23,7 +23,7 @@ endif<br>
- CFLAGS ?=3D -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include<br>
- LDFLAGS ?=3D<br>
-<br>
--PYLIB =C2=A0:=3D $(shell python -c &#39;import distutils.sysconfig; =C2=
=A0print<br>
distutils.sysconfig.get_<u></u>python_lib()&#39;)<br>
-+PYLIB =C2=A0?=3D $(shell python -c &#39;import distutils.sysconfig; =C2=
=A0print<br>
distutils.sysconfig.get_<u></u>python_lib()&#39;)<br>
-<br>
- ifndef DEBUG<br>
- =C2=A0 =C2=A0 CFLAGS =C2=A0 =C2=A0+=3D -O2<br>
---<br>
-1.7.11.4<br>
-<br>
diff --git<br>
a/meta/recipes-rt/rt-tests/<u></u>files/0002-rt-tests-Break-out-<u></u>inst=
all_hwlatdetect.patch<br>
b/meta/recipes-rt/rt-tests/<u></u>files/0002-rt-tests-Break-out-<u></u>inst=
all_hwlatdetect.patch<br>
<br>
deleted file mode 100644<br>
index bc6136f..0000000<br>
---<br>
a/meta/recipes-rt/rt-tests/<u></u>files/0002-rt-tests-Break-out-<u></u>inst=
all_hwlatdetect.patch<br>
<br>
+++ /dev/null<br>
@@ -1,68 +0,0 @@<br>
-From af93e580d005a2bba6ed36528003af<u></u>4cf631adb8 Mon Sep 17 00:00:00 2=
001<br>
-Message-Id:<br>
&lt;<a href=3D"mailto:af93e580d005a2bba6ed36528003af4cf631adb8.1347419597.g=
it.dvhart@linux.intel.com" target=3D"_blank">af93e580d005a2bba6ed36528003a<=
u></u>f4cf631adb8.1347419597.git.<u></u>dvhart@linux.intel.com</a>&gt;<br>

<br>
-In-Reply-To:<br>
&lt;<a href=3D"mailto:66765522b634952346f1a3ab7d00c7222a1f9361.1347419597.g=
it.dvhart@linux.intel.com" target=3D"_blank">66765522b634952346f1a3ab7d00c<=
u></u>7222a1f9361.1347419597.git.<u></u>dvhart@linux.intel.com</a>&gt;<br>

<br>
-References:<br>
&lt;<a href=3D"mailto:66765522b634952346f1a3ab7d00c7222a1f9361.1347419597.g=
it.dvhart@linux.intel.com" target=3D"_blank">66765522b634952346f1a3ab7d00c<=
u></u>7222a1f9361.1347419597.git.<u></u>dvhart@linux.intel.com</a>&gt;<br>

<br>
-From: Darren Hart &lt;<a href=3D"mailto:dvhart@linux.intel.com" target=3D"=
_blank">dvhart@linux.intel.com</a>&gt;<br>
-Date: Tue, 11 Sep 2012 14:51:10 -0700<br>
-Subject: [PATCH 2/2] rt-tests: Break out install_hwlatdetect<br>
-<br>
-Upstream-Status: Submitted<br>
-<br>
-Allow hwlatdetect to be installed independently of the rest of the<br>
-tests. This is convenient for build systems that package it separately<br>
-due to the python dependency.<br>
-<br>
-Signed-off-by: Darren Hart &lt;<a href=3D"mailto:dvhart@linux.intel.com" t=
arget=3D"_blank">dvhart@linux.intel.com</a>&gt;<br>
-CC: Clark Williams &lt;<a href=3D"mailto:williams@redhat.com" target=3D"_b=
lank">williams@redhat.com</a>&gt;<br>
-CC: John Kacur &lt;<a href=3D"mailto:jkacur@redhat.com" target=3D"_blank">=
jkacur@redhat.com</a>&gt;<br>
----<br>
- Makefile | 18 +++++++++++-------<br>
- 1 file changed, 11 insertions(+), 7 deletions(-)<br>
-<br>
-diff --git a/Makefile b/Makefile<br>
-index 61e2f9f..636e63b 100644<br>
---- a/Makefile<br>
-+++ b/Makefile<br>
-@@ -119,21 +119,15 @@ changelog:<br>
- =C2=A0 =C2=A0 git log &gt;ChangeLog<br>
-<br>
- .PHONY: install<br>
--install: all<br>
-+install: all install_hwlatdetect<br>
- =C2=A0 =C2=A0 mkdir -p &quot;$(DESTDIR)$(bindir)&quot; &quot;$(DESTDIR)$(=
mandir)/man4&quot;<br>
- =C2=A0 =C2=A0 mkdir -p &quot;$(DESTDIR)$(srcdir)&quot; &quot;$(DESTDIR)$(=
mandir)/man8&quot;<br>
- =C2=A0 =C2=A0 cp $(TARGETS) &quot;$(DESTDIR)$(bindir)&quot;<br>
-- =C2=A0 =C2=A0if test -n &quot;$(PYLIB)&quot; ; then \<br>
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0install -D -m 755 src/hwlatdetect/hwlatdetect=
.py<br>
$(DESTDIR)$(PYLIB)/<u></u>hwlatdetect.py ; \<br>
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f &quot;$(DESTDIR)$(bindir)/<u></u>hwlatd=
etect&quot; ; \<br>
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s $(PYLIB)/hwlatdetect.py<br>
&quot;$(DESTDIR)$(bindir)/<u></u>hwlatdetect&quot; ; \<br>
-- =C2=A0 =C2=A0fi<br>
- =C2=A0 =C2=A0 install -D -m 644 src/backfire/backfire.c<br>
&quot;$(DESTDIR)$(srcdir)/backfire/<u></u>backfire.c&quot;<br>
- =C2=A0 =C2=A0 install -m 644 src/backfire/Makefile<br>
&quot;$(DESTDIR)$(srcdir)/backfire/<u></u>Makefile&quot;<br>
- =C2=A0 =C2=A0 gzip src/backfire/backfire.4 -c<br>
&gt;&quot;$(DESTDIR)$(mandir)/man4/<u></u>backfire.4.gz&quot;<br>
- =C2=A0 =C2=A0 gzip src/cyclictest/cyclictest.8 -c<br>
&gt;&quot;$(DESTDIR)$(mandir)/man8/<u></u>cyclictest.8.gz&quot;<br>
- =C2=A0 =C2=A0 gzip src/pi_tests/pi_stress.8 -c<br>
&gt;&quot;$(DESTDIR)$(mandir)/man8/pi_<u></u>stress.8.gz&quot;<br>
-- =C2=A0 =C2=A0gzip src/hwlatdetect/hwlatdetect.8 -c<br>
&gt;&quot;$(DESTDIR)$(mandir)/man8/<u></u>hwlatdetect.8.gz&quot;<br>
- =C2=A0 =C2=A0 gzip src/ptsematest/ptsematest.8 -c<br>
&gt;&quot;$(DESTDIR)$(mandir)/man8/<u></u>ptsematest.8.gz&quot;<br>
- =C2=A0 =C2=A0 gzip src/sigwaittest/sigwaittest.8 -c<br>
&gt;&quot;$(DESTDIR)$(mandir)/man8/<u></u>sigwaittest.8.gz&quot;<br>
- =C2=A0 =C2=A0 gzip src/svsematest/svsematest.8 -c<br>
&gt;&quot;$(DESTDIR)$(mandir)/man8/<u></u>svsematest.8.gz&quot;<br>
-@@ -141,6 +135,16 @@ install: all<br>
- =C2=A0 =C2=A0 gzip src/backfire/sendme.8 -c<br>
&gt;&quot;$(DESTDIR)$(mandir)/man8/<u></u>sendme.8.gz&quot;<br>
- =C2=A0 =C2=A0 gzip src/hackbench/hackbench.8 -c<br>
&gt;&quot;$(DESTDIR)$(mandir)/man8/<u></u>hackbench.8.gz&quot;<br>
-<br>
-+.PHONY: install_hwlatdetect<br>
-+install_hwlatdetect: hwlatdetect<br>
-+ =C2=A0 =C2=A0if test -n &quot;$(PYLIB)&quot; ; then \<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p &quot;$(DESTDIR)$(bindir)&quot; &quo=
t;$(DESTDIR)$(mandir)/man8&quot; ; \<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0install -D -m 755 src/hwlatdetect/hwlatdetect=
.py<br>
$(DESTDIR)$(PYLIB)/<u></u>hwlatdetect.py ; \<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f &quot;$(DESTDIR)$(bindir)/<u></u>hwlatd=
etect&quot; ; \<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s $(PYLIB)/hwlatdetect.py<br>
&quot;$(DESTDIR)$(bindir)/<u></u>hwlatdetect&quot; ; \<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0gzip src/hwlatdetect/hwlatdetect.8 -c<br>
&gt;&quot;$(DESTDIR)$(mandir)/man8/<u></u>hwlatdetect.8.gz&quot; ; \<br>
-+ =C2=A0 =C2=A0fi<br>
-+<br>
- .PHONY: release<br>
- release: clean changelog<br>
- =C2=A0 =C2=A0 mkdir -p releases<br>
---<br>
-1.7.11.4<br>
-<br>
diff --git<br>
a/meta/recipes-rt/rt-tests/<u></u>files/added-missing-<u></u>dependencies.p=
atch<br>
b/meta/recipes-rt/rt-tests/<u></u>files/added-missing-<u></u>dependencies.p=
atch<br>
deleted file mode 100644<br>
index e420282..0000000<br>
--- a/meta/recipes-rt/rt-tests/<u></u>files/added-missing-<u></u>dependenci=
es.patch<br>
+++ /dev/null<br>
@@ -1,50 +0,0 @@<br>
-From 82d28701486ba5a699544a168448bf<u></u>93b1ccd7b1 Mon Sep 17 00:00:00 2=
001<br>
-From: Jackie Huang &lt;<a href=3D"mailto:jackie.huang@windriver.com" targe=
t=3D"_blank">jackie.huang@windriver.com</a>&gt;<br>
-Date: Thu, 6 Dec 2012 11:26:14 +0800<br>
-Subject: [PATCH] Added missing dependencies<br>
-<br>
-Upstream-Status: Submitted [linux-rt-users]<br>
-<br>
-The following targets missed dependency on librttest.a:<br>
-pi_stress<br>
-rt-migrate-test<br>
-hackbench<br>
-<br>
-Signed-off-by: Jackie Huang &lt;<a href=3D"mailto:jackie.huang@windriver.c=
om" target=3D"_blank">jackie.huang@windriver.com</a>&gt;<br>
----<br>
- Makefile | =C2=A0 =C2=A06 +++---<br>
- 1 file changed, 3 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/Makefile b/Makefile<br>
-index fd3cdb3..60707a7 100644<br>
---- a/Makefile<br>
-+++ b/Makefile<br>
-@@ -68,14 +68,14 @@ cyclictest: cyclictest.o librttest.a<br>
- signaltest: signaltest.o librttest.a<br>
- =C2=A0 =C2=A0 $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)<br>
-<br>
--pi_stress: pi_stress.o<br>
-+pi_stress: pi_stress.o librttest.a<br>
- =C2=A0 =C2=A0 $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)<br>
-<br>
- hwlatdetect: =C2=A0src/hwlatdetect/hwlatdetect.py<br>
- =C2=A0 =C2=A0 chmod +x src/hwlatdetect/hwlatdetect.py<br>
- =C2=A0 =C2=A0 ln -s src/hwlatdetect/hwlatdetect.py hwlatdetect<br>
-<br>
--rt-migrate-test: rt-migrate-test.o<br>
-+rt-migrate-test: rt-migrate-test.o librttest.a<br>
- =C2=A0 =C2=A0 $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)<br>
-<br>
- ptsematest: ptsematest.o librttest.a<br>
-@@ -96,7 +96,7 @@ sendme: sendme.o librttest.a<br>
- pip_stress: pip_stress.o librttest.a<br>
- =C2=A0 =C2=A0 $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)<br>
-<br>
--hackbench: hackbench.o<br>
-+hackbench: hackbench.o librttest.a<br>
- =C2=A0 =C2=A0 $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)<br>
-<br>
- librttest.a: rt-utils.o error.o rt-get_cpu.o<br>
---<br>
-1.7.9.5<br>
-<br>
diff --git a/meta/recipes-rt/rt-tests/rt-<u></u>tests.inc<br>
b/meta/recipes-rt/rt-tests/rt-<u></u>tests.inc<br>
index 81f4f2b..1d876b0 100644<br>
--- a/meta/recipes-rt/rt-tests/rt-<u></u>tests.inc<br>
+++ b/meta/recipes-rt/rt-tests/rt-<u></u>tests.inc<br>
@@ -1,10 +1,7 @@<br>
-# Version v0.87<br>
-SRCREV =3D &quot;<u></u>b0413ae5ed802004fb0c4af74a1757<u></u>381fd2b91f&qu=
ot;<br>
+# Version v0.89<br>
+SRCREV =3D &quot;<u></u>9164ec4db2645f52ffdd20e6d1b72b<u></u>b0411ab40e&qu=
ot;<br>
<br>
=C2=A0 SRC_URI =3D<br>
&quot;git://<a href=3D"http://git.kernel.org/pub/scm/linux/kernel/git/clrkw=
llms/rt-tests.git" target=3D"_blank">git.kernel.org/pub/scm/<u></u>linux/ke=
rnel/git/clrkwllms/rt-<u></u>tests.git</a> \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-rt-tests-Allow-<u></u>for-=
user-specified-PYLIB.patch \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-rt-tests-Break-<u></u>out-=
install_hwlatdetect.patch \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://added-missing-<u></u>dependenci=
es.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://hackbench-fix-error-=
<u></u>check.patch \<br>
=C2=A0 &quot;<br>
<br>
diff --git a/meta/recipes-rt/rt-tests/<a href=3D"http://rt-tests_0.87.bb" t=
arget=3D"_blank">rt-<u></u>tests_0.87.bb</a><br>
b/meta/recipes-rt/rt-tests/<a href=3D"http://rt-tests_0.89.bb" target=3D"_b=
lank">rt-<u></u>tests_0.89.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-rt/rt-tests/<a href=3D"http://rt-tests_0.87.bb" ta=
rget=3D"_blank">rt-<u></u>tests_0.87.bb</a><br>
rename to meta/recipes-rt/rt-tests/<a href=3D"http://rt-tests_0.89.bb" targ=
et=3D"_blank">rt-<u></u>tests_0.89.bb</a><br>
<br>
</blockquote></blockquote>
</div></div></blockquote></div><br></div>

--047d7b2e544e46bc6704f95bd1ce--

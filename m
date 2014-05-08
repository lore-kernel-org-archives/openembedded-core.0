Return-Path: <gary.robertson@linaro.org>
X-Greylist: delayed 1376 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 May 2014 21:52:48 UTC
Received: from mail-vc0-f175.google.com (unknown [209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1E75E60167
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 21:52:48 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id hu19so1134208vcb.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 May 2014 14:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=rFYxIYndVszWyPWyg5MBE4JuavonUM96fn8yoppJ6vk=;
	b=WTlKPdDFQF07+jQ/ZNecVuwLTI84hiOWtAgzV2y7zlVaJCcUIXHvSnON2/JtAprt+E
	K2qVZqEnqZxioved9jEFoDIDxQOr5wMXx4Q8VtB6gp/xm36cgYrOodIw6wKPEQiw0gBn
	MhWo2NvXiS9oNxWJqR1AW6197oQoyMWJBLhLyvd8dSNnyp+1R9jQl1IDhXf5lGs/vtdW
	/1wwJ/KFa0HZBqALZEAQBibiVzuVpQxTiADb/fsZiHeT1vkQjNkodTLzIOngyYGA7h9i
	gFZ+DK8O/xL6BTAdqLwZZStFKRP9x3T60MFQ/gQK/JOt/9IRwGdNirPlSZRrXPZu1sjt
	FshA==
X-Gm-Message-State: ALoCoQmX6QhuJ+jMQmD8MHZFWhpXyUhN4QcLLqnXcRtCMqERI2doR8L75UxwwsnCqJo4gvJ73X/u
MIME-Version: 1.0
X-Received: by 10.52.130.225 with SMTP id oh1mr3993636vdb.8.1399584288012;
	Thu, 08 May 2014 14:24:48 -0700 (PDT)
Received: by 10.58.141.170 with HTTP; Thu, 8 May 2014 14:24:47 -0700 (PDT)
In-Reply-To: <1398272388-3326-2-git-send-email-gary.robertson@linaro.org>
References: <1397851967-24110-1-git-send-email-gary.robertson@linaro.org>
	<1398272388-3326-1-git-send-email-gary.robertson@linaro.org>
	<1398272388-3326-2-git-send-email-gary.robertson@linaro.org>
Date: Thu, 8 May 2014 16:24:47 -0500
Message-ID: <CAF7YWnzBffap=rUnEAVhJ1B6x4-v7rvv9LR+mxK6i_tw=Gqbyg@mail.gmail.com>
From: Gary Robertson <gary.robertson@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mike Holmes <mike.holmes@linaro.org>
Subject: Re: [PATCH] rt-tests: bump version 0.87 => 0.89
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
X-List-Received-Date: Thu, 08 May 2014 21:52:50 -0000
Content-Type: multipart/alternative; boundary=bcaec520ef3b5215c204f8ea1ccd

--bcaec520ef3b5215c204f8ea1ccd
Content-Type: text/plain; charset=UTF-8

OE-core developers,

I am regrettably new at patch submissions within the Linux / Open Source
community, so please forgive my breach of etiquette if I abuse the balance
between persistence and peskiness.
I submitted the first version of this recipe patch on 18 APR and received
prompt suggestions for improvement.
However since amending the patch to incorporate those improvements and
re-submitting the patch on 24 APR, I have heard no further comments or
responses.
So I am pinging the list once more to check the status of the patch.
Please let me know if additional work must be done to make the patch
acceptable.

(BTW, I authored the patch to cyclictest and Anders Roxell authored the
patch to update the recipe with the new version of the rt-tests.
I subsequently submitted the recipe patch on his behalf... that is why his
name appears as author of the patch itself.)

Thanks for your attention

Gary Robertson


On Wed, Apr 23, 2014 at 11:59 AM, <gary.robertson@linaro.org> wrote:

> From: Anders Roxell <anders.roxell@linaro.org>
>
> cyclictest was updated to correct some problems with CPU affinity selection
> and display of help and/or execution details.
> These patches were accepted by the maintainer of the cyclictest utility.
> The changes were reflected in an updated release of rt-tests - v0.89
> The cyclictest changes were successfully tested on both an ARM v7 and
> x86_64
> host environment.
> The OE recipe was updated locally to incorporate the newer rt-tests release
> and the resulting builds were verified for the same ARM v7 target
> and for qemux86.
> Patch files obsoleted by the rt-tests 0.89 release were removed from the
> recipe
>         deleted:
>  meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
>         deleted:
>  meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch
>         deleted:
>  meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
> ---
>  ...1-rt-tests-Allow-for-user-specified-PYLIB.patch |   35 ----------
>  ...02-rt-tests-Break-out-install_hwlatdetect.patch |   68
> --------------------
>  .../files/added-missing-dependencies.patch         |   50 --------------
>  meta/recipes-rt/rt-tests/rt-tests.inc              |    7 +-
>  .../{rt-tests_0.87.bb => rt-tests_0.89.bb}         |    0
>  5 files changed, 2 insertions(+), 158 deletions(-)
>  delete mode 100644
> meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
>  delete mode 100644
> meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch
>  delete mode 100644
> meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
>  rename meta/recipes-rt/rt-tests/{rt-tests_0.87.bb => rt-tests_0.89.bb}
> (100%)
>
> diff --git
> a/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
> b/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
> deleted file mode 100644
> index 8b493eb..0000000
> ---
> a/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 66765522b634952346f1a3ab7d00c7222a1f9361 Mon Sep 17 00:00:00 2001
> -Message-Id: <
> 66765522b634952346f1a3ab7d00c7222a1f9361.1347419597.git.dvhart@linux.intel.com
> >
> -From: Darren Hart <dvhart@linux.intel.com>
> -Date: Tue, 11 Sep 2012 15:19:30 -0700
> -Subject: [PATCH 1/2] rt-tests: Allow for user-specified PYLIB
> -
> -Upstream-Status: Submitted
> -
> -Allow users (build systems) to specify PYLIB. This allows for a
> -cross-build-system to specify the target PYLIB rather than the host
> -PYLIB.
> -
> -Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> -CC: Clark Williams <williams@redhat.com>
> -CC: John Kacur <jkacur@redhat.com>
> ----
> - Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 3a82407..61e2f9f 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -23,7 +23,7 @@ endif
> - CFLAGS ?= -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include
> - LDFLAGS ?=
> -
> --PYLIB  := $(shell python -c 'import distutils.sysconfig;  print
> distutils.sysconfig.get_python_lib()')
> -+PYLIB  ?= $(shell python -c 'import distutils.sysconfig;  print
> distutils.sysconfig.get_python_lib()')
> -
> - ifndef DEBUG
> -       CFLAGS  += -O2
> ---
> -1.7.11.4
> -
> diff --git
> a/meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch
> b/meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch
> deleted file mode 100644
> index bc6136f..0000000
> ---
> a/meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -From af93e580d005a2bba6ed36528003af4cf631adb8 Mon Sep 17 00:00:00 2001
> -Message-Id: <
> af93e580d005a2bba6ed36528003af4cf631adb8.1347419597.git.dvhart@linux.intel.com
> >
> -In-Reply-To: <
> 66765522b634952346f1a3ab7d00c7222a1f9361.1347419597.git.dvhart@linux.intel.com
> >
> -References: <
> 66765522b634952346f1a3ab7d00c7222a1f9361.1347419597.git.dvhart@linux.intel.com
> >
> -From: Darren Hart <dvhart@linux.intel.com>
> -Date: Tue, 11 Sep 2012 14:51:10 -0700
> -Subject: [PATCH 2/2] rt-tests: Break out install_hwlatdetect
> -
> -Upstream-Status: Submitted
> -
> -Allow hwlatdetect to be installed independently of the rest of the
> -tests. This is convenient for build systems that package it separately
> -due to the python dependency.
> -
> -Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> -CC: Clark Williams <williams@redhat.com>
> -CC: John Kacur <jkacur@redhat.com>
> ----
> - Makefile | 18 +++++++++++-------
> - 1 file changed, 11 insertions(+), 7 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 61e2f9f..636e63b 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -119,21 +119,15 @@ changelog:
> -       git log >ChangeLog
> -
> - .PHONY: install
> --install: all
> -+install: all install_hwlatdetect
> -       mkdir -p "$(DESTDIR)$(bindir)" "$(DESTDIR)$(mandir)/man4"
> -       mkdir -p "$(DESTDIR)$(srcdir)" "$(DESTDIR)$(mandir)/man8"
> -       cp $(TARGETS) "$(DESTDIR)$(bindir)"
> --      if test -n "$(PYLIB)" ; then \
> --              install -D -m 755 src/hwlatdetect/hwlatdetect.py
> $(DESTDIR)$(PYLIB)/hwlatdetect.py ; \
> --              rm -f "$(DESTDIR)$(bindir)/hwlatdetect" ; \
> --              ln -s $(PYLIB)/hwlatdetect.py
> "$(DESTDIR)$(bindir)/hwlatdetect" ; \
> --      fi
> -       install -D -m 644 src/backfire/backfire.c
> "$(DESTDIR)$(srcdir)/backfire/backfire.c"
> -       install -m 644 src/backfire/Makefile
> "$(DESTDIR)$(srcdir)/backfire/Makefile"
> -       gzip src/backfire/backfire.4 -c
> >"$(DESTDIR)$(mandir)/man4/backfire.4.gz"
> -       gzip src/cyclictest/cyclictest.8 -c
> >"$(DESTDIR)$(mandir)/man8/cyclictest.8.gz"
> -       gzip src/pi_tests/pi_stress.8 -c
> >"$(DESTDIR)$(mandir)/man8/pi_stress.8.gz"
> --      gzip src/hwlatdetect/hwlatdetect.8 -c
> >"$(DESTDIR)$(mandir)/man8/hwlatdetect.8.gz"
> -       gzip src/ptsematest/ptsematest.8 -c
> >"$(DESTDIR)$(mandir)/man8/ptsematest.8.gz"
> -       gzip src/sigwaittest/sigwaittest.8 -c
> >"$(DESTDIR)$(mandir)/man8/sigwaittest.8.gz"
> -       gzip src/svsematest/svsematest.8 -c
> >"$(DESTDIR)$(mandir)/man8/svsematest.8.gz"
> -@@ -141,6 +135,16 @@ install: all
> -       gzip src/backfire/sendme.8 -c
> >"$(DESTDIR)$(mandir)/man8/sendme.8.gz"
> -       gzip src/hackbench/hackbench.8 -c
> >"$(DESTDIR)$(mandir)/man8/hackbench.8.gz"
> -
> -+.PHONY: install_hwlatdetect
> -+install_hwlatdetect: hwlatdetect
> -+      if test -n "$(PYLIB)" ; then \
> -+              mkdir -p "$(DESTDIR)$(bindir)" "$(DESTDIR)$(mandir)/man8"
> ; \
> -+              install -D -m 755 src/hwlatdetect/hwlatdetect.py
> $(DESTDIR)$(PYLIB)/hwlatdetect.py ; \
> -+              rm -f "$(DESTDIR)$(bindir)/hwlatdetect" ; \
> -+              ln -s $(PYLIB)/hwlatdetect.py
> "$(DESTDIR)$(bindir)/hwlatdetect" ; \
> -+              gzip src/hwlatdetect/hwlatdetect.8 -c
> >"$(DESTDIR)$(mandir)/man8/hwlatdetect.8.gz" ; \
> -+      fi
> -+
> - .PHONY: release
> - release: clean changelog
> -       mkdir -p releases
> ---
> -1.7.11.4
> -
> diff --git
> a/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
> b/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
> deleted file mode 100644
> index e420282..0000000
> --- a/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From 82d28701486ba5a699544a168448bf93b1ccd7b1 Mon Sep 17 00:00:00 2001
> -From: Jackie Huang <jackie.huang@windriver.com>
> -Date: Thu, 6 Dec 2012 11:26:14 +0800
> -Subject: [PATCH] Added missing dependencies
> -
> -Upstream-Status: Submitted [linux-rt-users]
> -
> -The following targets missed dependency on librttest.a:
> -pi_stress
> -rt-migrate-test
> -hackbench
> -
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ----
> - Makefile |    6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index fd3cdb3..60707a7 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -68,14 +68,14 @@ cyclictest: cyclictest.o librttest.a
> - signaltest: signaltest.o librttest.a
> -       $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
> -
> --pi_stress: pi_stress.o
> -+pi_stress: pi_stress.o librttest.a
> -       $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
> -
> - hwlatdetect:  src/hwlatdetect/hwlatdetect.py
> -       chmod +x src/hwlatdetect/hwlatdetect.py
> -       ln -s src/hwlatdetect/hwlatdetect.py hwlatdetect
> -
> --rt-migrate-test: rt-migrate-test.o
> -+rt-migrate-test: rt-migrate-test.o librttest.a
> -       $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
> -
> - ptsematest: ptsematest.o librttest.a
> -@@ -96,7 +96,7 @@ sendme: sendme.o librttest.a
> - pip_stress: pip_stress.o librttest.a
> -       $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
> -
> --hackbench: hackbench.o
> -+hackbench: hackbench.o librttest.a
> -       $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
> -
> - librttest.a: rt-utils.o error.o rt-get_cpu.o
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc
> b/meta/recipes-rt/rt-tests/rt-tests.inc
> index 81f4f2b..1d876b0 100644
> --- a/meta/recipes-rt/rt-tests/rt-tests.inc
> +++ b/meta/recipes-rt/rt-tests/rt-tests.inc
> @@ -1,10 +1,7 @@
> -# Version v0.87
> -SRCREV = "b0413ae5ed802004fb0c4af74a1757381fd2b91f"
> +# Version v0.89
> +SRCREV = "9164ec4db2645f52ffdd20e6d1b72bb0411ab40e"
>
>  SRC_URI = "git://
> git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git \
> -           file://0001-rt-tests-Allow-for-user-specified-PYLIB.patch \
> -           file://0002-rt-tests-Break-out-install_hwlatdetect.patch \
> -           file://added-missing-dependencies.patch \
>             file://hackbench-fix-error-check.patch \
>  "
>
> diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.87.bbb/meta/recipes-rt/rt-tests/
> rt-tests_0.89.bb
> similarity index 100%
> rename from meta/recipes-rt/rt-tests/rt-tests_0.87.bb
> rename to meta/recipes-rt/rt-tests/rt-tests_0.89.bb
> --
> 1.7.9.5
>
>

--bcaec520ef3b5215c204f8ea1ccd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>OE-core developers,<br><br></div>I am =
regrettably new at patch submissions within the Linux / Open Source communi=
ty, so please forgive my breach of etiquette if I abuse the balance between=
 persistence and peskiness.<br>
</div>I submitted the first version of this recipe patch on 18 APR and rece=
ived prompt suggestions for improvement.<br>However since amending the patc=
h to incorporate those improvements and re-submitting the patch on 24 APR, =
I have heard no further comments or responses.<br>
</div>So I am pinging the list once more to check the status of the patch.=
=C2=A0 Please let me know if additional work must be done to make the patch=
 acceptable.<br><br>(BTW, I authored the patch to cyclictest and Anders Rox=
ell authored the patch to update the recipe with the new version of the rt-=
tests.<br>
I subsequently submitted the recipe patch on his behalf... that is why his =
name appears as author of the patch itself.)<br><br></div><div>Thanks for y=
our attention<br><br></div><div>Gary Robertson<br></div><div class=3D"gmail=
_extra">
<br><br><div class=3D"gmail_quote">On Wed, Apr 23, 2014 at 11:59 AM,  <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:gary.robertson@linaro.org" target=3D"_bl=
ank">gary.robertson@linaro.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
From: Anders Roxell &lt;<a href=3D"mailto:anders.roxell@linaro.org">anders.=
roxell@linaro.org</a>&gt;<br>
<div class=3D""><br>
cyclictest was updated to correct some problems with CPU affinity selection=
<br>
and display of help and/or execution details.<br>
These patches were accepted by the maintainer of the cyclictest utility.<br=
>
The changes were reflected in an updated release of rt-tests - v0.89<br>
The cyclictest changes were successfully tested on both an ARM v7 and x86_6=
4<br>
</div>host environment.<br>
The OE recipe was updated locally to incorporate the newer rt-tests release=
<br>
<div class=3D"">and the resulting builds were verified for the same ARM v7 =
target<br>
and for qemux86.<br>
</div>Patch files obsoleted by the rt-tests 0.89 release were removed from =
the recipe<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 deleted: =C2=A0 =C2=A0meta/recipes-rt/rt-tests/=
files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 deleted: =C2=A0 =C2=A0meta/recipes-rt/rt-tests/=
files/0002-rt-tests-Break-out-install_hwlatdetect.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 deleted: =C2=A0 =C2=A0meta/recipes-rt/rt-tests/=
files/added-missing-dependencies.patch<br>
<div class=3D""><br>
Signed-off-by: Anders Roxell &lt;<a href=3D"mailto:anders.roxell@linaro.org=
">anders.roxell@linaro.org</a>&gt;<br>
Signed-off-by: Gary S. Robertson &lt;<a href=3D"mailto:gary.robertson@linar=
o.org">gary.robertson@linaro.org</a>&gt;<br>
---<br>
</div>=C2=A0...1-rt-tests-Allow-for-user-specified-PYLIB.patch | =C2=A0 35 =
----------<br>
=C2=A0...02-rt-tests-Break-out-install_hwlatdetect.patch | =C2=A0 68 ------=
--------------<br>
=C2=A0.../files/added-missing-dependencies.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 50 --------------<br>
=C2=A0meta/recipes-rt/rt-tests/rt-tests.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A07 +-<br>
<div class=3D"">=C2=A0.../{<a href=3D"http://rt-tests_0.87.bb" target=3D"_b=
lank">rt-tests_0.87.bb</a> =3D&gt; <a href=3D"http://rt-tests_0.89.bb" targ=
et=3D"_blank">rt-tests_0.89.bb</a>} =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A00<br>
</div>=C2=A05 files changed, 2 insertions(+), 158 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow=
-for-user-specified-PYLIB.patch<br>
=C2=A0delete mode 100644 meta/recipes-rt/rt-tests/files/0002-rt-tests-Break=
-out-install_hwlatdetect.patch<br>
=C2=A0delete mode 100644 meta/recipes-rt/rt-tests/files/added-missing-depen=
dencies.patch<br>
<div class=3D"">=C2=A0rename meta/recipes-rt/rt-tests/{<a href=3D"http://rt=
-tests_0.87.bb" target=3D"_blank">rt-tests_0.87.bb</a> =3D&gt; <a href=3D"h=
ttp://rt-tests_0.89.bb" target=3D"_blank">rt-tests_0.89.bb</a>} (100%)<br>
<br>
</div>diff --git a/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-u=
ser-specified-PYLIB.patch b/meta/recipes-rt/rt-tests/files/0001-rt-tests-Al=
low-for-user-specified-PYLIB.patch<br>
deleted file mode 100644<br>
index 8b493eb..0000000<br>
--- a/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified=
-PYLIB.patch<br>
+++ /dev/null<br>
@@ -1,35 +0,0 @@<br>
-From 66765522b634952346f1a3ab7d00c7222a1f9361 Mon Sep 17 00:00:00 2001<br>
-Message-Id: &lt;<a href=3D"mailto:66765522b634952346f1a3ab7d00c7222a1f9361=
.1347419597.git.dvhart@linux.intel.com">66765522b634952346f1a3ab7d00c7222a1=
f9361.1347419597.git.dvhart@linux.intel.com</a>&gt;<br>
-From: Darren Hart &lt;<a href=3D"mailto:dvhart@linux.intel.com">dvhart@lin=
ux.intel.com</a>&gt;<br>
-Date: Tue, 11 Sep 2012 15:19:30 -0700<br>
-Subject: [PATCH 1/2] rt-tests: Allow for user-specified PYLIB<br>
-<br>
-Upstream-Status: Submitted<br>
-<br>
-Allow users (build systems) to specify PYLIB. This allows for a<br>
-cross-build-system to specify the target PYLIB rather than the host<br>
-PYLIB.<br>
-<br>
-Signed-off-by: Darren Hart &lt;<a href=3D"mailto:dvhart@linux.intel.com">d=
vhart@linux.intel.com</a>&gt;<br>
-CC: Clark Williams &lt;<a href=3D"mailto:williams@redhat.com">williams@red=
hat.com</a>&gt;<br>
-CC: John Kacur &lt;<a href=3D"mailto:jkacur@redhat.com">jkacur@redhat.com<=
/a>&gt;<br>
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
=A0print distutils.sysconfig.get_python_lib()&#39;)<br>
-+PYLIB =C2=A0?=3D $(shell python -c &#39;import distutils.sysconfig; =C2=
=A0print distutils.sysconfig.get_python_lib()&#39;)<br>
-<br>
- ifndef DEBUG<br>
- =C2=A0 =C2=A0 =C2=A0 CFLAGS =C2=A0+=3D -O2<br>
---<br>
-1.7.11.4<br>
-<br>
diff --git a/meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install=
_hwlatdetect.patch b/meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out=
-install_hwlatdetect.patch<br>
deleted file mode 100644<br>
index bc6136f..0000000<br>
--- a/meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatd=
etect.patch<br>
+++ /dev/null<br>
@@ -1,68 +0,0 @@<br>
-From af93e580d005a2bba6ed36528003af4cf631adb8 Mon Sep 17 00:00:00 2001<br>
-Message-Id: &lt;<a href=3D"mailto:af93e580d005a2bba6ed36528003af4cf631adb8=
.1347419597.git.dvhart@linux.intel.com">af93e580d005a2bba6ed36528003af4cf63=
1adb8.1347419597.git.dvhart@linux.intel.com</a>&gt;<br>
-In-Reply-To: &lt;<a href=3D"mailto:66765522b634952346f1a3ab7d00c7222a1f936=
1.1347419597.git.dvhart@linux.intel.com">66765522b634952346f1a3ab7d00c7222a=
1f9361.1347419597.git.dvhart@linux.intel.com</a>&gt;<br>
-References: &lt;<a href=3D"mailto:66765522b634952346f1a3ab7d00c7222a1f9361=
.1347419597.git.dvhart@linux.intel.com">66765522b634952346f1a3ab7d00c7222a1=
f9361.1347419597.git.dvhart@linux.intel.com</a>&gt;<br>
-From: Darren Hart &lt;<a href=3D"mailto:dvhart@linux.intel.com">dvhart@lin=
ux.intel.com</a>&gt;<br>
-Date: Tue, 11 Sep 2012 14:51:10 -0700<br>
-Subject: [PATCH 2/2] rt-tests: Break out install_hwlatdetect<br>
-<br>
-Upstream-Status: Submitted<br>
-<br>
-Allow hwlatdetect to be installed independently of the rest of the<br>
-tests. This is convenient for build systems that package it separately<br>
-due to the python dependency.<br>
-<br>
-Signed-off-by: Darren Hart &lt;<a href=3D"mailto:dvhart@linux.intel.com">d=
vhart@linux.intel.com</a>&gt;<br>
-CC: Clark Williams &lt;<a href=3D"mailto:williams@redhat.com">williams@red=
hat.com</a>&gt;<br>
-CC: John Kacur &lt;<a href=3D"mailto:jkacur@redhat.com">jkacur@redhat.com<=
/a>&gt;<br>
----<br>
- Makefile | 18 +++++++++++-------<br>
- 1 file changed, 11 insertions(+), 7 deletions(-)<br>
-<br>
-diff --git a/Makefile b/Makefile<br>
-index 61e2f9f..636e63b 100644<br>
---- a/Makefile<br>
-+++ b/Makefile<br>
-@@ -119,21 +119,15 @@ changelog:<br>
- =C2=A0 =C2=A0 =C2=A0 git log &gt;ChangeLog<br>
-<br>
- .PHONY: install<br>
--install: all<br>
-+install: all install_hwlatdetect<br>
- =C2=A0 =C2=A0 =C2=A0 mkdir -p &quot;$(DESTDIR)$(bindir)&quot; &quot;$(DES=
TDIR)$(mandir)/man4&quot;<br>
- =C2=A0 =C2=A0 =C2=A0 mkdir -p &quot;$(DESTDIR)$(srcdir)&quot; &quot;$(DES=
TDIR)$(mandir)/man8&quot;<br>
- =C2=A0 =C2=A0 =C2=A0 cp $(TARGETS) &quot;$(DESTDIR)$(bindir)&quot;<br>
-- =C2=A0 =C2=A0 =C2=A0if test -n &quot;$(PYLIB)&quot; ; then \<br>
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -D -m 755 src/hw=
latdetect/hwlatdetect.py $(DESTDIR)$(PYLIB)/hwlatdetect.py ; \<br>
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f &quot;$(DESTDIR)$(=
bindir)/hwlatdetect&quot; ; \<br>
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s $(PYLIB)/hwlatdete=
ct.py &quot;$(DESTDIR)$(bindir)/hwlatdetect&quot; ; \<br>
-- =C2=A0 =C2=A0 =C2=A0fi<br>
- =C2=A0 =C2=A0 =C2=A0 install -D -m 644 src/backfire/backfire.c &quot;$(DE=
STDIR)$(srcdir)/backfire/backfire.c&quot;<br>
- =C2=A0 =C2=A0 =C2=A0 install -m 644 src/backfire/Makefile &quot;$(DESTDIR=
)$(srcdir)/backfire/Makefile&quot;<br>
- =C2=A0 =C2=A0 =C2=A0 gzip src/backfire/backfire.4 -c &gt;&quot;$(DESTDIR)=
$(mandir)/man4/backfire.4.gz&quot;<br>
- =C2=A0 =C2=A0 =C2=A0 gzip src/cyclictest/cyclictest.8 -c &gt;&quot;$(DEST=
DIR)$(mandir)/man8/cyclictest.8.gz&quot;<br>
- =C2=A0 =C2=A0 =C2=A0 gzip src/pi_tests/pi_stress.8 -c &gt;&quot;$(DESTDIR=
)$(mandir)/man8/pi_stress.8.gz&quot;<br>
-- =C2=A0 =C2=A0 =C2=A0gzip src/hwlatdetect/hwlatdetect.8 -c &gt;&quot;$(DE=
STDIR)$(mandir)/man8/hwlatdetect.8.gz&quot;<br>
- =C2=A0 =C2=A0 =C2=A0 gzip src/ptsematest/ptsematest.8 -c &gt;&quot;$(DEST=
DIR)$(mandir)/man8/ptsematest.8.gz&quot;<br>
- =C2=A0 =C2=A0 =C2=A0 gzip src/sigwaittest/sigwaittest.8 -c &gt;&quot;$(DE=
STDIR)$(mandir)/man8/sigwaittest.8.gz&quot;<br>
- =C2=A0 =C2=A0 =C2=A0 gzip src/svsematest/svsematest.8 -c &gt;&quot;$(DEST=
DIR)$(mandir)/man8/svsematest.8.gz&quot;<br>
-@@ -141,6 +135,16 @@ install: all<br>
- =C2=A0 =C2=A0 =C2=A0 gzip src/backfire/sendme.8 -c &gt;&quot;$(DESTDIR)$(=
mandir)/man8/sendme.8.gz&quot;<br>
- =C2=A0 =C2=A0 =C2=A0 gzip src/hackbench/hackbench.8 -c &gt;&quot;$(DESTDI=
R)$(mandir)/man8/hackbench.8.gz&quot;<br>
-<br>
-+.PHONY: install_hwlatdetect<br>
-+install_hwlatdetect: hwlatdetect<br>
-+ =C2=A0 =C2=A0 =C2=A0if test -n &quot;$(PYLIB)&quot; ; then \<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p &quot;$(DESTDIR=
)$(bindir)&quot; &quot;$(DESTDIR)$(mandir)/man8&quot; ; \<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -D -m 755 src/hw=
latdetect/hwlatdetect.py $(DESTDIR)$(PYLIB)/hwlatdetect.py ; \<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f &quot;$(DESTDIR)$(=
bindir)/hwlatdetect&quot; ; \<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s $(PYLIB)/hwlatdete=
ct.py &quot;$(DESTDIR)$(bindir)/hwlatdetect&quot; ; \<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gzip src/hwlatdetect/hwl=
atdetect.8 -c &gt;&quot;$(DESTDIR)$(mandir)/man8/hwlatdetect.8.gz&quot; ; \=
<br>
-+ =C2=A0 =C2=A0 =C2=A0fi<br>
-+<br>
- .PHONY: release<br>
- release: clean changelog<br>
- =C2=A0 =C2=A0 =C2=A0 mkdir -p releases<br>
---<br>
-1.7.11.4<br>
-<br>
diff --git a/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patc=
h b/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch<br>
deleted file mode 100644<br>
index e420282..0000000<br>
--- a/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch<br>
+++ /dev/null<br>
@@ -1,50 +0,0 @@<br>
-From 82d28701486ba5a699544a168448bf93b1ccd7b1 Mon Sep 17 00:00:00 2001<br>
-From: Jackie Huang &lt;<a href=3D"mailto:jackie.huang@windriver.com">jacki=
e.huang@windriver.com</a>&gt;<br>
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
om">jackie.huang@windriver.com</a>&gt;<br>
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
- =C2=A0 =C2=A0 =C2=A0 $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)<br>
-<br>
--pi_stress: pi_stress.o<br>
-+pi_stress: pi_stress.o librttest.a<br>
- =C2=A0 =C2=A0 =C2=A0 $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)<br>
-<br>
- hwlatdetect: =C2=A0src/hwlatdetect/hwlatdetect.py<br>
- =C2=A0 =C2=A0 =C2=A0 chmod +x src/hwlatdetect/hwlatdetect.py<br>
- =C2=A0 =C2=A0 =C2=A0 ln -s src/hwlatdetect/hwlatdetect.py hwlatdetect<br>
-<br>
--rt-migrate-test: rt-migrate-test.o<br>
-+rt-migrate-test: rt-migrate-test.o librttest.a<br>
- =C2=A0 =C2=A0 =C2=A0 $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)<br>
-<br>
- ptsematest: ptsematest.o librttest.a<br>
-@@ -96,7 +96,7 @@ sendme: sendme.o librttest.a<br>
- pip_stress: pip_stress.o librttest.a<br>
- =C2=A0 =C2=A0 =C2=A0 $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)<br>
-<br>
--hackbench: hackbench.o<br>
-+hackbench: hackbench.o librttest.a<br>
- =C2=A0 =C2=A0 =C2=A0 $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)<br>
-<br>
- librttest.a: rt-utils.o error.o rt-get_cpu.o<br>
---<br>
-1.7.9.5<br>
<div class=3D"im HOEnZb">-<br>
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tes=
ts/rt-tests.inc<br>
index 81f4f2b..1d876b0 100644<br>
--- a/meta/recipes-rt/rt-tests/rt-tests.inc<br>
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc<br>
@@ -1,10 +1,7 @@<br>
-# Version v0.87<br>
-SRCREV =3D &quot;b0413ae5ed802004fb0c4af74a1757381fd2b91f&quot;<br>
+# Version v0.89<br>
+SRCREV =3D &quot;9164ec4db2645f52ffdd20e6d1b72bb0411ab40e&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/linu=
x/kernel/git/clrkwllms/rt-tests.git" target=3D"_blank">git.kernel.org/pub/s=
cm/linux/kernel/git/clrkwllms/rt-tests.git</a> \<br>
</div><div class=3D"im HOEnZb">- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://=
0001-rt-tests-Allow-for-user-specified-PYLIB.patch \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-rt-tests-Break-out-install=
_hwlatdetect.patch \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://added-missing-dependencies.patc=
h \<br>
</div><div class=3D"HOEnZb"><div class=3D"h5">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 file://hackbench-fix-error-check.patch \<br>
=C2=A0&quot;<br>
<br>
diff --git a/meta/recipes-rt/rt-tests/<a href=3D"http://rt-tests_0.87.bb" t=
arget=3D"_blank">rt-tests_0.87.bb</a> b/meta/recipes-rt/rt-tests/<a href=3D=
"http://rt-tests_0.89.bb" target=3D"_blank">rt-tests_0.89.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-rt/rt-tests/<a href=3D"http://rt-tests_0.87.bb" ta=
rget=3D"_blank">rt-tests_0.87.bb</a><br>
rename to meta/recipes-rt/rt-tests/<a href=3D"http://rt-tests_0.89.bb" targ=
et=3D"_blank">rt-tests_0.89.bb</a><br>
--<br>
1.7.9.5<br>
<br>
</div></div></blockquote></div><br></div></div>

--bcaec520ef3b5215c204f8ea1ccd--

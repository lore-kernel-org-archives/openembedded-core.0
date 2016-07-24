Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4ED4760290;
	Sun, 24 Jul 2016 18:30:58 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id f93so10139738lfi.0;
	Sun, 24 Jul 2016 11:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c8W/MZtDL+iUn0h5OtHu4JISuD5qSApMr+t3wXmQC2Q=;
	b=nk2LgbBXtaNz3QHoyYAYY5FRV8fhK5VmL6a+2a/oO3ZUYX/nTc20phFsPYvyFBSR1v
	hCINKJIhd4BXmNypBI377HNlG3hsPsSzhWhH9YlaSB5lo9QBOTdBZop3n++y/SRZ/Rtm
	ZJCq6M6V8CymzgDv4erIkV0DVA/RROMv+hvdJxthg1/jETVjjcIRXJw7gWTZ9xJYofns
	F3CIZUlwUlhKzbybxsk6VCfANaN/mtYHhP5nF4RsX0hOxbV8Bluc6MlTfs31RjDfv5xp
	+NHfWPwPB0UkXU4MVvxwrKMXXR2KvW+p5dEG2cHiLVVNgLs2NbjC6ASW7we5qiT0s9zz
	DgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c8W/MZtDL+iUn0h5OtHu4JISuD5qSApMr+t3wXmQC2Q=;
	b=CnmJ5X7z9UBgQ3JZZYpXtZQd68F1vjtHef7IJGy1XLVm1ij4QSjLbur4fkAjW93Amc
	lVOGGKam3MB/zXhw3z0noxkFhM0qFgbKoSg7K5J4w4I+PtiUFJy+53yzxeQ1Z7ILxeVU
	4ssI7Ae5lhsI5JZfOWfrsqw3/wkMYGZ+uh1qppDsA1mXXi2713QPzb3fZRE8EsIGE2vN
	gIk3CDwKjiRpeorXPmuqigCRobEC+YhfaYKqrOnAz8NRaGHB7R9/XeSSsknJDfuLAjAX
	4pNi4d2UKs2Yg+eQlg4MA1RNyegbmr84wtBG6UPyvJGSSjoJ61TPbO7ImYY35RIKepKU
	P1GQ==
X-Gm-Message-State: AEkoouv59NcLqcejjHxCIa7BB35Dtlu3vx44ZEbb//Q1UdKrL9O/jUOEkfq5Tjq+fTsHwPHM85Mibjb7Qhrrtw==
X-Received: by 10.25.213.20 with SMTP id m20mr6885328lfg.61.1469385057532;
	Sun, 24 Jul 2016 11:30:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Sun, 24 Jul 2016 11:30:56 -0700 (PDT)
In-Reply-To: <CAMKF1spvPZ_tSZ_FDeZt6baoG4afvvys++PwVRnGY6j_DFsSZw@mail.gmail.com>
References: <20160708085912.13734.77555@opal.openembedded.org>
	<20160708085918.3A528501B3@opal.openembedded.org>
	<20160724121138.i7fp26ateflny4kl@jama>
	<CAMKF1spvPZ_tSZ_FDeZt6baoG4afvvys++PwVRnGY6j_DFsSZw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 24 Jul 2016 20:30:56 +0200
Message-ID: <CA+chaQckZcAKrVbj1Rt5=PhW1n5kj6hhDoCo61ckKs3PUsos6w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 21/28: rt-tests: move ptest to python3
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
X-List-Received-Date: Sun, 24 Jul 2016 18:30:59 -0000
Content-Type: multipart/alternative; boundary=001a1141238c648183053865de87

--001a1141238c648183053865de87
Content-Type: text/plain; charset=UTF-8

Good catch,

it's also in not mangled logs:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160724_010417.log/2_max/failed/rt-tests.log

so it' probably some missing space in append or some wrong sed call in some
Makefile or something like that.

On Sun, Jul 24, 2016 at 4:53 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Jul 24, 2016 at 5:11 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > Any idea why it fails now like this:
> >
> > http://errors.yoctoproject.org/Errors/Details/73086/
> >
>
> it shows --sysroot=TOPDIR/tmp-glibc/sysroots/qemuarm-O2
>
> is that what you see in your logs  too. I know they get edited before
> uploading so may be its just the log munging issue.
> but this could be problem.
>
> > ?
> >
> > On Fri, Jul 08, 2016 at 08:59:33AM +0000, git@git.openembedded.org
> wrote:
> >> rpurdie pushed a commit to branch master
> >> in repository openembedded-core.
> >>
> >> commit 2767cbe014f84c9ad42ed8ef1eca7caa862e5196
> >> Author: Maxin B. John <maxin.john@intel.com>
> >> AuthorDate: Fri Jul 1 11:39:02 2016 +0300
> >>
> >>     rt-tests: move ptest to python3
> >>
> >>     convert python2 based ptest of rt-tests package to python3
> >>
> >>     Signed-off-by: Maxin B. John <maxin.john@intel.com>
> >>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> >> ---
> >>  meta/recipes-rt/rt-tests/files/rt_bmark.py | 26
> +++++++++++++-------------
> >>  meta/recipes-rt/rt-tests/files/run-ptest   |  2 +-
> >>  meta/recipes-rt/rt-tests/rt-tests_2.0.bb   |  2 +-
> >>  3 files changed, 15 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/meta/recipes-rt/rt-tests/files/rt_bmark.py
> b/meta/recipes-rt/rt-tests/files/rt_bmark.py
> >> index 0e2b105..080a655 100755
> >> --- a/meta/recipes-rt/rt-tests/files/rt_bmark.py
> >> +++ b/meta/recipes-rt/rt-tests/files/rt_bmark.py
> >> @@ -1,4 +1,4 @@
> >> -#!/usr/bin/python
> >> +#!/usr/bin/env python3
> >>  # -*- coding: utf-8 -*-
> >>
> >>  # SPDX-License-Identifier:     BSD-3-Clause
> >> @@ -106,8 +106,8 @@ def tc_name(sub_name):
> >>
> >>  def log(*msg):
> >>          tmp = "".join(map(str, msg)) # 'map(str, ...' allows numbers
> >> -        for line in tmp.split("\n"):
> >> -                print "#", line
> >> +        for line in tmp.splitlines():
> >> +                print("#", line)
> >>
> >>
> #-------------------------------------------------------------------------------
> >>  # Like log(), but with a timestamp added
> >> @@ -265,7 +265,7 @@ cmd = ("cyclictest",
> >>         "-d", str(interval_delta),
> >>         "-l", str(loop_count)
> >>         )
> >> -rex =
> re.compile("C:\s*(\d+).*Min:\s*(\d+).*Avg:\s*(\d+).*Max:\s*(\d+)")
> >> +rex =
> re.compile(b"C:\s*(\d+).*Min:\s*(\d+).*Avg:\s*(\d+).*Max:\s*(\d+)")
> >>
> >>  def run_cyclictest_once():
> >>          res = subprocess.check_output(cmd)
> >> @@ -283,7 +283,7 @@ def run_cyclictest_once():
> >>          avg_sum = 0
> >>          avg_cnt = 0
> >>
> >> -        for line in res.split("\n"):
> >> +        for line in res.splitlines():
> >>                  m = rex.search(line)
> >>                  if m is not None:
> >>                          minlist.append(int(m.group(2)))
> >> @@ -376,11 +376,11 @@ class cyclictest_runner:
> >>                          log()
> >>                          log("PASS")
> >>
> >> -                        print
> >> -                        print tc_name(name), "[Min/us,Avg/us,Max/us]:",
> >> -                        print "%d,%.1f,%d" % (bm_min,bm_avg, bm_max)
> >> -                        print "PASS:", tc_name(name)
> >> -                        print
> >> +                        print()
> >> +                        print(tc_name(name),
> "[Min/us,Avg/us,Max/us]:",)
> >> +                        print("%d,%.1f,%d" % (bm_min,bm_avg, bm_max))
> >> +                        print("PASS:", tc_name(name))
> >> +                        print()
> >>
> >>                  except Exception:
> >>                          log()
> >> @@ -391,9 +391,9 @@ class cyclictest_runner:
> >>                          log("WD: ", os.getcwd())
> >>                          log()
> >>                          log("FAIL")
> >> -                        print
> >> -                        print "FAIL:", tc_name(name)
> >> -                        print
> >> +                        print()
> >> +                        print("FAIL:", tc_name(name))
> >> +                        print()
> >>
> >>
> #-------------------------------------------------------------------------------
> >>
> >> diff --git a/meta/recipes-rt/rt-tests/files/run-ptest
> b/meta/recipes-rt/rt-tests/files/run-ptest
> >> index 8e6d3e3..b7c5e29 100644
> >> --- a/meta/recipes-rt/rt-tests/files/run-ptest
> >> +++ b/meta/recipes-rt/rt-tests/files/run-ptest
> >> @@ -1,3 +1,3 @@
> >>  #!/bin/sh
> >>
> >> -python ./rt_bmark.py
> >> +python3 ./rt_bmark.py
> >> diff --git a/meta/recipes-rt/rt-tests/rt-tests_2.0.bb
> b/meta/recipes-rt/rt-tests/rt-tests_2.0.bb
> >> index 21780d1..83869b8 100644
> >> --- a/meta/recipes-rt/rt-tests/rt-tests_2.0.bb
> >> +++ b/meta/recipes-rt/rt-tests/rt-tests_2.0.bb
> >> @@ -28,6 +28,6 @@ do_install_ptest() {
> >>          cp ${WORKDIR}/rt_bmark.py ${D}${PTEST_PATH}
> >>  }
> >>
> >> -RDEPENDS_${PN}-ptest += " stress python python-subprocess
> python-multiprocessing python-datetime python-re python-lang"
> >> +RDEPENDS_${PN}-ptest += " stress python3 python3-subprocess
> python3-multiprocessing python3-datetime python3-re python3-lang
> python3-misc"
> >>
> >>  FILES_${PN} += "${prefix}/src/backfire"
> >>
> >> --
> >> To stop receiving notification emails like this one, please contact
> >> the administrator of this repository.
> >> --
> >> _______________________________________________
> >> Openembedded-commits mailing list
> >> Openembedded-commits@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>

--001a1141238c648183053865de87
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Good catch,<div><br></div><div>it&#39;s also in not mangle=
d logs:</div><div><a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world=
/log.dependencies.qemuarm.20160724_010417.log/2_max/failed/rt-tests.log">ht=
tp://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160=
724_010417.log/2_max/failed/rt-tests.log</a><br></div><div><br></div><div>s=
o it&#39; probably some missing space in append or some wrong sed call in s=
ome Makefile or something like that.</div></div><div class=3D"gmail_extra">=
<br><div class=3D"gmail_quote">On Sun, Jul 24, 2016 at 4:53 PM, Khem Raj <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><span class=3D"">On Sun, Jul 24, 2016 at 5:11 AM, Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br=
>
&gt; Any idea why it fails now like this:<br>
&gt;<br>
&gt; <a href=3D"http://errors.yoctoproject.org/Errors/Details/73086/" rel=
=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Det=
ails/73086/</a><br>
&gt;<br>
<br>
</span>it shows --sysroot=3DTOPDIR/tmp-glibc/sysroots/qemuarm-O2<br>
<br>
is that what you see in your logs=C2=A0 too. I know they get edited before<=
br>
uploading so may be its just the log munging issue.<br>
but this could be problem.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; ?<br>
&gt;<br>
&gt; On Fri, Jul 08, 2016 at 08:59:33AM +0000, <a href=3D"mailto:git@git.op=
enembedded.org">git@git.openembedded.org</a> wrote:<br>
&gt;&gt; rpurdie pushed a commit to branch master<br>
&gt;&gt; in repository openembedded-core.<br>
&gt;&gt;<br>
&gt;&gt; commit 2767cbe014f84c9ad42ed8ef1eca7caa862e5196<br>
&gt;&gt; Author: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">=
maxin.john@intel.com</a>&gt;<br>
&gt;&gt; AuthorDate: Fri Jul 1 11:39:02 2016 +0300<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0rt-tests: move ptest to python3<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0convert python2 based ptest of rt-tests package=
 to python3<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Maxin B. John &lt;<a href=3D"mai=
lto:maxin.john@intel.com">maxin.john@intel.com</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Ross Burton &lt;<a href=3D"mailt=
o:ross.burton@intel.com">ross.burton@intel.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-rt/rt-tests/files/rt_bmark.py | 26 ++++++++++++=
+-------------<br>
&gt;&gt;=C2=A0 meta/recipes-rt/rt-tests/files/run-ptest=C2=A0 =C2=A0|=C2=A0=
 2 +-<br>
&gt;&gt;=C2=A0 meta/recipes-rt/rt-tests/<a href=3D"http://rt-tests_2.0.bb" =
rel=3D"noreferrer" target=3D"_blank">rt-tests_2.0.bb</a>=C2=A0 =C2=A0|=C2=
=A0 2 +-<br>
&gt;&gt;=C2=A0 3 files changed, 15 insertions(+), 15 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-rt/rt-tests/files/rt_bmark.py b/meta/rec=
ipes-rt/rt-tests/files/rt_bmark.py<br>
&gt;&gt; index 0e2b105..080a655 100755<br>
&gt;&gt; --- a/meta/recipes-rt/rt-tests/files/rt_bmark.py<br>
&gt;&gt; +++ b/meta/recipes-rt/rt-tests/files/rt_bmark.py<br>
&gt;&gt; @@ -1,4 +1,4 @@<br>
&gt;&gt; -#!/usr/bin/python<br>
&gt;&gt; +#!/usr/bin/env python3<br>
&gt;&gt;=C2=A0 # -*- coding: utf-8 -*-<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 # SPDX-License-Identifier:=C2=A0 =C2=A0 =C2=A0BSD-3-Clause<b=
r>
&gt;&gt; @@ -106,8 +106,8 @@ def tc_name(sub_name):<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 def log(*msg):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp =3D &quot;&quot;.join(map(st=
r, msg)) # &#39;map(str, ...&#39; allows numbers<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in tmp.split(&quot;\n&quot;)=
:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print &qu=
ot;#&quot;, line<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in tmp.splitlines():<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&qu=
ot;#&quot;, line)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #-----------------------------------------------------------=
--------------------<br>
&gt;&gt;=C2=A0 # Like log(), but with a timestamp added<br>
&gt;&gt; @@ -265,7 +265,7 @@ cmd =3D (&quot;cyclictest&quot;,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-d&quot;, str(interval_delt=
a),<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-l&quot;, str(loop_count)<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt;&gt; -rex =3D re.compile(&quot;C:\s*(\d+).*Min:\s*(\d+).*Avg:\s*(\d+).*=
Max:\s*(\d+)&quot;)<br>
&gt;&gt; +rex =3D re.compile(b&quot;C:\s*(\d+).*Min:\s*(\d+).*Avg:\s*(\d+).=
*Max:\s*(\d+)&quot;)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 def run_cyclictest_once():<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D subprocess.check_output(=
cmd)<br>
&gt;&gt; @@ -283,7 +283,7 @@ def run_cyclictest_once():<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 avg_sum =3D 0<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 avg_cnt =3D 0<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in res.split(&quot;\n&quot;)=
:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in res.splitlines():<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =
=3D rex.search(line)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if m=
 is not None:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 minlist.append(int(m.group(2)))<br>
&gt;&gt; @@ -376,11 +376,11 @@ class cyclictest_runner:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 log()<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 log(&quot;PASS&quot;)<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 print<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 print tc_name(name), &quot;[Min/us,Avg/us,Max/us]:&quo=
t;,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 print &quot;%d,%.1f,%d&quot; % (bm_min,bm_avg, bm_max)=
<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 print &quot;PASS:&quot;, tc_name(name)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 print<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 print()<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 print(tc_name(name), &quot;[Min/us,Avg/us,Max/us]:&quo=
t;,)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 print(&quot;%d,%.1f,%d&quot; % (bm_min,bm_avg, bm_max)=
)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 print(&quot;PASS:&quot;, tc_name(name))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 print()<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exce=
pt Exception:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 log()<br>
&gt;&gt; @@ -391,9 +391,9 @@ class cyclictest_runner:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 log(&quot;WD: &quot;, os.getcwd())<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 log()<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 log(&quot;FAIL&quot;)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 print<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 print &quot;FAIL:&quot;, tc_name(name)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 print<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 print()<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 print(&quot;FAIL:&quot;, tc_name(name))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 print()<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #-----------------------------------------------------------=
--------------------<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-rt/rt-tests/files/run-ptest b/meta/recip=
es-rt/rt-tests/files/run-ptest<br>
&gt;&gt; index 8e6d3e3..b7c5e29 100644<br>
&gt;&gt; --- a/meta/recipes-rt/rt-tests/files/run-ptest<br>
&gt;&gt; +++ b/meta/recipes-rt/rt-tests/files/run-ptest<br>
&gt;&gt; @@ -1,3 +1,3 @@<br>
&gt;&gt;=C2=A0 #!/bin/sh<br>
&gt;&gt;<br>
&gt;&gt; -python ./rt_bmark.py<br>
&gt;&gt; +python3 ./rt_bmark.py<br>
&gt;&gt; diff --git a/meta/recipes-rt/rt-tests/<a href=3D"http://rt-tests_2=
.0.bb" rel=3D"noreferrer" target=3D"_blank">rt-tests_2.0.bb</a> b/meta/reci=
pes-rt/rt-tests/<a href=3D"http://rt-tests_2.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">rt-tests_2.0.bb</a><br>
&gt;&gt; index 21780d1..83869b8 100644<br>
&gt;&gt; --- a/meta/recipes-rt/rt-tests/<a href=3D"http://rt-tests_2.0.bb" =
rel=3D"noreferrer" target=3D"_blank">rt-tests_2.0.bb</a><br>
&gt;&gt; +++ b/meta/recipes-rt/rt-tests/<a href=3D"http://rt-tests_2.0.bb" =
rel=3D"noreferrer" target=3D"_blank">rt-tests_2.0.bb</a><br>
&gt;&gt; @@ -28,6 +28,6 @@ do_install_ptest() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/rt_bmark.py ${D}${=
PTEST_PATH}<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; -RDEPENDS_${PN}-ptest +=3D &quot; stress python python-subprocess =
python-multiprocessing python-datetime python-re python-lang&quot;<br>
&gt;&gt; +RDEPENDS_${PN}-ptest +=3D &quot; stress python3 python3-subproces=
s python3-multiprocessing python3-datetime python3-re python3-lang python3-=
misc&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 FILES_${PN} +=3D &quot;${prefix}/src/backfire&quot;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; To stop receiving notification emails like this one, please contac=
t<br>
&gt;&gt; the administrator of this repository.<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-commits mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-commits@lists.openembedded.org">Ope=
nembedded-commits@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-commits" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedde=
d.org/mailman/listinfo/openembedded-commits</a><br>
&gt;<br>
&gt; --<br>
&gt; Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mail=
to:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
&gt;<br>
</font></span></blockquote></div><br></div>

--001a1141238c648183053865de87--

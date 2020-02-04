Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0DE7D61030
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 20:51:03 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id y23so6698ual.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2020 12:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9fCuf+SPs8HLbnNR2umo/NJrGLdfIwXcxJaGmUV5pvQ=;
	b=R7PAtsoQ6TuuR7jRxGXk7XQ9d2nw7zbLJDmFRr/2+j1ortOdAcBbj+A40j4FEXTj7P
	THg/hQrIzcYzzW9f+E7yKGNegsPuDnUP4XH2tkUabNRhg67JWWYjSyxk440F152LlgOu
	FTLHfaFXv+gQs3SIwtmRV34yY6Mu+jfn9AQ7jgfjIksyN0QLd9SY0XCuA7bXP4ojBQgA
	VvB5F9Xe2lFYv4gFLDob/tCkvp9LaSNuAWN1mXTgwdgMwQWSgAQEI/k4IV7WX0nYhFRf
	+Kizlpt3lIbr+Oug/AZ+RvB1uBQUqXi/4l0Sf5gK4WOkI73j4rg+iTKuSVqeBpB/75zz
	mJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9fCuf+SPs8HLbnNR2umo/NJrGLdfIwXcxJaGmUV5pvQ=;
	b=U639hnZyobGmWbCNgTPYk7kAIc11/U3gE/fBiMclsE9rSlA0v1Xg9+wQhJ6M6as8iu
	4od8+ntmrMJsVFdYd5vh0bzvgn2SVVrxcBUtHowUjC/pZ37s5l5Wuaaq/fPxum7WePA6
	Fki9fzM9ONwrsqptfrm39FRwPyih/DyILO3zq8tlDYwkoczBi84VLdN/qAwB/NJyTtqi
	tMJ+WIHZMh3rViwtjRHyZz/eqYsiFtqGqMSjKdfLT4vBw/3N/3TmAvzZa3hx+QvoqaFp
	x6ucuxhNHhv1mj2eDeNVwa6ptpK5j5qP6cSnefGdeXHDOAGmvA2pnGrbYqstuy9hyAYF
	Gt+g==
X-Gm-Message-State: APjAAAXO7gT+eAgpFxWf6i5Pjo+vjxWuN1D2WF5PXgJ+2mnP8F+NDe2n
	joE+JrALhu8VsbfmEWo3HQvyvRB1dmuSLUDSsIQ=
X-Google-Smtp-Source: APXvYqz3AG5DyT+scIboPXMUVO85wz2ONVzAyha0yRcafhooNqpjbTdj6lnFJsmm+4vFER779kFL92fJoDTFryw0flg=
X-Received: by 2002:ab0:2006:: with SMTP id v6mr17686966uak.22.1580849464218; 
	Tue, 04 Feb 2020 12:51:04 -0800 (PST)
MIME-Version: 1.0
References: <20200203091406.37643-1-kai.kang@windriver.com>
	<B90E2425-D2BC-411A-B3CF-E3B31614A8DE@gmail.com>
	<4d47a7c5-d60a-2fcc-3a4d-a716727bbcbd@windriver.com>
In-Reply-To: <4d47a7c5-d60a-2fcc-3a4d-a716727bbcbd@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Feb 2020 21:50:53 +0100
Message-ID: <CANNYZj9jTrZHYJw0y2=7BxhpJxgV792y06O2eQqsDALApo+QJw@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ifupdown: add ptest
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
X-List-Received-Date: Tue, 04 Feb 2020 20:51:04 -0000
Content-Type: multipart/alternative; boundary="000000000000c21af9059dc6322a"

--000000000000c21af9059dc6322a
Content-Type: text/plain; charset="UTF-8"

imagefeatures.py does set:

PREFERRED_PROVIDER_virtual/base-utils = "packagegroup-core-base-utils"
VIRTUAL-RUNTIME_base-utils = "packagegroup-core-base-utils"

which I believe does actually replace replace busybox with that
packagegroup in any image, as packagegroup-core-boot RDEPENDS on
VIRTUAL-RUNTIME_base-utils.

I'm not sure why imagefeatures.py only does 'bitbake("--graphviz
core-image-sato")' instead of building and booting that image properly, but
this is exactly the place where it should happen.

Alex

On Tue, 4 Feb 2020 at 10:25, Kang Kai <Kai.Kang@windriver.com> wrote:

> In imagefeatures.py, it just run 'bitbake -g core-image-sato' and
> doesn't really build and test RDEPENDS packages of
> packagegroup-core-base-utils.
>
> So for the packages in the RDEPENDS packages of
> packagegroup-core-base-utils but not in any image, they all are not be
> tested.
>
> I didn't find a proper recipe to place these recipes. Maybe a new image
> recipe need to be created.
>
> Regards,
> Kai
>
>
>
> >
> > Alex
> >
> >> On 3 Feb 2020, at 10.14, <kai.kang@windriver.com> <
> kai.kang@windriver.com> wrote:
> >>
> >> From: Kai Kang <kai.kang@windriver.com>
> >>
> >> Add ptest for ifupdown with its own test cases.
> >>
> >> [Yocto #13736]
> >>
> >> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> ---
> >> meta/recipes-core/ifupdown/files/run-ptest    |  4 ++
> >> .../ifupdown/files/tweak-ptest-script.patch   | 49 +++++++++++++++++++
> >> meta/recipes-core/ifupdown/ifupdown_0.8.35.bb | 10 +++-
> >> 3 files changed, 62 insertions(+), 1 deletion(-)
> >> create mode 100644 meta/recipes-core/ifupdown/files/run-ptest
> >> create mode 100644
> meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
> >>
> >> diff --git a/meta/recipes-core/ifupdown/files/run-ptest
> b/meta/recipes-core/ifupdown/files/run-ptest
> >> new file mode 100644
> >> index 0000000000..8694042392
> >> --- /dev/null
> >> +++ b/meta/recipes-core/ifupdown/files/run-ptest
> >> @@ -0,0 +1,4 @@
> >> +#!/bin/sh
> >> +
> >> +CURDIR=$(dirname `readlink -f $0`)
> >> +cd $CURDIR/tests && ./testbuild-linux
> >> diff --git a/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
> b/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
> >> new file mode 100644
> >> index 0000000000..d7600cf243
> >> --- /dev/null
> >> +++ b/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
> >> @@ -0,0 +1,49 @@
> >> +Tweak tests of ifupdown to make it work with oe-core ptest framework.
> >> +
> >> +Upstream-Status: Inappropriate [oe-core specific]
> >> +
> >> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> +
> >> +diff --git a/tests/testbuild-linux b/tests/testbuild-linux
> >> +index 1181ea0..d5c1814 100755
> >> +--- a/tests/testbuild-linux
> >> ++++ b/tests/testbuild-linux
> >> +@@ -1,6 +1,7 @@
> >> + #!/bin/sh -e
> >> +
> >> +-dir=tests/linux
> >> ++curdir=$(dirname `readlink -f $0`)
> >> ++dir=$curdir/linux
> >> +
> >> + result=true
> >> + for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18; do
> >> +@@ -12,7 +13,7 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
> 17 18; do
> >> +         echo "Testcase $test: $args"
> >> +
> >> +    exitcode=0
> >> +-        ./ifup -v --no-act-commands --force -i $dir/testcase.$test
> --state-dir=$dir/state.$test $args \
> >> ++        ifup -v --no-act-commands --force -i $dir/testcase.$test
> --state-dir=$dir/state.$test $args \
> >> +                 >$dir/up-res-out.$test 2>$dir/up-res-err.$test ||
> exitcode=$?
> >> +
> >> +         (echo "exit code: $exitcode";
> >> +@@ -20,7 +21,7 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
> 17 18; do
> >> +          echo "====stderr===="; cat $dir/up-res-err.$test) >
> $dir/up-res.$test
> >> +
> >> +    exitcode=0
> >> +-        ./ifdown -v --no-act-commands --force -i $dir/testcase.$test
> --state-dir=$dir/state.$test $args \
> >> ++        ifdown -v --no-act-commands --force -i $dir/testcase.$test
> --state-dir=$dir/state.$test $args \
> >> +                >$dir/down-res-out.$test 2>$dir/down-res-err.$test ||
> exitcode=$?
> >> +
> >> +         (echo "exit code: $exitcode";
> >> +@@ -28,9 +29,9 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
> 17 18; do
> >> +          echo "====stderr===="; cat $dir/down-res-err.$test) >
> $dir/down-res.$test
> >> +
> >> +         if diff -ub $dir/up.$test $dir/up-res.$test && diff -ub
> $dir/down.$test $dir/down-res.$test; then
> >> +-                echo "(okay)"
> >> ++                echo "PASS: $test"
> >> +         else
> >> +-                echo "(failed)"
> >> ++                echo "FAIL: $test"
> >> +                 result=false
> >> +         fi
> >> +         echo "=========="
> >> diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
> b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
> >> index 0de97fe372..53cb971d33 100644
> >> --- a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
> >> +++ b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
> >> @@ -11,13 +11,15 @@ SRC_URI = "git://
> salsa.debian.org/debian/ifupdown.git;protocol=https \
> >>             file://99_network \
> >>             file://0001-Define-FNM_EXTMATCH-for-musl.patch \
> >>
>  file://0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch \
> >> +           file://run-ptest \
> >> +           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest',
> 'file://tweak-ptest-script.patch', '', d)} \
> >>             "
> >> SRCREV = "4af76318cfc57f8e4a44d357104188666213bd4b"
> >>
> >> S = "${WORKDIR}/git"
> >>
> >>
> >> -inherit update-alternatives
> >> +inherit ptest update-alternatives
> >>
> >> do_compile () {
> >>     chmod a+rx *.pl *.sh
> >> @@ -40,6 +42,12 @@ do_install () {
> >>     cd ${D}${mandir}/man8 && ln -s ifup.8 ifdown.8
> >> }
> >>
> >> +do_install_ptest () {
> >> +    install -d ${D}${PTEST_PATH}/tests
> >> +    cp -r ${S}/tests/testbuild-linux ${D}${PTEST_PATH}/tests/
> >> +    cp -r ${S}/tests/linux ${D}${PTEST_PATH}/tests/
> >> +}
> >> +
> >> ALTERNATIVE_PRIORITY = "100"
> >> ALTERNATIVE_${PN} = "ifup ifdown"
> >>
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> --
> Kai Kang
>
>

--000000000000c21af9059dc6322a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div class=3D"gmail_attr">image=
features.py does set:</div><div class=3D"gmail_attr"><br></div><div class=
=3D"gmail_attr">PREFERRED_PROVIDER_virtual/base-utils =3D &quot;packagegrou=
p-core-base-utils&quot;<br>VIRTUAL-RUNTIME_base-utils =3D &quot;packagegrou=
p-core-base-utils&quot;</div><div class=3D"gmail_attr"><br></div><div class=
=3D"gmail_attr">which I believe does actually replace replace busybox with =
that packagegroup in any image, as packagegroup-core-boot RDEPENDS on VIRTU=
AL-RUNTIME_base-utils.</div><div class=3D"gmail_attr"><br></div><div class=
=3D"gmail_attr">I&#39;m not sure why imagefeatures.py only does &#39;bitbak=
e(&quot;--graphviz core-image-sato&quot;)&#39; instead of building and boot=
ing that image properly, but this is exactly the place where it should happ=
en.</div><div class=3D"gmail_attr"><br></div><div class=3D"gmail_attr">Alex=
<br></div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 4 Feb 2020 at 10:25, Kang Kai &lt;<a href=3D"m=
ailto:Kai.Kang@windriver.com">Kai.Kang@windriver.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">In imagefeatures.py, it=
 just run &#39;bitbake -g core-image-sato&#39; and <br>
doesn&#39;t really build and test RDEPENDS packages of <br>
packagegroup-core-base-utils.<br>
<br>
So for the packages in the RDEPENDS packages of <br>
packagegroup-core-base-utils but not in any image, they all are not be <br>
tested.<br>
<br>
I didn&#39;t find a proper recipe to place these recipes. Maybe a new image=
 <br>
recipe need to be created.<br>
<br>
Regards,<br>
Kai<br>
<br>
<br>
<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt;&gt; On 3 Feb 2020, at 10.14, &lt;<a href=3D"mailto:kai.kang@windriver.=
com" target=3D"_blank">kai.kang@windriver.com</a>&gt; &lt;<a href=3D"mailto=
:kai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt; w=
rote:<br>
&gt;&gt;<br>
&gt;&gt; From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targe=
t=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Add ptest for ifupdown with its own test cases.<br>
&gt;&gt;<br>
&gt;&gt; [Yocto #13736]<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.c=
om" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; meta/recipes-core/ifupdown/files/run-ptest=C2=A0 =C2=A0 |=C2=A0 4 =
++<br>
&gt;&gt; .../ifupdown/files/tweak-ptest-script.patch=C2=A0 =C2=A0| 49 +++++=
++++++++++++++<br>
&gt;&gt; meta/recipes-core/ifupdown/<a href=3D"http://ifupdown_0.8.35.bb" r=
el=3D"noreferrer" target=3D"_blank">ifupdown_0.8.35.bb</a> | 10 +++-<br>
&gt;&gt; 3 files changed, 62 insertions(+), 1 deletion(-)<br>
&gt;&gt; create mode 100644 meta/recipes-core/ifupdown/files/run-ptest<br>
&gt;&gt; create mode 100644 meta/recipes-core/ifupdown/files/tweak-ptest-sc=
ript.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-core/ifupdown/files/run-ptest b/meta/rec=
ipes-core/ifupdown/files/run-ptest<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..8694042392<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-core/ifupdown/files/run-ptest<br>
&gt;&gt; @@ -0,0 +1,4 @@<br>
&gt;&gt; +#!/bin/sh<br>
&gt;&gt; +<br>
&gt;&gt; +CURDIR=3D$(dirname `readlink -f $0`)<br>
&gt;&gt; +cd $CURDIR/tests &amp;&amp; ./testbuild-linux<br>
&gt;&gt; diff --git a/meta/recipes-core/ifupdown/files/tweak-ptest-script.p=
atch b/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..d7600cf243<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch<br=
>
&gt;&gt; @@ -0,0 +1,49 @@<br>
&gt;&gt; +Tweak tests of ifupdown to make it work with oe-core ptest framew=
ork.<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Inappropriate [oe-core specific]<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.=
com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/tests/testbuild-linux b/tests/testbuild-linux<br>
&gt;&gt; +index 1181ea0..d5c1814 100755<br>
&gt;&gt; +--- a/tests/testbuild-linux<br>
&gt;&gt; ++++ b/tests/testbuild-linux<br>
&gt;&gt; +@@ -1,6 +1,7 @@<br>
&gt;&gt; + #!/bin/sh -e<br>
&gt;&gt; +<br>
&gt;&gt; +-dir=3Dtests/linux<br>
&gt;&gt; ++curdir=3D$(dirname `readlink -f $0`)<br>
&gt;&gt; ++dir=3D$curdir/linux<br>
&gt;&gt; +<br>
&gt;&gt; + result=3Dtrue<br>
&gt;&gt; + for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18; do<br>
&gt;&gt; +@@ -12,7 +13,7 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15=
 16 17 18; do<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Testcase $test: $arg=
s&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 exitcode=3D0<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ./ifup -v --no-act-commands --force =
-i $dir/testcase.$test --state-dir=3D$dir/state.$test $args \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifup -v --no-act-commands --force -i=
 $dir/testcase.$test --state-dir=3D$dir/state.$test $args \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt=
;$dir/up-res-out.$test 2&gt;$dir/up-res-err.$test || exitcode=3D$?<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(echo &quot;exit code: $exitcod=
e&quot;;<br>
&gt;&gt; +@@ -20,7 +21,7 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15=
 16 17 18; do<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;=3D=3D=3D=3Dstderr=
=3D=3D=3D=3D&quot;; cat $dir/up-res-err.$test) &gt; $dir/up-res.$test<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 exitcode=3D0<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ./ifdown -v --no-act-commands --forc=
e -i $dir/testcase.$test --state-dir=3D$dir/state.$test $args \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifdown -v --no-act-commands --force =
-i $dir/testcase.$test --state-dir=3D$dir/state.$test $args \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;$dir/=
down-res-out.$test 2&gt;$dir/down-res-err.$test || exitcode=3D$?<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(echo &quot;exit code: $exitcod=
e&quot;;<br>
&gt;&gt; +@@ -28,9 +29,9 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15=
 16 17 18; do<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;=3D=3D=3D=3Dstderr=
=3D=3D=3D=3D&quot;; cat $dir/down-res-err.$test) &gt; $dir/down-res.$test<b=
r>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if diff -ub $dir/up.$test $dir/=
up-res.$test &amp;&amp; diff -ub $dir/down.$test $dir/down-res.$test; then<=
br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &qu=
ot;(okay)&quot;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &qu=
ot;PASS: $test&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &qu=
ot;(failed)&quot;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &qu=
ot;FAIL: $test&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res=
ult=3Dfalse<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D&quot;<br>
&gt;&gt; diff --git a/meta/recipes-core/ifupdown/<a href=3D"http://ifupdown=
_0.8.35.bb" rel=3D"noreferrer" target=3D"_blank">ifupdown_0.8.35.bb</a> b/m=
eta/recipes-core/ifupdown/<a href=3D"http://ifupdown_0.8.35.bb" rel=3D"nore=
ferrer" target=3D"_blank">ifupdown_0.8.35.bb</a><br>
&gt;&gt; index 0de97fe372..53cb971d33 100644<br>
&gt;&gt; --- a/meta/recipes-core/ifupdown/<a href=3D"http://ifupdown_0.8.35=
.bb" rel=3D"noreferrer" target=3D"_blank">ifupdown_0.8.35.bb</a><br>
&gt;&gt; +++ b/meta/recipes-core/ifupdown/<a href=3D"http://ifupdown_0.8.35=
.bb" rel=3D"noreferrer" target=3D"_blank">ifupdown_0.8.35.bb</a><br>
&gt;&gt; @@ -11,13 +11,15 @@ SRC_URI =3D &quot;git://<a href=3D"http://sals=
a.debian.org/debian/ifupdown.git;protocol=3Dhttps" rel=3D"noreferrer" targe=
t=3D"_blank">salsa.debian.org/debian/ifupdown.git;protocol=3Dhttps</a> \<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://99_network \=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Define-=
FNM_EXTMATCH-for-musl.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Makefil=
e-do-not-use-dpkg-for-determining-OS-type.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#3=
9;DISTRO_FEATURES&#39;, &#39;ptest&#39;, &#39;file://tweak-ptest-script.pat=
ch&#39;, &#39;&#39;, d)} \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt; SRCREV =3D &quot;4af76318cfc57f8e4a44d357104188666213bd4b&quot;<br=
>
&gt;&gt;<br>
&gt;&gt; S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -inherit update-alternatives<br>
&gt;&gt; +inherit ptest update-alternatives<br>
&gt;&gt;<br>
&gt;&gt; do_compile () {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0chmod a+rx *.pl *.sh<br>
&gt;&gt; @@ -40,6 +42,12 @@ do_install () {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0cd ${D}${mandir}/man8 &amp;&amp; ln -s ifup.8 i=
fdown.8<br>
&gt;&gt; }<br>
&gt;&gt;<br>
&gt;&gt; +do_install_ptest () {<br>
&gt;&gt; +=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
&gt;&gt; +=C2=A0 =C2=A0 cp -r ${S}/tests/testbuild-linux ${D}${PTEST_PATH}/=
tests/<br>
&gt;&gt; +=C2=A0 =C2=A0 cp -r ${S}/tests/linux ${D}${PTEST_PATH}/tests/<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; ALTERNATIVE_PRIORITY =3D &quot;100&quot;<br>
&gt;&gt; ALTERNATIVE_${PN} =3D &quot;ifup ifdown&quot;<br>
&gt;&gt;<br>
&gt;&gt; -- <br>
&gt;&gt; 2.17.1<br>
&gt;&gt;<br>
&gt;&gt; -- <br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core</a><br>
<br>
<br>
-- <br>
Kai Kang<br>
<br>
</blockquote></div></div>

--000000000000c21af9059dc6322a--

Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4D7036D134
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 09:34:14 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id qd12so1185562ieb.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 02:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=FtriuB6GxmI6pVG6AFapIrAvIT3azQbAf3sn58nWiJo=;
	b=XT0evgnnlG6W0KMPfwS+J3z4ksOBiELn8pwYgpUWGz3rOil0FCPQC+XBwDIvqozsai
	4LC+mmP6pZX+ydKajH1Zsf0ojjFwICDDaXj+18p4YW/dBMvRGDzVW13Mpy4ljdd7sydI
	icijC5t+hLWKTdHP7sbIGmenYA16myJxvVJQvXTw00q0q+8lW2CJCNSO4R8TMgYSJTUT
	HBdYtwiK5BQSFc47kRWJWOOE0RaQXFW/3p60YOgeXx2uhtZ5uhyNxBw+138ChLq7TcFM
	7Szt/S4cD3dlvGOkC8hHBXsI1NT0GWZtCIo6lngOy1aaRvOOsJ9zWd5PzZk0v2glbAXc
	2MMQ==
MIME-Version: 1.0
X-Received: by 10.50.61.179 with SMTP id q19mr12587024igr.33.1382434456058;
	Tue, 22 Oct 2013 02:34:16 -0700 (PDT)
Received: by 10.50.219.195 with HTTP; Tue, 22 Oct 2013 02:34:15 -0700 (PDT)
In-Reply-To: <CAAqcGHmA8JKz-LEZvN76HzViMwA1P0FtYWLgt0z4oztet0C6fA@mail.gmail.com>
References: <1382343415-30035-1-git-send-email-riku.voipio@linaro.org>
	<CAMKF1sqpTK+vypxO-2vrHvf34mqfDdF8AK2sgybnd62WtXvn1A@mail.gmail.com>
	<CAAqcGHmA8JKz-LEZvN76HzViMwA1P0FtYWLgt0z4oztet0C6fA@mail.gmail.com>
Date: Tue, 22 Oct 2013 02:34:15 -0700
Message-ID: <CAMKF1sq7w1bEowMyU6=f=K+8BBJcJqNTHuupqd_O4NpcRTzcpA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: "patches@linaro.org" <patches@linaro.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] ltp: cleanup recipe
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
X-List-Received-Date: Tue, 22 Oct 2013 09:34:14 -0000
Content-Type: multipart/alternative; boundary=047d7bdc109eadc99104e9511af3

--047d7bdc109eadc99104e9511af3
Content-Type: text/plain; charset=UTF-8

On Tuesday, October 22, 2013, Riku Voipio <riku.voipio@linaro.org> wrote:
> On 22 October 2013 01:42, Khem Raj <raj.khem@gmail.com> wrote:
>> On Monday, October 21, 2013, Riku Voipio <riku.voipio@linaro.org> wrote:
>>> Cleanups for ltp:
>>>
>>> 1. Instead of using giturl like in Anders's patch use the sourceforge
>>> mirror URL.
>>
>> whats wrong with git url ?
>
> The previous LTP version in OE used to have tarball url, so I was just
> changing it back. I guess the main functional difference is that git
> url won't have checksums for downloads? Using tarball downloads over
> git checkouts is being more kind to upstream hosting. Mostly a matter
> of taste, or does OE-core have some preferred policy?

i dont think there is any preference i was thinking if git had issues

>
> Riku
>
>>> 2. remove to the manual unpack rule and just set S variable to source
>>> directory.
>>> 3. Follow the OE style guide for variable order.
>>> ---
>>>  meta/recipes-extended/ltp/ltp_20130904.bb | 50
>>> +++++++++++++------------------
>>>  1 file changed, 21 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/meta/recipes-extended/ltp/ltp_20130904.bb
>>> b/meta/recipes-extended/ltp/ltp_20130904.bb
>>> index 5e10448..43fe780 100644
>>> --- a/meta/recipes-extended/ltp/ltp_20130904.bb
>>> +++ b/meta/recipes-extended/ltp/ltp_20130904.bb
>>> @@ -21,44 +21,21 @@ LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>>>
>>>  DEPENDS = "attr libaio libcap acl openssl"
>>>
>>> -SRC_URI = "git://github.com/linux-test-project/ltp.git"
>>> +SRC_URI =
>>>
"${SOURCEFORGE_MIRROR}/project/ltp/LTP%20Source/ltp-${PV}/ltp-full-${PV}.tar.bz2
>>> \
>>> +           "
>>>
>>> -SRCREV = "a8c42db5f9314211811c36275a21f83902830dc5"
>>> -S = "${WORKDIR}/git"
>>> +SRC_URI[md5sum] = "0cf2ccb7199f8318d413c62a085629f0"
>>> +SRC_URI[sha256sum] =
>>> "662c3661a4d1bfbf3187d0835f35e613b43eedc35a840e3283e378a19606ee0b"
>>>
>>>  export prefix = "/opt/ltp"
>>>  export exec_prefix = "/opt/ltp"
>>>
>>>  inherit autotools
>>>
>>> -RDEPENDS_${PN} = "perl e2fsprogs-mke2fs"
>>> -
>>> -FILES_${PN}-dbg += "/opt/ltp/runtest/.debug"
>>> -FILES_${PN}-dbg += "/opt/ltp/testcases/bin/.debug"
>>> -FILES_${PN}-dbg += "/opt/ltp/testcases/bin/*/bin/.debug"
>>> -FILES_${PN}-dbg += "/opt/ltp/testcases/bin/*/test/.debug"
>>> -FILES_${PN}-dbg += "/opt/ltp/scenario_groups/.debug"
>>> -FILES_${PN}-dbg += "/opt/ltp/testscripts/.debug"
>>> -FILES_${PN}-dbg += "/opt/ltp/testscripts/open_posix_testsuite/.debug"
>>> -
>>> -FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a"
>>> -
>>> -FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/*
/opt/ltp/scenario_groups/*
>>> /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/*
>>> /opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/*
>>> /opt/ltp/testcases/open_posix_testsuite/conformance/*
>>> /opt/ltp/testcases/open_posix_testsuite/Documentation/*
>>> /opt/ltp/testcases/open_posix_testsuite/functional/*
>>> /opt/ltp/testcases/open_posix_testsuite/include/*
>>> /opt/ltp/testcases/open_posix_testsuite/scripts/*
>>> /opt/ltp/testcases/open_posix_testsuite/stress/*
>>> /opt/ltp/testcases/open_posix_testsuite/tools/*"
>>> +S = "${WORKDIR}/ltp-full-${PV}"
>>>
>>>  TARGET_CC_ARCH += "${LDFLAGS}"
>>>
>>> -do_unpack_append() {
>>> -    bb.build.exec_func('do_extract_tarball', d)
>>> -}
>>> -
>>> -do_extract_tarball() {
>>> -       if test -f ${WORKDIR}/ltp-full-${PV} ; then
>>> -           tar x --no-same-owner -f ${WORKDIR}/ltp-full-${PV} -C
>>> ${WORKDIR}
>>> -           rm -rf ${WORKDIR}/ltp-${PV}
>>> -           mv ${WORKDIR}/ltp-full-${PV} ${WORKDIR}/ltp-${PV}
>>> -       fi
>>> -}
>>> -
>>>  do_install(){
>>>         install -d ${D}/opt/ltp/
>>>         oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
>>> @@ -66,10 +43,25 @@ do_install(){
>>>         # Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
>>>         cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
>>>
>>> -       # We

--047d7bdc109eadc99104e9511af3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 22, 2013, Riku Voipio &lt;<a href=3D"mailto:rik=
u.voipio@linaro.org">riku.voipio@linaro.org</a>&gt; wrote:<br>&gt; On 22 Oc=
tober 2013 01:42, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.kh=
em@gmail.com</a>&gt; wrote:<br>
&gt;&gt; On Monday, October 21, 2013, Riku Voipio &lt;<a href=3D"mailto:rik=
u.voipio@linaro.org">riku.voipio@linaro.org</a>&gt; wrote:<br>&gt;&gt;&gt; =
Cleanups for ltp:<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; 1. Instead of using gitur=
l like in Anders&#39;s patch use the sourceforge<br>
&gt;&gt;&gt; mirror URL.<br>&gt;&gt;<br>&gt;&gt; whats wrong with git url ?=
<br>&gt;<br>&gt; The previous LTP version in OE used to have tarball url, s=
o I was just<br>&gt; changing it back. I guess the main functional differen=
ce is that git<br>
&gt; url won&#39;t have checksums for downloads? Using tarball downloads ov=
er<br>&gt; git checkouts is being more kind to upstream hosting. Mostly a m=
atter<br>&gt; of taste, or does OE-core have some preferred policy?<br>
<br>i dont think there is any preference i was thinking if git had issues<b=
r><br>&gt;<br>&gt; Riku<br>&gt;<br>&gt;&gt;&gt; 2. remove to the manual unp=
ack rule and just set S variable to source<br>&gt;&gt;&gt; directory.<br>
&gt;&gt;&gt; 3. Follow the OE style guide for variable order.<br>&gt;&gt;&g=
t; ---<br>&gt;&gt;&gt; =C2=A0meta/recipes-extended/ltp/<a href=3D"http://lt=
p_20130904.bb">ltp_20130904.bb</a> | 50<br>&gt;&gt;&gt; +++++++++++++------=
------------<br>
&gt;&gt;&gt; =C2=A01 file changed, 21 insertions(+), 29 deletions(-)<br>&gt=
;&gt;&gt;<br>&gt;&gt;&gt; diff --git a/meta/recipes-extended/ltp/<a href=3D=
"http://ltp_20130904.bb">ltp_20130904.bb</a><br>&gt;&gt;&gt; b/meta/recipes=
-extended/ltp/<a href=3D"http://ltp_20130904.bb">ltp_20130904.bb</a><br>
&gt;&gt;&gt; index 5e10448..43fe780 100644<br>&gt;&gt;&gt; --- a/meta/recip=
es-extended/ltp/<a href=3D"http://ltp_20130904.bb">ltp_20130904.bb</a><br>&=
gt;&gt;&gt; +++ b/meta/recipes-extended/ltp/<a href=3D"http://ltp_20130904.=
bb">ltp_20130904.bb</a><br>
&gt;&gt;&gt; @@ -21,44 +21,21 @@ LIC_FILES_CHKSUM =3D<br>&gt;&gt;&gt; &quot=
;file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb3 \<br>&gt;&gt;&gt;<br=
>&gt;&gt;&gt; =C2=A0DEPENDS =3D &quot;attr libaio libcap acl openssl&quot;<=
br>&gt;&gt;&gt;<br>
&gt;&gt;&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/linux-te=
st-project/ltp.git">github.com/linux-test-project/ltp.git</a>&quot;<br>&gt;=
&gt;&gt; +SRC_URI =3D<br>&gt;&gt;&gt; &quot;${SOURCEFORGE_MIRROR}/project/l=
tp/LTP%20Source/ltp-${PV}/ltp-full-${PV}.tar.bz2<br>
&gt;&gt;&gt; \<br>&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<=
br>&gt;&gt;&gt;<br>&gt;&gt;&gt; -SRCREV =3D &quot;a8c42db5f9314211811c36275=
a21f83902830dc5&quot;<br>&gt;&gt;&gt; -S =3D &quot;${WORKDIR}/git&quot;<br>=
&gt;&gt;&gt; +SRC_URI[md5sum] =3D &quot;0cf2ccb7199f8318d413c62a085629f0&qu=
ot;<br>
&gt;&gt;&gt; +SRC_URI[sha256sum] =3D<br>&gt;&gt;&gt; &quot;662c3661a4d1bfbf=
3187d0835f35e613b43eedc35a840e3283e378a19606ee0b&quot;<br>&gt;&gt;&gt;<br>&=
gt;&gt;&gt; =C2=A0export prefix =3D &quot;/opt/ltp&quot;<br>&gt;&gt;&gt; =
=C2=A0export exec_prefix =3D &quot;/opt/ltp&quot;<br>
&gt;&gt;&gt;<br>&gt;&gt;&gt; =C2=A0inherit autotools<br>&gt;&gt;&gt;<br>&gt=
;&gt;&gt; -RDEPENDS_${PN} =3D &quot;perl e2fsprogs-mke2fs&quot;<br>&gt;&gt;=
&gt; -<br>&gt;&gt;&gt; -FILES_${PN}-dbg +=3D &quot;/opt/ltp/runtest/.debug&=
quot;<br>
&gt;&gt;&gt; -FILES_${PN}-dbg +=3D &quot;/opt/ltp/testcases/bin/.debug&quot=
;<br>&gt;&gt;&gt; -FILES_${PN}-dbg +=3D &quot;/opt/ltp/testcases/bin/*/bin/=
.debug&quot;<br>&gt;&gt;&gt; -FILES_${PN}-dbg +=3D &quot;/opt/ltp/testcases=
/bin/*/test/.debug&quot;<br>
&gt;&gt;&gt; -FILES_${PN}-dbg +=3D &quot;/opt/ltp/scenario_groups/.debug&qu=
ot;<br>&gt;&gt;&gt; -FILES_${PN}-dbg +=3D &quot;/opt/ltp/testscripts/.debug=
&quot;<br>&gt;&gt;&gt; -FILES_${PN}-dbg +=3D &quot;/opt/ltp/testscripts/ope=
n_posix_testsuite/.debug&quot;<br>
&gt;&gt;&gt; -<br>&gt;&gt;&gt; -FILES_${PN}-staticdev +=3D &quot;/opt/ltp/l=
ib/libmem.a&quot;<br>&gt;&gt;&gt; -<br>&gt;&gt;&gt; -FILES_${PN} +=3D &quot=
;/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/*<br>&gt;&gt;&gt; /=
opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/*<br>
&gt;&gt;&gt; /opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite=
/*<br>&gt;&gt;&gt; /opt/ltp/testcases/open_posix_testsuite/conformance/*<br=
>&gt;&gt;&gt; /opt/ltp/testcases/open_posix_testsuite/Documentation/*<br>
&gt;&gt;&gt; /opt/ltp/testcases/open_posix_testsuite/functional/*<br>&gt;&g=
t;&gt; /opt/ltp/testcases/open_posix_testsuite/include/*<br>&gt;&gt;&gt; /o=
pt/ltp/testcases/open_posix_testsuite/scripts/*<br>&gt;&gt;&gt; /opt/ltp/te=
stcases/open_posix_testsuite/stress/*<br>
&gt;&gt;&gt; /opt/ltp/testcases/open_posix_testsuite/tools/*&quot;<br>&gt;&=
gt;&gt; +S =3D &quot;${WORKDIR}/ltp-full-${PV}&quot;<br>&gt;&gt;&gt;<br>&gt=
;&gt;&gt; =C2=A0TARGET_CC_ARCH +=3D &quot;${LDFLAGS}&quot;<br>&gt;&gt;&gt;<=
br>&gt;&gt;&gt; -do_unpack_append() {<br>
&gt;&gt;&gt; - =C2=A0 =C2=A0bb.build.exec_func(&#39;do_extract_tarball&#39;=
, d)<br>&gt;&gt;&gt; -}<br>&gt;&gt;&gt; -<br>&gt;&gt;&gt; -do_extract_tarba=
ll() {<br>&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 if test -f ${WORKDIR}/ltp-ful=
l-${PV} ; then<br>&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tar x -=
-no-same-owner -f ${WORKDIR}/ltp-full-${PV} -C<br>
&gt;&gt;&gt; ${WORKDIR}<br>&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 rm -rf ${WORKDIR}/ltp-${PV}<br>&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 mv ${WORKDIR}/ltp-full-${PV} ${WORKDIR}/ltp-${PV}<br>&gt;&gt;&gt=
; - =C2=A0 =C2=A0 =C2=A0 fi<br>&gt;&gt;&gt; -}<br>&gt;&gt;&gt; -<br>
&gt;&gt;&gt; =C2=A0do_install(){<br>&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 install -d ${D}/opt/ltp/<br>&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe=
_runmake DESTDIR=3D${D} SKIP_IDCHECK=3D1 install<br>&gt;&gt;&gt; @@ -66,10 =
+43,25 @@ do_install(){<br>&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Copy =
POSIX test suite into ${D}/opt/ltp/testcases by manual<br>
&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -r testcases/open_posix_testsui=
te ${D}/opt/ltp/testcases<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; - =C2=A0 =C2=A0 =
=C2=A0 # We

--047d7bdc109eadc99104e9511af3--

Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8BA39746D3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Oct 2018 00:15:41 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id a13-v6so15097885wrt.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 17:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=y6WQ1MNB5AhjP5fT3gHz6wZM73I5VhecMgxbWQ4RrLM=;
	b=p/JuQFuN+05fz1ejtZxFrW18z71gMlL1As5HqJhiI8ll+dwpcf+9LknmRUw6PYZtGh
	RUyFkVDZHk0xiKOncgYgNerb9XYB3Lp8y+YHUUaYH0fnEzmvOhFFjzGkraz3IJzy6OaM
	64YOuTI0GySQKlYVuwxpf8YrhusEvzkELpGlvzlzwcU1eBYUiBlrbEQ4u+QRiVGZR4NB
	N5nOj6rNZInd21pWIJ0T23Z/TqdWWtJAHGs2G/IQ1f3450K+ZuH4gO6VT9kmDTPSmyCy
	I73l0RjeWSzSDvAiwzGTExYoQpUohQAVl1wYjIQVGVPDggPAVdt7qjYopF8pSIuV4YNl
	Y7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=y6WQ1MNB5AhjP5fT3gHz6wZM73I5VhecMgxbWQ4RrLM=;
	b=fDX17skGa2+uDesUXfQeSVJNaz6YjoqE44QPzeCJ0ejU2Lhrgw+UVDEKuklWEHRZVp
	5LkkSxq/VbLTKgK91iUyV4JVLqdnlul1Z4lA9LQ0nIW6WsLqdNurDXadzzjRaa/aoioq
	mtmxbuWwMPIfg0cYLnuXMTZMIARuUUV8SyiWOMujVmjv5Lqd6HFX4brwmMm0hcnr4WlK
	nfbdxCyQQvJAbicycYFOCmBiodLDiYSkOVL/oMPDxQtGZyHXYfwgrUF8Ug43xnCo6GJ/
	T4rdQuxX45k2ajioMKlzN/30+rLr5CCrsmL8H+EFHCZyNJAVDI4Yoav51sUQyPotfiBd
	PoNQ==
X-Gm-Message-State: ABuFfogljseVDd5ZN+HRJ/pSSyK8iF8zdNtj5KYH8HWISDTI9xs4U4cy
	Lb5aKQt+sZ/eZors4N7mEqcsU5ZKSp09/Kw7Swc=
X-Google-Smtp-Source: ACcGV61ZgntphozMwyb0QtP2ChYTVPbWyYGIYERRm3jxHhNR68roXUo6Z6dUhpatWMKbTeA18TIdpxo3QJpVfClazJs=
X-Received: by 2002:adf:e842:: with SMTP id
	d2-v6mr6425098wrn.175.1539389741921; 
	Fri, 12 Oct 2018 17:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <153917392546.324.13433409263803938064@git.openembedded.org>
	<20181010121845.987A72351DE@git.openembedded.org>
	<CA+chaQcmGLJaOi7xPZR90gekFSyrKRb89ZfRbf6-U43xOmh6qQ@mail.gmail.com>
	<CAJTo0LbRn6aPQg=dY2186S7vqJFrzK24y9V7hte7kZRGgXbhcg@mail.gmail.com>
In-Reply-To: <CAJTo0LbRn6aPQg=dY2186S7vqJFrzK24y9V7hte7kZRGgXbhcg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 13 Oct 2018 02:15:30 +0200
Message-ID: <CA+chaQfMOrF8NWwHww6zJDjL2KaJvn2uPa0Xbz2ipHLSG9ooTQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 02/09: glib-2.0: add missing locale dependencies to PN-ptest
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
X-List-Received-Date: Sat, 13 Oct 2018 00:15:41 -0000
Content-Type: multipart/alternative; boundary="000000000000bcf8f40578111a21"

--000000000000bcf8f40578111a21
Content-Type: text/plain; charset="UTF-8"

Hi,

sorry for delay, I was first testing a bit more specific fix:
DEPENDS_append_libc-glibc = "${@bb.utils.contains('PTEST_ENABLED', '1', '',
' virtual/libc-locale', d)}"

but unfortunately this nor your shorter version work.

and it's reproducible without the multilib enabled as well:

ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
rdepends on locale-base-de-de, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
rdepends on locale-base-el-gr, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
rdepends on locale-base-en-gb, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
rdepends on locale-base-es-es, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
rdepends on locale-base-fa-ir, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
rdepends on locale-base-fr-fr, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
rdepends on locale-base-hr-hr, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
rdepends on locale-base-ja-jp.euc-jp, but it isn't a build dependency?
[build-deps]
ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
rdepends on locale-base-lt-lt, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
rdepends on locale-base-ru-ru, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
rdepends on locale-base-tr-tr, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA run found fatal errors.
Please consider fixing them.
ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: Function failed: do_package_qa

strange, because we had the same issue with bash long time ago and:
commit 2820a2c530018f59895fb57770caa8511d31afd4
Author: Ross Burton <ross.burton@intel.com>
Date:   Fri Oct 13 14:52:16 2017 +0100

    bash: add missing build dependencies for ptest

    Signed-off-by: Ross Burton <ross.burton@intel.com>

diff --git a/meta/recipes-extended/bash/bash.inc
b/meta/recipes-extended/bash/bash.inc
index f8a92b59d0..f4e1f7a11f 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -24,7 +24,9 @@ ALTERNATIVE_PRIORITY = "100"
 RDEPENDS_${PN} += "base-files"
 RDEPENDS_${PN}_class-nativesdk = ""
 RDEPENDS_${PN}-ptest += "make"
-RDEPENDS_${PN}-ptest_append_libc-glibc += " locale-base-fr-fr
locale-base-de-de"
+
+DEPENDS_append_libc-glibc = " glibc-locale"
+RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-fr-fr
locale-base-de-de"

 USERADD_PACKAGES = "${PN}-ptest"
 USERADD_PARAM_${PN}-ptest = "--create-home --user-group test"


worked for bash

On Thu, Oct 11, 2018 at 1:45 PM Burton, Ross <ross.burton@intel.com> wrote:

> On Thu, 11 Oct 2018 at 07:38, Martin Jansa <martin.jansa@gmail.com> wrote:
> > This is causing a lot of QA errors like:
> >
> > lib32-glib-2.0-2.58.0: lib32-glib-2.0-ptest rdepends on
> lib32-locale-base-ru-ru, but it isn't a build dependency? [build-deps]
> > lib32-glib-2.0-2.58.0: lib32-glib-2.0-ptest rdepends on
> lib32-locale-base-tr-tr, but it isn't a build dependency? [build-deps]
>
> Can you test that adding this to the recipe solves the problem:
>
> DEPENDS_append_libc-glibc = " virtual/libc-locale"
>
> Ross
>

--000000000000bcf8f40578111a21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi,<div=
><br></div><div>sorry for delay, I was first testing a bit more specific fi=
x:</div><div>DEPENDS_append_libc-glibc =3D &quot;${@bb.utils.contains(&#39;=
PTEST_ENABLED&#39;, &#39;1&#39;, &#39;&#39;, &#39; virtual/libc-locale&#39;=
, d)}&quot;<br></div><div><br></div><div>but unfortunately this nor your sh=
orter version work.</div><div><br></div><div>and it&#39;s reproducible with=
out the multilib enabled as well:</div><div><br></div><div><div>ERROR: glib=
-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale=
-base-de-de, but it isn&#39;t a build dependency? [build-deps]</div><div>ER=
ROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends =
on locale-base-el-gr, but it isn&#39;t a build dependency? [build-deps]</di=
v><div>ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest =
rdepends on locale-base-en-gb, but it isn&#39;t a build dependency? [build-=
deps]</div><div>ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2=
.0-ptest rdepends on locale-base-es-es, but it isn&#39;t a build dependency=
? [build-deps]</div><div>ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issu=
e: glib-2.0-ptest rdepends on locale-base-fa-ir, but it isn&#39;t a build d=
ependency? [build-deps]</div><div>ERROR: glib-2.0-1_2.58.0-r0 do_package_qa=
: QA Issue: glib-2.0-ptest rdepends on locale-base-fr-fr, but it isn&#39;t =
a build dependency? [build-deps]</div><div>ERROR: glib-2.0-1_2.58.0-r0 do_p=
ackage_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-hr-hr, but it i=
sn&#39;t a build dependency? [build-deps]</div><div>ERROR: glib-2.0-1_2.58.=
0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-ja-jp.=
euc-jp, but it isn&#39;t a build dependency? [build-deps]</div><div>ERROR: =
glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on lo=
cale-base-lt-lt, but it isn&#39;t a build dependency? [build-deps]</div><di=
v>ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepe=
nds on locale-base-ru-ru, but it isn&#39;t a build dependency? [build-deps]=
</div><div>ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-pt=
est rdepends on locale-base-tr-tr, but it isn&#39;t a build dependency? [bu=
ild-deps]</div><div>ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA run found=
 fatal errors. Please consider fixing them.</div><div>ERROR: glib-2.0-1_2.5=
8.0-r0 do_package_qa: Function failed: do_package_qa</div></div><div><br></=
div><div>strange, because we had the same issue with bash long time ago and=
:</div><div><div>commit 2820a2c530018f59895fb57770caa8511d31afd4</div><div>=
Author: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burto=
n@intel.com</a>&gt;</div><div>Date:=C2=A0 =C2=A0Fri Oct 13 14:52:16 2017 +0=
100</div><div><br></div><div>=C2=A0 =C2=A0 bash: add missing build dependen=
cies for ptest</div><div>=C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 Signed=
-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burt=
on@intel.com</a>&gt;</div><div><br></div><div>diff --git a/meta/recipes-ext=
ended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc</div><div>index f=
8a92b59d0..f4e1f7a11f 100644</div><div>--- a/meta/recipes-extended/bash/bas=
h.inc</div><div>+++ b/meta/recipes-extended/bash/bash.inc</div><div>@@ -24,=
7 +24,9 @@ ALTERNATIVE_PRIORITY =3D &quot;100&quot;</div><div>=C2=A0RDEPEND=
S_${PN} +=3D &quot;base-files&quot;</div><div>=C2=A0RDEPENDS_${PN}_class-na=
tivesdk =3D &quot;&quot;</div><div>=C2=A0RDEPENDS_${PN}-ptest +=3D &quot;ma=
ke&quot;</div><div>-RDEPENDS_${PN}-ptest_append_libc-glibc +=3D &quot; loca=
le-base-fr-fr locale-base-de-de&quot;</div><div>+</div><div>+DEPENDS_append=
_libc-glibc =3D &quot; glibc-locale&quot;</div><div>+RDEPENDS_${PN}-ptest_a=
ppend_libc-glibc =3D &quot; locale-base-fr-fr locale-base-de-de&quot;</div>=
<div>=C2=A0</div><div>=C2=A0USERADD_PACKAGES =3D &quot;${PN}-ptest&quot;</d=
iv><div>=C2=A0USERADD_PARAM_${PN}-ptest =3D &quot;--create-home --user-grou=
p test&quot;</div></div><div><br></div><div><br></div><div>worked for bash<=
/div></div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
">On Thu, Oct 11, 2018 at 1:45 PM Burton, Ross &lt;<a href=3D"mailto:ross.b=
urton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">On Thu, 11 Oct 2018 at 07:38, Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt; wrote:<br>
&gt; This is causing a lot of QA errors like:<br>
&gt;<br>
&gt; lib32-glib-2.0-2.58.0: lib32-glib-2.0-ptest rdepends on lib32-locale-b=
ase-ru-ru, but it isn&#39;t a build dependency? [build-deps]<br>
&gt; lib32-glib-2.0-2.58.0: lib32-glib-2.0-ptest rdepends on lib32-locale-b=
ase-tr-tr, but it isn&#39;t a build dependency? [build-deps]<br>
<br>
Can you test that adding this to the recipe solves the problem:<br>
<br>
DEPENDS_append_libc-glibc =3D &quot; virtual/libc-locale&quot;<br>
<br>
Ross<br>
</blockquote></div>

--000000000000bcf8f40578111a21--

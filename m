Return-Path: <bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io>
X-Greylist: delayed 301 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 27 Jul 2018 11:46:48 UTC
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 16418745BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 11:46:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1532692009; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: In-Reply-To: References: MIME-Version: Sender;
	bh=e0KUG1TaYz9Surn0t3bWJPt468AmyEatrOu7WuB1iq8=;
	b=f2A5ej702uJcLwafTlObwwPCgKe3njlXKUfGdWNG+DAWRYdFcVOF9PycPYz5a769j4uWs1sj
	h2vVMaeOTVK9Vjw3VZtqoFzkV67/yrnCdTNinf7MINoh+4L6f6llDqA5yoinA71JttVyqMn1
	MuAkix3pOjySyaN7xCkBagVtzBg=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyJiMTQwMSIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjNhNTY4NSJd
Sender: derek@asterius.io
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mxa.mailgun.org with ESMTP id 5b5b04fb.7fac9692d4f0-smtp-out-n02;
	Fri, 27 Jul 2018 11:41:47 -0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id g141-v6so6930279ita.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 04:41:47 -0700 (PDT)
X-Gm-Message-State: AOUpUlEHHxBnGL+oeq3TDjKkduN2unCiEFPGkGVBxVaBxQKIpXPH0awq
	EdwUE3a6IUtAwUg4JC5UJrkxi6no9KpaTfA0CO4=
X-Google-Smtp-Source: AAOMgpd5XYsE5yPATeb9T23+uIzN510pKsDcjtYAJhZ1AEs+hQPVMqf1OozD6VYea9fSgHhDD3FK8JZ67tpAYoIsuKU=
X-Received: by 2002:a02:5e42:: with SMTP id
	h63-v6mr5645212jab.117.1532691707404; 
	Fri, 27 Jul 2018 04:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAJTo0LZW2UdP221rM_z5f2Eq5uyc65hbYZUOUDmz8CZn-o4G_w@mail.gmail.com>
	<1531834595-4814-1-git-send-email-hongxu.jia@windriver.com>
	<CA+chaQdb_FniAciq0EPH-bf7gTXj-fTDOdi-snac3tgON-2NGg@mail.gmail.com>
In-Reply-To: <CA+chaQdb_FniAciq0EPH-bf7gTXj-fTDOdi-snac3tgON-2NGg@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 27 Jul 2018 07:41:35 -0400
X-Gmail-Original-Message-ID: <CADNbA1r-1jU67KXVMijf03LpV-uUHXRuda38+dEKFWc7daV=+Q@mail.gmail.com>
Message-ID: <CADNbA1r-1jU67KXVMijf03LpV-uUHXRuda38+dEKFWc7daV=+Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] distutils/setuptools-native, distutils3/setuptools3-native: do not try to fetch code during do_compile
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
X-List-Received-Date: Fri, 27 Jul 2018 11:46:49 -0000
Content-Type: multipart/alternative; boundary="000000000000c52abc0571f9983b"

--000000000000c52abc0571f9983b
Content-Type: text/plain; charset="UTF-8"

Yes.  I was just waiting for my master build to wrap up.

On Fri, Jul 27, 2018, 7:39 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> I like this change, some recipes in meta-oe seems to be broken now, is
> someone already working on a fix?
>
> I'm seeing following 5 failures in my world builds:
>
> python-stevedore-1.28.0-r0 do_compile and python3-stevedore-1.28.0-r0
> do_compile
> pkg_resources.DistributionNotFound: The 'pbr>=2.0.0' distribution was not
> found and is required by the application
>
> python-dateutil-2.7.3-r0 do_compile and python3-dateutil-2.7.3-r0
> do_compile
> pkg_resources.DistributionNotFound: The 'setuptools_scm' distribution was
> not found and is required by the application
>
> python-daemon-2.1.2-r0 do_compile
> pkg_resources.DistributionNotFound: The 'docutils' distribution was not
> found and is required by the application
>
> I've found a fix for python-dateutils from Derek:
> https://patchwork.openembedded.org/patch/153002/
>
> On Tue, Jul 17, 2018 at 3:27 PM Hongxu Jia <hongxu.jia@windriver.com>
> wrote:
>
>> If a python recipe is using setuptools and the setup_requires argument,
>> where
>> setuptools will use easy_install to fetch the module if it isn't
>> present.
>>
>> The build failed on a machine where a proxy was required, but succeeded
>> on a
>> machine which had direct access to the internet
>>
>> Add var-NO_FETCH_BUILD, and set it in distutils_do_compile which does not
>> allow to fetch code from internet during do_compile.
>>
>> Example result:
>> ...
>> ERROR: Do not try to fetch `pytest-runner1' for building. Please add its
>> native recipe to DEPENDS.
>> Traceback (most recent call last):
>>   File "setup.py", line 56, in <module>
>> ...
>>
>> The improvement is flexible for test_requirements argument (used at
>> `setup.py test'), where use easy_install also.
>>
>> [YOCTO #12084]
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>  meta/classes/distutils.bbclass                     |  1 +
>>  meta/classes/distutils3.bbclass                    |  1 +
>>  ...ionally-do-not-fetch-code-by-easy_install.patch | 34
>> ++++++++++++++++++++++
>>  meta/recipes-devtools/python/python-setuptools.inc |  2 ++
>>  4 files changed, 38 insertions(+)
>>  create mode 100644
>> meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
>>
>> diff --git a/meta/classes/distutils.bbclass
>> b/meta/classes/distutils.bbclass
>> index 1930c35..c2f7403 100644
>> --- a/meta/classes/distutils.bbclass
>> +++ b/meta/classes/distutils.bbclass
>> @@ -8,6 +8,7 @@ DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
>>      --install-data=${D}/${datadir}"
>>
>>  distutils_do_compile() {
>> +         NO_FETCH_BUILD=1 \
>>           STAGING_INCDIR=${STAGING_INCDIR} \
>>           STAGING_LIBDIR=${STAGING_LIBDIR} \
>>           ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
>> setup.py build ${DISTUTILS_BUILD_ARGS} || \
>> diff --git a/meta/classes/distutils3.bbclass
>> b/meta/classes/distutils3.bbclass
>> index d4b92a3..f8aca5e 100644
>> --- a/meta/classes/distutils3.bbclass
>> +++ b/meta/classes/distutils3.bbclass
>> @@ -15,6 +15,7 @@ distutils3_do_configure() {
>>  }
>>
>>  distutils3_do_compile() {
>> +        NO_FETCH_BUILD=1 \
>>          STAGING_INCDIR=${STAGING_INCDIR} \
>>          STAGING_LIBDIR=${STAGING_LIBDIR} \
>>          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
>> setup.py \
>> diff --git
>> a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
>> b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
>> new file mode 100644
>> index 0000000..4b17921
>> --- /dev/null
>> +++
>> b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
>> @@ -0,0 +1,34 @@
>> +From 019422d19c6401fa8f45b1311ecd31bb087c809d Mon Sep 17 00:00:00 2001
>> +From: Hongxu Jia <hongxu.jia@windriver.com>
>> +Date: Tue, 17 Jul 2018 10:13:38 +0800
>> +Subject: [PATCH] conditionally do not fetch code by easy_install
>> +
>> +If var-NO_FETCH_BUILD is set, do not allow to fetch code from
>> +internet by easy_install.
>> +
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +---
>> + setuptools/command/easy_install.py | 5 +++++
>> + 1 file changed, 5 insertions(+)
>> +
>> +diff --git a/setuptools/command/easy_install.py
>> b/setuptools/command/easy_install.py
>> +index 85ee40f..7eb9d2a 100755
>> +--- a/setuptools/command/easy_install.py
>> ++++ b/setuptools/command/easy_install.py
>> +@@ -637,6 +637,11 @@ class easy_install(Command):
>> +             os.path.exists(tmpdir) and rmtree(rmtree_safe(tmpdir))
>> +
>> +     def easy_install(self, spec, deps=False):
>> ++        if os.environ.get('NO_FETCH_BUILD', None):
>> ++            log.error("ERROR: Do not try to fetch `%s' for building. "
>> ++                      "Please add its native recipe to DEPENDS." % spec)
>> ++            return None
>> ++
>> +         if not self.editable:
>> +             self.install_site_py()
>> +
>> +--
>> +2.7.4
>> +
>> diff --git a/meta/recipes-devtools/python/python-setuptools.inc
>> b/meta/recipes-devtools/python/python-setuptools.inc
>> index 25be446..24b3ac4 100644
>> --- a/meta/recipes-devtools/python/python-setuptools.inc
>> +++ b/meta/recipes-devtools/python/python-setuptools.inc
>> @@ -9,6 +9,8 @@ PYPI_PACKAGE_EXT = "zip"
>>
>>  inherit pypi
>>
>> +SRC_URI_append_class-native = "
>> file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
>> +
>>  SRC_URI[md5sum] = "260630ae1a64bafa39dcc53404d63829"
>>  SRC_URI[sha256sum] =
>> "012adb8e25fbfd64c652e99e7bab58799a3aaf05d39ab38561f69190a909015f"
>>
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--000000000000c52abc0571f9983b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes.=C2=A0 I was just waiting for my master build to wrap=
 up.=C2=A0=C2=A0</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fr=
i, Jul 27, 2018, 7:39 AM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gm=
ail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr">I like this change, some recipes in meta-oe =
seems to be broken now, is someone already working on a fix?<div><br></div>=
<div>I&#39;m seeing following 5 failures in my world builds:</div><div><br>=
</div><div>python-stevedore-1.28.0-r0 do_compile and=C2=A0python3-stevedore=
-1.28.0-r0 do_compile<br></div><div>pkg_resources.DistributionNotFound: The=
 &#39;pbr&gt;=3D2.0.0&#39; distribution was not found and is required by th=
e application<br></div><div><br></div><div>python-dateutil-2.7.3-r0 do_comp=
ile and=C2=A0python3-dateutil-2.7.3-r0 do_compile<br></div><div>pkg_resourc=
es.DistributionNotFound: The &#39;setuptools_scm&#39; distribution was not =
found and is required by the application<br></div><div><br></div><div>pytho=
n-daemon-2.1.2-r0 do_compile<br></div><div>pkg_resources.DistributionNotFou=
nd: The &#39;docutils&#39; distribution was not found and is required by th=
e application<br></div><div><br></div><div>I&#39;ve found a fix for python-=
dateutils from Derek:</div><div><a href=3D"https://patchwork.openembedded.o=
rg/patch/153002/" target=3D"_blank" rel=3D"noreferrer">https://patchwork.op=
enembedded.org/patch/153002/</a><br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr">On Tue, Jul 17, 2018 at 3:27 PM Hongxu Jia &lt;<a href=
=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank" rel=3D"noreferrer">h=
ongxu.jia@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">If a python recipe is using setuptools and the setup_requires argument,=
 where<br>
setuptools will use easy_install to fetch the module if it isn&#39;t<br>
present.<br>
<br>
The build failed on a machine where a proxy was required, but succeeded on =
a<br>
machine which had direct access to the internet<br>
<br>
Add var-NO_FETCH_BUILD, and set it in distutils_do_compile which does not<b=
r>
allow to fetch code from internet during do_compile.<br>
<br>
Example result:<br>
...<br>
ERROR: Do not try to fetch `pytest-runner1&#39; for building. Please add it=
s native recipe to DEPENDS.<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;setup.py&quot;, line 56, in &lt;module&gt;<br>
...<br>
<br>
The improvement is flexible for test_requirements argument (used at<br>
`setup.py test&#39;), where use easy_install also.<br>
<br>
[YOCTO #12084]<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank" rel=3D"noreferrer">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/distutils.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0meta/classes/distutils3.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0...ionally-do-not-fetch-code-by-easy_install.patch | 34 +++++++++++++=
+++++++++<br>
=C2=A0meta/recipes-devtools/python/python-setuptools.inc |=C2=A0 2 ++<br>
=C2=A04 files changed, 38 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/files/0001-conditiona=
lly-do-not-fetch-code-by-easy_install.patch<br>
<br>
diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclas=
s<br>
index 1930c35..c2f7403 100644<br>
--- a/meta/classes/distutils.bbclass<br>
+++ b/meta/classes/distutils.bbclass<br>
@@ -8,6 +8,7 @@ DISTUTILS_INSTALL_ARGS ?=3D &quot;--prefix=3D${D}/${prefix}=
 \<br>
=C2=A0 =C2=A0 =C2=A0--install-data=3D${D}/${datadir}&quot;<br>
<br>
=C2=A0distutils_do_compile() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NO_FETCH_BUILD=3D1 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 STAGING_INCDIR=3D${STAGING_INCDIR} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 STAGING_LIBDIR=3D${STAGING_LIBDIR} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-na=
tive/${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS} || \<br>
diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbcl=
ass<br>
index d4b92a3..f8aca5e 100644<br>
--- a/meta/classes/distutils3.bbclass<br>
+++ b/meta/classes/distutils3.bbclass<br>
@@ -15,6 +15,7 @@ distutils3_do_configure() {<br>
=C2=A0}<br>
<br>
=C2=A0distutils3_do_compile() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NO_FETCH_BUILD=3D1 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STAGING_INCDIR=3D${STAGING_INCDIR} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STAGING_LIBDIR=3D${STAGING_LIBDIR} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-nat=
ive/${PYTHON_PN} setup.py \<br>
diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-f=
etch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-c=
onditionally-do-not-fetch-code-by-easy_install.patch<br>
new file mode 100644<br>
index 0000000..4b17921<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-co=
de-by-easy_install.patch<br>
@@ -0,0 +1,34 @@<br>
+From 019422d19c6401fa8f45b1311ecd31bb087c809d Mon Sep 17 00:00:00 2001<br>
+From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D=
"_blank" rel=3D"noreferrer">hongxu.jia@windriver.com</a>&gt;<br>
+Date: Tue, 17 Jul 2018 10:13:38 +0800<br>
+Subject: [PATCH] conditionally do not fetch code by easy_install<br>
+<br>
+If var-NO_FETCH_BUILD is set, do not allow to fetch code from<br>
+internet by easy_install.<br>
+<br>
+Upstream-Status: Inappropriate [oe specific]<br>
+<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" =
target=3D"_blank" rel=3D"noreferrer">hongxu.jia@windriver.com</a>&gt;<br>
+---<br>
+ setuptools/command/easy_install.py | 5 +++++<br>
+ 1 file changed, 5 insertions(+)<br>
+<br>
+diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_=
install.py<br>
+index 85ee40f..7eb9d2a 100755<br>
+--- a/setuptools/command/easy_install.py<br>
++++ b/setuptools/command/easy_install.py<br>
+@@ -637,6 +637,11 @@ class easy_install(Command):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.path.exists(tmpdir) and=
 rmtree(rmtree_safe(tmpdir))<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0def easy_install(self, spec, deps=3DFalse):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.environ.get(&#39;NO_FETCH_BUILD&#39;, N=
one):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log.error(&quot;ERROR: Do not t=
ry to fetch `%s&#39; for building. &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Please add its native recipe to DEPENDS.&quot; % spec)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not self.editable:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.install_site_py()<br>
+ <br>
+-- <br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/reci=
pes-devtools/python/python-setuptools.inc<br>
index 25be446..24b3ac4 100644<br>
--- a/meta/recipes-devtools/python/python-setuptools.inc<br>
+++ b/meta/recipes-devtools/python/python-setuptools.inc<br>
@@ -9,6 +9,8 @@ PYPI_PACKAGE_EXT =3D &quot;zip&quot;<br>
<br>
=C2=A0inherit pypi<br>
<br>
+SRC_URI_append_class-native =3D &quot; file://0001-conditionally-do-not-fe=
tch-code-by-easy_install.patch&quot;<br>
+<br>
=C2=A0SRC_URI[md5sum] =3D &quot;260630ae1a64bafa39dcc53404d63829&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;012adb8e25fbfd64c652e99e7bab58799a3aaf05=
d39ab38561f69190a909015f&quot;<br>
<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openembedded=
.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div>
</blockquote></div>

--000000000000c52abc0571f9983b--

Return-Path: <bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 685B778CC0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 12:43:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1532695401; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=+JwZDQWhg3FvW53gQtSVxO+Pd7ekEmxYJnThUO5U7jM=;
	b=SSGuV+hCCH4GqWoRC8w8X+EYIhSkpeWvZt9Kf6pVIESIM+uN+NJyZDCqWGo4yQcV4SLFv9Sl
	1TzXvcy2AAyZeKpTT81+Kx3B9C+lSKa18DKwKmexV2msWc/mWTZzPe+OuRrmhQ7Xl9ue3L3/
	flp+ZdLateWIN1T0BQDE6O4dAqw=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyJiMTQwMSIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjNhNTY4NSJd
Sender: derek@asterius.io
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mxa.mailgun.org with ESMTP id 5b5b1368.7f9d2196dc30-smtp-out-n03;
	Fri, 27 Jul 2018 12:43:20 -0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id d9-v6so7105008itf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 05:43:20 -0700 (PDT)
X-Gm-Message-State: AOUpUlGIAjTiLvXiG8Zgm3QQ+Yzy/acjLyljhkJxgg5PzGIAQWr9pWTC
	aZ0aO/7bFB4KTEoPV5bOeEVL3ToR3kpFm9Z41WY=
X-Google-Smtp-Source: AAOMgpemkjMMHEpYZnT8XtPmK4jBzSRGIkAog3papjg4vWN7P6uZnBNgX9AOdX+B1Ikwf4FHjNWOTWA272UCmQJSv1U=
X-Received: by 2002:a24:3b0e:: with SMTP id
	c14-v6mr5676011ita.42.1532695400355; 
	Fri, 27 Jul 2018 05:43:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:8c4e:0:0:0:0:0 with HTTP; Fri, 27 Jul 2018 05:43:19
	-0700 (PDT)
In-Reply-To: <CADNbA1r-1jU67KXVMijf03LpV-uUHXRuda38+dEKFWc7daV=+Q@mail.gmail.com>
References: <CAJTo0LZW2UdP221rM_z5f2Eq5uyc65hbYZUOUDmz8CZn-o4G_w@mail.gmail.com>
	<1531834595-4814-1-git-send-email-hongxu.jia@windriver.com>
	<CA+chaQdb_FniAciq0EPH-bf7gTXj-fTDOdi-snac3tgON-2NGg@mail.gmail.com>
	<CADNbA1r-1jU67KXVMijf03LpV-uUHXRuda38+dEKFWc7daV=+Q@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 27 Jul 2018 08:43:19 -0400
X-Gmail-Original-Message-ID: <CADNbA1rRsO-Wrf9h31Tx=nZnhqi1B5DiqykRgMi9TM3+WMAwTw@mail.gmail.com>
Message-ID: <CADNbA1rRsO-Wrf9h31Tx=nZnhqi1B5DiqykRgMi9TM3+WMAwTw@mail.gmail.com>
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
X-List-Received-Date: Fri, 27 Jul 2018 12:43:20 -0000
Content-Type: multipart/alternative; boundary="000000000000e320170571fa7485"

--000000000000e320170571fa7485
Content-Type: text/plain; charset="UTF-8"

python-daemon - https://patchwork.openembedded.org/patch/153034/

python-stevedore - https://patchwork.openembedded.org/patch/153032/

I think that's everything though my world python build is still going.
Thanks for pointing the failures out and let me know if there are others.
I'm guessing this will ripple through the python heavy layers; I found a
couple yesterday in meta-iot-cloud.

On Fri, Jul 27, 2018 at 7:41 AM, Derek Straka <derek@asterius.io> wrote:

> Yes.  I was just waiting for my master build to wrap up.
>
> On Fri, Jul 27, 2018, 7:39 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> I like this change, some recipes in meta-oe seems to be broken now, is
>> someone already working on a fix?
>>
>> I'm seeing following 5 failures in my world builds:
>>
>> python-stevedore-1.28.0-r0 do_compile and python3-stevedore-1.28.0-r0
>> do_compile
>> pkg_resources.DistributionNotFound: The 'pbr>=2.0.0' distribution was
>> not found and is required by the application
>>
>> python-dateutil-2.7.3-r0 do_compile and python3-dateutil-2.7.3-r0
>> do_compile
>> pkg_resources.DistributionNotFound: The 'setuptools_scm' distribution
>> was not found and is required by the application
>>
>> python-daemon-2.1.2-r0 do_compile
>> pkg_resources.DistributionNotFound: The 'docutils' distribution was not
>> found and is required by the application
>>
>> I've found a fix for python-dateutils from Derek:
>> https://patchwork.openembedded.org/patch/153002/
>>
>> On Tue, Jul 17, 2018 at 3:27 PM Hongxu Jia <hongxu.jia@windriver.com>
>> wrote:
>>
>>> If a python recipe is using setuptools and the setup_requires argument,
>>> where
>>> setuptools will use easy_install to fetch the module if it isn't
>>> present.
>>>
>>> The build failed on a machine where a proxy was required, but succeeded
>>> on a
>>> machine which had direct access to the internet
>>>
>>> Add var-NO_FETCH_BUILD, and set it in distutils_do_compile which does not
>>> allow to fetch code from internet during do_compile.
>>>
>>> Example result:
>>> ...
>>> ERROR: Do not try to fetch `pytest-runner1' for building. Please add its
>>> native recipe to DEPENDS.
>>> Traceback (most recent call last):
>>>   File "setup.py", line 56, in <module>
>>> ...
>>>
>>> The improvement is flexible for test_requirements argument (used at
>>> `setup.py test'), where use easy_install also.
>>>
>>> [YOCTO #12084]
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ---
>>>  meta/classes/distutils.bbclass                     |  1 +
>>>  meta/classes/distutils3.bbclass                    |  1 +
>>>  ...ionally-do-not-fetch-code-by-easy_install.patch | 34
>>> ++++++++++++++++++++++
>>>  meta/recipes-devtools/python/python-setuptools.inc |  2 ++
>>>  4 files changed, 38 insertions(+)
>>>  create mode 100644 meta/recipes-devtools/python/
>>> files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
>>>
>>> diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.
>>> bbclass
>>> index 1930c35..c2f7403 100644
>>> --- a/meta/classes/distutils.bbclass
>>> +++ b/meta/classes/distutils.bbclass
>>> @@ -8,6 +8,7 @@ DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
>>>      --install-data=${D}/${datadir}"
>>>
>>>  distutils_do_compile() {
>>> +         NO_FETCH_BUILD=1 \
>>>           STAGING_INCDIR=${STAGING_INCDIR} \
>>>           STAGING_LIBDIR=${STAGING_LIBDIR} \
>>>           ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
>>> setup.py build ${DISTUTILS_BUILD_ARGS} || \
>>> diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.
>>> bbclass
>>> index d4b92a3..f8aca5e 100644
>>> --- a/meta/classes/distutils3.bbclass
>>> +++ b/meta/classes/distutils3.bbclass
>>> @@ -15,6 +15,7 @@ distutils3_do_configure() {
>>>  }
>>>
>>>  distutils3_do_compile() {
>>> +        NO_FETCH_BUILD=1 \
>>>          STAGING_INCDIR=${STAGING_INCDIR} \
>>>          STAGING_LIBDIR=${STAGING_LIBDIR} \
>>>          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
>>> setup.py \
>>> diff --git a/meta/recipes-devtools/python/files/0001-
>>> conditionally-do-not-fetch-code-by-easy_install.patch
>>> b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-
>>> code-by-easy_install.patch
>>> new file mode 100644
>>> index 0000000..4b17921
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/python/files/0001-
>>> conditionally-do-not-fetch-code-by-easy_install.patch
>>> @@ -0,0 +1,34 @@
>>> +From 019422d19c6401fa8f45b1311ecd31bb087c809d Mon Sep 17 00:00:00 2001
>>> +From: Hongxu Jia <hongxu.jia@windriver.com>
>>> +Date: Tue, 17 Jul 2018 10:13:38 +0800
>>> +Subject: [PATCH] conditionally do not fetch code by easy_install
>>> +
>>> +If var-NO_FETCH_BUILD is set, do not allow to fetch code from
>>> +internet by easy_install.
>>> +
>>> +Upstream-Status: Inappropriate [oe specific]
>>> +
>>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> +---
>>> + setuptools/command/easy_install.py | 5 +++++
>>> + 1 file changed, 5 insertions(+)
>>> +
>>> +diff --git a/setuptools/command/easy_install.py
>>> b/setuptools/command/easy_install.py
>>> +index 85ee40f..7eb9d2a 100755
>>> +--- a/setuptools/command/easy_install.py
>>> ++++ b/setuptools/command/easy_install.py
>>> +@@ -637,6 +637,11 @@ class easy_install(Command):
>>> +             os.path.exists(tmpdir) and rmtree(rmtree_safe(tmpdir))
>>> +
>>> +     def easy_install(self, spec, deps=False):
>>> ++        if os.environ.get('NO_FETCH_BUILD', None):
>>> ++            log.error("ERROR: Do not try to fetch `%s' for building. "
>>> ++                      "Please add its native recipe to DEPENDS." %
>>> spec)
>>> ++            return None
>>> ++
>>> +         if not self.editable:
>>> +             self.install_site_py()
>>> +
>>> +--
>>> +2.7.4
>>> +
>>> diff --git a/meta/recipes-devtools/python/python-setuptools.inc
>>> b/meta/recipes-devtools/python/python-setuptools.inc
>>> index 25be446..24b3ac4 100644
>>> --- a/meta/recipes-devtools/python/python-setuptools.inc
>>> +++ b/meta/recipes-devtools/python/python-setuptools.inc
>>> @@ -9,6 +9,8 @@ PYPI_PACKAGE_EXT = "zip"
>>>
>>>  inherit pypi
>>>
>>> +SRC_URI_append_class-native = " file://0001-conditionally-do-
>>> not-fetch-code-by-easy_install.patch"
>>> +
>>>  SRC_URI[md5sum] = "260630ae1a64bafa39dcc53404d63829"
>>>  SRC_URI[sha256sum] = "012adb8e25fbfd64c652e99e7bab58
>>> 799a3aaf05d39ab38561f69190a909015f"
>>>
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>

--000000000000e320170571fa7485
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">python-daemon -=C2=A0<a href=3D"https://patchwork.openembe=
dded.org/patch/153034/">https://patchwork.openembedded.org/patch/153034/</a=
><br><div><br></div><div>python-stevedore -=C2=A0<a href=3D"https://patchwo=
rk.openembedded.org/patch/153032/">https://patchwork.openembedded.org/patch=
/153032/</a><br></div><div><br></div><div>I think that&#39;s everything tho=
ugh my world python build is still going.=C2=A0 Thanks for pointing the fai=
lures out and let me know if there are others.=C2=A0 I&#39;m guessing this =
will ripple through the python heavy layers; I found a couple yesterday in =
meta-iot-cloud.</div></div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Fri, Jul 27, 2018 at 7:41 AM, Derek Straka <span dir=3D"ltr">&=
lt;<a href=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto">=
Yes.=C2=A0 I was just waiting for my master build to wrap up.=C2=A0=C2=A0</=
div><div class=3D"HOEnZb"><div class=3D"h5"><br><div class=3D"gmail_quote">=
<div dir=3D"ltr">On Fri, Jul 27, 2018, 7:39 AM Martin Jansa &lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I like=
 this change, some recipes in meta-oe seems to be broken now, is someone al=
ready working on a fix?<div><br></div><div>I&#39;m seeing following 5 failu=
res in my world builds:</div><div><br></div><div>python-stevedore-1.28.0-r0=
 do_compile and=C2=A0python3-stevedore-1.28.0-<wbr>r0 do_compile<br></div><=
div>pkg_resources.<wbr>DistributionNotFound: The &#39;pbr&gt;=3D2.0.0&#39; =
distribution was not found and is required by the application<br></div><div=
><br></div><div>python-dateutil-2.7.3-r0 do_compile and=C2=A0python3-dateut=
il-2.7.3-r0 do_compile<br></div><div>pkg_resources.<wbr>DistributionNotFoun=
d: The &#39;setuptools_scm&#39; distribution was not found and is required =
by the application<br></div><div><br></div><div>python-daemon-2.1.2-r0 do_c=
ompile<br></div><div>pkg_resources.<wbr>DistributionNotFound: The &#39;docu=
tils&#39; distribution was not found and is required by the application<br>=
</div><div><br></div><div>I&#39;ve found a fix for python-dateutils from De=
rek:</div><div><a href=3D"https://patchwork.openembedded.org/patch/153002/"=
 rel=3D"noreferrer" target=3D"_blank">https://patchwork.<wbr>openembedded.o=
rg/patch/153002/</a><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr">On Tue, Jul 17, 2018 at 3:27 PM Hongxu Jia &lt;<a href=3D"mailto:h=
ongxu.jia@windriver.com" rel=3D"noreferrer" target=3D"_blank">hongxu.jia@wi=
ndriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">If a pyt=
hon recipe is using setuptools and the setup_requires argument, where<br>
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
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" r=
el=3D"noreferrer" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/distutils.<wbr>bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0meta/classes/distutils3.<wbr>bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0...ionally-do-not-fetch-code-<wbr>by-easy_install.patch | 34 ++++++++=
++++++++++++++<br>
=C2=A0meta/recipes-devtools/python/<wbr>python-setuptools.inc |=C2=A0 2 ++<=
br>
=C2=A04 files changed, 38 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<wbr>files/0001-condi=
tionally-do-<wbr>not-fetch-code-by-easy_<wbr>install.patch<br>
<br>
diff --git a/meta/classes/distutils.<wbr>bbclass b/meta/classes/distutils.<=
wbr>bbclass<br>
index 1930c35..c2f7403 100644<br>
--- a/meta/classes/distutils.<wbr>bbclass<br>
+++ b/meta/classes/distutils.<wbr>bbclass<br>
@@ -8,6 +8,7 @@ DISTUTILS_INSTALL_ARGS ?=3D &quot;--prefix=3D${D}/${prefix}=
 \<br>
=C2=A0 =C2=A0 =C2=A0--install-data=3D${D}/${<wbr>datadir}&quot;<br>
<br>
=C2=A0distutils_do_compile() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NO_FETCH_BUILD=3D1 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 STAGING_INCDIR=3D${STAGING_<wbr>INCDIR} =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 STAGING_LIBDIR=3D${STAGING_<wbr>LIBDIR} =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${STAGING_BINDIR_NATIVE}/${<wbr>PYTHON_P=
N}-native/${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS} || \<br>
diff --git a/meta/classes/distutils3.<wbr>bbclass b/meta/classes/distutils3=
.<wbr>bbclass<br>
index d4b92a3..f8aca5e 100644<br>
--- a/meta/classes/distutils3.<wbr>bbclass<br>
+++ b/meta/classes/distutils3.<wbr>bbclass<br>
@@ -15,6 +15,7 @@ distutils3_do_configure() {<br>
=C2=A0}<br>
<br>
=C2=A0distutils3_do_compile() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NO_FETCH_BUILD=3D1 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STAGING_INCDIR=3D${STAGING_<wbr>INCDIR} \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STAGING_LIBDIR=3D${STAGING_<wbr>LIBDIR} \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/${<wbr>PYTHON_PN=
}-native/${PYTHON_PN} setup.py \<br>
diff --git a/meta/recipes-devtools/<wbr>python/files/0001-<wbr>conditionall=
y-do-not-fetch-<wbr>code-by-easy_install.patch b/meta/recipes-devtools/<wbr=
>python/files/0001-<wbr>conditionally-do-not-fetch-<wbr>code-by-easy_instal=
l.patch<br>
new file mode 100644<br>
index 0000000..4b17921<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/<wbr>python/files/0001-<wbr>conditionally-do-no=
t-fetch-<wbr>code-by-easy_install.patch<br>
@@ -0,0 +1,34 @@<br>
+From 019422d19c6401fa8f45b1311ecd31<wbr>bb087c809d Mon Sep 17 00:00:00 200=
1<br>
+From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" rel=3D"no=
referrer" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
+Date: Tue, 17 Jul 2018 10:13:38 +0800<br>
+Subject: [PATCH] conditionally do not fetch code by easy_install<br>
+<br>
+If var-NO_FETCH_BUILD is set, do not allow to fetch code from<br>
+internet by easy_install.<br>
+<br>
+Upstream-Status: Inappropriate [oe specific]<br>
+<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" =
rel=3D"noreferrer" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
+---<br>
+ setuptools/command/easy_<wbr>install.py | 5 +++++<br>
+ 1 file changed, 5 insertions(+)<br>
+<br>
+diff --git a/setuptools/command/easy_<wbr>install.py b/setuptools/command/=
easy_<wbr>install.py<br>
+index 85ee40f..7eb9d2a 100755<br>
+--- a/setuptools/command/easy_<wbr>install.py<br>
++++ b/setuptools/command/easy_<wbr>install.py<br>
+@@ -637,6 +637,11 @@ class easy_install(Command):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.path.exists(tmpdir) and=
 rmtree(rmtree_safe(tmpdir))<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0def easy_install(self, spec, deps=3DFalse):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.environ.get(&#39;NO_FETCH_<wbr>BUILD&#3=
9;, None):<br>
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
diff --git a/meta/recipes-devtools/<wbr>python/python-setuptools.inc b/meta=
/recipes-devtools/<wbr>python/python-setuptools.inc<br>
index 25be446..24b3ac4 100644<br>
--- a/meta/recipes-devtools/<wbr>python/python-setuptools.inc<br>
+++ b/meta/recipes-devtools/<wbr>python/python-setuptools.inc<br>
@@ -9,6 +9,8 @@ PYPI_PACKAGE_EXT =3D &quot;zip&quot;<br>
<br>
=C2=A0inherit pypi<br>
<br>
+SRC_URI_append_class-native =3D &quot; file://0001-conditionally-do-<wbr>n=
ot-fetch-code-by-easy_<wbr>install.patch&quot;<br>
+<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>260630ae1a64bafa39dcc53404d638<wbr>29&=
quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;<wbr>012adb8e25fbfd64c652e99e7bab58<wbr>=
799a3aaf05d39ab38561f69190a909<wbr>015f&quot;<br>
<br>
-- <br>
2.7.4<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" rel=3D"noreferr=
er" target=3D"_blank">Openembedded-core@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openembedded=
.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
</blockquote></div>
</blockquote></div>
</div></div></blockquote></div><br></div>

--000000000000e320170571fa7485--

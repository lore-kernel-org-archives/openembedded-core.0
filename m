Return-Path: <bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 9974A6067C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 19:49:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1517255395; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=mKPtl4wiqmc8HyGXagbH2O8uk7t8T4VxLALOLL7fNOA=;
	b=uRp69tQDZFqIp/zvDps6XKc7j+oMSWMqLocWTGABsBRETkYEToVEvHyiw1SRl7bURNnLkm0i
	jtEXEOyoTGEAL7i63Ew1nzG2bXkB48O3LHMoK5N2oPxMQ2cSu8azqCjE9H2TUpZaq8p4ToPq
	kLbCUoxrPFhpt4uQ6VhTcn5jUxY=
X-Mailgun-Sid: WyJiMTQwMSIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjNhNTY4NSJd
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mxa.mailgun.org with ESMTP id 5a6f7ae3.7f6bdc47c1b0-smtp-out-n02;
	Mon, 29 Jan 2018 19:49:55 -0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id z12so7112100qkf.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 11:49:55 -0800 (PST)
X-Gm-Message-State: AKwxytfdCRhruv+Tml1nmsmwAlBzX7U3EHn0ey1sUsrwbTeozK9CT1aI
	WH/r9DMTXJ6sA1mUez8sLYQyiMk5/GsNlyygetA=
X-Google-Smtp-Source: AH8x226ALTc9ay8TJlXVADTXKU2qP6NVB9hFH69zeuJU66jtETdvfkZ2r3mVXjs4Pk05JwEwVyKr55S0YpEj1TwSiXg=
X-Received: by 10.55.122.194 with SMTP id v185mr37492547qkc.41.1517255395076; 
	Mon, 29 Jan 2018 11:49:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.40.71 with HTTP; Mon, 29 Jan 2018 11:49:54 -0800 (PST)
In-Reply-To: <339ae59d-fd5e-47e1-9b4a-3fd9e5195877@xilinx.com>
References: <1516994731-20440-1-git-send-email-derek@asterius.io>
	<339ae59d-fd5e-47e1-9b4a-3fd9e5195877@xilinx.com>
From: Derek Straka <derek@asterius.io>
Date: Mon, 29 Jan 2018 14:49:54 -0500
X-Gmail-Original-Message-ID: <CADNbA1pYtBP_HN--U3zNsVADeR-RW3+1cXhm+WGobRB6TuYv2g@mail.gmail.com>
Message-ID: <CADNbA1pYtBP_HN--U3zNsVADeR-RW3+1cXhm+WGobRB6TuYv2g@mail.gmail.com>
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python: Upgrade both python and python-native to 2.7.14
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
X-List-Received-Date: Mon, 29 Jan 2018 19:49:55 -0000
Content-Type: multipart/alternative; boundary="94eb2c063bc4db73c60563ef8ca2"

--94eb2c063bc4db73c60563ef8ca2
Content-Type: text/plain; charset="UTF-8"

Oh no, I did not.  I will send a v2 with an updated manifest.  Thanks for
catching that.

-Derek

On Mon, Jan 29, 2018 at 2:23 PM, Alejandro Enedino Hernandez Samaniego <
alejandro.enedino.hernandez-samaniego@xilinx.com> wrote:

> Hey Derek,
>
>
> Just a quick question, did you run the create manifest task along with the
> upgrade?
>
>
> Cheers,
>
>
> Alejandro
>
>
>
> On 01/26/2018 11:25 AM, Derek Straka wrote:
>
>> Rebased:
>>    - python/01-use-proper-tools-for-cross-build.patch
>>    - python/fix-makefile-for-ptest.patch
>>    - python/parallel-makeinst-create-bindir.patch
>>
>> Removed Upstreamed Patch:
>>    - python/Don-t-use-getentropy-on-Linux.patch
>>
>> Updated license checksum for changes in the copyright date.  The license
>> terms remain unchanged
>>
>> Added an extra do_compile item to create the native pgen that no longer
>> gets compiled by default
>>
>> Signed-off-by: Derek Straka <derek@asterius.io>
>> ---
>>   ...on-native_2.7.13.bb => python-native_2.7.14.bb} |  6 ++++
>>   meta/recipes-devtools/python/python.inc            |  6 ++--
>>   .../01-use-proper-tools-for-cross-build.patch      | 17 +++++----
>>   .../python/Don-t-use-getentropy-on-Linux.patch     | 41
>> ----------------------
>>   .../python/python/fix-makefile-for-ptest.patch     |  6 ++--
>>   .../python/parallel-makeinst-create-bindir.patch   | 12 +++----
>>   .../python/{python_2.7.13.bb => python_2.7.14.bb}  |  1 -
>>   7 files changed, 28 insertions(+), 61 deletions(-)
>>   rename meta/recipes-devtools/python/{python-native_2.7.13.bb =>
>> python-native_2.7.14.bb} (94%)
>>   delete mode 100644 meta/recipes-devtools/python/p
>> ython/Don-t-use-getentropy-on-Linux.patch
>>   rename meta/recipes-devtools/python/{python_2.7.13.bb =>
>> python_2.7.14.bb} (99%)
>>
>> diff --git a/meta/recipes-devtools/python/python-native_2.7.13.bb
>> b/meta/recipes-devtools/python/python-native_2.7.14.bb
>> similarity index 94%
>> rename from meta/recipes-devtools/python/python-native_2.7.13.bb
>> rename to meta/recipes-devtools/python/python-native_2.7.14.bb
>> index 2b74003..622cb38 100644
>> --- a/meta/recipes-devtools/python/python-native_2.7.13.bb
>> +++ b/meta/recipes-devtools/python/python-native_2.7.14.bb
>> @@ -36,6 +36,12 @@ do_configure_append() {
>>         autoreconf --verbose --install --force --exclude=autopoint
>> ../Python-${PV}/Modules/_ctypes/libffi
>>   }
>>   +# Regenerate all of the generated files
>> +# This ensures that pgen and friends get created during the compile phase
>> +do_compile_prepend() {
>> +    oe_runmake regen-all
>> +}
>> +
>>   do_install() {
>>         oe_runmake 'DESTDIR=${D}' install
>>         install -d ${D}${bindir}/${PN}
>> diff --git a/meta/recipes-devtools/python/python.inc
>> b/meta/recipes-devtools/python/python.inc
>> index b40f551..979b601 100644
>> --- a/meta/recipes-devtools/python/python.inc
>> +++ b/meta/recipes-devtools/python/python.inc
>> @@ -5,12 +5,12 @@ SECTION = "devel/python"
>>   # bump this on every change in contrib/python/generate-manifest-2.7.py
>>   INC_PR = "r1"
>>   -LIC_FILES_CHKSUM = "file://LICENSE;md5=6b60258130
>> e4ed10d3101517eb5b9385"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f741e51de91d4eeea5930b9c3c7fa69d"
>>     SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz
>> "
>>   -SRC_URI[md5sum] = "53b43534153bb2a0363f08bae8b9d990"
>> -SRC_URI[sha256sum] = "35d543986882f78261f97787fd3e0
>> 6274bfa6df29fac9b4a94f73930ff98f731"
>> +SRC_URI[md5sum] = "1f6db41ad91d9eb0a6f0c769b8613c5b"
>> +SRC_URI[sha256sum] = "71ffb26e09e78650e424929b2b457
>> b9c912ac216576e6bd9e7d204ed03296a66"
>>     # python recipe is actually python 2.x
>>   # also, exclude pre-releases for both python 2.x and 3.x
>> diff --git a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
>> b/meta/recipes-devtools/python/python/01-use-proper-tools-
>> for-cross-build.patch
>> index 366ce3e..e795a74 100644
>> --- a/meta/recipes-devtools/python/python/01-use-proper-tools-
>> for-cross-build.patch
>> +++ b/meta/recipes-devtools/python/python/01-use-proper-tools-
>> for-cross-build.patch
>> @@ -9,6 +9,9 @@ Signed-off-by: Paul Eggleton <
>> paul.eggleton@linux.intel.com>
>>   Rebased for python-2.7.9
>>   Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com
>> >
>>   +Rebased for python-2.7.14
>> +Signed-off-by: Derek Straka <derek@asterius.io>
>> +
>>   Index: Python-2.7.13/Makefile.pre.in
>>   ===================================================================
>>   --- Python-2.7.13.orig/Makefile.pre.in
>> @@ -30,14 +33,14 @@ Index: Python-2.7.13/Makefile.pre.in
>>       # Create build directory and generate the sysconfig build-time data
>> there.
>>    # pybuilddir.txt contains the name of the build dir and is used for
>> -@@ -681,7 +682,7 @@ Modules/pwdmodule.o: $(srcdir)/Modules/p
>> -
>> - $(GRAMMAR_H): @GENERATED_COMMENT@ $(GRAMMAR_INPUT) $(PGEN)
>> +@@ -663,7 +663,7 @@
>> +       # Regenerate Include/graminit.h and Python/graminit.c
>> +       # from Grammar/Grammar using pgen
>>         @$(MKDIR_P) Include
>> --      $(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
>> -+      $(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
>> - $(GRAMMAR_C): @GENERATED_COMMENT@ $(GRAMMAR_H)
>> -       touch $(GRAMMAR_C)
>> +-      $(PGEN) $(srcdir)/Grammar/Grammar \
>> ++      $(HOSTPGEN) $(srcdir)/Grammar/Grammar \
>> +               $(srcdir)/Include/graminit.h \
>> +               $(srcdir)/Python/graminit.c
>>      @@ -1121,27 +1122,27 @@ libinstall:        build_all
>> $(srcdir)/Lib/$(PL
>>                         $(DESTDIR)$(LIBDEST)/distutils/tests ; \
>> diff --git a/meta/recipes-devtools/python/python/Don-t-use-getentropy-on-Linux.patch
>> b/meta/recipes-devtools/python/python/Don-t-use-getentropy-on-Linux.patch
>> deleted file mode 100644
>> index 38e5377..0000000
>> --- a/meta/recipes-devtools/python/python/Don-t-use-getentropy-
>> on-Linux.patch
>> +++ /dev/null
>> @@ -1,41 +0,0 @@
>> -Upstream-Status: Backport
>> -
>> -Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> -
>> -From 905d1b30ac7cb0e31c57cec0533825c8f170b942 Mon Sep 17 00:00:00 2001
>> -From: Victor Stinner <victor.stinner@gmail.com>
>> -Date: Mon, 9 Jan 2017 11:10:41 +0100
>> -Subject: [PATCH] Don't use getentropy() on Linux
>> -
>> -Issue #29188: Support glibc 2.24 on Linux: don't use getentropy()
>> function but
>> -read from /dev/urandom to get random bytes, for example in
>> os.urandom().  On
>> -Linux, getentropy() is implemented which getrandom() is blocking mode,
>> whereas
>> -os.urandom() should not block.
>> -
>> -(cherry picked from commit 2687486756721e39164fa9f597e468c35d495227)
>> ----
>> - Python/random.c | 11 +++++++++--
>> - 1 file changed, 9 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/Python/random.c b/Python/random.c
>> -index b4bc1f3..f3f5d14 100644
>> ---- a/Python/random.c
>> -+++ b/Python/random.c
>> -@@ -94,8 +94,15 @@ win32_urandom(unsigned char *buffer, Py_ssize_t size,
>> int raise)
>> - }
>> -
>> - /* Issue #25003: Don't use getentropy() on Solaris (available since
>> -- * Solaris 11.3), it is blocking whereas os.urandom() should not block.
>> */
>> --#elif defined(HAVE_GETENTROPY) && !defined(sun)
>> -+   Solaris 11.3), it is blocking whereas os.urandom() should not block.
>> -+
>> -+   Issue #29188: Don't use getentropy() on Linux since the glibc 2.24
>> -+   implements it with the getrandom() syscall which can fail with
>> ENOSYS,
>> -+   and this error is not supported in py_getentropy() and getrandom()
>> is called
>> -+   with flags=0 which blocks until system urandom is initialized, which
>> is not
>> -+   the desired behaviour to seed the Python hash secret nor for
>> os.urandom():
>> -+   see the PEP 524 which was only implemented in Python 3.6. */
>> -+#elif defined(HAVE_GETENTROPY) && !defined(sun) && !defined(linux)
>> - #define PY_GETENTROPY 1
>> -
>> - /* Fill buffer with size pseudo-random bytes generated by getentropy().
>> diff --git a/meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch
>> b/meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch
>> index 669112d..90dcd57 100644
>> --- a/meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch
>> +++ b/meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch
>> @@ -15,7 +15,7 @@ diff -ruN a/Makefile.pre.in b/Makefile.pre.in
>>   +TESTOPTS=    -l -v $(EXTRATESTOPTS)
>>    TESTPROG=    $(srcdir)/Lib/test/regrtest.py
>>   -TESTPYTHON=  $(RUNSHARED) ./$(BUILDPYTHON) -Wd -3 -E -tt
>> $(TESTPYTHONOPTS)
>> --test:         all platform
>> +-test:         @DEF_MAKE_RULE@ platform
>>   -             -find $(srcdir)/Lib -name '*.py[co]' -print | xargs rm -f
>>   +TESTPYTHON=  $(RUNSHARED) $(BUILDPYTHON) -Wd -3 -E -tt
>> $(TESTPYTHONOPTS)
>>   +test:                build-test
>> @@ -26,8 +26,8 @@ diff -ruN a/Makefile.pre.in b/Makefile.pre.in
>>                 -$(TESTPYTHON) $(TESTPROG) $(TESTOPTS)
>>                 $(TESTPYTHON) $(TESTPROG) $(TESTOPTS)
>>    -+build-test:        all platform
>> ++build-test:   @DEF_MAKE_RULE@ platform
>>   +
>> - testall:      all platform
>> + testall:      @DEF_MAKE_RULE@ platform
>>                 -find $(srcdir)/Lib -name '*.py[co]' -print | xargs rm -f
>>                 $(TESTPYTHON) $(srcdir)/Lib/compileall.py
>> diff --git a/meta/recipes-devtools/python/python/parallel-makeinst-create-bindir.patch
>> b/meta/recipes-devtools/python/python/parallel-makeinst-
>> create-bindir.patch
>> index 951cb46..abab41e 100644
>> --- a/meta/recipes-devtools/python/python/parallel-makeinst-
>> create-bindir.patch
>> +++ b/meta/recipes-devtools/python/python/parallel-makeinst-
>> create-bindir.patch
>> @@ -8,12 +8,12 @@ Upstream-Status: Pending
>>     --- Python-2.7.3.orig/Makefile.pre.in
>>   +++ Python-2.7.3/Makefile.pre.in
>> -@@ -1008,7 +1008,7 @@ LIBPL=           $(LIBP)/config
>> +@@ -1187,7 +1187,7 @@
>>    LIBPC=               $(LIBDIR)/pkgconfig
>> -
>> - libainstall:  all python-config
>> +
>> + libainstall:  @DEF_MAKE_RULE@ python-config
>>   -     @for i in $(LIBDIR) $(LIBP) $(LIBPL) $(LIBPC); \
>>   +     @for i in $(LIBDIR) $(LIBP) $(LIBPL) $(LIBPC) $(BINDIR); \
>> -       do \
>> -               if test ! -d $(DESTDIR)$$i; then \
>> -                       echo "Creating directory $$i"; \
>> +       do \
>> +               if test ! -d $(DESTDIR)$$i; then \
>> +                       echo "Creating directory $$i"; \
>> diff --git a/meta/recipes-devtools/python/python_2.7.13.bb
>> b/meta/recipes-devtools/python/python_2.7.14.bb
>> similarity index 99%
>> rename from meta/recipes-devtools/python/python_2.7.13.bb
>> rename to meta/recipes-devtools/python/python_2.7.14.bb
>> index dbafb95..13455ff 100644
>> --- a/meta/recipes-devtools/python/python_2.7.13.bb
>> +++ b/meta/recipes-devtools/python/python_2.7.14.bb
>> @@ -28,7 +28,6 @@ SRC_URI += "\
>>     file://parallel-makeinst-create-bindir.patch \
>>     file://use_sysroot_ncurses_instead_of_host.patch \
>>     file://add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
>> -  file://Don-t-use-getentropy-on-Linux.patch \
>>     file://pass-missing-libraries-to-Extension-for-mul.patch \
>>     file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
>>   "
>>
>

--94eb2c063bc4db73c60563ef8ca2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Oh no, I did not.=C2=A0 I will send a v2 with an updated m=
anifest.=C2=A0 Thanks for catching that.<div><br></div><div>-Derek</div></d=
iv><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Jan 29=
, 2018 at 2:23 PM, Alejandro Enedino Hernandez Samaniego <span dir=3D"ltr">=
&lt;<a href=3D"mailto:alejandro.enedino.hernandez-samaniego@xilinx.com" tar=
get=3D"_blank">alejandro.enedino.hernandez-samaniego@xilinx.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">Hey Derek,<br>
<br>
<br>
Just a quick question, did you run the create manifest task along with the =
upgrade?<br>
<br>
<br>
Cheers,<br>
<br>
<br>
Alejandro<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
On 01/26/2018 11:25 AM, Derek Straka wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Rebased:<br>
=C2=A0 =C2=A0- python/01-use-proper-tools-for<wbr>-cross-build.patch<br>
=C2=A0 =C2=A0- python/fix-makefile-for-ptest.<wbr>patch<br>
=C2=A0 =C2=A0- python/parallel-makeinst-creat<wbr>e-bindir.patch<br>
<br>
Removed Upstreamed Patch:<br>
=C2=A0 =C2=A0- python/Don-t-use-getentropy-on<wbr>-Linux.patch<br>
<br>
Updated license checksum for changes in the copyright date.=C2=A0 The licen=
se<br>
terms remain unchanged<br>
<br>
Added an extra do_compile item to create the native pgen that no longer<br>
gets compiled by default<br>
<br>
Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io" target=
=3D"_blank">derek@asterius.io</a>&gt;<br>
---<br>
=C2=A0 ...<a href=3D"http://on-native_2.7.13.bb" rel=3D"noreferrer" target=
=3D"_blank">on-native_2.7.13.bb</a> =3D&gt; <a href=3D"http://python-native=
_2.7.14.bb" rel=3D"noreferrer" target=3D"_blank">python-native_2.7.14.bb</a=
>} |=C2=A0 6 ++++<br>
=C2=A0 meta/recipes-devtools/python/p<wbr>ython.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++--<br>
=C2=A0 .../01-use-proper-tools-for-cr<wbr>oss-build.patch=C2=A0 =C2=A0 =C2=
=A0 | 17 +++++----<br>
=C2=A0 .../python/Don-t-use-getentrop<wbr>y-on-Linux.patch=C2=A0 =C2=A0 =C2=
=A0| 41 ----------------------<br>
=C2=A0 .../python/python/fix-makefile<wbr>-for-ptest.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 6 ++--<br>
=C2=A0 .../python/parallel-makeinst-c<wbr>reate-bindir.patch=C2=A0 =C2=A0| =
12 +++----<br>
=C2=A0 .../python/{<a href=3D"http://python_2.7.13.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python_2.7.13.bb</a> =3D&gt; <a href=3D"http://python_2.7.=
14.bb" rel=3D"noreferrer" target=3D"_blank">python_2.7.14.bb</a>}=C2=A0 |=
=C2=A0 1 -<br>
=C2=A0 7 files changed, 28 insertions(+), 61 deletions(-)<br>
=C2=A0 rename meta/recipes-devtools/python/{<a href=3D"http://python-native=
_2.7.13.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>python-native_2.7.13.=
bb</a> =3D&gt; <a href=3D"http://python-native_2.7.14.bb" rel=3D"noreferrer=
" target=3D"_blank">python-native_2.7.14.bb</a>} (94%)<br>
=C2=A0 delete mode 100644 meta/recipes-devtools/python/p<wbr>ython/Don-t-us=
e-getentropy-on-<wbr>Linux.patch<br>
=C2=A0 rename meta/recipes-devtools/python/{<a href=3D"http://python_2.7.13=
.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>python_2.7.13.bb</a> =3D&gt;=
 <a href=3D"http://python_2.7.14.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython_2.7.14.bb</a>} (99%)<br>
<br>
diff --git a/meta/recipes-devtools/python<wbr>/<a href=3D"http://python-nat=
ive_2.7.13.bb" rel=3D"noreferrer" target=3D"_blank">python-native_2.7.13.bb=
</a> b/meta/recipes-devtools/python<wbr>/<a href=3D"http://python-native_2.=
7.14.bb" rel=3D"noreferrer" target=3D"_blank">python-native_2.7.14.bb</a><b=
r>
similarity index 94%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python-native_2.=
7.13.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>ython-native_2.7.13.bb<=
/a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python-native_2.7.=
14.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>ython-native_2.7.14.bb</a=
><br>
index 2b74003..622cb38 100644<br>
--- a/meta/recipes-devtools/python<wbr>/<a href=3D"http://python-native_2.7=
.13.bb" rel=3D"noreferrer" target=3D"_blank">python-native_2.7.13.bb</a><br=
>
+++ b/meta/recipes-devtools/python<wbr>/<a href=3D"http://python-native_2.7=
.14.bb" rel=3D"noreferrer" target=3D"_blank">python-native_2.7.14.bb</a><br=
>
@@ -36,6 +36,12 @@ do_configure_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 autoreconf --verbose --install --force --exclud=
e=3Dautopoint ../Python-${PV}/Modules/_ctype<wbr>s/libffi<br>
=C2=A0 }<br>
=C2=A0 +# Regenerate all of the generated files<br>
+# This ensures that pgen and friends get created during the compile phase<=
br>
+do_compile_prepend() {<br>
+=C2=A0 =C2=A0 oe_runmake regen-all<br>
+}<br>
+<br>
=C2=A0 do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake &#39;DESTDIR=3D${D}&#39; install<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}/${PN}<br>
diff --git a/meta/recipes-devtools/python<wbr>/python.inc b/meta/recipes-de=
vtools/python<wbr>/python.inc<br>
index b40f551..979b601 100644<br>
--- a/meta/recipes-devtools/python<wbr>/python.inc<br>
+++ b/meta/recipes-devtools/python<wbr>/python.inc<br>
@@ -5,12 +5,12 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0 # bump this on every change in contrib/python/<a href=3D"http://gene=
rate-manifest-2.7.py" rel=3D"noreferrer" target=3D"_blank">generate-manife<=
wbr>st-2.7.py</a><br>
=C2=A0 INC_PR =3D &quot;r1&quot;<br>
=C2=A0 -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D6b60258130<wbr>e4ed=
10d3101517eb5b9385&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Df741e51de9<wbr>1d4eeea5930=
b9c3c7fa69d&quot;<br>
=C2=A0 =C2=A0 SRC_URI =3D &quot;<a href=3D"http://www.python.org/ftp/python=
/$%7BPV%7D/Python-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">ht=
tp://www.python.org/ftp/pyt<wbr>hon/${PV}/Python-${PV}.tar.xz</a>&quot;<br>
=C2=A0 -SRC_URI[md5sum] =3D &quot;53b43534153bb2a0363f08bae8b9d<wbr>990&quo=
t;<br>
-SRC_URI[sha256sum] =3D &quot;35d543986882f78261f97787fd3e0<wbr>6274bfa6df2=
9fac9b4a94f73930ff9<wbr>8f731&quot;<br>
+SRC_URI[md5sum] =3D &quot;1f6db41ad91d9eb0a6f0c769b8613<wbr>c5b&quot;<br>
+SRC_URI[sha256sum] =3D &quot;71ffb26e09e78650e424929b2b457<wbr>b9c912ac216=
576e6bd9e7d204ed032<wbr>96a66&quot;<br>
=C2=A0 =C2=A0 # python recipe is actually python 2.x<br>
=C2=A0 # also, exclude pre-releases for both python 2.x and 3.x<br>
diff --git a/meta/recipes-devtools/python<wbr>/python/01-use-proper-tools-<=
wbr>for-cross-build.patch b/meta/recipes-devtools/python<wbr>/python/01-use=
-proper-tools-<wbr>for-cross-build.patch<br>
index 366ce3e..e795a74 100644<br>
--- a/meta/recipes-devtools/python<wbr>/python/01-use-proper-tools-<wbr>for=
-cross-build.patch<br>
+++ b/meta/recipes-devtools/python<wbr>/python/01-use-proper-tools-<wbr>for=
-cross-build.patch<br>
@@ -9,6 +9,9 @@ Signed-off-by: Paul Eggleton &lt;<a href=3D"mailto:paul.egg=
leton@linux.intel.com" target=3D"_blank">paul.eggleton@linux.intel.com</a><=
wbr>&gt;<br>
=C2=A0 Rebased for python-2.7.9<br>
=C2=A0 Signed-off-by: Alejandro Hernandez &lt;<a href=3D"mailto:alejandro.h=
ernandez@linux.intel.com" target=3D"_blank">alejandro.hernandez@linux.int<w=
br>el.com</a>&gt;<br>
=C2=A0 +Rebased for python-2.7.14<br>
+Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io" targe=
t=3D"_blank">derek@asterius.io</a>&gt;<br>
+<br>
=C2=A0 Index: Python-2.7.13/<a href=3D"http://Makefile.pre.in" rel=3D"noref=
errer" target=3D"_blank">Makefile.pre.in</a><br>
=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D<br>
=C2=A0 --- Python-2.7.13.orig/<a href=3D"http://Makefile.pre.in" rel=3D"nor=
eferrer" target=3D"_blank">Makefile.pr<wbr>e.in</a><br>
@@ -30,14 +33,14 @@ Index: Python-2.7.13/<a href=3D"http://Makefile.pre.in"=
 rel=3D"noreferrer" target=3D"_blank">Makefile.pre.in</a><br>
=C2=A0 =C2=A0 =C2=A0 # Create build directory and generate the sysconfig bu=
ild-time data there.<br>
=C2=A0 =C2=A0# pybuilddir.txt contains the name of the build dir and is use=
d for<br>
-@@ -681,7 +682,7 @@ Modules/pwdmodule.o: $(srcdir)/Modules/p<br>
-<br>
- $(GRAMMAR_H): @GENERATED_COMMENT@ $(GRAMMAR_INPUT) $(PGEN)<br>
+@@ -663,7 +663,7 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Regenerate Include/graminit.h and Python/gram=
init.c<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# from Grammar/Grammar using pgen<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @$(MKDIR_P) Include<br>
--=C2=A0 =C2=A0 =C2=A0 $(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 $(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_=
C)<br>
- $(GRAMMAR_C): @GENERATED_COMMENT@ $(GRAMMAR_H)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0touch $(GRAMMAR_C)<br>
+-=C2=A0 =C2=A0 =C2=A0 $(PGEN) $(srcdir)/Grammar/Grammar \<br>
++=C2=A0 =C2=A0 =C2=A0 $(HOSTPGEN) $(srcdir)/Grammar/Grammar \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(srcdir)/Include/g=
raminit.h \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(srcdir)/Python/gr=
aminit.c<br>
=C2=A0 =C2=A0 =C2=A0@@ -1121,27 +1122,27 @@ libinstall:=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 build_all $(srcdir)/Lib/$(PL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $(DESTDIR)$(LIBDEST)/distutils<wbr>/tests ; \<br>
diff --git a/meta/recipes-devtools/python<wbr>/python/Don-t-use-getentropy-=
<wbr>on-Linux.patch b/meta/recipes-devtools/python<wbr>/python/Don-t-use-ge=
tentropy-<wbr>on-Linux.patch<br>
deleted file mode 100644<br>
index 38e5377..0000000<br>
--- a/meta/recipes-devtools/python<wbr>/python/Don-t-use-getentropy-<wbr>on=
-Linux.patch<br>
+++ /dev/null<br>
@@ -1,41 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
-Signed-off-by: Andreas Oberritter &lt;<a href=3D"mailto:obi@opendreambox.o=
rg" target=3D"_blank">obi@opendreambox.org</a>&gt;<br>
-<br>
-From 905d1b30ac7cb0e31c57cec0533825<wbr>c8f170b942 Mon Sep 17 00:00:00 200=
1<br>
-From: Victor Stinner &lt;<a href=3D"mailto:victor.stinner@gmail.com" targe=
t=3D"_blank">victor.stinner@gmail.com</a>&gt;<br>
-Date: Mon, 9 Jan 2017 11:10:41 +0100<br>
-Subject: [PATCH] Don&#39;t use getentropy() on Linux<br>
-<br>
-Issue #29188: Support glibc 2.24 on Linux: don&#39;t use getentropy() func=
tion but<br>
-read from /dev/urandom to get random bytes, for example in os.urandom().=
=C2=A0 On<br>
-Linux, getentropy() is implemented which getrandom() is blocking mode, whe=
reas<br>
-os.urandom() should not block.<br>
-<br>
-(cherry picked from commit 2687486756721e39164fa9f597e468<wbr>c35d495227)<=
br>
----<br>
- Python/random.c | 11 +++++++++--<br>
- 1 file changed, 9 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/Python/random.c b/Python/random.c<br>
-index b4bc1f3..f3f5d14 100644<br>
---- a/Python/random.c<br>
-+++ b/Python/random.c<br>
-@@ -94,8 +94,15 @@ win32_urandom(unsigned char *buffer, Py_ssize_t size, i=
nt raise)<br>
- }<br>
-<br>
- /* Issue #25003: Don&#39;t use getentropy() on Solaris (available since<b=
r>
-- * Solaris 11.3), it is blocking whereas os.urandom() should not block. *=
/<br>
--#elif defined(HAVE_GETENTROPY) &amp;&amp; !defined(sun)<br>
-+=C2=A0 =C2=A0Solaris 11.3), it is blocking whereas os.urandom() should no=
t block.<br>
-+<br>
-+=C2=A0 =C2=A0Issue #29188: Don&#39;t use getentropy() on Linux since the =
glibc 2.24<br>
-+=C2=A0 =C2=A0implements it with the getrandom() syscall which can fail wi=
th ENOSYS,<br>
-+=C2=A0 =C2=A0and this error is not supported in py_getentropy() and getra=
ndom() is called<br>
-+=C2=A0 =C2=A0with flags=3D0 which blocks until system urandom is initiali=
zed, which is not<br>
-+=C2=A0 =C2=A0the desired behaviour to seed the Python hash secret nor for=
 os.urandom():<br>
-+=C2=A0 =C2=A0see the PEP 524 which was only implemented in Python 3.6. */=
<br>
-+#elif defined(HAVE_GETENTROPY) &amp;&amp; !defined(sun) &amp;&amp; !defin=
ed(linux)<br>
- #define PY_GETENTROPY 1<br>
-<br>
- /* Fill buffer with size pseudo-random bytes generated by getentropy().<b=
r>
diff --git a/meta/recipes-devtools/python<wbr>/python/fix-makefile-for-<wbr=
>ptest.patch b/meta/recipes-devtools/python<wbr>/python/fix-makefile-for-<w=
br>ptest.patch<br>
index 669112d..90dcd57 100644<br>
--- a/meta/recipes-devtools/python<wbr>/python/fix-makefile-for-<wbr>ptest.=
patch<br>
+++ b/meta/recipes-devtools/python<wbr>/python/fix-makefile-for-<wbr>ptest.=
patch<br>
@@ -15,7 +15,7 @@ diff -ruN a/<a href=3D"http://Makefile.pre.in" rel=3D"nor=
eferrer" target=3D"_blank">Makefile.pre.in</a> b/<a href=3D"http://Makefile=
.pre.in" rel=3D"noreferrer" target=3D"_blank">Makefile.pre.in</a><br>
=C2=A0 +TESTOPTS=3D=C2=A0 =C2=A0 -l -v $(EXTRATESTOPTS)<br>
=C2=A0 =C2=A0TESTPROG=3D=C2=A0 =C2=A0 $(srcdir)/Lib/test/regrtest.py<br>
=C2=A0 -TESTPYTHON=3D=C2=A0 $(RUNSHARED) ./$(BUILDPYTHON) -Wd -3 -E -tt $(T=
ESTPYTHONOPTS)<br>
--test:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0all platform<br>
+-test:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@DEF_MAKE_RULE@ platform<br>
=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-find $(srcdir)/Lib=
 -name &#39;*.py[co]&#39; -print | xargs rm -f<br>
=C2=A0 +TESTPYTHON=3D=C2=A0 $(RUNSHARED) $(BUILDPYTHON) -Wd -3 -E -tt $(TES=
TPYTHONOPTS)<br>
=C2=A0 +test:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build-=
test<br>
@@ -26,8 +26,8 @@ diff -ruN a/<a href=3D"http://Makefile.pre.in" rel=3D"nor=
eferrer" target=3D"_blank">Makefile.pre.in</a> b/<a href=3D"http://Makefile=
.pre.in" rel=3D"noreferrer" target=3D"_blank">Makefile.pre.in</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -$(TESTPYTHON) $(TE=
STPROG) $(TESTOPTS)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TESTPYTHON) $(TES=
TPROG) $(TESTOPTS)<br>
=C2=A0 =C2=A0-+build-test:=C2=A0 =C2=A0 =C2=A0 =C2=A0 all platform<br>
++build-test:=C2=A0 =C2=A0@DEF_MAKE_RULE@ platform<br>
=C2=A0 +<br>
- testall:=C2=A0 =C2=A0 =C2=A0 all platform<br>
+ testall:=C2=A0 =C2=A0 =C2=A0 @DEF_MAKE_RULE@ platform<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -find $(srcdir)/Lib=
 -name &#39;*.py[co]&#39; -print | xargs rm -f<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TESTPYTHON) $(src=
dir)/Lib/compileall.py<br>
diff --git a/meta/recipes-devtools/python<wbr>/python/parallel-makeinst-<wb=
r>create-bindir.patch b/meta/recipes-devtools/python<wbr>/python/parallel-m=
akeinst-<wbr>create-bindir.patch<br>
index 951cb46..abab41e 100644<br>
--- a/meta/recipes-devtools/python<wbr>/python/parallel-makeinst-<wbr>creat=
e-bindir.patch<br>
+++ b/meta/recipes-devtools/python<wbr>/python/parallel-makeinst-<wbr>creat=
e-bindir.patch<br>
@@ -8,12 +8,12 @@ Upstream-Status: Pending<br>
=C2=A0 =C2=A0 --- Python-2.7.3.orig/<a href=3D"http://Makefile.pre.in" rel=
=3D"noreferrer" target=3D"_blank">Makefile.pre<wbr>.in</a><br>
=C2=A0 +++ Python-2.7.3/<a href=3D"http://Makefile.pre.in" rel=3D"noreferre=
r" target=3D"_blank">Makefile.pre.in</a><br>
-@@ -1008,7 +1008,7 @@ LIBPL=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(L=
IBP)/config<br>
+@@ -1187,7 +1187,7 @@<br>
=C2=A0 =C2=A0LIBPC=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0$(LIBDIR)/pkgconfig<br>
-<br>
- libainstall:=C2=A0 all python-config<br>
+<br>
+ libainstall:=C2=A0 @DEF_MAKE_RULE@ python-config<br>
=C2=A0 -=C2=A0 =C2=A0 =C2=A0@for i in $(LIBDIR) $(LIBP) $(LIBPL) $(LIBPC); =
\<br>
=C2=A0 +=C2=A0 =C2=A0 =C2=A0@for i in $(LIBDIR) $(LIBP) $(LIBPL) $(LIBPC) $=
(BINDIR); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0do \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test ! -d $(DEST=
DIR)$$i; then \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo &quot;Creating directory $$i&quot;; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0do \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test ! -d $(DEST=
DIR)$$i; then \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo &quot;Creating directory $$i&quot;; \<br>
diff --git a/meta/recipes-devtools/python<wbr>/<a href=3D"http://python_2.7=
.13.bb" rel=3D"noreferrer" target=3D"_blank">python_2.7.13.bb</a> b/meta/re=
cipes-devtools/python<wbr>/<a href=3D"http://python_2.7.14.bb" rel=3D"noref=
errer" target=3D"_blank">python_2.7.14.bb</a><br>
similarity index 99%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python_2.7.13.bb=
" rel=3D"noreferrer" target=3D"_blank">p<wbr>ython_2.7.13.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python_2.7.14.bb" =
rel=3D"noreferrer" target=3D"_blank">p<wbr>ython_2.7.14.bb</a><br>
index dbafb95..13455ff 100644<br>
--- a/meta/recipes-devtools/python<wbr>/<a href=3D"http://python_2.7.13.bb"=
 rel=3D"noreferrer" target=3D"_blank">python_2.7.13.bb</a><br>
+++ b/meta/recipes-devtools/python<wbr>/<a href=3D"http://python_2.7.14.bb"=
 rel=3D"noreferrer" target=3D"_blank">python_2.7.14.bb</a><br>
@@ -28,7 +28,6 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 file://parallel-makeinst-creat<wbr>e-bindir.patch \<br>
=C2=A0 =C2=A0 file://use_sysroot_ncurses_ins<wbr>tead_of_host.patch \<br>
=C2=A0 =C2=A0 file://add-CROSSPYTHONPATH-for<wbr>-PYTHON_FOR_BUILD.patch \<=
br>
-=C2=A0 file://Don-t-use-getentropy-on<wbr>-Linux.patch \<br>
=C2=A0 =C2=A0 file://pass-missing-libraries-<wbr>to-Extension-for-mul.patch=
 \<br>
=C2=A0 =C2=A0 file://support_SOURCE_DATE_EPO<wbr>CH_in_py_compile_2.7.patch=
 \<br>
=C2=A0 &quot;<br>
</blockquote>
</div></div></blockquote></div><br></div>

--94eb2c063bc4db73c60563ef8ca2--

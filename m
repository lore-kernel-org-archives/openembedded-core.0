Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
	[209.85.167.172])
	by mail.openembedded.org (Postfix) with ESMTP id BBC9279164
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 08:06:11 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id a203-v6so4632896oib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 01:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DuUbgIrHEZX1IkZUBN0F6D9+DKBcQ6v5DJyC7hpfpl8=;
	b=exqlP3ekGut4D8vEym5qBMAuBVUcd2mmrgSAyxY+8bno+E419/TgwI3STglJxl80Jc
	fhdlvazzEnvyY+aljKe3aJs4NBvXyzi0pGTZ3XkpMBsnjL/eqv9F0fOvBHOx8/4WTgJi
	2OAOPhiSVNU8G8Isq8CZAl/P2An4EytxWa/blZsV+vLODL90ZE/skbn+hmUkRxs6gQN5
	HtmedyJ/DNLWApNGFGwCnu18/8qAe3ODVAntTVEkb7RR0Lsd+/r/AlH/Ip2JVNrgZAYz
	CTKPNP2uexYbP6peMpV3GD31VedU5UyEnH35VUq18rEFNWC/7RQjmfAdjnDd2RYLyHtj
	XOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DuUbgIrHEZX1IkZUBN0F6D9+DKBcQ6v5DJyC7hpfpl8=;
	b=ANuQycVeruQ/83pn8shMgVlNU5MqaypuSzYr3wcrcE020TkU+g+dRGbds4JuIF5WBc
	hBvAOvWmo3mVtTuE+5oCH/C33xVt0y2OM83dZ7zOw6ZzSAm/BuXRY22HHTLQaFN96blm
	ASEOiuhlvgRi1/L8jJxnpIfivAgVsqrXMpsGQ9i59Og/YiaMaIAGRgCJWKlNCnY0jqxk
	y0gF2KXYVWdSz5CmLGpmwvJUaoLbPG5zU56m6aaIqTGI1vtKd2Q416Ae1AebdyvXSDeE
	AIRTVv0LLNQRuOEe9qNIO1IryYb8vawYtaTXRnxgHnZPK9RqJrb4zROWcfVaEQX+E/h1
	Hnpg==
X-Gm-Message-State: ABuFfoga8Fs7O6JkW+chSfaY8Z4IFme/q+9P9AE19jasbEO5VQihrSlm
	TPi89yDRV4CW5fp4k/wo4CbSbvNmJvGzEu40wZs=
X-Google-Smtp-Source: ACcGV61ZDGwItmemFFihawUUgo8kX3JJSjiT+huz/SGOwmIo0V+ZihSVJVgbsyT43KYDQsQA1xs/m+facoqWQ/Q7BXM=
X-Received: by 2002:a54:4516:: with SMTP id l22-v6mr4935535oil.0.1538121972228;
	Fri, 28 Sep 2018 01:06:12 -0700 (PDT)
MIME-Version: 1.0
References: <20180919092400.2263-1-sno@netbsd.org>
	<7969ba66-742f-18d0-d4db-c852384d8a1d@xilinx.com>
	<CAANR1XGCswF2d4bqF4kZrMok=Y6dMMDqdh+uM80HUVESEA2gRQ@mail.gmail.com>
	<32d7fce5-a7ef-8b79-b20a-1dd3f15f4730@xilinx.com>
	<38AA7013-4957-4F2C-AD5C-8245F5E5DBF9@linux.intel.com>
In-Reply-To: <38AA7013-4957-4F2C-AD5C-8245F5E5DBF9@linux.intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Sep 2018 10:05:59 +0200
Message-ID: <CANNYZj_LN=Eduu1ftgAZf3YBCjakM=CU7P9j4D6WKn=9jb5kWA@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] python3{,-native}: update to 3.7.0
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
X-List-Received-Date: Fri, 28 Sep 2018 08:06:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please note that you should *at least* also build an image and an SDK
with the updated dnf. And run testimage package management tests, and
oe-selftest. And upgrade the rest of the dnf stack, particularly
libdnf, as there might be subtle breakage otherwise.

I'll get to this but not right now :)


Alex

=D1=81=D1=80, 26 =D1=81=D0=B5=D0=BD=D1=82. 2018 =D0=B3. =D0=B2 7:36, Tim Or=
ling <timothy.t.orling@linux.intel.com>:
>
> FWIW, the dnf upgrade appears to be trivial (I did not rebase python3 3.7=
.0 patches, but it probably won=E2=80=99t change much):
>
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dtimo/py=
thon37&id=3D94d4bba43097ec22f120f4327e5d13a52c1724fd
>
> NOTE: I used a hammer and overwrote Alex Kanavin=E2=80=99s patches, when =
really they just need to be refreshed. Not right, but I am being lazy. The =
above built on top of master on qemux86 without issue.
>
> IMPORTANT:
> Please realize that this will have to wait for the Yocto Project 2.7 rele=
ase cycle (beginning at the end of October), since this update to Python 3.=
7 is a _MAJOR_ change. I would expect significant breakage, if only in meta=
-python and friends...
>
> Time permitting, I=E2=80=99ll rebase the Python 3.7 patches and build-n-t=
est this.
>
> > On Sep 25, 2018, at 7:55 AM, Alejandro Hernandez <alejandro.enedino.her=
nandez-samaniego@xilinx.com> wrote:
> >
> > Hello Jens,
> >
> >
> > It literally seems that you didn't even read the email, I am not asking=
 whether or not it builds correctly for you, it clearly says that the fact =
that something builds correctly, doesn't necessarily means it runs properly=
, and it also says thanks because it contains some of the manifest changes,=
 so I know for a fact that you ran the create_manifest task, but as it is v=
ery clearly explained, if you run it with a full python3-native build you g=
et a different result, please fix that before sending another version of th=
is patch.
> >
> >
> > Alejandro
> >
> >
> > On 9/24/2018 1:13 PM, Jens Rehsack wrote:
> >> Hi Alejandro,
> >>
> >> on my system it builds without any problem. And I run the create_manif=
est task.
> >>
> >> Cheers,
> >> Jens
> >> Am Mi., 19. Sep. 2018 um 21:19 Uhr schrieb Alejandro Hernandez
> >> <alejandro.enedino.hernandez-samaniego@xilinx.com>:
> >>> Hello Jens,
> >>>
> >>> I appreciate the effort of submitting a v4,  this version has (mostly
> >>> all) the required manifest changes, and at the same time it proves th=
e
> >>> point I've been trying to make since the beginning:
> >>>
> >>> Again, the native build isn't complete and shows:
> >>>
> >>> Python build finished successfully!
> >>> The necessary bits to build these optional modules were not found:
> >>> _uuid
> >>>
> >>>
> >>> Which causes _uuid.*.so to be on the python3-misc package because it
> >>> wasn't on the native build and it couldn't be found when creating the
> >>> manifest (there is simply no reference to it on the manifest, so
> >>> python3-misc gets it):
> >>>
> >>> * python3-misc (dir)
> >>>          * usr (dir)
> >>>              * lib (dir)
> >>>                  * python3.7 (dir)
> >>>                      * lib-dynload(dir)
> >>>                          * _uuid.cpython-37m-i386-linux-gnu.so
> >>>
> >>>
> >>> This will eventually cause a runtime error if a user tries to install
> >>> python3-netclient, which is exactly the reason why the create_manifes=
t
> >>> task exists:
> >>>
> >>> Traceback (most recent call last):
> >>>    File "<stdin>", line 1, in <module>
> >>> ModuleNotFoundError: No module named '_uuid'
> >>>
> >>>
> >>> This can easily be prevented, as the note on the recipe says, we need=
 to
> >>> ensure we have a complete python3-native build to create the manifest=
 on
> >>> every new release. If you fix the native build with the instructions =
I
> >>> gave you and re-run the create_manifest task you will realize that th=
e
> >>> python3-netclient package should be the one to get the _uuid.*.so
> >>> library, since it depends on it to work properly.
> >>>
> >>> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> >>> @@ -743,6 +743,7 @@
> >>>               "${libdir}/python${PYTHON_MAJMIN}/hmac.py",
> >>>               "${libdir}/python${PYTHON_MAJMIN}/http",
> >>>               "${libdir}/python${PYTHON_MAJMIN}/http/__pycache__",
> >>> + "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_uuid.*.so",
> >>>
> >>>
> >>> And that is the reason why this upgrade still needs a one line patch =
to
> >>> setup.py to build _uuid on python3-native, I cannot make it any more
> >>> clearly.
> >>>
> >>> Please fix the native build before submitting a new version of this p=
atch.
> >>>
> >>>
> >>> Alejandro
> >>>
> >>>
> >>> On 9/19/2018 2:24 AM, Jens Rehsack wrote:
> >>>> Update python3 to recent 3.7.0 release.
> >>>>
> >>>> Details about new features and bug-fixes can be taken from
> >>>> * https://docs.python.org/3/whatsnew/3.7.html
> >>>> * https://docs.python.org/3/whatsnew/3.6.html
> >>>>
> >>>> Remove patches when they were fixed upstream and rebase the
> >>>> remaining ones. If necessary, the patches are adopted to
> >>>> keep the idea when upstream code was changed. Also remove
> >>>> backports from 3.6 and 3.7 into 3.5.6 codebase for TLS
> >>>> and multiprocessing.
> >>>>
> >>>> Open TODO: track patches in a -STABLE rebased git branch for
> >>>> easier rebasing or upstream submitting.
> >>>>
> >>>> Enhancement requests for Yocto project
> >>>> * https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12375
> >>>> * https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12901
> >>>> are solved by this.
> >>>>
> >>>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> >>>> ---
> >>>>   meta/classes/python3-dir.bbclass              |   6 +-
> >>>>   .../python/python3-native_3.5.6.bb            | 100 ------
> >>>>   .../python/python3-native_3.7.0.bb            |  73 ++++
> >>>>   meta/recipes-devtools/python/python3.inc      |  65 +++-
> >>>>   ...hell-version-of-python-config-that-w.patch |  21 +-
> >>>>   ..._sysconfigdata.py-to-initialize-dist.patch |  66 ----
> >>>>   ...ontext-has-improved-default-settings.patch | 272 --------------=
-
> >>>>   ...d-target-to-split-profile-generation.patch |  40 ---
> >>>>   ...S-1.3-cipher-suites-and-OP_NO_TLSv1_.patch | 227 ------------
> >>>>   ...for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch | 173 ---------
> >>>>   ....3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch | 110 ------
> >>>>   ...ALPN-changes-for-OpenSSL-1.1.0f-2305.patch |  68 ----
> >>>>   .../python3/03-fix-tkinter-detection.patch    |  12 +-
> >>>>   .../python3/030-fixup-include-dirs.patch      |   9 -
> >>>>   .../080-distutils-dont_adjust_files.patch     |   4 +-
> >>>>   .../python/python3/150-fix-setupterm.patch    |  17 -
> >>>>   ...GS-for-extensions-when-cross-compili.patch |  53 ++-
> >>>>   .../python3/avoid-ncursesw-include-path.patch |  18 +-
> >>>>   .../python3/avoid_warning_about_tkinter.patch |  18 +-
> >>>>   .../python3/configure.ac-fix-LIBPL.patch      |  21 +-
> >>>>   .../python/python3/float-endian.patch         |   9 +-
> >>>>   ...ssing-libraries-to-Extension-for-mul.patch |  26 +-
> >>>>   .../python/python3/python-3.3-multilib.patch  | 241 +++++++------
> >>>>   .../python/python3/python3-manifest.json      |  35 +-
> >>>>   ...CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch |  17 +-
> >>>>   .../python/python3/regen-all.patch            |  25 --
> >>>>   .../python/python3/signal.patch               |  56 ---
> >>>>   ...port_SOURCE_DATE_EPOCH_in_py_compile.patch |  36 +-
> >>>>   .../python3/sysroot-include-headers.patch     |  23 +-
> >>>>   .../python3/uuid_when_cross_compiling.patch   |  24 ++
> >>>>   meta/recipes-devtools/python/python3_3.5.6.bb | 328 --------------=
----
> >>>>   meta/recipes-devtools/python/python3_3.7.0.bb | 299 ++++++++++++++=
++
> >>>>   32 files changed, 722 insertions(+), 1770 deletions(-)
> >>>>   delete mode 100644 meta/recipes-devtools/python/python3-native_3.5=
.6.bb
> >>>>   create mode 100644 meta/recipes-devtools/python/python3-native_3.7=
.0.bb
> >>>>   delete mode 100644 meta/recipes-devtools/python/python3/0001-Issue=
-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
> >>>>   delete mode 100644 meta/recipes-devtools/python/python3/0001-Issue=
-28043-SSLContext-has-improved-default-settings.patch
> >>>>   delete mode 100644 meta/recipes-devtools/python/python3/0002-Makef=
ile-add-target-to-split-profile-generation.patch
> >>>>   delete mode 100644 meta/recipes-devtools/python/python3/0002-bpo-2=
9136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch
> >>>>   delete mode 100644 meta/recipes-devtools/python/python3/0003-bpo-3=
2947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch
> >>>>   delete mode 100644 meta/recipes-devtools/python/python3/0004-bpo-3=
3570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch
> >>>>   delete mode 100644 meta/recipes-devtools/python/python3/0005-bpo-3=
0714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch
> >>>>   delete mode 100644 meta/recipes-devtools/python/python3/150-fix-se=
tupterm.patch
> >>>>   delete mode 100644 meta/recipes-devtools/python/python3/regen-all.=
patch
> >>>>   delete mode 100644 meta/recipes-devtools/python/python3/signal.pat=
ch
> >>>>   create mode 100644 meta/recipes-devtools/python/python3/uuid_when_=
cross_compiling.patch
> >>>>   delete mode 100644 meta/recipes-devtools/python/python3_3.5.6.bb
> >>>>   create mode 100644 meta/recipes-devtools/python/python3_3.7.0.bb
> >>>>
> >>>> diff --git a/meta/classes/python3-dir.bbclass b/meta/classes/python3=
-dir.bbclass
> >>>> index 06bb046d9c..ad7ea8dd9a 100644
> >>>> --- a/meta/classes/python3-dir.bbclass
> >>>> +++ b/meta/classes/python3-dir.bbclass
> >>>> @@ -1,4 +1,8 @@
> >>>> -PYTHON_BASEVERSION =3D "3.5"
> >>>> +PYTHON_BASEVERSION =3D "3.7"
> >>>> +# [d][m][u]
> >>>> +# d: py_debug
> >>>> +# m: my_malloc
> >>>> +# u: wide-char unicode
> >>>>   PYTHON_ABI =3D "m"
> >>>>   PYTHON_DIR =3D "python${PYTHON_BASEVERSION}"
> >>>>   PYTHON_PN =3D "python3"
> >>>> diff --git a/meta/recipes-devtools/python/python3-native_3.5.6.bb b/=
meta/recipes-devtools/python/python3-native_3.5.6.bb
> >>>> deleted file mode 100644
> >>>> index d5953cf4bb..0000000000
> >>>> --- a/meta/recipes-devtools/python/python3-native_3.5.6.bb
> >>>> +++ /dev/null
> >>>> @@ -1,100 +0,0 @@
> >>>> -require recipes-devtools/python/python3.inc
> >>>> -
> >>>> -DISTRO_SRC_URI ?=3D "file://sitecustomize.py"
> >>>> -DISTRO_SRC_URI_linuxstdbase =3D ""
> >>>> -SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.ta=
r.xz \
> >>>> -file://12-distutils-prefix-is-inside-staging-area.patch \
> >>>> -file://python-config.patch \
> >>>> -file://030-fixup-include-dirs.patch \
> >>>> -file://070-dont-clean-ipkg-install.patch \
> >>>> -file://080-distutils-dont_adjust_files.patch \
> >>>> -file://130-readline-setup.patch \
> >>>> -file://150-fix-setupterm.patch \
> >>>> -file://python-3.3-multilib.patch \
> >>>> -file://03-fix-tkinter-detection.patch \
> >>>> -file://avoid_warning_about_tkinter.patch \
> >>>> -file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.pa=
tch \
> >>>> -file://sysroot-include-headers.patch \
> >>>> -file://unixccompiler.patch \
> >>>> -${DISTRO_SRC_URI} \
> >>>> -file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
> >>>> -file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
> >>>> -file://0001-Do-not-use-the-shell-version-of-python-config-that-w.pa=
tch \
> >>>> -file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
> >>>> -file://regen-all.patch \
> >>>> -file://0001-Issue-28043-SSLContext-has-improved-default-settings.pa=
tch \
> >>>> -file://0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.pa=
tch \
> >>>> -file://0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.pa=
tch \
> >>>> -file://0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.pat=
ch \
> >>>> -file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch \
> >>>> -"
> >>>> -
> >>>> -EXTRANATIVEPATH +=3D "bzip2-native"
> >>>> -DEPENDS =3D "openssl-native bzip2-replacement-native zlib-native re=
adline-native sqlite3-native gdbm-native"
> >>>> -
> >>>> -inherit native
> >>>> -
> >>>> -EXTRA_OECONF_append =3D " --bindir=3D${bindir}/${PN} --without-ensu=
repip"
> >>>> -
> >>>> -EXTRA_OEMAKE =3D '\
> >>>> -  LIBC=3D"" \
> >>>> -  STAGING_LIBDIR=3D${STAGING_LIBDIR_NATIVE} \
> >>>> -  STAGING_INCDIR=3D${STAGING_INCDIR_NATIVE} \
> >>>> -  LIB=3D${baselib} \
> >>>> -  ARCH=3D${TARGET_ARCH} \
> >>>> -'
> >>>> -
> >>>> -do_configure_append() {
> >>>> -     autoreconf --verbose --install --force --exclude=3Dautopoint .=
./Python-${PV}/Modules/_ctypes/libffi
> >>>> -     sed -i -e 's,#define HAVE_GETRANDOM 1,/\* #undef HAVE_GETRANDO=
M \*/,' ${B}/pyconfig.h
> >>>> -}
> >>>> -
> >>>> -# Regenerate all of the generated files
> >>>> -# This ensures that pgen and friends get created during the compile=
 phase
> >>>> -#
> >>>> -do_compile_prepend() {
> >>>> -    # Assuming https://bugs.python.org/issue33080 has been addresse=
d in Makefile.
> >>>> -    oe_runmake regen-all
> >>>> -}
> >>>> -
> >>>> -do_install() {
> >>>> -     install -d ${D}${libdir}/pkgconfig
> >>>> -     oe_runmake 'DESTDIR=3D${D}' install
> >>>> -     if [ -e ${WORKDIR}/sitecustomize.py ]; then
> >>>> -             install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${lib=
dir}/python${PYTHON_MAJMIN}
> >>>> -     fi
> >>>> -     install -d ${D}${bindir}/${PN}
> >>>> -     install -m 0755 Parser/pgen ${D}${bindir}/${PN}
> >>>> -
> >>>> -     # Make sure we use /usr/bin/env python
> >>>> -     for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bind=
ir}/${PN}`; do
> >>>> -             sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRI=
PT
> >>>> -     done
> >>>> -
> >>>> -        # Add a symlink to the native Python so that scripts can ju=
st invoke
> >>>> -        # "nativepython" and get the right one without needing abso=
lute paths
> >>>> -        # (these often end up too long for the #! parser in the ker=
nel as the
> >>>> -        # buffer is 128 bytes long).
> >>>> -        ln -s python3-native/python3 ${D}${bindir}/nativepython3
> >>>> -}
> >>>> -
> >>>> -python(){
> >>>> -
> >>>> -    # Read JSON manifest
> >>>> -    import json
> >>>> -    pythondir =3D d.getVar('THISDIR',True)
> >>>> -    with open(pythondir+'/python3/python3-manifest.json') as manife=
st_file:
> >>>> -        python_manifest=3Djson.load(manifest_file)
> >>>> -
> >>>> -    rprovides =3D d.getVar('RPROVIDES').split()
> >>>> -
> >>>> -    # Hardcoded since it cant be python3-native-foo, should be pyth=
on3-foo-native
> >>>> -    pn =3D 'python3'
> >>>> -
> >>>> -    for key in python_manifest:
> >>>> -        pypackage =3D pn + '-' + key + '-native'
> >>>> -        if pypackage not in rprovides:
> >>>> -              rprovides.append(pypackage)
> >>>> -
> >>>> -    d.setVar('RPROVIDES', ' '.join(rprovides))
> >>>> -}
> >>>> diff --git a/meta/recipes-devtools/python/python3-native_3.7.0.bb b/=
meta/recipes-devtools/python/python3-native_3.7.0.bb
> >>>> new file mode 100644
> >>>> index 0000000000..3ef9f0a5e3
> >>>> --- /dev/null
> >>>> +++ b/meta/recipes-devtools/python/python3-native_3.7.0.bb
> >>>> @@ -0,0 +1,73 @@
> >>>> +require recipes-devtools/python/python3.inc
> >>>> +
> >>>> +SRC_URI +=3D "\
> >>>> +    file://12-distutils-prefix-is-inside-staging-area.patch \
> >>>> +    file://0001-Do-not-use-the-shell-version-of-python-config-that-=
w.patch \
> >>>> +"
> >>>> +
> >>>> +EXTRANATIVEPATH +=3D "bzip2-native"
> >>>> +DEPENDS =3D "openssl-native libffi-native bzip2-replacement-native =
zlib-native \
> >>>> +           util-linux-native readline-native sqlite3-native gdbm-na=
tive \
> >>>> +"
> >>>> +
> >>>> +inherit native
> >>>> +
> >>>> +EXTRA_OECONF_append =3D " --bindir=3D${bindir}/${PN} --without-ensu=
repip"
> >>>> +
> >>>> +EXTRA_OEMAKE =3D '\
> >>>> +  LIBC=3D"" \
> >>>> +  STAGING_LIBDIR=3D${STAGING_LIBDIR_NATIVE} \
> >>>> +  STAGING_INCDIR=3D${STAGING_INCDIR_NATIVE} \
> >>>> +  LIB=3D${baselib} \
> >>>> +  ARCH=3D${TARGET_ARCH} \
> >>>> +'
> >>>> +
> >>>> +# Regenerate all of the generated files
> >>>> +# This ensures that pgen and friends get created during the compile=
 phase
> >>>> +#
> >>>> +do_compile_prepend() {
> >>>> +    # Assuming https://bugs.python.org/issue33080 has been addresse=
d in Makefile.
> >>>> +    oe_runmake regen-all
> >>>> +}
> >>>> +
> >>>> +do_install() {
> >>>> +     install -d ${D}${libdir}/pkgconfig
> >>>> +     oe_runmake 'DESTDIR=3D${D}' install
> >>>> +     if [ -e ${WORKDIR}/sitecustomize.py ]; then
> >>>> +             install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${lib=
dir}/python${PYTHON_MAJMIN}
> >>>> +     fi
> >>>> +     install -d ${D}${bindir}/${PN}
> >>>> +     install -m 0755 Parser/pgen ${D}${bindir}/${PN}
> >>>> +
> >>>> +     # Make sure we use /usr/bin/env python
> >>>> +     for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bind=
ir}/${PN}`; do
> >>>> +             sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRI=
PT
> >>>> +     done
> >>>> +
> >>>> +        # Add a symlink to the native Python so that scripts can ju=
st invoke
> >>>> +        # "nativepython" and get the right one without needing abso=
lute paths
> >>>> +        # (these often end up too long for the #! parser in the ker=
nel as the
> >>>> +        # buffer is 128 bytes long).
> >>>> +        ln -s python3-native/python3 ${D}${bindir}/nativepython3
> >>>> +}
> >>>> +
> >>>> +python(){
> >>>> +
> >>>> +    # Read JSON manifest
> >>>> +    import json
> >>>> +    pythondir =3D d.getVar('THISDIR',True)
> >>>> +    with open(pythondir+'/python3/python3-manifest.json') as manife=
st_file:
> >>>> +        python_manifest=3Djson.load(manifest_file)
> >>>> +
> >>>> +    rprovides =3D d.getVar('RPROVIDES').split()
> >>>> +
> >>>> +    # Hardcoded since it cant be python3-native-foo, should be pyth=
on3-foo-native
> >>>> +    pn =3D 'python3'
> >>>> +
> >>>> +    for key in python_manifest:
> >>>> +        pypackage =3D pn + '-' + key + '-native'
> >>>> +        if pypackage not in rprovides:
> >>>> +              rprovides.append(pypackage)
> >>>> +
> >>>> +    d.setVar('RPROVIDES', ' '.join(rprovides))
> >>>> +}
> >>>> diff --git a/meta/recipes-devtools/python/python3.inc b/meta/recipes=
-devtools/python/python3.inc
> >>>> index f565b3f171..b0fc0144a4 100644
> >>>> --- a/meta/recipes-devtools/python/python3.inc
> >>>> +++ b/meta/recipes-devtools/python/python3.inc
> >>>> @@ -3,41 +3,74 @@ HOMEPAGE =3D "http://www.python.org"
> >>>>   LICENSE =3D "PSFv2"
> >>>>   SECTION =3D "devel/python"
> >>>>
> >>>> -# TODO Remove this when we upgrade
> >>>> -INC_PR =3D "r1"
> >>>> -PR =3D "${INC_PR}.0"
> >>>> +PYTHON_MAJMIN =3D "3.7"
> >>>> +DISTRO_SRC_URI ?=3D "file://sitecustomize.py"
> >>>> +DISTRO_SRC_URI_linuxstdbase =3D ""
> >>>> +SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.ta=
r.xz \
> >>>> +    file://python-config.patch \
> >>>> +    file://python-3.3-multilib.patch \
> >>>> +    file://03-fix-tkinter-detection.patch \
> >>>> +    file://avoid_warning_about_tkinter.patch \
> >>>> +    file://unixccompiler.patch \
> >>>> +    file://sysroot-include-headers.patch \
> >>>> +    file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
> >>>> +    file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
> >>>> +    file://030-fixup-include-dirs.patch \
> >>>> +    file://070-dont-clean-ipkg-install.patch \
> >>>> +    file://080-distutils-dont_adjust_files.patch \
> >>>> +    file://130-readline-setup.patch \
> >>>> +    file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDec=
o.patch \
> >>>> +    ${DISTRO_SRC_URI} \
> >>>> +    file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
> >>>> +    file://Use-correct-CFLAGS-for-extensions-when-cross-compili.pat=
ch \
> >>>> +"
> >>>>
> >>>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db6ec515b22618f55fa07276b=
897bacea"
> >>>> +SRC_URI[md5sum] =3D "eb8c2a6b1447d50813c02714af4681f3"
> >>>> +SRC_URI[sha256sum] =3D "0382996d1ee6aafe59763426cf0139ffebe36984474=
d0ec4126dd1c40a8b3549"
> >>>>
> >>>> -# TODO consolidate patch set
> >>>> -SRC_URI[md5sum] =3D "f5a99f765e765336a3ebbb2a24ca2be3"
> >>>> -SRC_URI[sha256sum] =3D "f55cde04f521f273c7cba08912921cc5642cfc15ca7=
b22d5829f0aff4371155f"
> >>>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df257cc14f81685691652a3d3=
e1b5d754"
> >>>>
> >>>>   # exclude pre-releases for both python 2.x and 3.x
> >>>>   UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
> >>>>
> >>>> -CVE_PRODUCT =3D "python"
> >>>> -
> >>>> -PYTHON_MAJMIN =3D "3.5"
> >>>> -PYTHON_BINABI =3D "${PYTHON_MAJMIN}m"
> >>>> -
> >>>>   S =3D "${WORKDIR}/Python-${PV}"
> >>>>
> >>>> -inherit autotools bluetooth pkgconfig
> >>>> +CVE_PRODUCT =3D "python"
> >>>> +
> >>>> +inherit autotools bluetooth pkgconfig python3-dir
> >>>>
> >>>>   EXTRA_OECONF =3D "\
> >>>> -  --with-threads \
> >>>>     --with-pymalloc \
> >>>>     --without-cxx-main \
> >>>> -  --with-signal-module \
> >>>>     --enable-shared \
> >>>>     --enable-ipv6=3D${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', =
'yes', 'no', d)} \
> >>>>   "
> >>>>
> >>>>   PACKAGECONFIG[bluetooth] =3D ",ac_cv_header_bluetooth_bluetooth_h=
=3Dno ac_cv_header_bluetooth_h=3Dno,${BLUEZ}"
> >>>>
> >>>> +do_configure_prepend() {
> >>>> +     libdirleaf=3D"$(echo ${libdir} | sed -e 's:${prefix}/::')"
> >>>> +     sed -i -e "s:SEDMELIBLEAF:${libdirleaf}:g" \
> >>>> +             ${S}/configure.ac
> >>>> +}
> >>>> +
> >>>> +do_install_prepend() {
> >>>> +     MAKESETTINGS=3D"$(egrep '^(ABIFLAGS|MULTIARCH)=3D' ${B}/Makefi=
le | sed -E -e 's/[[:space:]]//g' -e 's/=3D/=3D"/' -e 's/$/"/')"
> >>>> +     eval ${MAKESETTINGS}
> >>>> +     if test "${ABIFLAGS}" !=3D "${PYTHON_ABI}"; then
> >>>> +         die "do_install: configure determined ABIFLAGS '${ABIFLAGS=
}' !=3D '${PYTHON_ABI}' from python3-dir.bbclass"
> >>>> +     fi
> >>>> +     if test "x${BUILD_OS}" =3D "x${TARGET_OS}"; then
> >>>> +             # no cross-compile at all
> >>>> +             _PYTHON_SYSCONFIGDATA_NAME=3D${PYTHON_ABI}_${TARGET_OS=
}_${MULTIARCH}
> >>>> +     else
> >>>> +             # at the very moment, it's the only available target
> >>>> +             _PYTHON_SYSCONFIGDATA_NAME=3D${PYTHON_ABI}_linux_${MUL=
TIARCH}
> >>>> +     fi
> >>>> +}
> >>>> +
> >>>>   do_install_append () {
> >>>>       sed -i -e 's:${HOSTTOOLS_DIR}/install:install:g' \
> >>>>               -e 's:${HOSTTOOLS_DIR}/mkdir:mkdir:g' \
> >>>> -             ${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.p=
y
> >>>> +             ${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_$=
{_PYTHON_SYSCONFIGDATA_NAME}.py
> >>>>   }
> >>>> diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-use-th=
e-shell-version-of-python-config-that-w.patch b/meta/recipes-devtools/pytho=
n/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
> >>>> index 8ea3f03fe0..aac34533ef 100644
> >>>> --- a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell=
-version-of-python-config-that-w.patch
> >>>> +++ b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell=
-version-of-python-config-that-w.patch
> >>>> @@ -14,25 +14,22 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@g=
mail.com>
> >>>>    1 file changed, 3 insertions(+), 6 deletions(-)
> >>>>
> >>>>   diff --git a/Makefile.pre.in b/Makefile.pre.in
> >>>> -index 236f005..5c4337f 100644
> >>>> +index 31b4bcabb3..7da6d6941e 100644
> >>>>   --- a/Makefile.pre.in
> >>>>   +++ b/Makefile.pre.in
> >>>> -@@ -1348,12 +1348,9 @@ python-config: $(srcdir)/Misc/python-config.=
in Misc/python-config.sh
> >>>> +@@ -1415,12 +1415,9 @@ python-config: $(srcdir)/Misc/python-config.=
in Misc/python-config.sh
> >>>>       sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," < $(s=
rcdir)/Misc/python-config.in >python-config.py
> >>>> -     # Replace makefile compat. variable references with shell scri=
pt compat. ones; $(VAR) -> ${VAR}
> >>>> +     @ # Replace makefile compat. variable references with shell sc=
ript compat. ones; $(VAR) -> ${VAR}
> >>>>       LC_ALL=3DC sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' < Mis=
c/python-config.sh >python-config
> >>>> --    # On Darwin, always use the python version of the script, the =
shell
> >>>> --    # version doesn't use the compiler customizations that are pro=
vided
> >>>> --    # in python (_osx_support.py).
> >>>> --    if test `uname -s` =3D Darwin; then \
> >>>> +-    @ # On Darwin, always use the python version of the script, th=
e shell
> >>>> +-    @ # version doesn't use the compiler customizations that are p=
rovided
> >>>> +-    @ # in python (_osx_support.py).
> >>>> +-    @if test `uname -s` =3D Darwin; then \
> >>>>   -           cp python-config.py python-config; \
> >>>>   -   fi
> >>>> -+    # In OpenEmbedded, always use the python version of the script=
, the shell
> >>>> -+    # version is broken in multiple ways, and doesn't return corre=
ct directories
> >>>> ++    @ # In OpenEmbedded, always use the python version of the scri=
pt, the shell
> >>>> ++    @ # version is broken in multiple ways, and doesn't return cor=
rect directories
> >>>>   +   cp python-config.py python-config
> >>>>
> >>>>
> >>>>    # Install the include files
> >>>> ---
> >>>> -2.11.0
> >>>> -
> >>>> diff --git a/meta/recipes-devtools/python/python3/0001-Issue-21272-U=
se-_sysconfigdata.py-to-initialize-dist.patch b/meta/recipes-devtools/pytho=
n/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
> >>>> deleted file mode 100644
> >>>> index d1c92e9eed..0000000000
> >>>> --- a/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sys=
configdata.py-to-initialize-dist.patch
> >>>> +++ /dev/null
> >>>> @@ -1,66 +0,0 @@
> >>>> -From bcddbf40c7f1b80336268cdddacc17369fb0ccea Mon Sep 17 00:00:00 2=
001
> >>>> -From: Libin Dang <libin.dang@windriver.com>
> >>>> -Date: Tue, 11 Apr 2017 14:12:15 +0800
> >>>> -Subject: [PATCH] Issue #21272: Use _sysconfigdata.py to initialize
> >>>> - distutils.sysconfig
> >>>> -
> >>>> -Backport upstream commit
> >>>> -https://github.com/python/cpython/commit/409482251b06fe75c4ee56e85f=
fbb4b23d934159
> >>>> -
> >>>> -Upstream-Status: Backport
> >>>> -
> >>>> -Signed-off-by: Li Zhou <li.zhou@windriver.com>
> >>>> ----
> >>>> - Lib/distutils/sysconfig.py | 35 ++++------------------------------=
-
> >>>> - 1 file changed, 4 insertions(+), 31 deletions(-)
> >>>> -
> >>>> -diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.p=
y
> >>>> -index 6d5cfd0..9925d24 100644
> >>>> ---- a/Lib/distutils/sysconfig.py
> >>>> -+++ b/Lib/distutils/sysconfig.py
> >>>> -@@ -424,38 +424,11 @@ _config_vars =3D None
> >>>> -
> >>>> - def _init_posix():
> >>>> -     """Initialize the module as appropriate for POSIX systems."""
> >>>> --    g =3D {}
> >>>> --    # load the installed Makefile:
> >>>> --    try:
> >>>> --        filename =3D get_makefile_filename()
> >>>> --        parse_makefile(filename, g)
> >>>> --    except OSError as msg:
> >>>> --        my_msg =3D "invalid Python installation: unable to open %s=
" % filename
> >>>> --        if hasattr(msg, "strerror"):
> >>>> --            my_msg =3D my_msg + " (%s)" % msg.strerror
> >>>> --
> >>>> --        raise DistutilsPlatformError(my_msg)
> >>>> --
> >>>> --    # load the installed pyconfig.h:
> >>>> --    try:
> >>>> --        filename =3D get_config_h_filename()
> >>>> --        with open(filename) as file:
> >>>> --            parse_config_h(file, g)
> >>>> --    except OSError as msg:
> >>>> --        my_msg =3D "invalid Python installation: unable to open %s=
" % filename
> >>>> --        if hasattr(msg, "strerror"):
> >>>> --            my_msg =3D my_msg + " (%s)" % msg.strerror
> >>>> --
> >>>> --        raise DistutilsPlatformError(my_msg)
> >>>> --
> >>>> --    # On AIX, there are wrong paths to the linker scripts in the M=
akefile
> >>>> --    # -- these paths are relative to the Python source, but when i=
nstalled
> >>>> --    # the scripts are in another directory.
> >>>> --    if python_build:
> >>>> --        g['LDSHARED'] =3D g['BLDSHARED']
> >>>> --
> >>>> -+    # _sysconfigdata is generated at build time, see the sysconfig=
 module
> >>>> -+    from _sysconfigdata import build_time_vars
> >>>> -     global _config_vars
> >>>> --    _config_vars =3D g
> >>>> -+    _config_vars =3D {}
> >>>> -+    _config_vars.update(build_time_vars)
> >>>> -
> >>>> -
> >>>> - def _init_nt():
> >>>> ---
> >>>> -1.8.3.1
> >>>> -
> >>>> diff --git a/meta/recipes-devtools/python/python3/0001-Issue-28043-S=
SLContext-has-improved-default-settings.patch b/meta/recipes-devtools/pytho=
n/python3/0001-Issue-28043-SSLContext-has-improved-default-settings.patch
> >>>> deleted file mode 100644
> >>>> index 321b4afa12..0000000000
> >>>> --- a/meta/recipes-devtools/python/python3/0001-Issue-28043-SSLConte=
xt-has-improved-default-settings.patch
> >>>> +++ /dev/null
> >>>> @@ -1,272 +0,0 @@
> >>>> -From 758e7463c104f71b810c8588166747eeab6148d7 Mon Sep 17 00:00:00 2=
001
> >>>> -From: Christian Heimes <christian@python.org>
> >>>> -Date: Sat, 10 Sep 2016 22:43:48 +0200
> >>>> -Subject: [PATCH 1/4] Issue 28043: SSLContext has improved default s=
ettings
> >>>> -
> >>>> -The options OP_NO_COMPRESSION, OP_CIPHER_SERVER_PREFERENCE, OP_SING=
LE_DH_USE, OP_SINGLE_ECDH_USE, OP_NO_SSLv2 (except for PROTOCOL_SSLv2), and=
 OP_NO_SSLv3 (except for PROTOCOL_SSLv3) are set by default. The initial ci=
pher suite list contains only HIGH ciphers, no NULL ciphers and MD5 ciphers=
 (except for PROTOCOL_SSLv2).
> >>>> -
> >>>> -Upstream-Status: Backport
> >>>> -[https://github.com/python/cpython/commit/358cfd426ccc0fcd6a7940d30=
6602138e76420ae]
> >>>> -
> >>>> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> >>>> ----
> >>>> - Doc/library/ssl.rst  |  9 ++++++-
> >>>> - Lib/ssl.py           | 30 +++++----------------
> >>>> - Lib/test/test_ssl.py | 62 +++++++++++++++++++++++-----------------=
----
> >>>> - Modules/_ssl.c       | 31 ++++++++++++++++++++++
> >>>> - 4 files changed, 78 insertions(+), 54 deletions(-)
> >>>> -
> >>>> -diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst
> >>>> -index a2f008346b..14f2d68217 100644
> >>>> ---- a/Doc/library/ssl.rst
> >>>> -+++ b/Doc/library/ssl.rst
> >>>> -@@ -1151,7 +1151,14 @@ to speed up repeated connections from the sa=
me clients.
> >>>> -
> >>>> -    .. versionchanged:: 3.5.3
> >>>> -
> >>>> --      :data:`PROTOCOL_TLS` is the default value.
> >>>> -+      The context is created with secure default values. The optio=
ns
> >>>> -+      :data:`OP_NO_COMPRESSION`, :data:`OP_CIPHER_SERVER_PREFERENC=
E`,
> >>>> -+      :data:`OP_SINGLE_DH_USE`, :data:`OP_SINGLE_ECDH_USE`,
> >>>> -+      :data:`OP_NO_SSLv2` (except for :data:`PROTOCOL_SSLv2`),
> >>>> -+      and :data:`OP_NO_SSLv3` (except for :data:`PROTOCOL_SSLv3`) =
are
> >>>> -+      set by default. The initial cipher suite list contains only =
``HIGH``
> >>>> -+      ciphers, no ``NULL`` ciphers and no ``MD5`` ciphers (except =
for
> >>>> -+      :data:`PROTOCOL_SSLv2`).
> >>>> -
> >>>> -
> >>>> - :class:`SSLContext` objects have the following methods and attribu=
tes:
> >>>> -diff --git a/Lib/ssl.py b/Lib/ssl.py
> >>>> -index e1913904f3..4d302a78fa 100644
> >>>> ---- a/Lib/ssl.py
> >>>> -+++ b/Lib/ssl.py
> >>>> -@@ -446,32 +446,16 @@ def create_default_context(purpose=3DPurpose.=
SERVER_AUTH, *, cafile=3DNone,
> >>>> -     if not isinstance(purpose, _ASN1Object):
> >>>> -         raise TypeError(purpose)
> >>>> -
> >>>> -+    # SSLContext sets OP_NO_SSLv2, OP_NO_SSLv3, OP_NO_COMPRESSION,
> >>>> -+    # OP_CIPHER_SERVER_PREFERENCE, OP_SINGLE_DH_USE and OP_SINGLE_=
ECDH_USE
> >>>> -+    # by default.
> >>>> -     context =3D SSLContext(PROTOCOL_TLS)
> >>>> -
> >>>> --    # SSLv2 considered harmful.
> >>>> --    context.options |=3D OP_NO_SSLv2
> >>>> --
> >>>> --    # SSLv3 has problematic security and is only required for real=
ly old
> >>>> --    # clients such as IE6 on Windows XP
> >>>> --    context.options |=3D OP_NO_SSLv3
> >>>> --
> >>>> --    # disable compression to prevent CRIME attacks (OpenSSL 1.0+)
> >>>> --    context.options |=3D getattr(_ssl, "OP_NO_COMPRESSION", 0)
> >>>> --
> >>>> -     if purpose =3D=3D Purpose.SERVER_AUTH:
> >>>> -         # verify certs and host name in client mode
> >>>> -         context.verify_mode =3D CERT_REQUIRED
> >>>> -         context.check_hostname =3D True
> >>>> -     elif purpose =3D=3D Purpose.CLIENT_AUTH:
> >>>> --        # Prefer the server's ciphers by default so that we get st=
ronger
> >>>> --        # encryption
> >>>> --        context.options |=3D getattr(_ssl, "OP_CIPHER_SERVER_PREFE=
RENCE", 0)
> >>>> --
> >>>> --        # Use single use keys in order to improve forward secrecy
> >>>> --        context.options |=3D getattr(_ssl, "OP_SINGLE_DH_USE", 0)
> >>>> --        context.options |=3D getattr(_ssl, "OP_SINGLE_ECDH_USE", 0=
)
> >>>> --
> >>>> --        # disallow ciphers with known vulnerabilities
> >>>> -         context.set_ciphers(_RESTRICTED_SERVER_CIPHERS)
> >>>> -
> >>>> -     if cafile or capath or cadata:
> >>>> -@@ -497,12 +481,10 @@ def _create_unverified_context(protocol=3DPRO=
TOCOL_TLS, *, cert_reqs=3DNone,
> >>>> -     if not isinstance(purpose, _ASN1Object):
> >>>> -         raise TypeError(purpose)
> >>>> -
> >>>> -+    # SSLContext sets OP_NO_SSLv2, OP_NO_SSLv3, OP_NO_COMPRESSION,
> >>>> -+    # OP_CIPHER_SERVER_PREFERENCE, OP_SINGLE_DH_USE and OP_SINGLE_=
ECDH_USE
> >>>> -+    # by default.
> >>>> -     context =3D SSLContext(protocol)
> >>>> --    # SSLv2 considered harmful.
> >>>> --    context.options |=3D OP_NO_SSLv2
> >>>> --    # SSLv3 has problematic security and is only required for real=
ly old
> >>>> --    # clients such as IE6 on Windows XP
> >>>> --    context.options |=3D OP_NO_SSLv3
> >>>> -
> >>>> -     if cert_reqs is not None:
> >>>> -         context.verify_mode =3D cert_reqs
> >>>> -diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
> >>>> -index ffb7314f57..f91af7bd05 100644
> >>>> ---- a/Lib/test/test_ssl.py
> >>>> -+++ b/Lib/test/test_ssl.py
> >>>> -@@ -73,6 +73,12 @@ NULLBYTECERT =3D data_file("nullbytecert.pem")
> >>>> - DHFILE =3D data_file("dh1024.pem")
> >>>> - BYTES_DHFILE =3D os.fsencode(DHFILE)
> >>>> -
> >>>> -+# Not defined in all versions of OpenSSL
> >>>> -+OP_NO_COMPRESSION =3D getattr(ssl, "OP_NO_COMPRESSION", 0)
> >>>> -+OP_SINGLE_DH_USE =3D getattr(ssl, "OP_SINGLE_DH_USE", 0)
> >>>> -+OP_SINGLE_ECDH_USE =3D getattr(ssl, "OP_SINGLE_ECDH_USE", 0)
> >>>> -+OP_CIPHER_SERVER_PREFERENCE =3D getattr(ssl, "OP_CIPHER_SERVER_PRE=
FERENCE", 0)
> >>>> -+
> >>>> -
> >>>> - def handle_error(prefix):
> >>>> -     exc_format =3D ' '.join(traceback.format_exception(*sys.exc_in=
fo()))
> >>>> -@@ -839,8 +845,9 @@ class ContextTests(unittest.TestCase):
> >>>> -         ctx =3D ssl.SSLContext(ssl.PROTOCOL_TLSv1)
> >>>> -         # OP_ALL | OP_NO_SSLv2 | OP_NO_SSLv3 is the default value
> >>>> -         default =3D (ssl.OP_ALL | ssl.OP_NO_SSLv2 | ssl.OP_NO_SSLv=
3)
> >>>> --        if not IS_LIBRESSL and ssl.OPENSSL_VERSION_INFO >=3D (1, 1=
, 0):
> >>>> --            default |=3D ssl.OP_NO_COMPRESSION
> >>>> -+        # SSLContext also enables these by default
> >>>> -+        default |=3D (OP_NO_COMPRESSION | OP_CIPHER_SERVER_PREFERE=
NCE |
> >>>> -+                    OP_SINGLE_DH_USE | OP_SINGLE_ECDH_USE)
> >>>> -         self.assertEqual(default, ctx.options)
> >>>> -         ctx.options |=3D ssl.OP_NO_TLSv1
> >>>> -         self.assertEqual(default | ssl.OP_NO_TLSv1, ctx.options)
> >>>> -@@ -1205,16 +1212,29 @@ class ContextTests(unittest.TestCase):
> >>>> -             stats["x509"] +=3D 1
> >>>> -             self.assertEqual(ctx.cert_store_stats(), stats)
> >>>> -
> >>>> -+    def _assert_context_options(self, ctx):
> >>>> -+        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_=
SSLv2)
> >>>> -+        if OP_NO_COMPRESSION !=3D 0:
> >>>> -+            self.assertEqual(ctx.options & OP_NO_COMPRESSION,
> >>>> -+                             OP_NO_COMPRESSION)
> >>>> -+        if OP_SINGLE_DH_USE !=3D 0:
> >>>> -+            self.assertEqual(ctx.options & OP_SINGLE_DH_USE,
> >>>> -+                             OP_SINGLE_DH_USE)
> >>>> -+        if OP_SINGLE_ECDH_USE !=3D 0:
> >>>> -+            self.assertEqual(ctx.options & OP_SINGLE_ECDH_USE,
> >>>> -+                             OP_SINGLE_ECDH_USE)
> >>>> -+        if OP_CIPHER_SERVER_PREFERENCE !=3D 0:
> >>>> -+            self.assertEqual(ctx.options & OP_CIPHER_SERVER_PREFER=
ENCE,
> >>>> -+                             OP_CIPHER_SERVER_PREFERENCE)
> >>>> -+
> >>>> -     def test_create_default_context(self):
> >>>> -         ctx =3D ssl.create_default_context()
> >>>> -+
> >>>> -         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
> >>>> -         self.assertEqual(ctx.verify_mode, ssl.CERT_REQUIRED)
> >>>> -         self.assertTrue(ctx.check_hostname)
> >>>> --        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_=
SSLv2)
> >>>> --        self.assertEqual(
> >>>> --            ctx.options & getattr(ssl, "OP_NO_COMPRESSION", 0),
> >>>> --            getattr(ssl, "OP_NO_COMPRESSION", 0),
> >>>> --        )
> >>>> -+        self._assert_context_options(ctx)
> >>>> -+
> >>>> -
> >>>> -         with open(SIGNING_CA) as f:
> >>>> -             cadata =3D f.read()
> >>>> -@@ -1222,40 +1242,24 @@ class ContextTests(unittest.TestCase):
> >>>> -                                          cadata=3Dcadata)
> >>>> -         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
> >>>> -         self.assertEqual(ctx.verify_mode, ssl.CERT_REQUIRED)
> >>>> --        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_=
SSLv2)
> >>>> --        self.assertEqual(
> >>>> --            ctx.options & getattr(ssl, "OP_NO_COMPRESSION", 0),
> >>>> --            getattr(ssl, "OP_NO_COMPRESSION", 0),
> >>>> --        )
> >>>> -+        self._assert_context_options(ctx)
> >>>> -
> >>>> -         ctx =3D ssl.create_default_context(ssl.Purpose.CLIENT_AUTH=
)
> >>>> -         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
> >>>> -         self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
> >>>> --        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_=
SSLv2)
> >>>> --        self.assertEqual(
> >>>> --            ctx.options & getattr(ssl, "OP_NO_COMPRESSION", 0),
> >>>> --            getattr(ssl, "OP_NO_COMPRESSION", 0),
> >>>> --        )
> >>>> --        self.assertEqual(
> >>>> --            ctx.options & getattr(ssl, "OP_SINGLE_DH_USE", 0),
> >>>> --            getattr(ssl, "OP_SINGLE_DH_USE", 0),
> >>>> --        )
> >>>> --        self.assertEqual(
> >>>> --            ctx.options & getattr(ssl, "OP_SINGLE_ECDH_USE", 0),
> >>>> --            getattr(ssl, "OP_SINGLE_ECDH_USE", 0),
> >>>> --        )
> >>>> -+        self._assert_context_options(ctx)
> >>>> -
> >>>> -     def test__create_stdlib_context(self):
> >>>> -         ctx =3D ssl._create_stdlib_context()
> >>>> -         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
> >>>> -         self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
> >>>> -         self.assertFalse(ctx.check_hostname)
> >>>> --        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_=
SSLv2)
> >>>> -+        self._assert_context_options(ctx)
> >>>> -
> >>>> -         ctx =3D ssl._create_stdlib_context(ssl.PROTOCOL_TLSv1)
> >>>> -         self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLSv1)
> >>>> -         self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
> >>>> --        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_=
SSLv2)
> >>>> -+        self._assert_context_options(ctx)
> >>>> -
> >>>> -         ctx =3D ssl._create_stdlib_context(ssl.PROTOCOL_TLSv1,
> >>>> -                                          cert_reqs=3Dssl.CERT_REQU=
IRED,
> >>>> -@@ -1263,12 +1267,12 @@ class ContextTests(unittest.TestCase):
> >>>> -         self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLSv1)
> >>>> -         self.assertEqual(ctx.verify_mode, ssl.CERT_REQUIRED)
> >>>> -         self.assertTrue(ctx.check_hostname)
> >>>> --        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_=
SSLv2)
> >>>> -+        self._assert_context_options(ctx)
> >>>> -
> >>>> -         ctx =3D ssl._create_stdlib_context(purpose=3Dssl.Purpose.C=
LIENT_AUTH)
> >>>> -         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
> >>>> -         self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
> >>>> --        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_=
SSLv2)
> >>>> -+        self._assert_context_options(ctx)
> >>>> -
> >>>> -     def test_check_hostname(self):
> >>>> -         ctx =3D ssl.SSLContext(ssl.PROTOCOL_TLSv1)
> >>>> -diff --git a/Modules/_ssl.c b/Modules/_ssl.c
> >>>> -index 86482677ae..0d5c121d2c 100644
> >>>> ---- a/Modules/_ssl.c
> >>>> -+++ b/Modules/_ssl.c
> >>>> -@@ -2330,6 +2330,7 @@ _ssl__SSLContext_impl(PyTypeObject *type, int=
 proto_version)
> >>>> -     PySSLContext *self;
> >>>> -     long options;
> >>>> -     SSL_CTX *ctx =3D NULL;
> >>>> -+    int result;
> >>>> - #if defined(SSL_MODE_RELEASE_BUFFERS)
> >>>> -     unsigned long libver;
> >>>> - #endif
> >>>> -@@ -2393,8 +2394,38 @@ _ssl__SSLContext_impl(PyTypeObject *type, in=
t proto_version)
> >>>> -         options |=3D SSL_OP_NO_SSLv2;
> >>>> -     if (proto_version !=3D PY_SSL_VERSION_SSL3)
> >>>> -         options |=3D SSL_OP_NO_SSLv3;
> >>>> -+    /* Minimal security flags for server and client side context.
> >>>> -+     * Client sockets ignore server-side parameters. */
> >>>> -+#ifdef SSL_OP_NO_COMPRESSION
> >>>> -+    options |=3D SSL_OP_NO_COMPRESSION;
> >>>> -+#endif
> >>>> -+#ifdef SSL_OP_CIPHER_SERVER_PREFERENCE
> >>>> -+    options |=3D SSL_OP_CIPHER_SERVER_PREFERENCE;
> >>>> -+#endif
> >>>> -+#ifdef SSL_OP_SINGLE_DH_USE
> >>>> -+    options |=3D SSL_OP_SINGLE_DH_USE;
> >>>> -+#endif
> >>>> -+#ifdef SSL_OP_SINGLE_ECDH_USE
> >>>> -+    options |=3D SSL_OP_SINGLE_ECDH_USE;
> >>>> -+#endif
> >>>> -     SSL_CTX_set_options(self->ctx, options);
> >>>> -
> >>>> -+    /* A bare minimum cipher list without completly broken cipher =
suites.
> >>>> -+     * It's far from perfect but gives users a better head start. =
*/
> >>>> -+    if (proto_version !=3D PY_SSL_VERSION_SSL2) {
> >>>> -+        result =3D SSL_CTX_set_cipher_list(ctx, "HIGH:!aNULL:!eNUL=
L:!MD5");
> >>>> -+    } else {
> >>>> -+        /* SSLv2 needs MD5 */
> >>>> -+        result =3D SSL_CTX_set_cipher_list(ctx, "HIGH:!aNULL:!eNUL=
L");
> >>>> -+    }
> >>>> -+    if (result =3D=3D 0) {
> >>>> -+        Py_DECREF(self);
> >>>> -+        ERR_clear_error();
> >>>> -+        PyErr_SetString(PySSLErrorObject,
> >>>> -+                        "No cipher can be selected.");
> >>>> -+        return NULL;
> >>>> -+    }
> >>>> -+
> >>>> - #if defined(SSL_MODE_RELEASE_BUFFERS)
> >>>> -     /* Set SSL_MODE_RELEASE_BUFFERS. This potentially greatly redu=
ces memory
> >>>> -        usage for no cost at all. However, don't do this for OpenSS=
L versions
> >>>> ---
> >>>> -2.17.1
> >>>> -
> >>>> diff --git a/meta/recipes-devtools/python/python3/0002-Makefile-add-=
target-to-split-profile-generation.patch b/meta/recipes-devtools/python/pyt=
hon3/0002-Makefile-add-target-to-split-profile-generation.patch
> >>>> deleted file mode 100644
> >>>> index 2b4ba316e4..0000000000
> >>>> --- a/meta/recipes-devtools/python/python3/0002-Makefile-add-target-=
to-split-profile-generation.patch
> >>>> +++ /dev/null
> >>>> @@ -1,40 +0,0 @@
> >>>> -From 98586d6dc598e40b8b821b0dde57599e188a7ca4 Mon Sep 17 00:00:00 2=
001
> >>>> -From: Anuj Mittal <anuj.mittal@intel.com>
> >>>> -Date: Tue, 7 Aug 2018 16:43:17 +0800
> >>>> -Subject: [PATCH 2/2] Makefile: add target to split profile generati=
on
> >>>> -
> >>>> -We don't want to have profile task invoked from here and want to us=
e
> >>>> -qemu-user instead. Split the profile-opt task so qemu can be invoke=
d
> >>>> -once binaries have been built with instrumentation and then we can =
go
> >>>> -ahead and build again using the profile data generated.
> >>>> -
> >>>> -Upstream-Status: Inappropriate [OE-specific]
> >>>> -
> >>>> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> >>>> ----
> >>>> - Makefile.pre.in | 6 ++----
> >>>> - 1 file changed, 2 insertions(+), 4 deletions(-)
> >>>> -
> >>>> -diff --git a/Makefile.pre.in b/Makefile.pre.in
> >>>> -index 84bc3ff..017a2c4 100644
> >>>> ---- a/Makefile.pre.in
> >>>> -+++ b/Makefile.pre.in
> >>>> -@@ -469,13 +469,12 @@ profile-opt:
> >>>> -     $(MAKE) profile-removal
> >>>> -     $(MAKE) build_all_generate_profile
> >>>> -     $(MAKE) profile-removal
> >>>> --    @echo "Running code to generate profile data (this can take a =
while):"
> >>>> --    $(MAKE) run_profile_task
> >>>> --    $(MAKE) build_all_merge_profile
> >>>> -+
> >>>> -+clean_and_use_profile:
> >>>> -     @echo "Rebuilding with profile guided optimizations:"
> >>>> -     $(MAKE) clean
> >>>> -     $(MAKE) build_all_use_profile
> >>>> -     $(MAKE) profile-removal
> >>>> -
> >>>> - build_all_generate_profile:
> >>>> -     $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) $(EXTRA_CFL=
AGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS=3D"$(LDFLAGS) $(PGO_PROF_GEN_=
FLAG) @LTOFLAGS@" LIBS=3D"$(LIBS)"
> >>>> ---
> >>>> -2.17.1
> >>>> -
> >>>> diff --git a/meta/recipes-devtools/python/python3/0002-bpo-29136-Add=
-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch b/meta/recipes-devtools/pytho=
n/python3/0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch
> >>>> deleted file mode 100644
> >>>> index d48cad7586..0000000000
> >>>> --- a/meta/recipes-devtools/python/python3/0002-bpo-29136-Add-TLS-1.=
3-cipher-suites-and-OP_NO_TLSv1_.patch
> >>>> +++ /dev/null
> >>>> @@ -1,227 +0,0 @@
> >>>> -From e950ea68dab006944af194c9910b8f2341d1437d Mon Sep 17 00:00:00 2=
001
> >>>> -From: Christian Heimes <christian@python.org>
> >>>> -Date: Thu, 7 Sep 2017 20:23:52 -0700
> >>>> -Subject: [PATCH] bpo-29136: Add TLS 1.3 cipher suites and OP_NO_TLS=
v1_3
> >>>> - (GH-1363) (#3444)
> >>>> -
> >>>> -* bpo-29136: Add TLS 1.3 support
> >>>> -
> >>>> -TLS 1.3 introduces a new, distinct set of cipher suites. The TLS 1.=
3
> >>>> -cipher suites don't overlap with cipher suites from TLS 1.2 and ear=
lier.
> >>>> -Since Python sets its own set of permitted ciphers, TLS 1.3 handsha=
ke
> >>>> -will fail as soon as OpenSSL 1.1.1 is released. Let's enable the co=
mmon
> >>>> -AES-GCM and ChaCha20 suites.
> >>>> -
> >>>> -Additionally the flag OP_NO_TLSv1_3 is added. It defaults to 0 (no =
op) with
> >>>> -OpenSSL prior to 1.1.1. This allows applications to opt-out from TL=
S 1.3
> >>>> -now.
> >>>> -
> >>>> -Signed-off-by: Christian Heimes <christian@python.org>.
> >>>> -(cherry picked from commit cb5b68abdeb1b1d56c581d5b4d647018703d61e3=
)
> >>>> -
> >>>> -Upstream-Status: Backport
> >>>> -[https://github.com/python/cpython/commit/cb5b68abdeb1b1d56c581d5b4=
d647018703d61e3]
> >>>> -
> >>>> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> >>>> ----
> >>>> - Doc/library/ssl.rst                           | 21 ++++++++++++++
> >>>> - Lib/ssl.py                                    |  7 +++++
> >>>> - Lib/test/test_ssl.py                          | 29 +++++++++++++++=
+++-
> >>>> - .../2017-09-04-16-39-49.bpo-29136.vSn1oR.rst  |  1 +
> >>>> - Modules/_ssl.c                                | 13 +++++++++
> >>>> - 5 files changed, 70 insertions(+), 1 deletion(-)
> >>>> - create mode 100644 Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bp=
o-29136.vSn1oR.rst
> >>>> -
> >>>> -diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst
> >>>> -index 14f2d68217..29c5e94cf6 100644
> >>>> ---- a/Doc/library/ssl.rst
> >>>> -+++ b/Doc/library/ssl.rst
> >>>> -@@ -285,6 +285,11 @@ purposes.
> >>>> -
> >>>> -      3DES was dropped from the default cipher string.
> >>>> -
> >>>> -+   .. versionchanged:: 3.7
> >>>> -+
> >>>> -+     TLS 1.3 cipher suites TLS_AES_128_GCM_SHA256, TLS_AES_256_GCM=
_SHA384,
> >>>> -+     and TLS_CHACHA20_POLY1305_SHA256 were added to the default ci=
pher string.
> >>>> -+
> >>>> -
> >>>> - Random generation
> >>>> - ^^^^^^^^^^^^^^^^^
> >>>> -@@ -719,6 +724,16 @@ Constants
> >>>> -
> >>>> -    .. versionadded:: 3.4
> >>>> -
> >>>> -+.. data:: OP_NO_TLSv1_3
> >>>> -+
> >>>> -+   Prevents a TLSv1.3 connection. This option is only applicable i=
n conjunction
> >>>> -+   with :const:`PROTOCOL_TLS`. It prevents the peers from choosing=
 TLSv1.3 as
> >>>> -+   the protocol version. TLS 1.3 is available with OpenSSL 1.1.1 o=
r later.
> >>>> -+   When Python has been compiled against an older version of OpenS=
SL, the
> >>>> -+   flag defaults to *0*.
> >>>> -+
> >>>> -+   .. versionadded:: 3.7
> >>>> -+
> >>>> - .. data:: OP_CIPHER_SERVER_PREFERENCE
> >>>> -
> >>>> -    Use the server's cipher ordering preference, rather than the cl=
ient's.
> >>>> -@@ -783,6 +798,12 @@ Constants
> >>>> -
> >>>> -    .. versionadded:: 3.3
> >>>> -
> >>>> -+.. data:: HAS_TLSv1_3
> >>>> -+
> >>>> -+   Whether the OpenSSL library has built-in support for the TLS 1.=
3 protocol.
> >>>> -+
> >>>> -+   .. versionadded:: 3.7
> >>>> -+
> >>>> - .. data:: CHANNEL_BINDING_TYPES
> >>>> -
> >>>> -    List of supported TLS channel binding types.  Strings in this l=
ist
> >>>> -diff --git a/Lib/ssl.py b/Lib/ssl.py
> >>>> -index 4d302a78fa..f233e72e1f 100644
> >>>> ---- a/Lib/ssl.py
> >>>> -+++ b/Lib/ssl.py
> >>>> -@@ -122,6 +122,7 @@ _import_symbols('OP_')
> >>>> - _import_symbols('ALERT_DESCRIPTION_')
> >>>> - _import_symbols('SSL_ERROR_')
> >>>> - _import_symbols('VERIFY_')
> >>>> -+from _ssl import HAS_SNI, HAS_ECDH, HAS_NPN, HAS_ALPN, HAS_TLSv1_3
> >>>> -
> >>>> - from _ssl import HAS_SNI, HAS_ECDH, HAS_NPN, HAS_ALPN
> >>>> -
> >>>> -@@ -162,6 +163,7 @@ else:
> >>>> - # (OpenSSL's default setting is 'DEFAULT:!aNULL:!eNULL')
> >>>> - # Enable a better set of ciphers by default
> >>>> - # This list has been explicitly chosen to:
> >>>> -+#   * TLS 1.3 ChaCha20 and AES-GCM cipher suites
> >>>> - #   * Prefer cipher suites that offer perfect forward secrecy (DHE=
/ECDHE)
> >>>> - #   * Prefer ECDHE over DHE for better performance
> >>>> - #   * Prefer AEAD over CBC for better performance and security
> >>>> -@@ -173,6 +175,8 @@ else:
> >>>> - #   * Disable NULL authentication, NULL encryption, 3DES and MD5 M=
ACs
> >>>> - #     for security reasons
> >>>> - _DEFAULT_CIPHERS =3D (
> >>>> -+    'TLS13-AES-256-GCM-SHA384:TLS13-CHACHA20-POLY1305-SHA256:'
> >>>> -+    'TLS13-AES-128-GCM-SHA256:'
> >>>> -     'ECDH+AESGCM:ECDH+CHACHA20:DH+AESGCM:DH+CHACHA20:ECDH+AES256:D=
H+AES256:'
> >>>> -     'ECDH+AES128:DH+AES:ECDH+HIGH:DH+HIGH:RSA+AESGCM:RSA+AES:RSA+H=
IGH:'
> >>>> -     '!aNULL:!eNULL:!MD5:!3DES'
> >>>> -@@ -180,6 +184,7 @@ _DEFAULT_CIPHERS =3D (
> >>>> -
> >>>> - # Restricted and more secure ciphers for the server side
> >>>> - # This list has been explicitly chosen to:
> >>>> -+#   * TLS 1.3 ChaCha20 and AES-GCM cipher suites
> >>>> - #   * Prefer cipher suites that offer perfect forward secrecy (DHE=
/ECDHE)
> >>>> - #   * Prefer ECDHE over DHE for better performance
> >>>> - #   * Prefer AEAD over CBC for better performance and security
> >>>> -@@ -190,6 +195,8 @@ _DEFAULT_CIPHERS =3D (
> >>>> - #   * Disable NULL authentication, NULL encryption, MD5 MACs, DSS,=
 RC4, and
> >>>> - #     3DES for security reasons
> >>>> - _RESTRICTED_SERVER_CIPHERS =3D (
> >>>> -+    'TLS13-AES-256-GCM-SHA384:TLS13-CHACHA20-POLY1305-SHA256:'
> >>>> -+    'TLS13-AES-128-GCM-SHA256:'
> >>>> -     'ECDH+AESGCM:ECDH+CHACHA20:DH+AESGCM:DH+CHACHA20:ECDH+AES256:D=
H+AES256:'
> >>>> -     'ECDH+AES128:DH+AES:ECDH+HIGH:DH+HIGH:RSA+AESGCM:RSA+AES:RSA+H=
IGH:'
> >>>> -     '!aNULL:!eNULL:!MD5:!DSS:!RC4:!3DES'
> >>>> -diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
> >>>> -index f91af7bd05..1acc12ec2d 100644
> >>>> ---- a/Lib/test/test_ssl.py
> >>>> -+++ b/Lib/test/test_ssl.py
> >>>> -@@ -150,6 +150,13 @@ class BasicSocketTests(unittest.TestCase):
> >>>> -             ssl.OP_NO_COMPRESSION
> >>>> -         self.assertIn(ssl.HAS_SNI, {True, False})
> >>>> -         self.assertIn(ssl.HAS_ECDH, {True, False})
> >>>> -+        ssl.OP_NO_SSLv2
> >>>> -+        ssl.OP_NO_SSLv3
> >>>> -+        ssl.OP_NO_TLSv1
> >>>> -+        ssl.OP_NO_TLSv1_3
> >>>> -+    if ssl.OPENSSL_VERSION_INFO >=3D (1, 0, 1):
> >>>> -+            ssl.OP_NO_TLSv1_1
> >>>> -+            ssl.OP_NO_TLSv1_2
> >>>> -
> >>>> -     def test_str_for_enums(self):
> >>>> -         # Make sure that the PROTOCOL_* constants have enum-like s=
tring
> >>>> -@@ -3028,12 +3035,33 @@ else:
> >>>> -                     self.assertEqual(s.version(), 'TLSv1')
> >>>> -                 self.assertIs(s.version(), None)
> >>>> -
> >>>> -+        @unittest.skipUnless(ssl.HAS_TLSv1_3,
> >>>> -+                             "test requires TLSv1.3 enabled OpenSS=
L")
> >>>> -+        def test_tls1_3(self):
> >>>> -+            context =3D ssl.SSLContext(ssl.PROTOCOL_TLS)
> >>>> -+            context.load_cert_chain(CERTFILE)
> >>>> -+            # disable all but TLS 1.3
> >>>> -+            context.options |=3D (
> >>>> -+                ssl.OP_NO_TLSv1 | ssl.OP_NO_TLSv1_1 | ssl.OP_NO_TL=
Sv1_2
> >>>> -+            )
> >>>> -+            with ThreadedEchoServer(context=3Dcontext) as server:
> >>>> -+                with context.wrap_socket(socket.socket()) as s:
> >>>> -+                    s.connect((HOST, server.port))
> >>>> -+                    self.assertIn(s.cipher()[0], [
> >>>> -+                        'TLS13-AES-256-GCM-SHA384',
> >>>> -+                        'TLS13-CHACHA20-POLY1305-SHA256',
> >>>> -+                        'TLS13-AES-128-GCM-SHA256',
> >>>> -+                    ])
> >>>> -+
> >>>> -         @unittest.skipUnless(ssl.HAS_ECDH, "test requires ECDH-ena=
bled OpenSSL")
> >>>> -         def test_default_ecdh_curve(self):
> >>>> -             # Issue #21015: elliptic curve-based Diffie Hellman ke=
y exchange
> >>>> -             # should be enabled by default on SSL contexts.
> >>>> -             context =3D ssl.SSLContext(ssl.PROTOCOL_SSLv23)
> >>>> -             context.load_cert_chain(CERTFILE)
> >>>> -+            # TLSv1.3 defaults to PFS key agreement and no longer =
has KEA in
> >>>> -+            # cipher name.
> >>>> -+            context.options |=3D ssl.OP_NO_TLSv1_3
> >>>> -             # Prior to OpenSSL 1.0.0, ECDH ciphers have to be enab=
led
> >>>> -             # explicitly using the 'ECCdraft' cipher alias.  Other=
wise,
> >>>> -             # our default cipher list should prefer ECDH-based cip=
hers
> >>>> -@@ -3394,7 +3422,6 @@ else:
> >>>> -                         s.sendfile(file)
> >>>> -                         self.assertEqual(s.recv(1024), TEST_DATA)
> >>>> -
> >>>> --
> >>>> - def test_main(verbose=3DFalse):
> >>>> -     if support.verbose:
> >>>> -         import warnings
> >>>> -diff --git a/Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bpo-29136=
.vSn1oR.rst b/Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bpo-29136.vSn1oR=
.rst
> >>>> -new file mode 100644
> >>>> -index 0000000000..e76997ef83
> >>>> ---- /dev/null
> >>>> -+++ b/Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bpo-29136.vSn1oR=
.rst
> >>>> -@@ -0,0 +1 @@
> >>>> -+Add TLS 1.3 cipher suites and OP_NO_TLSv1_3.
> >>>> -diff --git a/Modules/_ssl.c b/Modules/_ssl.c
> >>>> -index 0d5c121d2c..c71d89607c 100644
> >>>> ---- a/Modules/_ssl.c
> >>>> -+++ b/Modules/_ssl.c
> >>>> -@@ -4842,6 +4842,11 @@ PyInit__ssl(void)
> >>>> - #if HAVE_TLSv1_2
> >>>> -     PyModule_AddIntConstant(m, "OP_NO_TLSv1_1", SSL_OP_NO_TLSv1_1)=
;
> >>>> -     PyModule_AddIntConstant(m, "OP_NO_TLSv1_2", SSL_OP_NO_TLSv1_2)=
;
> >>>> -+#endif
> >>>> -+#ifdef SSL_OP_NO_TLSv1_3
> >>>> -+    PyModule_AddIntConstant(m, "OP_NO_TLSv1_3", SSL_OP_NO_TLSv1_3)=
;
> >>>> -+#else
> >>>> -+    PyModule_AddIntConstant(m, "OP_NO_TLSv1_3", 0);
> >>>> - #endif
> >>>> -     PyModule_AddIntConstant(m, "OP_CIPHER_SERVER_PREFERENCE",
> >>>> -                             SSL_OP_CIPHER_SERVER_PREFERENCE);
> >>>> -@@ -4890,6 +4895,14 @@ PyInit__ssl(void)
> >>>> -     Py_INCREF(r);
> >>>> -     PyModule_AddObject(m, "HAS_ALPN", r);
> >>>> -
> >>>> -+#if defined(TLS1_3_VERSION) && !defined(OPENSSL_NO_TLS1_3)
> >>>> -+    r =3D Py_True;
> >>>> -+#else
> >>>> -+    r =3D Py_False;
> >>>> -+#endif
> >>>> -+    Py_INCREF(r);
> >>>> -+    PyModule_AddObject(m, "HAS_TLSv1_3", r);
> >>>> -+
> >>>> -     /* Mappings for error codes */
> >>>> -     err_codes_to_names =3D PyDict_New();
> >>>> -     err_names_to_codes =3D PyDict_New();
> >>>> ---
> >>>> -2.17.1
> >>>> -
> >>>> diff --git a/meta/recipes-devtools/python/python3/0003-bpo-32947-Fix=
es-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch b/meta/recipes-devtools/pytho=
n/python3/0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch
> >>>> deleted file mode 100644
> >>>> index 56d591d1b5..0000000000
> >>>> --- a/meta/recipes-devtools/python/python3/0003-bpo-32947-Fixes-for-=
TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch
> >>>> +++ /dev/null
> >>>> @@ -1,173 +0,0 @@
> >>>> -From 170a614904febd14ff6cfd7a75c9bccc114b3948 Mon Sep 17 00:00:00 2=
001
> >>>> -From: Christian Heimes <christian@python.org>
> >>>> -Date: Tue, 14 Aug 2018 16:56:32 +0200
> >>>> -Subject: [PATCH] bpo-32947: Fixes for TLS 1.3 and OpenSSL 1.1.1 (GH=
-8761)
> >>>> -
> >>>> -Backport of TLS 1.3 related fixes from 3.7.
> >>>> -
> >>>> -Misc fixes and workarounds for compatibility with OpenSSL 1.1.1 fro=
m git
> >>>> -master and TLS 1.3 support. With OpenSSL 1.1.1, Python negotiates T=
LS 1.3 by
> >>>> -default. Some test cases only apply to TLS 1.2.
> >>>> -
> >>>> -OpenSSL 1.1.1 has added a new option OP_ENABLE_MIDDLEBOX_COMPAT for=
 TLS
> >>>> -1.3. The feature is enabled by default for maximum compatibility wi=
th
> >>>> -broken middle boxes. Users should be able to disable the hack and C=
Python's test suite needs
> >>>> -it to verify default options
> >>>> -
> >>>> -Signed-off-by: Christian Heimes <christian@python.org>
> >>>> -
> >>>> -Upstream-Status: Backport
> >>>> -[https://github.com/python/cpython/commit/2a4ee8aa01d61b6a9c8e9c65c=
211e61bdb471826]
> >>>> -
> >>>> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> >>>> ----
> >>>> - Doc/library/ssl.rst                           |  9 ++++++
> >>>> - Lib/test/test_asyncio/test_events.py          |  6 +++-
> >>>> - Lib/test/test_ssl.py                          | 29 +++++++++++++++=
----
> >>>> - .../2018-08-14-08-57-01.bpo-32947.mqStVW.rst  |  2 ++
> >>>> - Modules/_ssl.c                                |  4 +++
> >>>> - 5 files changed, 44 insertions(+), 6 deletions(-)
> >>>> - create mode 100644 Misc/NEWS.d/next/Library/2018-08-14-08-57-01.bp=
o-32947.mqStVW.rst
> >>>> -
> >>>> -diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst
> >>>> -index 29c5e94cf6..f63a3deec5 100644
> >>>> ---- a/Doc/library/ssl.rst
> >>>> -+++ b/Doc/library/ssl.rst
> >>>> -@@ -757,6 +757,15 @@ Constants
> >>>> -
> >>>> -    .. versionadded:: 3.3
> >>>> -
> >>>> -+.. data:: OP_ENABLE_MIDDLEBOX_COMPAT
> >>>> -+
> >>>> -+   Send dummy Change Cipher Spec (CCS) messages in TLS 1.3 handsha=
ke to make
> >>>> -+   a TLS 1.3 connection look more like a TLS 1.2 connection.
> >>>> -+
> >>>> -+   This option is only available with OpenSSL 1.1.1 and later.
> >>>> -+
> >>>> -+   .. versionadded:: 3.6.7
> >>>> -+
> >>>> - .. data:: OP_NO_COMPRESSION
> >>>> -
> >>>> -    Disable compression on the SSL channel.  This is useful if the =
application
> >>>> -diff --git a/Lib/test/test_asyncio/test_events.py b/Lib/test/test_a=
syncio/test_events.py
> >>>> -index 492a84a231..6f208474b9 100644
> >>>> ---- a/Lib/test/test_asyncio/test_events.py
> >>>> -+++ b/Lib/test/test_asyncio/test_events.py
> >>>> -@@ -1169,7 +1169,11 @@ class EventLoopTestsMixin:
> >>>> -                     self.loop.run_until_complete(f_c)
> >>>> -
> >>>> -         # close connection
> >>>> --        proto.transport.close()
> >>>> -+        # transport may be None with TLS 1.3, because connection i=
s
> >>>> -+        # interrupted, server is unable to send session tickets, a=
nd
> >>>> -+        # transport is closed.
> >>>> -+        if proto.transport is not None:
> >>>> -+            proto.transport.close()
> >>>> -         server.close()
> >>>> -
> >>>> -     def test_legacy_create_server_ssl_match_failed(self):
> >>>> -diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
> >>>> -index 1acc12ec2d..a2e1d32a62 100644
> >>>> ---- a/Lib/test/test_ssl.py
> >>>> -+++ b/Lib/test/test_ssl.py
> >>>> -@@ -78,6 +78,7 @@ OP_NO_COMPRESSION =3D getattr(ssl, "OP_NO_COMPRES=
SION", 0)
> >>>> - OP_SINGLE_DH_USE =3D getattr(ssl, "OP_SINGLE_DH_USE", 0)
> >>>> - OP_SINGLE_ECDH_USE =3D getattr(ssl, "OP_SINGLE_ECDH_USE", 0)
> >>>> - OP_CIPHER_SERVER_PREFERENCE =3D getattr(ssl, "OP_CIPHER_SERVER_PRE=
FERENCE", 0)
> >>>> -+OP_ENABLE_MIDDLEBOX_COMPAT =3D getattr(ssl, "OP_ENABLE_MIDDLEBOX_C=
OMPAT", 0)
> >>>> -
> >>>> -
> >>>> - def handle_error(prefix):
> >>>> -@@ -155,8 +156,8 @@ class BasicSocketTests(unittest.TestCase):
> >>>> -         ssl.OP_NO_TLSv1
> >>>> -         ssl.OP_NO_TLSv1_3
> >>>> -     if ssl.OPENSSL_VERSION_INFO >=3D (1, 0, 1):
> >>>> --            ssl.OP_NO_TLSv1_1
> >>>> --            ssl.OP_NO_TLSv1_2
> >>>> -+        ssl.OP_NO_TLSv1_1
> >>>> -+        ssl.OP_NO_TLSv1_2
> >>>> -
> >>>> -     def test_str_for_enums(self):
> >>>> -         # Make sure that the PROTOCOL_* constants have enum-like s=
tring
> >>>> -@@ -854,7 +855,8 @@ class ContextTests(unittest.TestCase):
> >>>> -         default =3D (ssl.OP_ALL | ssl.OP_NO_SSLv2 | ssl.OP_NO_SSLv=
3)
> >>>> -         # SSLContext also enables these by default
> >>>> -         default |=3D (OP_NO_COMPRESSION | OP_CIPHER_SERVER_PREFERE=
NCE |
> >>>> --                    OP_SINGLE_DH_USE | OP_SINGLE_ECDH_USE)
> >>>> -+                    OP_SINGLE_DH_USE | OP_SINGLE_ECDH_USE |
> >>>> -+                    OP_ENABLE_MIDDLEBOX_COMPAT)
> >>>> -         self.assertEqual(default, ctx.options)
> >>>> -         ctx.options |=3D ssl.OP_NO_TLSv1
> >>>> -         self.assertEqual(default | ssl.OP_NO_TLSv1, ctx.options)
> >>>> -@@ -1860,11 +1862,26 @@ else:
> >>>> -                         self.sock, server_side=3DTrue)
> >>>> -                     self.server.selected_npn_protocols.append(self=
.sslconn.selected_npn_protocol())
> >>>> -                     self.server.selected_alpn_protocols.append(sel=
f.sslconn.selected_alpn_protocol())
> >>>> --                except (ssl.SSLError, ConnectionResetError) as e:
> >>>> -+                except (ConnectionResetError, BrokenPipeError) as =
e:
> >>>> -                     # We treat ConnectionResetError as though it w=
ere an
> >>>> -                     # SSLError - OpenSSL on Ubuntu abruptly closes=
 the
> >>>> -                     # connection when asked to use an unsupported =
protocol.
> >>>> -                     #
> >>>> -+                    # BrokenPipeError is raised in TLS 1.3 mode, w=
hen OpenSSL
> >>>> -+                    # tries to send session tickets after handshak=
e.
> >>>> -+


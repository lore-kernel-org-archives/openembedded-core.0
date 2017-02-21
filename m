Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id DAEB972F09
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 13:45:39 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id s186so121996921qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 05:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sx052c50oEZFLB/PlMel4i2qw/2CIFOqiVCCliyuOqc=;
	b=kBrIRtjG1Etg6NfVVNMbaIad/+3ln7ZXn6ZQZntID2Lt80q1PjrCydryN8LAlcP2K0
	l1SorcZa98tJMtgEL5HovyrN3vDsxHwPLsWC4BPB/Cznqp/qBXOOMD0YkMQwjTfpM/Sc
	hn0UioZTumkxw3LKJ6730XzoWCpUuWC9nKSeeuZlp2p1hYEuT7eGiPaeYhfq6HoKFTfI
	evA2zyjckyNNDHvcKw4n/8tqtw4A4MDKH3Cs3TKzFzlaM1/avzEJ7HprloP08ut8QRUA
	L/fIxPdATcVBvSyfgUTyJNTxJ8rxPtYj7uLTKSjtjEyUYWBB6PiLsoT5lGwQPJB7Z7/5
	XykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sx052c50oEZFLB/PlMel4i2qw/2CIFOqiVCCliyuOqc=;
	b=Jc1LcA+SR7gRg3I6rnwR1WqgLiay5QNtKTS34yOHzCj8lpAuHCVfDp2PkETjQNgxfL
	BBs4DAo0x8Jf9TyUH/ILLRw+wjazh63uzdTUr12MTWKFUOJDcwTndxZSsadE+p7eLcOL
	mxHNA1D7NVHGvDscNsMKfPy1W+6sns7qz0QXH/70dRBKNUIH+9dxuCTaR2s8eHU+1nTL
	Dv/1lxNSxz0GgI0vaX934HUDL8sW+8vvTaT0KlZrTDEwfDHBBT/w7UlsDWD5mJFs5duj
	xavDXcaNIkkxfmi8RQESPZUJGRldJSCj1pomMOVv5voG86nVbzVJF5vg1z0DoMo5eouD
	mrGQ==
X-Gm-Message-State: AMke39naztR+MrJg5DbOBfw8iZt1XnTuUiSsPg7Sp4SzQCduSMU/mojJNRQSGDGkU718ybp68MN7omxwgaZmOmra
X-Received: by 10.55.1.134 with SMTP id u6mr29241987qkg.36.1487684740663; Tue,
	21 Feb 2017 05:45:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 21 Feb 2017 05:45:20 -0800 (PST)
In-Reply-To: <13166601300f7c408f64219dcdde6cfa8253e40b.1487659929.git.hongxu.jia@windriver.com>
References: <cover.1487659929.git.hongxu.jia@windriver.com>
	<13166601300f7c408f64219dcdde6cfa8253e40b.1487659929.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Feb 2017 13:45:20 +0000
Message-ID: <CAJTo0LY9Mki0m3QyCO8shhgJGEL9m1udkyxkJt0iHcbSzwNwow@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] bash: update patches for 4.4
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
X-List-Received-Date: Tue, 21 Feb 2017 13:45:40 -0000
Content-Type: multipart/alternative; boundary=001a114046c4816ad705490a9806

--001a114046c4816ad705490a9806
Content-Type: text/plain; charset=UTF-8

Having commits which don't build isn't good for bisecting in the future:
can you squash these into a single commit and credit Zheng Ruoqin for the
initial work?

Ross

On 21 February 2017 at 07:36, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> - Update patches from upstream to 4.4
>
> - Add ${PN}-loadable for loadable builtins which is new features in Bash
> 4.4
>   --------------
>    a.  `make install' now installs the example loadable builtins and a set
> of
>        bash headers to use when developing new loadable builtins.
>
>    b.  `enable -f' now attempts to call functions named
> BUILTIN_builtin_load when
>        loading BUILTIN, and BUILTIN_builtin_unload when deleting it.  This
> allows
>        loadable builtins to run initialization and cleanup code.
>
>    c.  There is a new BASH_LOADABLES_PATH variable containing a list of
> directories
>        where the `enable -f' command looks for shared objects containing
> loadable
>        builtins.
>    --------------
>
> - The loadable builtins `uname' could not be parsed by rpmdeps correctly:
>    --------------
>    $ recipe-sysroot-native/usr/lib/rpm/bin/rpmdeps-oecore --macros \
>    recipe-sysroot-native/usr/lib/rpm/macros --define '_rpmfc_magic_path \
>    recipe-sysroot-native/usr/share/misc/magic.mgc' --rpmpopt \
>    recipe-sysroot-native/usr/lib/rpm/rpmpopt
> packages-split/bash/usr/lib64/bash/uname
>
>    |packages-split/bash/usr/lib64/bash/uname Provides: )(64bit
>    |packages-split/bash/usr/lib64/bash/uname Provides: elf(buildid) =
> 7186059a5a6b11ec38493b53072c3a62edf7e05c
>    --------------
>
>    The incorrected "Provides: )(64bit" could not be parsed by rpmbuild.
>    --------------
>    | DEBUG: Executing shell function BUILDSPEC
>    | error: line 56: Dependency ")(64bit" must begin with alpha-numeric,
> '_' or '/': Provides: )(64bit
>    | error: Package has no %description: bash-4.4-r0.core2_64
>    --------------
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...e-builtins-uname-could-not-be-parsed-by-r.patch | 89
> ++++++++++++++++++++++
>  meta/recipes-extended/bash/bash_4.4.bb             | 28 +++++++
>  2 files changed, 117 insertions(+)
>  create mode 100644 meta/recipes-extended/bash/bash/0001-The-loadable-
> builtins-uname-could-not-be-parsed-by-r.patch
>
> diff --git a/meta/recipes-extended/bash/bash/0001-The-loadable-
> builtins-uname-could-not-be-parsed-by-r.patch
> b/meta/recipes-extended/bash/bash/0001-The-loadable-
> builtins-uname-could-not-be-parsed-by-r.patch
> new file mode 100644
> index 0000000..79d9e4e
> --- /dev/null
> +++ b/meta/recipes-extended/bash/bash/0001-The-loadable-
> builtins-uname-could-not-be-parsed-by-r.patch
> @@ -0,0 +1,89 @@
> +rename uname to workaround name confliction in rpmnsProbe
> +
> +The loadable builtins `uname' could not be parsed by
> +rpmdeps correctly:
> +--------------
> +$recipe-sysroot-native/usr/lib/rpm/bin/rpmdeps-oecore --macros \
> +recipe-sysroot-native/usr/lib/rpm/macros --define '_rpmfc_magic_path \
> +recipe-sysroot-native/usr/share/misc/magic.mgc' --rpmpopt \
> +recipe-sysroot-native/usr/lib/rpm/rpmpopt packages-split/bash/usr/lib64/
> bash/uname
> +
> +|packages-split/bash/usr/lib64/bash/uname Provides: )(64bit
> +|packages-split/bash/usr/lib64/bash/uname Provides: elf(buildid) =
> 7186059a5a6b11ec38493b53072c3a62edf7e05c
> +--------------
> +
> +The incorrected "Provides: )(64bit" could not be parsed by rpmbuild.
> +--------------
> +| DEBUG: Executing shell function BUILDSPEC
> +| error: line 56: Dependency ")(64bit" must begin with alpha-numeric, '_'
> or '/': Provides: )(64bit
> +| error: Package has no %description: bash-4.4-r0.core2_64
> +--------------
> +
> +The root cause is `uname' is incorrectly parsed by rpmnsProbe that string
> +matches with "uname()(64bit)".
> +
> +The nsType of `uname' should be RPMNS_TYPE_NAMESPACE (like other
> utilities),
> +rather than RPMNS_TYPE_UNAME which generates "Provides: )(64bit".
> +
> +We could not fix rpm-native without side effect. So rename to `uname-oe'
> +and create a symlink `uname' could workaround the issue.
> +
> +Here is to load builtin uname in the target:
> +----------------
> +root@qemux86-64:# enable -f /usr/lib64/bash/uname uname
> +root@qemux86-64:# help uname
> +uname: uname [-amnrsv]
> +    Display system information.
> +
> +    Display information about the system hardware and OS.
> +----------------
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + examples/loadables/Makefile.in | 8 +++++---
> + 1 file changed, 5 insertions(+), 3 deletions(-)
> +
> +diff --git a/examples/loadables/Makefile.in
> b/examples/loadables/Makefile.in
> +index ec305cd..c7c96e2 100644
> +--- a/examples/loadables/Makefile.in
> ++++ b/examples/loadables/Makefile.in
> +@@ -102,7 +102,7 @@ INC = -I. -I.. -I$(topdir) -I$(topdir)/lib
> -I$(topdir)/builtins -I${srcdir} \
> +
> + ALLPROG = print truefalse sleep finfo logname basename dirname \
> +         tty pathchk tee head mkdir rmdir printenv id whoami \
> +-        uname sync push ln unlink realpath strftime mypid setpgid
> ++        uname-oe sync push ln unlink realpath strftime mypid setpgid
> + OTHERPROG = necho hello cat pushd
> +
> + all:  $(SHOBJ_STATUS)
> +@@ -178,7 +178,7 @@ id:        id.o
> + whoami:       whoami.o
> +       $(SHOBJ_LD) $(SHOBJ_LDFLAGS) $(SHOBJ_XLDFLAGS) -o $@ whoami.o
> $(SHOBJ_LIBS)
> +
> +-uname:        uname.o
> ++uname-oe:     uname.o
> +       $(SHOBJ_LD) $(SHOBJ_LDFLAGS) $(SHOBJ_XLDFLAGS) -o $@ uname.o
> $(SHOBJ_LIBS)
> +
> + sync: sync.o
> +@@ -244,13 +244,15 @@ install-supported:       all installdirs install-dev
> +               echo $$prog ; \
> +               $(INSTALL_PROGRAM) $(INSTALLMODE) $$prog
> $(DESTDIR)$(loadablesdir)/$$prog ;\
> +       done
> ++      -( cd $(DESTDIR)$(loadablesdir) && ln -snf uname-oe uname)
> ++
> +
> + uninstall-dev:
> +       -$(RM) $(DESTDIR)$(loadablesdir)/Makefile.inc
> +       -( cd $(BUILD_DIR) && ${MAKE} ${MFLAGS} DESTDIR="$(DESTDIR)"
> uninstall-headers)
> +
> + uninstall-supported:  uninstall-dev
> +-      -( cd $(DESTDIR)${loadablesdir} && $(RM) ${ALLPROG} )
> ++      -( cd $(DESTDIR)${loadablesdir} && $(RM) ${ALLPROG} uname)
> +
> + install-unsupported:
> + uninstall-unsupported:
> +--
> +2.8.1
> +
> diff --git a/meta/recipes-extended/bash/bash_4.4.bb
> b/meta/recipes-extended/bash/bash_4.4.bb
> index 16ff114..798bfdb 100644
> --- a/meta/recipes-extended/bash/bash_4.4.bb
> +++ b/meta/recipes-extended/bash/bash_4.4.bb
> @@ -10,6 +10,13 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball
> \
>             ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-003;apply=yes;striplevel=0;name=patch003
> \
>             ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-004;apply=yes;striplevel=0;name=patch004
> \
>             ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-005;apply=yes;striplevel=0;name=patch005
> \
> +           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-006;apply=yes;striplevel=0;name=patch006
> \
> +           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-007;apply=yes;striplevel=0;name=patch007
> \
> +           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-008;apply=yes;striplevel=0;name=patch008
> \
> +           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-009;apply=yes;striplevel=0;name=patch009
> \
> +           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-010;apply=yes;striplevel=0;name=patch010
> \
> +           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-011;apply=yes;striplevel=0;name=patch011
> \
> +           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-012;apply=yes;striplevel=0;name=patch012
> \
>             file://execute_cmd.patch;striplevel=0 \
>             file://mkbuiltins_have_stringize.patch \
>             file://build-tests.patch \
> @@ -19,6 +26,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball
> \
>             file://fix-run-builtins.patch \
>             file://0001-help-fix-printf-format-security-warning.patch \
>             file://0001-patch-to-obtain-pkgconfig-sanity.patch \
> +           file://0001-The-loadable-builtins-uname-could-not-be-parsed-by-r.patch
> \
>             "
>
>  SRC_URI[tarball.md5sum] = "148888a7c95ac23705559b6f477dfe25"
> @@ -34,5 +42,25 @@ SRC_URI[patch004.md5sum] = "
> 4557d674ab5831a5fa98052ab19edaf4"
>  SRC_URI[patch004.sha256sum] = "ad080a30a4ac6c1273373617f29628
> cc320a35c8cd06913894794293dc52c8b3"
>  SRC_URI[patch005.md5sum] = "cce96dd77cdd1d293beec10848f6cbb5"
>  SRC_URI[patch005.sha256sum] = "221e4b725b770ad0bb6924df3f8d04
> f89eeca4558f6e4c777dfa93e967090529"
> +SRC_URI[patch006.md5sum] = "d3379f8d8abce5c6ee338f931ad008d5"
> +SRC_URI[patch006.sha256sum] = "6a8e2e2a6180d0f1ce39dcd651622f
> b6d2fd05db7c459f64ae42d667f1e344b8"
> +SRC_URI[patch007.md5sum] = "ec38c76ca439ca7f9c178e9baede84fc"
> +SRC_URI[patch007.sha256sum] = "de1ccc07b7bfc9e25243ad854f3bbb
> 5d3ebf9155b0477df16aaf00a7b0d5edaf"
> +SRC_URI[patch008.md5sum] = "e0ba18c1e3b94f905da9b5bf9d38b58b"
> +SRC_URI[patch008.sha256sum] = "86144700465933636d7b945e89b77d
> f95d3620034725be161ca0ca5a42e239ba"
> +SRC_URI[patch009.md5sum] = "e952d4f44e612048930c559d90eb99bb"
> +SRC_URI[patch009.sha256sum] = "0b6bdd1a18a0d20e330cc3bc71e048
> 864e4a13652e29dc0ebf3918bea729343c"
> +SRC_URI[patch010.md5sum] = "57b5b35955d68f9a09dbef6b86d2c782"
> +SRC_URI[patch010.sha256sum] = "8465c6f2c56afe559402265b39d9e9
> 4368954930f9aa7f3dfa6d36dd66868e06"
> +SRC_URI[patch011.md5sum] = "cc896e1fa696b93ded568e557e2392d5"
> +SRC_URI[patch011.sha256sum] = "dd56426ef7d7295e1107c0b3d06c19
> 2eb9298f4023c202ca2ba6266c613d170d"
> +SRC_URI[patch012.md5sum] = "fa47fbfa56fb7e9e5367f19a9df5fc9e"
> +SRC_URI[patch012.sha256sum] = "fac271d2bf6372c9903e3b353cb9ed
> a044d7fe36b5aab52f21f3f21cd6a2063e"
>
>  BBCLASSEXTEND = "nativesdk"
> +
> +PACKAGE_BEFORE_PN += "${PN}-loadable"
> +RDEPENDS_${PN}-loadable += "${PN}"
> +FILES_${PN}-dev += "${libdir}/bash/Makefile.inc"
> +FILES_${PN}-loadable += "${libdir}/bash/*"
> +
> --
> 2.9.3
>
>

--001a114046c4816ad705490a9806
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Having commits which don&#39;t build isn&#39;t good for bi=
secting in the future: can you squash these into a single commit and credit=
=C2=A0Zheng Ruoqin for the initial work?<div><br></div><div>Ross</div></div=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 21 February 2=
017 at 07:36, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"mailto:hongxu.jia=
@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">- Update patches from upstream to 4=
.4<br>
<br>
- Add ${PN}-loadable for loadable builtins which is new features in Bash 4.=
4<br>
=C2=A0 --------------<br>
=C2=A0 =C2=A0a.=C2=A0 `make install&#39; now installs the example loadable =
builtins and a set of<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0bash headers to use when developing new loadable=
 builtins.<br>
<br>
=C2=A0 =C2=A0b.=C2=A0 `enable -f&#39; now attempts to call functions named =
BUILTIN_builtin_load when<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0loading BUILTIN, and BUILTIN_builtin_unload when=
 deleting it.=C2=A0 This allows<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0loadable builtins to run initialization and clea=
nup code.<br>
<br>
=C2=A0 =C2=A0c.=C2=A0 There is a new BASH_LOADABLES_PATH variable containin=
g a list of directories<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0where the `enable -f&#39; command looks for shar=
ed objects containing loadable<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0builtins.<br>
=C2=A0 =C2=A0--------------<br>
<br>
- The loadable builtins `uname&#39; could not be parsed by rpmdeps correctl=
y:<br>
=C2=A0 =C2=A0--------------<br>
=C2=A0 =C2=A0$ recipe-sysroot-native/usr/lib/<wbr>rpm/bin/rpmdeps-oecore --=
macros \<br>
=C2=A0 =C2=A0recipe-sysroot-native/usr/lib/<wbr>rpm/macros --define &#39;_r=
pmfc_magic_path \<br>
=C2=A0 =C2=A0recipe-sysroot-native/usr/<wbr>share/misc/magic.mgc&#39; --rpm=
popt \<br>
=C2=A0 =C2=A0recipe-sysroot-native/usr/lib/<wbr>rpm/rpmpopt packages-split/=
bash/usr/lib64/<wbr>bash/uname<br>
<br>
=C2=A0 =C2=A0|packages-split/bash/usr/<wbr>lib64/bash/uname Provides: )(64b=
it<br>
=C2=A0 =C2=A0|packages-split/bash/usr/<wbr>lib64/bash/uname Provides: elf(b=
uildid) =3D 7186059a5a6b11ec38493b53072c3a<wbr>62edf7e05c<br>
=C2=A0 =C2=A0--------------<br>
<br>
=C2=A0 =C2=A0The incorrected &quot;Provides: )(64bit&quot; could not be par=
sed by rpmbuild.<br>
=C2=A0 =C2=A0--------------<br>
=C2=A0 =C2=A0| DEBUG: Executing shell function BUILDSPEC<br>
=C2=A0 =C2=A0| error: line 56: Dependency &quot;)(64bit&quot; must begin wi=
th alpha-numeric, &#39;_&#39; or &#39;/&#39;: Provides: )(64bit<br>
=C2=A0 =C2=A0| error: Package has no %description: bash-4.4-r0.core2_64<br>
=C2=A0 =C2=A0--------------<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">h=
ongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0...e-builtins-uname-could-not-<wbr>be-parsed-by-r.patch | 89 ++++++++=
++++++++++++++<br>
=C2=A0meta/recipes-extended/bash/<a href=3D"http://bash_4.4.bb" rel=3D"nore=
ferrer" target=3D"_blank">bas<wbr>h_4.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 28 +++++++<br>
=C2=A02 files changed, 117 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-extended/bash/<wbr>bash/0001-The-load=
able-<wbr>builtins-uname-could-not-be-<wbr>parsed-by-r.patch<br>
<br>
diff --git a/meta/recipes-extended/bash/<wbr>bash/0001-The-loadable-<wbr>bu=
iltins-uname-could-not-be-<wbr>parsed-by-r.patch b/meta/recipes-extended/ba=
sh/<wbr>bash/0001-The-loadable-<wbr>builtins-uname-could-not-be-<wbr>parsed=
-by-r.patch<br>
new file mode 100644<br>
index 0000000..79d9e4e<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/bash/<wbr>bash/0001-The-loadable-<wbr>builtins-=
uname-could-not-be-<wbr>parsed-by-r.patch<br>
@@ -0,0 +1,89 @@<br>
+rename uname to workaround name confliction in rpmnsProbe<br>
+<br>
+The loadable builtins `uname&#39; could not be parsed by<br>
+rpmdeps correctly:<br>
+--------------<br>
+$recipe-sysroot-native/usr/<wbr>lib/rpm/bin/rpmdeps-oecore --macros \<br>
+recipe-sysroot-native/usr/<wbr>lib/rpm/macros --define &#39;_rpmfc_magic_p=
ath \<br>
+recipe-sysroot-native/usr/<wbr>share/misc/magic.mgc&#39; --rpmpopt \<br>
+recipe-sysroot-native/usr/<wbr>lib/rpm/rpmpopt packages-split/bash/usr/lib=
64/<wbr>bash/uname<br>
+<br>
+|packages-split/bash/usr/<wbr>lib64/bash/uname Provides: )(64bit<br>
+|packages-split/bash/usr/<wbr>lib64/bash/uname Provides: elf(buildid) =3D =
7186059a5a6b11ec38493b53072c3a<wbr>62edf7e05c<br>
+--------------<br>
+<br>
+The incorrected &quot;Provides: )(64bit&quot; could not be parsed by rpmbu=
ild.<br>
+--------------<br>
+| DEBUG: Executing shell function BUILDSPEC<br>
+| error: line 56: Dependency &quot;)(64bit&quot; must begin with alpha-num=
eric, &#39;_&#39; or &#39;/&#39;: Provides: )(64bit<br>
+| error: Package has no %description: bash-4.4-r0.core2_64<br>
+--------------<br>
+<br>
+The root cause is `uname&#39; is incorrectly parsed by rpmnsProbe that str=
ing<br>
+matches with &quot;uname()(64bit)&quot;.<br>
+<br>
+The nsType of `uname&#39; should be RPMNS_TYPE_NAMESPACE (like other utili=
ties),<br>
+rather than RPMNS_TYPE_UNAME which generates &quot;Provides: )(64bit&quot;=
.<br>
+<br>
+We could not fix rpm-native without side effect. So rename to `uname-oe&#3=
9;<br>
+and create a symlink `uname&#39; could workaround the issue.<br>
+<br>
+Here is to load builtin uname in the target:<br>
+----------------<br>
+root@qemux86-64:# enable -f /usr/lib64/bash/uname uname<br>
+root@qemux86-64:# help uname<br>
+uname: uname [-amnrsv]<br>
+=C2=A0 =C2=A0 Display system information.<br>
+<br>
+=C2=A0 =C2=A0 Display information about the system hardware and OS.<br>
+----------------<br>
+<br>
+Upstream-Status: Inappropriate [oe specific]<br>
+<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">=
hongxu.jia@windriver.com</a>&gt;<br>
+---<br>
+ examples/loadables/Makefile.in | 8 +++++---<br>
+ 1 file changed, 5 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/examples/loadables/Makefile.<wbr>in b/examples/loadables/Make=
file.<wbr>in<br>
+index ec305cd..c7c96e2 100644<br>
+--- a/examples/loadables/Makefile.<wbr>in<br>
++++ b/examples/loadables/Makefile.<wbr>in<br>
+@@ -102,7 +102,7 @@ INC =3D -I. -I.. -I$(topdir) -I$(topdir)/lib -I$(topdi=
r)/builtins -I${srcdir} \<br>
+<br>
+ ALLPROG =3D print truefalse sleep finfo logname basename dirname \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tty pathchk tee head mkdir rmdir printen=
v id whoami \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uname sync push ln unlink realpath strftime m=
ypid setpgid<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 uname-oe sync push ln unlink realpath strftim=
e mypid setpgid<br>
+ OTHERPROG =3D necho hello cat pushd<br>
+<br>
+ all:=C2=A0 $(SHOBJ_STATUS)<br>
+@@ -178,7 +178,7 @@ id:=C2=A0 =C2=A0 =C2=A0 =C2=A0 id.o<br>
+ whoami:=C2=A0 =C2=A0 =C2=A0 =C2=A0whoami.o<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(SHOBJ_LD) $(SHOBJ_LDFLAGS) $(SHOBJ_XLDFLAGS) =
-o $@ whoami.o $(SHOBJ_LIBS)<br>
+<br>
+-uname:=C2=A0 =C2=A0 =C2=A0 =C2=A0 uname.o<br>
++uname-oe:=C2=A0 =C2=A0 =C2=A0uname.o<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(SHOBJ_LD) $(SHOBJ_LDFLAGS) $(SHOBJ_XLDFLAGS) =
-o $@ uname.o $(SHOBJ_LIBS)<br>
+<br>
+ sync: sync.o<br>
+@@ -244,13 +244,15 @@ install-supported:=C2=A0 =C2=A0 =C2=A0 =C2=A0all ins=
talldirs install-dev<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo $$prog ; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_PROGRAM) =
$(INSTALLMODE) $$prog $(DESTDIR)$(loadablesdir)/$$<wbr>prog ;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
++=C2=A0 =C2=A0 =C2=A0 -( cd $(DESTDIR)$(loadablesdir) &amp;&amp; ln -snf u=
name-oe uname)<br>
++<br>
+<br>
+ uninstall-dev:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-$(RM) $(DESTDIR)$(loadablesdir)/<wbr>Makefile.=
inc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-( cd $(BUILD_DIR) &amp;&amp; ${MAKE} ${MFLAGS}=
 DESTDIR=3D&quot;$(DESTDIR)&quot; uninstall-headers)<br>
+<br>
+ uninstall-supported:=C2=A0 uninstall-dev<br>
+-=C2=A0 =C2=A0 =C2=A0 -( cd $(DESTDIR)${loadablesdir} &amp;&amp; $(RM) ${A=
LLPROG} )<br>
++=C2=A0 =C2=A0 =C2=A0 -( cd $(DESTDIR)${loadablesdir} &amp;&amp; $(RM) ${A=
LLPROG} uname)<br>
+<br>
+ install-unsupported:<br>
+ uninstall-unsupported:<br>
+--<br>
+2.8.1<br>
+<br>
diff --git a/meta/recipes-extended/bash/<a href=3D"http://bash_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">b<wbr>ash_4.4.bb</a> b/meta/recipes-exten=
ded/bash/<a href=3D"http://bash_4.4.bb" rel=3D"noreferrer" target=3D"_blank=
">b<wbr>ash_4.4.bb</a><br>
index 16ff114..798bfdb 100644<br>
--- a/meta/recipes-extended/bash/<a href=3D"http://bash_4.4.bb" rel=3D"nore=
ferrer" target=3D"_blank">b<wbr>ash_4.4.bb</a><br>
+++ b/meta/recipes-extended/bash/<a href=3D"http://bash_4.4.bb" rel=3D"nore=
ferrer" target=3D"_blank">b<wbr>ash_4.4.bb</a><br>
@@ -10,6 +10,13 @@ SRC_URI =3D &quot;${GNU_MIRROR}/bash/${BP}.tar.<wbr>gz;n=
ame=3Dtarball \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${GNU_MIRROR}/bash/bash-4.4-<wbr>=
patches/bash44-003;apply=3Dyes;<wbr>striplevel=3D0;name=3Dpatch003 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${GNU_MIRROR}/bash/bash-4.4-<wbr>=
patches/bash44-004;apply=3Dyes;<wbr>striplevel=3D0;name=3Dpatch004 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${GNU_MIRROR}/bash/bash-4.4-<wbr>=
patches/bash44-005;apply=3Dyes;<wbr>striplevel=3D0;name=3Dpatch005 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${GNU_MIRROR}/bash/bash-4.4-<wbr>=
patches/bash44-006;apply=3Dyes;<wbr>striplevel=3D0;name=3Dpatch006 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${GNU_MIRROR}/bash/bash-4.4-<wbr>=
patches/bash44-007;apply=3Dyes;<wbr>striplevel=3D0;name=3Dpatch007 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${GNU_MIRROR}/bash/bash-4.4-<wbr>=
patches/bash44-008;apply=3Dyes;<wbr>striplevel=3D0;name=3Dpatch008 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${GNU_MIRROR}/bash/bash-4.4-<wbr>=
patches/bash44-009;apply=3Dyes;<wbr>striplevel=3D0;name=3Dpatch009 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${GNU_MIRROR}/bash/bash-4.4-<wbr>=
patches/bash44-010;apply=3Dyes;<wbr>striplevel=3D0;name=3Dpatch010 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${GNU_MIRROR}/bash/bash-4.4-<wbr>=
patches/bash44-011;apply=3Dyes;<wbr>striplevel=3D0;name=3Dpatch011 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${GNU_MIRROR}/bash/bash-4.4-<wbr>=
patches/bash44-012;apply=3Dyes;<wbr>striplevel=3D0;name=3Dpatch012 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://execute_cmd.patch;<wbr>str=
iplevel=3D0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mkbuiltins_have_<wbr>strin=
gize.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://build-tests.patch \<br>
@@ -19,6 +26,7 @@ SRC_URI =3D &quot;${GNU_MIRROR}/bash/${BP}.tar.<wbr>gz;na=
me=3Dtarball \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-run-builtins.patch \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-help-fix-printf-<wbr>=
format-security-warning.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-patch-to-obtain-<wbr>=
pkgconfig-sanity.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-The-loadable-<wbr>bui=
ltins-uname-could-not-be-<wbr>parsed-by-r.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[tarball.md5sum] =3D &quot;<wbr>148888a7c95ac23705559b6f477dfe=
<wbr>25&quot;<br>
@@ -34,5 +42,25 @@ SRC_URI[patch004.md5sum] =3D &quot;<wbr>4557d674ab5831a5=
fa98052ab19eda<wbr>f4&quot;<br>
=C2=A0SRC_URI[patch004.sha256sum] =3D &quot;<wbr>ad080a30a4ac6c1273373617f2=
9628<wbr>cc320a35c8cd06913894794293dc52<wbr>c8b3&quot;<br>
=C2=A0SRC_URI[patch005.md5sum] =3D &quot;<wbr>cce96dd77cdd1d293beec10848f6c=
b<wbr>b5&quot;<br>
=C2=A0SRC_URI[patch005.sha256sum] =3D &quot;<wbr>221e4b725b770ad0bb6924df3f=
8d04<wbr>f89eeca4558f6e4c777dfa93e96709<wbr>0529&quot;<br>
+SRC_URI[patch006.md5sum] =3D &quot;<wbr>d3379f8d8abce5c6ee338f931ad008<wbr=
>d5&quot;<br>
+SRC_URI[patch006.sha256sum] =3D &quot;<wbr>6a8e2e2a6180d0f1ce39dcd651622f<=
wbr>b6d2fd05db7c459f64ae42d667f1e3<wbr>44b8&quot;<br>
+SRC_URI[patch007.md5sum] =3D &quot;<wbr>ec38c76ca439ca7f9c178e9baede84<wbr=
>fc&quot;<br>
+SRC_URI[patch007.sha256sum] =3D &quot;<wbr>de1ccc07b7bfc9e25243ad854f3bbb<=
wbr>5d3ebf9155b0477df16aaf00a7b0d5<wbr>edaf&quot;<br>
+SRC_URI[patch008.md5sum] =3D &quot;<wbr>e0ba18c1e3b94f905da9b5bf9d38b5<wbr=
>8b&quot;<br>
+SRC_URI[patch008.sha256sum] =3D &quot;<wbr>86144700465933636d7b945e89b77d<=
wbr>f95d3620034725be161ca0ca5a42e2<wbr>39ba&quot;<br>
+SRC_URI[patch009.md5sum] =3D &quot;<wbr>e952d4f44e612048930c559d90eb99<wbr=
>bb&quot;<br>
+SRC_URI[patch009.sha256sum] =3D &quot;<wbr>0b6bdd1a18a0d20e330cc3bc71e048<=
wbr>864e4a13652e29dc0ebf3918bea729<wbr>343c&quot;<br>
+SRC_URI[patch010.md5sum] =3D &quot;<wbr>57b5b35955d68f9a09dbef6b86d2c7<wbr=
>82&quot;<br>
+SRC_URI[patch010.sha256sum] =3D &quot;<wbr>8465c6f2c56afe559402265b39d9e9<=
wbr>4368954930f9aa7f3dfa6d36dd6686<wbr>8e06&quot;<br>
+SRC_URI[patch011.md5sum] =3D &quot;<wbr>cc896e1fa696b93ded568e557e2392<wbr=
>d5&quot;<br>
+SRC_URI[patch011.sha256sum] =3D &quot;<wbr>dd56426ef7d7295e1107c0b3d06c19<=
wbr>2eb9298f4023c202ca2ba6266c613d<wbr>170d&quot;<br>
+SRC_URI[patch012.md5sum] =3D &quot;<wbr>fa47fbfa56fb7e9e5367f19a9df5fc<wbr=
>9e&quot;<br>
+SRC_URI[patch012.sha256sum] =3D &quot;<wbr>fac271d2bf6372c9903e3b353cb9ed<=
wbr>a044d7fe36b5aab52f21f3f21cd6a2<wbr>063e&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
+<br>
+PACKAGE_BEFORE_PN +=3D &quot;${PN}-loadable&quot;<br>
+RDEPENDS_${PN}-loadable +=3D &quot;${PN}&quot;<br>
+FILES_${PN}-dev +=3D &quot;${libdir}/bash/Makefile.inc&quot;<br>
+FILES_${PN}-loadable +=3D &quot;${libdir}/bash/*&quot;<br>
+<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.9.3<br>
<br>
</font></span></blockquote></div><br></div>

--001a114046c4816ad705490a9806--

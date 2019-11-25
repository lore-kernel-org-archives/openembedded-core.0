Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id AE67F7F3BA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 16:33:18 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id p6so5296081vsj.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 08:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1wGPj0GbyFdsC9E9K2+YKtXZQZdGeKr1g9H3f1S4AGM=;
	b=gEYkcmda/5FZWMnzaCALxz1QyUs1HyFWJ/TcJvMlU922L2j2QVuXANrXw7GirT9kFa
	30efZf4sg/C9ETM7yZuNOfMuPMBYd7t8I3vcxiszir0wWPANhXa5cDZB3E8/xQ1s3D7P
	rxLTyajNhqgDVitbHQ/xcYI26lZJ/Dx8NAXHNSVuD4ee7EH1/4A+q/HFla99ol2zVGp7
	J4Qe4pHSjDN6TNO+AdYytfnKZVfluLWmAizpqAbMLPFWqOSF+ZVAko141+BEXYtQrfsd
	GMJuFHJX8Z54757ku66Z18EOmJMt72+3ELkqWtVaYQE+IBXw+Jy69vExX1lfB40PB30y
	Op0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1wGPj0GbyFdsC9E9K2+YKtXZQZdGeKr1g9H3f1S4AGM=;
	b=eRTNaY+x21TEpnPNw6aSd4YWBmPPboHl2xFS9Xf28MavpN2eQY9zLRZdMx9FDeMng7
	/L3N/63I1eOX7BQL++C9MajN2e8yF5oL0G19y4BIseAGzgpGDOaKdz5WBxfDeywxPDiT
	0LooZYkOosn8T7WyPV2bKMosSlPqtxmwE68MIs3hxkZ15TlKGFUKR/Whyg9eGNvLkpZ4
	7NriAACas9WMNnVhnZYNzbiP+bmxliZ2kSFXKd6b7u0Ia+u0uScUGPdPMywtdMZsHQoz
	yKWQWVUeHkEExgAE2ZeE7VRMbA1dMxmNyNuqTlln//PJALc6W3/q5ptiDexR1o0UFggf
	WQTA==
X-Gm-Message-State: APjAAAU9rSKl+mjdqypbiK9rOEPq23R9DXtUF3xzGBLxP0l6o6gml0m2
	VlS9A7l9Nd0rkcZ9igauNYwc1cbAichrLukR+1k=
X-Google-Smtp-Source: APXvYqzt+eUW3//48ay4LNZ2pnHbL8TmjJ4Qo7gUpwKCbzsedMt9WyEBAVb4f6GYAEi/LIXYV0diYfRIRRvx9i9Cy2c=
X-Received: by 2002:a67:e343:: with SMTP id s3mr19974351vsm.83.1574699599104; 
	Mon, 25 Nov 2019 08:33:19 -0800 (PST)
MIME-Version: 1.0
References: <20191119132556.107508-1-alex.kanavin@gmail.com>
	<20191119132556.107508-2-alex.kanavin@gmail.com>
	<CAMKF1sq+_uQo5XGFDkg5JvPDtDW-=hdQqc3HhCYKDTu2krf5Sw@mail.gmail.com>
	<CANNYZj8-tn_bje4eHp+vzxN3mJVJz6CtYd+pPK1OujHYZz1cKA@mail.gmail.com>
	<CAMKF1srT5eS14HBGyOjrce3-nKFDtwiY1Nq-5gfEhv_C1JwB_w@mail.gmail.com>
In-Reply-To: <CAMKF1srT5eS14HBGyOjrce3-nKFDtwiY1Nq-5gfEhv_C1JwB_w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 25 Nov 2019 17:33:08 +0100
Message-ID: <CANNYZj-d7k=-V_4Ovg676xfPiJtyELZ-grb78=4DH3-kxroGVg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] rpm: upgrade to 4.15.1
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
X-List-Received-Date: Mon, 25 Nov 2019 16:33:19 -0000
Content-Type: multipart/alternative; boundary="0000000000003b8cbd05982e52d1"

--0000000000003b8cbd05982e52d1
Content-Type: text/plain; charset="UTF-8"

I have reproduced it with gcc and musl. The omp.h is in a non-standard
location in recipe-sysroot/usr/lib, which works ok with glibc, but breaks
with musl. How gcc is able to find it (or not) is too arcane for my
knowledge :(

I added --disable-openmp for musl; the major use for openmp is to speed up
native rpm packaging. On target it matters less hopefully.

Alex

On Mon, 25 Nov 2019 at 16:50, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Nov 25, 2019 at 7:19 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > omp.h is coming from gcc-runtime. Which compiler are you using? Probably
> an override (specific for that compiler) is needed.
>
> if you looked into logs then you must have noticed its clang. I was
> wonder is openMP a hard dependency
> for rpm now, which might be interesting for architectures like mips and
> ppc.
>
> >
> > Alex
> >
> > On Sat, 23 Nov 2019 at 18:48, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> breaks with needing openmp
> >>
> >> http://errors.yoctoproject.org/Errors/Details/282827/
> >>
> >> perhaps needs explicit dependency on libgomp now ?
> >>
> >> On Tue, Nov 19, 2019 at 5:26 AM Alexander Kanavin
> >> <alex.kanavin@gmail.com> wrote:
> >> >
> >> > Drop patches that were merged upstream.
> >> >
> >> > 0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
> >> > modifies a file that was removed upstream.
> >> >
> >> > Add a 0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
> >> > as unfortunately the new parallel file classification feature from
> >> > upstream trips over somewhere in libmagic when inspected files are
> >> > compressed:
> >> > https://github.com/rpm-software-management/rpm/issues/756
> >> >
> >> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> > ---
> >> >  ...satisfiable-dependency-when-building.patch |  28 +-
> >> >  ...lib-rpm-as-the-installation-path-for.patch |  14 +-
> >> >  ...kage-building-into-a-separate-functi.patch |  84 -----
> >> >  ...es-requires-do-not-use-monodis-from-.patch |  58 ---
> >> >  ...-run-file-classification-in-parallel.patch |  65 ++++
> >> >  ...ry-package-creation-via-thread-pools.patch | 127 -------
> >> >  ...e-operations-over-string-pools-threa.patch | 207 -----------
> >> >  ...ove-static-local-variables-from-buil.patch | 336
> ------------------
> >> >  .../rpm/{rpm_4.14.2.1.bb => rpm_4.15.1.bb}    |  13 +-
> >> >  9 files changed, 89 insertions(+), 843 deletions(-)
> >> >  delete mode 100644
> meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch
> >> >  delete mode 100644
> meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
> >> >  create mode 100644
> meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
> >> >  delete mode 100644
> meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch
> >> >  delete mode 100644
> meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch
> >> >  delete mode 100644
> meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
> >> >  rename meta/recipes-devtools/rpm/{rpm_4.14.2.1.bb => rpm_4.15.1.bb}
> (91%)
> >> >
> >> > diff --git
> a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
> b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
> >> > index 80e2f0fad70..4029233fb70 100644
> >> > ---
> a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
> >> > +++
> b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
> >> > @@ -1,4 +1,4 @@
> >> > -From 87cfc0db1ed6fe381a5ed5f0016d8c3344a31a11 Mon Sep 17 00:00:00
> 2001
> >> > +From f39c28eb52f12ae6e82db360ffd5a903ac8faca5 Mon Sep 17 00:00:00
> 2001
> >> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >> >  Date: Mon, 9 Jan 2017 18:52:11 +0200
> >> >  Subject: [PATCH] Do not add an unsatisfiable dependency when
> building rpms in
> >> > @@ -9,25 +9,23 @@ hand produces rpms that way by design.
> >> >
> >> >  Upstream-Status: Inappropriate [oe-core specific]
> >> >  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> > +
> >> >  ---
> >> >   build/pack.c | 4 ----
> >> >   1 file changed, 4 deletions(-)
> >> >
> >> >  diff --git a/build/pack.c b/build/pack.c
> >> > -index 1261cdbba..bb2d6f4f6 100644
> >> > +index e6cec1816..810cd7351 100644
> >> >  --- a/build/pack.c
> >> >  +++ b/build/pack.c
> >> > -@@ -595,10 +595,6 @@ rpmRC packageBinaries(rpmSpec spec, const char
> *cookie, int cheating)
> >> > -           headerPutBin(pkg->header, RPMTAG_SOURCEPKGID,
> spec->sourcePkgId,16);
> >> > -       }
> >> > +@@ -724,10 +724,6 @@ static rpmRC packageBinary(rpmSpec spec,
> Package pkg, const char *cookie, int ch
> >> > +       headerPutBin(pkg->header, RPMTAG_SOURCEPKGID,
> spec->sourcePkgId,16);
> >> > +     }
> >> > +
> >> > +-    if (cheating) {
> >> > +-      (void) rpmlibNeedsFeature(pkg, "ShortCircuited", "4.9.0-1");
> >> > +-    }
> >> > +-
> >> > +     if ((rc = getPkgFilename(pkg->header, filename)))
> >> > +       return rc;
> >> >
> >> > --      if (cheating) {
> >> > --          (void) rpmlibNeedsFeature(pkg, "ShortCircuited",
> "4.9.0-1");
> >> > --      }
> >> > --
> >> > -       {   char *binFormat = rpmGetPath("%{_rpmfilename}", NULL);
> >> > -           char *binRpm, *binDir;
> >> > -           binRpm = headerFormat(pkg->header, binFormat,
> &errorString);
> >> > ---
> >> > -2.11.0
> >> > -
> >> > diff --git
> a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
> b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
> >> > index 82e7328757f..52440d68180 100644
> >> > ---
> a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
> >> > +++
> b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
> >> > @@ -1,4 +1,4 @@
> >> > -From bd08eb0ae1312f347f49949481daa7c923752df2 Mon Sep 17 00:00:00
> 2001
> >> > +From 2f3d1619b6510bc131c4375827caf912559f0fa2 Mon Sep 17 00:00:00
> 2001
> >> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >> >  Date: Mon, 27 Feb 2017 09:43:30 +0200
> >> >  Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path
> for
> >> > @@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> >> >   3 files changed, 4 insertions(+), 4 deletions(-)
> >> >
> >> >  diff --git a/configure.ac b/configure.ac
> >> > -index 09af7c4..9bd6903 100644
> >> > +index d3aeab86e..1a1f3f91f 100644
> >> >  --- a/configure.ac
> >> >  +++ b/configure.ac
> >> > -@@ -1055,7 +1055,7 @@ else
> >> > +@@ -1086,7 +1086,7 @@ else
> >> >       usrprefix=$prefix
> >> >   fi
> >> >
> >> > @@ -27,10 +27,10 @@ index 09af7c4..9bd6903 100644
> >> >
> >> >   AC_SUBST(OBJDUMP)
> >> >  diff --git a/macros.in b/macros.in
> >> > -index a3aa7a9..62cee5c 100644
> >> > +index fe9803aad..d128675bf 100644
> >> >  --- a/macros.in
> >> >  +++ b/macros.in
> >> > -@@ -970,7 +970,7 @@ package or when debugging this package.\
> >> > +@@ -985,7 +985,7 @@ package or when debugging this package.\
> >> >   %_sharedstatedir      %{_prefix}/com
> >> >   %_localstatedir               %{_prefix}/var
> >> >   %_lib                 lib
> >> > @@ -40,7 +40,7 @@ index a3aa7a9..62cee5c 100644
> >> >   %_infodir             %{_datadir}/info
> >> >   %_mandir              %{_datadir}/man
> >> >  diff --git a/rpm.am b/rpm.am
> >> > -index 82c2d7c..6341b51 100644
> >> > +index 40b4ec55f..3139ce8f6 100644
> >> >  --- a/rpm.am
> >> >  +++ b/rpm.am
> >> >  @@ -1,10 +1,10 @@
> >> > @@ -55,4 +55,4 @@ index 82c2d7c..6341b51 100644
> >> >  +rpmconfigdir = $(libdir)/rpm
> >> >
> >> >   # Libtool version (current-revision-age) for all our libraries
> >> > - rpm_version_info = 9:0:1
> >> > + rpm_version_info = 9:1:0
> >> > diff --git
> a/meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch
> b/meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch
> >> > deleted file mode 100644
> >> > index 6e44f0b7fc9..00000000000
> >> > ---
> a/meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch
> >> > +++ /dev/null
> >> > @@ -1,84 +0,0 @@
> >> > -From 721a660a507d6d062e7aecafad886c643970a5d5 Mon Sep 17 00:00:00
> 2001
> >> > -From: Alexander Kanavin <alex.kanavin@gmail.com>
> >> > -Date: Thu, 25 May 2017 18:15:27 +0300
> >> > -Subject: [PATCH 1/4] Split binary package building into a separate
> function
> >> > -
> >> > -So that it can be run as a thread pool task.
> >> > -
> >> > -Upstream-Status: Submitted [
> https://github.com/rpm-software-management/rpm/pull/226]
> >> > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> > -
> >> > ----
> >> > - build/pack.c | 33 +++++++++++++++++++++------------
> >> > - 1 file changed, 21 insertions(+), 12 deletions(-)
> >> > -
> >> > -diff --git a/build/pack.c b/build/pack.c
> >> > -index 518f4e92a..ccfd614cc 100644
> >> > ---- a/build/pack.c
> >> > -+++ b/build/pack.c
> >> > -@@ -546,18 +546,13 @@ static rpmRC checkPackages(char *pkgcheck)
> >> > -     return RPMRC_OK;
> >> > - }
> >> > -
> >> > --rpmRC packageBinaries(rpmSpec spec, const char *cookie, int
> cheating)
> >> > -+static rpmRC packageBinary(rpmSpec spec, Package pkg, const char
> *cookie, int cheating, char** filename)
> >> > - {
> >> > --    rpmRC rc;
> >> > --    const char *errorString;
> >> > --    Package pkg;
> >> > --    char *pkglist = NULL;
> >> > --
> >> > --    for (pkg = spec->packages; pkg != NULL; pkg = pkg->next) {
> >> > --      char *fn;
> >> > -+      const char *errorString;
> >> > -+      rpmRC rc = RPMRC_OK;
> >> > -
> >> > -       if (pkg->fileList == NULL)
> >> > --          continue;
> >> > -+          return rc;
> >> > -
> >> > -       if ((rc = processScriptFiles(spec, pkg)))
> >> > -           return rc;
> >> > -@@ -587,7 +582,7 @@ rpmRC packageBinaries(rpmSpec spec, const char
> *cookie, int cheating)
> >> > -                    headerGetString(pkg->header, RPMTAG_NAME),
> errorString);
> >> > -               return RPMRC_FAIL;
> >> > -           }
> >> > --          fn = rpmGetPath("%{_rpmdir}/", binRpm, NULL);
> >> > -+          *filename = rpmGetPath("%{_rpmdir}/", binRpm, NULL);
> >> > -           if ((binDir = strchr(binRpm, '/')) != NULL) {
> >> > -               struct stat st;
> >> > -               char *dn;
> >> > -@@ -609,14 +604,28 @@ rpmRC packageBinaries(rpmSpec spec, const char
> *cookie, int cheating)
> >> > -           free(binRpm);
> >> > -       }
> >> > -
> >> > --      rc = writeRPM(pkg, NULL, fn, NULL);
> >> > -+      rc = writeRPM(pkg, NULL, *filename, NULL);
> >> > -       if (rc == RPMRC_OK) {
> >> > -           /* Do check each written package if enabled */
> >> > --          char *pkgcheck = rpmExpand("%{?_build_pkgcheck} ", fn,
> NULL);
> >> > -+          char *pkgcheck = rpmExpand("%{?_build_pkgcheck} ",
> *filename, NULL);
> >> > -           if (pkgcheck[0] != ' ') {
> >> > -               rc = checkPackages(pkgcheck);
> >> > -           }
> >> > -           free(pkgcheck);
> >> > -+      }
> >> > -+      return rc;
> >> > -+}
> >> > -+
> >> > -+rpmRC packageBinaries(rpmSpec spec, const char *cookie, int
> cheating)
> >> > -+{
> >> > -+    rpmRC rc;
> >> > -+    Package pkg;
> >> > -+    char *pkglist = NULL;
> >> > -+
> >> > -+    for (pkg = spec->packages; pkg != NULL; pkg = pkg->next) {
> >> > -+      char *fn = NULL;
> >> > -+      rc = packageBinary(spec, pkg, cookie, cheating, &fn);
> >> > -+      if (rc == RPMRC_OK) {
> >> > -           rstrcat(&pkglist, fn);
> >> > -           rstrcat(&pkglist, " ");
> >> > -       }
> >> > ---
> >> > -2.11.0
> >> > -
> >> > diff --git
> a/meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
> b/meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
> >> > deleted file mode 100644
> >> > index 24aa4c7ffff..00000000000
> >> > ---
> a/meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
> >> > +++ /dev/null
> >> > @@ -1,58 +0,0 @@
> >> > -From 43fbc3f53302a395463e8450ac81c53f623eec3f Mon Sep 17 00:00:00
> 2001
> >> > -From: Alexander Kanavin <alex.kanavin@gmail.com>
> >> > -Date: Tue, 27 Aug 2019 17:42:34 +0200
> >> > -Subject: [PATCH] mono-find-provides/requires: do not use monodis
> from the host
> >> > -
> >> > -There was a host contamination issue here: if monodis was installed
> >> > -on the host, do_package would use that to resolve dependencies
> >> > -of mono libraries (and often fail in that). Without monodis,
> >> > -no dependencies are resolved, which is seemingly how things
> >> > -are supposed to work.
> >> > -
> >> > -Upstream-Status: Inappropriate [oe-core specific]
> >> > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> > ----
> >> > - scripts/mono-find-provides | 8 ++++----
> >> > - scripts/mono-find-requires | 8 ++++----
> >> > - 2 files changed, 8 insertions(+), 8 deletions(-)
> >> > -
> >> > -diff --git a/scripts/mono-find-provides b/scripts/mono-find-provides
> >> > -index 9348457d3..b28872ffb 100644
> >> > ---- a/scripts/mono-find-provides
> >> > -+++ b/scripts/mono-find-provides
> >> > -@@ -18,11 +18,11 @@ monolist=($(printf "%s\n" "${filelist[@]}" |
> grep -E "\\.(exe|dll)\$"))
> >> > - build_bindir="$2/usr/bin"
> >> > - build_libdir="$2$3"
> >> > -
> >> > --if [ -x $build_bindir/monodis ]; then
> >> > --    monodis="$build_bindir/monodis"
> >> > -+if [ -x $build_bindir/monodis.bogus ]; then
> >> > -+    monodis="$build_bindir/monodis.bogus"
> >> > -     export
> LD_LIBRARY_PATH=$build_libdir${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
> >> > --elif [ -x /usr/bin/monodis ]; then
> >> > --    monodis="/usr/bin/monodis"
> >> > -+elif [ -x /usr/bin/monodis.bogus ]; then
> >> > -+    monodis="/usr/bin/monodis.bogus"
> >> > - else
> >> > -     exit 0;
> >> > - fi
> >> > -diff --git a/scripts/mono-find-requires b/scripts/mono-find-requires
> >> > -index ea58cae48..d270169e1 100644
> >> > ---- a/scripts/mono-find-requires
> >> > -+++ b/scripts/mono-find-requires
> >> > -@@ -18,11 +18,11 @@ monolist=($(printf "%s\n" "${filelist[@]}" |
> grep -E "\\.(exe|dll)\$"))
> >> > - build_bindir="$2/usr/bin"
> >> > - build_libdir="$2$3"
> >> > -
> >> > --if [ -x $build_bindir/monodis ]; then
> >> > --    monodis="$build_bindir/monodis"
> >> > -+if [ -x $build_bindir/monodis.bogus ]; then
> >> > -+    monodis="$build_bindir/monodis.bogus"
> >> > -     export
> LD_LIBRARY_PATH=$build_libdir${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
> >> > --elif [ -x /usr/bin/monodis ]; then
> >> > --    monodis="/usr/bin/monodis"
> >> > -+elif [ -x /usr/bin/monodis.bogus ]; then
> >> > -+    monodis="/usr/bin/monodis.bogus"
> >> > - else
> >> > -     exit 0;
> >> > - fi
> >> > diff --git
> a/meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
> b/meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
> >> > new file mode 100644
> >> > index 00000000000..9a5cd7c80dc
> >> > --- /dev/null
> >> > +++
> b/meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
> >> > @@ -0,0 +1,65 @@
> >> > +From 93c3c7f043f62e96941274e957c4ad9432032af1 Mon Sep 17 00:00:00
> 2001
> >> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> >> > +Date: Mon, 18 Nov 2019 16:22:56 +0100
> >> > +Subject: [PATCH] rpmfc.c: do not run file classification in parallel
> >> > +
> >> > +This is causing freezes with libmagic when the file in question is
> compressed:
> >> > +https://github.com/rpm-software-management/rpm/issues/756
> >> > +
> >> > +Upstream-Status: Inapppropriate [upstream wants a proper fix]
> >> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> > +---
> >> > + build/rpmfc.c | 8 --------
> >> > + 1 file changed, 8 deletions(-)
> >> > +
> >> > +diff --git a/build/rpmfc.c b/build/rpmfc.c
> >> > +index 3db7a9352..17afdd57a 100644
> >> > +--- a/build/rpmfc.c
> >> > ++++ b/build/rpmfc.c
> >> > +@@ -680,7 +680,6 @@ static void rpmfcAttributes(rpmfc fc, int ix,
> const char *ftype, const char *ful
> >> > +       /* Add attributes on libmagic type & path pattern matches */
> >> > +       if (matches(&(*attr)->incl, ftype, path, is_executable)) {
> >> > +           argvAddTokens(&fc->fattrs[ix], (*attr)->name);
> >> > +-          #pragma omp critical(fahash)
> >> > +           fattrHashAddEntry(fc->fahash, attr-fc->atypes, ix);
> >> > +       }
> >> > +     }
> >> > +@@ -1105,7 +1104,6 @@ rpmRC rpmfcClassify(rpmfc fc, ARGV_t argv,
> rpm_mode_t * fmode)
> >> > +     /* Build (sorted) file class dictionary. */
> >> > +     fc->cdict = rpmstrPoolCreate();
> >> > +
> >> > +-    #pragma omp parallel
> >> > +     {
> >> > +     /* libmagic is not thread-safe, each thread needs to a private
> handle */
> >> > +     magic_t ms = magic_open(msflags);
> >> > +@@ -1113,15 +1111,12 @@ rpmRC rpmfcClassify(rpmfc fc, ARGV_t argv,
> rpm_mode_t * fmode)
> >> > +     if (ms == NULL) {
> >> > +       rpmlog(RPMLOG_ERR, _("magic_open(0x%x) failed: %s\n"),
> >> > +               msflags, strerror(errno));
> >> > +-      #pragma omp cancel parallel
> >> > +     }
> >> > +
> >> > +     if (magic_load(ms, NULL) == -1) {
> >> > +       rpmlog(RPMLOG_ERR, _("magic_load failed: %s\n"),
> magic_error(ms));
> >> > +-      #pragma omp cancel parallel
> >> > +     }
> >> > +
> >> > +-    #pragma omp for ordered reduction(+:nerrors)
> >> > +     for (int ix = 0; ix < fc->nfiles; ix++) {
> >> > +       rpmsid ftypeId;
> >> > +       const char * ftype;
> >> > +@@ -1185,14 +1180,11 @@ rpmRC rpmfcClassify(rpmfc fc, ARGV_t argv,
> rpm_mode_t * fmode)
> >> > +       fc->fcolor[ix] = fcolor;
> >> > +
> >> > +       /* Add to file class dictionary and index array */
> >> > +-      #pragma omp ordered
> >> > +       if (fcolor != RPMFC_WHITE && (fcolor & RPMFC_INCLUDE)) {
> >> > +           ftypeId = rpmstrPoolId(fc->cdict, ftype, 1);
> >> > +-          #pragma omp atomic
> >> > +           fc->fknown++;
> >> > +       } else {
> >> > +           ftypeId = rpmstrPoolId(fc->cdict, "", 1);
> >> > +-          #pragma omp atomic
> >> > +           fc->fwhite++;
> >> > +       }
> >> > +       /* Pool id's start from 1, for headers we want it from 0 */
> >> > diff --git
> a/meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch
> b/meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch
> >> > deleted file mode 100644
> >> > index d10041c2e14..00000000000
> >> > ---
> a/meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch
> >> > +++ /dev/null
> >> > @@ -1,127 +0,0 @@
> >> > -From 513200cf76758de4668312c628d6362bdabfaf4b Mon Sep 17 00:00:00
> 2001
> >> > -From: Alexander Kanavin <alex.kanavin@gmail.com>
> >> > -Date: Thu, 25 May 2017 19:30:20 +0300
> >> > -Subject: [PATCH 1/3] Run binary package creation via thread pools.
> >> > -
> >> > -Upstream-Status: Submitted [
> https://github.com/rpm-software-management/rpm/pull/226]
> >> > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> > -
> >> > ----
> >> > - build/pack.c | 81
> +++++++++++++++++++++++++++++++++++++++++++++++++-----------
> >> > - configure.ac |  3 +++
> >> > - 2 files changed, 70 insertions(+), 14 deletions(-)
> >> > -
> >> > -diff --git a/build/pack.c b/build/pack.c
> >> > -index ccfd614cc..ed5b9ab4e 100644
> >> > ---- a/build/pack.c
> >> > -+++ b/build/pack.c
> >> > -@@ -616,25 +616,78 @@ static rpmRC packageBinary(rpmSpec spec,
> Package pkg, const char *cookie, int ch
> >> > -       return rc;
> >> > - }
> >> > -
> >> > --rpmRC packageBinaries(rpmSpec spec, const char *cookie, int
> cheating)
> >> > -+struct binaryPackageTaskData
> >> > - {
> >> > --    rpmRC rc;
> >> > -     Package pkg;
> >> > -+    char *filename;
> >> > -+    rpmRC result;
> >> > -+    struct binaryPackageTaskData *next;
> >> > -+};
> >> > -+
> >> > -+static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec
> spec, const char *cookie, int cheating)
> >> > -+{
> >> > -+    struct binaryPackageTaskData *tasks = NULL;
> >> > -+    struct binaryPackageTaskData *task = NULL;
> >> > -+    struct binaryPackageTaskData *prev = NULL;
> >> > -+
> >> > -+    for (Package pkg = spec->packages; pkg != NULL; pkg =
> pkg->next) {
> >> > -+        task = rcalloc(1, sizeof(*task));
> >> > -+        task->pkg = pkg;
> >> > -+        if (pkg == spec->packages) {
> >> > -+            // the first package needs to be processed ahead of
> others, as they copy
> >> > -+            // changelog data from it, and so otherwise data races
> would happen
> >> > -+            task->result = packageBinary(spec, pkg, cookie,
> cheating, &(task->filename));
> >> > -+            rpmlog(RPMLOG_NOTICE, _("Finished binary package job,
> result %d, filename %s\n"), task->result, task->filename);
> >> > -+            tasks = task;
> >> > -+        }
> >> > -+        if (prev != NULL) {
> >> > -+            prev->next = task;
> >> > -+        }
> >> > -+        prev = task;
> >> > -+    }
> >> > -+
> >> > -+    #pragma omp parallel
> >> > -+    #pragma omp single
> >> > -+    // re-declaring task variable is necessary, or older gcc
> versions will produce code that segfaults
> >> > -+    for (struct binaryPackageTaskData *task = tasks; task != NULL;
> task = task->next) {
> >> > -+        if (task != tasks)
> >> > -+        #pragma omp task
> >> > -+        {
> >> > -+            task->result = packageBinary(spec, task->pkg, cookie,
> cheating, &(task->filename));
> >> > -+            rpmlog(RPMLOG_NOTICE, _("Finished binary package job,
> result %d, filename %s\n"), task->result, task->filename);
> >> > -+        }
> >> > -+    }
> >> > -+
> >> > -+    return tasks;
> >> > -+}
> >> > -+
> >> > -+static void freeBinaryPackageTasks(struct binaryPackageTaskData*
> tasks)
> >> > -+{
> >> > -+    while (tasks != NULL) {
> >> > -+        struct binaryPackageTaskData* next = tasks->next;
> >> > -+        rfree(tasks->filename);
> >> > -+        rfree(tasks);
> >> > -+        tasks = next;
> >> > -+    }
> >> > -+}
> >> > -+
> >> > -+rpmRC packageBinaries(rpmSpec spec, const char *cookie, int
> cheating)
> >> > -+{
> >> > -     char *pkglist = NULL;
> >> > -
> >> > --    for (pkg = spec->packages; pkg != NULL; pkg = pkg->next) {
> >> > --      char *fn = NULL;
> >> > --      rc = packageBinary(spec, pkg, cookie, cheating, &fn);
> >> > --      if (rc == RPMRC_OK) {
> >> > --          rstrcat(&pkglist, fn);
> >> > --          rstrcat(&pkglist, " ");
> >> > --      }
> >> > --      free(fn);
> >> > --      if (rc != RPMRC_OK) {
> >> > --          pkglist = _free(pkglist);
> >> > --          return rc;
> >> > --      }
> >> > -+    struct binaryPackageTaskData *tasks =
> runBinaryPackageTasks(spec, cookie, cheating);
> >> > -+
> >> > -+    for (struct binaryPackageTaskData *task = tasks; task != NULL;
> task = task->next) {
> >> > -+        if (task->result == RPMRC_OK) {
> >> > -+            rstrcat(&pkglist, task->filename);
> >> > -+            rstrcat(&pkglist, " ");
> >> > -+        } else {
> >> > -+            _free(pkglist);
> >> > -+            freeBinaryPackageTasks(tasks);
> >> > -+            return RPMRC_FAIL;
> >> > -+        }
> >> > -     }
> >> > -+    freeBinaryPackageTasks(tasks);
> >> > -
> >> > -     /* Now check the package set if enabled */
> >> > -     if (pkglist != NULL) {
> >> > -diff --git a/configure.ac b/configure.ac
> >> > -index a506ec819..59fa0acaf 100644
> >> > ---- a/configure.ac
> >> > -+++ b/configure.ac
> >> > -@@ -17,6 +17,9 @@ AC_DISABLE_STATIC
> >> > -
> >> > - PKG_PROG_PKG_CONFIG
> >> > -
> >> > -+AC_OPENMP
> >> > -+RPMCFLAGS="$OPENMP_CFLAGS $RPMCFLAGS"
> >> > -+
> >> > - dnl Checks for programs.
> >> > - AC_PROG_CXX
> >> > - AC_PROG_AWK
> >> > ---
> >> > -2.11.0
> >> > -
> >> > diff --git
> a/meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch
> b/meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch
> >> > deleted file mode 100644
> >> > index c348ae5330e..00000000000
> >> > ---
> a/meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch
> >> > +++ /dev/null
> >> > @@ -1,207 +0,0 @@
> >> > -From c80892f17e44331206c8318d53b63bb6a99554d0 Mon Sep 17 00:00:00
> 2001
> >> > -From: Alexander Kanavin <alex.kanavin@gmail.com>
> >> > -Date: Tue, 30 May 2017 13:58:30 +0300
> >> > -Subject: [PATCH 3/4] rpmstrpool.c: make operations over string pools
> >> > - thread-safe
> >> > -
> >> > -Otherwise multithreaded rpm building explodes in various ways due
> >> > -to data races.
> >> > -
> >> > -Upstream-Status: Submitted [
> https://github.com/rpm-software-management/rpm/pull/226]
> >> > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> > -
> >> > ----
> >> > - rpmio/rpmstrpool.c | 56
> +++++++++++++++++++++++++++++++++++++++++++++---------
> >> > - 1 file changed, 47 insertions(+), 9 deletions(-)
> >> > -
> >> > -diff --git a/rpmio/rpmstrpool.c b/rpmio/rpmstrpool.c
> >> > -index 30a57eb10..58ba95a02 100644
> >> > ---- a/rpmio/rpmstrpool.c
> >> > -+++ b/rpmio/rpmstrpool.c
> >> > -@@ -113,6 +113,8 @@ static poolHash poolHashCreate(int numBuckets)
> >> > -     return ht;
> >> > - }
> >> > -
> >> > -+static const char * rpmstrPoolStrNoLock(rpmstrPool pool, rpmsid
> sid);
> >> > -+
> >> > - static void poolHashResize(rpmstrPool pool, int numBuckets)
> >> > - {
> >> > -     poolHash ht = pool->hash;
> >> > -@@ -120,7 +122,7 @@ static void poolHashResize(rpmstrPool pool, int
> numBuckets)
> >> > -
> >> > -     for (int i=0; i<ht->numBuckets; i++) {
> >> > -         if (!ht->buckets[i].keyid) continue;
> >> > --        unsigned int keyHash = rstrhash(rpmstrPoolStr(pool,
> ht->buckets[i].keyid));
> >> > -+        unsigned int keyHash = rstrhash(rpmstrPoolStrNoLock(pool,
> ht->buckets[i].keyid));
> >> > -         for (unsigned int j=0;;j++) {
> >> > -             unsigned int hash = hashbucket(keyHash, j) % numBuckets;
> >> > -             if (!buckets[hash].keyid) {
> >> > -@@ -149,7 +151,7 @@ static void poolHashAddHEntry(rpmstrPool pool,
> const char * key, unsigned int ke
> >> > -             ht->buckets[hash].keyid = keyid;
> >> > -             ht->keyCount++;
> >> > -             break;
> >> > --        } else if (!strcmp(rpmstrPoolStr(pool,
> ht->buckets[hash].keyid), key)) {
> >> > -+        } else if (!strcmp(rpmstrPoolStrNoLock(pool,
> ht->buckets[hash].keyid), key)) {
> >> > -             return;
> >> > -         }
> >> > -     }
> >> > -@@ -191,7 +193,7 @@ static void poolHashPrintStats(rpmstrPool pool)
> >> > -     int maxcollisions = 0;
> >> > -
> >> > -     for (i=0; i<ht->numBuckets; i++) {
> >> > --        unsigned int keyHash = rstrhash(rpmstrPoolStr(pool,
> ht->buckets[i].keyid));
> >> > -+        unsigned int keyHash = rstrhash(rpmstrPoolStrNoLock(pool,
> ht->buckets[i].keyid));
> >> > -         for (unsigned int j=0;;j++) {
> >> > -             unsigned int hash = hashbucket(keyHash, i) %
> ht->numBuckets;
> >> > -             if (hash==i) {
> >> > -@@ -221,7 +223,7 @@ static void rpmstrPoolRehash(rpmstrPool pool)
> >> > -
> >> > -     pool->hash = poolHashCreate(sizehint);
> >> > -     for (int i = 1; i <= pool->offs_size; i++)
> >> > --      poolHashAddEntry(pool, rpmstrPoolStr(pool, i), i);
> >> > -+      poolHashAddEntry(pool, rpmstrPoolStrNoLock(pool, i), i);
> >> > - }
> >> > -
> >> > - rpmstrPool rpmstrPoolCreate(void)
> >> > -@@ -245,6 +247,8 @@ rpmstrPool rpmstrPoolCreate(void)
> >> > -
> >> > - rpmstrPool rpmstrPoolFree(rpmstrPool pool)
> >> > - {
> >> > -+    #pragma omp critical(rpmstrpool)
> >> > -+    {
> >> > -     if (pool) {
> >> > -       if (pool->nrefs > 1) {
> >> > -           pool->nrefs--;
> >> > -@@ -260,18 +264,24 @@ rpmstrPool rpmstrPoolFree(rpmstrPool pool)
> >> > -           free(pool);
> >> > -       }
> >> > -     }
> >> > -+    }
> >> > -     return NULL;
> >> > - }
> >> > -
> >> > - rpmstrPool rpmstrPoolLink(rpmstrPool pool)
> >> > - {
> >> > -+    #pragma omp critical(rpmstrpool)
> >> > -+    {
> >> > -     if (pool)
> >> > -       pool->nrefs++;
> >> > -+    }
> >> > -     return pool;
> >> > - }
> >> > -
> >> > - void rpmstrPoolFreeze(rpmstrPool pool, int keephash)
> >> > - {
> >> > -+    #pragma omp critical(rpmstrpool)
> >> > -+    {
> >> > -     if (pool && !pool->frozen) {
> >> > -       if (!keephash) {
> >> > -           pool->hash = poolHashFree(pool->hash);
> >> > -@@ -281,16 +291,20 @@ void rpmstrPoolFreeze(rpmstrPool pool, int
> keephash)
> >> > -                             pool->offs_alloced *
> sizeof(*pool->offs));
> >> > -       pool->frozen = 1;
> >> > -     }
> >> > -+    }
> >> > - }
> >> > -
> >> > - void rpmstrPoolUnfreeze(rpmstrPool pool)
> >> > - {
> >> > -+    #pragma omp critical(rpmstrpool)
> >> > -+    {
> >> > -     if (pool) {
> >> > -       if (pool->hash == NULL) {
> >> > -           rpmstrPoolRehash(pool);
> >> > -       }
> >> > -       pool->frozen = 0;
> >> > -     }
> >> > -+    }
> >> > - }
> >> > -
> >> > - static rpmsid rpmstrPoolPut(rpmstrPool pool, const char *s, size_t
> slen, unsigned int hash)
> >> > -@@ -350,7 +364,7 @@ static rpmsid rpmstrPoolGet(rpmstrPool pool,
> const char * key, size_t keylen,
> >> > -             return 0;
> >> > -         }
> >> > -
> >> > --      s = rpmstrPoolStr(pool, ht->buckets[hash].keyid);
> >> > -+      s = rpmstrPoolStrNoLock(pool, ht->buckets[hash].keyid);
> >> > -       /* pool string could be longer than keylen, require exact
> matche */
> >> > -       if (strncmp(s, key, keylen) == 0 && s[keylen] == '\0')
> >> > -           return ht->buckets[hash].keyid;
> >> > -@@ -373,27 +387,31 @@ static inline rpmsid strn2id(rpmstrPool pool,
> const char *s, size_t slen,
> >> > - rpmsid rpmstrPoolIdn(rpmstrPool pool, const char *s, size_t slen,
> int create)
> >> > - {
> >> > -     rpmsid sid = 0;
> >> > --
> >> > -+    #pragma omp critical(rpmstrpool)
> >> > -+    {
> >> > -     if (s != NULL) {
> >> > -       unsigned int hash = rstrnhash(s, slen);
> >> > -       sid = strn2id(pool, s, slen, hash, create);
> >> > -     }
> >> > -+    }
> >> > -     return sid;
> >> > - }
> >> > -
> >> > - rpmsid rpmstrPoolId(rpmstrPool pool, const char *s, int create)
> >> > - {
> >> > -     rpmsid sid = 0;
> >> > --
> >> > -+    #pragma omp critical(rpmstrpool)
> >> > -+    {
> >> > -     if (s != NULL) {
> >> > -       size_t slen;
> >> > -       unsigned int hash = rstrlenhash(s, &slen);
> >> > -       sid = strn2id(pool, s, slen, hash, create);
> >> > -     }
> >> > -+    }
> >> > -     return sid;
> >> > - }
> >> > -
> >> > --const char * rpmstrPoolStr(rpmstrPool pool, rpmsid sid)
> >> > -+static const char * rpmstrPoolStrNoLock(rpmstrPool pool, rpmsid sid)
> >> > - {
> >> > -     const char *s = NULL;
> >> > -     if (pool && sid > 0 && sid <= pool->offs_size)
> >> > -@@ -401,12 +419,25 @@ const char * rpmstrPoolStr(rpmstrPool pool,
> rpmsid sid)
> >> > -     return s;
> >> > - }
> >> > -
> >> > -+const char * rpmstrPoolStr(rpmstrPool pool, rpmsid sid)
> >> > -+{
> >> > -+    const char *s = NULL;
> >> > -+    #pragma omp critical(rpmstrpool)
> >> > -+    {
> >> > -+    s = rpmstrPoolStrNoLock(pool, sid);
> >> > -+    }
> >> > -+    return s;
> >> > -+}
> >> > -+
> >> > - size_t rpmstrPoolStrlen(rpmstrPool pool, rpmsid sid)
> >> > - {
> >> > -     size_t slen = 0;
> >> > -+    #pragma omp critical(rpmstrpool)
> >> > -+    {
> >> > -     if (pool && sid > 0 && sid <= pool->offs_size) {
> >> > -       slen = strlen(pool->offs[sid]);
> >> > -     }
> >> > -+    }
> >> > -     return slen;
> >> > - }
> >> > -
> >> > -@@ -421,5 +452,12 @@ int rpmstrPoolStreq(rpmstrPool poolA, rpmsid
> sidA,
> >> > -
> >> > - rpmsid rpmstrPoolNumStr(rpmstrPool pool)
> >> > - {
> >> > --    return (pool != NULL) ? pool->offs_size : 0;
> >> > -+    rpmsid id = 0;
> >> > -+    #pragma omp critical(rpmstrpool)
> >> > -+    {
> >> > -+    if (pool) {
> >> > -+      id = pool->offs_size;
> >> > -+    }
> >> > -+    }
> >> > -+    return id;
> >> > - }
> >> > ---
> >> > -2.11.0
> >> > -
> >> > diff --git
> a/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
> b/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
> >> > deleted file mode 100644
> >> > index 652e30b3e4a..00000000000
> >> > ---
> a/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
> >> > +++ /dev/null
> >> > @@ -1,336 +0,0 @@
> >> > -From 792693bb90768cfde4898e8dd31ee1b5de803d2f Mon Sep 17 00:00:00
> 2001
> >> > -From: Alexander Kanavin <alex.kanavin@gmail.com>
> >> > -Date: Thu, 8 Jun 2017 17:08:09 +0300
> >> > -Subject: [PATCH] build/pack.c: remove static local variables from
> buildHost()
> >> > - and getBuildTime()
> >> > -
> >> > -Their use is causing difficult to diagnoze data races when building
> multiple
> >> > -packages in parallel, and is a bad idea in general, as it also makes
> it more
> >> > -difficult to reason about code.
> >> > -
> >> > -Upstream-Status: Submitted [
> https://github.com/rpm-software-management/rpm/pull/226]
> >> > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> > -
> >> > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> > -
> >> > ----
> >> > - build/build.c             | 54 ++++++++++++++++++++++++++++--
> >> > - build/pack.c              | 84
> +++++++++--------------------------------------
> >> > - build/rpmbuild_internal.h |  8 +++--
> >> > - 3 files changed, 74 insertions(+), 72 deletions(-)
> >> > -
> >> > -diff --git a/build/build.c b/build/build.c
> >> > -index 13c3df2..b154f08 100644
> >> > ---- a/build/build.c
> >> > -+++ b/build/build.c
> >> > -@@ -6,6 +6,8 @@
> >> > - #include "system.h"
> >> > -
> >> > - #include <errno.h>
> >> > -+#include <netdb.h>
> >> > -+#include <time.h>
> >> > - #include <sys/wait.h>
> >> > -
> >> > - #include <rpm/rpmlog.h>
> >> > -@@ -16,6 +18,50 @@
> >> > -
> >> > - #include "debug.h"
> >> > -
> >> > -+static rpm_time_t getBuildTime(void)
> >> > -+{
> >> > -+    rpm_time_t buildTime = 0;
> >> > -+    char *srcdate;
> >> > -+    time_t epoch;
> >> > -+    char *endptr;
> >> > -+
> >> > -+    srcdate = getenv("SOURCE_DATE_EPOCH");
> >> > -+    if (srcdate) {
> >> > -+        errno = 0;
> >> > -+        epoch = strtol(srcdate, &endptr, 10);
> >> > -+        if (srcdate == endptr || *endptr || errno != 0)
> >> > -+            rpmlog(RPMLOG_ERR, _("unable to parse
> SOURCE_DATE_EPOCH\n"));
> >> > -+        else
> >> > -+            buildTime = (int32_t) epoch;
> >> > -+    } else
> >> > -+        buildTime = (int32_t) time(NULL);
> >> > -+
> >> > -+    return buildTime;
> >> > -+}
> >> > -+
> >> > -+static char * buildHost(void)
> >> > -+{
> >> > -+    char* hostname;
> >> > -+    struct hostent *hbn;
> >> > -+    char *bhMacro;
> >> > -+
> >> > -+    bhMacro = rpmExpand("%{?_buildhost}", NULL);
> >> > -+    if (strcmp(bhMacro, "") != 0) {
> >> > -+        rasprintf(&hostname, "%s", bhMacro);
> >> > -+    } else {
> >> > -+        hostname = rcalloc(1024, sizeof(*hostname));
> >> > -+        (void) gethostname(hostname, 1024);
> >> > -+        hbn = gethostbyname(hostname);
> >> > -+        if (hbn)
> >> > -+            strcpy(hostname, hbn->h_name);
> >> > -+        else
> >> > -+            rpmlog(RPMLOG_WARNING,
> >> > -+                    _("Could not canonicalize hostname: %s\n"),
> hostname);
> >> > -+    }
> >> > -+    free(bhMacro);
> >> > -+    return(hostname);
> >> > -+}
> >> > -+
> >> > - /**
> >> > -  */
> >> > - static rpmRC doRmSource(rpmSpec spec)
> >> > -@@ -201,6 +247,9 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec
> spec, int what)
> >> > -     rpmRC rc = RPMRC_OK;
> >> > -     int test = (what & RPMBUILD_NOBUILD);
> >> > -     char *cookie = buildArgs->cookie ? xstrdup(buildArgs->cookie) :
> NULL;
> >> > -+    const char* host = buildHost();
> >> > -+    rpm_time_t buildTime = getBuildTime();
> >> > -+
> >> > -
> >> > -     if (rpmExpandNumeric("%{?source_date_epoch_from_changelog}") &&
> >> > -       getenv("SOURCE_DATE_EPOCH") == NULL) {
> >> > -@@ -269,11 +318,11 @@ static rpmRC buildSpec(BTA_t buildArgs,
> rpmSpec spec, int what)
> >> > -               goto exit;
> >> > -
> >> > -       if (((what & RPMBUILD_PACKAGESOURCE) && !test) &&
> >> > --          (rc = packageSources(spec, &cookie)))
> >> > -+          (rc = packageSources(spec, &cookie, buildTime, host)))
> >> > -               goto exit;
> >> > -
> >> > -       if (((what & RPMBUILD_PACKAGEBINARY) && !test) &&
> >> > --          (rc = packageBinaries(spec, cookie, (didBuild == 0))))
> >> > -+          (rc = packageBinaries(spec, cookie, (didBuild == 0),
> buildTime, host)))
> >> > -               goto exit;
> >> > -
> >> > -       if ((what & RPMBUILD_CLEAN) &&
> >> > -@@ -293,6 +342,7 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec
> spec, int what)
> >> > -       (void) unlink(spec->specFile);
> >> > -
> >> > - exit:
> >> > -+    free(host);
> >> > -     free(cookie);
> >> > -     spec->rootDir = NULL;
> >> > -     if (rc != RPMRC_OK && rpmlogGetNrecs() > 0) {
> >> > -diff --git a/build/pack.c b/build/pack.c
> >> > -index df15876..17a4b09 100644
> >> > ---- a/build/pack.c
> >> > -+++ b/build/pack.c
> >> > -@@ -6,8 +6,6 @@
> >> > - #include "system.h"
> >> > -
> >> > - #include <errno.h>
> >> > --#include <netdb.h>
> >> > --#include <time.h>
> >> > - #include <sys/wait.h>
> >> > -
> >> > - #include <rpm/rpmlib.h>                       /* RPMSIGTAG*,
> rpmReadPackageFile */
> >> > -@@ -152,57 +150,6 @@ exit:
> >> > -     return rc;
> >> > - }
> >> > -
> >> > --static rpm_time_t * getBuildTime(void)
> >> > --{
> >> > --    static rpm_time_t buildTime[1];
> >> > --    char *srcdate;
> >> > --    time_t epoch;
> >> > --    char *endptr;
> >> > --
> >> > --    if (buildTime[0] == 0) {
> >> > --        srcdate = getenv("SOURCE_DATE_EPOCH");
> >> > --        if (srcdate) {
> >> > --            errno = 0;
> >> > --            epoch = strtol(srcdate, &endptr, 10);
> >> > --            if (srcdate == endptr || *endptr || errno != 0)
> >> > --                rpmlog(RPMLOG_ERR, _("unable to parse
> SOURCE_DATE_EPOCH\n"));
> >> > --            else
> >> > --                buildTime[0] = (int32_t) epoch;
> >> > --        } else
> >> > --            buildTime[0] = (int32_t) time(NULL);
> >> > --    }
> >> > --
> >> > --    return buildTime;
> >> > --}
> >> > --
> >> > --static const char * buildHost(void)
> >> > --{
> >> > --    static char hostname[1024];
> >> > --    static int oneshot = 0;
> >> > --    struct hostent *hbn;
> >> > --    char *bhMacro;
> >> > --
> >> > --    if (! oneshot) {
> >> > --        bhMacro = rpmExpand("%{?_buildhost}", NULL);
> >> > --        if (strcmp(bhMacro, "") != 0 && strlen(bhMacro) < 1024) {
> >> > --            strcpy(hostname, bhMacro);
> >> > --        } else {
> >> > --            if (strcmp(bhMacro, "") != 0)
> >> > --                rpmlog(RPMLOG_WARNING, _("The _buildhost macro is
> too long\n"));
> >> > --            (void) gethostname(hostname, sizeof(hostname));
> >> > --            hbn = gethostbyname(hostname);
> >> > --            if (hbn)
> >> > --                strcpy(hostname, hbn->h_name);
> >> > --            else
> >> > --                rpmlog(RPMLOG_WARNING,
> >> > --                        _("Could not canonicalize hostname: %s\n"),
> hostname);
> >> > --        }
> >> > --        free(bhMacro);
> >> > --        oneshot = 1;
> >> > --    }
> >> > --    return(hostname);
> >> > --}
> >> > --
> >> > - static rpmRC processScriptFiles(rpmSpec spec, Package pkg)
> >> > - {
> >> > -     struct TriggerFileEntry *p;
> >> > -@@ -476,7 +423,8 @@ exit:
> >> > -  * order to how the RPM format is laid on disk.
> >> > -  */
> >> > - static rpmRC writeRPM(Package pkg, unsigned char ** pkgidp,
> >> > --                    const char *fileName, char **cookie)
> >> > -+                    const char *fileName, char **cookie,
> >> > -+                    rpm_time_t buildTime, const char* buildHost)
> >> > - {
> >> > -     FD_t fd = NULL;
> >> > -     char * rpmio_flags = NULL;
> >> > -@@ -500,7 +448,7 @@ static rpmRC writeRPM(Package pkg, unsigned char
> ** pkgidp,
> >> > -
> >> > -     /* Create and add the cookie */
> >> > -     if (cookie) {
> >> > --      rasprintf(cookie, "%s %d", buildHost(), (int)
> (*getBuildTime()));
> >> > -+      rasprintf(cookie, "%s %d", buildHost, buildTime);
> >> > -       headerPutString(pkg->header, RPMTAG_COOKIE, *cookie);
> >> > -     }
> >> > -
> >> > -@@ -641,7 +589,7 @@ static rpmRC checkPackages(char *pkgcheck)
> >> > -     return RPMRC_OK;
> >> > - }
> >> > -
> >> > --static rpmRC packageBinary(rpmSpec spec, Package pkg, const char
> *cookie, int cheating, char** filename)
> >> > -+static rpmRC packageBinary(rpmSpec spec, Package pkg, const char
> *cookie, int cheating, char** filename, rpm_time_t buildTime, const char*
> buildHost)
> >> > - {
> >> > -       const char *errorString;
> >> > -       rpmRC rc = RPMRC_OK;
> >> > -@@ -660,8 +608,8 @@ static rpmRC packageBinary(rpmSpec spec, Package
> pkg, const char *cookie, int ch
> >> > -       headerCopyTags(spec->packages->header, pkg->header, copyTags);
> >> > -
> >> > -       headerPutString(pkg->header, RPMTAG_RPMVERSION, VERSION);
> >> > --      headerPutString(pkg->header, RPMTAG_BUILDHOST, buildHost());
> >> > --      headerPutUint32(pkg->header, RPMTAG_BUILDTIME,
> getBuildTime(), 1);
> >> > -+      headerPutString(pkg->header, RPMTAG_BUILDHOST, buildHost);
> >> > -+      headerPutUint32(pkg->header, RPMTAG_BUILDTIME, &buildTime, 1);
> >> > -
> >> > -       if (spec->sourcePkgId != NULL) {
> >> > -           headerPutBin(pkg->header, RPMTAG_SOURCEPKGID,
> spec->sourcePkgId,16);
> >> > -@@ -699,7 +647,7 @@ static rpmRC packageBinary(rpmSpec spec, Package
> pkg, const char *cookie, int ch
> >> > -           free(binRpm);
> >> > -       }
> >> > -
> >> > --      rc = writeRPM(pkg, NULL, *filename, NULL);
> >> > -+      rc = writeRPM(pkg, NULL, *filename, NULL, buildTime,
> buildHost);
> >> > -       if (rc == RPMRC_OK) {
> >> > -           /* Do check each written package if enabled */
> >> > -           char *pkgcheck = rpmExpand("%{?_build_pkgcheck} ",
> *filename, NULL);
> >> > -@@ -719,7 +667,7 @@ struct binaryPackageTaskData
> >> > -     struct binaryPackageTaskData *next;
> >> > - };
> >> > -
> >> > --static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec
> spec, const char *cookie, int cheating)
> >> > -+static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec
> spec, const char *cookie, int cheating, rpm_time_t buildTime, char*
> buildHost)
> >> > - {
> >> > -     struct binaryPackageTaskData *tasks = NULL;
> >> > -     struct binaryPackageTaskData *task = NULL;
> >> > -@@ -731,7 +679,7 @@ static struct binaryPackageTaskData*
> runBinaryPackageTasks(rpmSpec spec, const c
> >> > -         if (pkg == spec->packages) {
> >> > -             // the first package needs to be processed ahead of
> others, as they copy
> >> > -             // changelog data from it, and so otherwise data races
> would happen
> >> > --            task->result = packageBinary(spec, pkg, cookie,
> cheating, &(task->filename));
> >> > -+            task->result = packageBinary(spec, pkg, cookie,
> cheating, &(task->filename), buildTime, buildHost);
> >> > -             rpmlog(RPMLOG_NOTICE, _("Finished binary package job,
> result %d, filename %s\n"), task->result, task->filename);
> >> > -             tasks = task;
> >> > -         }
> >> > -@@ -748,7 +696,7 @@ static struct binaryPackageTaskData*
> runBinaryPackageTasks(rpmSpec spec, const c
> >> > -         if (task != tasks)
> >> > -         #pragma omp task
> >> > -         {
> >> > --            task->result = packageBinary(spec, task->pkg, cookie,
> cheating, &(task->filename));
> >> > -+            task->result = packageBinary(spec, task->pkg, cookie,
> cheating, &(task->filename), buildTime, buildHost);
> >> > -             rpmlog(RPMLOG_NOTICE, _("Finished binary package job,
> result %d, filename %s\n"), task->result, task->filename);
> >> > -         }
> >> > -     }
> >> > -@@ -766,11 +714,11 @@ static void freeBinaryPackageTasks(struct
> binaryPackageTaskData* tasks)
> >> > -     }
> >> > - }
> >> > -
> >> > --rpmRC packageBinaries(rpmSpec spec, const char *cookie, int
> cheating)
> >> > -+rpmRC packageBinaries(rpmSpec spec, const char *cookie, int
> cheating, rpm_time_t buildTime, char* buildHost)
> >> > - {
> >> > -     char *pkglist = NULL;
> >> > -
> >> > --    struct binaryPackageTaskData *tasks =
> runBinaryPackageTasks(spec, cookie, cheating);
> >> > -+    struct binaryPackageTaskData *tasks =
> runBinaryPackageTasks(spec, cookie, cheating, buildTime, buildHost);
> >> > -
> >> > -     for (struct binaryPackageTaskData *task = tasks; task != NULL;
> task = task->next) {
> >> > -         if (task->result == RPMRC_OK) {
> >> > -@@ -797,7 +745,7 @@ rpmRC packageBinaries(rpmSpec spec, const char
> *cookie, int cheating)
> >> > -     return RPMRC_OK;
> >> > - }
> >> > -
> >> > --rpmRC packageSources(rpmSpec spec, char **cookie)
> >> > -+rpmRC packageSources(rpmSpec spec, char **cookie, rpm_time_t
> buildTime, char* buildHost)
> >> > - {
> >> > -     Package sourcePkg = spec->sourcePackage;
> >> > -     rpmRC rc;
> >> > -@@ -805,8 +753,8 @@ rpmRC packageSources(rpmSpec spec, char **cookie)
> >> > -
> >> > -     /* Add some cruft */
> >> > -     headerPutString(sourcePkg->header, RPMTAG_RPMVERSION, VERSION);
> >> > --    headerPutString(sourcePkg->header, RPMTAG_BUILDHOST,
> buildHost());
> >> > --    headerPutUint32(sourcePkg->header, RPMTAG_BUILDTIME,
> getBuildTime(), 1);
> >> > -+    headerPutString(sourcePkg->header, RPMTAG_BUILDHOST, buildHost);
> >> > -+    headerPutUint32(sourcePkg->header, RPMTAG_BUILDTIME,
> &buildTime, 1);
> >> > -     headerPutUint32(sourcePkg->header, RPMTAG_SOURCEPACKAGE, &one,
> 1);
> >> > -
> >> > -     /* XXX this should be %_srpmdir */
> >> > -@@ -814,7 +762,7 @@ rpmRC packageSources(rpmSpec spec, char **cookie)
> >> > -       char *pkgcheck = rpmExpand("%{?_build_pkgcheck_srpm} ", fn,
> NULL);
> >> > -
> >> > -       spec->sourcePkgId = NULL;
> >> > --      rc = writeRPM(sourcePkg, &spec->sourcePkgId, fn, cookie);
> >> > -+      rc = writeRPM(sourcePkg, &spec->sourcePkgId, fn, cookie,
> buildTime, buildHost);
> >> > -
> >> > -       /* Do check SRPM package if enabled */
> >> > -       if (rc == RPMRC_OK && pkgcheck[0] != ' ') {
> >> > -diff --git a/build/rpmbuild_internal.h b/build/rpmbuild_internal.h
> >> > -index 439b7d3..07e8338 100644
> >> > ---- a/build/rpmbuild_internal.h
> >> > -+++ b/build/rpmbuild_internal.h
> >> > -@@ -427,19 +427,23 @@ rpmRC processSourceFiles(rpmSpec spec,
> rpmBuildPkgFlags pkgFlags);
> >> > -  * @param spec                spec file control structure
> >> > -  * @param cookie      build identifier "cookie" or NULL
> >> > -  * @param cheating    was build shortcircuited?
> >> > -+ * @param buildTime   the build timestamp that goes into packages
> >> > -+ * @param buildHost   the hostname where the build is happening
> >> > -  * @return            RPMRC_OK on success
> >> > -  */
> >> > - RPM_GNUC_INTERNAL
> >> > --rpmRC packageBinaries(rpmSpec spec, const char *cookie, int
> cheating);
> >> > -+rpmRC packageBinaries(rpmSpec spec, const char *cookie, int
> cheating, rpm_time_t buildTime, char* buildHost);
> >> > -
> >> > - /** \ingroup rpmbuild
> >> > -  * Generate source package.
> >> > -  * @param spec                spec file control structure
> >> > -  * @retval cookie     build identifier "cookie" or NULL
> >> > -+ * @param buildTime   the build timestamp that goes into packages
> >> > -+ * @param buildHost   the hostname where the build is happening
> >> > -  * @return            RPMRC_OK on success
> >> > -  */
> >> > - RPM_GNUC_INTERNAL
> >> > --rpmRC packageSources(rpmSpec spec, char **cookie);
> >> > -+rpmRC packageSources(rpmSpec spec, char **cookie, rpm_time_t
> buildTime, char* buildHost);
> >> > -
> >> > - RPM_GNUC_INTERNAL
> >> > - int addLangTag(rpmSpec spec, Header h, rpmTagVal tag,
> >> > diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
> >> > similarity index 91%
> >> > rename from meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> >> > rename to meta/recipes-devtools/rpm/rpm_4.15.1.bb
> >> > index c37330eb4c6..4fa2d764fb9 100644
> >> > --- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> >> > +++ b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
> >> > @@ -24,7 +24,7 @@ HOMEPAGE = "http://www.rpm.org"
> >> >  LICENSE = "GPL-2.0"
> >> >  LIC_FILES_CHKSUM =
> "file://COPYING;md5=c0bf017c0fd1920e6158a333acabfd4a"
> >> >
> >> > -SRC_URI = "git://
> github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
> >> > +SRC_URI = "git://
> github.com/rpm-software-management/rpm;branch=rpm-4.15.x \
> >> >
>  file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
> >> >             file://0001-Do-not-read-config-files-from-HOME.patch \
> >> >
>  file://0001-When-cross-installing-execute-package-scriptlets-wit.patch \
> >> > @@ -34,18 +34,14 @@ SRC_URI = "git://
> github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
> >> >             file://0001-Fix-build-with-musl-C-library.patch \
> >> >
>  file://0001-Add-a-color-setting-for-mips64_n32-binaries.patch \
> >> >
>  file://0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch \
> >> > -
>  file://0001-Split-binary-package-building-into-a-separate-functi.patch \
> >> > -
>  file://0002-Run-binary-package-creation-via-thread-pools.patch \
> >> > -
>  file://0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch \
> >> > -
>  file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
> >> >             file://0001-perl-disable-auto-reqs.patch \
> >> >
>  file://0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch \
> >> >
>  file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
> >> > -
>  file://0001-mono-find-provides-requires-do-not-use-monodis-from-.patch \
> >> > +
>  file://0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch \
> >> >             "
> >> >
> >> >  PE = "1"
> >> > -SRCREV = "4a9440006398646583f0d9ae1837dad2875013aa"
> >> > +SRCREV = "ab2179452c5be276a6b96c591afded485c7e58c3"
> >> >
> >> >  S = "${WORKDIR}/git"
> >> >
> >> > @@ -125,8 +121,7 @@ do_install_append () {
> >> >             ${D}/${libdir}/rpm/macros
> >> >
> >> >         sed -i -e 's|/usr/bin/python|${USRBINPATH}/env ${PYTHON_PN}|'
> \
> >> > -           ${D}${libdir}/rpm/pythondistdeps.py \
> >> > -           ${D}${libdir}/rpm/python-macro-helper
> >> > +           ${D}${libdir}/rpm/pythondistdeps.py
> >> >  }
> >> >
> >> >  FILES_${PN} += "${libdir}/rpm-plugins/*.so \
> >> > --
> >> > 2.17.1
> >> >
> >> > --
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000003b8cbd05982e52d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have reproduced it with gcc and musl. The omp.h is =
in a non-standard location in recipe-sysroot/usr/lib, which works ok with g=
libc, but breaks with musl. How gcc is able to find it (or not) is too arca=
ne for my knowledge :(<br></div><div><br></div><div>I added --disable-openm=
p for musl; the major use for openmp is to speed up native rpm packaging. O=
n target it matters less hopefully.<br></div><div><br></div><div>Alex<br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Mon, 25 Nov 2019 at 16:50, Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Nov 25, 2019 at 7:19 =
AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; omp.h is coming from gcc-runtime. Which compiler are you using? Probab=
ly an override (specific for that compiler) is needed.<br>
<br>
if you looked into logs then you must have noticed its clang. I was<br>
wonder is openMP a hard dependency<br>
for rpm now, which might be interesting for architectures like mips and ppc=
.<br>
<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Sat, 23 Nov 2019 at 18:48, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; breaks with needing openmp<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"http://errors.yoctoproject.org/Errors/Details/282827/" =
rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/=
Details/282827/</a><br>
&gt;&gt;<br>
&gt;&gt; perhaps needs explicit dependency on libgomp now ?<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Nov 19, 2019 at 5:26 AM Alexander Kanavin<br>
&gt;&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">al=
ex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Drop patches that were merged upstream.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; 0001-mono-find-provides-requires-do-not-use-monodis-from-.pat=
ch<br>
&gt;&gt; &gt; modifies a file that was removed upstream.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Add a 0001-rpmfc.c-do-not-run-file-classification-in-parallel=
.patch<br>
&gt;&gt; &gt; as unfortunately the new parallel file classification feature=
 from<br>
&gt;&gt; &gt; upstream trips over somewhere in libmagic when inspected file=
s are<br>
&gt;&gt; &gt; compressed:<br>
&gt;&gt; &gt; <a href=3D"https://github.com/rpm-software-management/rpm/iss=
ues/756" rel=3D"noreferrer" target=3D"_blank">https://github.com/rpm-softwa=
re-management/rpm/issues/756</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.k=
anavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 ...satisfiable-dependency-when-building.patch |=C2=A0 2=
8 +-<br>
&gt;&gt; &gt;=C2=A0 ...lib-rpm-as-the-installation-path-for.patch |=C2=A0 1=
4 +-<br>
&gt;&gt; &gt;=C2=A0 ...kage-building-into-a-separate-functi.patch |=C2=A0 8=
4 -----<br>
&gt;&gt; &gt;=C2=A0 ...es-requires-do-not-use-monodis-from-.patch |=C2=A0 5=
8 ---<br>
&gt;&gt; &gt;=C2=A0 ...-run-file-classification-in-parallel.patch |=C2=A0 6=
5 ++++<br>
&gt;&gt; &gt;=C2=A0 ...ry-package-creation-via-thread-pools.patch | 127 ---=
----<br>
&gt;&gt; &gt;=C2=A0 ...e-operations-over-string-pools-threa.patch | 207 ---=
--------<br>
&gt;&gt; &gt;=C2=A0 ...ove-static-local-variables-from-buil.patch | 336 ---=
---------------<br>
&gt;&gt; &gt;=C2=A0 .../rpm/{<a href=3D"http://rpm_4.14.2.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">rpm_4.14.2.1.bb</a> =3D&gt; <a href=3D"http://rpm=
_4.15.1.bb" rel=3D"noreferrer" target=3D"_blank">rpm_4.15.1.bb</a>}=C2=A0 =
=C2=A0 |=C2=A0 13 +-<br>
&gt;&gt; &gt;=C2=A0 9 files changed, 89 insertions(+), 843 deletions(-)<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/rpm/files/0001=
-Split-binary-package-building-into-a-separate-functi.patch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/rpm/files/0001=
-mono-find-provides-requires-do-not-use-monodis-from-.patch<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/rpm/files/0001=
-rpmfc.c-do-not-run-file-classification-in-parallel.patch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/rpm/files/0002=
-Run-binary-package-creation-via-thread-pools.patch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/rpm/files/0003=
-rpmstrpool.c-make-operations-over-string-pools-threa.patch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/rpm/files/0004=
-build-pack.c-remove-static-local-variables-from-buil.patch<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/rpm/{<a href=3D"http://rpm=
_4.14.2.1.bb" rel=3D"noreferrer" target=3D"_blank">rpm_4.14.2.1.bb</a> =3D&=
gt; <a href=3D"http://rpm_4.15.1.bb" rel=3D"noreferrer" target=3D"_blank">r=
pm_4.15.1.bb</a>} (91%)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-add-=
an-unsatisfiable-dependency-when-building.patch b/meta/recipes-devtools/rpm=
/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch<br>
&gt;&gt; &gt; index 80e2f0fad70..4029233fb70 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsa=
tisfiable-dependency-when-building.patch<br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsa=
tisfiable-dependency-when-building.patch<br>
&gt;&gt; &gt; @@ -1,4 +1,4 @@<br>
&gt;&gt; &gt; -From 87cfc0db1ed6fe381a5ed5f0016d8c3344a31a11 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; +From f39c28eb52f12ae6e82db360ffd5a903ac8faca5 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kana=
vin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 Date: Mon, 9 Jan 2017 18:52:11 +0200<br>
&gt;&gt; &gt;=C2=A0 Subject: [PATCH] Do not add an unsatisfiable dependency=
 when building rpms in<br>
&gt;&gt; &gt; @@ -9,25 +9,23 @@ hand produces rpms that way by design.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 Upstream-Status: Inappropriate [oe-core specific]<br>
&gt;&gt; &gt;=C2=A0 Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br=
>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 ---<br>
&gt;&gt; &gt;=C2=A0 =C2=A0build/pack.c | 4 ----<br>
&gt;&gt; &gt;=C2=A0 =C2=A01 file changed, 4 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 diff --git a/build/pack.c b/build/pack.c<br>
&gt;&gt; &gt; -index 1261cdbba..bb2d6f4f6 100644<br>
&gt;&gt; &gt; +index e6cec1816..810cd7351 100644<br>
&gt;&gt; &gt;=C2=A0 --- a/build/pack.c<br>
&gt;&gt; &gt;=C2=A0 +++ b/build/pack.c<br>
&gt;&gt; &gt; -@@ -595,10 +595,6 @@ rpmRC packageBinaries(rpmSpec spec, con=
st char *cookie, int cheating)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0headerPutBin(pkg-&g=
t;header, RPMTAG_SOURCEPKGID, spec-&gt;sourcePkgId,16);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; +@@ -724,10 +724,6 @@ static rpmRC packageBinary(rpmSpec spec=
, Package pkg, const char *cookie, int ch<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0headerPutBin(pkg-&gt;header, RPMT=
AG_SOURCEPKGID, spec-&gt;sourcePkgId,16);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 if (cheating) {<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 (void) rpmlibNeedsFeature(pkg, &quot;S=
hortCircuited&quot;, &quot;4.9.0-1&quot;);<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; +-<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if ((rc =3D getPkgFilename(pkg-&gt;heade=
r, filename)))<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return rc;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 if (cheating) {<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) rpmlibNeedsFeatur=
e(pkg, &quot;ShortCircuited&quot;, &quot;4.9.0-1&quot;);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0char *binFormat =3D=
 rpmGetPath(&quot;%{_rpmfilename}&quot;, NULL);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *binRpm, *binD=
ir;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0binRpm =3D headerFo=
rmat(pkg-&gt;header, binFormat, &amp;errorString);<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt; -2.11.0<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hard=
code-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm=
/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch<br>
&gt;&gt; &gt; index 82e7328757f..52440d68180 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-li=
b-rpm-as-the-installation-path-for.patch<br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-li=
b-rpm-as-the-installation-path-for.patch<br>
&gt;&gt; &gt; @@ -1,4 +1,4 @@<br>
&gt;&gt; &gt; -From bd08eb0ae1312f347f49949481daa7c923752df2 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; +From 2f3d1619b6510bc131c4375827caf912559f0fa2 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kana=
vin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 Date: Mon, 27 Feb 2017 09:43:30 +0200<br>
&gt;&gt; &gt;=C2=A0 Subject: [PATCH] Do not hardcode &quot;lib/rpm&quot; as=
 the installation path for<br>
&gt;&gt; &gt; @@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.=
com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A03 files changed, 4 insertions(+), 4 deletions(-)<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 diff --git a/<a href=3D"http://configure.ac" rel=3D"nor=
eferrer" target=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.a=
c" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt;&gt; &gt; -index 09af7c4..9bd6903 100644<br>
&gt;&gt; &gt; +index d3aeab86e..1a1f3f91f 100644<br>
&gt;&gt; &gt;=C2=A0 --- a/<a href=3D"http://configure.ac" rel=3D"noreferrer=
" target=3D"_blank">configure.ac</a><br>
&gt;&gt; &gt;=C2=A0 +++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer=
" target=3D"_blank">configure.ac</a><br>
&gt;&gt; &gt; -@@ -1055,7 +1055,7 @@ else<br>
&gt;&gt; &gt; +@@ -1086,7 +1086,7 @@ else<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0usrprefix=3D$prefix<br>
&gt;&gt; &gt;=C2=A0 =C2=A0fi<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -27,10 +27,10 @@ index 09af7c4..9bd6903 100644<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0AC_SUBST(OBJDUMP)<br>
&gt;&gt; &gt;=C2=A0 diff --git a/<a href=3D"http://macros.in" rel=3D"norefe=
rrer" target=3D"_blank">macros.in</a> b/<a href=3D"http://macros.in" rel=3D=
"noreferrer" target=3D"_blank">macros.in</a><br>
&gt;&gt; &gt; -index a3aa7a9..62cee5c 100644<br>
&gt;&gt; &gt; +index fe9803aad..d128675bf 100644<br>
&gt;&gt; &gt;=C2=A0 --- a/<a href=3D"http://macros.in" rel=3D"noreferrer" t=
arget=3D"_blank">macros.in</a><br>
&gt;&gt; &gt;=C2=A0 +++ b/<a href=3D"http://macros.in" rel=3D"noreferrer" t=
arget=3D"_blank">macros.in</a><br>
&gt;&gt; &gt; -@@ -970,7 +970,7 @@ package or when debugging this package.\=
<br>
&gt;&gt; &gt; +@@ -985,7 +985,7 @@ package or when debugging this package.\=
<br>
&gt;&gt; &gt;=C2=A0 =C2=A0%_sharedstatedir=C2=A0 =C2=A0 =C2=A0 %{_prefix}/c=
om<br>
&gt;&gt; &gt;=C2=A0 =C2=A0%_localstatedir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0%{_prefix}/var<br>
&gt;&gt; &gt;=C2=A0 =C2=A0%_lib=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0lib<br>
&gt;&gt; &gt; @@ -40,7 +40,7 @@ index a3aa7a9..62cee5c 100644<br>
&gt;&gt; &gt;=C2=A0 =C2=A0%_infodir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0%{_datadir}/info<br>
&gt;&gt; &gt;=C2=A0 =C2=A0%_mandir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 %{_datadir}/man<br>
&gt;&gt; &gt;=C2=A0 diff --git a/<a href=3D"http://rpm.am" rel=3D"noreferre=
r" target=3D"_blank">rpm.am</a> b/<a href=3D"http://rpm.am" rel=3D"noreferr=
er" target=3D"_blank">rpm.am</a><br>
&gt;&gt; &gt; -index 82c2d7c..6341b51 100644<br>
&gt;&gt; &gt; +index 40b4ec55f..3139ce8f6 100644<br>
&gt;&gt; &gt;=C2=A0 --- a/<a href=3D"http://rpm.am" rel=3D"noreferrer" targ=
et=3D"_blank">rpm.am</a><br>
&gt;&gt; &gt;=C2=A0 +++ b/<a href=3D"http://rpm.am" rel=3D"noreferrer" targ=
et=3D"_blank">rpm.am</a><br>
&gt;&gt; &gt;=C2=A0 @@ -1,10 +1,10 @@<br>
&gt;&gt; &gt; @@ -55,4 +55,4 @@ index 82c2d7c..6341b51 100644<br>
&gt;&gt; &gt;=C2=A0 +rpmconfigdir =3D $(libdir)/rpm<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0# Libtool version (current-revision-age) for all =
our libraries<br>
&gt;&gt; &gt; - rpm_version_info =3D 9:0:1<br>
&gt;&gt; &gt; + rpm_version_info =3D 9:1:0<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0001-Split-binar=
y-package-building-into-a-separate-functi.patch b/meta/recipes-devtools/rpm=
/files/0001-Split-binary-package-building-into-a-separate-functi.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 6e44f0b7fc9..00000000000<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/rpm/files/0001-Split-binary-packa=
ge-building-into-a-separate-functi.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,84 +0,0 @@<br>
&gt;&gt; &gt; -From 721a660a507d6d062e7aecafad886c643970a5d5 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; &gt; -Date: Thu, 25 May 2017 18:15:27 +0300<br>
&gt;&gt; &gt; -Subject: [PATCH 1/4] Split binary package building into a se=
parate function<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -So that it can be run as a thread pool task.<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Upstream-Status: Submitted [<a href=3D"https://github.com/rp=
m-software-management/rpm/pull/226" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/rpm-software-management/rpm/pull/226</a>]<br>
&gt;&gt; &gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.=
kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - build/pack.c | 33 +++++++++++++++++++++------------<br>
&gt;&gt; &gt; - 1 file changed, 21 insertions(+), 12 deletions(-)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/build/pack.c b/build/pack.c<br>
&gt;&gt; &gt; -index 518f4e92a..ccfd614cc 100644<br>
&gt;&gt; &gt; ---- a/build/pack.c<br>
&gt;&gt; &gt; -+++ b/build/pack.c<br>
&gt;&gt; &gt; -@@ -546,18 +546,13 @@ static rpmRC checkPackages(char *pkgch=
eck)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return RPMRC_OK;<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --rpmRC packageBinaries(rpmSpec spec, const char *cookie, int=
 cheating)<br>
&gt;&gt; &gt; -+static rpmRC packageBinary(rpmSpec spec, Package pkg, const=
 char *cookie, int cheating, char** filename)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 rpmRC rc;<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 const char *errorString;<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 Package pkg;<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 char *pkglist =3D NULL;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 for (pkg =3D spec-&gt;packages; pkg !=3D NULL=
; pkg =3D pkg-&gt;next) {<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 char *fn;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 const char *errorString;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 rpmRC rc =3D RPMRC_OK;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pkg-&gt;fileList =3D=3D NULL)=
<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return rc;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((rc =3D processScriptFiles(sp=
ec, pkg)))<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return rc;<br>
&gt;&gt; &gt; -@@ -587,7 +582,7 @@ rpmRC packageBinaries(rpmSpec spec, cons=
t char *cookie, int cheating)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 headerGetString(pkg-&gt;header, RPMTAG_NAME), errorString);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retur=
n RPMRC_FAIL;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn =3D rpmGetPath(&quot;=
%{_rpmdir}/&quot;, binRpm, NULL);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *filename =3D rpmGetPath=
(&quot;%{_rpmdir}/&quot;, binRpm, NULL);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((binDir =3D str=
chr(binRpm, &#39;/&#39;)) !=3D NULL) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struc=
t stat st;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char =
*dn;<br>
&gt;&gt; &gt; -@@ -609,14 +604,28 @@ rpmRC packageBinaries(rpmSpec spec, co=
nst char *cookie, int cheating)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(binRpm);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 rc =3D writeRPM(pkg, NULL, fn, NULL);<=
br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 rc =3D writeRPM(pkg, NULL, *filename, =
NULL);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc =3D=3D RPMRC_OK) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Do check each wr=
itten package if enabled */<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *pkgcheck =3D rpmEx=
pand(&quot;%{?_build_pkgcheck} &quot;, fn, NULL);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *pkgcheck =3D rpmEx=
pand(&quot;%{?_build_pkgcheck} &quot;, *filename, NULL);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pkgcheck[0] !=
=3D &#39; &#39;) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =
=3D checkPackages(pkgcheck);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(pkgcheck);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 return rc;<br>
&gt;&gt; &gt; -+}<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+rpmRC packageBinaries(rpmSpec spec, const char *cookie, int=
 cheating)<br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 rpmRC rc;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 Package pkg;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 char *pkglist =3D NULL;<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 for (pkg =3D spec-&gt;packages; pkg !=3D NULL=
; pkg =3D pkg-&gt;next) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 char *fn =3D NULL;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 rc =3D packageBinary(spec, pkg, cookie=
, cheating, &amp;fn);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (rc =3D=3D RPMRC_OK) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rstrcat(&amp;pkglis=
t, fn);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rstrcat(&amp;pkglis=
t, &quot; &quot;);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt; -2.11.0<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0001-mono-find-p=
rovides-requires-do-not-use-monodis-from-.patch b/meta/recipes-devtools/rpm=
/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 24aa4c7ffff..00000000000<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/rpm/files/0001-mono-find-provides=
-requires-do-not-use-monodis-from-.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,58 +0,0 @@<br>
&gt;&gt; &gt; -From 43fbc3f53302a395463e8450ac81c53f623eec3f Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; &gt; -Date: Tue, 27 Aug 2019 17:42:34 +0200<br>
&gt;&gt; &gt; -Subject: [PATCH] mono-find-provides/requires: do not use mon=
odis from the host<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -There was a host contamination issue here: if monodis was in=
stalled<br>
&gt;&gt; &gt; -on the host, do_package would use that to resolve dependenci=
es<br>
&gt;&gt; &gt; -of mono libraries (and often fail in that). Without monodis,=
<br>
&gt;&gt; &gt; -no dependencies are resolved, which is seemingly how things<=
br>
&gt;&gt; &gt; -are supposed to work.<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Upstream-Status: Inappropriate [oe-core specific]<br>
&gt;&gt; &gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.=
kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - scripts/mono-find-provides | 8 ++++----<br>
&gt;&gt; &gt; - scripts/mono-find-requires | 8 ++++----<br>
&gt;&gt; &gt; - 2 files changed, 8 insertions(+), 8 deletions(-)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/scripts/mono-find-provides b/scripts/mono-find-=
provides<br>
&gt;&gt; &gt; -index 9348457d3..b28872ffb 100644<br>
&gt;&gt; &gt; ---- a/scripts/mono-find-provides<br>
&gt;&gt; &gt; -+++ b/scripts/mono-find-provides<br>
&gt;&gt; &gt; -@@ -18,11 +18,11 @@ monolist=3D($(printf &quot;%s\n&quot; &q=
uot;${filelist[@]}&quot; | grep -E &quot;\\.(exe|dll)\$&quot;))<br>
&gt;&gt; &gt; - build_bindir=3D&quot;$2/usr/bin&quot;<br>
&gt;&gt; &gt; - build_libdir=3D&quot;$2$3&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --if [ -x $build_bindir/monodis ]; then<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 monodis=3D&quot;$build_bindir/monodis&quot;<b=
r>
&gt;&gt; &gt; -+if [ -x $build_bindir/monodis.bogus ]; then<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 monodis=3D&quot;$build_bindir/monodis.bogus&q=
uot;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0export LD_LIBRARY_PATH=3D$build_libdir${=
LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}<br>
&gt;&gt; &gt; --elif [ -x /usr/bin/monodis ]; then<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 monodis=3D&quot;/usr/bin/monodis&quot;<br>
&gt;&gt; &gt; -+elif [ -x /usr/bin/monodis.bogus ]; then<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 monodis=3D&quot;/usr/bin/monodis.bogus&quot;<=
br>
&gt;&gt; &gt; - else<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0exit 0;<br>
&gt;&gt; &gt; - fi<br>
&gt;&gt; &gt; -diff --git a/scripts/mono-find-requires b/scripts/mono-find-=
requires<br>
&gt;&gt; &gt; -index ea58cae48..d270169e1 100644<br>
&gt;&gt; &gt; ---- a/scripts/mono-find-requires<br>
&gt;&gt; &gt; -+++ b/scripts/mono-find-requires<br>
&gt;&gt; &gt; -@@ -18,11 +18,11 @@ monolist=3D($(printf &quot;%s\n&quot; &q=
uot;${filelist[@]}&quot; | grep -E &quot;\\.(exe|dll)\$&quot;))<br>
&gt;&gt; &gt; - build_bindir=3D&quot;$2/usr/bin&quot;<br>
&gt;&gt; &gt; - build_libdir=3D&quot;$2$3&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --if [ -x $build_bindir/monodis ]; then<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 monodis=3D&quot;$build_bindir/monodis&quot;<b=
r>
&gt;&gt; &gt; -+if [ -x $build_bindir/monodis.bogus ]; then<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 monodis=3D&quot;$build_bindir/monodis.bogus&q=
uot;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0export LD_LIBRARY_PATH=3D$build_libdir${=
LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}<br>
&gt;&gt; &gt; --elif [ -x /usr/bin/monodis ]; then<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 monodis=3D&quot;/usr/bin/monodis&quot;<br>
&gt;&gt; &gt; -+elif [ -x /usr/bin/monodis.bogus ]; then<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 monodis=3D&quot;/usr/bin/monodis.bogus&quot;<=
br>
&gt;&gt; &gt; - else<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0exit 0;<br>
&gt;&gt; &gt; - fi<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-=
not-run-file-classification-in-parallel.patch b/meta/recipes-devtools/rpm/f=
iles/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 00000000000..9a5cd7c80dc<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run=
-file-classification-in-parallel.patch<br>
&gt;&gt; &gt; @@ -0,0 +1,65 @@<br>
&gt;&gt; &gt; +From 93c3c7f043f62e96941274e957c4ad9432032af1 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; &gt; +Date: Mon, 18 Nov 2019 16:22:56 +0100<br>
&gt;&gt; &gt; +Subject: [PATCH] rpmfc.c: do not run file classification in =
parallel<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +This is causing freezes with libmagic when the file in quest=
ion is compressed:<br>
&gt;&gt; &gt; +<a href=3D"https://github.com/rpm-software-management/rpm/is=
sues/756" rel=3D"noreferrer" target=3D"_blank">https://github.com/rpm-softw=
are-management/rpm/issues/756</a><br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Upstream-Status: Inapppropriate [upstream wants a proper fix=
]<br>
&gt;&gt; &gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.=
kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; &gt; +---<br>
&gt;&gt; &gt; + build/rpmfc.c | 8 --------<br>
&gt;&gt; &gt; + 1 file changed, 8 deletions(-)<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +diff --git a/build/rpmfc.c b/build/rpmfc.c<br>
&gt;&gt; &gt; +index 3db7a9352..17afdd57a 100644<br>
&gt;&gt; &gt; +--- a/build/rpmfc.c<br>
&gt;&gt; &gt; ++++ b/build/rpmfc.c<br>
&gt;&gt; &gt; +@@ -680,7 +680,6 @@ static void rpmfcAttributes(rpmfc fc, in=
t ix, const char *ftype, const char *ful<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Add attributes on libmagic typ=
e &amp; path pattern matches */<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (matches(&amp;(*attr)-&gt;incl=
, ftype, path, is_executable)) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argvAddTokens(&amp;=
fc-&gt;fattrs[ix], (*attr)-&gt;name);<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #pragma omp critical(fah=
ash)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fattrHashAddEntry(f=
c-&gt;fahash, attr-fc-&gt;atypes, ix);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; +@@ -1105,7 +1104,6 @@ rpmRC rpmfcClassify(rpmfc fc, ARGV_t a=
rgv, rpm_mode_t * fmode)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* Build (sorted) file class dictionary.=
 */<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0fc-&gt;cdict =3D rpmstrPoolCreate();<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 #pragma omp parallel<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* libmagic is not thread-safe, each thr=
ead needs to a private handle */<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0magic_t ms =3D magic_open(msflags);<br>
&gt;&gt; &gt; +@@ -1113,15 +1111,12 @@ rpmRC rpmfcClassify(rpmfc fc, ARGV_t=
 argv, rpm_mode_t * fmode)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (ms =3D=3D NULL) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rpmlog(RPMLOG_ERR, _(&quot;magic_=
open(0x%x) failed: %s\n&quot;),<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msfla=
gs, strerror(errno));<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 #pragma omp cancel parallel<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (magic_load(ms, NULL) =3D=3D -1) {<br=
>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rpmlog(RPMLOG_ERR, _(&quot;magic_=
load failed: %s\n&quot;), magic_error(ms));<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 #pragma omp cancel parallel<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 #pragma omp for ordered reduction(+:nerrors)<=
br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0for (int ix =3D 0; ix &lt; fc-&gt;nfiles=
; ix++) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rpmsid ftypeId;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char * ftype;<br>
&gt;&gt; &gt; +@@ -1185,14 +1180,11 @@ rpmRC rpmfcClassify(rpmfc fc, ARGV_t=
 argv, rpm_mode_t * fmode)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fc-&gt;fcolor[ix] =3D fcolor;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Add to file class dictionary a=
nd index array */<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 #pragma omp ordered<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fcolor !=3D RPMFC_WHITE &amp;=
&amp; (fcolor &amp; RPMFC_INCLUDE)) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ftypeId =3D rpmstrP=
oolId(fc-&gt;cdict, ftype, 1);<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #pragma omp atomic<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fc-&gt;fknown++;<br=
>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ftypeId =3D rpmstrP=
oolId(fc-&gt;cdict, &quot;&quot;, 1);<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #pragma omp atomic<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fc-&gt;fwhite++;<br=
>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Pool id&#39;s start from 1, fo=
r headers we want it from 0 */<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0002-Run-binary-=
package-creation-via-thread-pools.patch b/meta/recipes-devtools/rpm/files/0=
002-Run-binary-package-creation-via-thread-pools.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index d10041c2e14..00000000000<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/rpm/files/0002-Run-binary-package=
-creation-via-thread-pools.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,127 +0,0 @@<br>
&gt;&gt; &gt; -From 513200cf76758de4668312c628d6362bdabfaf4b Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; &gt; -Date: Thu, 25 May 2017 19:30:20 +0300<br>
&gt;&gt; &gt; -Subject: [PATCH 1/3] Run binary package creation via thread =
pools.<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Upstream-Status: Submitted [<a href=3D"https://github.com/rp=
m-software-management/rpm/pull/226" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/rpm-software-management/rpm/pull/226</a>]<br>
&gt;&gt; &gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.=
kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - build/pack.c | 81 +++++++++++++++++++++++++++++++++++++++++=
++++++++-----------<br>
&gt;&gt; &gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a> |=C2=A0 3 +++<br>
&gt;&gt; &gt; - 2 files changed, 70 insertions(+), 14 deletions(-)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/build/pack.c b/build/pack.c<br>
&gt;&gt; &gt; -index ccfd614cc..ed5b9ab4e 100644<br>
&gt;&gt; &gt; ---- a/build/pack.c<br>
&gt;&gt; &gt; -+++ b/build/pack.c<br>
&gt;&gt; &gt; -@@ -616,25 +616,78 @@ static rpmRC packageBinary(rpmSpec spe=
c, Package pkg, const char *cookie, int ch<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return rc;<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --rpmRC packageBinaries(rpmSpec spec, const char *cookie, int=
 cheating)<br>
&gt;&gt; &gt; -+struct binaryPackageTaskData<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 rpmRC rc;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0Package pkg;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 char *filename;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 rpmRC result;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 struct binaryPackageTaskData *next;<br>
&gt;&gt; &gt; -+};<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+static struct binaryPackageTaskData* runBinaryPackageTasks(=
rpmSpec spec, const char *cookie, int cheating)<br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 struct binaryPackageTaskData *tasks =3D NULL;=
<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 struct binaryPackageTaskData *task =3D NULL;<=
br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 struct binaryPackageTaskData *prev =3D NULL;<=
br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 for (Package pkg =3D spec-&gt;packages; pkg !=
=3D NULL; pkg =3D pkg-&gt;next) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 task =3D rcalloc(1, sizeof(*tas=
k));<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 task-&gt;pkg =3D pkg;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pkg =3D=3D spec-&gt;package=
s) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // the first pack=
age needs to be processed ahead of others, as they copy<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // changelog data=
 from it, and so otherwise data races would happen<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 task-&gt;result =
=3D packageBinary(spec, pkg, cookie, cheating, &amp;(task-&gt;filename));<b=
r>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpmlog(RPMLOG_NOT=
ICE, _(&quot;Finished binary package job, result %d, filename %s\n&quot;), =
task-&gt;result, task-&gt;filename);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tasks =3D task;<b=
r>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (prev !=3D NULL) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev-&gt;next =3D=
 task;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev =3D task;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 #pragma omp parallel<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 #pragma omp single<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 // re-declaring task variable is necessary, o=
r older gcc versions will produce code that segfaults<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 for (struct binaryPackageTaskData *task =3D t=
asks; task !=3D NULL; task =3D task-&gt;next) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (task !=3D tasks)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #pragma omp task<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 task-&gt;result =
=3D packageBinary(spec, task-&gt;pkg, cookie, cheating, &amp;(task-&gt;file=
name));<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpmlog(RPMLOG_NOT=
ICE, _(&quot;Finished binary package job, result %d, filename %s\n&quot;), =
task-&gt;result, task-&gt;filename);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 return tasks;<br>
&gt;&gt; &gt; -+}<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+static void freeBinaryPackageTasks(struct binaryPackageTask=
Data* tasks)<br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 while (tasks !=3D NULL) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct binaryPackageTaskData* n=
ext =3D tasks-&gt;next;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rfree(tasks-&gt;filename);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rfree(tasks);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tasks =3D next;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+}<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+rpmRC packageBinaries(rpmSpec spec, const char *cookie, int=
 cheating)<br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0char *pkglist =3D NULL;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 for (pkg =3D spec-&gt;packages; pkg !=3D NULL=
; pkg =3D pkg-&gt;next) {<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 char *fn =3D NULL;<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 rc =3D packageBinary(spec, pkg, cookie=
, cheating, &amp;fn);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 if (rc =3D=3D RPMRC_OK) {<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rstrcat(&amp;pkglist, fn=
);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rstrcat(&amp;pkglist, &q=
uot; &quot;);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 free(fn);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 if (rc !=3D RPMRC_OK) {<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkglist =3D _free(pkglis=
t);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return rc;<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 struct binaryPackageTaskData *tasks =3D runBi=
naryPackageTasks(spec, cookie, cheating);<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 for (struct binaryPackageTaskData *task =3D t=
asks; task !=3D NULL; task =3D task-&gt;next) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (task-&gt;result =3D=3D RPMR=
C_OK) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rstrcat(&amp;pkgl=
ist, task-&gt;filename);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rstrcat(&amp;pkgl=
ist, &quot; &quot;);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _free(pkglist);<b=
r>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 freeBinaryPackage=
Tasks(tasks);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return RPMRC_FAIL=
;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 freeBinaryPackageTasks(tasks);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0/* Now check the package set if enabled =
*/<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (pkglist !=3D NULL) {<br>
&gt;&gt; &gt; -diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" re=
l=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt;&gt; &gt; -index a506ec819..59fa0acaf 100644<br>
&gt;&gt; &gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a><br>
&gt;&gt; &gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a><br>
&gt;&gt; &gt; -@@ -17,6 +17,9 @@ AC_DISABLE_STATIC<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - PKG_PROG_PKG_CONFIG<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+AC_OPENMP<br>
&gt;&gt; &gt; -+RPMCFLAGS=3D&quot;$OPENMP_CFLAGS $RPMCFLAGS&quot;<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; - dnl Checks for programs.<br>
&gt;&gt; &gt; - AC_PROG_CXX<br>
&gt;&gt; &gt; - AC_PROG_AWK<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt; -2.11.0<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0003-rpmstrpool.=
c-make-operations-over-string-pools-threa.patch b/meta/recipes-devtools/rpm=
/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index c348ae5330e..00000000000<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-=
operations-over-string-pools-threa.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,207 +0,0 @@<br>
&gt;&gt; &gt; -From c80892f17e44331206c8318d53b63bb6a99554d0 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; &gt; -Date: Tue, 30 May 2017 13:58:30 +0300<br>
&gt;&gt; &gt; -Subject: [PATCH 3/4] rpmstrpool.c: make operations over stri=
ng pools<br>
&gt;&gt; &gt; - thread-safe<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Otherwise multithreaded rpm building explodes in various way=
s due<br>
&gt;&gt; &gt; -to data races.<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Upstream-Status: Submitted [<a href=3D"https://github.com/rp=
m-software-management/rpm/pull/226" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/rpm-software-management/rpm/pull/226</a>]<br>
&gt;&gt; &gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.=
kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - rpmio/rpmstrpool.c | 56 +++++++++++++++++++++++++++++++++++=
++++++++++---------<br>
&gt;&gt; &gt; - 1 file changed, 47 insertions(+), 9 deletions(-)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/rpmio/rpmstrpool.c b/rpmio/rpmstrpool.c<br>
&gt;&gt; &gt; -index 30a57eb10..58ba95a02 100644<br>
&gt;&gt; &gt; ---- a/rpmio/rpmstrpool.c<br>
&gt;&gt; &gt; -+++ b/rpmio/rpmstrpool.c<br>
&gt;&gt; &gt; -@@ -113,6 +113,8 @@ static poolHash poolHashCreate(int numBu=
ckets)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return ht;<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+static const char * rpmstrPoolStrNoLock(rpmstrPool pool, rp=
msid sid);<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; - static void poolHashResize(rpmstrPool pool, int numBuckets)=
<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0poolHash ht =3D pool-&gt;hash;<br>
&gt;&gt; &gt; -@@ -120,7 +122,7 @@ static void poolHashResize(rpmstrPool po=
ol, int numBuckets)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0for (int i=3D0; i&lt;ht-&gt;numBuckets; =
i++) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ht-&gt;buckets[i].key=
id) continue;<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int keyHash =3D rstrha=
sh(rpmstrPoolStr(pool, ht-&gt;buckets[i].keyid));<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int keyHash =3D rstrha=
sh(rpmstrPoolStrNoLock(pool, ht-&gt;buckets[i].keyid));<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (unsigned int j=3D0;;j=
++) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=
 hash =3D hashbucket(keyHash, j) % numBuckets;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!buckets=
[hash].keyid) {<br>
&gt;&gt; &gt; -@@ -149,7 +151,7 @@ static void poolHashAddHEntry(rpmstrPool=
 pool, const char * key, unsigned int ke<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ht-&gt;bucke=
ts[hash].keyid =3D keyid;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ht-&gt;keyCo=
unt++;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!strcmp(rpmstrPoolSt=
r(pool, ht-&gt;buckets[hash].keyid), key)) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!strcmp(rpmstrPoolSt=
rNoLock(pool, ht-&gt;buckets[hash].keyid), key)) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -@@ -191,7 +193,7 @@ static void poolHashPrintStats(rpmstrPoo=
l pool)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0int maxcollisions =3D 0;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0for (i=3D0; i&lt;ht-&gt;numBuckets; i++)=
 {<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int keyHash =3D rstrha=
sh(rpmstrPoolStr(pool, ht-&gt;buckets[i].keyid));<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int keyHash =3D rstrha=
sh(rpmstrPoolStrNoLock(pool, ht-&gt;buckets[i].keyid));<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (unsigned int j=3D0;;j=
++) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=
 hash =3D hashbucket(keyHash, i) % ht-&gt;numBuckets;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (hash=3D=
=3Di) {<br>
&gt;&gt; &gt; -@@ -221,7 +223,7 @@ static void rpmstrPoolRehash(rpmstrPool =
pool)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0pool-&gt;hash =3D poolHashCreate(sizehin=
t);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0for (int i =3D 1; i &lt;=3D pool-&gt;off=
s_size; i++)<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 poolHashAddEntry(pool, rpmstrPoolStr(p=
ool, i), i);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 poolHashAddEntry(pool, rpmstrPoolStrNo=
Lock(pool, i), i);<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - rpmstrPool rpmstrPoolCreate(void)<br>
&gt;&gt; &gt; -@@ -245,6 +247,8 @@ rpmstrPool rpmstrPoolCreate(void)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - rpmstrPool rpmstrPoolFree(rpmstrPool pool)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 #pragma omp critical(rpmstrpool)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (pool) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pool-&gt;nrefs &gt; 1) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pool-&gt;nrefs--;<b=
r>
&gt;&gt; &gt; -@@ -260,18 +264,24 @@ rpmstrPool rpmstrPoolFree(rpmstrPool p=
ool)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(pool);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - rpmstrPool rpmstrPoolLink(rpmstrPool pool)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 #pragma omp critical(rpmstrpool)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (pool)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pool-&gt;nrefs++;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return pool;<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - void rpmstrPoolFreeze(rpmstrPool pool, int keephash)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 #pragma omp critical(rpmstrpool)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (pool &amp;&amp; !pool-&gt;frozen) {<=
br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!keephash) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pool-&gt;hash =3D p=
oolHashFree(pool-&gt;hash);<br>
&gt;&gt; &gt; -@@ -281,16 +291,20 @@ void rpmstrPoolFreeze(rpmstrPool pool,=
 int keephash)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pool-&gt;offs_alloced * sizeof=
(*pool-&gt;offs));<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pool-&gt;frozen =3D 1;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - void rpmstrPoolUnfreeze(rpmstrPool pool)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 #pragma omp critical(rpmstrpool)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (pool) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pool-&gt;hash =3D=3D NULL) {<=
br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rpmstrPoolRehash(po=
ol);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pool-&gt;frozen =3D 0;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - static rpmsid rpmstrPoolPut(rpmstrPool pool, const char *s,=
 size_t slen, unsigned int hash)<br>
&gt;&gt; &gt; -@@ -350,7 +364,7 @@ static rpmsid rpmstrPoolGet(rpmstrPool p=
ool, const char * key, size_t keylen,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br=
>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 s =3D rpmstrPoolStr(pool, ht-&gt;bucke=
ts[hash].keyid);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 s =3D rpmstrPoolStrNoLock(pool, ht-&gt=
;buckets[hash].keyid);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* pool string could be longer th=
an keylen, require exact matche */<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (strncmp(s, key, keylen) =3D=
=3D 0 &amp;&amp; s[keylen] =3D=3D &#39;\0&#39;)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ht-&gt;bucke=
ts[hash].keyid;<br>
&gt;&gt; &gt; -@@ -373,27 +387,31 @@ static inline rpmsid strn2id(rpmstrPoo=
l pool, const char *s, size_t slen,<br>
&gt;&gt; &gt; - rpmsid rpmstrPoolIdn(rpmstrPool pool, const char *s, size_t=
 slen, int create)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0rpmsid sid =3D 0;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 #pragma omp critical(rpmstrpool)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (s !=3D NULL) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int hash =3D rstrnhash(s=
, slen);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sid =3D strn2id(pool, s, slen, ha=
sh, create);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return sid;<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - rpmsid rpmstrPoolId(rpmstrPool pool, const char *s, int cre=
ate)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0rpmsid sid =3D 0;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 #pragma omp critical(rpmstrpool)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (s !=3D NULL) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t slen;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int hash =3D rstrlenhash=
(s, &amp;slen);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sid =3D strn2id(pool, s, slen, ha=
sh, create);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return sid;<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --const char * rpmstrPoolStr(rpmstrPool pool, rpmsid sid)<br>
&gt;&gt; &gt; -+static const char * rpmstrPoolStrNoLock(rpmstrPool pool, rp=
msid sid)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0const char *s =3D NULL;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (pool &amp;&amp; sid &gt; 0 &amp;&amp=
; sid &lt;=3D pool-&gt;offs_size)<br>
&gt;&gt; &gt; -@@ -401,12 +419,25 @@ const char * rpmstrPoolStr(rpmstrPool =
pool, rpmsid sid)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return s;<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+const char * rpmstrPoolStr(rpmstrPool pool, rpmsid sid)<br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 const char *s =3D NULL;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 #pragma omp critical(rpmstrpool)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 s =3D rpmstrPoolStrNoLock(pool, sid);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 return s;<br>
&gt;&gt; &gt; -+}<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; - size_t rpmstrPoolStrlen(rpmstrPool pool, rpmsid sid)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0size_t slen =3D 0;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 #pragma omp critical(rpmstrpool)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (pool &amp;&amp; sid &gt; 0 &amp;&amp=
; sid &lt;=3D pool-&gt;offs_size) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0slen =3D strlen(pool-&gt;offs[sid=
]);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return slen;<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -@@ -421,5 +452,12 @@ int rpmstrPoolStreq(rpmstrPool poolA, r=
pmsid sidA,<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - rpmsid rpmstrPoolNumStr(rpmstrPool pool)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 return (pool !=3D NULL) ? pool-&gt;offs_size =
: 0;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 rpmsid id =3D 0;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 #pragma omp critical(rpmstrpool)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 if (pool) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 id =3D pool-&gt;offs_size;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 return id;<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt; -2.11.0<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0004-build-pack.=
c-remove-static-local-variables-from-buil.patch b/meta/recipes-devtools/rpm=
/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 652e30b3e4a..00000000000<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/rpm/files/0004-build-pack.c-remov=
e-static-local-variables-from-buil.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,336 +0,0 @@<br>
&gt;&gt; &gt; -From 792693bb90768cfde4898e8dd31ee1b5de803d2f Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; &gt; -Date: Thu, 8 Jun 2017 17:08:09 +0300<br>
&gt;&gt; &gt; -Subject: [PATCH] build/pack.c: remove static local variables=
 from buildHost()<br>
&gt;&gt; &gt; - and getBuildTime()<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Their use is causing difficult to diagnoze data races when b=
uilding multiple<br>
&gt;&gt; &gt; -packages in parallel, and is a bad idea in general, as it al=
so makes it more<br>
&gt;&gt; &gt; -difficult to reason about code.<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Upstream-Status: Submitted [<a href=3D"https://github.com/rp=
m-software-management/rpm/pull/226" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/rpm-software-management/rpm/pull/226</a>]<br>
&gt;&gt; &gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.=
kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.=
kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - build/build.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 54 ++++++++++++++++++++++++++++--<br>
&gt;&gt; &gt; - build/pack.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 84 +++++++++--------------------------------------<br>
&gt;&gt; &gt; - build/rpmbuild_internal.h |=C2=A0 8 +++--<br>
&gt;&gt; &gt; - 3 files changed, 74 insertions(+), 72 deletions(-)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/build/build.c b/build/build.c<br>
&gt;&gt; &gt; -index 13c3df2..b154f08 100644<br>
&gt;&gt; &gt; ---- a/build/build.c<br>
&gt;&gt; &gt; -+++ b/build/build.c<br>
&gt;&gt; &gt; -@@ -6,6 +6,8 @@<br>
&gt;&gt; &gt; - #include &quot;system.h&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #include &lt;errno.h&gt;<br>
&gt;&gt; &gt; -+#include &lt;netdb.h&gt;<br>
&gt;&gt; &gt; -+#include &lt;time.h&gt;<br>
&gt;&gt; &gt; - #include &lt;sys/wait.h&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #include &lt;rpm/rpmlog.h&gt;<br>
&gt;&gt; &gt; -@@ -16,6 +18,50 @@<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #include &quot;debug.h&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+static rpm_time_t getBuildTime(void)<br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 rpm_time_t buildTime =3D 0;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 char *srcdate;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 time_t epoch;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 char *endptr;<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 srcdate =3D getenv(&quot;SOURCE_DATE_EPOCH&qu=
ot;);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 if (srcdate) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D 0;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 epoch =3D strtol(srcdate, &amp;=
endptr, 10);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (srcdate =3D=3D endptr || *e=
ndptr || errno !=3D 0)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpmlog(RPMLOG_ERR=
, _(&quot;unable to parse SOURCE_DATE_EPOCH\n&quot;));<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buildTime =3D (in=
t32_t) epoch;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 } else<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 buildTime =3D (int32_t) time(NU=
LL);<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 return buildTime;<br>
&gt;&gt; &gt; -+}<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+static char * buildHost(void)<br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 char* hostname;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 struct hostent *hbn;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 char *bhMacro;<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 bhMacro =3D rpmExpand(&quot;%{?_buildhost}&qu=
ot;, NULL);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 if (strcmp(bhMacro, &quot;&quot;) !=3D 0) {<b=
r>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rasprintf(&amp;hostname, &quot;=
%s&quot;, bhMacro);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 hostname =3D rcalloc(1024, size=
of(*hostname));<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) gethostname(hostname, 10=
24);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 hbn =3D gethostbyname(hostname)=
;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hbn)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strcpy(hostname, =
hbn-&gt;h_name);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpmlog(RPMLOG_WAR=
NING,<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 _(&quot;Could not canonicalize hostname: %s\n&quot;), hostname);=
<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 free(bhMacro);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 return(hostname);<br>
&gt;&gt; &gt; -+}<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; - /**<br>
&gt;&gt; &gt; -=C2=A0 */<br>
&gt;&gt; &gt; - static rpmRC doRmSource(rpmSpec spec)<br>
&gt;&gt; &gt; -@@ -201,6 +247,9 @@ static rpmRC buildSpec(BTA_t buildArgs, =
rpmSpec spec, int what)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0rpmRC rc =3D RPMRC_OK;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0int test =3D (what &amp; RPMBUILD_NOBUIL=
D);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0char *cookie =3D buildArgs-&gt;cookie ? =
xstrdup(buildArgs-&gt;cookie) : NULL;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 const char* host =3D buildHost();<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 rpm_time_t buildTime =3D getBuildTime();<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (rpmExpandNumeric(&quot;%{?source_dat=
e_epoch_from_changelog}&quot;) &amp;&amp;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0getenv(&quot;SOURCE_DATE_EPOCH&qu=
ot;) =3D=3D NULL) {<br>
&gt;&gt; &gt; -@@ -269,11 +318,11 @@ static rpmRC buildSpec(BTA_t buildArgs=
, rpmSpec spec, int what)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto =
exit;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (((what &amp; RPMBUILD_PACKAGE=
SOURCE) &amp;&amp; !test) &amp;&amp;<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (rc =3D packageSources(s=
pec, &amp;cookie)))<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (rc =3D packageSources(s=
pec, &amp;cookie, buildTime, host)))<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto =
exit;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (((what &amp; RPMBUILD_PACKAGE=
BINARY) &amp;&amp; !test) &amp;&amp;<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (rc =3D packageBinaries(=
spec, cookie, (didBuild =3D=3D 0))))<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (rc =3D packageBinaries(=
spec, cookie, (didBuild =3D=3D 0), buildTime, host)))<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto =
exit;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((what &amp; RPMBUILD_CLEAN) &=
amp;&amp;<br>
&gt;&gt; &gt; -@@ -293,6 +342,7 @@ static rpmRC buildSpec(BTA_t buildArgs, =
rpmSpec spec, int what)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0(void) unlink(spec-&gt;specFile);=
<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - exit:<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 free(host);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0free(cookie);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0spec-&gt;rootDir =3D NULL;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (rc !=3D RPMRC_OK &amp;&amp; rpmlogGe=
tNrecs() &gt; 0) {<br>
&gt;&gt; &gt; -diff --git a/build/pack.c b/build/pack.c<br>
&gt;&gt; &gt; -index df15876..17a4b09 100644<br>
&gt;&gt; &gt; ---- a/build/pack.c<br>
&gt;&gt; &gt; -+++ b/build/pack.c<br>
&gt;&gt; &gt; -@@ -6,8 +6,6 @@<br>
&gt;&gt; &gt; - #include &quot;system.h&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #include &lt;errno.h&gt;<br>
&gt;&gt; &gt; --#include &lt;netdb.h&gt;<br>
&gt;&gt; &gt; --#include &lt;time.h&gt;<br>
&gt;&gt; &gt; - #include &lt;sys/wait.h&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #include &lt;rpm/rpmlib.h&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* RPMSIGTAG*, rpmRe=
adPackageFile */<br>
&gt;&gt; &gt; -@@ -152,57 +150,6 @@ exit:<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return rc;<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --static rpm_time_t * getBuildTime(void)<br>
&gt;&gt; &gt; --{<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 static rpm_time_t buildTime[1];<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 char *srcdate;<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 time_t epoch;<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 char *endptr;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 if (buildTime[0] =3D=3D 0) {<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 srcdate =3D getenv(&quot;SOURCE=
_DATE_EPOCH&quot;);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (srcdate) {<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D 0;<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 epoch =3D strtol(=
srcdate, &amp;endptr, 10);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (srcdate =3D=
=3D endptr || *endptr || errno !=3D 0)<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpm=
log(RPMLOG_ERR, _(&quot;unable to parse SOURCE_DATE_EPOCH\n&quot;));<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bui=
ldTime[0] =3D (int32_t) epoch;<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buildTime[0] =3D =
(int32_t) time(NULL);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 return buildTime;<br>
&gt;&gt; &gt; --}<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; --static const char * buildHost(void)<br>
&gt;&gt; &gt; --{<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 static char hostname[1024];<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 static int oneshot =3D 0;<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 struct hostent *hbn;<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 char *bhMacro;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 if (! oneshot) {<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 bhMacro =3D rpmExpand(&quot;%{?=
_buildhost}&quot;, NULL);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp(bhMacro, &quot;&quot=
;) !=3D 0 &amp;&amp; strlen(bhMacro) &lt; 1024) {<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strcpy(hostname, =
bhMacro);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp(bhMacr=
o, &quot;&quot;) !=3D 0)<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpm=
log(RPMLOG_WARNING, _(&quot;The _buildhost macro is too long\n&quot;));<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) gethostnam=
e(hostname, sizeof(hostname));<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hbn =3D gethostby=
name(hostname);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hbn)<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str=
cpy(hostname, hbn-&gt;h_name);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpm=
log(RPMLOG_WARNING,<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 _(&quot;Could not canonicalize hostname: %s\n&quot=
;), hostname);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(bhMacro);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 oneshot =3D 1;<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 return(hostname);<br>
&gt;&gt; &gt; --}<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; - static rpmRC processScriptFiles(rpmSpec spec, Package pkg)<=
br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0struct TriggerFileEntry *p;<br>
&gt;&gt; &gt; -@@ -476,7 +423,8 @@ exit:<br>
&gt;&gt; &gt; -=C2=A0 * order to how the RPM format is laid on disk.<br>
&gt;&gt; &gt; -=C2=A0 */<br>
&gt;&gt; &gt; - static rpmRC writeRPM(Package pkg, unsigned char ** pkgidp,=
<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 const char *fileName, char **cookie)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 const char *fileName, char **cookie,<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rpm_time_t buildTime, const char* buildHost)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0FD_t fd =3D NULL;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0char * rpmio_flags =3D NULL;<br>
&gt;&gt; &gt; -@@ -500,7 +448,7 @@ static rpmRC writeRPM(Package pkg, unsig=
ned char ** pkgidp,<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0/* Create and add the cookie */<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (cookie) {<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 rasprintf(cookie, &quot;%s %d&quot;, b=
uildHost(), (int) (*getBuildTime()));<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 rasprintf(cookie, &quot;%s %d&quot;, b=
uildHost, buildTime);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0headerPutString(pkg-&gt;header, R=
PMTAG_COOKIE, *cookie);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -@@ -641,7 +589,7 @@ static rpmRC checkPackages(char *pkgchec=
k)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return RPMRC_OK;<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --static rpmRC packageBinary(rpmSpec spec, Package pkg, const=
 char *cookie, int cheating, char** filename)<br>
&gt;&gt; &gt; -+static rpmRC packageBinary(rpmSpec spec, Package pkg, const=
 char *cookie, int cheating, char** filename, rpm_time_t buildTime, const c=
har* buildHost)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *errorString;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rpmRC rc =3D RPMRC_OK;<br>
&gt;&gt; &gt; -@@ -660,8 +608,8 @@ static rpmRC packageBinary(rpmSpec spec,=
 Package pkg, const char *cookie, int ch<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0headerCopyTags(spec-&gt;packages-=
&gt;header, pkg-&gt;header, copyTags);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0headerPutString(pkg-&gt;header, R=
PMTAG_RPMVERSION, VERSION);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 headerPutString(pkg-&gt;header, RPMTAG=
_BUILDHOST, buildHost());<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 headerPutUint32(pkg-&gt;header, RPMTAG=
_BUILDTIME, getBuildTime(), 1);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 headerPutString(pkg-&gt;header, RPMTAG=
_BUILDHOST, buildHost);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 headerPutUint32(pkg-&gt;header, RPMTAG=
_BUILDTIME, &amp;buildTime, 1);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (spec-&gt;sourcePkgId !=3D NUL=
L) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0headerPutBin(pkg-&g=
t;header, RPMTAG_SOURCEPKGID, spec-&gt;sourcePkgId,16);<br>
&gt;&gt; &gt; -@@ -699,7 +647,7 @@ static rpmRC packageBinary(rpmSpec spec,=
 Package pkg, const char *cookie, int ch<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(binRpm);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 rc =3D writeRPM(pkg, NULL, *filename, =
NULL);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 rc =3D writeRPM(pkg, NULL, *filename, =
NULL, buildTime, buildHost);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc =3D=3D RPMRC_OK) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Do check each wr=
itten package if enabled */<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *pkgcheck =3D =
rpmExpand(&quot;%{?_build_pkgcheck} &quot;, *filename, NULL);<br>
&gt;&gt; &gt; -@@ -719,7 +667,7 @@ struct binaryPackageTaskData<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0struct binaryPackageTaskData *next;<br>
&gt;&gt; &gt; - };<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --static struct binaryPackageTaskData* runBinaryPackageTasks(=
rpmSpec spec, const char *cookie, int cheating)<br>
&gt;&gt; &gt; -+static struct binaryPackageTaskData* runBinaryPackageTasks(=
rpmSpec spec, const char *cookie, int cheating, rpm_time_t buildTime, char*=
 buildHost)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0struct binaryPackageTaskData *tasks =3D =
NULL;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0struct binaryPackageTaskData *task =3D N=
ULL;<br>
&gt;&gt; &gt; -@@ -731,7 +679,7 @@ static struct binaryPackageTaskData* run=
BinaryPackageTasks(rpmSpec spec, const c<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pkg =3D=3D spec-&gt;pa=
ckages) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// the first=
 package needs to be processed ahead of others, as they copy<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// changelog=
 data from it, and so otherwise data races would happen<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 task-&gt;result =
=3D packageBinary(spec, pkg, cookie, cheating, &amp;(task-&gt;filename));<b=
r>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 task-&gt;result =
=3D packageBinary(spec, pkg, cookie, cheating, &amp;(task-&gt;filename), bu=
ildTime, buildHost);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rpmlog(RPMLO=
G_NOTICE, _(&quot;Finished binary package job, result %d, filename %s\n&quo=
t;), task-&gt;result, task-&gt;filename);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tasks =3D ta=
sk;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -@@ -748,7 +696,7 @@ static struct binaryPackageTaskData* run=
BinaryPackageTasks(rpmSpec spec, const c<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (task !=3D tasks)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#pragma omp task<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 task-&gt;result =
=3D packageBinary(spec, task-&gt;pkg, cookie, cheating, &amp;(task-&gt;file=
name));<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 task-&gt;result =
=3D packageBinary(spec, task-&gt;pkg, cookie, cheating, &amp;(task-&gt;file=
name), buildTime, buildHost);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rpmlog(RPMLO=
G_NOTICE, _(&quot;Finished binary package job, result %d, filename %s\n&quo=
t;), task-&gt;result, task-&gt;filename);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -@@ -766,11 +714,11 @@ static void freeBinaryPackageTasks(str=
uct binaryPackageTaskData* tasks)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --rpmRC packageBinaries(rpmSpec spec, const char *cookie, int=
 cheating)<br>
&gt;&gt; &gt; -+rpmRC packageBinaries(rpmSpec spec, const char *cookie, int=
 cheating, rpm_time_t buildTime, char* buildHost)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0char *pkglist =3D NULL;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 struct binaryPackageTaskData *tasks =3D runBi=
naryPackageTasks(spec, cookie, cheating);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 struct binaryPackageTaskData *tasks =3D runBi=
naryPackageTasks(spec, cookie, cheating, buildTime, buildHost);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0for (struct binaryPackageTaskData *task =
=3D tasks; task !=3D NULL; task =3D task-&gt;next) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (task-&gt;result =3D=3D=
 RPMRC_OK) {<br>
&gt;&gt; &gt; -@@ -797,7 +745,7 @@ rpmRC packageBinaries(rpmSpec spec, cons=
t char *cookie, int cheating)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return RPMRC_OK;<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --rpmRC packageSources(rpmSpec spec, char **cookie)<br>
&gt;&gt; &gt; -+rpmRC packageSources(rpmSpec spec, char **cookie, rpm_time_=
t buildTime, char* buildHost)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0Package sourcePkg =3D spec-&gt;sourcePac=
kage;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0rpmRC rc;<br>
&gt;&gt; &gt; -@@ -805,8 +753,8 @@ rpmRC packageSources(rpmSpec spec, char =
**cookie)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0/* Add some cruft */<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0headerPutString(sourcePkg-&gt;header, RP=
MTAG_RPMVERSION, VERSION);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 headerPutString(sourcePkg-&gt;header, RPMTAG_=
BUILDHOST, buildHost());<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 headerPutUint32(sourcePkg-&gt;header, RPMTAG_=
BUILDTIME, getBuildTime(), 1);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 headerPutString(sourcePkg-&gt;header, RPMTAG_=
BUILDHOST, buildHost);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 headerPutUint32(sourcePkg-&gt;header, RPMTAG_=
BUILDTIME, &amp;buildTime, 1);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0headerPutUint32(sourcePkg-&gt;header, RP=
MTAG_SOURCEPACKAGE, &amp;one, 1);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0/* XXX this should be %_srpmdir */<br>
&gt;&gt; &gt; -@@ -814,7 +762,7 @@ rpmRC packageSources(rpmSpec spec, char =
**cookie)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0char *pkgcheck =3D rpmExpand(&quo=
t;%{?_build_pkgcheck_srpm} &quot;, fn, NULL);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0spec-&gt;sourcePkgId =3D NULL;<br=
>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 rc =3D writeRPM(sourcePkg, &amp;spec-&=
gt;sourcePkgId, fn, cookie);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 rc =3D writeRPM(sourcePkg, &amp;spec-&=
gt;sourcePkgId, fn, cookie, buildTime, buildHost);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Do check SRPM package if enabl=
ed */<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc =3D=3D RPMRC_OK &amp;&amp;=
 pkgcheck[0] !=3D &#39; &#39;) {<br>
&gt;&gt; &gt; -diff --git a/build/rpmbuild_internal.h b/build/rpmbuild_inte=
rnal.h<br>
&gt;&gt; &gt; -index 439b7d3..07e8338 100644<br>
&gt;&gt; &gt; ---- a/build/rpmbuild_internal.h<br>
&gt;&gt; &gt; -+++ b/build/rpmbuild_internal.h<br>
&gt;&gt; &gt; -@@ -427,19 +427,23 @@ rpmRC processSourceFiles(rpmSpec spec,=
 rpmBuildPkgFlags pkgFlags);<br>
&gt;&gt; &gt; -=C2=A0 * @param spec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 spec file control structure<br>
&gt;&gt; &gt; -=C2=A0 * @param cookie=C2=A0 =C2=A0 =C2=A0 build identifier =
&quot;cookie&quot; or NULL<br>
&gt;&gt; &gt; -=C2=A0 * @param cheating=C2=A0 =C2=A0 was build shortcircuit=
ed?<br>
&gt;&gt; &gt; -+ * @param buildTime=C2=A0 =C2=A0the build timestamp that go=
es into packages<br>
&gt;&gt; &gt; -+ * @param buildHost=C2=A0 =C2=A0the hostname where the buil=
d is happening<br>
&gt;&gt; &gt; -=C2=A0 * @return=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RP=
MRC_OK on success<br>
&gt;&gt; &gt; -=C2=A0 */<br>
&gt;&gt; &gt; - RPM_GNUC_INTERNAL<br>
&gt;&gt; &gt; --rpmRC packageBinaries(rpmSpec spec, const char *cookie, int=
 cheating);<br>
&gt;&gt; &gt; -+rpmRC packageBinaries(rpmSpec spec, const char *cookie, int=
 cheating, rpm_time_t buildTime, char* buildHost);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - /** \ingroup rpmbuild<br>
&gt;&gt; &gt; -=C2=A0 * Generate source package.<br>
&gt;&gt; &gt; -=C2=A0 * @param spec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 spec file control structure<br>
&gt;&gt; &gt; -=C2=A0 * @retval cookie=C2=A0 =C2=A0 =C2=A0build identifier =
&quot;cookie&quot; or NULL<br>
&gt;&gt; &gt; -+ * @param buildTime=C2=A0 =C2=A0the build timestamp that go=
es into packages<br>
&gt;&gt; &gt; -+ * @param buildHost=C2=A0 =C2=A0the hostname where the buil=
d is happening<br>
&gt;&gt; &gt; -=C2=A0 * @return=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RP=
MRC_OK on success<br>
&gt;&gt; &gt; -=C2=A0 */<br>
&gt;&gt; &gt; - RPM_GNUC_INTERNAL<br>
&gt;&gt; &gt; --rpmRC packageSources(rpmSpec spec, char **cookie);<br>
&gt;&gt; &gt; -+rpmRC packageSources(rpmSpec spec, char **cookie, rpm_time_=
t buildTime, char* buildHost);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - RPM_GNUC_INTERNAL<br>
&gt;&gt; &gt; - int addLangTag(rpmSpec spec, Header h, rpmTagVal tag,<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_=
4.14.2.1.bb" rel=3D"noreferrer" target=3D"_blank">rpm_4.14.2.1.bb</a> b/met=
a/recipes-devtools/rpm/<a href=3D"http://rpm_4.15.1.bb" rel=3D"noreferrer" =
target=3D"_blank">rpm_4.15.1.bb</a><br>
&gt;&gt; &gt; similarity index 91%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/rpm/<a href=3D"http://rpm_4=
.14.2.1.bb" rel=3D"noreferrer" target=3D"_blank">rpm_4.14.2.1.bb</a><br>
&gt;&gt; &gt; rename to meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.1=
5.1.bb" rel=3D"noreferrer" target=3D"_blank">rpm_4.15.1.bb</a><br>
&gt;&gt; &gt; index c37330eb4c6..4fa2d764fb9 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.14.2.=
1.bb" rel=3D"noreferrer" target=3D"_blank">rpm_4.14.2.1.bb</a><br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.15.1.=
bb" rel=3D"noreferrer" target=3D"_blank">rpm_4.15.1.bb</a><br>
&gt;&gt; &gt; @@ -24,7 +24,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.rp=
m.org" rel=3D"noreferrer" target=3D"_blank">http://www.rpm.org</a>&quot;<br=
>
&gt;&gt; &gt;=C2=A0 LICENSE =3D &quot;GPL-2.0&quot;<br>
&gt;&gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc0bf017=
c0fd1920e6158a333acabfd4a&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/rpm-sof=
tware-management/rpm;branch=3Drpm-4.14.x" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/rpm-software-management/rpm;branch=3Drpm-4.14.x</a> \<br>
&gt;&gt; &gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/rpm-sof=
tware-management/rpm;branch=3Drpm-4.15.x" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/rpm-software-management/rpm;branch=3Drpm-4.15.x</a> \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Do=
-not-add-an-unsatisfiable-dependency-when-building.patch \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Do=
-not-read-config-files-from-HOME.patch \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Wh=
en-cross-installing-execute-package-scriptlets-wit.patch \<br>
&gt;&gt; &gt; @@ -34,18 +34,14 @@ SRC_URI =3D &quot;git://<a href=3D"http:/=
/github.com/rpm-software-management/rpm;branch=3Drpm-4.14.x" rel=3D"norefer=
rer" target=3D"_blank">github.com/rpm-software-management/rpm;branch=3Drpm-=
4.14.x</a> \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fi=
x-build-with-musl-C-library.patch \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Ad=
d-a-color-setting-for-mips64_n32-binaries.patch \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0011-Do=
-not-require-that-ELF-binaries-are-executable-to-b.patch \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Split-b=
inary-package-building-into-a-separate-functi.patch \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Run-bin=
ary-package-creation-via-thread-pools.patch \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-rpmstrp=
ool.c-make-operations-over-string-pools-threa.patch \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-build-p=
ack.c-remove-static-local-variables-from-buil.patch \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-pe=
rl-disable-auto-reqs.patch \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-rp=
m-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0016-rp=
mscript.c-change-logging-level-around-scriptlets-t.patch \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-mono-fi=
nd-provides-requires-do-not-use-monodis-from-.patch \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-rpmfc.c=
-do-not-run-file-classification-in-parallel.patch \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 PE =3D &quot;1&quot;<br>
&gt;&gt; &gt; -SRCREV =3D &quot;4a9440006398646583f0d9ae1837dad2875013aa&qu=
ot;<br>
&gt;&gt; &gt; +SRCREV =3D &quot;ab2179452c5be276a6b96c591afded485c7e58c3&qu=
ot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -125,8 +121,7 @@ do_install_append () {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}/${libdir}=
/rpm/macros<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s|/usr/bin/py=
thon|${USRBINPATH}/env ${PYTHON_PN}|&#39; \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${libdir}/rpm/p=
ythondistdeps.py \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${libdir}/rpm/p=
ython-macro-helper<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${libdir}/rpm/p=
ythondistdeps.py<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 FILES_${PN} +=3D &quot;${libdir}/rpm-plugins/*.so \<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.17.1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; _______________________________________________<br>
&gt;&gt; &gt; Openembedded-core mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000003b8cbd05982e52d1--

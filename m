Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
	[209.85.222.180])
	by mail.openembedded.org (Postfix) with ESMTP id EB28E7FA87
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:29:42 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id q70so1088244qke.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 02:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZppJ5t1UauSsmvQ1ceJCOrZvrRs3BwH1ifd1vt0HVSM=;
	b=GLaQOvsfACm0+FKO/maC6RHtWDdfovQugYhbTX0UM8sgZIxNWG9eCgM0QJBS0fX7e9
	+NP+H+yjQrlfnJkS3fPiJGnnKfPYCTxnIO1RkMCI18E5o10Ctmy6T01UM1kT5LNhhZn4
	Z5ZtpOiws0A0mTa8f//hYln+F8B23oc+QMSoPTRyNwUSNszjTks9PRRs7eI3cGBXKTEc
	THCF2jzyVW6sXgbJ1QCw3bh/1OL+8L1y4JreypuMmdQ4Qzh4n8ZFVY8cAmxm47LEVTZA
	Mefu9DCw88b6idcUQ/5+LIrrtSjaFmVKNuRLHznhkT/CPR3X642aByZbPqWVHPpc9XeA
	FRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZppJ5t1UauSsmvQ1ceJCOrZvrRs3BwH1ifd1vt0HVSM=;
	b=XogbDCNHhh8fzMh4hGuIv7bQcOYDDXE95yyUIz9Gqqq+pWtZ+t6vQky1o/fgUnkjR8
	bPWl1RUlEY7/HPvx+yeCZbwRBPJrSBPtORv6Li0JrxyvYmYMItRHmLXJVfFlcWGbGFP2
	+Jb8B2wPD0zf7TPcux2zwBJtOKYSJX6Q8Xpd/vCWVOHTI7TjCaGC6C506D9uVuL6bn1p
	QAWmRCeJt4pMw3Noh/Z4NbA/xLeGRiWXYjhjJ1P0FdsROC1uvcz2j7sigYXIrEtdczxD
	O/thYzDXb9KNJjAvrCspJGk9Hnmxj9tLbtsTJGRFyAd0gh6OW/13O1UyoHsrjw1MiUgY
	z5jw==
X-Gm-Message-State: APjAAAXBx8hSZErpAUPQG0QtEfUlO7ebI2N4XVagmXIAZzjE90z5iXMm
	kLlDgNLVNo6udMuM/1QXzjIiepqm/LUWmEOSekkivDlTrJo=
X-Google-Smtp-Source: APXvYqxSNgYFTYiRjn5UzFTWRilGc7rMrh3VeNIUrH19Gx7MUgm7ahWUb2pqfV8Qv+hVXtAo9GFmuFh2KTFFewlLs8U=
X-Received: by 2002:a05:620a:134b:: with SMTP id
	c11mr1847537qkl.71.1571995783240; 
	Fri, 25 Oct 2019 02:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191024172908.68056-1-alexander.j.kube@gmail.com>
	<20191024203841.71818-1-alexander.j.kube@gmail.com>
In-Reply-To: <20191024203841.71818-1-alexander.j.kube@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Oct 2019 10:29:31 +0100
Message-ID: <CAMKF1sr+yxtP9-ptZK4LEKQri6z2yd=VHE4y3=Uk6KpGkwzr-Q@mail.gmail.com>
To: Alexander Kube <alexander.j.kube@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 1/3] recipes-devtools/go: Refactor patches for go-1.13.3
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
X-List-Received-Date: Fri, 25 Oct 2019 09:29:43 -0000
Content-Type: multipart/alternative; boundary="0000000000003f9ef10595b8ca6a"

--0000000000003f9ef10595b8ca6a
Content-Type: text/plain; charset="UTF-8"

Looks good but please delete 1.12 along as well

On Thu, Oct 24, 2019 at 9:39 PM Alexander Kube <alexander.j.kube@gmail.com>
wrote:

> From: Alex Kube <alexander.j.kube@gmail.com>
>
> Signed-off-by: Alex Kube <alexander.j.kube@gmail.com>
> ---
>  ...ow-CC-and-CXX-to-have-multiple-words.patch |  38 +++
>  ...ent-based-hash-generation-less-pedan.patch | 226 ++++++++++++++
>  ...-to-be-overridden-in-the-environment.patch |  54 ++++
>  ...4-ld-add-soname-to-shareable-objects.patch |  50 ++++
>  ...de-CC-when-building-dist-and-go_boot.patch |  44 +++
>  ...dist-separate-host-and-target-builds.patch | 279 ++++++++++++++++++
>  ...d-go-make-GOROOT-precious-by-default.patch | 113 +++++++
>  ...008-use-GOBUILDMODE-to-set-buildmode.patch |  47 +++
>  ...place-glibc-dynamic-linker-with-musl.patch | 134 +++++++++
>  9 files changed, 985 insertions(+)
>  create mode 100644
> meta/recipes-devtools/go/go-1.13/0001-allow-CC-and-CXX-to-have-multiple-words.patch
>  create mode 100644
> meta/recipes-devtools/go/go-1.13/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
>  create mode 100644
> meta/recipes-devtools/go/go-1.13/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
>  create mode 100644
> meta/recipes-devtools/go/go-1.13/0004-ld-add-soname-to-shareable-objects.patch
>  create mode 100644
> meta/recipes-devtools/go/go-1.13/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
>  create mode 100644
> meta/recipes-devtools/go/go-1.13/0006-cmd-dist-separate-host-and-target-builds.patch
>  create mode 100644
> meta/recipes-devtools/go/go-1.13/0007-cmd-go-make-GOROOT-precious-by-default.patch
>  create mode 100644
> meta/recipes-devtools/go/go-1.13/0008-use-GOBUILDMODE-to-set-buildmode.patch
>  create mode 100644
> meta/recipes-devtools/go/go-1.13/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
>
> diff --git
> a/meta/recipes-devtools/go/go-1.13/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> b/meta/recipes-devtools/go/go-1.13/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> new file mode 100644
> index 0000000000..ddfd5e41d1
> --- /dev/null
> +++
> b/meta/recipes-devtools/go/go-1.13/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> @@ -0,0 +1,38 @@
> +From 9e3dc44cdfa58d96504d0a789dc82617dd5bef55 Mon Sep 17 00:00:00 2001
> +From: Alex Kube <alexander.j.kube@gmail.com>
> +Date: Wed, 23 Oct 2019 21:01:13 +0430
> +Subject: [PATCH 1/9] cmd/go: Allow CC and CXX to have multiple words
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Adapted to Go 1.13 from patches originally submitted to
> +the meta/recipes-devtools/go tree by
> +Matt Madison <matt@madison.systems>.
> +
> +Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
> +
> +---
> + src/cmd/go/internal/envcmd/env.go | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/cmd/go/internal/envcmd/env.go
> b/src/cmd/go/internal/envcmd/env.go
> +index 17852de..7b5ec5e 100644
> +--- a/src/cmd/go/internal/envcmd/env.go
> ++++ b/src/cmd/go/internal/envcmd/env.go
> +@@ -100,11 +100,11 @@ func MkEnv() []cfg.EnvVar {
> +
> +       cc := cfg.DefaultCC(cfg.Goos, cfg.Goarch)
> +       if env := strings.Fields(cfg.Getenv("CC")); len(env) > 0 {
> +-              cc = env[0]
> ++              cc = strings.Join(env, " ")
> +       }
> +       cxx := cfg.DefaultCXX(cfg.Goos, cfg.Goarch)
> +       if env := strings.Fields(cfg.Getenv("CXX")); len(env) > 0 {
> +-              cxx = env[0]
> ++              cxx = strings.Join(env, " ")
> +       }
> +       env = append(env, cfg.EnvVar{Name: "AR", Value: envOr("AR", "ar")})
> +       env = append(env, cfg.EnvVar{Name: "CC", Value: cc})
> +--
> +2.17.1 (Apple Git-112)
> +
> diff --git
> a/meta/recipes-devtools/go/go-1.13/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> b/meta/recipes-devtools/go/go-1.13/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> new file mode 100644
> index 0000000000..4eddd39809
> --- /dev/null
> +++
> b/meta/recipes-devtools/go/go-1.13/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> @@ -0,0 +1,226 @@
> +From a13ae484e41139094505d2834437e9262a5315f7 Mon Sep 17 00:00:00 2001
> +From: Alex Kube <alexander.j.kube@gmail.com>
> +Date: Wed, 23 Oct 2019 21:14:22 +0430
> +Subject: [PATCH 2/9] cmd/go: make content-based hash generation less
> pedantic
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Go 1.10's build tool now uses content-based hashes to
> +determine when something should be built or re-built.
> +This same mechanism is used to maintain a built-artifact
> +cache for speeding up builds.
> +
> +However, the hashes it generates include information that
> +doesn't work well with OE, nor with using a shared runtime
> +library.
> +
> +First, it embeds path names to source files, unless
> +building within GOROOT.  This prevents the building
> +of a package in GOPATH for later staging into GOROOT.
> +
> +This patch adds support for the environment variable
> +GOPATH_OMIT_IN_ACTIONID.  If present, path name
> +embedding is disabled.
> +
> +Second, if cgo is enabled, the build ID for cgo-related
> +packages will include the current value of the environment
> +variables for invoking the compiler (CC, CXX, FC) and
> +any CGO_xxFLAGS variables.  Only if the settings used
> +during a compilation exactly match, character for character,
> +the values used for compiling runtime/cgo or any other
> +cgo-enabled package being imported, will the tool
> +decide that the imported package is up-to-date.
> +
> +This is done to help ensure correctness, but is overly
> +simplistic and effectively prevents the reuse of built
> +artifacts that use cgo (or shared runtime, which includes
> +runtime/cgo).
> +
> +This patch filters out all compiler flags except those
> +beginning with '-m'.  The default behavior can be restored
> +by setting the CGO_PEDANTIC environment variable.
> +
> +Adapted to Go 1.13 from patches originally submitted to
> +the meta/recipes-devtools/go tree by
> +Matt Madison <matt@madison.systems>.
> +
> +Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
> +---
> + src/cmd/go/internal/envcmd/env.go |  2 +-
> + src/cmd/go/internal/work/exec.go  | 66 ++++++++++++++++++++++---------
> + 2 files changed, 49 insertions(+), 19 deletions(-)
> +
> +diff --git a/src/cmd/go/internal/envcmd/env.go
> b/src/cmd/go/internal/envcmd/env.go
> +index 7b5ec5e..292f117 100644
> +--- a/src/cmd/go/internal/envcmd/env.go
> ++++ b/src/cmd/go/internal/envcmd/env.go
> +@@ -154,7 +154,7 @@ func ExtraEnvVars() []cfg.EnvVar {
> + func ExtraEnvVarsCostly() []cfg.EnvVar {
> +       var b work.Builder
> +       b.Init()
> +-      cppflags, cflags, cxxflags, fflags, ldflags, err :=
> b.CFlags(&load.Package{})
> ++      cppflags, cflags, cxxflags, fflags, ldflags, err :=
> b.CFlags(&load.Package{}, false)
> +       if err != nil {
> +               // Should not happen - b.CFlags was given an empty package.
> +               fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
> +diff --git a/src/cmd/go/internal/work/exec.go
> b/src/cmd/go/internal/work/exec.go
> +index 7dd9a90..ccebaf8 100644
> +--- a/src/cmd/go/internal/work/exec.go
> ++++ b/src/cmd/go/internal/work/exec.go
> +@@ -32,6 +32,8 @@ import (
> +       "time"
> + )
> +
> ++var omitGopath = os.Getenv("GOPATH_OMIT_IN_ACTIONID") != ""
> ++
> + // actionList returns the list of actions in the dag rooted at root
> + // as visited in a depth-first post-order traversal.
> + func actionList(root *Action) []*Action {
> +@@ -205,7 +207,7 @@ func (b *Builder) buildActionID(a *Action)
> cache.ActionID {
> +       // The compiler hides the exact value of $GOROOT
> +       // when building things in GOROOT.
> +       // Assume b.WorkDir is being trimmed properly.
> +-      if !p.Goroot && !cfg.BuildTrimpath && !strings.HasPrefix(p.Dir,
> b.WorkDir) {
> ++      if !p.Goroot && !omitGopath && !cfg.BuildTrimpath &&
> !strings.HasPrefix(p.Dir, b.WorkDir) {
> +               fmt.Fprintf(h, "dir %s\n", p.Dir)
> +       }
> +       fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)
> +@@ -219,13 +221,13 @@ func (b *Builder) buildActionID(a *Action)
> cache.ActionID {
> +       }
> +       if len(p.CgoFiles)+len(p.SwigFiles) > 0 {
> +               fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
> +-              cppflags, cflags, cxxflags, fflags, ldflags, _ :=
> b.CFlags(p)
> +-              fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(), cppflags,
> cflags, ldflags)
> ++              cppflags, cflags, cxxflags, fflags, ldflags, _ :=
> b.CFlags(p, true)
> ++              fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(true),
> cppflags, cflags, ldflags)
> +               if len(p.CXXFiles)+len(p.SwigFiles) > 0 {
> +-                      fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(), cxxflags)
> ++                      fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(true),
> cxxflags)
> +               }
> +               if len(p.FFiles) > 0 {
> +-                      fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(), fflags)
> ++                      fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(true), fflags)
> +               }
> +               // TODO(rsc): Should we include the SWIG version or
> Fortran/GCC/G++/Objective-C compiler versions?
> +       }
> +@@ -2229,33 +2231,48 @@ var (
> + // gccCmd returns a gcc command line prefix
> + // defaultCC is defined in zdefaultcc.go, written by cmd/dist.
> + func (b *Builder) GccCmd(incdir, workdir string) []string {
> +-      return b.compilerCmd(b.ccExe(), incdir, workdir)
> ++      return b.compilerCmd(b.ccExe(false), incdir, workdir)
> + }
> +
> + // gxxCmd returns a g++ command line prefix
> + // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
> + func (b *Builder) GxxCmd(incdir, workdir string) []string {
> +-      return b.compilerCmd(b.cxxExe(), incdir, workdir)
> ++      return b.compilerCmd(b.cxxExe(false), incdir, workdir)
> + }
> +
> + // gfortranCmd returns a gfortran command line prefix.
> + func (b *Builder) gfortranCmd(incdir, workdir string) []string {
> +-      return b.compilerCmd(b.fcExe(), incdir, workdir)
> ++      return b.compilerCmd(b.fcExe(false), incdir, workdir)
> + }
> +
> + // ccExe returns the CC compiler setting without all the extra flags we
> add implicitly.
> +-func (b *Builder) ccExe() []string {
> +-      return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, cfg.Goarch))
> ++func (b *Builder) ccExe(filtered bool) []string {
> ++      return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, cfg.Goarch),
> filtered)
> + }
> +
> + // cxxExe returns the CXX compiler setting without all the extra flags
> we add implicitly.
> +-func (b *Builder) cxxExe() []string {
> +-      return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goos, cfg.Goarch))
> ++func (b *Builder) cxxExe(filtered bool) []string {
> ++      return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goos,
> cfg.Goarch), filtered)
> + }
> +
> + // fcExe returns the FC compiler setting without all the extra flags we
> add implicitly.
> +-func (b *Builder) fcExe() []string {
> +-      return b.compilerExe(cfg.Getenv("FC"), "gfortran")
> ++func (b *Builder) fcExe(filtered bool) []string {
> ++      return b.compilerExe(os.Getenv("FC"), "gfortran", filtered)
> ++}
> ++
> ++var filterFlags = os.Getenv("CGO_PEDANTIC") == ""
> ++
> ++func filterCompilerFlags(flags []string) []string {
> ++      var newflags []string
> ++      if !filterFlags {
> ++              return flags
> ++      }
> ++      for _, flag := range flags {
> ++              if strings.HasPrefix(flag, "-m") {
> ++                      newflags = append(newflags, flag)
> ++              }
> ++      }
> ++      return newflags
> + }
> +
> + // compilerExe returns the compiler to use given an
> +@@ -2264,11 +2281,16 @@ func (b *Builder) fcExe() []string {
> + // of the compiler but can have additional arguments if they
> + // were present in the environment value.
> + // For example if CC="gcc -DGOPHER" then the result is ["gcc",
> "-DGOPHER"].
> +-func (b *Builder) compilerExe(envValue string, def string) []string {
> ++func (b *Builder) compilerExe(envValue string, def string, filtered
> bool) []string {
> +       compiler := strings.Fields(envValue)
> +       if len(compiler) == 0 {
> +               compiler = []string{def}
> +       }
> ++
> ++      if filtered {
> ++              return append(compiler[0:1],
> filterCompilerFlags(compiler[1:])...)
> ++      }
> ++
> +       return compiler
> + }
> +
> +@@ -2429,7 +2451,7 @@ func envList(key, def string) []string {
> + }
> +
> + // CFlags returns the flags to use when invoking the C, C++ or Fortran
> compilers, or cgo.
> +-func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags,
> fflags, ldflags []string, err error) {
> ++func (b *Builder) CFlags(p *load.Package, filtered bool) (cppflags,
> cflags, cxxflags, fflags, ldflags []string, err error) {
> +       defaults := "-g -O2"
> +
> +       if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS,
> checkCompilerFlags); err != nil {
> +@@ -2448,6 +2470,14 @@ func (b *Builder) CFlags(p *load.Package)
> (cppflags, cflags, cxxflags, fflags, l
> +               return
> +       }
> +
> ++      if filtered {
> ++              cppflags = filterCompilerFlags(cppflags)
> ++              cflags = filterCompilerFlags(cflags)
> ++              cxxflags = filterCompilerFlags(cxxflags)
> ++              fflags = filterCompilerFlags(fflags)
> ++              ldflags = filterCompilerFlags(ldflags)
> ++      }
> ++
> +       return
> + }
> +
> +@@ -2462,7 +2492,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
> +
> + func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS,
> pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo,
> outObj []string, err error) {
> +       p := a.Package
> +-      cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err :=
> b.CFlags(p)
> ++      cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err :=
> b.CFlags(p, false)
> +       if err != nil {
> +               return nil, nil, err
> +       }
> +@@ -2821,7 +2851,7 @@ func (b *Builder) swigIntSize(objdir string)
> (intsize string, err error) {
> +
> + // Run SWIG on one SWIG input file.
> + func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir
> string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string,
> err error) {
> +-      cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p)
> ++      cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p,
> false)
> +       if err != nil {
> +               return "", "", err
> +       }
> +--
> +2.17.1 (Apple Git-112)
> +
> diff --git
> a/meta/recipes-devtools/go/go-1.13/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> b/meta/recipes-devtools/go/go-1.13/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> new file mode 100644
> index 0000000000..9aa0119ae9
> --- /dev/null
> +++
> b/meta/recipes-devtools/go/go-1.13/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> @@ -0,0 +1,54 @@
> +From 28ada8896b76d620240bafc22aa395071d601482 Mon Sep 17 00:00:00 2001
> +From: Alex Kube <alexander.j.kube@gmail.com>
> +Date: Wed, 23 Oct 2019 21:15:37 +0430
> +Subject: [PATCH 3/9] cmd/go: Allow GOTOOLDIR to be overridden in the
> environment
> +
> +to allow for split host/target build roots
> +
> +Adapted to Go 1.13 from patches originally submitted to
> +the meta/recipes-devtools/go tree by
> +Matt Madison <matt@madison.systems>.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
> +---
> + src/cmd/dist/build.go          | 4 +++-
> + src/cmd/go/internal/cfg/cfg.go | 6 +++++-
> + 2 files changed, 8 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
> +index 9e50311..683ca6f 100644
> +--- a/src/cmd/dist/build.go
> ++++ b/src/cmd/dist/build.go
> +@@ -244,7 +244,9 @@ func xinit() {
> +       workdir = xworkdir()
> +       xatexit(rmworkdir)
> +
> +-      tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
> ++      if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
> ++              tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos,
> gohostarch)
> ++      }
> + }
> +
> + // compilerEnv returns a map from "goos/goarch" to the
> +diff --git a/src/cmd/go/internal/cfg/cfg.go
> b/src/cmd/go/internal/cfg/cfg.go
> +index a3277a6..db96350 100644
> +--- a/src/cmd/go/internal/cfg/cfg.go
> ++++ b/src/cmd/go/internal/cfg/cfg.go
> +@@ -60,7 +60,11 @@ func defaultContext() build.Context {
> +               // variables. This matches the initialization of ToolDir in
> +               // go/build, except for using ctxt.GOROOT rather than
> +               // runtime.GOROOT.
> +-              build.ToolDir = filepath.Join(ctxt.GOROOT,
> "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
> ++              if s := os.Getenv("GOTOOLDIR"); s != "" {
> ++                      build.ToolDir = filepath.Clean(s)
> ++              } else {
> ++                      build.ToolDir = filepath.Join(ctxt.GOROOT,
> "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
> ++              }
> +       }
> +
> +       ctxt.GOPATH = envOr("GOPATH", ctxt.GOPATH)
> +--
> +2.17.1 (Apple Git-112)
> +
> diff --git
> a/meta/recipes-devtools/go/go-1.13/0004-ld-add-soname-to-shareable-objects.patch
> b/meta/recipes-devtools/go/go-1.13/0004-ld-add-soname-to-shareable-objects.patch
> new file mode 100644
> index 0000000000..40763ad5b1
> --- /dev/null
> +++
> b/meta/recipes-devtools/go/go-1.13/0004-ld-add-soname-to-shareable-objects.patch
> @@ -0,0 +1,50 @@
> +From bf5cf5301ae5914498454c87293d1df2e1d8489f Mon Sep 17 00:00:00 2001
> +From: Alex Kube <alexander.j.kube@gmail.com>
> +Date: Wed, 23 Oct 2019 21:16:32 +0430
> +Subject: [PATCH 4/9] ld: add soname to shareable objects
> +
> +so that OE's shared library dependency handling
> +can find them.
> +
> +Adapted to Go 1.13 from patches originally submitted to
> +the meta/recipes-devtools/go tree by
> +Matt Madison <matt@madison.systems>.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
> +---
> + src/cmd/link/internal/ld/lib.go | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/src/cmd/link/internal/ld/lib.go
> b/src/cmd/link/internal/ld/lib.go
> +index 3fa258d..f96fb02 100644
> +--- a/src/cmd/link/internal/ld/lib.go
> ++++ b/src/cmd/link/internal/ld/lib.go
> +@@ -1215,6 +1215,7 @@ func (ctxt *Link) hostlink() {
> +                               argv = append(argv, "-Wl,-z,relro")
> +                       }
> +                       argv = append(argv, "-shared")
> ++                      argv = append(argv, fmt.Sprintf("-Wl,-soname,%s",
> filepath.Base(*flagOutfile)))
> +                       if ctxt.HeadType != objabi.Hwindows {
> +                               // Pass -z nodelete to mark the shared
> library as
> +                               // non-closeable: a dlclose will do
> nothing.
> +@@ -1226,6 +1227,7 @@ func (ctxt *Link) hostlink() {
> +                       argv = append(argv, "-Wl,-z,relro")
> +               }
> +               argv = append(argv, "-shared")
> ++              argv = append(argv, fmt.Sprintf("-Wl,-soname,%s",
> filepath.Base(*flagOutfile)))
> +       case BuildModePlugin:
> +               if ctxt.HeadType == objabi.Hdarwin {
> +                       argv = append(argv, "-dynamiclib")
> +@@ -1234,6 +1236,7 @@ func (ctxt *Link) hostlink() {
> +                               argv = append(argv, "-Wl,-z,relro")
> +                       }
> +                       argv = append(argv, "-shared")
> ++                      argv = append(argv, fmt.Sprintf("-Wl,-soname,%s",
> filepath.Base(*flagOutfile)))
> +               }
> +       }
> +
> +--
> +2.17.1 (Apple Git-112)
> +
> diff --git
> a/meta/recipes-devtools/go/go-1.13/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> b/meta/recipes-devtools/go/go-1.13/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> new file mode 100644
> index 0000000000..4f2a46c6ce
> --- /dev/null
> +++
> b/meta/recipes-devtools/go/go-1.13/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> @@ -0,0 +1,44 @@
> +From f05ef3ded52b98537c10efd0b15cd9612471524d Mon Sep 17 00:00:00 2001
> +From: Alex Kube <alexander.j.kube@gmail.com>
> +Date: Wed, 23 Oct 2019 21:17:16 +0430
> +Subject: [PATCH 5/9] make.bash: override CC when building dist and
> + go_bootstrap
> +
> +for handling OE cross-canadian builds.
> +
> +Adapted to Go 1.13 from patches originally submitted to
> +the meta/recipes-devtools/go tree by
> +Matt Madison <matt@madison.systems>.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
> +---
> + src/make.bash | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/make.bash b/src/make.bash
> +index 92d1481..0c2822f 100755
> +--- a/src/make.bash
> ++++ b/src/make.bash
> +@@ -177,7 +177,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
> +       exit 1
> + fi
> + rm -f cmd/dist/dist
> +-GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" GO111MODULE=off
> "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
> ++CC="${BUILD_CC:-${CC}}" GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH=""
> GO111MODULE=off "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
> +
> + # -e doesn't propagate out of eval, so check success by hand.
> + eval $(./cmd/dist/dist env -p || echo FAIL=true)
> +@@ -208,7 +208,7 @@ fi
> + # Run dist bootstrap to complete make.bash.
> + # Bootstrap installs a proper cmd/dist, built with the new toolchain.
> + # Throw ours, built with Go 1.4, away after bootstrap.
> +-./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
> ++CC="${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap $buildall $vflag
> $GO_DISTFLAGS "$@"
> + rm -f ./cmd/dist/dist
> +
> + # DO NOT ADD ANY NEW CODE HERE.
> +--
> +2.17.1 (Apple Git-112)
> +
> diff --git
> a/meta/recipes-devtools/go/go-1.13/0006-cmd-dist-separate-host-and-target-builds.patch
> b/meta/recipes-devtools/go/go-1.13/0006-cmd-dist-separate-host-and-target-builds.patch
> new file mode 100644
> index 0000000000..354aaca3a1
> --- /dev/null
> +++
> b/meta/recipes-devtools/go/go-1.13/0006-cmd-dist-separate-host-and-target-builds.patch
> @@ -0,0 +1,279 @@
> +From 10735bb84df17ba657f76835f483cd8543a879c1 Mon Sep 17 00:00:00 2001
> +From: Alex Kube <alexander.j.kube@gmail.com>
> +Date: Wed, 23 Oct 2019 21:18:12 +0430
> +Subject: [PATCH 6/9] cmd/dist: separate host and target builds
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Change the dist tool to allow for OE-style cross-
> +and cross-canadian builds:
> +
> + - command flags --host-only and --target only are added;
> +   if one is present, the other changes mentioned below
> +   take effect, and arguments may also be specified on
> +   the command line to enumerate the package(s) to be
> +   built.
> +
> + - for OE cross builds, go_bootstrap is always built for
> +   the current build host, and is moved, along with the supporting
> +   toolchain (asm, compile, etc.) to a separate 'native_native'
> +   directory under GOROOT/pkg/tool.
> +
> + - go_bootstrap is not automatically removed after the build,
> +   so it can be reused later (e.g., building both static and
> +   shared runtime).
> +
> +Note that for --host-only builds, it would be nice to specify
> +just the "cmd" package to build only the go commands/tools,
> +the staleness checks in the dist tool will fail if the "std"
> +library has not also been built.  So host-only builds have to
> +build everything anyway.
> +
> +Adapted to Go 1.13 from patches originally submitted to
> +the meta/recipes-devtools/go tree by
> +Matt Madison <matt@madison.systems>.
> +
> +Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
> +---
> + src/cmd/dist/build.go | 155 ++++++++++++++++++++++++++++++------------
> + 1 file changed, 112 insertions(+), 43 deletions(-)
> +
> +diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
> +index 683ca6f..0ad082b 100644
> +--- a/src/cmd/dist/build.go
> ++++ b/src/cmd/dist/build.go
> +@@ -41,6 +41,7 @@ var (
> +       goldflags        string
> +       workdir          string
> +       tooldir          string
> ++      build_tooldir    string
> +       oldgoos          string
> +       oldgoarch        string
> +       exe              string
> +@@ -53,6 +54,7 @@ var (
> +
> +       rebuildall   bool
> +       defaultclang bool
> ++      crossBuild   bool
> +
> +       vflag int // verbosity
> + )
> +@@ -247,6 +249,8 @@ func xinit() {
> +       if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
> +               tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos,
> gohostarch)
> +       }
> ++
> ++      build_tooldir = pathf("%s/pkg/tool/native_native", goroot)
> + }
> +
> + // compilerEnv returns a map from "goos/goarch" to the
> +@@ -478,8 +482,10 @@ func setup() {
> +       p := pathf("%s/pkg/%s_%s", goroot, gohostos, gohostarch)
> +       if rebuildall {
> +               xremoveall(p)
> ++              xremoveall(build_tooldir)
> +       }
> +       xmkdirall(p)
> ++      xmkdirall(build_tooldir)
> +
> +       if goos != gohostos || goarch != gohostarch {
> +               p := pathf("%s/pkg/%s_%s", goroot, goos, goarch)
> +@@ -1207,12 +1213,29 @@ func cmdbootstrap() {
> +
> +       var noBanner bool
> +       var debug bool
> ++      var hostOnly bool
> ++      var targetOnly bool
> ++      var toBuild = []string{"std", "cmd"}
> ++
> +       flag.BoolVar(&rebuildall, "a", rebuildall, "rebuild all")
> +       flag.BoolVar(&debug, "d", debug, "enable debugging of bootstrap
> process")
> +       flag.BoolVar(&noBanner, "no-banner", noBanner, "do not print
> banner")
> ++      flag.BoolVar(&hostOnly, "host-only", hostOnly, "build only host
> binaries, not target")
> ++      flag.BoolVar(&targetOnly, "target-only", targetOnly, "build only
> target binaries, not host")
> +
> +-      xflagparse(0)
> ++      xflagparse(-1)
> +
> ++      if hostOnly && targetOnly {
> ++              fatalf("specify only one of --host-only or
> --target-only\n")
> ++      }
> ++      crossBuild = hostOnly || targetOnly
> ++      if flag.NArg() > 0 {
> ++              if crossBuild {
> ++                      toBuild = flag.Args()
> ++              } else {
> ++                      fatalf("package names not permitted without
> --host-only or --target-only\n")
> ++              }
> ++      }
> +       // Set GOPATH to an internal directory. We shouldn't actually
> +       // need to store files here, since the toolchain won't
> +       // depend on modules outside of vendor directories, but if
> +@@ -1266,8 +1289,13 @@ func cmdbootstrap() {
> +               xprintf("\n")
> +       }
> +
> +-      gogcflags = os.Getenv("GO_GCFLAGS") // we were using
> $BOOT_GO_GCFLAGS until now
> +-      goldflags = os.Getenv("GO_LDFLAGS") // we were using
> $BOOT_GO_LDFLAGS until now
> ++      // For split host/target cross/cross-canadian builds, we don't
> ++      // want to be setting these flags until after we have compiled
> ++      // the toolchain that runs on the build host.
> ++      if !crossBuild {
> ++              gogcflags = os.Getenv("GO_GCFLAGS") // we were using
> $BOOT_GO_GCFLAGS until now
> ++              goldflags = os.Getenv("GO_LDFLAGS") // we were using
> $BOOT_GO_LDFLAGS until now
> ++      }
> +       goBootstrap := pathf("%s/go_bootstrap", tooldir)
> +       cmdGo := pathf("%s/go", gobin)
> +       if debug {
> +@@ -1296,7 +1324,11 @@ func cmdbootstrap() {
> +               xprintf("\n")
> +       }
> +       xprintf("Building Go toolchain2 using go_bootstrap and Go
> toolchain1.\n")
> +-      os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
> ++      if crossBuild {
> ++              os.Setenv("CC", defaultcc[""])
> ++      } else {
> ++              os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
> ++      }
> +       goInstall(goBootstrap, append([]string{"-i"}, toolchain...)...)
> +       if debug {
> +               run("", ShowOutput|CheckExit, pathf("%s/compile",
> tooldir), "-V=full")
> +@@ -1333,50 +1365,84 @@ func cmdbootstrap() {
> +       }
> +       checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
> +
> +-      if goos == oldgoos && goarch == oldgoarch {
> +-              // Common case - not setting up for cross-compilation.
> +-              timelog("build", "toolchain")
> +-              if vflag > 0 {
> +-                      xprintf("\n")
> ++      if crossBuild {
> ++              gogcflags = os.Getenv("GO_GCFLAGS")
> ++              goldflags = os.Getenv("GO_LDFLAGS")
> ++              tool_files, _ := filepath.Glob(pathf("%s/*", tooldir))
> ++              for _, f := range tool_files {
> ++                      copyfile(pathf("%s/%s", build_tooldir,
> filepath.Base(f)), f, writeExec)
> ++                      xremove(f)
> ++              }
> ++              os.Setenv("GOTOOLDIR", build_tooldir)
> ++              goBootstrap = pathf("%s/go_bootstrap", build_tooldir)
> ++              if hostOnly {
> ++                      timelog("build", "host toolchain")
> ++                      if vflag > 0 {
> ++                              xprintf("\n")
> ++                      }
> ++                      xprintf("Building %s for host, %s/%s.\n",
> strings.Join(toBuild, ","), goos, goarch)
> ++                      goInstall(goBootstrap, toBuild...)
> ++                      checkNotStale(goBootstrap, toBuild...)
> ++                      // Skip cmdGo staleness checks here, since we
> can't necessarily run the cmdGo binary
> ++
> ++                      timelog("build", "target toolchain")
> ++                      if vflag > 0 {
> ++                              xprintf("\n")
> ++                      }
> ++              } else if targetOnly {
> ++                      goos = oldgoos
> ++                      goarch = oldgoarch
> ++                      os.Setenv("GOOS", goos)
> ++                      os.Setenv("GOARCH", goarch)
> ++                      os.Setenv("CC", compilerEnvLookup(defaultcc, goos,
> goarch))
> ++                      xprintf("Building %s for target, %s/%s.\n",
> strings.Join(toBuild, ","), goos, goarch)
> ++                      goInstall(goBootstrap, toBuild...)
> ++                      checkNotStale(goBootstrap, toBuild...)
> ++                      // Skip cmdGo staleness checks here, since we
> can't run the target's cmdGo binary
> +               }
> +-              xprintf("Building packages and commands for %s/%s.\n",
> goos, goarch)
> +       } else {
> +-              // GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.
> +-              // Finish GOHOSTOS/GOHOSTARCH installation and then
> +-              // run GOOS/GOARCH installation.
> +-              timelog("build", "host toolchain")
> +-              if vflag > 0 {
> +-                      xprintf("\n")
> +-              }
> +-              xprintf("Building packages and commands for host,
> %s/%s.\n", goos, goarch)
> ++
> ++              if goos == oldgoos && goarch == oldgoarch {
> ++                      // Common case - not setting up for
> cross-compilation.
> ++                      timelog("build", "toolchain")
> ++                      if vflag > 0 {
> ++                              xprintf("\n")
> ++                      }
> ++                      xprintf("Building packages and commands for
> %s/%s.\n", goos, goarch)
> ++              } else {
> ++                      // GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.
> ++                      // Finish GOHOSTOS/GOHOSTARCH installation and then
> ++                      // run GOOS/GOARCH installation.
> ++                      timelog("build", "host toolchain")
> ++                      if vflag > 0 {
> ++                              xprintf("\n")
> ++                      }
> ++                      xprintf("Building packages and commands for host,
> %s/%s.\n", goos, goarch)
> ++                      goInstall(goBootstrap, "std", "cmd")
> ++                      checkNotStale(goBootstrap, "std", "cmd")
> ++                      checkNotStale(cmdGo, "std", "cmd")
> ++
> ++                      timelog("build", "target toolchain")
> ++                      if vflag > 0 {
> ++                              xprintf("\n")
> ++                      }
> ++                      goos = oldgoos
> ++                      goarch = oldgoarch
> ++                      os.Setenv("GOOS", goos)
> ++                      os.Setenv("GOARCH", goarch)
> ++                      os.Setenv("CC", compilerEnvLookup(defaultcc, goos,
> goarch))
> ++                      xprintf("Building packages and commands for
> target, %s/%s.\n", goos, goarch)
> ++              }
> +               goInstall(goBootstrap, "std", "cmd")
> +               checkNotStale(goBootstrap, "std", "cmd")
> +               checkNotStale(cmdGo, "std", "cmd")
> +
> +-              timelog("build", "target toolchain")
> +-              if vflag > 0 {
> +-                      xprintf("\n")
> ++              if debug {
> ++                      run("", ShowOutput|CheckExit, pathf("%s/compile",
> tooldir), "-V=full")
> ++                      run("", ShowOutput|CheckExit, pathf("%s/buildid",
> tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos,
> goarch))
> ++                      checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
> ++                      copyfile(pathf("%s/compile4", tooldir),
> pathf("%s/compile", tooldir), writeExec)
> +               }
> +-              goos = oldgoos
> +-              goarch = oldgoarch
> +-              os.Setenv("GOOS", goos)
> +-              os.Setenv("GOARCH", goarch)
> +-              os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
> +-              xprintf("Building packages and commands for target,
> %s/%s.\n", goos, goarch)
> +-      }
> +-      targets := []string{"std", "cmd"}
> +-      if goos == "js" && goarch == "wasm" {
> +-              // Skip the cmd tools for js/wasm. They're not usable.
> +-              targets = targets[:1]
> +-      }
> +-      goInstall(goBootstrap, targets...)
> +-      checkNotStale(goBootstrap, targets...)
> +-      checkNotStale(cmdGo, targets...)
> +-      if debug {
> +-              run("", ShowOutput|CheckExit, pathf("%s/compile",
> tooldir), "-V=full")
> +-              run("", ShowOutput|CheckExit, pathf("%s/buildid",
> tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos,
> goarch))
> +-              checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
> +-              copyfile(pathf("%s/compile4", tooldir),
> pathf("%s/compile", tooldir), writeExec)
> +       }
> +
> +       // Check that there are no new files in $GOROOT/bin other than
> +@@ -1393,8 +1459,11 @@ func cmdbootstrap() {
> +               }
> +       }
> +
> +-      // Remove go_bootstrap now that we're done.
> +-      xremove(pathf("%s/go_bootstrap", tooldir))
> ++      // Except that for split host/target cross-builds, we need to
> ++      // keep it.
> ++      if !crossBuild {
> ++              xremove(pathf("%s/go_bootstrap", tooldir))
> ++      }
> +
> +       if goos == "android" {
> +               // Make sure the exec wrapper will sync a fresh $GOROOT to
> the device.
> +--
> +2.17.1 (Apple Git-112)
> +
> diff --git
> a/meta/recipes-devtools/go/go-1.13/0007-cmd-go-make-GOROOT-precious-by-default.patch
> b/meta/recipes-devtools/go/go-1.13/0007-cmd-go-make-GOROOT-precious-by-default.patch
> new file mode 100644
> index 0000000000..e232c79199
> --- /dev/null
> +++
> b/meta/recipes-devtools/go/go-1.13/0007-cmd-go-make-GOROOT-precious-by-default.patch
> @@ -0,0 +1,113 @@
> +From 9ba507e076c744f4d394418e4a849e68cd426a4a Mon Sep 17 00:00:00 2001
> +From: Alex Kube <alexander.j.kube@gmail.com>
> +Date: Wed, 23 Oct 2019 21:18:56 +0430
> +Subject: [PATCH 7/9] cmd/go: make GOROOT precious by default
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +The go build tool normally rebuilds whatever it detects is
> +stale.  This can be a problem when GOROOT is intended to
> +be read-only and the go runtime has been built as a shared
> +library, since we don't want every application to be rebuilding
> +the shared runtime - particularly in cross-build/packaging
> +setups, since that would lead to 'abi mismatch' runtime errors.
> +
> +This patch prevents the install and linkshared actions from
> +installing to GOROOT unless overridden with the GOROOT_OVERRIDE
> +environment variable.
> +
> +Adapted to Go 1.13 from patches originally submitted to
> +the meta/recipes-devtools/go tree by
> +Matt Madison <matt@madison.systems>.
> +
> +Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
> +---
> + src/cmd/go/internal/work/action.go |  3 +++
> + src/cmd/go/internal/work/build.go  |  6 ++++++
> + src/cmd/go/internal/work/exec.go   | 25 +++++++++++++++++++++++++
> + 3 files changed, 34 insertions(+)
> +
> +diff --git a/src/cmd/go/internal/work/action.go
> b/src/cmd/go/internal/work/action.go
> +index 33b7818..7617b4c 100644
> +--- a/src/cmd/go/internal/work/action.go
> ++++ b/src/cmd/go/internal/work/action.go
> +@@ -662,6 +662,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1
> *Action, shlib string) {
> +                       if p1 == nil || p1.Shlib == "" ||
> haveShlib[filepath.Base(p1.Shlib)] {
> +                               continue
> +                       }
> ++                      if goRootPrecious && (p1.Standard || p1.Goroot) {
> ++                              continue
> ++                      }
> +                       haveShlib[filepath.Base(p1.Shlib)] = true
> +                       // TODO(rsc): The use of ModeInstall here is
> suspect, but if we only do ModeBuild,
> +                       // we'll end up building an overall library or
> executable that depends at runtime
> +diff --git a/src/cmd/go/internal/work/build.go
> b/src/cmd/go/internal/work/build.go
> +index 9305b2d..6560317 100644
> +--- a/src/cmd/go/internal/work/build.go
> ++++ b/src/cmd/go/internal/work/build.go
> +@@ -155,6 +155,8 @@ See also: go install, go get, go clean.
> +
> + const concurrentGCBackendCompilationEnabledByDefault = true
> +
> ++var goRootPrecious bool = true
> ++
> + func init() {
> +       // break init cycle
> +       CmdBuild.Run = runBuild
> +@@ -167,6 +169,10 @@ func init() {
> +
> +       AddBuildFlags(CmdBuild)
> +       AddBuildFlags(CmdInstall)
> ++
> ++      if x := os.Getenv("GOROOT_OVERRIDE"); x != "" {
> ++              goRootPrecious = false
> ++      }
> + }
> +
> + // Note that flags consulted by other parts of the code
> +diff --git a/src/cmd/go/internal/work/exec.go
> b/src/cmd/go/internal/work/exec.go
> +index ccebaf8..59450d7 100644
> +--- a/src/cmd/go/internal/work/exec.go
> ++++ b/src/cmd/go/internal/work/exec.go
> +@@ -455,6 +455,23 @@ func (b *Builder) build(a *Action) (err error) {
> +               return errors.New("binary-only packages are no longer
> supported")
> +       }
> +
> ++      if goRootPrecious && (a.Package.Standard || a.Package.Goroot) {
> ++              _, err := os.Stat(a.Package.Target)
> ++              if err == nil {
> ++                      a.built = a.Package.Target
> ++                      a.Target = a.Package.Target
> ++                      a.buildID = b.fileHash(a.Package.Target)
> ++                      a.Package.Stale = false
> ++                      a.Package.StaleReason = "GOROOT-resident package"
> ++                      return nil
> ++              }
> ++              a.Package.Stale = true
> ++              a.Package.StaleReason = "missing or invalid
> GOROOT-resident package"
> ++              if b.IsCmdList {
> ++                      return nil
> ++              }
> ++      }
> ++
> +       if err := b.Mkdir(a.Objdir); err != nil {
> +               return err
> +       }
> +@@ -1499,6 +1516,14 @@ func BuildInstallFunc(b *Builder, a *Action) (err
> error) {
> +               return nil
> +       }
> +
> ++      if goRootPrecious && a.Package != nil {
> ++              p := a.Package
> ++              if p.Standard || p.Goroot {
> ++                      err := fmt.Errorf("attempting to install package
> %s into read-only GOROOT", p.ImportPath)
> ++                      return err
> ++              }
> ++      }
> ++
> +       if err := b.Mkdir(a.Objdir); err != nil {
> +               return err
> +       }
> +--
> +2.17.1 (Apple Git-112)
> +
> diff --git
> a/meta/recipes-devtools/go/go-1.13/0008-use-GOBUILDMODE-to-set-buildmode.patch
> b/meta/recipes-devtools/go/go-1.13/0008-use-GOBUILDMODE-to-set-buildmode.patch
> new file mode 100644
> index 0000000000..68e132f30a
> --- /dev/null
> +++
> b/meta/recipes-devtools/go/go-1.13/0008-use-GOBUILDMODE-to-set-buildmode.patch
> @@ -0,0 +1,47 @@
> +From 971b5626339ce0c4d57f9721c9a81af566c5a044 Mon Sep 17 00:00:00 2001
> +From: Alex Kube <alexander.j.kube@gmail.com>
> +Date: Wed, 23 Oct 2019 21:19:26 +0430
> +Subject: [PATCH 8/9] cmd/go: Use GOBUILDMODE to set buildmode
> +
> +Upstream-Status: Denied [upstream choose antoher solution: `17a256b
> +cmd/go: -buildmode=pie for android/arm']
> +
> +While building go itself, the go build system does not support
> +to set `-buildmode=pie' from environment.
> +
> +Add GOBUILDMODE to support it which make PIE executables the default
> +build mode, as PIE executables are required as of Yocto
> +
> +Refers: https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI
> +
> +Adapted to Go 1.13 from patches originally submitted to
> +the meta/recipes-devtools/go tree by
> +Hongxu Jia <hongxu.jia@windriver.com>
> +
> +Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
> +---
> + src/cmd/go/internal/work/build.go | 8 +++++++-
> + 1 file changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/cmd/go/internal/work/build.go
> b/src/cmd/go/internal/work/build.go
> +index 6560317..5f3a988 100644
> +--- a/src/cmd/go/internal/work/build.go
> ++++ b/src/cmd/go/internal/work/build.go
> +@@ -231,7 +231,13 @@ func AddBuildFlags(cmd *base.Command) {
> +
> +       cmd.Flag.Var(&load.BuildAsmflags, "asmflags", "")
> +       cmd.Flag.Var(buildCompiler{}, "compiler", "")
> +-      cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", "default", "")
> ++
> ++      if bm := os.Getenv("GOBUILDMODE"); bm != "" {
> ++              cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", bm,
> "")
> ++      } else {
> ++              cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode",
> "default", "")
> ++      }
> ++
> +       cmd.Flag.Var(&load.BuildGcflags, "gcflags", "")
> +       cmd.Flag.Var(&load.BuildGccgoflags, "gccgoflags", "")
> +       cmd.Flag.StringVar(&cfg.BuildMod, "mod", "", "")
> +--
> +2.17.1 (Apple Git-112)
> +
> diff --git
> a/meta/recipes-devtools/go/go-1.13/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
> b/meta/recipes-devtools/go/go-1.13/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
> new file mode 100644
> index 0000000000..4bb1106f09
> --- /dev/null
> +++
> b/meta/recipes-devtools/go/go-1.13/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
> @@ -0,0 +1,134 @@
> +From 973251ae0c69a35721f6115345d3f57b2847979f Mon Sep 17 00:00:00 2001
> +From: Alex Kube <alexander.j.kube@gmail.com>
> +Date: Wed, 23 Oct 2019 21:20:13 +0430
> +Subject: [PATCH 9/9] ld: replace glibc dynamic linker with musl
> +
> +Rework of patch by Khem Raj <raj.khem@gmail.com>
> +for go 1.10.  Should be applied conditionally on
> +musl being the system C library.
> +
> +Adapted to Go 1.13 from patches originally submitted to
> +the meta/recipes-devtools/go tree by
> +Matt Madison <matt@madison.systems>.
> +
> +Upstream-Status: Inappropriate [Real fix should be portable across libcs]
> +
> +Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
> +---
> + src/cmd/link/internal/amd64/obj.go  | 2 +-
> + src/cmd/link/internal/arm/obj.go    | 2 +-
> + src/cmd/link/internal/arm64/obj.go  | 2 +-
> + src/cmd/link/internal/mips/obj.go   | 2 +-
> + src/cmd/link/internal/mips64/obj.go | 2 +-
> + src/cmd/link/internal/ppc64/obj.go  | 2 +-
> + src/cmd/link/internal/s390x/obj.go  | 2 +-
> + src/cmd/link/internal/x86/obj.go    | 2 +-
> + 8 files changed, 8 insertions(+), 8 deletions(-)
> +
> +diff --git a/src/cmd/link/internal/amd64/obj.go
> b/src/cmd/link/internal/amd64/obj.go
> +index 23741eb..8e74576 100644
> +--- a/src/cmd/link/internal/amd64/obj.go
> ++++ b/src/cmd/link/internal/amd64/obj.go
> +@@ -62,7 +62,7 @@ func Init() (*sys.Arch, ld.Arch) {
> +               PEreloc1:         pereloc1,
> +               TLSIEtoLE:        tlsIEtoLE,
> +
> +-              Linuxdynld:     "/lib64/ld-linux-x86-64.so.2",
> ++              Linuxdynld:     "/lib64/ld-musl-x86-64.so.1",
> +               Freebsddynld:   "/libexec/ld-elf.so.1",
> +               Openbsddynld:   "/usr/libexec/ld.so",
> +               Netbsddynld:    "/libexec/ld.elf_so",
> +diff --git a/src/cmd/link/internal/arm/obj.go
> b/src/cmd/link/internal/arm/obj.go
> +index 45a406e..724d3e3 100644
> +--- a/src/cmd/link/internal/arm/obj.go
> ++++ b/src/cmd/link/internal/arm/obj.go
> +@@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {
> +               Machoreloc1:      machoreloc1,
> +               PEreloc1:         pereloc1,
> +
> +-              Linuxdynld:     "/lib/ld-linux.so.3", // 2 for OABI, 3 for
> EABI
> ++              Linuxdynld:     "/lib/ld-musl-armhf.so.1",
> +               Freebsddynld:   "/usr/libexec/ld-elf.so.1",
> +               Openbsddynld:   "/usr/libexec/ld.so",
> +               Netbsddynld:    "/libexec/ld.elf_so",
> +diff --git a/src/cmd/link/internal/arm64/obj.go
> b/src/cmd/link/internal/arm64/obj.go
> +index 7c66623..d8b1db1 100644
> +--- a/src/cmd/link/internal/arm64/obj.go
> ++++ b/src/cmd/link/internal/arm64/obj.go
> +@@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
> +               Gentext:          gentext,
> +               Machoreloc1:      machoreloc1,
> +
> +-              Linuxdynld: "/lib/ld-linux-aarch64.so.1",
> ++              Linuxdynld: "/lib/ld-musl-aarch64.so.1",
> +
> +               Freebsddynld:   "XXX",
> +               Openbsddynld:   "/usr/libexec/ld.so",
> +diff --git a/src/cmd/link/internal/mips/obj.go
> b/src/cmd/link/internal/mips/obj.go
> +index 231e1ff..631dd7a 100644
> +--- a/src/cmd/link/internal/mips/obj.go
> ++++ b/src/cmd/link/internal/mips/obj.go
> +@@ -60,7 +60,7 @@ func Init() (*sys.Arch, ld.Arch) {
> +               Gentext:          gentext,
> +               Machoreloc1:      machoreloc1,
> +
> +-              Linuxdynld: "/lib/ld.so.1",
> ++              Linuxdynld: "/lib/ld-musl-mipsle.so.1",
> +
> +               Freebsddynld:   "XXX",
> +               Openbsddynld:   "XXX",
> +diff --git a/src/cmd/link/internal/mips64/obj.go
> b/src/cmd/link/internal/mips64/obj.go
> +index 9604208..5ef3ffc 100644
> +--- a/src/cmd/link/internal/mips64/obj.go
> ++++ b/src/cmd/link/internal/mips64/obj.go
> +@@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {
> +               Gentext:          gentext,
> +               Machoreloc1:      machoreloc1,
> +
> +-              Linuxdynld:     "/lib64/ld64.so.1",
> ++              Linuxdynld:     "/lib64/ld-musl-mips64le.so.1",
> +               Freebsddynld:   "XXX",
> +               Openbsddynld:   "XXX",
> +               Netbsddynld:    "XXX",
> +diff --git a/src/cmd/link/internal/ppc64/obj.go
> b/src/cmd/link/internal/ppc64/obj.go
> +index 51d1791..b15da85 100644
> +--- a/src/cmd/link/internal/ppc64/obj.go
> ++++ b/src/cmd/link/internal/ppc64/obj.go
> +@@ -63,7 +63,7 @@ func Init() (*sys.Arch, ld.Arch) {
> +               Xcoffreloc1:      xcoffreloc1,
> +
> +               // TODO(austin): ABI v1 uses /usr/lib/ld.so.1,
> +-              Linuxdynld: "/lib64/ld64.so.1",
> ++              Linuxdynld: "/lib64/ld-musl-powerpc64le.so.1",
> +
> +               Freebsddynld:   "XXX",
> +               Openbsddynld:   "XXX",
> +diff --git a/src/cmd/link/internal/s390x/obj.go
> b/src/cmd/link/internal/s390x/obj.go
> +index 3454476..42cc346 100644
> +--- a/src/cmd/link/internal/s390x/obj.go
> ++++ b/src/cmd/link/internal/s390x/obj.go
> +@@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
> +               Gentext:          gentext,
> +               Machoreloc1:      machoreloc1,
> +
> +-              Linuxdynld: "/lib64/ld64.so.1",
> ++              Linuxdynld: "/lib64/ld-musl-s390x.so.1",
> +
> +               // not relevant for s390x
> +               Freebsddynld:   "XXX",
> +diff --git a/src/cmd/link/internal/x86/obj.go
> b/src/cmd/link/internal/x86/obj.go
> +index f1fad20..d2ca10c 100644
> +--- a/src/cmd/link/internal/x86/obj.go
> ++++ b/src/cmd/link/internal/x86/obj.go
> +@@ -58,7 +58,7 @@ func Init() (*sys.Arch, ld.Arch) {
> +               Machoreloc1:      machoreloc1,
> +               PEreloc1:         pereloc1,
> +
> +-              Linuxdynld:   "/lib/ld-linux.so.2",
> ++              Linuxdynld:   "/lib/ld-musl-i386.so.1",
> +               Freebsddynld: "/usr/libexec/ld-elf.so.1",
> +               Openbsddynld: "/usr/libexec/ld.so",
> +               Netbsddynld:  "/usr/libexec/ld.elf_so",
> +--
> +2.17.1 (Apple Git-112)
> +
> --
> 2.17.1 (Apple Git-112)
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000003f9ef10595b8ca6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Looks good but please delete 1.12 along as well=C2=
=A0</div></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Oct 24, 2019 at 9:39 PM Alexander Kube &lt;<a href=
=3D"mailto:alexander.j.kube@gmail.com">alexander.j.kube@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">From: Alex Kube &lt;<a href=
=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@g=
mail.com</a>&gt;<br>
<br>
Signed-off-by: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com" =
target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
---<br>
=C2=A0...ow-CC-and-CXX-to-have-multiple-words.patch |=C2=A0 38 +++<br>
=C2=A0...ent-based-hash-generation-less-pedan.patch | 226 ++++++++++++++<br=
>
=C2=A0...-to-be-overridden-in-the-environment.patch |=C2=A0 54 ++++<br>
=C2=A0...4-ld-add-soname-to-shareable-objects.patch |=C2=A0 50 ++++<br>
=C2=A0...de-CC-when-building-dist-and-go_boot.patch |=C2=A0 44 +++<br>
=C2=A0...dist-separate-host-and-target-builds.patch | 279 +++++++++++++++++=
+<br>
=C2=A0...d-go-make-GOROOT-precious-by-default.patch | 113 +++++++<br>
=C2=A0...008-use-GOBUILDMODE-to-set-buildmode.patch |=C2=A0 47 +++<br>
=C2=A0...place-glibc-dynamic-linker-with-musl.patch | 134 +++++++++<br>
=C2=A09 files changed, 985 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.13/0001-allow-CC-and=
-CXX-to-have-multiple-words.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.13/0002-cmd-go-make-=
content-based-hash-generation-less-pedan.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.13/0003-allow-GOTOOL=
DIR-to-be-overridden-in-the-environment.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.13/0004-ld-add-sonam=
e-to-shareable-objects.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.13/0005-make.bash-ov=
erride-CC-when-building-dist-and-go_boot.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.13/0006-cmd-dist-sep=
arate-host-and-target-builds.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.13/0007-cmd-go-make-=
GOROOT-precious-by-default.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.13/0008-use-GOBUILDM=
ODE-to-set-buildmode.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.13/0009-ld-replace-g=
libc-dynamic-linker-with-musl.patch<br>
<br>
diff --git a/meta/recipes-devtools/go/go-1.13/0001-allow-CC-and-CXX-to-have=
-multiple-words.patch b/meta/recipes-devtools/go/go-1.13/0001-allow-CC-and-=
CXX-to-have-multiple-words.patch<br>
new file mode 100644<br>
index 0000000000..ddfd5e41d1<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-1.13/0001-allow-CC-and-CXX-to-have-multip=
le-words.patch<br>
@@ -0,0 +1,38 @@<br>
+From 9e3dc44cdfa58d96504d0a789dc82617dd5bef55 Mon Sep 17 00:00:00 2001<br>
+From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com" target=
=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
+Date: Wed, 23 Oct 2019 21:01:13 +0430<br>
+Subject: [PATCH 1/9] cmd/go: Allow CC and CXX to have multiple words<br>
+<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+<br>
+Adapted to Go 1.13 from patches originally submitted to<br>
+the meta/recipes-devtools/go tree by<br>
+Matt Madison &lt;matt@madison.systems&gt;.<br>
+<br>
+Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:alexander.j.kube@gma=
il.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
+<br>
+---<br>
+ src/cmd/go/internal/envcmd/env.go | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcm=
d/env.go<br>
+index 17852de..7b5ec5e 100644<br>
+--- a/src/cmd/go/internal/envcmd/env.go<br>
++++ b/src/cmd/go/internal/envcmd/env.go<br>
+@@ -100,11 +100,11 @@ func MkEnv() []cfg.EnvVar {<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cc :=3D cfg.DefaultCC(cfg.Goos, cfg.Goarch)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if env :=3D strings.Fields(cfg.Getenv(&quot;CC&=
quot;)); len(env) &gt; 0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc =3D env[0]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc =3D strings.Join(env,=
 &quot; &quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cxx :=3D cfg.DefaultCXX(cfg.Goos, cfg.Goarch)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if env :=3D strings.Fields(cfg.Getenv(&quot;CXX=
&quot;)); len(env) &gt; 0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cxx =3D env[0]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cxx =3D strings.Join(env=
, &quot; &quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0env =3D append(env, cfg.EnvVar{Name: &quot;AR&q=
uot;, Value: envOr(&quot;AR&quot;, &quot;ar&quot;)})<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0env =3D append(env, cfg.EnvVar{Name: &quot;CC&q=
uot;, Value: cc})<br>
+-- <br>
+2.17.1 (Apple Git-112)<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-1.13/0002-cmd-go-make-content-base=
d-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go-1.13/0002-=
cmd-go-make-content-based-hash-generation-less-pedan.patch<br>
new file mode 100644<br>
index 0000000000..4eddd39809<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-1.13/0002-cmd-go-make-content-based-hash-=
generation-less-pedan.patch<br>
@@ -0,0 +1,226 @@<br>
+From a13ae484e41139094505d2834437e9262a5315f7 Mon Sep 17 00:00:00 2001<br>
+From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com" target=
=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
+Date: Wed, 23 Oct 2019 21:14:22 +0430<br>
+Subject: [PATCH 2/9] cmd/go: make content-based hash generation less pedan=
tic<br>
+<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+<br>
+Go 1.10&#39;s build tool now uses content-based hashes to<br>
+determine when something should be built or re-built.<br>
+This same mechanism is used to maintain a built-artifact<br>
+cache for speeding up builds.<br>
+<br>
+However, the hashes it generates include information that<br>
+doesn&#39;t work well with OE, nor with using a shared runtime<br>
+library.<br>
+<br>
+First, it embeds path names to source files, unless<br>
+building within GOROOT.=C2=A0 This prevents the building<br>
+of a package in GOPATH for later staging into GOROOT.<br>
+<br>
+This patch adds support for the environment variable<br>
+GOPATH_OMIT_IN_ACTIONID.=C2=A0 If present, path name<br>
+embedding is disabled.<br>
+<br>
+Second, if cgo is enabled, the build ID for cgo-related<br>
+packages will include the current value of the environment<br>
+variables for invoking the compiler (CC, CXX, FC) and<br>
+any CGO_xxFLAGS variables.=C2=A0 Only if the settings used<br>
+during a compilation exactly match, character for character,<br>
+the values used for compiling runtime/cgo or any other<br>
+cgo-enabled package being imported, will the tool<br>
+decide that the imported package is up-to-date.<br>
+<br>
+This is done to help ensure correctness, but is overly<br>
+simplistic and effectively prevents the reuse of built<br>
+artifacts that use cgo (or shared runtime, which includes<br>
+runtime/cgo).<br>
+<br>
+This patch filters out all compiler flags except those<br>
+beginning with &#39;-m&#39;.=C2=A0 The default behavior can be restored<br=
>
+by setting the CGO_PEDANTIC environment variable.<br>
+<br>
+Adapted to Go 1.13 from patches originally submitted to<br>
+the meta/recipes-devtools/go tree by<br>
+Matt Madison &lt;matt@madison.systems&gt;.<br>
+<br>
+Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:alexander.j.kube@gma=
il.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
+---<br>
+ src/cmd/go/internal/envcmd/env.go |=C2=A0 2 +-<br>
+ src/cmd/go/internal/work/exec.go=C2=A0 | 66 ++++++++++++++++++++++-------=
--<br>
+ 2 files changed, 49 insertions(+), 19 deletions(-)<br>
+<br>
+diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcm=
d/env.go<br>
+index 7b5ec5e..292f117 100644<br>
+--- a/src/cmd/go/internal/envcmd/env.go<br>
++++ b/src/cmd/go/internal/envcmd/env.go<br>
+@@ -154,7 +154,7 @@ func ExtraEnvVars() []cfg.EnvVar {<br>
+ func ExtraEnvVarsCostly() []cfg.EnvVar {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0var b work.Builder<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0b.Init()<br>
+-=C2=A0 =C2=A0 =C2=A0 cppflags, cflags, cxxflags, fflags, ldflags, err :=
=3D b.CFlags(&amp;load.Package{})<br>
++=C2=A0 =C2=A0 =C2=A0 cppflags, cflags, cxxflags, fflags, ldflags, err :=
=3D b.CFlags(&amp;load.Package{}, false)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Should not happe=
n - b.CFlags was given an empty package.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(os.Stde=
rr, &quot;go: invalid cflags: %v\n&quot;, err)<br>
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/e=
xec.go<br>
+index 7dd9a90..ccebaf8 100644<br>
+--- a/src/cmd/go/internal/work/exec.go<br>
++++ b/src/cmd/go/internal/work/exec.go<br>
+@@ -32,6 +32,8 @@ import (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;time&quot;<br>
+ )<br>
+ <br>
++var omitGopath =3D os.Getenv(&quot;GOPATH_OMIT_IN_ACTIONID&quot;) !=3D &q=
uot;&quot;<br>
++<br>
+ // actionList returns the list of actions in the dag rooted at root<br>
+ // as visited in a depth-first post-order traversal.<br>
+ func actionList(root *Action) []*Action {<br>
+@@ -205,7 +207,7 @@ func (b *Builder) buildActionID(a *Action) cache.Actio=
nID {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// The compiler hides the exact value of $GOROO=
T<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// when building things in GOROOT.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Assume b.WorkDir is being trimmed properly.<=
br>
+-=C2=A0 =C2=A0 =C2=A0 if !p.Goroot &amp;&amp; !cfg.BuildTrimpath &amp;&amp=
; !strings.HasPrefix(p.Dir, b.WorkDir) {<br>
++=C2=A0 =C2=A0 =C2=A0 if !p.Goroot &amp;&amp; !omitGopath &amp;&amp; !cfg.=
BuildTrimpath &amp;&amp; !strings.HasPrefix(p.Dir, b.WorkDir) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(h, &quo=
t;dir %s\n&quot;, p.Dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(h, &quot;goos %s goarch %s\n&quot;,=
 cfg.Goos, cfg.Goarch)<br>
+@@ -219,13 +221,13 @@ func (b *Builder) buildActionID(a *Action) cache.Act=
ionID {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if len(p.CgoFiles)+len(p.SwigFiles) &gt; 0 {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(h, &quo=
t;cgo %q\n&quot;, b.toolID(&quot;cgo&quot;))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cppflags, cflags, cxxfla=
gs, fflags, ldflags, _ :=3D b.CFlags(p)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fmt.Fprintf(h, &quot;CC=
=3D%q %q %q %q\n&quot;, b.ccExe(), cppflags, cflags, ldflags)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cppflags, cflags, cxxfla=
gs, fflags, ldflags, _ :=3D b.CFlags(p, true)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fmt.Fprintf(h, &quot;CC=
=3D%q %q %q %q\n&quot;, b.ccExe(true), cppflags, cflags, ldflags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(p.CXXFiles)+=
len(p.SwigFiles) &gt; 0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fmt.Fprintf(h, &quot;CXX=3D%q %q\n&quot;, b.cxxExe(), cxxflags)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fmt.Fprintf(h, &quot;CXX=3D%q %q\n&quot;, b.cxxExe(true), cxxflags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(p.FFiles) &g=
t; 0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fmt.Fprintf(h, &quot;FC=3D%q %q\n&quot;, b.fcExe(), fflags)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fmt.Fprintf(h, &quot;FC=3D%q %q\n&quot;, b.fcExe(true), fflags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// TODO(rsc): Shoul=
d we include the SWIG version or Fortran/GCC/G++/Objective-C compiler versi=
ons?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -2229,33 +2231,48 @@ var (<br>
+ // gccCmd returns a gcc command line prefix<br>
+ // defaultCC is defined in zdefaultcc.go, written by cmd/dist.<br>
+ func (b *Builder) GccCmd(incdir, workdir string) []string {<br>
+-=C2=A0 =C2=A0 =C2=A0 return b.compilerCmd(b.ccExe(), incdir, workdir)<br>
++=C2=A0 =C2=A0 =C2=A0 return b.compilerCmd(b.ccExe(false), incdir, workdir=
)<br>
+ }<br>
+ <br>
+ // gxxCmd returns a g++ command line prefix<br>
+ // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.<br>
+ func (b *Builder) GxxCmd(incdir, workdir string) []string {<br>
+-=C2=A0 =C2=A0 =C2=A0 return b.compilerCmd(b.cxxExe(), incdir, workdir)<br=
>
++=C2=A0 =C2=A0 =C2=A0 return b.compilerCmd(b.cxxExe(false), incdir, workdi=
r)<br>
+ }<br>
+ <br>
+ // gfortranCmd returns a gfortran command line prefix.<br>
+ func (b *Builder) gfortranCmd(incdir, workdir string) []string {<br>
+-=C2=A0 =C2=A0 =C2=A0 return b.compilerCmd(b.fcExe(), incdir, workdir)<br>
++=C2=A0 =C2=A0 =C2=A0 return b.compilerCmd(b.fcExe(false), incdir, workdir=
)<br>
+ }<br>
+ <br>
+ // ccExe returns the CC compiler setting without all the extra flags we a=
dd implicitly.<br>
+-func (b *Builder) ccExe() []string {<br>
+-=C2=A0 =C2=A0 =C2=A0 return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos,=
 cfg.Goarch))<br>
++func (b *Builder) ccExe(filtered bool) []string {<br>
++=C2=A0 =C2=A0 =C2=A0 return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos,=
 cfg.Goarch), filtered)<br>
+ }<br>
+ <br>
+ // cxxExe returns the CXX compiler setting without all the extra flags we=
 add implicitly.<br>
+-func (b *Builder) cxxExe() []string {<br>
+-=C2=A0 =C2=A0 =C2=A0 return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goo=
s, cfg.Goarch))<br>
++func (b *Builder) cxxExe(filtered bool) []string {<br>
++=C2=A0 =C2=A0 =C2=A0 return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goo=
s, cfg.Goarch), filtered)<br>
+ }<br>
+ <br>
+ // fcExe returns the FC compiler setting without all the extra flags we a=
dd implicitly.<br>
+-func (b *Builder) fcExe() []string {<br>
+-=C2=A0 =C2=A0 =C2=A0 return b.compilerExe(cfg.Getenv(&quot;FC&quot;), &qu=
ot;gfortran&quot;)<br>
++func (b *Builder) fcExe(filtered bool) []string {<br>
++=C2=A0 =C2=A0 =C2=A0 return b.compilerExe(os.Getenv(&quot;FC&quot;), &quo=
t;gfortran&quot;, filtered)<br>
++}<br>
++<br>
++var filterFlags =3D os.Getenv(&quot;CGO_PEDANTIC&quot;) =3D=3D &quot;&quo=
t;<br>
++<br>
++func filterCompilerFlags(flags []string) []string {<br>
++=C2=A0 =C2=A0 =C2=A0 var newflags []string<br>
++=C2=A0 =C2=A0 =C2=A0 if !filterFlags {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return flags<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 for _, flag :=3D range flags {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if strings.HasPrefix(fla=
g, &quot;-m&quot;) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 newflags =3D append(newflags, flag)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return newflags<br>
+ }<br>
+ <br>
+ // compilerExe returns the compiler to use given an<br>
+@@ -2264,11 +2281,16 @@ func (b *Builder) fcExe() []string {<br>
+ // of the compiler but can have additional arguments if they<br>
+ // were present in the environment value.<br>
+ // For example if CC=3D&quot;gcc -DGOPHER&quot; then the result is [&quot=
;gcc&quot;, &quot;-DGOPHER&quot;].<br>
+-func (b *Builder) compilerExe(envValue string, def string) []string {<br>
++func (b *Builder) compilerExe(envValue string, def string, filtered bool)=
 []string {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0compiler :=3D strings.Fields(envValue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if len(compiler) =3D=3D 0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compiler =3D []stri=
ng{def}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if filtered {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return append(compiler[0=
:1], filterCompilerFlags(compiler[1:])...)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return compiler<br>
+ }<br>
+ <br>
+@@ -2429,7 +2451,7 @@ func envList(key, def string) []string {<br>
+ }<br>
+ <br>
+ // CFlags returns the flags to use when invoking the C, C++ or Fortran co=
mpilers, or cgo.<br>
+-func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, ff=
lags, ldflags []string, err error) {<br>
++func (b *Builder) CFlags(p *load.Package, filtered bool) (cppflags, cflag=
s, cxxflags, fflags, ldflags []string, err error) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0defaults :=3D &quot;-g -O2&quot;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if cppflags, err =3D buildFlags(&quot;CPPFLAGS&=
quot;, &quot;&quot;, p.CgoCPPFLAGS, checkCompilerFlags); err !=3D nil {<br>
+@@ -2448,6 +2470,14 @@ func (b *Builder) CFlags(p *load.Package) (cppflags=
, cflags, cxxflags, fflags, l<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 if filtered {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cppflags =3D filterCompi=
lerFlags(cppflags)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cflags =3D filterCompile=
rFlags(cflags)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cxxflags =3D filterCompi=
lerFlags(cxxflags)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fflags =3D filterCompile=
rFlags(fflags)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ldflags =3D filterCompil=
erFlags(ldflags)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
+ }<br>
+ <br>
+@@ -2462,7 +2492,7 @@ var cgoRe =3D lazyregexp.New(`[/\\:]`)<br>
+ <br>
+ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLA=
GS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj [=
]string, err error) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0p :=3D a.Package<br>
+-=C2=A0 =C2=A0 =C2=A0 cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoL=
DFLAGS, err :=3D b.CFlags(p)<br>
++=C2=A0 =C2=A0 =C2=A0 cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoL=
DFLAGS, err :=3D b.CFlags(p, false)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, nil, er=
r<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -2821,7 +2851,7 @@ func (b *Builder) swigIntSize(objdir string) (intsiz=
e string, err error) {<br>
+ <br>
+ // Run SWIG on one SWIG input file.<br>
+ func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string=
, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err e=
rror) {<br>
+-=C2=A0 =C2=A0 =C2=A0 cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err :=3D =
b.CFlags(p)<br>
++=C2=A0 =C2=A0 =C2=A0 cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err :=3D =
b.CFlags(p, false)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;&quot;=
, &quot;&quot;, err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-- <br>
+2.17.1 (Apple Git-112)<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-1.13/0003-allow-GOTOOLDIR-to-be-ov=
erridden-in-the-environment.patch b/meta/recipes-devtools/go/go-1.13/0003-a=
llow-GOTOOLDIR-to-be-overridden-in-the-environment.patch<br>
new file mode 100644<br>
index 0000000000..9aa0119ae9<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-1.13/0003-allow-GOTOOLDIR-to-be-overridde=
n-in-the-environment.patch<br>
@@ -0,0 +1,54 @@<br>
+From 28ada8896b76d620240bafc22aa395071d601482 Mon Sep 17 00:00:00 2001<br>
+From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com" target=
=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
+Date: Wed, 23 Oct 2019 21:15:37 +0430<br>
+Subject: [PATCH 3/9] cmd/go: Allow GOTOOLDIR to be overridden in the envir=
onment<br>
+<br>
+to allow for split host/target build roots<br>
+<br>
+Adapted to Go 1.13 from patches originally submitted to<br>
+the meta/recipes-devtools/go tree by<br>
+Matt Madison &lt;matt@madison.systems&gt;.<br>
+<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+<br>
+Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:alexander.j.kube@gma=
il.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
+---<br>
+ src/cmd/dist/build.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 +++-<br>
+ src/cmd/go/internal/cfg/cfg.go | 6 +++++-<br>
+ 2 files changed, 8 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go<br>
+index 9e50311..683ca6f 100644<br>
+--- a/src/cmd/dist/build.go<br>
++++ b/src/cmd/dist/build.go<br>
+@@ -244,7 +244,9 @@ func xinit() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0workdir =3D xworkdir()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xatexit(rmworkdir)<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 tooldir =3D pathf(&quot;%s/pkg/tool/%s_%s&quot;, gor=
oot, gohostos, gohostarch)<br>
++=C2=A0 =C2=A0 =C2=A0 if tooldir =3D os.Getenv(&quot;GOTOOLDIR&quot;); too=
ldir =3D=3D &quot;&quot; {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tooldir =3D pathf(&quot;=
%s/pkg/tool/%s_%s&quot;, goroot, gohostos, gohostarch)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+ }<br>
+ <br>
+ // compilerEnv returns a map from &quot;goos/goarch&quot; to the<br>
+diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg/cfg.=
go<br>
+index a3277a6..db96350 100644<br>
+--- a/src/cmd/go/internal/cfg/cfg.go<br>
++++ b/src/cmd/go/internal/cfg/cfg.go<br>
+@@ -60,7 +60,11 @@ func defaultContext() build.Context {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// variables. This =
matches the initialization of ToolDir in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// go/build, except=
 for using ctxt.GOROOT rather than<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// runtime.GOROOT.<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build.ToolDir =3D filepa=
th.Join(ctxt.GOROOT, &quot;pkg/tool/&quot;+runtime.GOOS+&quot;_&quot;+runti=
me.GOARCH)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if s :=3D os.Getenv(&quo=
t;GOTOOLDIR&quot;); s !=3D &quot;&quot; {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 build.ToolDir =3D filepath.Clean(s)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 build.ToolDir =3D filepath.Join(ctxt.GOROOT, &quot;pkg/tool/&quot;+runt=
ime.GOOS+&quot;_&quot;+runtime.GOARCH)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctxt.GOPATH =3D envOr(&quot;GOPATH&quot;, ctxt.=
GOPATH)<br>
+-- <br>
+2.17.1 (Apple Git-112)<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-1.13/0004-ld-add-soname-to-shareab=
le-objects.patch b/meta/recipes-devtools/go/go-1.13/0004-ld-add-soname-to-s=
hareable-objects.patch<br>
new file mode 100644<br>
index 0000000000..40763ad5b1<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-1.13/0004-ld-add-soname-to-shareable-obje=
cts.patch<br>
@@ -0,0 +1,50 @@<br>
+From bf5cf5301ae5914498454c87293d1df2e1d8489f Mon Sep 17 00:00:00 2001<br>
+From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com" target=
=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
+Date: Wed, 23 Oct 2019 21:16:32 +0430<br>
+Subject: [PATCH 4/9] ld: add soname to shareable objects<br>
+<br>
+so that OE&#39;s shared library dependency handling<br>
+can find them.<br>
+<br>
+Adapted to Go 1.13 from patches originally submitted to<br>
+the meta/recipes-devtools/go tree by<br>
+Matt Madison &lt;matt@madison.systems&gt;.<br>
+<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+<br>
+Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:alexander.j.kube@gma=
il.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
+---<br>
+ src/cmd/link/internal/ld/lib.go | 3 +++<br>
+ 1 file changed, 3 insertions(+)<br>
+<br>
+diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/li=
b.go<br>
+index 3fa258d..f96fb02 100644<br>
+--- a/src/cmd/link/internal/ld/lib.go<br>
++++ b/src/cmd/link/internal/ld/lib.go<br>
+@@ -1215,6 +1215,7 @@ func (ctxt *Link) hostlink() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv =3D append(argv, &quot;-Wl,-z,re=
lro&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0argv =3D append(argv, &quot;-shared&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 argv =3D append(argv, fmt.Sprintf(&quot;-Wl,-soname,%s&quot;, filepath.=
Base(*flagOutfile)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if ctxt.HeadType !=3D objabi.Hwindows {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Pass -z nodelete to mark the share=
d library as<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// non-closeable: a dlclose will do n=
othing.<br>
+@@ -1226,6 +1227,7 @@ func (ctxt *Link) hostlink() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0argv =3D append(argv, &quot;-Wl,-z,relro&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv =3D append(arg=
v, &quot;-shared&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argv =3D append(argv, fm=
t.Sprintf(&quot;-Wl,-soname,%s&quot;, filepath.Base(*flagOutfile)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case BuildModePlugin:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ctxt.HeadType =
=3D=3D objabi.Hdarwin {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0argv =3D append(argv, &quot;-dynamiclib&quot;)<br>
+@@ -1234,6 +1236,7 @@ func (ctxt *Link) hostlink() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv =3D append(argv, &quot;-Wl,-z,re=
lro&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0argv =3D append(argv, &quot;-shared&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 argv =3D append(argv, fmt.Sprintf(&quot;-Wl,-soname,%s&quot;, filepath.=
Base(*flagOutfile)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-- <br>
+2.17.1 (Apple Git-112)<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-1.13/0005-make.bash-override-CC-wh=
en-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.13/0005-=
make.bash-override-CC-when-building-dist-and-go_boot.patch<br>
new file mode 100644<br>
index 0000000000..4f2a46c6ce<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-1.13/0005-make.bash-override-CC-when-buil=
ding-dist-and-go_boot.patch<br>
@@ -0,0 +1,44 @@<br>
+From f05ef3ded52b98537c10efd0b15cd9612471524d Mon Sep 17 00:00:00 2001<br>
+From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com" target=
=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
+Date: Wed, 23 Oct 2019 21:17:16 +0430<br>
+Subject: [PATCH 5/9] make.bash: override CC when building dist and<br>
+ go_bootstrap<br>
+<br>
+for handling OE cross-canadian builds.<br>
+<br>
+Adapted to Go 1.13 from patches originally submitted to<br>
+the meta/recipes-devtools/go tree by<br>
+Matt Madison &lt;matt@madison.systems&gt;.<br>
+<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+<br>
+Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:alexander.j.kube@gma=
il.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
+---<br>
+ src/make.bash | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/src/make.bash b/src/make.bash<br>
+index 92d1481..0c2822f 100755<br>
+--- a/src/make.bash<br>
++++ b/src/make.bash<br>
+@@ -177,7 +177,7 @@ if [ &quot;$GOROOT_BOOTSTRAP&quot; =3D &quot;$GOROOT&q=
uot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
+ fi<br>
+ rm -f cmd/dist/dist<br>
+-GOROOT=3D&quot;$GOROOT_BOOTSTRAP&quot; GOOS=3D&quot;&quot; GOARCH=3D&quot=
;&quot; GO111MODULE=3Doff &quot;$GOROOT_BOOTSTRAP/bin/go&quot; build -o cmd=
/dist/dist ./cmd/dist<br>
++CC=3D&quot;${BUILD_CC:-${CC}}&quot; GOROOT=3D&quot;$GOROOT_BOOTSTRAP&quot=
; GOOS=3D&quot;&quot; GOARCH=3D&quot;&quot; GO111MODULE=3Doff &quot;$GOROOT=
_BOOTSTRAP/bin/go&quot; build -o cmd/dist/dist ./cmd/dist<br>
+ <br>
+ # -e doesn&#39;t propagate out of eval, so check success by hand.<br>
+ eval $(./cmd/dist/dist env -p || echo FAIL=3Dtrue)<br>
+@@ -208,7 +208,7 @@ fi<br>
+ # Run dist bootstrap to complete make.bash.<br>
+ # Bootstrap installs a proper cmd/dist, built with the new toolchain.<br>
+ # Throw ours, built with Go 1.4, away after bootstrap.<br>
+-./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS &quot;$@&quot;<b=
r>
++CC=3D&quot;${BUILD_CC:-${CC}}&quot; ./cmd/dist/dist bootstrap $buildall $=
vflag $GO_DISTFLAGS &quot;$@&quot;<br>
+ rm -f ./cmd/dist/dist<br>
+ <br>
+ # DO NOT ADD ANY NEW CODE HERE.<br>
+-- <br>
+2.17.1 (Apple Git-112)<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-1.13/0006-cmd-dist-separate-host-a=
nd-target-builds.patch b/meta/recipes-devtools/go/go-1.13/0006-cmd-dist-sep=
arate-host-and-target-builds.patch<br>
new file mode 100644<br>
index 0000000000..354aaca3a1<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-1.13/0006-cmd-dist-separate-host-and-targ=
et-builds.patch<br>
@@ -0,0 +1,279 @@<br>
+From 10735bb84df17ba657f76835f483cd8543a879c1 Mon Sep 17 00:00:00 2001<br>
+From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com" target=
=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
+Date: Wed, 23 Oct 2019 21:18:12 +0430<br>
+Subject: [PATCH 6/9] cmd/dist: separate host and target builds<br>
+<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+<br>
+Change the dist tool to allow for OE-style cross-<br>
+and cross-canadian builds:<br>
+<br>
+ - command flags --host-only and --target only are added;<br>
+=C2=A0 =C2=A0if one is present, the other changes mentioned below<br>
+=C2=A0 =C2=A0take effect, and arguments may also be specified on<br>
+=C2=A0 =C2=A0the command line to enumerate the package(s) to be<br>
+=C2=A0 =C2=A0built.<br>
+<br>
+ - for OE cross builds, go_bootstrap is always built for<br>
+=C2=A0 =C2=A0the current build host, and is moved, along with the supporti=
ng<br>
+=C2=A0 =C2=A0toolchain (asm, compile, etc.) to a separate &#39;native_nati=
ve&#39;<br>
+=C2=A0 =C2=A0directory under GOROOT/pkg/tool.<br>
+<br>
+ - go_bootstrap is not automatically removed after the build,<br>
+=C2=A0 =C2=A0so it can be reused later (e.g., building both static and<br>
+=C2=A0 =C2=A0shared runtime).<br>
+<br>
+Note that for --host-only builds, it would be nice to specify<br>
+just the &quot;cmd&quot; package to build only the go commands/tools,<br>
+the staleness checks in the dist tool will fail if the &quot;std&quot;<br>
+library has not also been built.=C2=A0 So host-only builds have to<br>
+build everything anyway.<br>
+<br>
+Adapted to Go 1.13 from patches originally submitted to<br>
+the meta/recipes-devtools/go tree by<br>
+Matt Madison &lt;matt@madison.systems&gt;.<br>
+<br>
+Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:alexander.j.kube@gma=
il.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
+---<br>
+ src/cmd/dist/build.go | 155 ++++++++++++++++++++++++++++++------------<br=
>
+ 1 file changed, 112 insertions(+), 43 deletions(-)<br>
+<br>
+diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go<br>
+index 683ca6f..0ad082b 100644<br>
+--- a/src/cmd/dist/build.go<br>
++++ b/src/cmd/dist/build.go<br>
+@@ -41,6 +41,7 @@ var (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0goldflags=C2=A0 =C2=A0 =C2=A0 =C2=A0 string<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0workdir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strin=
g<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tooldir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strin=
g<br>
++=C2=A0 =C2=A0 =C2=A0 build_tooldir=C2=A0 =C2=A0 string<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oldgoos=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strin=
g<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oldgoarch=C2=A0 =C2=A0 =C2=A0 =C2=A0 string<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0exe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 string<br>
+@@ -53,6 +54,7 @@ var (<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rebuildall=C2=A0 =C2=A0bool<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0defaultclang bool<br>
++=C2=A0 =C2=A0 =C2=A0 crossBuild=C2=A0 =C2=A0bool<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vflag int // verbosity<br>
+ )<br>
+@@ -247,6 +249,8 @@ func xinit() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if tooldir =3D os.Getenv(&quot;GOTOOLDIR&quot;)=
; tooldir =3D=3D &quot;&quot; {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tooldir =3D pathf(&=
quot;%s/pkg/tool/%s_%s&quot;, goroot, gohostos, gohostarch)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 build_tooldir =3D pathf(&quot;%s/pkg/tool/native_nat=
ive&quot;, goroot)<br>
+ }<br>
+ <br>
+ // compilerEnv returns a map from &quot;goos/goarch&quot; to the<br>
+@@ -478,8 +482,10 @@ func setup() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0p :=3D pathf(&quot;%s/pkg/%s_%s&quot;, goroot, =
gohostos, gohostarch)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if rebuildall {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xremoveall(p)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xremoveall(build_tooldir=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xmkdirall(p)<br>
++=C2=A0 =C2=A0 =C2=A0 xmkdirall(build_tooldir)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if goos !=3D gohostos || goarch !=3D gohostarch=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p :=3D pathf(&quot;=
%s/pkg/%s_%s&quot;, goroot, goos, goarch)<br>
+@@ -1207,12 +1213,29 @@ func cmdbootstrap() {<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0var noBanner bool<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0var debug bool<br>
++=C2=A0 =C2=A0 =C2=A0 var hostOnly bool<br>
++=C2=A0 =C2=A0 =C2=A0 var targetOnly bool<br>
++=C2=A0 =C2=A0 =C2=A0 var toBuild =3D []string{&quot;std&quot;, &quot;cmd&=
quot;}<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0flag.BoolVar(&amp;rebuildall, &quot;a&quot;, re=
buildall, &quot;rebuild all&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0flag.BoolVar(&amp;debug, &quot;d&quot;, debug, =
&quot;enable debugging of bootstrap process&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0flag.BoolVar(&amp;noBanner, &quot;no-banner&quo=
t;, noBanner, &quot;do not print banner&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 flag.BoolVar(&amp;hostOnly, &quot;host-only&quot;, h=
ostOnly, &quot;build only host binaries, not target&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 flag.BoolVar(&amp;targetOnly, &quot;target-only&quot=
;, targetOnly, &quot;build only target binaries, not host&quot;)<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 xflagparse(0)<br>
++=C2=A0 =C2=A0 =C2=A0 xflagparse(-1)<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 if hostOnly &amp;&amp; targetOnly {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fatalf(&quot;specify onl=
y one of --host-only or --target-only\n&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 crossBuild =3D hostOnly || targetOnly<br>
++=C2=A0 =C2=A0 =C2=A0 if flag.NArg() &gt; 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if crossBuild {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 toBuild =3D flag.Args()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fatalf(&quot;package names not permitted without --host-only or --targe=
t-only\n&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Set GOPATH to an internal directory. We shou=
ldn&#39;t actually<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// need to store files here, since the toolchai=
n won&#39;t<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// depend on modules outside of vendor director=
ies, but if<br>
+@@ -1266,8 +1289,13 @@ func cmdbootstrap() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xprintf(&quot;\n&qu=
ot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 gogcflags =3D os.Getenv(&quot;GO_GCFLAGS&quot;) // w=
e were using $BOOT_GO_GCFLAGS until now<br>
+-=C2=A0 =C2=A0 =C2=A0 goldflags =3D os.Getenv(&quot;GO_LDFLAGS&quot;) // w=
e were using $BOOT_GO_LDFLAGS until now<br>
++=C2=A0 =C2=A0 =C2=A0 // For split host/target cross/cross-canadian builds=
, we don&#39;t<br>
++=C2=A0 =C2=A0 =C2=A0 // want to be setting these flags until after we hav=
e compiled<br>
++=C2=A0 =C2=A0 =C2=A0 // the toolchain that runs on the build host.<br>
++=C2=A0 =C2=A0 =C2=A0 if !crossBuild {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gogcflags =3D os.Getenv(=
&quot;GO_GCFLAGS&quot;) // we were using $BOOT_GO_GCFLAGS until now<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goldflags =3D os.Getenv(=
&quot;GO_LDFLAGS&quot;) // we were using $BOOT_GO_LDFLAGS until now<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0goBootstrap :=3D pathf(&quot;%s/go_bootstrap&qu=
ot;, tooldir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmdGo :=3D pathf(&quot;%s/go&quot;, gobin)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if debug {<br>
+@@ -1296,7 +1324,11 @@ func cmdbootstrap() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xprintf(&quot;\n&qu=
ot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xprintf(&quot;Building Go toolchain2 using go_b=
ootstrap and Go toolchain1.\n&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;CC&quot;, compilerEnvLookup(defaultc=
c, goos, goarch))<br>
++=C2=A0 =C2=A0 =C2=A0 if crossBuild {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;CC&quot;=
, defaultcc[&quot;&quot;])<br>
++=C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;CC&quot;=
, compilerEnvLookup(defaultcc, goos, goarch))<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0goInstall(goBootstrap, append([]string{&quot;-i=
&quot;}, toolchain...)...)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if debug {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0run(&quot;&quot;, S=
howOutput|CheckExit, pathf(&quot;%s/compile&quot;, tooldir), &quot;-V=3Dful=
l&quot;)<br>
+@@ -1333,50 +1365,84 @@ func cmdbootstrap() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0checkNotStale(goBootstrap, append(toolchain, &q=
uot;runtime/internal/sys&quot;)...)<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 if goos =3D=3D oldgoos &amp;&amp; goarch =3D=3D oldg=
oarch {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Common case - not set=
ting up for cross-compilation.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timelog(&quot;build&quot=
;, &quot;toolchain&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if vflag &gt; 0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;\n&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 if crossBuild {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gogcflags =3D os.Getenv(=
&quot;GO_GCFLAGS&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goldflags =3D os.Getenv(=
&quot;GO_LDFLAGS&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tool_files, _ :=3D filep=
ath.Glob(pathf(&quot;%s/*&quot;, tooldir))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for _, f :=3D range tool=
_files {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 copyfile(pathf(&quot;%s/%s&quot;, build_tooldir, filepath.Base(f)), f, =
writeExec)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xremove(f)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOTOOLDI=
R&quot;, build_tooldir)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goBootstrap =3D pathf(&q=
uot;%s/go_bootstrap&quot;, build_tooldir)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if hostOnly {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 timelog(&quot;build&quot;, &quot;host toolchain&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if vflag &gt; 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;\n&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;Building %s for host, %s/%s.\n&quot;, strings.Join(toBuil=
d, &quot;,&quot;), goos, goarch)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goInstall(goBootstrap, toBuild...)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(goBootstrap, toBuild...)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Skip cmdGo staleness checks here, since we can&#39;t necessarily run=
 the cmdGo binary<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 timelog(&quot;build&quot;, &quot;target toolchain&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if vflag &gt; 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;\n&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if targetOnly {<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goos =3D oldgoos<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goarch =3D oldgoarch<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;GOOS&quot;, goos)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;GOARCH&quot;, goarch)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;CC&quot;, compilerEnvLookup(defaultcc, goos, goarch))<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;Building %s for target, %s/%s.\n&quot;, strings.Join(toBu=
ild, &quot;,&quot;), goos, goarch)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goInstall(goBootstrap, toBuild...)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(goBootstrap, toBuild...)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Skip cmdGo staleness checks here, since we can&#39;t run the target&=
#39;s cmdGo binary<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;Building p=
ackages and commands for %s/%s.\n&quot;, goos, goarch)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // GOOS/GOARCH does not =
match GOHOSTOS/GOHOSTARCH.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Finish GOHOSTOS/GOHOS=
TARCH installation and then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // run GOOS/GOARCH insta=
llation.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timelog(&quot;build&quot=
;, &quot;host toolchain&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if vflag &gt; 0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;\n&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;Building p=
ackages and commands for host, %s/%s.\n&quot;, goos, goarch)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if goos =3D=3D oldgoos &=
amp;&amp; goarch =3D=3D oldgoarch {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Common case - not setting up for cross-compilation.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 timelog(&quot;build&quot;, &quot;toolchain&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if vflag &gt; 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;\n&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;Building packages and commands for %s/%s.\n&quot;, goos, =
goarch)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Finish GOHOSTOS/GOHOSTARCH installation and then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // run GOOS/GOARCH installation.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 timelog(&quot;build&quot;, &quot;host toolchain&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if vflag &gt; 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;\n&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;Building packages and commands for host, %s/%s.\n&quot;, =
goos, goarch)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goInstall(goBootstrap, &quot;std&quot;, &quot;cmd&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(goBootstrap, &quot;std&quot;, &quot;cmd&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(cmdGo, &quot;std&quot;, &quot;cmd&quot;)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 timelog(&quot;build&quot;, &quot;target toolchain&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if vflag &gt; 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;\n&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goos =3D oldgoos<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goarch =3D oldgoarch<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;GOOS&quot;, goos)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;GOARCH&quot;, goarch)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;CC&quot;, compilerEnvLookup(defaultcc, goos, goarch))<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;Building packages and commands for target, %s/%s.\n&quot;=
, goos, goarch)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goInstall(goBootstr=
ap, &quot;std&quot;, &quot;cmd&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkNotStale(goBoo=
tstrap, &quot;std&quot;, &quot;cmd&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkNotStale(cmdGo=
, &quot;std&quot;, &quot;cmd&quot;)<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timelog(&quot;build&quot=
;, &quot;target toolchain&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if vflag &gt; 0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;\n&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if debug {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/compile&quot;, t=
ooldir), &quot;-V=3Dfull&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/buildid&quot;, t=
ooldir), pathf(&quot;%s/pkg/%s_%s/runtime/internal/sys.a&quot;, goroot, goo=
s, goarch))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(goBootstrap, append(toolchain, &quot;runtime/internal/sys=
&quot;)...)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 copyfile(pathf(&quot;%s/compile4&quot;, tooldir), pathf(&quot;%s/compil=
e&quot;, tooldir), writeExec)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goos =3D oldgoos<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goarch =3D oldgoarch<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOOS&quo=
t;, goos)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOARCH&q=
uot;, goarch)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;CC&quot;=
, compilerEnvLookup(defaultcc, goos, goarch))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;Building p=
ackages and commands for target, %s/%s.\n&quot;, goos, goarch)<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 targets :=3D []string{&quot;std&quot;, &quot;cmd&quo=
t;}<br>
+-=C2=A0 =C2=A0 =C2=A0 if goos =3D=3D &quot;js&quot; &amp;&amp; goarch =3D=
=3D &quot;wasm&quot; {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Skip the cmd tools fo=
r js/wasm. They&#39;re not usable.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 targets =3D targets[:1]<=
br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 goInstall(goBootstrap, targets...)<br>
+-=C2=A0 =C2=A0 =C2=A0 checkNotStale(goBootstrap, targets...)<br>
+-=C2=A0 =C2=A0 =C2=A0 checkNotStale(cmdGo, targets...)<br>
+-=C2=A0 =C2=A0 =C2=A0 if debug {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 run(&quot;&quot;, ShowOu=
tput|CheckExit, pathf(&quot;%s/compile&quot;, tooldir), &quot;-V=3Dfull&quo=
t;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 run(&quot;&quot;, ShowOu=
tput|CheckExit, pathf(&quot;%s/buildid&quot;, tooldir), pathf(&quot;%s/pkg/=
%s_%s/runtime/internal/sys.a&quot;, goroot, goos, goarch))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 checkNotStale(goBootstra=
p, append(toolchain, &quot;runtime/internal/sys&quot;)...)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copyfile(pathf(&quot;%s/=
compile4&quot;, tooldir), pathf(&quot;%s/compile&quot;, tooldir), writeExec=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Check that there are no new files in $GOROOT=
/bin other than<br>
+@@ -1393,8 +1459,11 @@ func cmdbootstrap() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 // Remove go_bootstrap now that we&#39;re done.<br>
+-=C2=A0 =C2=A0 =C2=A0 xremove(pathf(&quot;%s/go_bootstrap&quot;, tooldir))=
<br>
++=C2=A0 =C2=A0 =C2=A0 // Except that for split host/target cross-builds, w=
e need to<br>
++=C2=A0 =C2=A0 =C2=A0 // keep it.<br>
++=C2=A0 =C2=A0 =C2=A0 if !crossBuild {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xremove(pathf(&quot;%s/g=
o_bootstrap&quot;, tooldir))<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if goos =3D=3D &quot;android&quot; {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Make sure the ex=
ec wrapper will sync a fresh $GOROOT to the device.<br>
+-- <br>
+2.17.1 (Apple Git-112)<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-1.13/0007-cmd-go-make-GOROOT-preci=
ous-by-default.patch b/meta/recipes-devtools/go/go-1.13/0007-cmd-go-make-GO=
ROOT-precious-by-default.patch<br>
new file mode 100644<br>
index 0000000000..e232c79199<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-1.13/0007-cmd-go-make-GOROOT-precious-by-=
default.patch<br>
@@ -0,0 +1,113 @@<br>
+From 9ba507e076c744f4d394418e4a849e68cd426a4a Mon Sep 17 00:00:00 2001<br>
+From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com" target=
=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
+Date: Wed, 23 Oct 2019 21:18:56 +0430<br>
+Subject: [PATCH 7/9] cmd/go: make GOROOT precious by default<br>
+<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+<br>
+The go build tool normally rebuilds whatever it detects is<br>
+stale.=C2=A0 This can be a problem when GOROOT is intended to<br>
+be read-only and the go runtime has been built as a shared<br>
+library, since we don&#39;t want every application to be rebuilding<br>
+the shared runtime - particularly in cross-build/packaging<br>
+setups, since that would lead to &#39;abi mismatch&#39; runtime errors.<br=
>
+<br>
+This patch prevents the install and linkshared actions from<br>
+installing to GOROOT unless overridden with the GOROOT_OVERRIDE<br>
+environment variable.<br>
+<br>
+Adapted to Go 1.13 from patches originally submitted to<br>
+the meta/recipes-devtools/go tree by<br>
+Matt Madison &lt;matt@madison.systems&gt;.<br>
+<br>
+Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:alexander.j.kube@gma=
il.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
+---<br>
+ src/cmd/go/internal/work/action.go |=C2=A0 3 +++<br>
+ src/cmd/go/internal/work/build.go=C2=A0 |=C2=A0 6 ++++++<br>
+ src/cmd/go/internal/work/exec.go=C2=A0 =C2=A0| 25 +++++++++++++++++++++++=
++<br>
+ 3 files changed, 34 insertions(+)<br>
+<br>
+diff --git a/src/cmd/go/internal/work/action.go b/src/cmd/go/internal/work=
/action.go<br>
+index 33b7818..7617b4c 100644<br>
+--- a/src/cmd/go/internal/work/action.go<br>
++++ b/src/cmd/go/internal/work/action.go<br>
+@@ -662,6 +662,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1 *Action,=
 shlib string) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if p1 =3D=3D nil || p1.Shlib =3D=3D &quot;&quot; || haveShlib[fil=
epath.Base(p1.Shlib)] {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if goRootPrecious &amp;&amp; (p1.Standard || p1.Goroot) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0haveShlib[filepath.Base(p1.Shlib)] =3D true<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0// TODO(rsc): The use of ModeInstall here is suspect, but if we o=
nly do ModeBuild,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0// we&#39;ll end up building an overall library or executable tha=
t depends at runtime<br>
+diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/=
build.go<br>
+index 9305b2d..6560317 100644<br>
+--- a/src/cmd/go/internal/work/build.go<br>
++++ b/src/cmd/go/internal/work/build.go<br>
+@@ -155,6 +155,8 @@ See also: go install, go get, go clean.<br>
+ <br>
+ const concurrentGCBackendCompilationEnabledByDefault =3D true<br>
+ <br>
++var goRootPrecious bool =3D true<br>
++<br>
+ func init() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// break init cycle<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0CmdBuild.Run =3D runBuild<br>
+@@ -167,6 +169,10 @@ func init() {<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0AddBuildFlags(CmdBuild)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0AddBuildFlags(CmdInstall)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if x :=3D os.Getenv(&quot;GOROOT_OVERRIDE&quot;); x =
!=3D &quot;&quot; {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goRootPrecious =3D false=
<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+ }<br>
+ <br>
+ // Note that flags consulted by other parts of the code<br>
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/e=
xec.go<br>
+index ccebaf8..59450d7 100644<br>
+--- a/src/cmd/go/internal/work/exec.go<br>
++++ b/src/cmd/go/internal/work/exec.go<br>
+@@ -455,6 +455,23 @@ func (b *Builder) build(a *Action) (err error) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return errors.New(&=
quot;binary-only packages are no longer supported&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 if goRootPrecious &amp;&amp; (a.Package.Standard || =
a.Package.Goroot) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _, err :=3D os.Stat(a.Pa=
ckage.Target)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err =3D=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 a.built =3D a.Package.Target<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 a.Target =3D a.Package.Target<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 a.buildID =3D b.fileHash(a.Package.Target)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 a.Package.Stale =3D false<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 a.Package.StaleReason =3D &quot;GOROOT-resident package&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return nil<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a.Package.Stale =3D true=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a.Package.StaleReason =
=3D &quot;missing or invalid GOROOT-resident package&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if b.IsCmdList {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return nil<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err :=3D b.Mkdir(a.Objdir); err !=3D nil {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -1499,6 +1516,14 @@ func BuildInstallFunc(b *Builder, a *Action) (err e=
rror) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 if goRootPrecious &amp;&amp; a.Package !=3D nil {<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p :=3D a.Package<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if p.Standard || p.Goroo=
t {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 err :=3D fmt.Errorf(&quot;attempting to install package %s into read-on=
ly GOROOT&quot;, p.ImportPath)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return err<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err :=3D b.Mkdir(a.Objdir); err !=3D nil {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-- <br>
+2.17.1 (Apple Git-112)<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-1.13/0008-use-GOBUILDMODE-to-set-b=
uildmode.patch b/meta/recipes-devtools/go/go-1.13/0008-use-GOBUILDMODE-to-s=
et-buildmode.patch<br>
new file mode 100644<br>
index 0000000000..68e132f30a<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-1.13/0008-use-GOBUILDMODE-to-set-buildmod=
e.patch<br>
@@ -0,0 +1,47 @@<br>
+From 971b5626339ce0c4d57f9721c9a81af566c5a044 Mon Sep 17 00:00:00 2001<br>
+From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com" target=
=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
+Date: Wed, 23 Oct 2019 21:19:26 +0430<br>
+Subject: [PATCH 8/9] cmd/go: Use GOBUILDMODE to set buildmode<br>
+<br>
+Upstream-Status: Denied [upstream choose antoher solution: `17a256b<br>
+cmd/go: -buildmode=3Dpie for android/arm&#39;]<br>
+<br>
+While building go itself, the go build system does not support<br>
+to set `-buildmode=3Dpie&#39; from environment.<br>
+<br>
+Add GOBUILDMODE to support it which make PIE executables the default<br>
+build mode, as PIE executables are required as of Yocto<br>
+<br>
+Refers: <a href=3D"https://groups.google.com/forum/#!topic/golang-dev/gRCe=
5URKewI" rel=3D"noreferrer" target=3D"_blank">https://groups.google.com/for=
um/#!topic/golang-dev/gRCe5URKewI</a><br>
+<br>
+Adapted to Go 1.13 from patches originally submitted to<br>
+the meta/recipes-devtools/go tree by<br>
+Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D"_blan=
k">hongxu.jia@windriver.com</a>&gt;<br>
+<br>
+Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:alexander.j.kube@gma=
il.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
+---<br>
+ src/cmd/go/internal/work/build.go | 8 +++++++-<br>
+ 1 file changed, 7 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/=
build.go<br>
+index 6560317..5f3a988 100644<br>
+--- a/src/cmd/go/internal/work/build.go<br>
++++ b/src/cmd/go/internal/work/build.go<br>
+@@ -231,7 +231,13 @@ func AddBuildFlags(cmd *base.Command) {<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd.Flag.Var(&amp;load.BuildAsmflags, &quot;asm=
flags&quot;, &quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd.Flag.Var(buildCompiler{}, &quot;compiler&qu=
ot;, &quot;&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 cmd.Flag.StringVar(&amp;cfg.BuildBuildmode, &quot;bu=
ildmode&quot;, &quot;default&quot;, &quot;&quot;)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if bm :=3D os.Getenv(&quot;GOBUILDMODE&quot;); bm !=
=3D &quot;&quot; {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd.Flag.StringVar(&amp;=
cfg.BuildBuildmode, &quot;buildmode&quot;, bm, &quot;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd.Flag.StringVar(&amp;=
cfg.BuildBuildmode, &quot;buildmode&quot;, &quot;default&quot;, &quot;&quot=
;)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd.Flag.Var(&amp;load.BuildGcflags, &quot;gcfl=
ags&quot;, &quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd.Flag.Var(&amp;load.BuildGccgoflags, &quot;g=
ccgoflags&quot;, &quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd.Flag.StringVar(&amp;cfg.BuildMod, &quot;mod=
&quot;, &quot;&quot;, &quot;&quot;)<br>
+-- <br>
+2.17.1 (Apple Git-112)<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-1.13/0009-ld-replace-glibc-dynamic=
-linker-with-musl.patch b/meta/recipes-devtools/go/go-1.13/0009-ld-replace-=
glibc-dynamic-linker-with-musl.patch<br>
new file mode 100644<br>
index 0000000000..4bb1106f09<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-1.13/0009-ld-replace-glibc-dynamic-linker=
-with-musl.patch<br>
@@ -0,0 +1,134 @@<br>
+From 973251ae0c69a35721f6115345d3f57b2847979f Mon Sep 17 00:00:00 2001<br>
+From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com" target=
=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
+Date: Wed, 23 Oct 2019 21:20:13 +0430<br>
+Subject: [PATCH 9/9] ld: replace glibc dynamic linker with musl<br>
+<br>
+Rework of patch by Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+for go 1.10.=C2=A0 Should be applied conditionally on<br>
+musl being the system C library.<br>
+<br>
+Adapted to Go 1.13 from patches originally submitted to<br>
+the meta/recipes-devtools/go tree by<br>
+Matt Madison &lt;matt@madison.systems&gt;.<br>
+<br>
+Upstream-Status: Inappropriate [Real fix should be portable across libcs]<=
br>
+<br>
+Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:alexander.j.kube@gma=
il.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
+---<br>
+ src/cmd/link/internal/amd64/obj.go=C2=A0 | 2 +-<br>
+ src/cmd/link/internal/arm/obj.go=C2=A0 =C2=A0 | 2 +-<br>
+ src/cmd/link/internal/arm64/obj.go=C2=A0 | 2 +-<br>
+ src/cmd/link/internal/mips/obj.go=C2=A0 =C2=A0| 2 +-<br>
+ src/cmd/link/internal/mips64/obj.go | 2 +-<br>
+ src/cmd/link/internal/ppc64/obj.go=C2=A0 | 2 +-<br>
+ src/cmd/link/internal/s390x/obj.go=C2=A0 | 2 +-<br>
+ src/cmd/link/internal/x86/obj.go=C2=A0 =C2=A0 | 2 +-<br>
+ 8 files changed, 8 insertions(+), 8 deletions(-)<br>
+<br>
+diff --git a/src/cmd/link/internal/amd64/obj.go b/src/cmd/link/internal/am=
d64/obj.go<br>
+index 23741eb..8e74576 100644<br>
+--- a/src/cmd/link/internal/amd64/obj.go<br>
++++ b/src/cmd/link/internal/amd64/obj.go<br>
+@@ -62,7 +62,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PEreloc1:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0pereloc1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TLSIEtoLE:=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 tlsIEtoLE,<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
 =C2=A0&quot;/lib64/ld-linux-x86-64.so.2&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
 =C2=A0&quot;/lib64/ld-musl-x86-64.so.1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld:=C2=A0=
 =C2=A0&quot;/libexec/ld-elf.so.1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openbsddynld:=C2=A0=
 =C2=A0&quot;/usr/libexec/ld.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Netbsddynld:=C2=A0 =
=C2=A0 &quot;/libexec/ld.elf_so&quot;,<br>
+diff --git a/src/cmd/link/internal/arm/obj.go b/src/cmd/link/internal/arm/=
obj.go<br>
+index 45a406e..724d3e3 100644<br>
+--- a/src/cmd/link/internal/arm/obj.go<br>
++++ b/src/cmd/link/internal/arm/obj.go<br>
+@@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machoreloc1:=C2=A0 =
=C2=A0 =C2=A0 machoreloc1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PEreloc1:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0pereloc1,<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
 =C2=A0&quot;/lib/ld-linux.so.3&quot;, // 2 for OABI, 3 for EABI<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
 =C2=A0&quot;/lib/ld-musl-armhf.so.1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld:=C2=A0=
 =C2=A0&quot;/usr/libexec/ld-elf.so.1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openbsddynld:=C2=A0=
 =C2=A0&quot;/usr/libexec/ld.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Netbsddynld:=C2=A0 =
=C2=A0 &quot;/libexec/ld.elf_so&quot;,<br>
+diff --git a/src/cmd/link/internal/arm64/obj.go b/src/cmd/link/internal/ar=
m64/obj.go<br>
+index 7c66623..d8b1db1 100644<br>
+--- a/src/cmd/link/internal/arm64/obj.go<br>
++++ b/src/cmd/link/internal/arm64/obj.go<br>
+@@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Gentext:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 gentext,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machoreloc1:=C2=A0 =
=C2=A0 =C2=A0 machoreloc1,<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib/l=
d-linux-aarch64.so.1&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib/l=
d-musl-aarch64.so.1&quot;,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openbsddynld:=C2=A0=
 =C2=A0&quot;/usr/libexec/ld.so&quot;,<br>
+diff --git a/src/cmd/link/internal/mips/obj.go b/src/cmd/link/internal/mip=
s/obj.go<br>
+index 231e1ff..631dd7a 100644<br>
+--- a/src/cmd/link/internal/mips/obj.go<br>
++++ b/src/cmd/link/internal/mips/obj.go<br>
+@@ -60,7 +60,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Gentext:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 gentext,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machoreloc1:=C2=A0 =
=C2=A0 =C2=A0 machoreloc1,<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib/l=
d.so.1&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib/l=
d-musl-mipsle.so.1&quot;,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openbsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
+diff --git a/src/cmd/link/internal/mips64/obj.go b/src/cmd/link/internal/m=
ips64/obj.go<br>
+index 9604208..5ef3ffc 100644<br>
+--- a/src/cmd/link/internal/mips64/obj.go<br>
++++ b/src/cmd/link/internal/mips64/obj.go<br>
+@@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Gentext:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 gentext,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machoreloc1:=C2=A0 =
=C2=A0 =C2=A0 machoreloc1,<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
 =C2=A0&quot;/lib64/ld64.so.1&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
 =C2=A0&quot;/lib64/ld-musl-mips64le.so.1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openbsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Netbsddynld:=C2=A0 =
=C2=A0 &quot;XXX&quot;,<br>
+diff --git a/src/cmd/link/internal/ppc64/obj.go b/src/cmd/link/internal/pp=
c64/obj.go<br>
+index 51d1791..b15da85 100644<br>
+--- a/src/cmd/link/internal/ppc64/obj.go<br>
++++ b/src/cmd/link/internal/ppc64/obj.go<br>
+@@ -63,7 +63,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Xcoffreloc1:=C2=A0 =
=C2=A0 =C2=A0 xcoffreloc1,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// TODO(austin): AB=
I v1 uses /usr/lib/ld.so.1,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib64=
/ld64.so.1&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib64=
/ld-musl-powerpc64le.so.1&quot;,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openbsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
+diff --git a/src/cmd/link/internal/s390x/obj.go b/src/cmd/link/internal/s3=
90x/obj.go<br>
+index 3454476..42cc346 100644<br>
+--- a/src/cmd/link/internal/s390x/obj.go<br>
++++ b/src/cmd/link/internal/s390x/obj.go<br>
+@@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Gentext:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 gentext,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machoreloc1:=C2=A0 =
=C2=A0 =C2=A0 machoreloc1,<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib64=
/ld64.so.1&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib64=
/ld-musl-s390x.so.1&quot;,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// not relevant for=
 s390x<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
+diff --git a/src/cmd/link/internal/x86/obj.go b/src/cmd/link/internal/x86/=
obj.go<br>
+index f1fad20..d2ca10c 100644<br>
+--- a/src/cmd/link/internal/x86/obj.go<br>
++++ b/src/cmd/link/internal/x86/obj.go<br>
+@@ -58,7 +58,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machoreloc1:=C2=A0 =
=C2=A0 =C2=A0 machoreloc1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PEreloc1:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0pereloc1,<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
&quot;/lib/ld-linux.so.2&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
&quot;/lib/ld-musl-i386.so.1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld: &quot=
;/usr/libexec/ld-elf.so.1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openbsddynld: &quot=
;/usr/libexec/ld.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Netbsddynld:=C2=A0 =
&quot;/usr/libexec/ld.elf_so&quot;,<br>
+-- <br>
+2.17.1 (Apple Git-112)<br>
+<br>
-- <br>
2.17.1 (Apple Git-112)<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000003f9ef10595b8ca6a--

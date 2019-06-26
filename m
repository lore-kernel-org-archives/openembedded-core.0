Return-Path: <matt@madison.systems>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5182C6025F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 14:01:00 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id v18so2323192ljh.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 07:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=XFNcgoWiif8Wk+8XX7oN+mJ9GUsbmz55hnyXw14EbjA=;
	b=Y3CbBbYG5bP4ewR9c2z5bmH0BPGnEV7dnDZ8bUpxXI95Hkg+pai9rgCeaqi3hhNjIF
	0nB4zpflhi1cdpj+DprCI+FBfXr/kwZbK0sTc2kluVkwmRAWAE6SxiCpNDtbJzNd50bG
	BgcZbpNlB4RtzP4KvRqHJbDYnVPYP5eAw0rC3x8Ex1OY/krh/nY6bL/FpfDLdhNKeO2b
	1IYOlAIb44KPGBKNobJd5ga0oGEgj4fg6Ru8PvBGWLfy169ihZsE+rGmOCEvLz4dRXuP
	RZRf4H65WAPrnZ2DMzRI+cWMHcyv2ddzJxmbKp/iHYSyzS8kj2N0YFl9cCVHua4Gt1Y1
	RgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=XFNcgoWiif8Wk+8XX7oN+mJ9GUsbmz55hnyXw14EbjA=;
	b=UWKLkInF7FhmOSmTK0ebOEMqGyeeX6NgUFdcBNUae85mIuz6m3gmwhpSsny0td5Lh7
	+KOwsAwKL1LlvHh7cRwi52jK4pnDVFJ1blxffkRlQ+h+3t6q5eUWEYwPCKFC5ETWs4pN
	BIk5lixZztp71qWDDIpEyiywSbUd8gfAYJyUxHAZQGL/crIYQcKHTYCfsXOsoq7mv0It
	ohuug2z6ZMVB0OLYe2RuYLvR4pflyzBLA2fba1egipAnK672eLOxWA4sUek7a1bo2yaX
	HdejN96zEv997pny0ewMG/62FTxi+Kn5hLrYrubRy8S1hGhl/BucSuKF3Q71mnVHpvpS
	wNBQ==
X-Gm-Message-State: APjAAAUHU+zj+CPZFLZI1xB8SwC2Y74JQJX6RUvWxnIoCT/95U1xcrcc
	sApZvSD0Diag8iqQ+q8G3ZPrG7aT4vvvMKpi1DgnoA==
X-Google-Smtp-Source: APXvYqzqbTD0/bEYA6IRLD83bETOboo3XNXAwPsXcADjfIXsveKMZ6RY6PWFGNQjB/EQ2c9qTx/nW4JTUvEy1y1GE38=
X-Received: by 2002:a2e:9250:: with SMTP id v16mr3003365ljg.89.1561557659933; 
	Wed, 26 Jun 2019 07:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20180304210937.29727-1-matt@madison.systems>
	<20180304210937.29727-7-matt@madison.systems>
	<5D0C9F8B.8060109@windriver.com>
	<CAGgRHJoXVPEq-L9iHniD9mQtvC3CGq3-jP7NincOx1gVqCps3g@mail.gmail.com>
	<5D1335A3.6060508@windriver.com>
In-Reply-To: <5D1335A3.6060508@windriver.com>
From: Matt Madison <matt@madison.systems>
Date: Wed, 26 Jun 2019 07:00:48 -0700
Message-ID: <CAGgRHJozBOK+JH3uFQ-=utkTk97Gqg0N1yH2vdgC8-z6cQwUNA@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 06/13] go.bbclass: ptest cleanup and improvements
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
X-List-Received-Date: Wed, 26 Jun 2019 14:01:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2019 at 2:02 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
>
>
> On 2019=E5=B9=B406=E6=9C=8825=E6=97=A5 20:23, Matt Madison wrote:
> > On Fri, Jun 21, 2019 at 2:08 AM Yu, Mingli <mingli.yu@windriver.com> wr=
ote:
> >>
> >> Hi Matt,
> >>
> >> I noticed your commit is the latest update for go-dep ptest. But the
> >> go-dep ptest doesn't work in my environment. I'm trying to figure out
> >> what's wrong is here though I didn't know much about go.
> >
> > I went back over the commits, and I don't think I did anything with
> > go-dep specifically. I can see that the tests are failing for it, and
> > it looks like it's because go-dep's test programs make some
> > assumptions about the environment.  For one thing, it needs the go
> > compiler installed. It also looks like it's expecting some source
> > files to be present... in other words, it's not really designed for a
> > cross-build setup, with tests run on the cross-built target. It could
> > be messy to work around that, and I'm not sure how useful it would be
> > anyway, seeing as how go-dep is more of a build tool.  Might be better
> > to just disable ptests for it completely.
>
> Many thanks Matt for your information!
> Did you ever run go-dep ptest?
> Go through the run-ptest script for go-dep, it actually runs the
> /usr/lib64/go-dep/ptest/github.com/golang/dep/cmd/dep/dep.test whose
> source file is
> https://github.com/golang/dep/blob/master/cmd/dep/dep_test.go.

Yes, I see that.  That main program starts by rebuilding the dep
program from source, then runs the tests using that copy of the
program, so it's assuming that you're still in a development
environment where you can run a full go build.  That's what I meant by
it not being designed for a cross-build setup.

I've patched the test program to create a symlink to the installed dep
program instead of rebuilding, and got further.  You'll need to
include 'go', 'git', and 'git-perltools' in the image to get the tests
to run. Some of the test cases failed until I set GOCACHE in the
environment to point to a valid path; I'm not sure why.  The tests
took a long time to run on my qemux86 build, though - at least 30
minutes.

Here's the patch I applied to use the already-built dep binary.  An
alternative approach would be to put everything in place to allow the
test program to rebuild the dep binary itself, but that would drive up
the time for the test run even further.

Regards,
-Matt

---
 cmd/dep/dep_test.go | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/src/github.com/golang/dep/cmd/dep/dep_test.go
b/src/github.com/golang/dep/cmd/dep/dep_test.go
index 687eef3a..535ca56d 100644
--- a/src/github.com/golang/dep/cmd/dep/dep_test.go
+++ b/src/github.com/golang/dep/cmd/dep/dep_test.go
@@ -18,13 +18,18 @@ import (
 // deletes it after the tests have been run.
 // Most of this is taken from
https://github.com/golang/go/blob/master/src/cmd/go/go_test.go and
reused here.
 func TestMain(m *testing.M) {
- args :=3D []string{"build", "-o", "testdep" + test.ExeSuffix}
- out, err :=3D exec.Command("go", args...).CombinedOutput()
+ args :=3D []string{"dep"}
+ out, err :=3D exec.Command("which", args...).CombinedOutput()
  if err !=3D nil {
- fmt.Fprintf(os.Stderr, "building testdep failed: %v\n%s", err, out)
+ fmt.Fprintf(os.Stderr, "finding dep failed: %v\n%s", err, out)
+ os.Exit(2)
+ }
+ args =3D []string{"-s", string(out[:len(out)-1]), "testdep" + test.ExeSuf=
fix}
+ out, err =3D exec.Command("ln", args...).CombinedOutput()
+ if err !=3D nil {
+ fmt.Fprintf(os.Stderr, "symlinking dep failed: %v\n%s", err, out)
  os.Exit(2)
  }
-
  // Don't let these environment variables confuse the test.
  os.Unsetenv("GOPATH")
  os.Unsetenv("GIT_ALLOW_PROTOCOL")
--=20
2.20.1


>
> # pwd
> /usr/lib64/go-dep/ptest/github.com/golang/dep/cmd/dep
> # ./dep.test
> building testdep failed: exit status 1
> can't load package: package .: no Go files in
> /usr/lib64/go-dep/ptest/github.com/golang/dep/cmd/dep
>
> Check the logic for
> https://github.com/golang/dep/blob/master/cmd/dep/dep_test.go, it try to
> run "go build -o testdep" at its start. And the go compiler exist on our
> target, but I don't know what go files the dep_test.go expects.
>
> Hi Khem,
>
> Do you have any suggestion?
>
> Thanks,
>
> >
> > BTW, you can have the test programs generate verbose output by setting
> > GOPTESTFLAGS =3D "-test.v" in the recipe, which will add that flag to
> > their invocation in the wrapper script, or by manually running the
> > test program on the target and passing that flag (cd into the
> > directory where the test program is located, then run it with
> > -test.v).
> >
> > Regards,
> > -Matt
> >
> >>
> >> BTW, Could you help to check?
> >>
> >> root@qemux86-64:~# cd /usr/lib64/go-dep/ptest/
> >> root@qemux86-64:/usr/lib64/go-dep/ptest# cat run-ptest
> >> #!/bin/sh
> >> RC=3D0
> >> run_test() (
> >>       cd "$1"
> >>       ((((./$2 ; echo $? >&3) | sed -r -e"s,^(PASS|SKIP|FAIL)$,\1:
> >> $1/$2," >&4) 3>&1) | (read rc; exit $rc)) 4>&1
> >>       exit $?)
> >> run_test github.com/golang/dep/cmd/dep dep.test || RC=3D1
> >> exit $RC
> >> root@qemux86-64:/usr/lib64/go-dep/ptest# ./run-ptest
> >> building testdep failed: exit status 1
> >> can't load package: package .: no Go files in
> >> /usr/lib64/go-dep/ptest/github.com/golang/dep/cmd/dep
> >> root@qemux86-64:/usr/lib64/go-dep/ptest#
> >>
> >> Thanks,
> >>
> >> On 2018=E5=B9=B403=E6=9C=8805=E6=97=A5 05:09, Matt Madison wrote:
> >>> * Don't enable verbose test output (-test.v)
> >>>     by default, as it generates too much noise
> >>>     for automated results parsing
> >>>
> >>> * Override do_install_ptest_base in the bbclass,
> >>>     so recipes can provide their own modifications
> >>>     with do_install_ptest.
> >>>
> >>> * Improve the generated run-ptest script to better
> >>>     handle large numbers of tests, and to generate
> >>>     'status: test name' output similar to Automake
> >>>     tests.
> >>>
> >>> * Install all non-vendored 'testdata' directories
> >>>     from the source into the ptest package, as some
> >>>     packages share test data among multiple tests.
> >>>
> >>> Signed-off-by: Matt Madison <matt@madison.systems>
> >>> ---
> >>>    meta/classes/go.bbclass | 87 +++++++++++++++++++++++++++++--------=
------------
> >>>    1 file changed, 51 insertions(+), 36 deletions(-)
> >>>
> >>> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> >>> index afd68b5951..a51ba3e9f0 100644
> >>> --- a/meta/classes/go.bbclass
> >>> +++ b/meta/classes/go.bbclass
> >>> @@ -26,7 +26,7 @@ GO_LDFLAGS ?=3D '-ldflags=3D"${GO_RPATH} ${GO_LINKM=
ODE} -extldflags '${GO_EXTLDFLAGS
> >>>    export GOBUILDFLAGS ?=3D "-v ${GO_LDFLAGS}"
> >>>    export GOPATH_OMIT_IN_ACTIONID ?=3D "1"
> >>>    export GOPTESTBUILDFLAGS ?=3D "${GOBUILDFLAGS} -c"
> >>> -export GOPTESTFLAGS ?=3D "-test.v"
> >>> +export GOPTESTFLAGS ?=3D ""
> >>>    GOBUILDFLAGS_prepend_task-compile =3D "${GO_PARALLEL_BUILD} "
> >>>
> >>>    export GO =3D "${HOST_PREFIX}go"
> >>> @@ -76,7 +76,7 @@ go_list_packages() {
> >>>    }
> >>>
> >>>    go_list_package_tests() {
> >>> -    ${GO} list -f '{{.ImportPath}} {{.TestGoFiles}}' ${GOBUILDFLAGS}=
 ${GO_INSTALL} | \
> >>> +     ${GO} list -f '{{.ImportPath}} {{.TestGoFiles}}' ${GOBUILDFLAGS=
} ${GO_INSTALL} | \
> >>>                grep -v '\[\]$' | \
> >>>                egrep -v '${GO_INSTALL_FILTEROUT}' | \
> >>>                awk '{ print $1 }'
> >>> @@ -100,15 +100,16 @@ go_do_compile() {
> >>>    do_compile[dirs] =3D+ "${GOTMPDIR}"
> >>>    do_compile[cleandirs] =3D "${B}/bin ${B}/pkg"
> >>>
> >>> -do_compile_ptest() {
> >>> +do_compile_ptest_base() {
> >>>        export TMPDIR=3D"${GOTMPDIR}"
> >>> -    rm -f ${B}/.go_compiled_tests.list
> >>> +     rm -f ${B}/.go_compiled_tests.list
> >>>        go_list_package_tests | while read pkg; do
> >>>                cd ${B}/src/$pkg
> >>>                ${GO} test ${GOPTESTBUILDFLAGS} $pkg
> >>>                find . -mindepth 1 -maxdepth 1 -type f -name '*.test' =
-exec echo $pkg/{} \; | \
> >>>                        sed -e's,/\./,/,'>> ${B}/.go_compiled_tests.li=
st
> >>>        done
> >>> +     do_compile_ptest
> >>>    }
> >>>    do_compile_ptest_base[dirs] =3D+ "${GOTMPDIR}"
> >>>
> >>> @@ -124,40 +125,54 @@ go_do_install() {
> >>>        fi
> >>>    }
> >>>
> >>> -do_install_ptest_base() {
> >>> -    test -f "${B}/.go_compiled_tests.list" || exit 0
> >>> -    tests=3D""
> >>> -    while read test; do
> >>> -        tests=3D"$tests${tests:+ }${test%.test}"
> >>> -        testdir=3D`dirname $test`
> >>> -        install -d ${D}${PTEST_PATH}/$testdir
> >>> -        install -m 0755 ${B}/src/$test ${D}${PTEST_PATH}/$test
> >>> -        if [ -d "${B}/src/$testdir/testdata" ]; then
> >>> -            cp --preserve=3Dmode,timestamps -R "${B}/src/$testdir/te=
stdata" ${D}${PTEST_PATH}/$testdir
> >>> -        fi
> >>> -    done < ${B}/.go_compiled_tests.list
> >>> -    if [ -n "$tests" ]; then
> >>> -        install -d ${D}${PTEST_PATH}
> >>> -        cat >${D}${PTEST_PATH}/run-ptest <<EOF
> >>> +go_make_ptest_wrapper() {
> >>> +     cat >${D}${PTEST_PATH}/run-ptest <<EOF
> >>>    #!/bin/sh
> >>> -ANYFAILED=3D0
> >>> -for t in $tests; do
> >>> -    testdir=3D\`dirname \$t.test\`
> >>> -    if ( cd "${PTEST_PATH}/\$testdir"; "${PTEST_PATH}/\$t.test" ${GO=
PTESTFLAGS} | tee /dev/fd/9 | grep -q "^FAIL" ) 9>&1; then
> >>> -        ANYFAILED=3D1
> >>> -    fi
> >>> -done
> >>> -if [ \$ANYFAILED -ne 0 ]; then
> >>> -    echo "FAIL: ${PN}"
> >>> -    exit 1
> >>> -fi
> >>> -echo "PASS: ${PN}"
> >>> -exit 0
> >>> +RC=3D0
> >>> +run_test() (
> >>> +    cd "\$1"
> >>> +    ((((./\$2 ${GOPTESTFLAGS}; echo \$? >&3) | sed -r -e"s,^(PASS|SK=
IP|FAIL)\$,\\1: \$1/\$2," >&4) 3>&1) | (read rc; exit \$rc)) 4>&1
> >>> +    exit \$?)
> >>>    EOF
> >>> -        chmod +x ${D}${PTEST_PATH}/run-ptest
> >>> -    else
> >>> -        rm -rf ${D}${PTEST_PATH}
> >>> -    fi
> >>> +
> >>> +}
> >>> +
> >>> +go_stage_testdata() {
> >>> +     oldwd=3D"$PWD"
> >>> +     cd ${S}/src
> >>> +     find ${GO_IMPORT} -depth -type d -name testdata | while read d;=
 do
> >>> +             if echo "$d" | grep -q '/vendor/'; then
> >>> +                     continue
> >>> +             fi
> >>> +             parent=3D`dirname $d`
> >>> +             install -d ${D}${PTEST_PATH}/$parent
> >>> +             cp --preserve=3Dmode,timestamps -R $d ${D}${PTEST_PATH}=
/$parent/
> >>> +     done
> >>> +     cd "$oldwd"
> >>> +}
> >>> +
> >>> +do_install_ptest_base() {
> >>> +     test -f "${B}/.go_compiled_tests.list" || exit 0
> >>> +     install -d ${D}${PTEST_PATH}
> >>> +     go_stage_testdata
> >>> +     go_make_ptest_wrapper
> >>> +     havetests=3D""
> >>> +     while read test; do
> >>> +             testdir=3D`dirname $test`
> >>> +             testprog=3D`basename $test`
> >>> +             install -d ${D}${PTEST_PATH}/$testdir
> >>> +             install -m 0755 ${B}/src/$test ${D}${PTEST_PATH}/$test
> >>> +     echo "run_test $testdir $testprog || RC=3D1" >> ${D}${PTEST_PAT=
H}/run-ptest
> >>> +             havetests=3D"yes"
> >>> +     done < ${B}/.go_compiled_tests.list
> >>> +     if [ -n "$havetests" ]; then
> >>> +             echo "exit \$RC" >> ${D}${PTEST_PATH}/run-ptest
> >>> +             chmod +x ${D}${PTEST_PATH}/run-ptest
> >>> +     else
> >>> +             rm -rf ${D}${PTEST_PATH}
> >>> +     fi
> >>> +     do_install_ptest
> >>> +     chown -R root:root ${D}${PTEST_PATH}
> >>>    }
> >>>
> >>>    EXPORT_FUNCTIONS do_unpack do_configure do_compile do_install
> >>>
> >


Return-Path: <matt@madison.systems>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id DBCE67E3B0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 12:24:01 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id j29so12458925lfk.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 05:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=oBSk5bEcJdGUTLepaez1K8R4nEoSXLYcOmolK4hVk9Q=;
	b=O4w5ORU7FL62kJ0wFr4z4ziS0G87JyZyZrDtWNSwmMSpn7sP8ltPzpeBuFXFjkjh1A
	9nrUKhWaOVZaNpere8OERV98O6EDKKB+fjclY6qJRbLySI8zfoa9FuLaR1RyDd3yy+tz
	YJUiGf4BCzd5wKhPa/iS5558uctVJJwAeMfR6gTN9hXpYJ6bPTfZhAKE3uuaGMtJBoME
	rXf3vrRxuUjg5TedKq99aARMZbazb00jvKCGPq1+lVN9nP77xCDiHegZKhmLEF3Hs+lA
	LZ4WvI7kM+hyUhgIsxQhDwFc+wcafxGXOS4A6GYN+Zh7cO43dvbCovyA59Y5mTiYLH4d
	0QHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=oBSk5bEcJdGUTLepaez1K8R4nEoSXLYcOmolK4hVk9Q=;
	b=sjz2gGC+SRgveV/iCG3lx+yaEC5oJlzHGWyLzrbWEdMq4BIkmArtAi1s+JYwx2Us53
	sw5pI8usJDBahrPlDxv4fvT4c9Es+jrEaj/ltIxlldqiJwnjo9lHfko/513PzGQWEpNv
	47GHJQtwoSUcRLAyk9V9RUzMALaH6IiKnNq0Q3sm94VyMbEY+RGZ6I+nzNYu5j3Mz1g3
	hLo/icjGj3QMrsw/dJVyYkxa3I+muuqQiK+HRyDzzRpxlGIRpbdirEWRho2RCKcP3DPC
	vtGe8WbHOX6Qxsf8aQHLF9ioiPrmf9e7RKh/Fio0Qn02MqWn6Yc96TApQa/bCz5HBq8P
	f6mw==
X-Gm-Message-State: APjAAAW0EQY+wjYdU3FfNSYLwHUimAftYM+K6JPGDb6wN8FIicqXDzuT
	1rdfvf19Wz5UMwEWhiU8YqOOdAaNHBMJrrzqNCsTiQ==
X-Google-Smtp-Source: APXvYqyvwIcYbk4EeXJ660f4eebvgJbVft+IE4jDO9sD4cP3Af6gZ2Izcgf+jai/VuEslr1W6u48DJEV77sizku+5Ds=
X-Received: by 2002:a19:41c8:: with SMTP id o191mr15737853lfa.83.1561465442351;
	Tue, 25 Jun 2019 05:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20180304210937.29727-1-matt@madison.systems>
	<20180304210937.29727-7-matt@madison.systems>
	<5D0C9F8B.8060109@windriver.com>
In-Reply-To: <5D0C9F8B.8060109@windriver.com>
From: Matt Madison <matt@madison.systems>
Date: Tue, 25 Jun 2019 05:23:51 -0700
Message-ID: <CAGgRHJoXVPEq-L9iHniD9mQtvC3CGq3-jP7NincOx1gVqCps3g@mail.gmail.com>
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
X-List-Received-Date: Tue, 25 Jun 2019 12:24:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2019 at 2:08 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> Hi Matt,
>
> I noticed your commit is the latest update for go-dep ptest. But the
> go-dep ptest doesn't work in my environment. I'm trying to figure out
> what's wrong is here though I didn't know much about go.

I went back over the commits, and I don't think I did anything with
go-dep specifically. I can see that the tests are failing for it, and
it looks like it's because go-dep's test programs make some
assumptions about the environment.  For one thing, it needs the go
compiler installed. It also looks like it's expecting some source
files to be present... in other words, it's not really designed for a
cross-build setup, with tests run on the cross-built target. It could
be messy to work around that, and I'm not sure how useful it would be
anyway, seeing as how go-dep is more of a build tool.  Might be better
to just disable ptests for it completely.

BTW, you can have the test programs generate verbose output by setting
GOPTESTFLAGS =3D "-test.v" in the recipe, which will add that flag to
their invocation in the wrapper script, or by manually running the
test program on the target and passing that flag (cd into the
directory where the test program is located, then run it with
-test.v).

Regards,
-Matt

>
> BTW, Could you help to check?
>
> root@qemux86-64:~# cd /usr/lib64/go-dep/ptest/
> root@qemux86-64:/usr/lib64/go-dep/ptest# cat run-ptest
> #!/bin/sh
> RC=3D0
> run_test() (
>      cd "$1"
>      ((((./$2 ; echo $? >&3) | sed -r -e"s,^(PASS|SKIP|FAIL)$,\1:
> $1/$2," >&4) 3>&1) | (read rc; exit $rc)) 4>&1
>      exit $?)
> run_test github.com/golang/dep/cmd/dep dep.test || RC=3D1
> exit $RC
> root@qemux86-64:/usr/lib64/go-dep/ptest# ./run-ptest
> building testdep failed: exit status 1
> can't load package: package .: no Go files in
> /usr/lib64/go-dep/ptest/github.com/golang/dep/cmd/dep
> root@qemux86-64:/usr/lib64/go-dep/ptest#
>
> Thanks,
>
> On 2018=E5=B9=B403=E6=9C=8805=E6=97=A5 05:09, Matt Madison wrote:
> > * Don't enable verbose test output (-test.v)
> >    by default, as it generates too much noise
> >    for automated results parsing
> >
> > * Override do_install_ptest_base in the bbclass,
> >    so recipes can provide their own modifications
> >    with do_install_ptest.
> >
> > * Improve the generated run-ptest script to better
> >    handle large numbers of tests, and to generate
> >    'status: test name' output similar to Automake
> >    tests.
> >
> > * Install all non-vendored 'testdata' directories
> >    from the source into the ptest package, as some
> >    packages share test data among multiple tests.
> >
> > Signed-off-by: Matt Madison <matt@madison.systems>
> > ---
> >   meta/classes/go.bbclass | 87 +++++++++++++++++++++++++++++-----------=
---------
> >   1 file changed, 51 insertions(+), 36 deletions(-)
> >
> > diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> > index afd68b5951..a51ba3e9f0 100644
> > --- a/meta/classes/go.bbclass
> > +++ b/meta/classes/go.bbclass
> > @@ -26,7 +26,7 @@ GO_LDFLAGS ?=3D '-ldflags=3D"${GO_RPATH} ${GO_LINKMOD=
E} -extldflags '${GO_EXTLDFLAGS
> >   export GOBUILDFLAGS ?=3D "-v ${GO_LDFLAGS}"
> >   export GOPATH_OMIT_IN_ACTIONID ?=3D "1"
> >   export GOPTESTBUILDFLAGS ?=3D "${GOBUILDFLAGS} -c"
> > -export GOPTESTFLAGS ?=3D "-test.v"
> > +export GOPTESTFLAGS ?=3D ""
> >   GOBUILDFLAGS_prepend_task-compile =3D "${GO_PARALLEL_BUILD} "
> >
> >   export GO =3D "${HOST_PREFIX}go"
> > @@ -76,7 +76,7 @@ go_list_packages() {
> >   }
> >
> >   go_list_package_tests() {
> > -    ${GO} list -f '{{.ImportPath}} {{.TestGoFiles}}' ${GOBUILDFLAGS} $=
{GO_INSTALL} | \
> > +     ${GO} list -f '{{.ImportPath}} {{.TestGoFiles}}' ${GOBUILDFLAGS} =
${GO_INSTALL} | \
> >               grep -v '\[\]$' | \
> >               egrep -v '${GO_INSTALL_FILTEROUT}' | \
> >               awk '{ print $1 }'
> > @@ -100,15 +100,16 @@ go_do_compile() {
> >   do_compile[dirs] =3D+ "${GOTMPDIR}"
> >   do_compile[cleandirs] =3D "${B}/bin ${B}/pkg"
> >
> > -do_compile_ptest() {
> > +do_compile_ptest_base() {
> >       export TMPDIR=3D"${GOTMPDIR}"
> > -    rm -f ${B}/.go_compiled_tests.list
> > +     rm -f ${B}/.go_compiled_tests.list
> >       go_list_package_tests | while read pkg; do
> >               cd ${B}/src/$pkg
> >               ${GO} test ${GOPTESTBUILDFLAGS} $pkg
> >               find . -mindepth 1 -maxdepth 1 -type f -name '*.test' -ex=
ec echo $pkg/{} \; | \
> >                       sed -e's,/\./,/,'>> ${B}/.go_compiled_tests.list
> >       done
> > +     do_compile_ptest
> >   }
> >   do_compile_ptest_base[dirs] =3D+ "${GOTMPDIR}"
> >
> > @@ -124,40 +125,54 @@ go_do_install() {
> >       fi
> >   }
> >
> > -do_install_ptest_base() {
> > -    test -f "${B}/.go_compiled_tests.list" || exit 0
> > -    tests=3D""
> > -    while read test; do
> > -        tests=3D"$tests${tests:+ }${test%.test}"
> > -        testdir=3D`dirname $test`
> > -        install -d ${D}${PTEST_PATH}/$testdir
> > -        install -m 0755 ${B}/src/$test ${D}${PTEST_PATH}/$test
> > -        if [ -d "${B}/src/$testdir/testdata" ]; then
> > -            cp --preserve=3Dmode,timestamps -R "${B}/src/$testdir/test=
data" ${D}${PTEST_PATH}/$testdir
> > -        fi
> > -    done < ${B}/.go_compiled_tests.list
> > -    if [ -n "$tests" ]; then
> > -        install -d ${D}${PTEST_PATH}
> > -        cat >${D}${PTEST_PATH}/run-ptest <<EOF
> > +go_make_ptest_wrapper() {
> > +     cat >${D}${PTEST_PATH}/run-ptest <<EOF
> >   #!/bin/sh
> > -ANYFAILED=3D0
> > -for t in $tests; do
> > -    testdir=3D\`dirname \$t.test\`
> > -    if ( cd "${PTEST_PATH}/\$testdir"; "${PTEST_PATH}/\$t.test" ${GOPT=
ESTFLAGS} | tee /dev/fd/9 | grep -q "^FAIL" ) 9>&1; then
> > -        ANYFAILED=3D1
> > -    fi
> > -done
> > -if [ \$ANYFAILED -ne 0 ]; then
> > -    echo "FAIL: ${PN}"
> > -    exit 1
> > -fi
> > -echo "PASS: ${PN}"
> > -exit 0
> > +RC=3D0
> > +run_test() (
> > +    cd "\$1"
> > +    ((((./\$2 ${GOPTESTFLAGS}; echo \$? >&3) | sed -r -e"s,^(PASS|SKIP=
|FAIL)\$,\\1: \$1/\$2," >&4) 3>&1) | (read rc; exit \$rc)) 4>&1
> > +    exit \$?)
> >   EOF
> > -        chmod +x ${D}${PTEST_PATH}/run-ptest
> > -    else
> > -        rm -rf ${D}${PTEST_PATH}
> > -    fi
> > +
> > +}
> > +
> > +go_stage_testdata() {
> > +     oldwd=3D"$PWD"
> > +     cd ${S}/src
> > +     find ${GO_IMPORT} -depth -type d -name testdata | while read d; d=
o
> > +             if echo "$d" | grep -q '/vendor/'; then
> > +                     continue
> > +             fi
> > +             parent=3D`dirname $d`
> > +             install -d ${D}${PTEST_PATH}/$parent
> > +             cp --preserve=3Dmode,timestamps -R $d ${D}${PTEST_PATH}/$=
parent/
> > +     done
> > +     cd "$oldwd"
> > +}
> > +
> > +do_install_ptest_base() {
> > +     test -f "${B}/.go_compiled_tests.list" || exit 0
> > +     install -d ${D}${PTEST_PATH}
> > +     go_stage_testdata
> > +     go_make_ptest_wrapper
> > +     havetests=3D""
> > +     while read test; do
> > +             testdir=3D`dirname $test`
> > +             testprog=3D`basename $test`
> > +             install -d ${D}${PTEST_PATH}/$testdir
> > +             install -m 0755 ${B}/src/$test ${D}${PTEST_PATH}/$test
> > +     echo "run_test $testdir $testprog || RC=3D1" >> ${D}${PTEST_PATH}=
/run-ptest
> > +             havetests=3D"yes"
> > +     done < ${B}/.go_compiled_tests.list
> > +     if [ -n "$havetests" ]; then
> > +             echo "exit \$RC" >> ${D}${PTEST_PATH}/run-ptest
> > +             chmod +x ${D}${PTEST_PATH}/run-ptest
> > +     else
> > +             rm -rf ${D}${PTEST_PATH}
> > +     fi
> > +     do_install_ptest
> > +     chown -R root:root ${D}${PTEST_PATH}
> >   }
> >
> >   EXPORT_FUNCTIONS do_unpack do_configure do_compile do_install
> >


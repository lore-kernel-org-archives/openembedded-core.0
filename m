Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Date: Sat, 2 Oct 2021 19:18:14 +0200
From: "Petr Vorel" <petr.vorel@gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] ltp: Update to 20210927
Message-ID: <YViUVjCF+ZWWy24M@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20210930190911.31243-1-petr.vorel@gmail.com>
 <CAEUSe7-FAwj0jWjxK==yL6exsG9BhqoNJF7+xMhG7t_gFpXWYA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEUSe7-FAwj0jWjxK==yL6exsG9BhqoNJF7+xMhG7t_gFpXWYA@mail.gmail.com>
Content-Type: text/plain; charset="iso-8859-2"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-id: <openembedded-core.lists.openembedded.org>
To: Daniel =?iso-8859-2?Q?D=EDaz?= <daniel.diaz@linaro.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Anders Roxell <anders.roxell@linaro.org>, Naresh Kamboju <naresh.kamboju@linaro.org>

Hi Daniel,

> Hello!

> Many thanks for this prompt recipe!
yw, thanks for helping to test!

> On Thu, 30 Sept 2021 at 14:09, Petr Vorel <petr.vorel@gmail.com> wrote:
> > New patches to fix functionality:
> > * 0002-lib-fix-MemAvailable-parsing.patch
> > * 0003-lapi-rtnetlink.h-Fix-include-guards.patch
> > * 0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch
> > * 0005-lapi-if_addr.h-Define-IFA_FLAGS.patch

> > Removed patch from this release
> > * 0001-syscalls-ioctl_ns05.c-ioctl_ns06.c-Fix-too-small-buf.patch

> > Rebased patch
> > * 0001-Remove-OOM-tests-from-runtest-mm.patch

> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> [...]
> > diff --git a/meta/recipes-extended/ltp/ltp_20210524.bb b/meta/recipes-e=
xtended/ltp/ltp_20210927.bb
> > similarity index 93%
> > rename from meta/recipes-extended/ltp/ltp_20210524.bb
> > rename to meta/recipes-extended/ltp/ltp_20210927.bb

> This needs to be updated in the recipe:

> LIC_FILES_CHKSUM =3D "\
>     file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>     file://testcases/open_posix_testsuite/COPYING;md5=3D48b1c5ec633e3e30e=
c2cf884ae699947
> \
>     file://testcases/network/can/filter-tests/COPYING;md5=3D5b155ea7d7f86=
eae8e8832955d8b70bc
> \
> "

Ah, I reduced copying files, thanks for a reminder! Sending v2 in a minute.

> FWIW, we've build-tested it (against Sumo :(, changing the override
> separator), but have yet to execute the actual tests.
Thanks!

Kind regards,
Petr

> Greetings!

> Daniel D=EDaz
> daniel.diaz@linaro.org

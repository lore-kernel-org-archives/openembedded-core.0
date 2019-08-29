Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6F6586BDE3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 03:20:45 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id x18so1584065ljh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 20:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=33dIwYA7Q5lMr8A/Wig8itdE6bFiRlx3X4IhHDNNPcU=;
	b=AabRwfVaE8UMP+cINHwqYos2tzSaZJ7C8Woblj8wjfKXb3esBkGPPranyoMkNowLxs
	OWSKKqIHmRQnXrSkbnfkWjKC94vkEZbSos024mEds4hsR6cv6Vjl6hwdce+wVqvd5Hnv
	YqUkJHL6+vKdeHw0MDiX0OSovJz7qDrpDjSwptyRBqRFsXlh7v2+xDSaiET+x6UO0zZ0
	YNzc0teW/h5DGze6G8AyBAs5EkRX8l8CZnqMURBF1jAnEjlqzUnQRmCH5fScJraaean7
	dLqn+B3yHm2a/EU4JXhEWvZuYtBb4MAZBvle9pT4Fvh6bhSJqnOBXG+rEu12MHGAUGNS
	ebrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=33dIwYA7Q5lMr8A/Wig8itdE6bFiRlx3X4IhHDNNPcU=;
	b=AG8UG7y1x9ESpXZI3tGvfPDRu4cI5kokD3O3KhwF9JbCM3yqdDzVNvEAlR7H9jPALr
	rTfBV3NrUqC0vxtixLezvWqO9VJ767Fn+TqKg+W659BhMds6uB9T/l1Oxm0tz7uJMWpe
	ldsyNzT8MICHD7tc0g0PsjllpymNqyz9IwLWpX8gq0NK4VYWpmkBh7JnfJ4NbGmhPhUN
	LbrG34XBY9DZpUwW//IfY4GyFjGJyFb8WogY278JjpbPoQPozDYEkVyCtPG5ucf4Qtwh
	hkidazS+yBg6v6ylV4GqPyGD7cPjw8fKRCo3aiLW8Qg4mY7fOK6qforw98lhXPZaspsC
	TxUQ==
X-Gm-Message-State: APjAAAVHYzI9BmvG1SBkJaLTZWaaoKdn19WSokKeIAsczwqPildDKUY/
	W7QkWq+To8cxLSA4LrW90QnSXWWqzhZUkJyQKE4=
X-Google-Smtp-Source: APXvYqzS2OKwLE1FsqPKK/rbdYI8GE9SO9xDXDeauMUZrS3Lulfr+jG/ywHzWjItesI0pGbeIbSaJ4RP5hO/AhHGC+A=
X-Received: by 2002:a2e:9196:: with SMTP id f22mr3916357ljg.78.1567048845709; 
	Wed, 28 Aug 2019 20:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190829021441.32058-1-bruce.ashfield@gmail.com>
In-Reply-To: <20190829021441.32058-1-bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 28 Aug 2019 23:20:34 -0400
Message-ID: <CADkTA4PuJrs6bsWGYzWq2Qu1kRhOhzAJu2rLf4+v9qVSUNBD4Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] perf: change dependencies on python to python3
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
X-List-Received-Date: Thu, 29 Aug 2019 03:20:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 28, 2019 at 10:14 PM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> The upstream kernel can now handle python3 for the perf scripts, coupled
> with the impending EOL of python2, we switch the dependencies in perf
> (scripting) to python3.
>
> Outside of dependency changes, we also pass the following two variables
> to the perf build: PYTHON=python3 PYTHON_CONFIG=python3-config. To
> ensure that our python3 components are used.
>
> For configurations that disable perf scripting, there is no change in
> behaviour.
>
> [YOCTO #13358]
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>
> v2:
>   - tested against 4.19, 5.0 and 5.2+
>   - broadened search path for scripts
>   - added /usr/bin/python to the fixup list

Also, if a meta-python2 is created, we can do a perf variant that
depends on python2 so older kernels (that can't be patched) can still
use perf scripting if they want. But I'm betting the number of
users/kernels is quite small, so it may just be better as an "on
demand" thing.

Cheers,

Bruce

>
>  meta/recipes-kernel/perf/perf.bb | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 4e603f1a32..af0410c88d 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -13,7 +13,7 @@ PR = "r9"
>
>  PACKAGECONFIG ??= "scripting tui libunwind"
>  PACKAGECONFIG[dwarf] = ",NO_DWARF=1"
> -PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python"
> +PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python3"
>  # gui support was added with kernel 3.6.35
>  # since 3.10 libnewt was replaced by slang
>  # to cover a wide range of kernel we add both dependencies
> @@ -44,8 +44,8 @@ PROVIDES = "virtual/perf"
>  inherit linux-kernel-base kernel-arch manpages
>
>  # needed for building the tools/perf Python bindings
> -inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'pythonnative', '', d)}
> -inherit python-dir
> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3native', '', d)}
> +inherit python3-dir
>  export PYTHON_SITEPACKAGES_DIR
>
>  #kernel 3.1+ supports WERROR to disable warnings as errors
> @@ -94,6 +94,7 @@ EXTRA_OEMAKE += "\
>      'sharedir=${@os.path.relpath(datadir, prefix)}' \
>      'mandir=${@os.path.relpath(mandir, prefix)}' \
>      'infodir=${@os.path.relpath(infodir, prefix)}' \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'PYTHON=python3 PYTHON_CONFIG=python3-config', '', d)} \
>  "
>
>  # During do_configure, we might run a 'make clean'. That often breaks
> @@ -132,7 +133,7 @@ do_install() {
>         oe_runmake install
>         # we are checking for this make target to be compatible with older perf versions
>         if ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'true', 'false', d)} && grep -q install-python_ext ${S}/tools/perf/Makefile*; then
> -               oe_runmake DESTDIR=${D} install-python_ext
> +           oe_runmake DESTDIR=${D} install-python_ext
>         fi
>  }
>
> @@ -232,8 +233,10 @@ do_configure_prepend () {
>      fi
>
>      # use /usr/bin/env instead of version specific python
> -    for s in `find ${S}/tools/perf/scripts/python/ -name '*.py'`; do
> -        sed -i 's,/usr/bin/python2,/usr/bin/env python,' "${s}"
> +    for s in `find ${S}/tools/perf/ -name '*.py'`; do
> +        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
> +        sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
> +        sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
>      done
>
>      # unistd.h can be out of sync between libc-headers and the captured version in the perf source
> @@ -252,9 +255,9 @@ PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
>
>  RDEPENDS_${PN} += "elfutils bash"
>  RDEPENDS_${PN}-archive =+ "bash"
> -RDEPENDS_${PN}-python =+ "bash python python-modules ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python', '', d)}"
> +RDEPENDS_${PN}-python =+ "bash python3 python3-modules ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python3', '', d)}"
>  RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
> -RDEPENDS_${PN}-tests =+ "python"
> +RDEPENDS_${PN}-tests =+ "python3"
>
>  RSUGGESTS_SCRIPTING = "${@bb.utils.contains('PACKAGECONFIG', 'scripting', '${PN}-perl ${PN}-python', '',d)}"
>  RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
> --
> 2.19.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


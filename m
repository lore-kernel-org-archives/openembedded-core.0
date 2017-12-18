Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id E2F94781F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 20:26:32 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id 9so185384wme.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 12:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bcxgwzlBLtoOfnHKOeNjICq6rqpAtCyihoDGC9hYRsc=;
	b=Hy3t1IWZq3a3Qr8PrhK3dkjgQ8HGXl7+WwgjXlQGRhypz6pTNdOzZdndZ1eU9niLs6
	WzOUAnzStjE/4YT6jGrI0PkFfdPo47ga+374pv/AZO7KoZt7bKLtm7fjUhPiOmZrnk8c
	LKZCZcTXxAxT7PxPuXDTSuJvjEkn1njgdYhTJgSQsC7r2DlQCUmTVidqqbkr652HcfJG
	sFtcyqcjBDShT3optHe60IW/0y/Eu8IlI3LfcKZPUGI8GEY7zBl358Hd+v8VmSPvVtAS
	/Q+aezxTNfQXJsDjqmLaxIvw8oCIK98BFagS/+GtASKYz5eU+SWCen367i65iYtSHOfh
	wlcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bcxgwzlBLtoOfnHKOeNjICq6rqpAtCyihoDGC9hYRsc=;
	b=Dpq59ZvGOVnVQAjiOA92Pa31VqRyWizoZuyzj4+meYcvW3ZNDGIuQPNu+mjy7F5BWz
	G0ESwE7BbjnxOVqtphanK2l3D6SHrHm5h/vJ5HbPwLUnVsP89bdJoQ6H0vj0DkKI2kxG
	w5mhwNzP60Qq+XhH0IFqUoD1GO7xg5sUfdkuJi71p0qdL2YAi7h8IvXDXwDP+WJ/uDPU
	N9kcguLe9bMQnyCn5Gtvlyu3PKwDZ2da68FPUfYrpI7pG627HWxTIz3zyvUwXrK1CNue
	4Kd4yi36qRC6491kQhlVPbLthIVrp1r/ltVx7l1tn59rrYKauUxsSaKbSQem8EUcZHce
	/grg==
X-Gm-Message-State: AKGB3mLZgwEugWVmiUlnR+hd7sgoPUes2Jngz5iiW+rhsGE77bPf/kGq
	koA8CuoMw+ZVjV81onzVlti9XkwwxyZd3wSVdZI=
X-Google-Smtp-Source: ACJfBosuCgRwyWRGlVByXh+KKAUh79ObCKIMvc29INCxwRkdbk5k0GwPGM2IEEbo4zqFmi4+CYBDhIB623ouNP96YVg=
X-Received: by 10.28.172.202 with SMTP id v193mr525743wme.10.1513628793552;
	Mon, 18 Dec 2017 12:26:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.184.47 with HTTP; Mon, 18 Dec 2017 12:26:32 -0800 (PST)
In-Reply-To: <20171218174347.92919-2-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20171218174347.92919-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<20171218174347.92919-2-leonardo.sandoval.gonzalez@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 18 Dec 2017 12:26:32 -0800
Message-ID: <CAJ86T=XEeM364CYatGqTi6K-zJyXkghOg1rMXb4ORQdUDJf=gQ@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] parallel-oe-selftest.sh: runs oe-selftest in parallel
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
X-List-Received-Date: Mon, 18 Dec 2017 20:26:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 18, 2017 at 9:43 AM,
<leonardo.sandoval.gonzalez@linux.intel.com> wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> Parallelize oe-selftest execution using GNU/Parallel: for each test
> defined, a job will be launched and at any time at maximun of jobs will

Typo.

> be executing (defaults to 4).
>
> 1. Run all modules
>
>     parallel-oe-selftest.sh
>
> 2. Run certaing modules and print results in order (see parallel man page for

Typo.

> more info)
>
>     parallel-oe-selftest.sh wic bblayers
>
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>  scripts/contrib/parallel-oe-selftest.sh | 80 +++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100755 scripts/contrib/parallel-oe-selftest.sh
>
> diff --git a/scripts/contrib/parallel-oe-selftest.sh b/scripts/contrib/parallel-oe-selftest.sh
> new file mode 100755
> index 0000000000..b2690f34fd
> --- /dev/null
> +++ b/scripts/contrib/parallel-oe-selftest.sh
> @@ -0,0 +1,80 @@
> +#!/bin/sh
> +
> +# paralell-oe-selftest: executes oe-selftest in 'parallel'. The tests (modules, clases or test methods, same

Two typos.

> +# as oe-selftest --run-tests) to be executed can be piped to this script; if this is not the case, all modules
> +# are executed
> +#
> +# Copyright (c) 2013-2017 Intel Corporation
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License version 2 as
> +# published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License along
> +# with this program; if not, write to the Free Software Foundation, Inc.,
> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +#
> +
> +# Before anything else, check oe-core environment
> +if [ -z "$BUILDDIR" ]; then
> +    echo "Please initialize the OE-Core environment through oe-init-build-env script"
> +    exit 1
> +fi
> +
> +usage() {
> +CMD=$(basename $0)
> +cat <<EOM
> +Usage: $CMD [-h] [-j jobs] [test1 test2 ..]
> +  -j jobs             Number of jobs to be running concurrently
> +  -h                  Display this help message
> +
> + Examples:
> +   # run all found testcases
> +   $CMD
> +
> +   # just run wic and bblayers
> +   $CMD wic bblayers
> +
> +EOM
> +}
> +
> +JOBS=4
> +# Parse and validate arguments
> +while getopts "hj:" OPT; do
> +       case $OPT in
> +       j)
> +               JOBS="$OPTARG"
> +               ;;
> +       h)
> +               usage
> +               exit 0
> +               ;;
> +       --)
> +               shift
> +               break
> +               ;;
> +       esac
> +done
> +
> +
> +shift "$((OPTIND - 1))"
> +TESTCASES="$@"
> +
> +# Parallelization is done through GNU/Paralell, so it must be present in host machine

Typo.

> +which parallel 2>&1 >/dev/null || { echo "Please install GNU/Parallel"; exit 1; }
> +
> +# no test cases given, running all found
> +if [ -z "$TESTCASES" ]; then
> +    TESTCASES="$(oe-selftest -m | awk '{ print $NF } ' | grep -v ':')"
> +fi
> +
> +if [ -z "$TESTCASES" ]; then
> +    echo $TESTCASES | time parallel --keep-order --progress --jobs $JOBS oe-selftest -r

Since $TESTCASES is an empty variable here, why echo it?

> +else
> +    time parallel -d ' ' --keep-order --progress --jobs $JOBS oe-selftest -r ::: $TESTCASES
> +fi
> --
> 2.12.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


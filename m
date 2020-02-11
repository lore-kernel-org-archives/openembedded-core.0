Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	by mail.openembedded.org (Postfix) with ESMTP id AFDC660FDC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 16:37:23 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id z193so12476606iof.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 08:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5JIiTiLEHnFHyCe6hGlZAR2Ihq7j2Bbzfb/+9+FHlmc=;
	b=CsuD1n7AkaaWsSDO6dxQDbKZCP8qZYbO6swI4TNimwKwUBdIQsrJRacmNyDpkgxuyh
	s+rL2BzDaWnLsr7XnzZstj5+FmTEvtSpwKw07cjGM4CcyggNxpoz7VCpOg7txyd8BiiC
	lFUxY4XcG1pPQbOkb53vKGys5U00JK8PhSQOh29oweaz3F+9BxQ1Cxf8NfgL4mZxL5GH
	30x2cTAWi7RzL69J1f2E2F5EeRdfTZnM6B5fT9QJGDMMXWJhSr7QbD22Js8DuNn2XYyL
	oRdeI0bPYC7LJxE5xFEoFzke0J5FpmCibDJBSlpg/tPCx+XDwWj28ntZL60dOK66n8dO
	dZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5JIiTiLEHnFHyCe6hGlZAR2Ihq7j2Bbzfb/+9+FHlmc=;
	b=U+VUbWv54S3SwwIeeYvdNVbrjCZyjIjyq7XilYc8aI36oJlZOkWbkRprYwEHp5lmcb
	kYJRHbO81b7oUK3cSjkdId+T+HP3nihrljri/Igj7lICdD8tkt7MX0v1R6S7gByVAghA
	JnReyaEsYCcoEo6LazLo87lRnDCPzH6/605tH13jeNtkqhG9fwjUXyWNrHdiC5a6ASj6
	474wA2R4WmpOUiXgmb2JSd8mIcfwYUJwsiHQsWjOaP7/KotmGVWyvDMI5LrIG6cO+sFk
	JSnkP8V7a3wmQyrnyluxzx6+re2pO9Lge+zvLj9bz2+3Yn8EFJ1n5mG7LgpsAmHc864E
	2/kQ==
X-Gm-Message-State: APjAAAX2g2ladhXpASADvbnxch1nI/0LLRHvWEY11tat/eqoT7Fq7Jry
	qpxzuQviu2M+3I9Z27EE6LKruexSIpvRepNE0Ks=
X-Google-Smtp-Source: APXvYqxhSHwIHeJVDy/CteOvymIiGwxMDDiU3rZeBiZ4OCUg8JFjAluH+HEB+JNdj4ORcv1Y1sh3F2HCq6DWXuF2IzA=
X-Received: by 2002:a5d:9dc5:: with SMTP id 5mr14135571ioo.111.1581439044279; 
	Tue, 11 Feb 2020 08:37:24 -0800 (PST)
MIME-Version: 1.0
References: <20200210234603.1718190-1-trevor.gamblin@windriver.com>
	<CAMKF1spA0NSOd9m=T2AHJ0xULm8=9FBgpz4kCAUk_7O_+ONeJg@mail.gmail.com>
	<54185c02-4e1c-008f-b3d1-a97bea80771c@windriver.com>
In-Reply-To: <54185c02-4e1c-008f-b3d1-a97bea80771c@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Feb 2020 08:36:57 -0800
Message-ID: <CAMKF1srfMvF5PEB5c9t6gn8xCUg5g36ZRgvTyM4Dqvwke9Y3Vw@mail.gmail.com>
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] bitbake-buildall: automate build testing for qemu MACHINEs
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
X-List-Received-Date: Tue, 11 Feb 2020 16:37:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 11, 2020 at 6:06 AM Trevor Gamblin
<trevor.gamblin@windriver.com> wrote:
>
>
> On 2/10/20 7:28 PM, Khem Raj wrote:
> > On Mon, Feb 10, 2020 at 3:47 PM Trevor Gamblin
> > <trevor.gamblin@windriver.com> wrote:
> >> bitbake-buildall simplifies the process of build testing an upgraded or
> >> patched recipe by cycling through the build steps for each available qemu
> >> target, with desired LIBC specified by the user as an option (defaulting
> >> to both glibc and musl if no option is provided). While building, a log
> >> file with the name "<recipe>-buildall.log" is written, containing a PASS
> >> or FAIL line upon completion of the build for each architecture. For now,
> >> qemu targets are not selectable (i.e. the recipe is built for all qemu
> >> targets found in meta/conf/machine), but this functionality can be added
> >> in the future along with other useful options.
> >>
> >> The log file created by bitbake-buildall also includes some basic system
> >> info (e.g. build start time, hostname, host OS, host kernel). Since it is
> >> not guaranteed that tools such as lsb_release will be available on the
> >> host (it isn't by default on my Fedora machine), this information is
> >> collected manually. Additionally, the previous run's log is retained for
> >> comparison by renaming it in the format <recipe>-buildall.log.old once a
> >> new set of builds is triggered for the same recipe.
> >>
> >> Finally, in v2, the line "set -o pipefail" has been removed to be fully
> >> POSIX-compatible.
> >>
> >> Sample log output:
> >>
> >> BITBAKE-BUILDALL LOG FOR aspell
> >> START TIME: 2020-02-05_15:57:41
> >> HOSTNAME: yow-tgamblin-fedora2
> >> HOST OS: Fedora 31 (Server Edition)
> >> HOST KERNEL: 5.4.10-200.fc31.x86_64
> >> ===============
> >> BUILD RESULTS:
> >> [glibc]
> >> PASS: qemuarmv5
> >> PASS: qemux86
> >> PASS: qemuppc
> >> PASS: qemumips64
> >> FAIL: qemux86-64
> >> FAIL: qemumips
> >> FAIL: qemuarm
> >> FAIL: qemuarm64
> >> FAIL: qemuriscv64
> >> [musl]
> >> PASS: qemuarmv5
> >> PASS: qemux86
> >> PASS: qemuppc
> >> PASS: qemumips64
> >> PASS: qemux86-64
> >> PASS: qemumips
> >> PASS: qemuarm
> >> PASS: qemuarm64
> >> PASS: qemuriscv64
> >> ===============
> >> PASSED: 13
> >> FAILED: 5
> >>
> >> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> >> ---
> >>   scripts/bitbake-buildall | 120 +++++++++++++++++++++++++++++++++++++++
> >>   1 file changed, 120 insertions(+)
> >>   create mode 100755 scripts/bitbake-buildall
> > if its building qemu machines only, then naming it build-qemuall.sh or
> > some such would be
> > better, I would avoid usine bitbake- prefix. That can confuse with bitbake tools
>
> The intent is that it can be extended to machines other than just qemu
> with later patches, so I'm hesitant to give it a qemu-specific name.
>

its not clear if its generic enough, its grepping into hardcoded paths
in oe-core repo which
perhaps makes it specific.

> I could rename it to something like buildall-targets.
>

since we use bitbake-<something> for general tooling around bitbake,
this seems not fit that
bill.

> >
> >> diff --git a/scripts/bitbake-buildall b/scripts/bitbake-buildall
> >> new file mode 100755
> >> index 0000000000..74a5994f2f
> >> --- /dev/null
> >> +++ b/scripts/bitbake-buildall
> >> @@ -0,0 +1,120 @@
> >> +#!/bin/sh
> >> +#  Copyright (c) 2020 Wind River Systems, Inc.
> >> +#
> >> +# SPDX-License-Identifier: GPL-2.0-only
> >> +#
> >> +# bitbake-buildall: a tool for automating build testing of recipes
> >> +# TODO: Add support for selecting which qemu architectures to build
> >> +# TODO: Add support for queueing up multiple recipe builds
> >> +# TODO: Add more logging options (e.g. local.conf info, bitbake env info)
> >> +
> >> +usage ()
> >> +{
> >> +    base=$(basename "$0")
> >> +    echo "Usage: $base [options] [recipename/target]"
> >> +    echo "Executes a build of a given target for selected LIBCs. With no options, default to both libc and musl."
> >> +    echo "Options:"
> >> +    echo "-l, --libc            Specify one of \"libc\" or \"musl\""
> >> +}
> >> +
> >> +
> >> +buildall ()
> >> +{
> >> +    # Get path to oe-core directory. Since oe-init-build-env prepends $PATH with
> >> +    # the path to the scripts directory, get it from there
> >> +    SCRIPTS_PATH="$(echo "$PATH" | cut -d ":" -f 1)"
> >> +    OE_CORE_PATH=$(echo "$SCRIPTS_PATH" | sed 's|\(.*\)/.*|\1|')
> >> +
> >> +    # Get target list and host machine information
> >> +    TARGET_LIST=$(find "$OE_CORE_PATH"/meta/conf/machine -maxdepth 1 -type f | grep qemu | sed 's|.*/||' | sed -e 's/\.conf//')
> >> +
> >> +    # Set LIBC value to use for the builds based on options provided by the user
> >> +    if [ -n "$2" ]
> >> +    then
> >> +       LIBC_LIST="$2"
> >> +       echo "$LIBC_LIST"
> >> +    else
> >> +       LIBC_LIST="glibc musl"
> >> +       echo "$LIBC_LIST"
> >> +    fi
> >> +
> >> +    START_TIME=$(date "+%Y-%m-%d_%H:%M:%S")
> >> +    LOG_FILE="$1-buildall.log"
> >> +    OS_INFO=$(grep "PRETTY_NAME=" /etc/os-release | awk -F "=" '{print $2}' | sed -e 's/^"//' -e 's/"$//')
> >> +
> >> +    # Append an existing log file for this build with .old if one exists
> >> +    if [ -f "${LOG_FILE}" ]
> >> +    then
> >> +       mv "${LOG_FILE}" "${LOG_FILE}.old"
> >> +    else
> >> +          touch "${LOG_FILE}"
> >> +    fi
> >> +
> >> +    # Fill the log file with build and host info
> >> +    echo "BITBAKE-BUILDALL LOG FOR $1" >> "${LOG_FILE}"
> >> +    echo "START TIME: ${START_TIME}" >> "${LOG_FILE}"
> >> +    echo "HOSTNAME: $(uname -n)" >> "${LOG_FILE}"
> >> +    echo "HOST OS: ${OS_INFO}" >> "${LOG_FILE}"
> >> +    echo "HOST KERNEL: $(uname -r)" >> "${LOG_FILE}"
> >> +    echo "===============" >> "${LOG_FILE}"
> >> +    echo "BUILD RESULTS:" >> "${LOG_FILE}"
> >> +
> >> +    # start the builds for each MACHINE and TCLIBC
> >> +    for j in ${LIBC_LIST}
> >> +    do
> >> +       echo "[$j]" >> "${LOG_FILE}"
> >> +       for i in ${TARGET_LIST}
> >> +       do
> >> +           echo "$i" "$j"; \
> >> +           TCLIBC=$j MACHINE=$i bitbake "$1" && echo "PASS: $i" >> "${LOG_FILE}" || echo "FAIL: $i" >> "${LOG_FILE}"
> >> +       done
> >> +    done
> >> +
> >> +    # Get pass/fail totals and add them to the end of the log
> >> +    PASSED=$(grep "PASS:" "${LOG_FILE}" | wc -l)
> >> +    FAILED=$(grep "FAIL:" "${LOG_FILE}" | wc -l)
> >> +
> >> +    echo "===============" >> "${LOG_FILE}"
> >> +    echo "PASSED: ${PASSED}" >> "${LOG_FILE}"
> >> +    echo "FAILED: ${FAILED}" >> "${LOG_FILE}"
> >> +}
> >> +
> >> +
> >> +# fail entire script if any command fails
> >> +set -e
> >> +
> >> +# print usage and exit if not enough args given
> >> +[ $# -eq 0 ] && usage && exit 1
> >> +
> >> +# handle arguments
> >> +RECIPE=
> >> +while [ $# -gt 0 ]
> >> +do
> >> +    arg=$1
> >> +    case $arg in
> >> +       -l|--libc)
> >> +       if [ "$2" = "glibc" ] || [ "$2" = "musl" ]
> >> +       then
> >> +           LIBC_LIST="$2"
> >> +       else
> >> +           echo "Unrecognized libc option."
> >> +           usage && exit 1
> >> +       fi
> >> +       shift
> >> +       shift
> >> +       ;;
> >> +       *)
> >> +        RECIPE="$1"
> >> +       shift
> >> +       ;;
> >> +    esac
> >> +done
> >> +
> >> +set -- "$RECIPE"
> >> +
> >> +# run buildall for the given recipe and LIBC
> >> +if [ -n "$1" ]
> >> +then
> >> +       buildall "$1" "$LIBC_LIST"
> >> +fi
> >> +
> >> --
> >> 2.24.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core


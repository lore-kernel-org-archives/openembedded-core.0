Return-Path: <armccurdy@gmail.com>
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
	[209.85.221.171])
	by mail.openembedded.org (Postfix) with ESMTP id 730317CF3B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Mar 2019 00:01:01 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id b6so4985613vkf.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2019 16:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SUuPrmezNhRKQ8QCaidhK/DDXvlvvewsmXUPVJ1u4vE=;
	b=rjW24jbDGwzKLJjMBHu/iWO4DQ2LC/YUfAjHV7JIgJ7lhNqi7gfZ6biQWS982rAqoC
	jLx1GV7eXLeIyXHXdxvhQU0zOvyMYK25A+8eg4X87uK4qDXD2oja+EuetErlce9LUUGj
	Sw0z+qT+mOIsjlt/xtisfkHY11HbdBjrKqTA0E9uSKilLO/inbBr5Bx5YoCh0M6OFu0U
	haiiYxwaEcme6KyRfC4IJr5113AhZVwMDv55h50ndvWEtYvqZg9X8Mrg4TkBDzCAyFER
	Wtoxx9BHbD0LBLieA6EF/781YHuHWoWQxc/ZGcgzrpY1ddhIXC21/5gmvi9gm956kkQP
	y84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SUuPrmezNhRKQ8QCaidhK/DDXvlvvewsmXUPVJ1u4vE=;
	b=fx//EciLdPctCpoePdWT3hIBB+SBD1hu0avFTddhhSO5EB7JMEAiYZNYELizeL3IxH
	joVN0Jqy4vhlEqTwpQQcfEVuh5IwBUdIBXQ+sijQeVv/kV97ylz7DNLS07IXw8thvzFb
	JKbUEMhQzAqlXmBb2Ihk1gpfVz/7mDwz2iXJcK5l4GNRZ3YZp/WJeZJYsyUHfCMzzQru
	0rDMJmLdQw+n/VMDbXPRX4VhPmAbX0vrwKaT/1NPmpJ0VjWS1+cXB7g3dXxvq6AbDjig
	UbPd4lFCzizj0VRJjV9z35xOxY6TeBjVmU2ZnxcEKNFcKY4m3oSfd5rseWncMUPl+567
	aq4g==
X-Gm-Message-State: APjAAAVVbpzJvATE9w2tM6kjc2nIHi6+O/rRd1W3VVYt5pf6XMhcIOAn
	AXjnJ/PTkasCQu0DOQP7Pc0MPW0GRXMmfsr5xV0xwlqa
X-Google-Smtp-Source: APXvYqypXLnsT2aEqyl1+tC/+LDwRHLkRcqf+PYPVUx0GBcUztxNAqTufPps+cYyBmGrBpj8z+oVtyyl6ZoAoyTtkRA=
X-Received: by 2002:a1f:c00f:: with SMTP id q15mr11294477vkf.10.1552089662046; 
	Fri, 08 Mar 2019 16:01:02 -0800 (PST)
MIME-Version: 1.0
References: <1552063426-25272-1-git-send-email-bassem.boubaker@actia.fr>
In-Reply-To: <1552063426-25272-1-git-send-email-bassem.boubaker@actia.fr>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 8 Mar 2019 16:00:50 -0800
Message-ID: <CAJ86T=WNSoY4rHiLoUcP9_4vYwXxrCwaCxLosibf_pCEYQfpvA@mail.gmail.com>
To: BOUBAKER Bassem <bassem.boubaker@actia.fr>
Cc: SAMMOUDA Ahmed <ahmed.sammouda@actia.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cpulimit: introduce support for this package
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
X-List-Received-Date: Sat, 09 Mar 2019 00:01:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 8, 2019 at 3:24 PM BOUBAKER Bassem via Openembedded-core
<openembedded-core@lists.openembedded.org> wrote:
>
>     * Now, cpulimit recipe is put under recipes-support. Binary will be installed by the recipe under /usr/sbin
>
>         # cpulimit -h
>         Usage: cpulimit [OPTIONS...] TARGET
>                 OPTIONS
>                 -l, --limit=N          percentage of cpu allowed from 0 to 100 (required)
>                 -v, --verbose          show control statistics
>                 -z, --lazy             exit if there is no target process, or if it dies
>                 -i, --include-children limit also the children processes
>                 -h, --help             display this help and exit
>                 TARGET must be exactly one of these:
>                 -p, --pid=N            pid of the process (implies -z)
>                 -e, --exe=FILE         name of the executable program file or path name
>                 COMMAND [ARGS]         run this command and limit it (implies -z)
>
>                 Report bugs to <marlonx80@hotmail.com>.

A few review comments to address before resubmitting to meta-oe.

> Signed-off-by: Bassem Boubaker <bassem.boubaker@actia.fr>
> ---
>  meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
>
> diff --git a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
> new file mode 100644
> index 0000000..d0c524e
> --- /dev/null
> +++ b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "cpulimit is a tool which limits the CPU usage of a process from bash prespective"

Typo (or two typos?).

> +HOMEPAGE = "http://cpulimit.sourceforge.net/"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=86c1c0d961a437e529db93aa3bb32dc4"
> +
> +PR = "r0"

No need to set PR to its default.

> +SRCREV ?= "f4d2682804931e7aea02a869137344bb5452a3cd"
> +
> +SRC_URI = "git://git@github.com/opsengine/cpulimit.git;protocol=https"
> +
> +SRC_URI[md5sum] = "4f805fe26c8cf28e8251d64d0ace21d4"
> +SRC_URI[sha256sum] = "544516d0d80c685b1df1344a71c900e845270551cf210300fa4d13876e10817a"

No need for SRC_URI hashes when SRC_URI fetches from git.

> +inherit autotools
> +
> +S = "${WORKDIR}/git"

By convention S should be set before "inherit autotools". Try to stick
to the OE Styleguide unless there's a clear reason to deviate.

  http://www.openembedded.org/wiki/Styleguide

> +do_install() {
> +        install -d ${D}${sbindir}
> +        install -m 0755 ${S}/src/${PN} ${D}${sbindir}/

Even though ${S} and ${B} may be the same directory, conceptually it
makes more sense to install binaries from ${B} (ie the build
directory), rather than ${S} (ie the source directory).

> +}
> \ No newline at end of file

Should be fixed.

> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail.openembedded.org (Postfix) with ESMTP id DABFB7CF4C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 23:42:29 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id x9so18156676iog.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2019 15:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9wrnh2RpjNFfY/L6OjtHXzeXNmkFAautBOyaTGDoab4=;
	b=LtTxlUlBvnQrAdtRyb5jxEjtnEU2gkoLJ9vaVlh+iyOC0+35m1y6ejwaYmaVXsJpBg
	MPmDioZaNERw5PNMx/bn2mzNrnJO8wmWuwuGMeb0buDmvbNJkMdmhiAIZcSatmp7nn6i
	ZyrqSVwOTfitPXHPvU4rPR51rp5hNqqqsd9B5lzC2FXgSMTr6d+Ofjg0PUemuHSPFEsx
	hVLvNzhcbIIySbgvDu+zdpCDpwMCJemjWOOod0+jx9WBy0iECuUtodyDRIcxSSGMOgs0
	toWZjDzXL+JKEO7aJArYW+R3i6oDrmby3bR7AorE7wgFNfC1wMBPS0w/+yR0G7CJ8wBM
	6IZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9wrnh2RpjNFfY/L6OjtHXzeXNmkFAautBOyaTGDoab4=;
	b=fHjkvRWEcWRocksnN91KxOpYffeRdQtxiIc0H9frUgyYcDID6FlBjP8Z2TWK8/fmJg
	wmkHks1/KI02GSETJC5zIC5qsjh3uVOYav94h5pFj38YKjEgdxvixAEoZBf5f7PyeaTe
	THliIpaMmcHZYESlLJpBLTjmHrNZ5OWghoV+nTel/anKLLiSIpwi4GnI7FaO1cqq7/Ou
	/GeSwK8hH0OHaWqcmjM1wrv+e28xdUuUL9X1CMLyQdumlXQHdKXMgbf+IPRiqllWs0x7
	oZs4b6WZbIkISskV2iELAVacmoApkaR5yLEKuURtUPLioYFXPWHhf+SaqoBaxauoBA4+
	HMmQ==
X-Gm-Message-State: APjAAAVPjplhhQm0yFrYCZJcNGEoiMfw3BImLrHn3oZI8wdkiRZ2KcuD
	93dnEERuASkN8aWjyH0Q/kWArj9CuY1wx3Lefbd3gA==
X-Google-Smtp-Source: APXvYqzSsxrNlH8sjKZxbAMNb2cFKBbPjZqbzpkGygdWh9qNi2GevnQTKDZpY4xR3mANvK0MUNLU634P2U8M3OkbEVA=
X-Received: by 2002:a5d:848b:: with SMTP id t11mr10017705iom.270.1552088549852;
	Fri, 08 Mar 2019 15:42:29 -0800 (PST)
MIME-Version: 1.0
References: <1552063426-25272-1-git-send-email-bassem.boubaker@actia.fr>
In-Reply-To: <1552063426-25272-1-git-send-email-bassem.boubaker@actia.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Mar 2019 23:42:18 +0000
Message-ID: <CAJTo0LaaErr7-OKin51sON0qjt0xFDO1Qsjb5tU29oD1jyezqw@mail.gmail.com>
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
X-List-Received-Date: Fri, 08 Mar 2019 23:42:30 -0000
Content-Type: text/plain; charset="UTF-8"

Unless there's a great reason to put this into oe-core, I suggest that
it be added to meta-oe instead.

Ross

On Fri, 8 Mar 2019 at 23:24, BOUBAKER Bassem via Openembedded-core
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
>
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
> +HOMEPAGE = "http://cpulimit.sourceforge.net/"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=86c1c0d961a437e529db93aa3bb32dc4"
> +
> +PR = "r0"
> +
> +SRCREV ?= "f4d2682804931e7aea02a869137344bb5452a3cd"
> +
> +SRC_URI = "git://git@github.com/opsengine/cpulimit.git;protocol=https"
> +
> +SRC_URI[md5sum] = "4f805fe26c8cf28e8251d64d0ace21d4"
> +SRC_URI[sha256sum] = "544516d0d80c685b1df1344a71c900e845270551cf210300fa4d13876e10817a"
> +
> +inherit autotools
> +
> +S = "${WORKDIR}/git"
> +
> +do_install() {
> +        install -d ${D}${sbindir}
> +        install -m 0755 ${S}/src/${PN} ${D}${sbindir}/
> +}
> \ No newline at end of file
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


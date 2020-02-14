Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 37A926069A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 06:34:52 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id l21so6279229qtr.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 22:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZBNFUwtWFii0lPSVN9tKd7agGEXtk3Ivao2zcpHjbAo=;
	b=X/83oxGATKW+ccZa3B4Ltxs9v/9yQBNvFBtuNhaVDYIA4J4UDWIpGluGuKZ5SkfJ/D
	ypmiMB9g7H7XRGcu0Zzh3d3qWkBU4ltlikF9d+pnSS1iAMrOXESktkEm7slOReHIlGnS
	8u+on0iIRv0cWvz1APF7qeMvrjyHae+inaLx2nVzTdvrEL+caBOALI/UjPFMsd4ozI8R
	LysYS/sbj5Y/4cY5YGeyJajMrBAmb3jtSx4Y+sfuFb+EMhLvK9U6+wLduw+STiAAnnN0
	MbHjNtXA1NOofX6SgIMchV8CllCf8VdC94icp2omf3ICWRtOgid/U10BtCSFrlkiNt5k
	3tLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZBNFUwtWFii0lPSVN9tKd7agGEXtk3Ivao2zcpHjbAo=;
	b=U1a1Zb8iWzoK+lZzON8UfO266LI0gAUEEUeou9YW2Xg0EnUJ188j3LnRwyHtF4goUJ
	kfQT+XXjFlNuv9nnz6o2Vn9+W5ll4sr8pCOCe48D5JiSMzpLToWh4ODBoRSHMQoV3psC
	mLNiao8GhN96RtyRYpGD5xswBqTE8boSk2z4Nu6yivvf8WFGw4eZX0l0JkUI7fFVbUUG
	zvvhLR4DrsjeHV/TDQm/MazfXQniYT+4I2zPJ5Skx26XfmqR2J0ovVE7qleq+otjLuN8
	lqdxHY+c3X+5b1N8Hj6OFMGORjArjLVcewdhs+Q4AKoAKhMwQNv+E1Md/ZD1cBAKNV6y
	QfJQ==
X-Gm-Message-State: APjAAAUAQLwoge5Oz+vXYYOSLrr56avBeTZbjgaz2b9WJZ80448IDB5s
	sENlGJsJ452FlOwWx6oFVCO6No8wtIEEik4Hz8I=
X-Google-Smtp-Source: APXvYqxSWFd00YSWEoMud1tPx4LW0Q3yaYQXvXo1rLLPxklRc8zbT5tm4QZjBwTwZJtjOkkrTMI73Qma4387UWPNY68=
X-Received: by 2002:ac8:4419:: with SMTP id j25mr1371922qtn.378.1581662093348; 
	Thu, 13 Feb 2020 22:34:53 -0800 (PST)
MIME-Version: 1.0
References: <20200212031435.792802-1-JPEWhacker@gmail.com>
	<20200212031435.792802-4-JPEWhacker@gmail.com>
In-Reply-To: <20200212031435.792802-4-JPEWhacker@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Feb 2020 22:34:27 -0800
Message-ID: <CAMKF1srqz+B9YEHCvMcsZRiWa5AvjD7H-ef7pQjd8baWsHWNAQ@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] recipes-support: Add diffoscope recipe
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
X-List-Received-Date: Fri, 14 Feb 2020 06:34:53 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Joshua

I think it needs to be ignored on musl

15:37:23 ERROR: Nothing RPROVIDES 'squashfs-tools' (but
/mnt/jenkins/workspace/Yocto-world-musl/sources/openembedded-core/meta/recipes-support/diffoscope/diffoscope_136.bb
RDEPENDS on or otherwise requires it)
15:37:23 squashfs-tools was skipped: incompatible with host
aarch64-yoe-linux-musl (not in COMPATIBLE_HOST)

On Tue, Feb 11, 2020 at 7:15 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> Diffoscope is the universal diff tool, capable of comparing many
> different formats.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc          |  1 +
>  meta/recipes-support/diffoscope/diffoscope_136.bb | 15 +++++++++++++++
>  2 files changed, 16 insertions(+)
>  create mode 100644 meta/recipes-support/diffoscope/diffoscope_136.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 171a43615e3..4a267faabce 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -146,6 +146,7 @@ RECIPE_MAINTAINER_pn-dejagnu = "Nathan Rossi <nathan@nathanrossi.com>"
>  RECIPE_MAINTAINER_pn-depmodwrapper-cross = "Mark Hatle <mark.hatle@windriver.com>"
>  RECIPE_MAINTAINER_pn-desktop-file-utils = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-dhcp = "Hongxu Jia <hongxu.jia@windriver.com>"
> +RECIPE_MAINTAINER_pn-diffoscope = "Joshua Watt <JPEWhacker@gmail.com>"
>  RECIPE_MAINTAINER_pn-diffstat = "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER_pn-diffutils = "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER_pn-distcc = "Hongxu Jia <hongxu.jia@windriver.com>"
> diff --git a/meta/recipes-support/diffoscope/diffoscope_136.bb b/meta/recipes-support/diffoscope/diffoscope_136.bb
> new file mode 100644
> index 00000000000..a00f281deb0
> --- /dev/null
> +++ b/meta/recipes-support/diffoscope/diffoscope_136.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "in-depth comparison of files, archives, and directories"
> +HOMEPAGE = "https://diffoscope.org/"
> +LICENSE = "GPL-3.0+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +PYPI_PACKAGE = "diffoscope"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "c84d8d308a40176ba2f5dc4abdbf6f73"
> +SRC_URI[sha256sum] = "0d6486d6eb6e0445ba21fee2e8bdd3a366ce786bfac98e00e5a95038b7815f15"
> +
> +RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
> +
> +BBCLASSEXTEND = "native"
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


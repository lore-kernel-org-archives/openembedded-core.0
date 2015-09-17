Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 95210766A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 13:30:30 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 22C2EF81199; Thu, 17 Sep 2015 07:30:29 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 50D16F81199;
	Thu, 17 Sep 2015 07:30:29 -0600 (MDT)
To: openembedded-core@lists.openembedded.org
References: <1442496086-1994-1-git-send-email-otavio@ossystems.com.br>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <55FAC07A.3000907@mlbassoc.com>
Date: Thu, 17 Sep 2015 07:30:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1442496086-1994-1-git-send-email-otavio@ossystems.com.br>
Subject: Re: [PATCH v2] Rename 'BRANCH' variable to 'SRCBRANCH' for clearness
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
X-List-Received-Date: Thu, 17 Sep 2015 13:30:31 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-09-17 07:21, Otavio Salvador wrote:
> The 'BRANCH' variable name has no explicit relation with the
> SRC_URI. Using 'SRCBRANCH' makes it more obvious and easier to
> identify.
>
> This patch makes the use consistent across the metadata.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

These should be separated into one for glibc and another for mmc.
Also, the subject line needs to mention the recipe name based on
the commit guidelines.

> ---
>
> Changes in v2:
> - Use SRCBRANCH instead of SRC_BRANCH (Khem)
>
>   meta/recipes-core/glibc/cross-localedef-native_2.22.bb | 4 ++--
>   meta/recipes-core/glibc/glibc_2.22.bb                  | 4 ++--
>   meta/recipes-devtools/mmc/mmc-utils_git.bb             | 4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.22.bb b/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
> index 2153ece..03be9c0 100644
> --- a/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
> +++ b/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
> @@ -14,10 +14,10 @@ inherit autotools
>
>   FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glibc:"
>
> -BRANCH ?= "release/${PV}/master"
> +SRCBRANCH ?= "release/${PV}/master"
>   GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>
> -SRC_URI = "${GLIBC_GIT_URI};branch=${BRANCH};name=glibc \
> +SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>              git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef \
>              file://fix_for_centos_5.8.patch \
>              ${EGLIBCPATCHES} \
> diff --git a/meta/recipes-core/glibc/glibc_2.22.bb b/meta/recipes-core/glibc/glibc_2.22.bb
> index f0e1fad..09df3f6 100644
> --- a/meta/recipes-core/glibc/glibc_2.22.bb
> +++ b/meta/recipes-core/glibc/glibc_2.22.bb
> @@ -9,11 +9,11 @@ DEPENDS += "gperf-native kconfig-frontends-native"
>
>   SRCREV ?= "a34d1c6afc86521d6ad17662a3b5362d8481514c"
>
> -BRANCH ?= "release/${PV}/master"
> +SRCBRANCH ?= "release/${PV}/master"
>
>   GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>
> -SRC_URI = "${GLIBC_GIT_URI};branch=${BRANCH};name=glibc \
> +SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>              file://0004-Backport-https-sourceware.org-ml-libc-ports-2007-12-.patch \
>              file://0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch \
>              file://0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
> diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
> index 8950360..546f7f2 100644
> --- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
> +++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
> @@ -3,12 +3,12 @@ HOMEPAGE = "http://git.kernel.org/cgit/linux/kernel/git/cjb/mmc-utils.git/"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=17;md5=d7747fc87f1eb22b946ef819969503f0"
>
> -BRANCH ?= "master"
> +SRCBRANCH ?= "master"
>   SRCREV = "f4eb241519f8d500ce6068a70d2389be39ac5189"
>
>   PV = "0.1"
>
> -SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${BRANCH} \
> +SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH} \
>              file://0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch"
>
>   S = "${WORKDIR}/git"
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


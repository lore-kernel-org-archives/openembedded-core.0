Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Rcca2-0006nG-D4
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 13:44:34 +0100
Received: (qmail invoked by alias); 19 Dec 2011 12:37:31 -0000
Received: from ip-95-222-156-232.unitymediagroup.de (EHLO
	zera-git-ew.localnet) [95.222.156.232]
	by mail.gmx.net (mp072) with SMTP; 19 Dec 2011 13:37:31 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/ITs9/pjPIElTBTIq9I0QiUXFMxQmr+DA9hngRyn
	kX+GYVlatdOd4c
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2011 13:37:38 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.41.4-1.fc15.x86_64; KDE/4.6.5; x86_64; ; )
References: <20111219093447.C6DBE10331@opal>
In-Reply-To: <20111219093447.C6DBE10331@opal>
MIME-Version: 1.0
Message-Id: <201112191337.39289.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [oe-commits] Scott Garman : Add missing SUMMARY fields to various recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Dec 2011 12:44:34 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, December 19, 2011 10:34:47 AM git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: e8c194a627e091ef9da3b7fa83ea3897bd283d9e
> URL:   
> http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=e8c194a627
> e091ef9da3b7fa83ea3897bd283d9e
> 
> Author: Scott Garman <scott.a.garman@intel.com>
> Date:   Sun Dec 18 15:06:57 2011 -0800
> 
> Add missing SUMMARY fields to various recipes
> 
> This adds the SUMMARY field to the following recipes which were
> missing it:
> 
> * dosfstools
> * grep
> * icu
> * libevent
> * libnfsidmap
> * qemu-helper-nativesdk
> 
> Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> ---
> 
>  .../nfs-utils/libnfsidmap_0.24.bb                  |    3 ++-
>  .../recipes-devtools/dosfstools/dosfstools_2.11.bb |    2 +-
>  .../qemu/qemu-helper-nativesdk_1.0.bb              |    3 ++-
>  meta/recipes-extended/grep/grep_2.9.bb             |    1 +
>  meta/recipes-support/icu/icu-3.6.inc               |    1 +
>  meta/recipes-support/libevent/libevent_1.4.14b.bb  |    3 ++-
>  6 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
> b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb index
> 101ecab..eff75ec 100644
> --- a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
> +++ b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
> @@ -1,4 +1,5 @@
> -DESCRIPTION = "nfs idmapping library"
> +SUMMARY = "NFS id mapping library"
> +DESCRIPTION = "NFS id mapping library"
>  HOMEPAGE = "http://www.citi.umich.edu/projects/nfsv4/linux/"
>  SECTION = "libs"
> 
> diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
> b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb index
> ec75ac9..eca54f1 100644
> --- a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
> +++ b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
> @@ -1,7 +1,7 @@
>  # dosfstools OE build file
>  # Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights
> Reserved # Released under the MIT license (see packages/COPYING)
> -
> +SUMMARY = "DOS FAT Filesystem Utilities"
>  DESCRIPTION = "DOS FAT Filesystem Utilities"
> 
>  SECTION = "base"
> diff --git a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
> b/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb index
> a3dca3d..df0cae0 100644
> --- a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
> @@ -1,4 +1,5 @@
> -DESCRIPTION = "Qemu helper scripts from Poky"
> +SUMMARY = "Qemu helper scripts"
> +DESCRIPTION = "Qemu helper scripts"
>  LICENSE = "GPLv2"
>  RDEPENDS_${PN} = "qemu-nativesdk"
>  PR = "r9"
> diff --git a/meta/recipes-extended/grep/grep_2.9.bb
> b/meta/recipes-extended/grep/grep_2.9.bb index 08ac527..9099bed 100644
> --- a/meta/recipes-extended/grep/grep_2.9.bb
> +++ b/meta/recipes-extended/grep/grep_2.9.bb
> @@ -1,3 +1,4 @@
> +SUMMARY = "GNU grep utility"
>  DESCRIPTION = "GNU grep utility"
>  HOMEPAGE = "http://savannah.gnu.org/projects/grep/"
>  BUGTRACKER = "http://savannah.gnu.org/bugs/?group=grep"
> diff --git a/meta/recipes-support/icu/icu-3.6.inc
> b/meta/recipes-support/icu/icu-3.6.inc index 8fadc92..e3f9dd2 100644
> --- a/meta/recipes-support/icu/icu-3.6.inc
> +++ b/meta/recipes-support/icu/icu-3.6.inc
> @@ -1,3 +1,4 @@
> +SUMMARY = "International Component for Unicode libraries"
>  DESCRIPTION = "The International Component for Unicode (ICU) is a mature,
> portable set of C/C++ and Java libraries for Unicode support, software
> internationalization (I18N) and globalization (G11N), giving applications
> the same results on all platforms." HOMEPAGE =
> "http://www-01.ibm.com/software/globalization/icu/index.jsp"
> 
> diff --git a/meta/recipes-support/libevent/libevent_1.4.14b.bb
> b/meta/recipes-support/libevent/libevent_1.4.14b.bb index 1a369b5..36468dc
> 100644
> --- a/meta/recipes-support/libevent/libevent_1.4.14b.bb
> +++ b/meta/recipes-support/libevent/libevent_1.4.14b.bb
> @@ -1,4 +1,5 @@
> -DESCRIPTION = "an asynchronous event notification library"
> +SUMMARY = "An asynchronous event notification library"
> +DESCRIPTION = "An asynchronous event notification library"
>  HOMEPAGE = "http://www.monkey.org/~provos/libevent/"
>  SECTION = "libs"
Sorry I sent it to the wrong list so now again:

What is the value - apart HOB's sake - in creating redundancies by copying 
DESRCIPTION to SUMMARY? Why not use DESCRIPTION?

Andreas



Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8F08C74581
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 11:53:13 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id f1-v6so7247499ioh.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 04:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1IJxsj28Q6SGKvV0qBjtlpQU0UQS3d4EUyaGkQxIhNU=;
	b=ehLUwfuorgvFNr3ETJMOy50MmHrpHL+OR4fou1L1yMpTWbrKScCX/bZq2+C8yGS7L0
	nVog1C8nsKTzfanfS5JhKotxyJ8ZFPhFfppir8msDMZylfwFKyyhkkNh0FVeVPjjatZP
	DUV/yab9nLRPrzt36GAuvwaU0hR/PyHneqtaD9tOGnD/YOlRNj8vrDkHMY7yj3MmwceB
	OvUexQJ9a7tElIXVwjd85At3qIBXIk1g+gbABbUrrNdGLGBaKhvQlZZLdX0l27seH5CS
	8gXGN4AKDG0GcpplQYG6wc8y2tvQg3L7aVKF/cHhFjbScY30iXIQ/5h6jTEGx4sTrQTs
	dKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1IJxsj28Q6SGKvV0qBjtlpQU0UQS3d4EUyaGkQxIhNU=;
	b=P0WSFXHfsFe8Ez2PIYd4SLRrdyYez6KPu9dsW55KXflFlkR/1fbpy9JcngSAru5pCo
	wTOVcJ+joTPtAPjTaSHxk8qMh1BjFbk4CKydv9cr8AvVyn7ZPf4eaU6rUbyqlAGE6+Fy
	rOUNcze8NB+8KAfm3UMlRibmU1AWjbXQlKO5Z51IVcavSByry0s0MsgnZZJ8EdrCWDMT
	ge1WCdxreut79Ox80cGOK/yOGXJIAfnTPBvAzeZkKm/LNHSFysNVvRRaP4SHX22ealdn
	hoC6DotzTmXhNTbeU3T7GjdcQoK9kr1UnbSRh/saehTgIWaZyHRup1b7FFyHRhxen+bV
	vJAw==
X-Gm-Message-State: APt69E1J9/12IytMPTnXSroCAwy6zGHJ+FRr3FeXdKKiTz+/c9CiVI+3
	OFpUVoHcfFgLIocKIrqMdqw4MSf2KTnLLPAJZRwLhA==
X-Google-Smtp-Source: ADUXVKINBVWMRY/vPdcrqLsNnC0dnG4dU+cRUGbZray7UbEv41RzN40D7Y4dQcDAmqUnlJPrpAZXzVfQssICdDVCozA=
X-Received: by 2002:a6b:2401:: with SMTP id
	k1-v6mr2368287iok.270.1528285994469; 
	Wed, 06 Jun 2018 04:53:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:f614:0:0:0:0:0 with HTTP;
	Wed, 6 Jun 2018 04:52:54 -0700 (PDT)
In-Reply-To: <fe59b86a518304bd3aeba3c066280a2ab8887ca1.1528252931.git.liezhi.yang@windriver.com>
References: <cover.1528252931.git.liezhi.yang@windriver.com>
	<fe59b86a518304bd3aeba3c066280a2ab8887ca1.1528252931.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 6 Jun 2018 12:52:54 +0100
Message-ID: <CAJTo0Lb4O3nuCZ6X1gu8yUnfXZK0Ty+sX6YxFb_fhvA-2_GXfA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 02/11] lsof: fix LSOF_CCV in version.h
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
X-List-Received-Date: Wed, 06 Jun 2018 11:53:13 -0000
Content-Type: text/plain; charset="UTF-8"

I really wish I didn't look at the lsof recipe...

To my reading if you pass LSOF_CC in do_configure (as you do in this
patch) then we don't need to patch Configure to move the LSOF_CCV
assignment at all, and can also drop the CC=${CC} from do_compile.

(I'm now going to scoop up the brain that oozed out of my ears off the floor)

Ross

On 6 June 2018 at 03:54, Robert Yang <liezhi.yang@windriver.com> wrote:
> From: Jian Liu <jian.liu@windriver.com>
>
> When using cross compiler to build the package "lsof" on a host,
> the value of LSOF_CCV in version.h genegrated by the Makefile
> is the version of the compiler on the host while it should be
> the version of cross compiler.
>
> On Ubuntu host before fixed:
>   #define LSOF_CCV        "4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5) "
>
> After fixed:
>   #define   LSOF_CCV        "4.9.1 (GCC) "
>
> Signed-off-by: Jian Liu <jian.liu@windriver.com>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  .../files/Configure-fix-LSOF_CCV-assignment.patch  | 42 ++++++++++++++++++++++
>  meta/recipes-extended/lsof/lsof_4.89.bb            |  4 ++-
>  2 files changed, 45 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/lsof/files/Configure-fix-LSOF_CCV-assignment.patch
>
> diff --git a/meta/recipes-extended/lsof/files/Configure-fix-LSOF_CCV-assignment.patch b/meta/recipes-extended/lsof/files/Configure-fix-LSOF_CCV-assignment.patch
> new file mode 100644
> index 0000000..17c5c4b
> --- /dev/null
> +++ b/meta/recipes-extended/lsof/files/Configure-fix-LSOF_CCV-assignment.patch
> @@ -0,0 +1,42 @@
> +From c197389c9d8ccdbfcfe1dc31da6b4ce69b90ecf6 Mon Sep 17 00:00:00 2001
> +From: Wenzong Fan <wenzong.fan@windriver.com>
> +Date: Thu, 23 Oct 2014 03:43:27 -0400
> +Subject: [PATCH] Configure: fix LSOF_CCV assignment
> +
> +When using cross compiler to build the package "lsof" on a host,
> +the value of LSOF_CCV in version.h genegrated by the Makefile
> +is the version of the compiler on the host while it should be
> +the version of cross compiler.
> +
> +On Ubuntu host before fixed:
> +  #define LSOF_CCV        "4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5) "
> +
> +After fixed:
> +  #define   LSOF_CCV        "4.9.1 (GCC) "
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +
> +---
> + Configure |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Configure b/Configure
> +index 29c1292..e5a199f 100755
> +--- a/Configure
> ++++ b/Configure
> +@@ -2705,8 +2705,8 @@ LOCKF_OWNER4
> +     if test "X$LSOF_CC" = "X" # {
> +     then
> +       LSOF_CC=cc
> +-      LSOF_CCV=`$LSOF_CC -v 2>&1 | sed -n 's/.*version \(.*\)/\1/p'`
> +     fi        # }
> ++    LSOF_CCV=`$LSOF_CC -v 2>&1 | sed -n 's/.*version \(.*\)/\1/p'`
> +     if test "X$LINUX_CONF_CC" = "X"   # {
> +     then
> +       LINUX_CONF_CC=$LSOF_CC
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-extended/lsof/lsof_4.89.bb b/meta/recipes-extended/lsof/lsof_4.89.bb
> index 14546db..52b40dc 100644
> --- a/meta/recipes-extended/lsof/lsof_4.89.bb
> +++ b/meta/recipes-extended/lsof/lsof_4.89.bb
> @@ -13,7 +13,8 @@ LIC_FILES_CHKSUM = "file://00README;beginline=645;endline=679;md5=964df275d26429
>
>  SRC_URI = "http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2 \
>             file://lsof-remove-host-information.patch \
> -          "
> +           file://Configure-fix-LSOF_CCV-assignment.patch \
> +"
>
>  SRC_URI[md5sum] = "1b9cd34f3fb86856a125abbf2be3a386"
>  SRC_URI[sha256sum] = "81ac2fc5fdc944793baf41a14002b6deb5a29096b387744e28f8c30a360a3718"
> @@ -40,6 +41,7 @@ python do_unpack () {
>  export LSOF_INCLUDE = "${STAGING_INCDIR}"
>
>  do_configure () {
> +       export LSOF_CC="${CC}"
>         export LSOF_AR="${AR} cr"
>         export LSOF_RANLIB="${RANLIB}"
>         if [ "x${GLIBCVERSION}" != "x" ]; then
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


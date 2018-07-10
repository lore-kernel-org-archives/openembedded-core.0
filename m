Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id C8054755B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 09:45:55 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id i12-v6so41423768oik.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 02:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QH6SWO+KKVfNV8gaH5fd4nRdb48eOHkJ0a44NtNzh+E=;
	b=en1567HfEBEtsGeR6puTTJfyUXImqMmsfc4o2P0GB+OEiRPPPZpkSVxp8jwbPFztMI
	hm7/1QAWReDbFGlK7BHPpVXNS1yO59rHNRbdFoz4oN4R7OPatuwmCpfVu4pA5cSyD1/x
	LniGrt8gvTZDhnhXuAW0qaastRwGdwZvPPjqaW3z77HG0LpNu5MhcSOcU4VqLDtExMi2
	i3UcptKXtnNhdsSRy+47OzO7nb0YswWvvLz0QwFuMzpc8xysfoNT5SqjWI6tLKhwyLmS
	sZlUVS1oG9XA3w4uMGI86b+/bdNkgIp2N/9bNsD+QYNltyv1LQXOFrzn6YpgkxJh3SGb
	CLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QH6SWO+KKVfNV8gaH5fd4nRdb48eOHkJ0a44NtNzh+E=;
	b=SkOEwM/SWwY+75QHuEEFUmmYnZ7crRF9a/puZ+GeyINj00YrYVz5R5qBICRGCprlAD
	kDwkf5Y+wF4asdNtkkTQ0f8BBsg91onjqVbHaLykWDjznus91tel+Y8TbjubnwtHAIZN
	npCKXJA6Rvcxdht8SzcCmYL+KOqenJsNi4Wyn4oVhd0BRLaCF0THdg6LtgJzaTXXB23u
	G0tAzyp2CJtz1Jy01L5goZ68dG6A0Am8CkJMcJHwy8L0haS/5VPAoGCe7mTr460vSgr4
	lduZms+ClZKRrBsKC7l14BSm8btoZ47uu0WMITImQTkACIv/E/t3djHB//OS1GlZn1kH
	5e+A==
X-Gm-Message-State: APt69E0nC7lddDNFwPhi+RMxSs/In9sbk9snhmKYgNohOnTq1uuubna1
	31G8SoxcyXzLkQtKWtDLlx5EYxVUdv7femqUrm4GNQ==
X-Google-Smtp-Source: AAOMgpcCI6hCjH/mW4vuqGCTUKygFqcjlEZWMTDVIiMiPrsHPfJeW1lPWgXPdO6DEY7TSfYa5rqnSwegqR5Lv/+eZ3Y=
X-Received: by 2002:aca:efd7:: with SMTP id
	n206-v6mr28925790oih.70.1531215956692; 
	Tue, 10 Jul 2018 02:45:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Tue, 10 Jul 2018 02:45:36
	-0700 (PDT)
In-Reply-To: <20180710024207.6296-2-hongl.fnst@cn.fujitsu.com>
References: <20180710024207.6296-1-hongl.fnst@cn.fujitsu.com>
	<20180710024207.6296-2-hongl.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Jul 2018 10:45:36 +0100
Message-ID: <CAJTo0Lbqg9bcSo9XkwGibEZhjz0rS5t0b2sXje4y6HDC8eFMxg@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] file:5.32 -> 5.33
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
X-List-Received-Date: Tue, 10 Jul 2018 09:45:55 -0000
Content-Type: text/plain; charset="UTF-8"

This has been already submitted, and the usage patch should be dropped
instead of rebased.

Ross

On 10 July 2018 at 03:42, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> Upgrade file from 5.32 to 5.33
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../file/file/0001-Add-P-prompt-into-Usage-info.patch      | 14 ++++++++------
>  meta/recipes-devtools/file/{file_5.32.bb => file_5.33.bb}  |  2 +-
>  2 files changed, 9 insertions(+), 7 deletions(-)
>  rename meta/recipes-devtools/file/{file_5.32.bb => file_5.33.bb} (96%)
>
> diff --git a/meta/recipes-devtools/file/file/0001-Add-P-prompt-into-Usage-info.patch b/meta/recipes-devtools/file/file/0001-Add-P-prompt-into-Usage-info.patch
> index 8a16b2c..0d12d86 100644
> --- a/meta/recipes-devtools/file/file/0001-Add-P-prompt-into-Usage-info.patch
> +++ b/meta/recipes-devtools/file/file/0001-Add-P-prompt-into-Usage-info.patch
> @@ -23,16 +23,18 @@ diff --git a/src/file.c b/src/file.c
>  index 2b15e21..e5a957b 100644
>  --- a/src/file.c
>  +++ b/src/file.c
> -@@ -76,8 +76,8 @@ int getopt_long(int argc, char * const *argv, const char *optstring, const struc
> +@@ -87,9 +87,8 @@ int getopt_long(int, char * const *, const char *,
> +
>   # define USAGE  \
> -     "Usage: %s [" FILE_FLAGS \
> -       "] [--apple] [--extension] [--mime-encoding] [--mime-type]\n" \
> --    "            [-e testname] [-F separator] [-f namefile] [-m magicfiles] " \
> --    "file ...\n" \
> +     "Usage: %s [-" FILE_FLAGS "] [--apple] [--extension] [--mime-encoding]\n" \
> +-    "            [--mime-type] [-e <testname>] [-F <separator>] " \
> +-    " [-f <namefile>]\n" \
> +-    "            [-m <magicfiles>] [-P <parameter=value>] <file> ...\n" \
>  +    "            [-e testname] [-F separator] [-f namefile] [-m magicfiles]\n " \
>  +    "            [-P parameter=limits] file ...\n" \
> -     "       %s -C [-m magicfiles]\n" \
> +     "       %s -C [-m <magicfiles>]\n" \
>       "       %s [--help]\n"
> +
>
>  --
>  1.8.3.4
> diff --git a/meta/recipes-devtools/file/file_5.32.bb b/meta/recipes-devtools/file/file_5.33.bb
> similarity index 96%
> rename from meta/recipes-devtools/file/file_5.32.bb
> rename to meta/recipes-devtools/file/file_5.33.bb
> index 5e15925..c1688ff 100644
> --- a/meta/recipes-devtools/file/file_5.32.bb
> +++ b/meta/recipes-devtools/file/file_5.33.bb
> @@ -19,7 +19,7 @@ SRC_URI = "git://github.com/file/file.git \
>          file://0001-Add-P-prompt-into-Usage-info.patch \
>          "
>
> -SRCREV = "d474e35513940dbca039b510b4de705b44f5bd9c"
> +SRCREV = "d14511987263ae3c6f5ad28ed7b81c26afdb422c"
>  S = "${WORKDIR}/git"
>
>  inherit autotools
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 749D67DE93
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 03:23:38 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d4so9419928qkc.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 20:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=+baF+RruryGu4v6O0scaBHHbEUHhglCNCdY3NsYjcbA=;
	b=hS4niIl/kAsMWPPB43WlREEOJNsJcAiR/SqQRdpbTIIPuu3nBRNQM+ps90DOyH4Ss9
	SnqnHz+/DTSBuPtOrmrec1Hex2XEBrqvCutQfmfiacV33S0bGfyCn4xLRgLlxUgAxxgf
	u8+cKFoa7XlXinc6qfQwrQ+zgQ4nAQzclhyVYz8T7HwaYE8Tfc1dpKp3pJf9ObQHLpGV
	VzWvEWaOff2QkAemkrI3wZy2NqqbFGcFQnphTkU/pbOz4OzwErUgu1l4PoVWaOh0XYkL
	IMiPnLmi/N6Ou6V12dtK0+h9xyTtFNp87KEU+CsNExVhBpFnvnZTt3n/QyQeBHP3A7kK
	8Wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=+baF+RruryGu4v6O0scaBHHbEUHhglCNCdY3NsYjcbA=;
	b=iV+VqChol8hOXkKqMdPuvqbjOSl63jLthSDy/jxneXDk8mot7Wm6JhGyw8t9SUV34x
	X4rtgZ9I3DXcNQmiLm40pBnne4infBkdYqU7FW3XdFQCQUnWTfWgQ4Irqaahii4raFnt
	4QYtit5cv+7BGEGccvJhK5+dr1+l2FEoYD4YDJE45LQNime01ABMRatAtNXK+AjIQQvC
	3d8tvlskXbPp3WNncTL3BhRvnKITM65FWyl1r4DxS+2IY3+mmcYoaowXyLFrhIbRwJyX
	sXAzqbjWujNY9YJqRnKwR3KXLqdE19TiFY27LDAYmdURHmVeBiZaeIvNGph6k9ZTmROW
	Lhmg==
X-Gm-Message-State: APjAAAWqsTlgmIL3eLrFU/NF0C9NVABU5j6yGEO8swWeC39ScUbptK/U
	5ivaTd3Fb5o4vXdEJ/3JQ8TIWmWEsz/Tfs0f/0uBSiFP
X-Google-Smtp-Source: APXvYqwuEoc/Q7gxye8N8vW4NyWK0mDQds+FNfRrsWQ32ybPj+B6LsK0MG318YJsohZZfsFfjIkxARSCMOxNOfGtNx4=
X-Received: by 2002:a37:5009:: with SMTP id e9mr25293914qkb.206.1557804219122; 
	Mon, 13 May 2019 20:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190510204954.33591-1-raj.khem@gmail.com>
In-Reply-To: <20190510204954.33591-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 May 2019 23:23:13 -0400
Message-ID: <CAMKF1spGNpz5cQ5zFLpZzTP8=FzvUqpi3zsp=-YnR6Li7+zqwQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mmc-utils: Fix build with clang
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
X-List-Received-Date: Tue, 14 May 2019 03:23:38 -0000
Content-Type: text/plain; charset="UTF-8"

ping^1

On Fri, May 10, 2019 at 4:50 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> clang has more warnings to report, lets fix them
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...tra-braces-when-initializing-subobje.patch | 32 +++++++++++++++++++
>  meta/recipes-devtools/mmc/mmc-utils_git.bb    |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta/recipes-devtools/mmc/mmc-utils/0001-mmc_cmd.c-Use-extra-braces-when-initializing-subobje.patch
>
> diff --git a/meta/recipes-devtools/mmc/mmc-utils/0001-mmc_cmd.c-Use-extra-braces-when-initializing-subobje.patch b/meta/recipes-devtools/mmc/mmc-utils/0001-mmc_cmd.c-Use-extra-braces-when-initializing-subobje.patch
> new file mode 100644
> index 0000000000..12707357b2
> --- /dev/null
> +++ b/meta/recipes-devtools/mmc/mmc-utils/0001-mmc_cmd.c-Use-extra-braces-when-initializing-subobje.patch
> @@ -0,0 +1,32 @@
> +From 04fbe6ddb5f1e02efbcae3cdf5beb16757a98948 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 10 May 2019 12:58:01 -0700
> +Subject: [PATCH] mmc_cmd.c: Use extra braces when initializing subobjects
> +
> +clang warns with -Werror,-Wmissing-braces, as following error
> +| mmc_cmds.c:1886:36: error: suggest braces around initialization of subobject [-Werror,-W
> +missing-braces]
> +|         struct rpmb_frame frame_status = {0};
> +|                                           ^
> +|                                           {}
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + mmc_cmds.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/mmc_cmds.c b/mmc_cmds.c
> +index 19a9da1..838e8c3 100644
> +--- a/mmc_cmds.c
> ++++ b/mmc_cmds.c
> +@@ -1883,7 +1883,7 @@ static int do_rpmb_op(int fd,
> +       u_int16_t rpmb_type;
> +       struct mmc_ioc_multi_cmd *mioc;
> +       struct mmc_ioc_cmd *ioc;
> +-      struct rpmb_frame frame_status = {0};
> ++      struct rpmb_frame frame_status = {{0}};
> +
> +       if (!frame_in || !frame_out || !out_cnt)
> +               return -EINVAL;
> diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
> index f3a7234670..0c401c86fa 100644
> --- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
> +++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
> @@ -9,6 +9,7 @@ SRCREV = "aef913e31b659462fe6b9320d241676cba97f67b"
>  PV = "0.1+git${SRCPV}"
>
>  SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH} \
> +           file://0001-mmc_cmd.c-Use-extra-braces-when-initializing-subobje.patch \
>             "
>  UPSTREAM_CHECK_COMMITS = "1"
>
> --
> 2.21.0
>


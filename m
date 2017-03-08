Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id EFBEF72F45
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 20:23:12 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id u48so5561174wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 12:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5LoksrpJIX4ozawLFCroYauED+TQqzuD3Uw2AfHIJAg=;
	b=PxDNGYk9eKXl0Gjce0xHGLwn9pcpg9ZOpCN3eaG0ftmD9OMgdN4KQcrvQL0Gxgxsns
	ktXFcDLTCrf9MQmbIwwknSxOPvaro8LZ9Em2UF/uGZjIgsgLZH7YDtUaPtxQ+qm2Zl9x
	eSbn3WaQl2v7fQSBMeG1Rw6sGxCjW3GFMKqZi4ET/llM3igWaINsc5765vGvfRsCR7/O
	OVKXZ3wfxo7r1WHxFqHpDEeCRwOlz1t787mDEsMrCa3Q/FGwdWjGwZv+59VQMQjYp3Yf
	lhIjWeH6Raj2eCTPQVJ1gmKXsVg+VEa5ai24SdNRtQOG4aR+e8zibD9lWRwJPmxy7D4G
	I9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5LoksrpJIX4ozawLFCroYauED+TQqzuD3Uw2AfHIJAg=;
	b=kwOV3B0elLGBOfACcOwi6p4jx1ZQsnA1KX106oSZrZvSW4cXxPo7MMvUnmH5i0KvdW
	Sg1WqZdCSHISYwR+NopuuAjGU4hgWT6MAl8tAgj4jqKQwZIFF7MS9MmYSlLVZD6X3U9Z
	arkurJX9wuHV6SfSwOqg4yz5XsvZNHbh0WXkj8RzNtm0XO1vFfIdxwCKrcwPkhGjIDAr
	E86gjfswQSxhAZc/nKsOilZxagKQKz5mcBMa0T4flz18Np3WkxJbPNbarls+Fu9/RLwi
	4GVzW/5+p7TVbPSEgcOWqoZOAmCl4+gR03VRwwuF5slFk3WgSgJG0DpomB7UmrjC2Pn9
	6AMw==
X-Gm-Message-State: AMke39lPKdfVNhGXDOiJI68DTSqqN/dIvfmlgWB3hOEq49j0i7Tqn3SWlQ14Za7XCiYOI3KseF7a+bYXRjTbRA==
X-Received: by 10.223.182.133 with SMTP id j5mr7915064wre.19.1489004593628;
	Wed, 08 Mar 2017 12:23:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.174.82 with HTTP; Wed, 8 Mar 2017 12:23:13 -0800 (PST)
In-Reply-To: <1488527950-10906-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
References: <1488527950-10906-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 8 Mar 2017 12:23:13 -0800
Message-ID: <CAJ86T=VqHM=cCyJGg9=MWLtBMFPoqhbAxpwsd=GuK5wdE0cWtw@mail.gmail.com>
To: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf.bb: Fix dependency while building kernel using externalsrc
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
X-List-Received-Date: Wed, 08 Mar 2017 20:23:15 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 2, 2017 at 11:59 PM, Manjukumar Matha
<manjukumar.harthikote-matha@xilinx.com> wrote:
> Having dependency on do_patch will fail while building kernel using
> externalsrc. Depend on do_configure instead of do_patch to bypass the
> compilation error.

I think the change to kernelsrc.bbclass is perhaps more significant
than the change to perf.bb, so the commit message prefix should
probably be kernelsrc.bbclass: rather than perf:

Maybe even spilt into two commits.

> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> ---
>  meta/classes/kernelsrc.bbclass   | 2 +-
>  meta/recipes-kernel/perf/perf.bb | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernelsrc.bbclass b/meta/classes/kernelsrc.bbclass
> index 675d40e..35cf49e 100644
> --- a/meta/classes/kernelsrc.bbclass
> +++ b/meta/classes/kernelsrc.bbclass
> @@ -1,7 +1,7 @@
>  S = "${STAGING_KERNEL_DIR}"
>  deltask do_fetch
>  deltask do_unpack
> -do_patch[depends] += "virtual/kernel:do_patch"
> +do_patch[depends] += "virtual/kernel:do_configure"
>  do_patch[noexec] = "1"
>  do_package[depends] += "virtual/kernel:do_populate_sysroot"
>  KERNEL_VERSION = "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR}")}"
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index ffaa5f6..b13f8e4 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -45,7 +45,7 @@ export PYTHON_SITEPACKAGES_DIR
>  #kernel 3.1+ supports WERROR to disable warnings as errors
>  export WERROR = "0"
>
> -do_populate_lic[depends] += "virtual/kernel:do_patch"
> +do_populate_lic[depends] += "virtual/kernel:do_configure"
>
>  # needed for building the tools/perf Perl binding
>  inherit perlnative cpan-base
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


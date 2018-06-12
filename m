Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id D7FFF7603B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 17:36:10 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id x4-v6so14883210vkx.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 10:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IE2xeZwLsP7KW6uCm1a3mEHqq4sY10s9oX1YdFqQ9Ww=;
	b=BVNziFbwF/Rb2dR8wth8PVveUTrcqAGffqK/5jpNuhYCuXYDsGhOhRLBintRkaZ61c
	ROmWJF6fe8+Qr+Wtsof3vsqdFIhI70VhXWBwB6l3aERlsUFTizjlzL1Sa4CysnCAmCqJ
	vMKBZPoyUuGVyrGR8OWA7E3yPaYJ0e+3TKzwy1W56njJHEXXg8CgW2BSK1QSr841x059
	udfauM1xAMEWPe4X091eFUPXmW81VjoKFCCaQtLMVhK2uMTIJTabhmt31Wvxn7lf4ddR
	aCVBwzV65uWi/GVelj0nFFjPI9EBgAikGU0cqpBLppbPqiSRd2gr/SJO6cjg9M4/iruf
	xpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IE2xeZwLsP7KW6uCm1a3mEHqq4sY10s9oX1YdFqQ9Ww=;
	b=io21h9VZ7LOYgCzMETOczl5RbTOqgpfrRzAkje08R9Hre4PyTmSlH7X37UTlh72/lh
	itHSmuzEknVMaticDWm7kzv7BwSuyF0LuGVE1hbgHf+3FHBKqpdUxKqPollIPWbHC3jM
	OcRw8ycxIpTYwVIxQPPJX5x3CCP0siEQi6KVQLqhJOkNWBFJEbQpQk6VwOUsProKPxeg
	tKeptM/P2LTBe8TEVRjedFR+kBS1EZ1k/jBWZpcinSJtSjYc88ef+c5oVf9oN5+IFV75
	yLUQyN2axKVT0mM82qnx20CP4+BT8sGytjFW1LQIBKzp4F0CdogxKNMQfThsnb83Y7HG
	PdyQ==
X-Gm-Message-State: APt69E1svHL3u5+3BceMSKvQ42pjb55SXjWqMcAHajgk0nrc+60zSFwG
	9q7osTcgjVa4Nes72wgs9+fTCohyZlR39AzCfRc=
X-Google-Smtp-Source: ADUXVKL4+ftIqK3g5BoaQtS0P8MnXKRiFO02OxfWNPmc6hdbiYv6sjhD+dXds8UFTGiPPMQawkPpF/LpNPK2Me5Zt1U=
X-Received: by 2002:a1f:c3c7:: with SMTP id
	t190-v6mr926514vkf.24.1528824971506; 
	Tue, 12 Jun 2018 10:36:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Tue, 12 Jun 2018 10:36:11 -0700 (PDT)
In-Reply-To: <27e273fe5fe880eac584023153ccef33b65bf859.1527656441.git.raj.khem@gmail.com>
References: <cover.1527656441.git.raj.khem@gmail.com>
	<27e273fe5fe880eac584023153ccef33b65bf859.1527656441.git.raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 12 Jun 2018 10:36:11 -0700
Message-ID: <CAJ86T=X5vk_=GJ=5vD1-S0b3xJ7mn_mGDqi-SrYiu5whmKBNHQ@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] gcc-runtime: Remove -mcpu=cortex-a7 when building for -march=armv7ve
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
X-List-Received-Date: Tue, 12 Jun 2018 17:36:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 29, 2018 at 10:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
> This fixes conflicts like
> cc1: error: switch -mcpu=cortex-a7 conflicts with -march=armv7-a switch [-Werror]

Ross, this patch still seems to be living on in mut, even after the
latest rebase. It should be dropped as the latest gcc8 patchset
contained a better fix.

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 72b8081cd3..22617a2838 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -14,6 +14,8 @@ EXTRA_OECONF_PATHS = "\
>      --with-build-sysroot=${STAGING_DIR_TARGET} \
>  "
>
> +TUNE_FEATURES_remove_armv7ve = "cortexa7"
> +
>  EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
>
>  RUNTIMELIBITM = "libitm"
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


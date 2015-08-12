Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 70D8D76790
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 14:15:09 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so220297501wic.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 07:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=x3OOZsu69v8gN7adpYwt4ACV3P1sLU72RlmfdAr7XVM=;
	b=As/El0WXN9gxAsbUjnm9zNlru3HuqdLperDa9VnBcT1ra2CKbFGE0xr5giSVSiPhpV
	fUAU4rUQR8FvWIgDrBbkd4vFDf6Difs6K4RWEs3flZJ59mDzfbDRPKOhODkj0UnAFu1B
	rRylgBO+6fph71ubgjViutfJRj6yK+bYT3+odvMHDbo0RdS29SJcEf08o87Joiz3aiO7
	SY+L1oSHAd42mBq1NxnXdO0BXqmFp5N1WXCmIrI49lBOIyYRVmugKJUJh09XkRcPs6TT
	TO80zMwWPtVts39whlKKHbydED9vHGcyZXtYF4mHhGJ3kxEKB8F1dATdB7ffJporfMv6
	E60A==
X-Gm-Message-State: ALoCoQlnQAxixaIwABcBzzRFcJoaaK3QtA3tSt8u327PZ+dU8HDReL34/bDoPjdaaR7PRhVmQ21n
X-Received: by 10.194.122.132 with SMTP id ls4mr65035539wjb.130.1439388910019; 
	Wed, 12 Aug 2015 07:15:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.175.160 with HTTP; Wed, 12 Aug 2015 07:14:40 -0700 (PDT)
In-Reply-To: <1439098101-9400-1-git-send-email-akuster808@gmail.com>
References: <1439098101-9400-1-git-send-email-akuster808@gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 12 Aug 2015 17:14:40 +0300
Message-ID: <CAHiDW_Fzm5wcJHEq54sSLOi564XUgsOrXY0sOxi_Ta5xe8kEpQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nettle: clean up license information
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
X-List-Received-Date: Wed, 12 Aug 2015 14:15:16 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I realise I'm a bit late (with the commit in master already) but I'm
looking at upgrading this recipe and had some questions on this patch
and the recipe in general.

On 9 August 2015 at 08:28, Armin Kuster <akuster808@gmail.com> wrote:
> adding the license definitions on the few packages that
> deviate from the overall package license.
>
> based on http://www.lysator.liu.se/~nisse/nettle/nettle.html#Copyright
> and spot checking files.
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-support/nettle/nettle_2.7.1.bb | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-support/nettle/nettle_2.7.1.bb
> index f53afcc..f9d331f 100644
> --- a/meta/recipes-support/nettle/nettle_2.7.1.bb
> +++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
> @@ -2,6 +2,15 @@ SUMMARY = "A low level cryptographic library"
>  HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
>  SECTION = "libs"
>  LICENSE = "LGPLv2.1 & GPLv2"

I think this is wrong, whichever version you look at -- our current
version is just "LGPLv2.1+", the current upstream release is "LGPLv3+
| GPLv2+"

I'm going to send a patch upgrading the recipe to the current upstream
release (and setting license to "LGPLv3+ | GPLv2+"): it might seem
like this makes gnutls effectively LGPLv3 but that actually happened
last year with the gmp upgrade. Comments on this welcome.


> +LICENSE_${PN}-cast = "CC0"
> +LICENSE_${PN}-gosthash = "MIT"
> +
> +# both public and GPL license listed
> +LICENSE_${PN}-md2 = "CC0 & LGPLv2.1+"
> +LICENSE_${PN}-md4 = "CC0 & LGPLv2.1+"

From the reference I had the impression this "LICENSE_something"
construct would imply there is a package "something". But the nettle
recipe does not produce "nettle-cast" or any of these. What is the
purpose here?

Thanks,
 Jussi

> +
> +
>  LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>                      file://serpent-decrypt.c;beginline=53;endline=67;md5=bcfd4745d53ca57f82907089898e390d \
>                      file://serpent-set-key.c;beginline=56;endline=70;md5=bcfd4745d53ca57f82907089898e390d"
> --
> 2.3.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


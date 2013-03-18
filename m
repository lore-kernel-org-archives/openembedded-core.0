Received: from mail-vc0-f174.google.com ([209.85.220.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1UHe4I-0003ft-9s
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 18:42:02 +0100
Received: by mail-vc0-f174.google.com with SMTP id hx10so3117428vcb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 10:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:x-gm-message-state;
	bh=4nralgMX2/xiiMuJv2RvTYvFVdBVcaBwp04d9w7Jous=;
	b=PlAC3MTA1Zs2aCZqv8R2SBEuerfRfYcUAlWd1B8bAM2R6FiqT5545DVzvRoRAbiOqR
	U/loRtDO/xMVoGwa91qwuchzXm7A5R6tURK8/XKn753XpShcsQdoXkhP4UcDEj3ZP4dQ
	liX+Wt3CLShiCrGiL2WLvrj8OfcwwhqfG8WqrEnD+UOenEj0M4pVmbH1ezR6eeUdLI/x
	dtQNQKNXjcWF6eKGIyAzgIKaofj3p+d7BB0gUwWwxuAhTR4/PX8Fv6rkxVU49f1k0mMc
	b6IXoF2Pl3kJfpEDr629vGPmE9Xg9ywiXZuG2Ok9Qtc1g6Vyvrs2TjLVO1Ncg6yryJhc
	8UGw==
MIME-Version: 1.0
X-Received: by 10.58.64.115 with SMTP id n19mr21396819ves.37.1363627505646;
	Mon, 18 Mar 2013 10:25:05 -0700 (PDT)
Received: by 10.52.170.74 with HTTP; Mon, 18 Mar 2013 10:25:05 -0700 (PDT)
In-Reply-To: <1363602285-16371-1-git-send-email-maxin.john@enea.com>
References: <1363602285-16371-1-git-send-email-maxin.john@enea.com>
Date: Mon, 18 Mar 2013 10:25:05 -0700
Message-ID: <CAPhnLPCeX41h5f2Ha1x4J+1SYJ-xQ0Xrh71jORm0MY4fwrJGjg@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: maxin.john@enea.com
X-Gm-Message-State: ALoCoQk6HacMcIpTDD1ujCvdCfuMi+ieYeIt6liPN7d7yIgZ8jvZy2F01a/3/P2tqdypHmxVO8BU
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] harfbuzz: update the license information
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Mar 2013 17:42:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 18, 2013 at 3:24 AM,  <maxin.john@enea.com> wrote:
> From: "Maxin B. John" <maxin.john@enea.com>
>
> harfbuzz is using the 'Modern Variants' of MIT License:
> https://fedoraproject.org/wiki/Licensing:MIT?rd=Licensing/MIT#Modern_Variants
>
> So, we can update the LICENSE as 'MIT'.
>
> Fixes this warning:
> WARNING: harfbuzz: No generic license file exists for: Old-MIT in any provider
> WARNING: harfbuzz: No generic license file exists for: UCDN in any provider
> WARNING: harfbuzz: No generic license file exists for: HarfBuzz-old in any provider
>
> Signed-off-by: Maxin B. John <maxin.john@enea.com>
> ---
>  meta/recipes-graphics/harfbuzz/harfbuzz_0.9.12.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.12.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.12.bb
> index 19269f1..93e0e41 100644
> --- a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.12.bb
> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.12.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "HarfBuzz is an OpenType text shaping engine."
>  HOMEPAGE = "http://www.freedesktop.org/wiki/Software/HarfBuzz"
>  BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=HarfBuzz"
>
> -LICENSE = "Old-MIT & UCDN & ICU & HarfBuzz-old"
> +LICENSE = "MIT"

Yes, it's a variant of MIT but...

cat hb-icu-le/COPYING

"The contents of this directory are licensed under the ICU license.
See file license.html."

So, this should be:

LICENSE = "MIT & ICU"

even though ICU is in itself an MIT variant, it should still be called
out as we have the ICU generic listed in files/common-licenses.

>  LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
>                      file://src/hb-ucdn/COPYING;md5=994ba0f1295f15b4bda4999a5bbeddef \
>                      file://src/hb-icu-le/COPYING;md5=0ac60acf068e2cc9facdf86169a9c13e \

This is correct. There are a lot of headers with licenses but at a
glance they all appear to read as MIT.

> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Elizabeth Flanagan
Yocto Project
Build and Release



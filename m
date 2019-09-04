Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8BA977F260
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 18:54:20 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id g11so7096200uak.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 11:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=VTteHIAA6Jkexat39lCbSsqj6ogsPr+bFVTEZuZq7Bc=;
	b=JMoXUNfSB4lzb/LnYt8JvF9RyCj3EX91BHpA3aVOE/DqOHRf7MZSSR//Wu4adcNLyD
	M02uV28Dbm/NWtkXxCQccB84f9Y33styby3ZwuvehHAPKJlGzhc7c4211KgyDg5xy10g
	ITIcg0GRYQ37UYHaIx+IAiFvNfwXHtTmWDM0xoHoTXyFGY5GjYE4O1f8aIAOW9sI+3O7
	3ZAPNihR9gjHPws1vI/rWxyP8Gxtk2JdvbpEnR+LaYLHyfPatwV92W3canHxtNnI10Bi
	Rd1mye8n5nqpIDG/Ya5DeQ+Xh6O9PENm4Xsk/fiDk9MZBasCkiBFPToGMuz0ODj+r0OJ
	dURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=VTteHIAA6Jkexat39lCbSsqj6ogsPr+bFVTEZuZq7Bc=;
	b=PJ4ay6sObkSq1iOvKQO7nDjZUCBdHElINpn/zqcWQb81y6AMYAqayQp8tB5QpgS/q5
	GQvoAA74b4NFFK1zwwoRrA1CrA2GFs4RGc7dDOVJkbYVAW8KqzMyFgyCEGPNIjH8cHq4
	VbqDzwriGbW1tjLsFtOw1lWXo2GyOaxidDQ1MzHyM7Z/6SpSWPPG3KNIl7AtE43XUsYw
	X5JnGS0vQWKnJUED8Usa7dn6JhQPfDCt7L2ANe0Jp2viUqyJuFMGMKWOZv7vrgYzXDME
	Yp3Al7l5TjcVlraTqRHfZZrtJuwJx3mQLga8DSoGlVJpZv9vgy3nI5qffR34+X3fHdZV
	VDLw==
X-Gm-Message-State: APjAAAVfEwHbnEimup7yYMKgHpvNSA+wH2SEBOt4dlE//f66+Xhht+N6
	bS1EmMza0h3S6/eBeRPzWIYJEc1lFSZBqisLgN0qDA==
X-Google-Smtp-Source: APXvYqxg0TsBGi3ubewqETiWIwHJWZZxW17FYlEuJro3HlvFpBC3WkjF3wzTisGuxHL8/YMP1v4LWZjQCnKOFkeWtSE=
X-Received: by 2002:ab0:30c7:: with SMTP id c7mr10275351uam.99.1567623260959; 
	Wed, 04 Sep 2019 11:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
	<1566593504-21918-5-git-send-email-armccurdy@gmail.com>
In-Reply-To: <1566593504-21918-5-git-send-email-armccurdy@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 4 Sep 2019 11:54:09 -0700
Message-ID: <CAJ86T=WKwPmbj-S3x7oLEKVU6tniGBTVXgf8hhseUpXCpBECDA@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/13] feature-arm-thumb.inc: fix ARM_THUMB_SUFFIX
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
X-List-Received-Date: Wed, 04 Sep 2019 18:54:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 23, 2019 at 1:52 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> Since TUNE_FEATURES now either contains a CPU or an architecture (but
> not both) we can't rely on finding the architecture in TUNE_FEATURES.
> Use architecture specific over-rides instead.

This fix hasn't been merged. Were there any concerns about it?

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/conf/machine/include/arm/feature-arm-thumb.inc | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> index 0b47cca..bae169d 100644
> --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> @@ -1,8 +1,6 @@
>
>  TUNEVALID[thumb] = "Support Thumb instructions"
>
> -ARM_THUMB_SUFFIX = "${@bb.utils.contains_any('TUNE_FEATURES', 'armv4 armv5 armv6', 't', 't2', d)}"
> -
>  # If the device supports ARM, then respect ARM_THUMB_OPT (which can be "arm" or "thumb")
>  # If the device doesn't support ARM, then always set "thumb" even when
>  # some recipe explicitly sets ARM_INSTRUCTION_SET to "arm"
> @@ -23,6 +21,11 @@ python () {
>
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -m${ARM_M_OPT}', '', d)}"
>
> +ARM_THUMB_SUFFIX = "t2"
> +ARM_THUMB_SUFFIX_armv4 = "t"
> +ARM_THUMB_SUFFIX_armv5 = "t"
> +ARM_THUMB_SUFFIX_armv6 = "t"
> +
>  # Add suffix from ARM_THUMB_SUFFIX only if after all this we still set ARM_M_OPT to thumb
>  ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${ARM_THUMB_SUFFIX}', '', d) if d.getVar('ARM_M_OPT') == 'thumb' else ''}"
>
> --
> 1.9.1
>


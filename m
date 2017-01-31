Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1767971DA1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 14:24:29 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id w20so165627371qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 06:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ya2vZGIEUofUTN8HLPTrR0b/kmR/n1ciHHDC4qkzrD0=;
	b=RnwIqr7xO1YjpDcKgPAikP1m42jd4B7K0p9iIF+uqY9Hk/jB9q31OcLBEzQL38SC7V
	RJRNvgDuG7kfsrUlHBx16HC/nwECp3e6Y+Xy7ncSLTTv4mh2Uzdvh60MY0Xqi2UUc3Rm
	Q8bwi28bkPSLxIwkkaEJJ6qDTsJEAelyGYfJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ya2vZGIEUofUTN8HLPTrR0b/kmR/n1ciHHDC4qkzrD0=;
	b=VNlL57n39Y2Mpcpxzf6vThUlKKDIW5s83RyboWq6yhOZWwnjd77wKqd4PmBWyVdi8A
	+2ZomY8WGLklPjXoXseyYsCEufTOnpAIHKiKvTyz7QdHgTioQHQG3Ic9+BR6O2ICQfv7
	jKhtYvUYdhbn0ThrdBfdNhTNdQK2Pt7OensDu2MdGkicMUVfscCUQxEq/gXy0RUjjweA
	/rGnWXgFp9O7EToBRk7Hjn9Q3YxY0KjmonJ4L+95J2kuwyBbod3f2rOGoOaMz9Hy5bbn
	AVFNgBK224fmP6zUUdGK60BcYPKlKxMgA0sWm8g29wuDVMZHWtWN+vzWpbVEnBWFIF61
	jMYQ==
X-Gm-Message-State: AIkVDXLfqsljz/n2XlNkY0E9Ydr4MZvZmzHPjHhaQOBItyaWdShQHRV9qYsUByWz9fNSSBRDMSaghzgMgZAVrQ4F
X-Received: by 10.200.36.41 with SMTP id c38mr26493912qtc.57.1485872670049;
	Tue, 31 Jan 2017 06:24:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.35.51 with HTTP; Tue, 31 Jan 2017 06:24:09 -0800 (PST)
In-Reply-To: <20170131132330.4422-3-markus.lehtonen@linux.intel.com>
References: <20170131132330.4422-1-markus.lehtonen@linux.intel.com>
	<20170131132330.4422-3-markus.lehtonen@linux.intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 31 Jan 2017 15:24:09 +0100
Message-ID: <CAP71WjwMcm8b7Q9Rx-26=9WpLnhFREEVbkP2NkmZa0Ea6Ltprg@mail.gmail.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] wpa-supplicant: inherit pkgconfig
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
X-List-Received-Date: Tue, 31 Jan 2017 14:24:33 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 31, 2017 at 2:23 PM, Markus Lehtonen
<markus.lehtonen@linux.intel.com> wrote:
>
> Missing dependency uncovered after recipe specific sysroots were enabled.
>
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>  meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
> index b96f9d2..146bccf 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
> @@ -13,7 +13,7 @@ PACKAGECONFIG ??= "gnutls"
>  PACKAGECONFIG[gnutls] = ",,gnutls libgcrypt"
>  PACKAGECONFIG[openssl] = ",,openssl"
>
> -inherit systemd
> +inherit pkgconfig systemd

thanks, i just hit the same issue, and your patch fixes it.

Tested-by Nicolas Dechesne <nicolas.dechesne@linaro.org>


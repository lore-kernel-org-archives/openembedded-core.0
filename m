Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 578BF771F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 02:59:47 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v123so5565737wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 18:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gVzrIGPaBnGdcUFoxE2GO4MXlehH03e/MH+wb+NHKFg=;
	b=COSoAXt3lIR2p8R0XISCw5lN1g5ff2496nD4YITKg/U+UyrHbHqv3jLxnH95ZaRjqu
	5y2avUs2bbIKi6dHPrhmN3lL8iN9EjQFAWX3j7t+fFLuJtL1U8BIiViTXtA3UW+e/yOr
	TNt9WFPdUyCnQc6APXCc6ZvtpR8KOZajCAz+lmBLF/p1Fb9jZRmiSe7CMPMlNf5A0Rqj
	5uWc+fklPvK9Gs7jlE+rBJeaxVsXDBkxAXqHjvjUJOuMQ82EYBSkf13AllyRcgQl9JF+
	4Mkmea2YABsGktb/rJhAI/NFTkUhL7a7/ZRiHu9uvo4ndIBvjUiU1Fv7ZTJJZ8cKPQcJ
	wpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gVzrIGPaBnGdcUFoxE2GO4MXlehH03e/MH+wb+NHKFg=;
	b=GvTxRA6UNs6DLyyASeqzSnQ+CNuEfxMC5GQeAjWg4mhT3bsWuOXg0qiypDSFr8a7zH
	81iIAKqBm207v3bSaJDhSCWUmrjaR/3y3XTZQQTrJn8bjjCpB1/alHs2HEb72QzYnTKg
	rC49YyCoQUkNizAwAd0NCPgZfI4Sj5n6XAsIoOpRuyKX3vavYHyrSE0WzNtAAN7aJo6r
	/53v3ovR0E6NCYzDHBQzp2cvtC4V4But1ylg5KVvurX9z5A6H5N1tlFAfmuxoPcH8aTu
	R8jUMmxxAMwaqjBNeJ/W+2OZUGDog+TCV+HvlLPNyoEe7gwhyRiTjmcp57dhnygGwlPZ
	3emA==
X-Gm-Message-State: AKwxytet4K7n4DznWtHcVa8p4EZdpKVx0CQ/myWiY4N0oEa3giKItsp8
	kY+uHAUaAgDch3MOpJ4HdDnjE2FumQ4pfyBtnlk=
X-Google-Smtp-Source: ACJfBouP67QRQuuc/q5kXjr/g97Gp9kcdPtxJz7+bxv+hR2qcvJIUP6uCPMljGkD3PPhhzleyyrgToAtLKTc1gVHhtM=
X-Received: by 10.28.9.77 with SMTP id 74mr10873548wmj.110.1516071588797; Mon,
	15 Jan 2018 18:59:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.190.132 with HTTP; Mon, 15 Jan 2018 18:59:48 -0800 (PST)
In-Reply-To: <1513215238-19948-1-git-send-email-armccurdy@gmail.com>
References: <1513215238-19948-1-git-send-email-armccurdy@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 15 Jan 2018 18:59:48 -0800
Message-ID: <CAJ86T=Vp9N61VxycBVZGsORbS-VRFKrFSishX_uyC7cReuXnsQ@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: drop obsolete CONFIG_FEATURE_SYSTEMD reference from musl.cfg
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
X-List-Received-Date: Tue, 16 Jan 2018 02:59:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 13, 2017 at 5:33 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> From 1.25.0 onwards, busybox dropped systemd compatibility from its
> version of syslogd:
>
>   https://git.busybox.net/busybox/commit/?id=accd9eeb719916da974584b33b1aeced5f3bb346

Ping.

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-core/busybox/busybox/musl.cfg | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-core/busybox/busybox/musl.cfg b/meta/recipes-core/busybox/busybox/musl.cfg
> index facfe85..6fffc91 100644
> --- a/meta/recipes-core/busybox/busybox/musl.cfg
> +++ b/meta/recipes-core/busybox/busybox/musl.cfg
> @@ -2,7 +2,6 @@
>  # CONFIG_SELINUX is not set
>  # CONFIG_FEATURE_HAVE_RPC is not set
>  # CONFIG_WERROR is not set
> -# CONFIG_FEATURE_SYSTEMD is not set
>  # CONFIG_FEATURE_VI_REGEX_SEARCH is not set
>  # CONFIG_PAM is not set
>  # CONFIG_FEATURE_INETD_RPC is not set
> --
> 1.9.1
>


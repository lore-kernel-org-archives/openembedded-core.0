Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 34F0572F60
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 15:51:20 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id y128so17908514qka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 08:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OtY96RZohOJMa+p6LmC1y0owdWQwogiz9q2i41J6k30=;
	b=lLzPfhpAa67Vwo6AziCRxt7H0N/Lfzd1IOUvwELmY3hRoOQaE/+mkGw6cIClsjcKr/
	+0yLwOnTqOaBS97xRF0eJihWyuSlqDe11+OyyzG200kdnqJDSTVNXvH2+rVfj3WHAeV4
	lQQ7OFY3ezBUYtwyiJvGwALZhcbz1PAeLX/qiFItpbINR26NYEVt6neHsZXcyAxMZsaZ
	dgr0fly9jDAbafdx5MfyKRuuhtJweBbwQeGGGmRyucLKkDRCK3rWOKTPpiLDnsxy0a3R
	ppoCJKBvCehVyb+8esIWRCrvQmSR2YtJFWHSJ/rc9eW1Z4xltPc0a84qx8e3HdUeR3Jh
	opcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OtY96RZohOJMa+p6LmC1y0owdWQwogiz9q2i41J6k30=;
	b=fShC4mjymQlZMEgrBcNIUK3Cjtms+xDWA/Zx0yY2IwbtKL1JzjHtOqQunDRqh3BeEI
	8zea159MGrPaiaApIvKrgJX94Xd+2w149DPYYZ0MK6GP2gNfIyL71j5zwH6K+LI+2KZL
	QLPng8VbfjCKByLjECHx64XkCAssc8CfqkLwx3b2cjGa1VIJ6mjIVdMbjwZRrBK+nIzP
	sOHeL4bOThtYFVxq4ZwvsFLHMTFoLz9bYAOfFQyhiq+u+z3y/xTNfo/Y17rW7kn7gK6R
	2ktvnGg/U2j5iPLBGyyAyACIGUkUh177jBRn+bwlA29AsolOsr56xwLAMhdtpC0DGz7l
	eg9A==
X-Gm-Message-State: AODbwcDl5mjestXX8xWu4byIlWdkdqM8F3Z3fnnQOWV3pB38+afJnwJU
	zUJPcpAniqGjvJD4kZj03fp8u6BB9Q==
X-Received: by 10.80.169.193 with SMTP id n59mr5303251edc.127.1494863482219;
	Mon, 15 May 2017 08:51:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Mon, 15 May 2017 08:50:51 -0700 (PDT)
In-Reply-To: <e03ca7d9d2d8b290fe306da077e0fc74a6916efd.1494854721.git-series.patrick.ohly@intel.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
	<e03ca7d9d2d8b290fe306da077e0fc74a6916efd.1494854721.git-series.patrick.ohly@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 May 2017 08:50:51 -0700
Message-ID: <CAMKF1spKnOnZfMoijNz5kQjE2=5OO3k4CUVK5d04id1B42JB2A@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 6/6] local.conf.sample: make debug-tweaks depend on IMAGE_MODE
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
X-List-Received-Date: Mon, 15 May 2017 15:51:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 15, 2017 at 6:27 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> Enabling "debug-tweaks" unconditionally, even if it is only in the
> local.conf.sample file, runs the risk of that getting used in
> production images.
>
> By checking the per-image IMAGE_MODE, the debug tweaks only get
> enabled for images not meant for production.
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/conf/local.conf.sample | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index 85c5e21..edadbb7 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -114,8 +114,9 @@ PACKAGE_CLASSES ?= "package_ipk"
>  #                     e.g. ssh root access has a blank password
>  # There are other application targets that can be used here too, see
>  # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
> -# We default to enabling the debugging tweaks.
> -EXTRA_IMAGE_FEATURES ?= "debug-tweaks"
> +# We default to enabling the debugging tweaks unless an image is explicitly
> +# requested to be built for production.
> +EXTRA_IMAGE_FEATURES ?= "${@ '' if 'production' == d.getVar('IMAGE_MODE') else 'debug-tweaks'}"

is IMAGE_MODE defined per image recipe ?


Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 767956BC01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 17:25:36 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y8so14759928wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 09:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=tWzZvAadBDrZkUIWETHtlkVLoyG5ypOM02vF8UFcDOw=;
	b=M7HR+dG8BXmMFakve1vO8l45uPtuP9IsTqQk9CVYJmnMNmfAPlBxXsCfabW2Gxl/ZA
	+gVyBHCxxMEzHt2YxcqfsLLkxxByHVQ3VuM0TEyKO6DkN/X31FRz5qLndrn0JC1SJeCX
	581CwVqqI9V/0/lvbDVQWXbkO6ECbvJXokXts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=tWzZvAadBDrZkUIWETHtlkVLoyG5ypOM02vF8UFcDOw=;
	b=ig5dT+9U/hMXxZAsN5ruUSUKELjhsERTvBVtEJz1Bn4IC4A70Ofi1OFcB/sDxs2YIq
	1f+SZT3evgrOU3otMo2dp9pI0ZlnUopt74oT7CofI1GIj3X9w7F898S2OIj46qB2CUqx
	8+AKGfvKUdXL1lxDdcHHgGUe5X/yMXMmnPgZyMT7x2lGc+apMA3tq+X8TtZwG1I+CSMe
	aQsSeQF3SOOnPuzis2RskkqU0EuSEIHUeIbwIu1TnzgHS9Mulxb8v0z1cfk6pUL/p/qF
	AuJzk2M97irrR/rhzhGkVqtoWFSfl/d5lZ8inO2v2ATi6xlp2ZX275gNKl2IREugRj/f
	JlYw==
X-Gm-Message-State: AJcUukfBPC66h7ceRllEdFhh4h4sIr4AoiIda3oS4qy1L2p3zoyyXlT3
	2SZgi5uYjJL+i4KMcaZ+4+D/5Q==
X-Google-Smtp-Source: ALg8bN7dDb/2yExNjB6o0xE1eNahm/5MKszXBwHWlY5siQcXYAvU++p0KdECy4pqjBQZbvV909wcEw==
X-Received: by 2002:a1c:7a16:: with SMTP id v22mr16675584wmc.131.1548696336938;
	Mon, 28 Jan 2019 09:25:36 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id y8sm32810wmg.13.2019.01.28.09.25.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 28 Jan 2019 09:25:36 -0800 (PST)
Message-ID: <e027d8fa4a0410d575fb9ff71833c13b626ba9db.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 17:25:35 +0000
In-Reply-To: <f26f729ae8292856bc3b1e73af1980fcb11d4972.1548679462.git.alex.kanavin@gmail.com>
References: <cover.1548679462.git.alex.kanavin@gmail.com>
	<f26f729ae8292856bc3b1e73af1980fcb11d4972.1548679462.git.alex.kanavin@gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 11/24] mesa-gl: do not enable nativesdk variant to avoid clashes with main mesa recipe
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
X-List-Received-Date: Mon, 28 Jan 2019 17:25:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-01-28 at 13:46 +0100, Alexander Kanavin wrote:
> An alternative would be setting PREFERRED_PROVIDER, but for
> native/nativesdk
> builds mesa-gl is not a viable alternative to mesa, as it lacks all
> of the
> bits that make accelerated qemu possible. Using PREFERRED_PROVIDER
> would
> imply otherwise.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
> b/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
> index 73267eb4f0d..030db6c1440 100644
> --- a/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
> +++ b/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
> @@ -7,3 +7,5 @@ PROVIDES = "virtual/libgl virtual/mesa"
>  S = "${WORKDIR}/mesa-${PV}"
>  
>  PACKAGECONFIG ??= "opengl dri ${@bb.utils.filter('DISTRO_FEATURES',
> 'x11', d)}"
> +
> +BBCLASSEXTEND_remove = "nativesdk"

I really hate using remove in OE-Core. Lets find a different way to do
this please as if we do this, its nearly impossible to undo in another
layer...

Cheers,

Richard



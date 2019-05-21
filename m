Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1C3CF7E228
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 18:44:35 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w13so9019421wru.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 11:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=cTfVcaTfV1ZVO+l33FZ/U/dkTZJgdwSu4DqkK9y84ok=;
	b=FLCdHcYRrc5/NvcANqT/146PKyxvLqnfkOS5rMITK3XXAQTVowojWdMlVRNq7NC5bv
	SceqOOERBk9lyoGRUwfs8BLFDs6UE/PydSR1k7nCjiOpEH9Sj/oCL2ldoO/ynBoTrYGU
	7CLF62cpwxu7EP/ZVVqMBkgqw/PBkC6IfggYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=cTfVcaTfV1ZVO+l33FZ/U/dkTZJgdwSu4DqkK9y84ok=;
	b=kuI9H05V8BbpqPtnviEAWknYuF2M2X6tEbpoeeaOU4Y+wSyoD26nhbT5J6/VL8pIIq
	HFkOFgQvNkJrA9XKr6q8x1neOF1FQZnqD+8+N0yDknw3iPARsyebBouE+LedoAg+C758
	JpUssbn1srOIVFQAjEEwVcv1rA0gajkfkoUrANndm5pPJ7+Sf7NdLsb1d5VevnpxeSMw
	VBAjC7wsvMpElwfeG/IDeqY0IGQd5TqKpHWZLURHwp++/7KetMQgWOZkCS4xvyqNZ0sG
	u5xh6m3gAD4gyHcjEJHgC/WYiZRbxAL94CXTFHXHIcrudPLkfz5cJPLZFT16wE9RMNR1
	yEZg==
X-Gm-Message-State: APjAAAUVwJWTu6Q8G/mypvidkwJ7GFEJo+L3cpkdfVvAAkIqpBQZ3GsS
	r4OejxdqU4FS8K5yC8Bwi0hpfw==
X-Google-Smtp-Source: APXvYqz4mixe7LiqCmfNjd7WITXo0xWwibU45lDeeo/mnSUdBMZIsICU84edgAU0wuJi10yNGBCPjw==
X-Received: by 2002:adf:9dd0:: with SMTP id q16mr51282782wre.28.1558464276838; 
	Tue, 21 May 2019 11:44:36 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h188sm7120940wmf.48.2019.05.21.11.44.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 May 2019 11:44:36 -0700 (PDT)
Message-ID: <06cf651bb9729dab7f0ddec0f6cfc5f878773b06.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 19:44:34 +0100
In-Reply-To: <20190520141125.10805-32-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
	<20190520141125.10805-32-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 32/42] libdnf: upgrade 0.28.1 -> 0.33.0
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
X-List-Received-Date: Tue, 21 May 2019 18:44:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-05-20 at 16:11 +0200, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../libdnf/{libdnf_0.28.1.bb => libdnf_0.33.0.bb}               | 2
> +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/libdnf/{libdnf_0.28.1.bb =>
> libdnf_0.33.0.bb} (95%)

libdnf-native build failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/850

Could be caused by the other fix? :/

Cheers,

Richard





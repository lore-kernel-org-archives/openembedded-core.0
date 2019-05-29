Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7DFB97DFDD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 20:50:24 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d18so2696506wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 13:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=sFkgbKVkAxt3sEsLLIEFwHMdHdy5KMtsdj7gWFTRNbY=;
	b=WQSG0TLDBWupTy66YPal12WXkCtiwhNMi7ZmwUs1Y3uP9jC/DED7Tt/H7jDMGynOAk
	theWmHfyCEtQ+fA6oPgV0Ikk1lkf9ybEc8e3PaTFWR8ABfqXW7dhbtLYFhJfjuXBQXQ1
	GMmBzYOHsGx6Rqx1nM0dMg2kTGkyxkw89JHo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=sFkgbKVkAxt3sEsLLIEFwHMdHdy5KMtsdj7gWFTRNbY=;
	b=DSsfq2Jgsnk+V9ElDHI57y3KVf0TLKV+wmujntLmQqN86YKT7dyxkchKdXvplAhSD4
	1b+VZ1QgfomXsOndX8GM8byCVGSoEmxVT0oIv02oUQzx46B5sxdY9XYJoM2BcjkVo/6e
	C9IiiXnT5pKBGGhc/5HNBoAjEXH/EOQpfwwlFA1jQF3Efb0EVfReiChZ0HrlXwawdn7f
	biJt98RSECVJGoLOyIQ+NvhlK1GPaUgUyr6cJx/yfih+gj38NJUNBYh99Z91IzXzJXXV
	jnIPc5WOSm7dvP0PMP01vuepTpurqbUep9UGQrQdJFBQXds/9MKxlVOl7eAtZlRZK1e9
	ndSw==
X-Gm-Message-State: APjAAAW16KcTXSdfa1z294aq9Wz55daoWTHno/zD28mJfbIXURhagXCG
	dgK5wALlbNOliDtWeoe0Gj8TrQ==
X-Google-Smtp-Source: APXvYqx4rDYJLjH5x756q/zSzg8+BXyqqVT58MugXLHUjxoNPpGetltfVVO4HUAYBQoaS3NV+3MCew==
X-Received: by 2002:adf:e301:: with SMTP id b1mr31885wrj.304.1559163025125;
	Wed, 29 May 2019 13:50:25 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id k2sm361122wrx.84.2019.05.29.13.50.24
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 29 May 2019 13:50:24 -0700 (PDT)
Message-ID: <d5b41b11583c78cd16d6393736fafd8e733c48a9.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 21:50:22 +0100
In-Reply-To: <321f3cb8-a101-49ad-07c4-64fc82d2c7f8@gmail.com>
References: <20190529184328.28470-1-richard.purdie@linuxfoundation.org>
	<20190529184328.28470-2-richard.purdie@linuxfoundation.org>
	<4c62af9f-8bff-726e-db35-6f6ed7ebafc2@gmail.com>
	<8798dc0e5d91991953720388b601c9c5b3174c42.camel@linuxfoundation.org>
	<321f3cb8-a101-49ad-07c4-64fc82d2c7f8@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] uninative: Switch from bz2 to xz
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
X-List-Received-Date: Wed, 29 May 2019 20:50:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-29 at 13:39 -0700, akuster808 wrote:
> 
> On 5/29/19 12:26 PM, richard.purdie@linuxfoundation.org wrote:
> > On Wed, 2019-05-29 at 12:21 -0700, akuster808 wrote:
> > > On 5/29/19 11:43 AM, Richard Purdie wrote:
> > > > (From OE-Core rev: 29fc9210b973be68de474e75068e4c72371afe5a)
> > > > 
> > > > Signed-off-by: Richard Purdie <
> > > > richard.purdie@linuxfoundation.org>
> > > With back port to warrior and Thud too?
> > Yes, we'll need to do that if we bring fedora 30 workers online on
> > the
> > autobuilder.
> I know the uninative update is required for FC30 but changing the
> compression does not.
> 
> This question is about the compression extension question.
> 
> Does this mean YP will no longer be providing bz2 uninatives?

Correct, the patch should be straight forward to include with the
upgrade.

Cheers,

Richard



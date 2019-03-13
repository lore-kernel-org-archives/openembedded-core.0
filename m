Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id B805E60745
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 12:27:20 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id h34so1392110pgh.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 05:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=jCFCjHTqMdS6g1dt0y84OAVtf9SxSgn1aabJycu81ns=;
	b=gfJ9clNsAPLyUb5xhGKzwbT24zqHuV4lt7LBE8ysplZhtdKp882tR/LUdgqkoJP96w
	MyQb+f0KYGgAicaE5zqDJ87J7NXqLFpREWMLF7MLSmemxjGaJatX5Fq2I7V13AR4JZmv
	ZTL9+lPVoMElpNswRVb/RLWXKtfWjn4WTdJNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=jCFCjHTqMdS6g1dt0y84OAVtf9SxSgn1aabJycu81ns=;
	b=ljqtuOOBq6kMwIUw9ibTgWz3DaxyOo9t0fsGfAGqQlTx57GgbqSrmyVHUemYbgydaa
	S8kKfxlvl1AK1XGQ45r3byI9stGfxP0HmZXd9+Gm6GLLamA7Md30KPYqcbKu5HoYP8Tc
	aydJA0HiWWQSzlWM3CkpifDgFb5Rc8e9s2ULam6lmbV8P+7dLTPrjWU8CrdwTiRj/DW/
	SxFbE8SoIDriXyilRT+cktBnRvo3NigaDNhAovqet45/N9qjG5LiaCnfJpZHWXcnPBX3
	NaYMnhnUgRGV3nIOgWQ4zudfJJjphmR+aRXfoJRLmPlCNPvxbhqhfw1KPNwhHNGj009Q
	CtBg==
X-Gm-Message-State: APjAAAUHo7nhcCpckp2UIbqzWtqtQblph7HU2G7+s7t0JE95ii624wVi
	E/+2I0oMZCMPkpBFvXhD7a0SXoE1Ok8=
X-Google-Smtp-Source: APXvYqyT91peDZFYf4UYyubiWHw/gi4q3YCyblCmZCpBcShv6lTT3dqvMP8GEObl/+C2fxtzsH2l9Q==
X-Received: by 2002:a17:902:403:: with SMTP id 3mr45570552ple.48.1552480041747;
	Wed, 13 Mar 2019 05:27:21 -0700 (PDT)
Received: from hex ([12.27.65.221]) by smtp.gmail.com with ESMTPSA id
	17sm16813597pfj.80.2019.03.13.05.27.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Mar 2019 05:27:20 -0700 (PDT)
Message-ID: <524bb11ff49ed73f6d0f32536e31f00ca8c241bf.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?UTF-8?Q?=C5=81ukasz_=C5=81aguna?= <lukasz.laguna@3mdeb.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2019 05:27:17 -0700
In-Reply-To: <20190312101856.32280-1-lukasz.laguna@3mdeb.com>
References: <20190312101856.32280-1-lukasz.laguna@3mdeb.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: maciej.pijanowski@3mdeb.com
Subject: Re: [PATCH][pyro] bmap-tools_3.2.bb: add lacking packages in RDEPENDS
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
X-List-Received-Date: Wed, 13 Mar 2019 12:27:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2019-03-12 at 11:18 +0100, Łukasz Łaguna wrote:
> ---
>  meta/recipes-support/bmap-tools/bmap-tools_3.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
> b/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
> index e10f5fd341d2..099fa998acf9 100644
> --- a/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
> +++ b/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
> @@ -13,7 +13,7 @@ SRC_URI = "
> ftp://ftp.infradead.org/pub/${BPN}/${BPN}-${PV}.tgz"
>  SRC_URI[md5sum] = "92cdad1cb4dfa0cca7176c8e22752616"
>  SRC_URI[sha256sum] =
> "cc6c7f7dc0a37e2a32deb127308e24e6c4b80bfb54f3803c308efab02bf2d434"
>  
> -RDEPENDS_${PN} = "python-core python-compression"
> +RDEPENDS_${PN} = "python-core python-compression python-mmap python-
> setuptools python-fcntl python-argparse python-xml"
>  
>  inherit setuptools

pyro is outside stable maintenance at this point. This patch also has
no Signed-off-by line and no indication of whether the patch was fixed
in later versions (or which versions those are).

Cheers,

Richard




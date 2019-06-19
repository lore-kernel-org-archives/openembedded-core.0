Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 536247D72F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 11:04:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45TMXw3mrbz2C;
	Wed, 19 Jun 2019 13:04:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560942289;
	bh=3gn8EEVx0B3+JnnX+NEk+YDcV9Y0pXcmescXhhn9yeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BREvVydZYqG27HbBQF42uspiPYjFI+3/rQH1HxJlmb+jB2LYM9EYTdpImJpm+/99X
	5lzs5bBIn+ystuz+RSFYiHQq+Gsp/HJfFFGwlQUCF+ZR04MoaYRPtJiEek1KV3JEm5
	zSpm2iGBZwqAhNcAAPG/0M+RA+WzB6cB+BjW+3VY/FJ5QA1Bm/NiAEtCXGasbsRfDB
	h1OOzzezfvej/fVsMrBVyrF3cg1Nay27QogqSmhJzgH6l/yzWRU3RAV9+Uae9/Aak+
	mlYiMr1zc8T1IAIrs/PWs6/hEPJIII+muxiVajxy9Z7Hfuh7yT2NSR0Wwop5jipR7N
	wLANCrp20FVsbxR+JejfvPXaU2YEnEcmA0wVVVaoEXCxf4UnTyRtrp41uN3pXzkPg+
	/DOBSnVWgG2FfNk8O0Ph3Dt8T63+mzlkUCNVghiwrvlMDb26e/xpSkWmUkZMZMDsXw
	VvMsDdDaYeA6yGc8j/k3CZKnSu6aoWdvlTdIiIMAJygOBpctpZ1LLV09jEg1VIE6uG
	8GGxMh1hBPesbzg/Nud9ELSi81Y00GRVtuSV82TNVKOsabQozgi9i0qjF9vszdMz74
	LBIsLtKJ0XD5Q+tQam9KziXviJQxirCSHkf1DG/YR8d6B5AU1CbQCrps/CwuJzeCRE
	b1F/NpCEenH36C7jZbBfl5kY=
Date: Wed, 19 Jun 2019 14:04:46 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Message-ID: <20190619110446.GA20319@localhost>
References: <20190619103251.28854-1-ricardo@ribalda.com>
MIME-Version: 1.0
In-Reply-To: <20190619103251.28854-1-ricardo@ribalda.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dpkg: Use less as pager
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
X-List-Received-Date: Wed, 19 Jun 2019 11:04:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jun 19, 2019 at 12:32:51PM +0200, Ricardo Ribalda Delgado wrote:
>...
> --- a/meta/recipes-devtools/dpkg/dpkg.inc
> +++ b/meta/recipes-devtools/dpkg/dpkg.inc
> @@ -4,7 +4,7 @@ SECTION = "base"
>  
>  DEPENDS = "zlib bzip2 perl ncurses"
>  DEPENDS_class-native = "bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
> -RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} perl"
> +RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} perl less"
>...

Is this part actually required?
busybox also provides a less.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed



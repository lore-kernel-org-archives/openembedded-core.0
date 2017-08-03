Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 57F4C7199A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Aug 2017 16:48:33 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id x64so2886646wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Aug 2017 09:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FqX20fcd+qKytlJ2/R1Kqa5ourkYaLMtiVzOq3DN90M=;
	b=HVWIRo7paE0z7yTZKh0hyumK4H8k5qBQPFxfYmvg7cqV2H+yM0ggRe+FOuZ+ECObv5
	tdTtCV73SX40cBhIfLnfqlTw+mlEP9tUEbRkVvQOutZVDJlGH3kDo1+/7Mq/99dW2E6z
	zhBQyxg4JUSM8d4XURQhyVCNGmLbFMH+A3IayOt0L72xkbehBEgAvz6nyIpK5wZGQWpN
	1E/ppoKPzUHPKcgTYyYlcP5bggqbJxOTvqqpfT0VwDMK/b+VvGOIkQDtURYlZ7DZwXE2
	Q5JSnmrZvtShTh8M1TF+0NHf/k/zHuFEGCH8nSDIwPgTl/MG8s8FrLGrG4NUpX2ouo5C
	0j2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FqX20fcd+qKytlJ2/R1Kqa5ourkYaLMtiVzOq3DN90M=;
	b=KoGGnYHWNFvAi3IK1KKfTKOl/Vvx5JPZ9YR/TITGeTUzSWWGB8F2wLCCO4eBLuOWWL
	MMGREVwcRfHZdgAQhvMtkLAhQPbmzD6jdTo4qzLaaBhq8lYMhRo2L/SoOrdz+w5K1oHC
	8zknIFZIuwqgyh0tHoVc2T5Op4Xxijlp1Y4lmiHFkVxeIzsOXEIyflaQbElzi3ky3lsK
	mVpG6gpHBBOJJGKzMXdqPAGYBsq8ZNSfDWHSNq7CMxquPjCQ6Fi4FPV/r9EwrK1kbLTn
	f7HXnH+L45Pc3XB3rJmUBFoxHCue3sM/ufpP89uZxhySKZL1AKeaf8nbKQKdnYC1tbKe
	bQUA==
X-Gm-Message-State: AIVw112taqvLytewBoPlypt11rZpXCP0qCK3BAG7BvXOeO7sLx2bt2qp
	zNbQEArIKq/kK8Ja0ZzqEiDcuhf25A==
X-Received: by 10.80.218.3 with SMTP id z3mr2526650edj.228.1501778914314; Thu,
	03 Aug 2017 09:48:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Thu, 3 Aug 2017 09:48:03 -0700 (PDT)
In-Reply-To: <CAJTo0LYbn44Eva+zF1k8KxXMr5atREEzXr_r6odbpiF7g8uf+w@mail.gmail.com>
References: <cover.1500357604.git.dengke.du@windriver.com>
	<dd968ff528a0928627a3bb12b4b1e8d77a1ff829.1500357604.git.dengke.du@windriver.com>
	<CAJTo0Lac01Ny9N5D0p8Qv+GCFXRNv0qF_BjGdXx4Q3zvc+1How@mail.gmail.com>
	<CAMKF1soL-B5ryhSUD9twYD6BUwSQOpRN37uxd=OkC9HNLQaC1Q@mail.gmail.com>
	<CAJTo0Lb0YdjLaVyLqHxfztCuYyrvEVAzXSZt5wZ7o=c_PXMh3g@mail.gmail.com>
	<CAJTo0La48UP4m0NRFM+TwrrpmTm1jR222yRaBfD=Nq7fNehg6Q@mail.gmail.com>
	<CAJTo0LYbn44Eva+zF1k8KxXMr5atREEzXr_r6odbpiF7g8uf+w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Aug 2017 09:48:03 -0700
Message-ID: <CAMKF1sp9gvOFaU9CB4SGvoNtsso5iBD6wXuakfDkXX+bW3YPng@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] expat: upgrade to 2.2.2
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
X-List-Received-Date: Thu, 03 Aug 2017 16:48:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 3, 2017 at 9:42 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 24 July 2017 at 11:23, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> I've filed a bug upstream about the failure on Debian 8:
>> https://github.com/libexpat/libexpat/issues/97
>
>
> And this bug is now resolved.  expat in git can read /dev/urandom directly
> if it doesn't find the syscalls it wants.

Sounds good. Denke, when you refresh patch please include this patch along

http://git.openembedded.org/openembedded-core-contrib/tree/meta/recipes-core/expat/expat/libtool-tag.patch?h=kraj/master&id=01929853a8346ba0fc27090150ebc506d1c5cd1e

which was not there in your v1.

>
> Ross


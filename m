Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.3778.1585049249249586707
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 04:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=sFLNCmvp;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=etaf=5j=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48mprF4zzRz5g;
	Tue, 24 Mar 2020 12:27:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1585049246;
	bh=7SfcgP4zNGcldcPBtRNqB+XpbTzSfUiLR6af7LXCY+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sFLNCmvpbA1PJ19X+S53TZwK0hfXotWzXMfXsn0AxUkARgMcGUCSSdnf33p51NLGJ
	 nwhuT0MfU4t0Iw0RKyIkXDo1PwxkW08B7twEGdqQrqYjYs78vrmizxTiGwYqjST6MZ
	 WfTlI3vLu3O4VTS4IyinKPU72aDUZrde/64RGsI1m5fuaBREMomWbgMy0pa7XPyXHl
	 70kCcjwLhgiZACIhXJHWz9fyUvYYj2+yCUtHW/OHM8rrSjlvhc3j7YFQLlrDzX7R+q
	 +w68ylg53cE3wSqw7Q2JX7i4onxm8fLR8sW6Gw9NcelRpIJ8t9s7TAMwfpREKbptBe
	 2JawKTWVHZsfBGIDhlQ+ulxQb4/A+Q4V91qj3TI23pdnciDAf6fAysA+0r4tkOLiMG
	 MbRWr/6PNp46ZPLhOqli9kwwiOPqKOLMUeAcQ0EJlibp2IH7r0F/2WO448ijmsxI48
	 Kf91Toh4TxKPAi2CMtpsJ9GCN09eqUvhyRcAh7tHGo2m4mGl5tc+zjU4x06K8HQzc9
	 YAOTOzdL3Ti7k2qH/E08fkeAXzqrAD75rtK8mYpmqYhPQmQ0faY0TfaXL+dBaF4/ZC
	 POjbpWZ90iwpdOdqOZ0xMV4+gA2Tn3UcVnahsk8jxX173J34vuX45VaimMeTxliZA7
	 ddABPnzz8rGradzWGHUmdia0=
Date: Tue, 24 Mar 2020 13:27:23 +0200
From: "Adrian Bunk" <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] lto.inc: Add global LTO distro policy file
Message-ID: <20200324112723.GA10278@localhost>
References: <20200323232529.3658577-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200323232529.3658577-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Mar 23, 2020 at 04:25:29PM -0700, Khem Raj wrote:
> Distros which want to enable LTO can utilize this file, it only covers
> packages from OE-Core, other layers should include there own exclusion
> list for recipe which dont work with LTO
>...
> +++ b/meta/conf/distro/include/lto.inc
> @@ -0,0 +1,23 @@
> +LTO_pn-glibc = ""
> +LTO_pn-gcc-runtime = ""
> +LTO_pn-libgcc-initial = ""
> +LTO_pn-libgcc = ""
> +LTO_pn-libpam = ""
> +LTO_pn-elfutils = ""
> +LTO_pn-perl = ""
> +LTO_pn-busybox = ""
> +LTO_pn-libxcrypt = ""
> +LTO_pn-curl = ""
> +LTO_pn-libcap = ""
> +LTO_pn-python3 = ""
> +LTO_pn-libproxy = ""
> +LTO_pn-libbsd = ""
>...

It would be better to have these in the individual recipes,
it is much easier to understand what is going on when all
recipe-specific information is in the recipe.

Otherwise this will end as an implementation of workarounds that
might not even be needed anymore, for a previous example with
several workarounds that were no longer needed see
https://git.openembedded.org/openembedded-core/commit/?id=8bbb17d2dcafa9b4e26941a55932f4be2782e1d1

cu
Adrian

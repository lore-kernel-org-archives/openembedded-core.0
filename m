Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
	[209.85.222.178])
	by mail.openembedded.org (Postfix) with ESMTP id 62C2F7E63A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 01:02:53 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id r21so64588850qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 18:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=17p1/jYuZ1rka4wnwn+W9TePLQjThx4c28NvkPKrNIQ=;
	b=cZVXPfSPcHvH66Ur0VjuUoOGBkk9F79Bs8hX+FpMpOBpmKJ7VOuxRuDEATVTXHSK3c
	DBGDC6ix9B5nWH3MaqhYaVl8+2BU7KyGLRGblPAtITZTAN9Um2ZseiU83VUy6Z9FQpDn
	CuMYz7wD4bpPiTSjMFtKecrj5f9T5o+3fV5uz597QFAHHS6AozMZwcp8tvdDg75sFYGY
	pnrjPezTG5es64wMpgkufhpzRCB1W11LxGGL4Mfh5d+vsyxvivKVtP2aK2rx44Uz+Cb/
	9yF1tnJQVXsJGzNx4Zu/euJ5WWYNJs3C9/NRPP1VPix+FF5azEn2uIjJ/Z9+zcxLHUZk
	7kMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=17p1/jYuZ1rka4wnwn+W9TePLQjThx4c28NvkPKrNIQ=;
	b=ohnD4PQ54Hf7glJ/98CTR7jDA7fP7mcgE6R6UzLmRE1enFpnRvD9Y1ONs0LITHPUSR
	tyd3Yd2RPSAtS5WKsUh7bawE3LsLfTGT8VdR7FdmdG04jC8G4iORWBj2a7qD9wIMAFX0
	FMYg50r0QKWHbyENgonN1IapQg4lO3aH4wIaGndvhX3mCT/p61k2p4ip9QXRBSrXchmX
	DS6XSPXtFz6JjWeyb7cSqZu0W5k2xpkdaGWDn0OG5J+MZUw8O3hRFoO9bPIcm55JaYCT
	EsiHClVd/l1Adg3jTXonGMsURvNjGjgHXNK+MMCI8zgUNFXK00Q4h007YsGTlr7ryaIy
	4tJQ==
X-Gm-Message-State: APjAAAUKPj9geSx5fjdUgIN3lP0Ocyw9TNO241mvP/rhvusIB8yBBmy6
	LzEAp/W7Cpr/4Qbh2ayi2nI/NP/EcvkXSw/U1O4=
X-Google-Smtp-Source: APXvYqyLjdW3zX/1DbOYAhcgw6ufuOycacy8EMVvPRYhTLsksBeo4PPO+vk2qC3gv2f+6dtUTinbbqkYcMphA4IpqI8=
X-Received: by 2002:a37:ef14:: with SMTP id j20mr6200736qkk.474.1565139773887; 
	Tue, 06 Aug 2019 18:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190806114717.6818-1-ross.burton@intel.com>
In-Reply-To: <20190806114717.6818-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Aug 2019 18:02:38 -0700
Message-ID: <CAMKF1spH3avgvz3NKLnJWSw_-XFViyuRoFbxPuBiTs=1fB7jmQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pango: improve ptest pass rate
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
X-List-Received-Date: Wed, 07 Aug 2019 01:02:53 -0000
Content-Type: text/plain; charset="UTF-8"

> -RDEPENDS_${PN}-ptest += "liberation-fonts cantarell-fonts"
> +RDEPENDS_${PN}-ptest += "cantarell-fonts locale-base-en-us"
>

this should be
RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-en-us"

locale-base-en-us
>  RPROVIDES_${PN} += "pango-modules pango-module-indic-lang \
>                      pango-module-basic-fc pango-module-arabic-lang"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


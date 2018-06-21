Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f173.google.com (mail-ua0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 71FEF74F8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 17:48:05 +0000 (UTC)
Received: by mail-ua0-f173.google.com with SMTP id z16-v6so2576227uaz.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 10:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OdaOJ1Q8hdtXE9n2Y9NvZM3bBsyEJ5EdG98Bh4ZFtKU=;
	b=kxvl3EZ1jyAulTJecvTtzGb+Ka2cUm8MCWicsBMB4PSwDAv3wqedjTwJoDC/qwgfph
	kKUvKGt+UkHmmg7tnCNHhNbckCXxKR5gBsytiz30ye9KgeWpJYHb9v3esuPrP+1CzevE
	aRkNF5xEOND6xg2MmMQxMgfHw6jzpBOGPpQKQO0sx6Nz+jQxYR54PhYbHTQNNfIJzNbl
	jKjgZ7WZdvHf6h/GbcB4T+hTABrozY3ZqkaMQ4ZeSkYTQlQ+tqX7A0enN5IHi4OArg4z
	eysyMOZa94YigRslUgPL5Homkd+O6VUMyz0csjkGvjqG0ZyRjHTiP3Y3E0UjJiRK8Nfp
	BDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OdaOJ1Q8hdtXE9n2Y9NvZM3bBsyEJ5EdG98Bh4ZFtKU=;
	b=kcnl2EppC8b7hEc2LulZX9SimCpYeqrdZnfMydiNVfgG604UZUKPcp8kEFNa7+Arlz
	ghwFQLJ0B83NW5Hw5YrOAdn6xaryi0tqm8FmeDfr/cRx9/pPOWhm3atuk1dWR0VghpkJ
	f1edMifoOefljq/x561YRW6n8nVUhnW6HGOSWE0CA2qvD4rXGA1hCcNA8JNN8y95m9MV
	ClYvH6j0TmStZlr03QwHtZsYaI+oxr426PYqZ4/69sIGj2hST0CpyactBe3LaKMBrRX0
	rnD/EAfa8IC7WOSWtTASPm6p5uy11ROW9sCuQvkJ7D6+KUvHDTtJTjdKNHM2ZukBlXgf
	m2Og==
X-Gm-Message-State: APt69E0Un/BTke/QAyu2vjSypRjFmPtqBvAURQ2nU0aA3ywTS34Cl5v1
	lJsu+yJGFDJPzfgoOQgXQWN16lXO22jSaNLnYHA=
X-Google-Smtp-Source: ADUXVKKh65BAGaTY0sbAiw+aClIPkRL2DuF7u+huYAb6gYaJlgPKUH+d5YTxwDW+kJFNgmVf4K6xQqbv2ig5a4t3Clw=
X-Received: by 2002:ab0:1048:: with SMTP id
	g8-v6mr15932956uab.52.1529603286179; 
	Thu, 21 Jun 2018 10:48:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Thu, 21 Jun 2018 10:48:05 -0700 (PDT)
In-Reply-To: <1529570060-22244-1-git-send-email-maxin.john@intel.com>
References: <1529570060-22244-1-git-send-email-maxin.john@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 21 Jun 2018 10:48:05 -0700
Message-ID: <CAJ86T=XB3MAAPU5_vJXXdMHO+84wi7-epjj9BEpXPDjKKf-7TQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] harfbuzz: upgrade 1.7.5 -> 1.8.1
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
X-List-Received-Date: Thu, 21 Jun 2018 17:48:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 21, 2018 at 1:34 AM, Maxin B. John <maxin.john@intel.com> wrote:
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  .../harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.8.1.bb}                | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.8.1.bb} (84%)
>
> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.1.bb
> similarity index 84%
> rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
> rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.8.1.bb
> index 0a9b029..a42bf8c 100644
> --- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.1.bb
> @@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
>
>  SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
>
> -SRC_URI[md5sum] = "1466ab51fc5aaa6af4065936939cec62"
> -SRC_URI[sha256sum] = "84574e1b1f65ca694cb8fb6905309665c0368af18a312357f8ff886ee2f29563"
> +SRC_URI[md5sum] = "97cb89c6e2a914c05c8b7e858703885f"
> +SRC_URI[sha256sum] = "fbed6392ddb085e45e6090a9f389f72926d0e355f4b0a2ef51d35cf21686df45"
>
>  inherit autotools pkgconfig lib_package gtk-doc
>
> @@ -35,5 +35,6 @@ FILES_${PN}-icu-dev = "${libdir}/libharfbuzz-icu.la \
>                         ${libdir}/libharfbuzz-icu.so \
>                         ${libdir}/pkgconfig/harfbuzz-icu.pc \
>  "
> +FILES_${PN}-dev += "${libdir}/cmake/harfbuzz/harfbuzz-config.cmake"

Perhaps we should move the cmake.bbclass packaging rule for these
files into the default packaging rules set by bitbake.conf?

>
>  BBCLASSEXTEND = "native"
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


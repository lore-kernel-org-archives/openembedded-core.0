Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id C43CE7E35A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 01:40:21 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id c15so506553qkl.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 18:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RgQ71pBw1YwtH3FJR7rwp50gpnKZm33fpJcEyoVsH+E=;
	b=GzfHPHo8lNZdo6x9Vw0VOlU3lYsjmtZlI7GKp3FGsNPxVXZIMXjMB6nmNP9x/KBmja
	Bt2941gXf0P7+SqRY56kwSspPQzdQpI4JU1cApZ+Zn6tuwY0ye6FaFKGyd+p8C0OSvMd
	fuRNq5kSQR9XGERXmR08q9vXhgz9Ttjam2n0aYajxkzfhkwOOXtXryS1alssERKrXUwR
	U4GJK953l8iqHWOdFbiPRBgrhQjYG92BQEtfiMxENDbdisCCZLcoFW7okem4PwHfEtdr
	4YWMvmttk4K9q3+iQQtFKbwshYLSu4rE02ZsBw31FRp+PN2ICBSPz+q3iUS82frBNjzD
	rcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RgQ71pBw1YwtH3FJR7rwp50gpnKZm33fpJcEyoVsH+E=;
	b=mGAwZT6trcefPeAjNyXJ2njm/R3Z4scoggQbLM+RdX9QjIwoty1fJYxpgXP6MyOqYC
	tfIvnb2ZrsPUghEGmFb0QmpPE2xm0Wrwxka/2tRthCRawTXxsKmXbcHxRAaE73Pv3ypT
	kkLcE5AaOfSNz3c27kFgq968TyON9KRXiofFmXF8zcYQ4uL+XgqwRleTp3qCvvuy6RIF
	8gCC9ktQ3cNBkH5pyW6tpvXuIu8nPSkbNttnNSVFqHfwmhDJUXmdC5JCLnZ4jr0EqlW4
	JOxKRJuRPCpKDUJB0pBXKz/8uGFNx3Nt5GNIeiIlQeddXRk6H9CBHq+51SAthxFwLEb+
	1anQ==
X-Gm-Message-State: APjAAAXNDMYZ/f30j4V9AnMBrrmIZ0QajR0kbDSvyK4WkPpiTeIfYlaH
	/6DCOUX6x36TrsTYzJQXXVtb8i4w90J5qJc6oqU=
X-Google-Smtp-Source: APXvYqwLsJRpQcNVa9Cr0jfPXs7Z3uW1VH1mjIV9arjMGf7vP8uf8xxkWhLkdlZ9NeR1RDvsHT2MVz/RY8E70TFRhvE=
X-Received: by 2002:a37:9fcb:: with SMTP id
	i194mr67062041qke.258.1558489222416; 
	Tue, 21 May 2019 18:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190521222835.23928-1-richard.purdie@linuxfoundation.org>
	<20190521222835.23928-5-richard.purdie@linuxfoundation.org>
In-Reply-To: <20190521222835.23928-5-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 May 2019 18:39:56 -0700
Message-ID: <CAMKF1sqeDzBq6x1uQQ8MrSY=WFLj-NhMnVGW03dHoi0FaXRKLw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] m4: Add coreutils and dffutils dependency for ptest
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
X-List-Received-Date: Wed, 22 May 2019 01:40:22 -0000
Content-Type: text/plain; charset="UTF-8"

a small nit
typo in subject line

On Tue, May 21, 2019 at 3:29 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> The scripts use options not supported by busybox utils such as head and diff
> so the full coreutils and diffutils utilities are needed.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/m4/m4-1.4.18.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/m4/m4-1.4.18.inc b/meta/recipes-devtools/m4/m4-1.4.18.inc
> index af0ff45863c..81ed65edd94 100644
> --- a/meta/recipes-devtools/m4/m4-1.4.18.inc
> +++ b/meta/recipes-devtools/m4/m4-1.4.18.inc
> @@ -53,7 +53,7 @@ do_install_ptest() {
>  }
>
>
> -RDEPENDS_${PN}-ptest += "make"
> +RDEPENDS_${PN}-ptest += "make coreutils diffutils"
>  RDEPENDS_${PN}-ptest_append_libc-glibc = "\
>       locale-base-fr-fr.iso-8859-1 \
>  "
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5DB9B60269
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 19:40:34 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id r18-v6so12448355ual.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2018 12:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=MpL91NrolqmiQlRJWk/ANQja06Ze5Q3UyOkq02m6kvg=;
	b=B9HsPM4/zHLGaZ25k2k2jo2ndzV4OAWekEkQJ5ZE6WPGDRj0QesvPz3jG6mJu6xsmK
	N0muTKKzebaY1RM8q2/vo96nyWHQeie1yiDhzxhQFbT53ezInftqjBSHoaEZC8q84g6x
	BpGY4zPxi4k6W9/x7gSVJWG5r63hSoI56HkVxVgwPzQfkrXoOUAYsknK4/1/XSq/rJFy
	Qj1eYNIv7QDoQdLiac3EIck7OxFA5iVsVvrVhpKSx8dVUyITOuttrpvTwiZ9oGEvLMJm
	FGX0j6kCJAFTmmC0/58Irt2VB72KALgHGIrOTBGphZbp4SjK9oKB3SuBce7jYfS6G87f
	9vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=MpL91NrolqmiQlRJWk/ANQja06Ze5Q3UyOkq02m6kvg=;
	b=rpTlqtkmEKdohFEneXqty0xogFKEJtDAPS+etY53ehqG3REhL3o98lOd+YnjdoFxm3
	jNTjfS50agoeymG5Y5HJIdnI3gdkXvx44Qrz7zPQGSoj5pXRDSDc8yPQ/71DpqIf9N3v
	hRGPQKyyVTNaLb88rHeaHKaL2NfACTqFSu5MQYG2aTC2hMpZ/97330LMcIR4YxpHP56r
	hK7amyyAP+X9ceIwD0tzomew31LoqXTp99FYSBS2MiIKQbL6B+FSCd/QRScSXxVj5M36
	tmFavKW7yREJ2NbQvupqGGalgd6idOx0y5bCsy/BZt98ArmhspDD/1vcZMBSrEqUxgpm
	kkuw==
X-Gm-Message-State: APt69E0QMPYB0PlR5L0f78yiEPb7ZhjWKqHfQLt1PnKPZ/yoSoIyWwLQ
	Cqqd9MQAnTI3pykiml80fhirHwSglhPD9bdJYBKN4w==
X-Google-Smtp-Source: AAOMgpdaC3K4j1tMbuG4XjMAYakvNranT3S5bPV+OHNfWDxQdLLOpaIyXEH1Yq4DBntLEAOyju4LumwzhmgcU8QaRSs=
X-Received: by 2002:ab0:136c:: with SMTP id
	h41-v6mr14651259uae.193.1531165234037; 
	Mon, 09 Jul 2018 12:40:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Mon, 9 Jul 2018 12:40:33 -0700 (PDT)
In-Reply-To: <5af302bc.1c69fb81.44885.4061@mx.google.com>
References: <20180508164658.2935-1-taborskikrzysztof@gmail.com>
	<5af302bc.1c69fb81.44885.4061@mx.google.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 9 Jul 2018 12:40:33 -0700
Message-ID: <CAJ86T=Wxh3SzsATsvtB8+CWadp=hjEBXTt1XnwYMFJ4zmVaQ1Q@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] perl: native modules will not trigger build perl for target.
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
X-List-Received-Date: Mon, 09 Jul 2018 19:40:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 9, 2018 at 7:16 AM, taborskikrzysztof
<taborskikrzysztof@gmail.com> wrote:
> Can I request review?
> -------- Oryginalna wiadomo=C5=9B=C4=87 --------
> Od: Krzysztof Taborski <taborskikrzysztof@gmail.com>
> Data: 08.05.2018 18:46 (GMT+01:00)
> Do: openembedded-core@lists.openembedded.org
> DW: Krzysztof Taborski <taborskikrzysztof@gmail.com>
> Temat: [meta-oe][PATCH] perl: native modules will not trigger build perl =
for
> target.
>
> Currently building perl-native modules triggers
> build perl for target due to PACKAGES_DYNAMIC regex.
>
> This commit will cause, that perl native modules will
> trigger perl-native build.

Can you give an example of how to reproduce the problem?

> Signed-off-by: Krzysztof Taborski <taborskikrzysztof@gmail.com>
> ---
> meta/recipes-devtools/perl/perl-native_5.24.1.bb | 2 ++
> meta/recipes-devtools/perl/perl_5.24.1.bb        | 2 +-
> 2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
> b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
> index a9ab17d16c..71f45890b0 100644
> --- a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
> +++ b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
> @@ -135,3 +135,5 @@ EOF
>
> # Fix the path in sstate
> SSTATE_SCAN_FILES +=3D "*.pm *.pod *.h *.pl *.sh"
> +PACKAGES_DYNAMIC_class-native +=3D "^perl-module-.*native$"

This usage of +=3D with an over-ride is not correct.

However, regardless of that, was this change actually needed?

If you know of a -native recipe which depends on a
perl-module-XXX-native package then it's probably a bug in the -native
recipe. Having perl-native pretend to provide perl-module packages
probably isn't the right solution.

> diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb
> b/meta/recipes-devtools/perl/perl_5.24.1.bb
> index 53a426289a..4c6a71082f 100644
> --- a/meta/recipes-devtools/perl/perl_5.24.1.bb
> +++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
> @@ -339,7 +339,7 @@ python split_perl_packages () {
>      d.setVar(d.expand("RRECOMMENDS_${PN}-modules"), ' '.join(packages))
> }
>
> -PACKAGES_DYNAMIC +=3D "^perl-module-.*"
> +PACKAGES_DYNAMIC +=3D "^perl-module-.*(?<!\-native)$"
> PACKAGES_DYNAMIC_class-nativesdk +=3D "^nativesdk-perl-module-.*"

This usage of +=3D with an over-ride is not correct.

> RPROVIDES_perl-lib =3D "perl-lib"
> --
> 2.13.6
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


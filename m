Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id F3F7C731E9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 07:27:31 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id q21so12435091iod.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 23:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=FTR9ncE2LZq270Ab+O4+2PRLAXYbrivS5mS9G6ppf0Q=;
	b=up4uGYuw0OCqjHj7ALku3qe2QxKnJoJe3BzAuWcxS4TXErVfQp5t88c67tvKobubhi
	9MOUGQAeusVxFsmhfs1KNYsDyhM7jBBPcGdKsnKcPeC7eKhgxvCeGDobhl0gbHyCTgO4
	9fKzNLT0eHv8A6i1kBeJ+QkZJ7w3KrgFtQ0v0acNAUVuK0GMzcRC7lIJ9mgoL7e5EMPd
	IKd/y/5Y1i7z/bs/KZYL/wpe7Idcqq0mHYFrIFUNYSLcqxfjOPSiykJ0JkF7DFa0Hi7f
	4+XADVlHCBmgDGKpGMVGgycvlCo+/0QpobVSak02JXlIBczbQcUBphl2Okaf5+TIhb3Z
	5DDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FTR9ncE2LZq270Ab+O4+2PRLAXYbrivS5mS9G6ppf0Q=;
	b=Dxzc+f1SwqR1qHMMzXHw37SfId3wxRfClLkvvq0oywW17WJBwPcc2ifxmfqelf3Orb
	GzoIKwXticlcABzPP4Q5JMOnp4ghDfC+A2GhQTfbUnT/KUzGrbrccr34SZCBlEQ71y9/
	DMIeh2Od848ZSHb4GsoejTcB4amkD82M8cp/Gvh79Grgz2f68rwHx4kDZ2CuF3stMusO
	y4arILYTooDBWGxhDXp1+wfS8AY0XKKEJdFYQOrwqD3Ow3cjSFhqUqNZsI6CMCS8MiCH
	zRxTgkJCZSbL3log31UgESMvAeJk4IrJIPqWV/b04PZ69scQO1fczIgj5w8WONGSSuKk
	8y+Q==
X-Gm-Message-State: AG10YOQctS/Qaa4THlVzavOI4FXgVQVqVJox6ee/7auuO5ZT+60Rfw6zzdTlisepFOaiboWr0gLzwMAyvK5VMw==
X-Received: by 10.107.9.224 with SMTP id 93mr14724439ioj.112.1453706852121;
	Sun, 24 Jan 2016 23:27:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Sun, 24 Jan 2016 23:27:02 -0800 (PST)
In-Reply-To: <51f0a96271229055e28dfe5ab12a29559c474614.1453703961.git.kai.kang@windriver.com>
References: <cover.1453703961.git.kai.kang@windriver.com>
	<51f0a96271229055e28dfe5ab12a29559c474614.1453703961.git.kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Jan 2016 23:27:02 -0800
Message-ID: <CAMKF1sohABk==LdOMgph7JyHaTH2B0-=5ODtFy49-BJHbcM4Lg@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] wget: inherit perlnative
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
X-List-Received-Date: Mon, 25 Jan 2016 07:27:32 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jan 24, 2016 at 10:44 PM,  <kai.kang@windriver.com> wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> In wget 1.17, it add option '--utf8' for command pod2man to create doc
> files. pod2man doesn't support that option on some host such as SLED 11.
>
> Inherit perlnative to provides native pod2man to fix this issue.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-extended/wget/wget.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
> index 049b898..f749958 100644
> --- a/meta/recipes-extended/wget/wget.inc
> +++ b/meta/recipes-extended/wget/wget.inc
> @@ -7,7 +7,7 @@ DEPENDS = "gnutls zlib libpcre"
>
>  INC_PR = "r16"
>
> -inherit autotools gettext texinfo update-alternatives pkgconfig
> +inherit autotools gettext texinfo update-alternatives pkgconfig perlnative

what happens for wget-native ? Does it now serialize the build ?

>
>  EXTRA_OECONF = "--enable-ipv6 --with-ssl=gnutls --disable-rpath --disable-iri \
>                  --without-libgnutls-prefix ac_cv_header_uuid_uuid_h=no"
> --
> 2.6.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


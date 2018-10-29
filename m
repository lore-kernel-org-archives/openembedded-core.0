Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id A9784746AB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 13:05:03 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id o89so4826402qko.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 06:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kVG8mrd99vv0FvhRkikA+N/KoF27dj7rzBCpTd7/cxo=;
	b=lJNl4hHsWWOMCm8kHu2j+HF0LnS7TRGtfNxQPF86e4GMp33GyymOTQp60tMHbxlJSo
	p7VDxqe1xdKoh9Y5MqIlID+wG+QFfCKkIY94bqXW0kzIu9ot01IozNKvW4Bz3WmmG7I3
	OpPeNg0ROCcYGPaVkzwny0sCgtmSOvaC5vJAVnHsKjXOQuooHKEezUAo56KLjtAsUcUk
	JR7LBpWwHXkKOpy3K2505eSwTobfgPnA2XUvJnyVSMR8rVSM1/7YhQ+OTCPqw8SOOFBy
	Jr8rWgBUWAcK3svD1sLAUAtpxXpMOyIAVZFTYMEE+2L8DQ7hYMLb70GgqihYp26eBBHt
	GzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kVG8mrd99vv0FvhRkikA+N/KoF27dj7rzBCpTd7/cxo=;
	b=PISvVhGO5dYm6k7Rt2V8NzKkFmj1IeG7Lr5F/Q8TLqS6DzozR2jN96uXxX1qmurg27
	K7bao1BZ2hFEcQJUW9Na0sn6iNYHPUsRULKE+uvN8WhUSP7HjcxK5eX+OzFfPqIx+STJ
	tTozkNpaQm3cvv3cuUJRNeiMghp04L6WEpI6ppXbH+LA8bLCmEftzb/mYHzhB+uU3ww+
	/hgKWnHALvs0bhhaMx/iHp1ohn6Rzj271SuuCdZjyS6mAYcvZBzgJOdkVsKvhJMRtR/Q
	Dg4YEqoDS2f5DBWg2y6lTY2V9iWfBxf0fESUdJzjqpOUFwwy/fLgj54E+cL8jH5HrfkD
	G9zA==
X-Gm-Message-State: AGRZ1gKI87HFUFN7k5aHpL9GKWZ4iMxMX2ylLr961PofcOyzkoQoG3cU
	cl1Xcz000pfGzZgsQYcI/rxiAdKBgy1IQ1toWiU=
X-Google-Smtp-Source: AJdET5coVxCvEanpEDVoyya0Uk8QOWzRio/Ca+PcTi/UKBBz/Fk9toGqEQ6tWUvhrHDkpt8u/RVGt2uxCVJltwNSn3A=
X-Received: by 2002:a37:d408:: with SMTP id l8mr6933472qki.315.1540818304276; 
	Mon, 29 Oct 2018 06:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <1540794783-29850-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1540794783-29850-1-git-send-email-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Oct 2018 06:04:37 -0700
Message-ID: <CAMKF1spHdu_NeZVQigkOdSVAM8=x9hMPDughv57506WH_v_RQA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxcrypt: tweak branch from master to develop
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
X-List-Received-Date: Mon, 29 Oct 2018 13:05:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 28, 2018 at 11:22 PM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> The master branch does not exist any more, use develop to replace.
>

this is ok for thud as well

for master you can update to new release as well at same time.

> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-core/libxcrypt/libxcrypt_4.1.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.1.1.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.1.1.bb
> index 61ea22e..465aa96 100644
> --- a/meta/recipes-core/libxcrypt/libxcrypt_4.1.1.bb
> +++ b/meta/recipes-core/libxcrypt/libxcrypt_4.1.1.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM ?= "file://LICENSING;md5=cb3ca4cabd2447a37bf186fad6f79852 \
>  inherit autotools pkgconfig
>
>  SRCREV ?= "21b455b68baad279e6a3936faced16c5e5634376"
> -SRCBRANCH ?= "master"
> +SRCBRANCH ?= "develop"
>
>  SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH} \
>             "
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 72D106FA94
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 15:08:48 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id y20so433077ier.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 08:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=9jAQXqJwo0YFD2HwlDaVZbcY8zvg1m75UUj05dZpArQ=;
	b=bFZ4gNWeWvQiFb2qVgFff0H4u7p+Ai9QA0C6dv7DmADyrCrkwJhwObi1sVw+ZvNBSJ
	rqYirwDhU9uGPfOt7h4y6SEar4ZFpYG8Q5V9mw9FHuC4EJQohwjTwM515gT8KjtaXo0H
	CgL9ZCqvD8XBQaiTxV75LcDYwb0cVjvAxTdhfo91Gdes7BUIy9VMi0Afa3n1Zj5DNNAx
	cNpMS3aZ2+lATOVccRoYx5w1ez/XcUt8+k6BqQFMbL95SLl/0YTXoxtG2E22cW+vdiC6
	oEvmmtTGNMZFxjgzOlm3eO9pZ6MdryYYIgvPehpJSQ1HjDaqvAVGtET+GjpEyuvqq7j0
	f/WA==
X-Received: by 10.50.56.38 with SMTP id x6mr30419959igp.30.1409152129011; Wed,
	27 Aug 2014 08:08:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Wed, 27 Aug 2014 08:08:17 -0700 (PDT)
In-Reply-To: <1409151022.29296.7.camel@ted>
References: <1409151022.29296.7.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Aug 2014 08:08:17 -0700
Message-ID: <CAMKF1spTdX1Mom+X5LOt5-pRpCMUuNmxTpvfQ+VOjVaasNrS=w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] patchelf: Add patchelf recipe
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
X-List-Received-Date: Wed, 27 Aug 2014 15:08:55 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 27, 2014 at 7:50 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> This is useful since it allows us to edit the RPATH and interpreter fields
> in ELF binaries. This is potentially particularly useful in improving the way
> we can use the SDK and also potentially making native binaries more relocatable.
>

Long ago I had a patch series to replace chrpath with patchelf see
http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/patchelf

can that be considered now ?

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/recipes-devtools/patchelf/patchelf_0.8.bb b/meta/recipes-devtools/patchelf/patchelf_0.8.bb
> new file mode 100644
> index 0000000..446e013
> --- /dev/null
> +++ b/meta/recipes-devtools/patchelf/patchelf_0.8.bb
> @@ -0,0 +1,12 @@
> +SRC_URI = "http://nixos.org/releases/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2"
> +LICENSE = "GPLv3"
> +SUMMARY = "Tool to allow editing of RPATH and interpreter fields in ELF binaries"
> +
> +SRC_URI[md5sum] = "5b151e3c83b31f5931b4a9fc01635bfd"
> +SRC_URI[sha256sum] = "c99f84d124347340c36707089ec8f70530abd56e7827c54d506eb4cc097a17e7"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +inherit autotools
> +
> +BBCLASSEXTEND = "native"
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


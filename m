Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6F53879864
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 01:43:47 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id q7-v6so3396832uam.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 18:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bK7ciktD9GcI7Yt52aiblHU22X2INGh/gDYcgkhXTdo=;
	b=sn2qAf/hhmzCwdsvrwEhoAWIgwyWqeGad76MY3/J294wSvRhIl2IhRyjU4Hwq8rsD1
	R8ekKiMrJVj/VBu/Oaz1ZFPcWs8xiNMKaWwh1WTTYcZzNQs71s/DP/bLGb4y93NlWOy2
	IMIVp53yIbmf0/5n9i0xUHxQ9Ho9GVJfaSJNhMhUTjvuWzN2lXIYgmnoPocHk26Vq1iR
	3rN+yITVapX8fhhuN1OX6uW4+/nHR5NavFf4NLHKDQyTgRBx4A1VWHzIr1lE3snEwh0N
	wTfJNozk8kZYt/VAHqldbxXo8Q7XJw8WISo5BJ/D3kay4XdcJeGBzZzLhbd83ig6dXUM
	M9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bK7ciktD9GcI7Yt52aiblHU22X2INGh/gDYcgkhXTdo=;
	b=DtkQGqN/MxYjAR/8sraIQaoIUrfXt59Fh1qrsPoB2xDfZS7oQa+2/4eyW5Rx7AtTZZ
	gcIN/472il2ZnJS6VbiiIeBa8kXn5FYLXO1txzj3n/rR87sqW2mj3SE7POsNY538u66J
	FtNUk99HtkAFOTGlXaZ2H9GkTMdosp99zkH3AecDFGNsGkulyvNYTkXq8MT9gZH455CG
	T57/aVB6UZgLAkko7IuzPJv2qwfR3MWzKtNSLv98fM7H52Xi7V+GstKzTWKh/vmHT7PM
	D+FMp+4qET+vrMs5JwbXm1KCQ8oMOumGwSGsRurRjSDwCIUDjKEadKOZvT6qCUEQncZC
	8+jQ==
X-Gm-Message-State: APzg51ArkebpN5QRgEaGpssNm2QbsbC17yb2UiJ6n9dlZydIe6CX2LyO
	eh/cvXYZVHgZzHQ/cUWf2H82s6X5H4bUDTUQT54=
X-Google-Smtp-Source: ANB0VdYVB04XWBZmWLAK5a9UcFdPWFio3HErjWLp37jxBUbGcOrCEYBVoZvFkd6HL+OCIZ1l7mVkfhzu18LJsc4fcHg=
X-Received: by 2002:a67:e2d8:: with SMTP id
	i24-v6mr1896435vsm.115.1536803028289; 
	Wed, 12 Sep 2018 18:43:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2904:0:0:0:0:0 with HTTP; Wed, 12 Sep 2018 18:43:47
	-0700 (PDT)
In-Reply-To: <b0f6196af47cab59f634fbffea7121a684dd4ad0.1535451643.git.alex.kanavin@gmail.com>
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<b0f6196af47cab59f634fbffea7121a684dd4ad0.1535451643.git.alex.kanavin@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 12 Sep 2018 18:43:47 -0700
Message-ID: <CAJ86T=WUsMLzufbSedhojX-bNSb36aAXeoMbBTnNpP7jPAvFHg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/6] openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the default version
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
X-List-Received-Date: Thu, 13 Sep 2018 01:43:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 28, 2018 at 3:23 AM, Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
> From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>
> I believe the time has come to do this: openssl 1.0 upstream support stops at the end
> of 2019, and we do not want a situation where a supported YP release contains an
> unsupported version of a critical security component.
>
> Openssl 1.0 can still be utilized by depending on 'openssl10' recipe.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>
> ...
>
>  BBCLASSEXTEND = "native nativesdk"
> +PACKAGE_PREPROCESS_FUNCS += "openssl_package_preprocess"
> +
> +# openssl 1.0 development files and executable binaries clash with openssl 1.1
> +# files when installed into target rootfs. So we don't put them into
> +# packages, but they continue to be provided via target sysroot for
> +# cross-compilation on the host, if some software still depends on openssl 1.0.
> +openssl_package_preprocess () {
> +        for file in `find ${PKGD} -name *.h -o -name *.pc -o -name *.so`; do
> +                rm $file
> +        done
> +        rm ${PKGD}/usr/bin/openssl
> +        rm ${PKGD}/usr/bin/c_rehash
> +        rmdir ${PKGD}/usr/bin
> +
> +}

I haven't tried it, but does this mean it's no longer possible to
build openssh with an OE based SDK?


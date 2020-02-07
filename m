Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3B4D660266
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 23:08:25 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id w15so495296uap.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 15:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XUH3mRO+9ouyRM5I2EQRHOnfde6tzqLOMHw+37xW6ew=;
	b=konw6CeUxSaqbWKwv/CXyMZNL+l2StndlBlVUlL8rWTQe7351CL6e9vunUrUU0hlJQ
	7A3fKuqqaU0gV4ETsortnIf88P27+4ZIzutEqFjdwuTKe5t/8fjVVWTcl1JSQtIKgMwF
	YA9f9t/VZoTZrdGsTD0IfEBNt2SM9/stkqfFl6NMVjGyq9w1+mKDwJVRLFiIQWXegePN
	DxyuOduCoo2xFgF3A8YLq9U34GikYKcw6HdQoHHWAy+2cmBY0SWq19VX/6DmAdrYGuAJ
	1ymc3j738RTfurE7DdgrGo8IV26XgA3Zo/WEvykdUbP09FNtmAZ51ZlkD+JSGiNhO9LB
	jDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XUH3mRO+9ouyRM5I2EQRHOnfde6tzqLOMHw+37xW6ew=;
	b=bmaWk6kOanUI5+88hRfcID4sxDSoxpffEfYSX+aKqZ1GULGgma1OZ8dZ6oA3O3SnyR
	6zOAwAGA7jrLTnslB69hsKXprbGIXt+s2kUAYdSHLzQ0O3lczDH2W6gvY42y9TIp0SdA
	eYZzlWkvixJJvpECF2ldybpB+tFMI3rhvIYPfuoAKRy7QE+MEd5Kz8YMSMMP8OUOyf72
	u+x0aim5RGbafJuKg9k5dQo1U3ve+N8E7n2fWnqYvdcrgIhAYqyB4feZcXBimSGM3e8A
	4LnwmSUeFmcd9C/o2BxdZyg0lDxdlPnvMzJlK6HJx1LZ9WnIfVFJUXsEhO5kNROTBwe9
	dgfQ==
X-Gm-Message-State: APjAAAUKbG/6U7TyqsrnrKZcvPeDAi5s1pWKiwv3F8dXBF06ylSyl9FO
	7bu+ygcAedxO8eLVNpPbcn+NPaJEqIthIhUhe2g=
X-Google-Smtp-Source: APXvYqwuSIgkT/cKeVQ4qJ48YDma/3ViW+uPMdaBLg2b8moAu7yA4wp1zZjA2BuxgCx763zC50gXVDRlehsOKgdd6nc=
X-Received: by 2002:ab0:710c:: with SMTP id x12mr674826uan.81.1581116905992;
	Fri, 07 Feb 2020 15:08:25 -0800 (PST)
MIME-Version: 1.0
References: <20200207213440.10462-1-scott.branden@broadcom.com>
In-Reply-To: <20200207213440.10462-1-scott.branden@broadcom.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 7 Feb 2020 15:08:13 -0800
Message-ID: <CAJ86T=XEWm-VKdU6LF_efuBsSuFRnu9weNTX7fg0hLLsOZZkyQ@mail.gmail.com>
To: Scott Branden <scott.branden@broadcom.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x265: add x265 recipe
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
X-List-Received-Date: Fri, 07 Feb 2020 23:08:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 7, 2020 at 1:35 PM Scott Branden via Openembedded-core
<openembedded-core@lists.openembedded.org> wrote:
>
> Add x265 recipe from latest revision of stable branch.
>
> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> ---
>  meta/recipes-multimedia/x265/x265_git.bb | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta/recipes-multimedia/x265/x265_git.bb
>
> diff --git a/meta/recipes-multimedia/x265/x265_git.bb b/meta/recipes-multimedia/x265/x265_git.bb
> new file mode 100644
> index 0000000000..7c230e2b1e
> --- /dev/null
> +++ b/meta/recipes-multimedia/x265/x265_git.bb
> @@ -0,0 +1,21 @@
> +SUMMARY = "H.265/HEVC video encoder"
> +DESCRIPTION = "A free software library and application for encoding video streams into the H.265/HEVC format."
> +HOMEPAGE = "http://www.videolan.org/developers/x265.html"
> +
> +LICENSE = "GPLv2"
> +LICENSE_FLAGS = "commercial"
> +LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
> +
> +DEPENDS = "nasm-native"
> +DEPENDS = "gnutls zlib libpcre"

What's the final value of DEPENDS you are expecting here?

> +SRC_URI = "git://github.com/videolan/x265;branch=stable \
> +          "
> +
> +SRCREV = "4ef6b67fd46e1584e52a11a264812edcaef02526"
> +
> +S = "${WORKDIR}/git/source"
> +
> +inherit lib_package pkgconfig cmake
> +
> +AS[unexport] = "1"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


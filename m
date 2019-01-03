Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id A096879F4C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 22:33:10 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id e5so38564426qtr.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 14:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oB84FKMcPYS4od/fwq9iFHB/HiU3E6pr+ajzQntsJgM=;
	b=S6CVhmZE9PryD2h6Ryvlh9RyzOTDA4vx9M0VR7nlviQ429v0nuhbcs2yt6YzTxT0dS
	+cjNDnSyxi0a0mi4Ad1CjL33Kj9iVwY30CAcXhVvz13tQNdeyipCb5detljyDEQrKGFo
	QJDVX34FEFTvMDzvpNd0JNhyW8MDleFhTfYIK6DXBdr+AbMfQHue8SmUXZ+VhGFBC8hk
	ivWfeL1FIkOx9YsKzcJhIuuGRAxI4zBqtcRN7knF6wh7SvyEZizZOew6c60iTwVO6OVX
	xoNyePQqJngiNGSXRvuThV9dcjUzJoOqeJ82MR+wosVjwNSTMmFauvDSkAWZwtulPii2
	kqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oB84FKMcPYS4od/fwq9iFHB/HiU3E6pr+ajzQntsJgM=;
	b=To/cVCQRMjWnaLvZ6G8yWhydwhXlyRKVfnpf3kVatSzyIUIZl24X179OsQwLRegCTq
	KtFCDYcROv76r2LSzSAWEBGnwc+fSl9Tpdf672tz5cfxO7MH2c7zOPAuhrApkm2kz9kZ
	1p60MJePVs4UJFJn34INUulsc1GHKJV5BMEsSAiv/9Qyjxq7ckTAzIomX5dKsKn0ks/y
	I6bB3991gPgdJTJMRwLkw+B8ZVRv4VWhjUr4vgOYYUqjpzsniI5GCJ+c52PhMIi7fNsv
	2aFEc9uhtkGMV+LJHb9vUuK9bupR32vVSeY8akPOdOjRDIH+gpEOJDM1fObm1kykyf/o
	pEfw==
X-Gm-Message-State: AJcUukc5oul7yYU8wJRnhhiZWePnUl2rq3bwaGjru0Hb+x73cSUwIEXz
	LyDgNqVZTKeqX1qEc7dcwLo9SwqjiIyci+xxo7w=
X-Google-Smtp-Source: AFSGD/V5IKMJTiqZmyLy0mdiXCtofoVF9+UMs4GoAcV+mBEuHRK2U/tXWv3KwDplf07gdNUT6mWcOHj6nw+iTNsyTDM=
X-Received: by 2002:aed:3a22:: with SMTP id n31mr48336340qte.29.1546554791354; 
	Thu, 03 Jan 2019 14:33:11 -0800 (PST)
MIME-Version: 1.0
References: <20190103223016.17799-1-alistair.francis@wdc.com>
In-Reply-To: <20190103223016.17799-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Jan 2019 14:32:45 -0800
Message-ID: <CAMKF1sqHkyX6dvC6WWZW-LtDthFDCvFEfd5VP2d1STSeamx+EQ@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] swig: Fix the build
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
X-List-Received-Date: Thu, 03 Jan 2019 22:33:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 3, 2019 at 2:30 PM Alistair Francis
<Alistair.Francis@wdc.com> wrote:
>
> Fix the swig build by calling autogen.sh before running configure.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/recipes-devtools/swig/swig.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/swig/swig.inc b/meta/recipes-devtools/swig/swig.inc
> index aec544997f..49da68c544 100644
> --- a/meta/recipes-devtools/swig/swig.inc
> +++ b/meta/recipes-devtools/swig/swig.inc
> @@ -11,7 +11,7 @@ DEPENDS = "libpcre"
>
>  SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
>
> -inherit autotools python3native pkgconfig
> +inherit autotools-brokensep python3native pkgconfig

this seems to be going backwards.

>
>  EXTRA_OECONF = " \
>      --with-python3=${PYTHON} \
> @@ -45,6 +45,7 @@ do_configure() {
>      install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/Tools/config
>      install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
>      install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
> +    ./autogen.sh

may be just (cd ${S} && ./autogen.sh)

>      oe_runconf
>  }
>
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


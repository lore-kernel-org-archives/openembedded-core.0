Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1DB78731D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 17:11:45 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id t8so94838438vke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 09:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CfL/uW9ggMcY0wY0pIuz1eF74waWFmuFwkDGJ0eAGaQ=;
	b=YnXXQdv7QDPb0bmsD5QuZTwVfHpaKs1G6zWDBEKDEpPZg41lRK+4I+WkY6tjwBChWK
	dN90yCQ2hAQXXBHr6QsSLeLBRW1I+fW4Av6nTONr9/9Evn4n0/1/ImU8g3/xB/hhTuU5
	oOLtSeNcFCKmRIcAspCeDLM5vrdkRfbHu6mmtSLXF8BDCe/tlidXl9gtxnLUYlp/nMPZ
	iHuz96Sr/+HzZkBLA53p3u/GrhjpEKObGxL89NuZ4ZIViUPQoWnIPH5rlOyOtOZv60Hk
	TVkJRVIUS8H2c6FIEFL81Ycl/P3zI46DDuzKRxtDy59VTAggQvDS7XetmUXdC4JewGDJ
	R60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CfL/uW9ggMcY0wY0pIuz1eF74waWFmuFwkDGJ0eAGaQ=;
	b=f6gWH8E/IBjsbTeij+gbTBG2kDa4o6YRn0pUjh1cTijNSZemiQjC+UFl4g4mf5I3zC
	RoPeYM8AHQ3AusccczoyjnxO+3uTRjaBNYKZoVLUumAfNzgmkYJMFznFl1HAId/5wBim
	XDFd3xquqHI9S97Yv+GOLH4K4hm0xW0d3HQKMc4R9YWl53sf7FaJVGWqG3ZlXRApAld7
	JHN4OfbjaDT0XgykGGGE2ulo7RLcauB8sD8dE3lTI1TQJBIJQureL76q2sOoZn9krkUB
	4E3y0VesPYCIk04TQYiw7QBi/TXeUohp4MYcCbvU7hnOpBIaIxV3TYa62zFkZeKDyd3f
	SDDA==
X-Gm-Message-State: AIkVDXJ/Snl8DPM2VeXztPlEVudnib3x0nbUJ2JTJmkyTG+opkZTQn1Bi7rka9hQhKmlKMXcXJ/NuxnWd1lp/w==
X-Received: by 10.31.234.199 with SMTP id i190mr13475260vkh.31.1485191505978; 
	Mon, 23 Jan 2017 09:11:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Mon, 23 Jan 2017 09:11:15 -0800 (PST)
In-Reply-To: <1485176279-1373-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1485176279-1373-1-git-send-email-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Jan 2017 09:11:15 -0800
Message-ID: <CAMKF1socZ7RtN+0UcLtmGF9GQVcEP8LXjCVxA3Y3feeHKtokhQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tremor: Use mirror tarball instead of svn url
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
X-List-Received-Date: Mon, 23 Jan 2017 17:11:46 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 23, 2017 at 4:57 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> This is the only remaining svn url in OE-Core and building subversion-native
> for things like the url checker is wearing and slows down builds. Since
> this rarely changes, use the mirror tarball instead.

Do we explicitly add subversion-native to builds ?  or is it going to
be removed automatically now that there is nothing needed it ?
subversion-native should still remain though for other layers to use.

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-multimedia/tremor/tremor_20150107.bb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/tremor/tremor_20150107.bb b/meta/recipes-multimedia/tremor/tremor_20150107.bb
> index 937894a..96834bd9 100644
> --- a/meta/recipes-multimedia/tremor/tremor_20150107.bb
> +++ b/meta/recipes-multimedia/tremor/tremor_20150107.bb
> @@ -13,10 +13,15 @@ RECIPE_UPSTREAM_VERSION = "20150107"
>  RECIPE_UPSTREAM_DATE = "Jan 07, 2015"
>  CHECK_DATE = "Aug 12, 2015"
>
> -SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=19427;protocol=http \
> +# Only subversion url left in OE-Core, use a mirror tarball instead since
> +# this rarely changes.
> +# svn://svn.xiph.org/trunk;module=Tremor;rev=19427;protocol=http
> +SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/Tremor_svn.xiph.org_.trunk_19427_.tar.gz \
>             file://obsolete_automake_macros.patch;striplevel=0 \
>             file://tremor-arm-thumb2.patch \
>  "
> +SRC_URI[md5sum] = "b308f9598176c0b5059c0124ab122afe"
> +SRC_URI[sha256sum] = "2196802e1635f9ac4474eeee0fe4da12e6c1ad3942862427a67268de2b65b1d4"
>
>  S = "${WORKDIR}/Tremor"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


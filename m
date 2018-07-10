Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8CD9474813
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 23:48:13 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id q11-v6so20421129oic.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 16:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=531R7aGbM8NFJNuQXhCNkIXMpx36z4hYWHxp4bmu0ug=;
	b=lc/P4fSvxNHq5pypb1wysnG7Gcju35HRBucPngg/fXI53AeIZ4AulWtwVY5CqupZ7J
	kafEC8tbVOMx9r/+YZg5BEkvf4ap1HgEl2JLQD5ZRBsWmxs+AvDV50pRtL5csA3hz9fl
	NhfBZ7x746iJ79mtWMsH/QNcmUUud66AolY7WV8qFQ6bMy2OS/83VpbdZJpOspx8O5dP
	uNpkRFNPv7nberUtC+1MPsc+HaHMN3QE00BNIoVlQzwso9nj8P9HO7AJraNZeGMJO84T
	xXsJ8PGCF22uqjgHy/e0SiPHlx22igtCzASODqUWaicFk9OaLYvBe0V640UZuPmj0dgd
	ta+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=531R7aGbM8NFJNuQXhCNkIXMpx36z4hYWHxp4bmu0ug=;
	b=ZIQGV86dMIaNCt2g6arBsTvYq7fwYOagI/tZuIHsEkKQpa/8jUiKFvBy+1tDWESVB/
	AR2cpXo/Iee03wR/ANoBc4XhEdYw7hIyG0gWGgbCuOoivcS99vZ1L0qHSbE5nnW6ap03
	loyyZhT0DpABW1LzEdnrBJGn1FjdgDtnc7geoV1rAaxglI9aOkjcrliV/2v5GhIv9RaH
	0JxOs49C0OE76RNtnzX+udyBlAV3BuETDYVHv3BqB6JYtMOayfpQcE5BCpXVSmkp/1jM
	z0ptvEsWWrccDRZjCNmdV4TZcBB48RMAFdPHDxqubI3I1EZiNorAQZl4Xq0xdEhZL6g0
	U+AA==
X-Gm-Message-State: APt69E2JejSTg4nuUI3dEatA7Ykr+e1MbAgbbFguo72NAxo+SQEDv82g
	RM+FqeYYEjRirxHJYTCLyHzIKg==
X-Google-Smtp-Source: AAOMgpcp8mB2qlMKGwKKm67+zFiEdfXNSBNbLdB8M/XirbSgDgq0rNlDPqXM0N2hbbBaozxKpwFjcw==
X-Received: by 2002:aca:f244:: with SMTP id
	q65-v6mr31550714oih.268.1531266494413; 
	Tue, 10 Jul 2018 16:48:14 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:68c2:1439:db74:23cf?
	([2601:202:4000:1184:68c2:1439:db74:23cf])
	by smtp.gmail.com with ESMTPSA id
	m7-v6sm5206623oia.32.2018.07.10.16.48.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jul 2018 16:48:13 -0700 (PDT)
To: Joe Slater <joe.slater@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20180710230346.156994-1-joe.slater@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <5ae15c76-ddaf-fbe5-4fac-1149af924b41@gmail.com>
Date: Tue, 10 Jul 2018 16:48:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180710230346.156994-1-joe.slater@windriver.com>
Subject: Re: [PATCH 1/1] tiff: security fix CVE-2018-10963
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
X-List-Received-Date: Tue, 10 Jul 2018 23:48:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 07/10/2018 04:03 PM, Joe Slater wrote:
> Denial of service described at https://nvd.nist.gov/vuln/detail/CVE-2018-10963.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../libtiff/files/CVE-2018-10963.patch             | 41 ++++++++++++++++++++++
>  meta/recipes-multimedia/libtiff/tiff_4.0.9.bb      |  1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2018-10963.patch
>
> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2018-10963.patch b/meta/recipes-multimedia/libtiff/files/CVE-2018-10963.patch
> new file mode 100644
> index 0000000..13a1eb5
> --- /dev/null
> +++ b/meta/recipes-multimedia/libtiff/files/CVE-2018-10963.patch
> @@ -0,0 +1,41 @@
> +From de144fd228e4be8aa484c3caf3d814b6fa88c6d9 Mon Sep 17 00:00:00 2001
> +From: Even Rouault <even.rouault@spatialys.com>
> +Date: Sat, 12 May 2018 14:24:15 +0200
> +Subject: [PATCH] TIFFWriteDirectorySec: avoid assertion. Fixes
> + http://bugzilla.maptools.org/show_bug.cgi?id=2795.
> + CVE-2018-10963
> +
> +---
> +CVE: CVE-2018-10963
> +
> +Same patch as applied to 4.0.8.
I don't know what that means. The fix is in 4.0.8 or this patch applies
cleanly to 4.0.8 or affects < 4.0.8.
- armin

> +
> +Upstream-Status: Backport [gitlab.com/libtiff/libtiff/commit/de144f...]
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +
> +---
> + libtiff/tif_dirwrite.c |    7 +++++--
> + 1 file changed, 5 insertions(+), 2 deletions(-)
> +
> +diff --git a/libtiff/tif_dirwrite.c b/libtiff/tif_dirwrite.c
> +index 2430de6..c15a28d 100644
> +--- a/libtiff/tif_dirwrite.c
> ++++ b/libtiff/tif_dirwrite.c
> +@@ -695,8 +695,11 @@ TIFFWriteDirectorySec(TIFF* tif, int isimage, int imagedone, uint64* pdiroff)
> + 								}
> + 								break;
> + 							default:
> +-								assert(0);   /* we should never get here */
> +-								break;
> ++								TIFFErrorExt(tif->tif_clientdata,module,
> ++								            "Cannot write tag %d (%s)",
> ++								            TIFFFieldTag(o),
> ++                                                                            o->field_name ? o->field_name : "unknown");
> ++								goto bad;
> + 						}
> + 					}
> + 				}
> +-- 
> +1.7.9.5
> +
> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
> index 8c3bba5..e8e2a11 100644
> --- a/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
> +++ b/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
> @@ -9,6 +9,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
>             file://CVE-2017-9935.patch \
>             file://CVE-2017-18013.patch \
>             file://CVE-2018-5784.patch \
> +           file://CVE-2018-10963.patch \
>            "
>  
>  SRC_URI[md5sum] = "54bad211279cc93eb4fca31ba9bfdc79"



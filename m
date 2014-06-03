Return-Path: <saul.wold@intel.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3CD7460E23
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 06:33:13 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id r10so4235944pdi.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jun 2014 23:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:organization:user-agent
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=AFLZeneRSE0N9pJtvxkFPBkb+w+OAkacuDeqVzvuyqA=;
	b=QLn7N69cvUNOaxEFmV5gliJAmrPjunU+9CFtE8dehbgah/KeBMV1Pbt6TmgDxDSGGu
	Ru5i6WTFhmWJ1FECT7QWKU0GW4Dq3Dc9tW7B0HPJSZ9BP586pUtTItukB53hjR+aAIOt
	6AA6DKETTWs704p1wRrBQNhEmDfwIEtkcjLGbR/0kbfLo5nIWo56PD7qOamRUyxeocvX
	BXrbOH0L2oq5nmWnboXMhAEUAhtgCyaC6Ibo87Ec9JjJrx073yQilU5EqEcscJn4FK6l
	0bCWaIVjsYd93azyYRGYD47sThXrl18rjs0dKLG8X2XEvzzTtlb7SLYyx2ey+12/zlzL
	/+dQ==
X-Gm-Message-State: ALoCoQn2uyhNqEOAhg3wPxAzB2baDMyzVA0ZOamsAsfu8DUty+cKkLxcUaCRJomgpSE1U0aIriYy
X-Received: by 10.68.172.193 with SMTP id be1mr47204952pbc.31.1401777194079;
	Mon, 02 Jun 2014 23:33:14 -0700 (PDT)
Received: from [10.6.18.24] (c-50-186-0-160.hsd1.or.comcast.net.
	[50.186.0.160]) by mx.google.com with ESMTPSA id
	jt7sm23823520pbc.46.2014.06.02.23.33.13 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 02 Jun 2014 23:33:13 -0700 (PDT)
Message-ID: <538D6C23.9060405@intel.com>
Date: Mon, 02 Jun 2014 23:33:07 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org, ross.burton@intel.com
References: <cover.1401420117.git.hongxu.jia@windriver.com>
	<c836c1495fcc4bbac269ecfda6db3dfdbb7779be.1401420117.git.hongxu.jia@windriver.com>
In-Reply-To: <c836c1495fcc4bbac269ecfda6db3dfdbb7779be.1401420117.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 1/3] apr: upgrade to 1.5.1
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
X-List-Received-Date: Tue, 03 Jun 2014 06:33:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/29/2014 08:27 PM, Hongxu Jia wrote:
> The LICENSE has no change, except a newline added.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-support/apr/{apr_1.4.8.bb => apr_1.5.1.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-support/apr/{apr_1.4.8.bb => apr_1.5.1.bb} (91%)
>
> diff --git a/meta/recipes-support/apr/apr_1.4.8.bb b/meta/recipes-support/apr/apr_1.5.1.bb
> similarity index 91%
> rename from meta/recipes-support/apr/apr_1.4.8.bb
> rename to meta/recipes-support/apr/apr_1.5.1.bb
> index 0a77ad7..7f2d2ca 100644
> --- a/meta/recipes-support/apr/apr_1.4.8.bb
> +++ b/meta/recipes-support/apr/apr_1.5.1.bb
> @@ -4,7 +4,7 @@ SECTION = "libs"
>   DEPENDS = "util-linux"
>
>   LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=0c35ff3c4c83b89d2f076e315caac28b \
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4dfd4cd216828c8cae5de5a12f3844c8 \
>                       file://include/apr_lib.h;endline=17;md5=ee42fa7575dc40580a9e01c1b75fae96"
>
>   BBCLASSEXTEND = "native"
> @@ -16,8 +16,8 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
>              file://run-ptest \
>   "
>
> -SRC_URI[md5sum] = "ce2ab01a0c3cdb71cf0a6326b8654f41"
> -SRC_URI[sha256sum] = "61b8d2f8d321c6365ee3d71d0bb41f3a89c44da6124cc5b407a3b8319d660421"
> +SRC_URI[md5sum] = "5486180ec5a23efb5cae6d4292b300ab"
> +SRC_URI[sha256sum] = "e94abe431d4da48425fcccdb27b469bd0f8151488f82e5630a56f26590e198ac"
>
>   inherit autotools-brokensep lib_package binconfig multilib_header ptest
>
>
There may be an issue with your apr udpate:

https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/122/steps/BuildImages/logs/stdio


Sau!



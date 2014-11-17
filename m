Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3A22C714D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Nov 2014 15:34:23 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id w10so2585766pde.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Nov 2014 07:34:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=wW+e6h7zT6hLxruwFeAdahdw4Y0kxgkyZ6vgBIsg87g=;
	b=Fbx6gerAmLxPaUAtQjJl8Suw9McUUK4wG0Of3xFZDTswrobeChz7V+dEUi5dfaDXiq
	eQW2ombDJShlSP7hisKtAp7aJwvr2jF4GireJtgNrqM5+kVaRgFTBOp5AmoKbcfEVVvf
	BQZCC3FG9IEX8BQuW5SW2y4vlVqksGky9vnwpYycd2X5kHGcP0LKB1TXa6jgYNE7n6Ih
	ZDvGaAZNWxBUr1xqthU00jCuyQ44u3Lq7aKE2z+jAGHxWdIC2btaUZZy28flzI+cY0pW
	IsoORO+IMfT6D+CdWJLBXNlUu6KJLr2yvCukN70qt+VCLBknDH3t5UByxBzWMmW2XaUz
	5JTw==
X-Gm-Message-State: ALoCoQmPfsZbH7/F5YfF2Kx1jGPR5W8jYInlcvkjvcUm8pxgNIeySH1TKuI48p0XLoOTuqZ4vrfW
X-Received: by 10.68.227.161 with SMTP id sb1mr29935441pbc.5.1416238464277;
	Mon, 17 Nov 2014 07:34:24 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:c00e:30e7:fd8c:8f96?
	([2601:c:9380:601:c00e:30e7:fd8c:8f96])
	by mx.google.com with ESMTPSA id
	fv6sm35418135pdb.83.2014.11.17.07.34.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Nov 2014 07:34:23 -0800 (PST)
Message-ID: <546A157D.6020805@mvista.com>
Date: Mon, 17 Nov 2014 07:34:21 -0800
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Armin Kuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <1416238348-13496-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1416238348-13496-1-git-send-email-akuster808@gmail.com>
Subject: Re: [meta-oe][PATCH] serf: update to 1.3.8 including CVE-2014-3504
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
X-List-Received-Date: Mon, 17 Nov 2014 15:34:27 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Just noticed another post.

drop this.

- armin

On 11/17/2014 07:32 AM, Armin Kuster wrote:
> Serf 1.3.8 [2014-10-20, from /tags/1.3.8, rxxxx]
> Fix issue #152: CRC calculation error for gzipped http reponses > 4GB.
> Fix issue #153: SSPI CredHandle not freed when APR pool is destroyed.
> Fix issue #154: Disable SSLv2 and SSLv3 as both or broken.
>
> Serf 1.3.7 [2014-08-11, from /tags/1.3.7, r2411]
> Includes security fix:
> Handle NUL bytes in fields of an X.509 certificate. (r2393, r2399)
> - CVE-2014-3504: (Closes: #757965)
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   meta/recipes-support/serf/{serf_1.3.6.bb => serf_1.3.8.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-support/serf/{serf_1.3.6.bb => serf_1.3.8.bb} (74%)
>
> diff --git a/meta/recipes-support/serf/serf_1.3.6.bb b/meta/recipes-support/serf/serf_1.3.8.bb
> similarity index 74%
> rename from meta/recipes-support/serf/serf_1.3.6.bb
> rename to meta/recipes-support/serf/serf_1.3.8.bb
> index 08b04d3..10db122 100644
> --- a/meta/recipes-support/serf/serf_1.3.6.bb
> +++ b/meta/recipes-support/serf/serf_1.3.8.bb
> @@ -1,8 +1,8 @@
>
> -SRC_URI = "http://serf.googlecode.com/svn/src_releases/serf-1.3.6.tar.bz2 \
> +SRC_URI = "http://serf.googlecode.com/svn/src_releases/serf-${PV}.tar.bz2 \
>              file://norpath.patch"
> -SRC_URI[md5sum] = "7fe38fa6eab078e0beabf291d8e4995d"
> -SRC_URI[sha256sum] = "ca637beb0399797d4fc7ffa85e801733cd9c876997fac4a4fd12e9afe86563f2"
> +SRC_URI[md5sum] = "2e4efe57ff28cb3202a112e90f0c2889"
> +SRC_URI[sha256sum] = "e0500be065dbbce490449837bb2ab624e46d64fc0b090474d9acaa87c82b2590"
>
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
>


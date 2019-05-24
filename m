Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id A6D097E45D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 01:38:09 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id y11so4252683pfm.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 18:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=gyK49uvLqnoKU7GUwtllWntkN8Ea5Nu9eRgaT3dZ4N8=;
	b=nAjrGxACFCv7Gtu/eTG8++psXSsKlCbVZMiZXwmfQVvmtEMxeJat8T8ooyvSQz67Wf
	w6ioUaup4AV6acpl+XwqhscKmRajwWUuHkq4BVgUtXp0fVMrT6D9EYYa/VrTjLY0yMw9
	ytVqjVZySoZt99Rja4Zm94t4aNyU/+huG82u5PsFjF0mEhw0gV0UOtlSTVHNgT8zH9I+
	R0L85Vj1cLI1yf+RmCnxgTAUUFkbpCCTCALXMEwbemQZj9TZ/9gVR6uhx6AdVsIsHDSY
	C6EgtI7UFSZksdQ/T/PpcxyJ9tFTt7FU9C05SuoJi2Znw5ZzyJ9zKY9tLcuQQO8E1ujw
	P7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=gyK49uvLqnoKU7GUwtllWntkN8Ea5Nu9eRgaT3dZ4N8=;
	b=E2NVRChIGtnEo+k5NnOBKOCVw5AAvm+kz7kDnIKg1MRzthAii7NSw2JvG/Ktvh8fCo
	0hcXcRhETD6kKoJxc1yVtMP2uTxVGPmzD5Mbm33YFF+wPcL2yzNlPedqiNb0W+RDddZG
	JKcu4/fpZ74FeLYplUMtwMdoAy/Lh+sBLsXVg8+dFb+mWBB1cBPSHLQD00A4l6ePnf1K
	CnGloGqXcfrPcX/JrRDduKiiyFv2u8byqB0DB/65/S5DuyE22jT+TXu4WtQ3DE/0+RsB
	4cXrzZFkfZyjC31UXILuGseVKRmZD/FsdoX4JoJL9nESlXnJ3cd5XNYSs5ZdE7f6JCz1
	/1qw==
X-Gm-Message-State: APjAAAVeArchBgDRIue0QK3XD5m6KOXUpTWvaHn+dwbCGTa4IlMkHgnB
	8KbNuYyTYl0qJfEtGYaoXQXXAagAOuo=
X-Google-Smtp-Source: APXvYqwNLVcunWIt7s5eqSSS+VZmbRidVnXBk9XGgXe1v2yCgIdfi29o95mCUcjWdDN3XRcwoYcTAA==
X-Received: by 2002:a17:90a:2263:: with SMTP id
	c90mr5932949pje.9.1558661890211; 
	Thu, 23 May 2019 18:38:10 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:41da:1c8d:2ccb:5914])
	by smtp.gmail.com with ESMTPSA id
	o66sm662490pfb.184.2019.05.23.18.38.09
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 18:38:09 -0700 (PDT)
To: Nicola Lunghi <nick83ola@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20190523132614.32213-1-nick83ola@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <1a8789ce-8a62-bba3-152e-9aa5ec09b35f@gmail.com>
Date: Thu, 23 May 2019 18:38:08 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190523132614.32213-1-nick83ola@gmail.com>
Subject: Re: [PATCH v2] connman: fix segfault with musl >v1.1.21
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
X-List-Received-Date: Fri, 24 May 2019 01:38:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/23/19 6:26 AM, Nicola Lunghi wrote:
> musl > v1.1.21 changed the implementation of the freeaddrinfo() function
> not allowing anymore to pass null pointers to it.
> This was causing 

Looks ok. We had similar issue with nfs-utils

https://patchwork.openembedded.org/patch/156772/


a segmentation fault in connman.
> 
> Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> ---
>   ...-gweb-fix-segfault-with-musl-v1.1.21.patch | 34 +++++++++++++++++++
>   .../connman/connman_1.37.bb                   |  1 +
>   2 files changed, 35 insertions(+)
>   create mode 100644 meta/recipes-connectivity/connman/connman/0001-gweb-fix-segfault-with-musl-v1.1.21.patch
> 
> diff --git a/meta/recipes-connectivity/connman/connman/0001-gweb-fix-segfault-with-musl-v1.1.21.patch b/meta/recipes-connectivity/connman/connman/0001-gweb-fix-segfault-with-musl-v1.1.21.patch
> new file mode 100644
> index 0000000000..43b43bc9f8
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/0001-gweb-fix-segfault-with-musl-v1.1.21.patch
> @@ -0,0 +1,34 @@
> +From f0a8c69971b30ea7ca255bb885fdd1179fa5d298 Mon Sep 17 00:00:00 2001
> +From: Nicola Lunghi <nick83ola@gmail.com>
> +Date: Thu, 23 May 2019 07:55:25 +0100
> +Subject: [PATCH] gweb: fix segfault with musl v1.1.21
> +
> +In musl > v1.1.21 freeaddrinfo() implementation changed and
> +was causing a segmentation fault on recent Yocto using musl.
> +
> +See this commit:
> +
> + https://git.musl-libc.org/cgit/musl/commit/src/network/freeaddrinfo.c?id=d1395c43c019aec6b855cf3c656bf47c8a719e7f
> +
> +Upstream-Status: Submitted
> +---
> + gweb/gweb.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/gweb/gweb.c b/gweb/gweb.c
> +index 393afe0a..12fcb1d8 100644
> +--- a/gweb/gweb.c
> ++++ b/gweb/gweb.c
> +@@ -1274,7 +1274,8 @@ static bool is_ip_address(const char *host)
> + 	addr = NULL;
> +
> + 	result = getaddrinfo(host, NULL, &hints, &addr);
> +-	freeaddrinfo(addr);
> ++	if(!result)
> ++		freeaddrinfo(addr);
> +
> + 	return result == 0;
> + }
> +--
> +2.19.1
> +
> diff --git a/meta/recipes-connectivity/connman/connman_1.37.bb b/meta/recipes-connectivity/connman/connman_1.37.bb
> index 2cf904cd85..12650329c5 100644
> --- a/meta/recipes-connectivity/connman/connman_1.37.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.37.bb
> @@ -3,6 +3,7 @@ require connman.inc
>   SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
>               file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
>               file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
> +            file://0001-gweb-fix-segfault-with-musl-v1.1.21.patch \
>               file://connman \
>               file://no-version-scripts.patch \
>   "
> 


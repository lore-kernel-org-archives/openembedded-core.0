Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BAEC6FD1A
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 20:10:09 +0000 (UTC)
Received: from gateway32.websitewelcome.com (gateway32.websitewelcome.com [192.185.145.111])
 by mx.groups.io with SMTP id smtpd.web10.42557.1676988258155499929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:04:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linumiz.com header.s=default header.b=lE19W04R;
 spf=pass (domain: linumiz.com, ip: 192.185.145.111, mailfrom: parthiban@linumiz.com)
Received: from atl1wswcm05.websitewelcome.com (unknown [50.6.129.166])
	by atl3wswob03.websitewelcome.com (Postfix) with ESMTP id 71C151E6D9
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:04:17 +0000 (UTC)
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTP
	id UTFdp50naU1GUUTFfpilfA; Tue, 21 Feb 2023 14:04:17 +0000
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=FD50Z+Mn8zfNh4BU1hhTGenSMEMGRn3/7eiDQa1HRBQ=; b=lE19W04R3quhZyUQCh8u8nVwYi
	DiLDk5z0KTuUQmzmWxP7FMj2vTvmaNgwEr3WRXExPzSeq0QdZjuKftsXkQBvZOzBAwiD3hpr4vZZS
	426Qfo6sYKR+oVHn8aDsOPPJhGyOvfV4UDggitxgvmjEy/CarIy9qNHTnafWsDH4vwrCWuKGs+W7c
	ZYU+4ANEDDtXbddrE/UDC833A/aNtuGazR6d/mIipu4eENlshj0QPTxrKmId9aI7cpW6NOJ9CP76Z
	XPoJG26nlbgXgFmdPj+HsPgjLib9gCs7VOxh1vwIf8ogWNafEiRCxwL71sxiAVxpa0DNKlSrtlerz
	JU4turjA==;
Received: from [117.206.136.115] (port=46098 helo=[192.168.1.35])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <parthiban@linumiz.com>)
	id 1pUTFc-002qyu-Ol;
	Tue, 21 Feb 2023 14:04:12 +0000
Message-ID: <86b22e9e-6ebf-e552-ce8c-67ab1f3be7a2@linumiz.com>
Date: Tue, 21 Feb 2023 19:34:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] python3-influxdb_5.3.1.bb: add python3 recipe
To: openembedded-core@lists.openembedded.org
References: <20230221140019.287187-1-parthiban@linumiz.com>
Cc: Parthiban Nallathambi <parthiban@linumiz.com>
From: "Parthiban" <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20230221140019.287187-1-parthiban@linumiz.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 117.206.136.115
X-Source-L: No
X-Exim-ID: 1pUTFc-002qyu-Ol
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.35]) [117.206.136.115]:46098
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 3
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDYaYZcHHZtqRf4a9GvNmi5qYHmy8LgG8u1DRgyVcuHAPJnyrayH2vjAHN2oYxkSp7ga7ttvqHMsCMH88BYpIXrHQAsf1KNsPGml0j+3f2fc3FE4dyHK
 K16BM1FNIATidoJv6A2kAqqKk4DR6DDSjLHLqUc6PYxOyIKcuDVyxAfi9P8gH7NysUJrEsmDkeK2kv1Yl1E9aLvMZVipUxzOL0aPtwr0cICDIH7+GbHNWkFm
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 20:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178049

Please ignore, sent in wrong list.

Thanks,
Parthiban N
https://www.linumiz.com
Berlin, Germany

On 2/21/23 19:30, Parthiban Nallathambi wrote:
> add python3 recipe for python3-influxdb_5.3.1.bb
> 
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  .../python/python3-influxdb_5.3.1.bb          | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-influxdb_5.3.1.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python3-influxdb_5.3.1.bb b/meta-python/recipes-devtools/python/python3-influxdb_5.3.1.bb
> new file mode 100644
> index 000000000..9ffbeb7dd
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-influxdb_5.3.1.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "InfluxDB-Python is a client for interacting with InfluxDB"
> +HOMEPAGE = "https://github.com/influxdata/influxdb-python"
> +SECTION = "devel/python"
> +
> +DEPENDS += "${PYTHON_PN}-docutils-native"
> +RDEPENDS:${PN} = "${PYTHON_PN}-docutils \
> +                  ${PYTHON_PN}-lockfile (>= 0.10) \
> +                  ${PYTHON_PN}-resource \
> +"
> +
> +LICENSE = "Apache-2.0 & GPL-3.0-only"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f61c0d3948045e1c8ebe3d70cc888003"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "e5888a7023e9a49d8a372538b625f908"
> +SRC_URI[sha256sum] = "46f85e7b04ee4b3dee894672be6a295c94709003a7ddea8820deec2ac4d8b27a"
> +
> +PYPI_PACKAGE = "influxdb"


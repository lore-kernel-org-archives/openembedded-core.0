Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id A426A7E3A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 22:00:48 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id p2so3191893iol.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 15:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=jubsurF06sEgGpVcdLhqEcSTBkVvnbVJWjBDgTcIOmY=;
	b=Hls0CGYHpCvk4n+VA9bg5adRcn7jp9mmu6emGBUbiDqltfO1ivbZ1EOkzVmV/nGjmM
	mOd3SnBv3aizacN8kOb1EWa7dEZ05S+illo4Et1TVwNnbQvjPK6i0+j2Df9Bd48xnkpx
	srLipBeAtGXpYHKVNpSjwxQcLEpkkfm7rN8+HpIA9/MEIWueMPhUgYh25//A7txGuN/O
	wLQ96YeNg3X9ueMoZq7yMmh4RLfsKvQyz6BtLa4NEdp1qtA5kkuzmiM8pRHAruS83Bsm
	zwupFRCT7o88h5DJd50Zcll+Hr4ucHDQ+MD0AHNOdW1WU+5wSBz0D2J/0nIkxEtXrOGB
	u7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=jubsurF06sEgGpVcdLhqEcSTBkVvnbVJWjBDgTcIOmY=;
	b=YZuZ5bcuUR1Ejw7UohJU6Q2us+P/szlMIDytEleGeWG0ReGiMMLMHLKW8gnWm73qi5
	G+KlwhzZhlNUDHHz/7fhaYRMEVsv08zrSFvunvYGOycpCuzoECicHV2UJRrgBOiMCuUI
	Rs7g/4PVbREiYJFMaxV5IfxSBAHdMOy+anR+DpadqbNkhVp6h0VjLkCubnLwtUMRpVL7
	X7YSfk18vVqUvo2lA1oMdCN/zpqbXAnq8e90x/6yPZAYwNwb0qrseebqAfS+tBiwcehK
	ahflUctkGIH2nvc9z7xOM4IfR8Vkc//e0RFPRyHYbtce82cuCG6/y7ZwxA1JddH4UFsJ
	J3Bg==
X-Gm-Message-State: APjAAAXH+rU0ik5+OtwvClRuYvL+6ARvrVoiRTGEjpcUBrgYUOPO/rWK
	Lr9i7kTU+vXxuCTmqwu/X6t3+BAp
X-Google-Smtp-Source: APXvYqwBFY2sfFT9ci7v8Ho6w0+f+WXKiwbjaHkHnd82NCEyUOI4nkqJj24YMkqiPxrPTo2oicFw9A==
X-Received: by 2002:a5d:93cc:: with SMTP id j12mr20171516ioo.147.1558562449297;
	Wed, 22 May 2019 15:00:49 -0700 (PDT)
Received: from [10.30.197.57] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	194sm3254039itm.40.2019.05.22.15.00.48
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 May 2019 15:00:48 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: David Frey <dpfrey@gmail.com>, openembedded-core@lists.openembedded.org
References: <20190522215541.9689-1-dpfrey@gmail.com>
Message-ID: <6c51d154-6f03-b53b-4f0c-e72d05a0b33b@gmail.com>
Date: Wed, 22 May 2019 17:00:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190522215541.9689-1-dpfrey@gmail.com>
Subject: Re: [PATCH] bluez5: remove udev dependency
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
X-List-Received-Date: Wed, 22 May 2019 22:00:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/22/19 4:55 PM, David Frey wrote:
> udev is an optional dependency of bluez5, so use PACKAGECONFIG to allow
> users to decide if they want udev support.
>
> Signed-off-by: David Frey <dpfrey@gmail.com>
> ---
>   meta/recipes-connectivity/bluez5/bluez5.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
> index aaf2af975d..568de86d6d 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -6,7 +6,7 @@ LICENSE = "GPLv2+ & LGPLv2.1+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>                       file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
>                       file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e"
> -DEPENDS = "udev dbus-glib glib-2.0"
> +DEPENDS = "dbus-glib glib-2.0"
>   PROVIDES += "bluez-hcidump"
>   RPROVIDES_${PN} += "bluez-hcidump"

Should it be enabled by default?

>   
> @@ -43,6 +43,7 @@ PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
>   PACKAGECONFIG[deprecated] = "--enable-deprecated,--disable-deprecated"
>   PACKAGECONFIG[mesh] = "--enable-mesh,--disable-mesh, json-c ell"
>   PACKAGECONFIG[btpclient] = "--enable-btpclient,--disable-btpclient, ell"
> +PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
>   
>   SRC_URI = "\
>       ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \


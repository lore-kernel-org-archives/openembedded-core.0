Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id BF05660C34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 19:01:21 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id c16so9337664ioh.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 11:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=3ogqkAzKUdyubUqzv03lzuL7sh5Npr1bn2mOFT8iFlo=;
	b=MLakk+2wzZSnEtYL7C2QWJamvb7D3x7iHTlNBhT4ycnk6cvOTYTiIj+yyh1475lxS1
	GMuz/3sv+ogtoEzgLGC1tKOAkwIH6ie4imZ88OzRMJ1srWlkTSZMv0zYktUj0G9JkVUv
	1JPTaQd56ISIJhswkJoYD4Wz/jHlgojRC7Gi06tN3SvDASo4IiI3BR2dkgMH2WUCMj1g
	QQl0XtzGvbUjAFoUbPDW/6m5JyngztXBOD/a/RKkggAOJMuMuLqek89ICYePkr1HI2+w
	/ROk6sMAq+j9wR8dgBDha3RNWKv30G+3dquxG2HBlNSaVBKYaIlUH66qNNkC1Dx6+noK
	IpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=3ogqkAzKUdyubUqzv03lzuL7sh5Npr1bn2mOFT8iFlo=;
	b=KK2T9uHOjOzWYzmJ74US+InKAr+TWGaj0F8whAWNLV1miTfHvUIuoBNyYElNJakMCm
	d5tF+IIHffYRSLXEsjnc0BM80S6hSivFZcpgKXXsEotWZWiau5fDKrXEShiYh7b++rn9
	diSBmcqzzbLXwYD9HzvNhz4Gdb6I4hLv+uNoNFKhUR2p9b0NNeO0x9kFRp/X8fcS+qg5
	8laORPpR4PC29WQxfsTVZYLjAKQb0b2o3UebObbrTzsQEofrgPNJ+l2cn7iH4TFKDLlv
	mtnb8RMSvEFdIXuiZi55pypwnLv9g6B+BbGy5894gH/8b8Jpa/hgcScc5YNG8015EFYa
	RYCg==
X-Gm-Message-State: APjAAAVjrMV09Wuhu7Xk+1TjXPT2MR+FKay246d7mGTSUMXjkMPJgYRC
	kFXN+OLfHTIGmt5wva1CSB34Qx0tvv8=
X-Google-Smtp-Source: APXvYqzJx+D7pQalC9FF1ID3WFS7Eqf7zIQtBidmxbOR4LFyqvO8c0nIu5P+OSgpRbtGZE2aht5NGQ==
X-Received: by 2002:a02:7092:: with SMTP id f140mr9656469jac.128.1580497282280;
	Fri, 31 Jan 2020 11:01:22 -0800 (PST)
Received: from [10.30.196.43] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	190sm2625602iou.60.2020.01.31.11.01.21
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 31 Jan 2020 11:01:21 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20200131184935.2484-1-alex.kanavin@gmail.com>
Message-ID: <c3fc71d8-57a2-ec67-bcab-cf6a94893f91@gmail.com>
Date: Fri, 31 Jan 2020 13:01:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200131184935.2484-1-alex.kanavin@gmail.com>
Subject: Re: [PATCH] bitbake.conf: drop pod2man from hosttools
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
X-List-Received-Date: Fri, 31 Jan 2020 19:01:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 1/31/20 12:49 PM, Alexander Kanavin wrote:
> pod2man writes the current date into manpages, and while later
> versions of it respect SOURCE_DATE_EPOCH and use that instead,
> earlier versions do not. This was found to cause reproducibility
> issues.
>
> This patch replaces host version of pod2man with one from
> perl-native.
>
> [YOCTO #13755]
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   meta/conf/bitbake.conf                               | 2 +-
>   meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb | 2 ++
>   2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index b6aa9f33e92..f7544b35c6e 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -488,7 +488,7 @@ HOSTTOOLS += " \
>       cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
>       fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
>       head hostname iconv id install ld ldd ln ls make makeinfo md5sum mkdir mknod \
> -    mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd \
> +    mktemp mv nm objcopy objdump od patch perl pr printf pwd \

There has been some reluctance to dropping pod2man from the hosttools 
and requiring perl-native as a build time dependency due to the negative 
impact on the build time.


>       python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh sha256sum \
>       sleep sort split stat strings strip tail tar tee test touch tr true uname \
>       uniq wc wget which xargs \
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
> index 6495726500f..8e7ef00b087 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
> @@ -18,6 +18,8 @@ TARGET_CC_ARCH += "${LDFLAGS}"
>   
>   RDEPENDS_${PN} += "bash"
>   
> +inherit perlnative
> +

Is this the only recipe that needs pod2man?


>   # For native builds we use the host Python
>   PYTHONRDEPS = "python3 python3-shell python3-io python3-math python3-crypt python3-logging python3-fcntl python3-pickle python3-compression python3-stringold"
>   PYTHONRDEPS_class-native = ""


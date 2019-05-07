Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id C76E57D42D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 20:54:52 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id f23so15601699ljc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 13:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=v5ubSSlVW+zjES/6XkoUj4aIZ53hlSe56JwqgzqM+V4=;
	b=NcqJskSlk5DDUTvsC4yGADd/ImB8dsTk2ujhd5qOcKoA5B/WJYdn6WVwmJ+GRQLI1R
	XiDKjHfT+sOfXoCVnSlXjWYCnlWZ7PvrvCul3TWYn7tSLgTGP6B9qAJOErtsmLbCoArJ
	Xe2i4DQHjK9WDN0Eo2F61FMe7NtJYXrEcYhPwsyQTH6u82UJV0U7Y5MIHlU8T+/OoYdM
	oIcFazrAQEgP01cnmoVrSACnSk1nmb+02oLzj4vMOtGJvw5oMgyzlIUURg8REK5Ri00W
	GDqBXZTIEp/KY+Gm0WCqBlRU6gXrQpNdW79hQw7E0Qrcz7gB7lOSDvLTYgKPtVtn/vRx
	oCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=v5ubSSlVW+zjES/6XkoUj4aIZ53hlSe56JwqgzqM+V4=;
	b=C/6VkALEJz+4O2WSj+soj85/b1qC39y5HnmsebBZHDa8McxQNgjhLQpiQitEADzGoS
	Q/b90fYd2gOyLTxOwTXudSD/vBendAIu+btbVLPn4+LLHgCSjU0KmxfKEbTCba4caXGV
	/wvqF6efYYdrADHCyuK5yK7gmoAVyARq7WcYDyY0Co4PerysNcBVIscHkdBfll+3PWmZ
	0HpdrcSaQ1IySihEphyPt0Pa5gfcdW6WdepVc/twA3mBBWiZm7HADXJIM9b83swfKGf3
	qvetbXCyIdGy+DccLPW3duC0LtC79TXzuHTpx3FqIIV61edqeGbDW6GB7xBNia/lB4Ww
	BwCg==
X-Gm-Message-State: APjAAAUDy9EyUROOZ1rCNNOSCZ3mWQ+m+l16li1ips9HiGbAnBDoSQno
	eWM7sf0tolLsnmU0bC3N21wckU/zGG0=
X-Google-Smtp-Source: APXvYqw77QcTlUE1j+1vuIgnnJ90cE+zwBOf9ydyQyjS6eEdnT+WwMzOYNRhuUGUOyxnlynBwM1j1A==
X-Received: by 2002:a2e:2e17:: with SMTP id u23mr18413397lju.187.1557262492918;
	Tue, 07 May 2019 13:54:52 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	r26sm3421472lfa.62.2019.05.07.13.54.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 13:54:52 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <20190507205416.19119-1-open.source@oleksandr-kravchuk.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <99e10bdf-972d-4be3-50dd-a33444239ead@oleksandr-kravchuk.com>
Date: Tue, 7 May 2019 22:54:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507205416.19119-1-open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH] mtools: update to 1.8.4
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
X-List-Received-Date: Tue, 07 May 2019 20:54:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Ignore this, please.

On 07/05/2019 22:54, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../msmtp/{msmtp_1.8.3.bb => msmtp_1.8.4.bb}              | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>  rename meta/recipes-extended/msmtp/{msmtp_1.8.3.bb => msmtp_1.8.4.bb} (84%)
>
> diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.3.bb b/meta/recipes-extended/msmtp/msmtp_1.8.4.bb
> similarity index 84%
> rename from meta/recipes-extended/msmtp/msmtp_1.8.3.bb
> rename to meta/recipes-extended/msmtp/msmtp_1.8.4.bb
> index 9f28d6ac25..888c1bbb5a 100644
> --- a/meta/recipes-extended/msmtp/msmtp_1.8.3.bb
> +++ b/meta/recipes-extended/msmtp/msmtp_1.8.4.bb
> @@ -6,15 +6,13 @@ SECTION = "console/network"
>  LICENSE = "GPLv3"
>  DEPENDS = "zlib gnutls"
>  
> -#COPYING or Licence
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  
> -SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
> -
>  UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
>  
> -SRC_URI[md5sum] = "0c0be51e6872e818f78bd6924636327b"
> -SRC_URI[sha256sum] = "3cb2eefd33d048f0f82de100ef39a494e44fd1485e376ead31f733d2f36b92b4"
> +SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
> +SRC_URI[md5sum] = "abfabb92f0461137f3c09cd16d98fc9b"
> +SRC_URI[sha256sum] = "e5dd7fe95bc8e2f5eea3e4894ec9628252f30bd700a7fd1a568b10efa91129f7"
>  
>  inherit gettext autotools update-alternatives pkgconfig
>  


Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id EDF857E3F6
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:36:49 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id v9so1932819pgr.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=gwC1Mwdn/GDoAcVoxm12bWRg5Zsn9jNHU3vY/CAbt7w=;
	b=Q768coTb2KcOrgZo69IevjAKSOtHoyZQS7WcNjcHgQxgLhUJcGIYX96uNUKTw8PpGg
	peQjqslu58O7QukinWANm+RaiBrqnz7aMVSu1gsuNMhDlpJMGT7v1yun3U5g3im56EGP
	HGx1d42IoEMVUQx71IRNpXOJ5FCBrl8PO0cGpdymHkUtR6SdTZYBpCPnJezZxRNjtnAG
	efOWghlmRrfJX/iPTs9Q3wCZXnpwK5yZiL7gYGsya2qKy3gNIpor/sq6+aQIWYwUvBOO
	Xx1W8+lG55mv9NQH5oknQITJkt2o8ltmMc6H10TXdWrZOiM2L3JViGp/VzZLyZvnyo+k
	dsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=gwC1Mwdn/GDoAcVoxm12bWRg5Zsn9jNHU3vY/CAbt7w=;
	b=WkrLgZDP9Hzjn2jEzApH6dTRVbQrcYCquxFM6+41BupWsQZtM/bgy5PDzg18i9vc2Z
	qjAojL8/Uw3fJNmzyVyn9/HZwzPzeZd1+RipgswARNzbRrO/2UvSy94QCbEsBIVXn80X
	fPsexfBTcFedRj1d7R6uIPr+JvVKz/mU/HsxjaxV4ywJRzlCRoSomzqMPNRDfs6yzdut
	XKjXFsRJzkWiBEJqJ2vy2DoyLN54wWNoD7tV7AHQ9daiPBuF3XUeAlXBZ4ikK0A7G7R3
	1m6nwwNyZCZRejM+pnAEAYwhz/+4r0+eWFZDkyMi2x1J0xJKjF2JJCHGp5hNJU8VZ4Xe
	24Ew==
X-Gm-Message-State: APjAAAWT3jwXA8G/xdVwDZ/hnfI083tL1pNrnhi8WW/Nq0Cgnh2gP6ql
	VzjUEhe/2wIByqHHT82HKIS8wDE3
X-Google-Smtp-Source: APXvYqxHAf7FJ2VrxJDhpmzgQsrhjtS0KYJazw+pZgVR3IduonjejbUTelOwlw46mxm9o6JkNRvwJg==
X-Received: by 2002:a17:90a:80c4:: with SMTP id
	k4mr16689731pjw.74.1560091010789; 
	Sun, 09 Jun 2019 07:36:50 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:50d3:300:d9ff:2f1d?
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7043969pgv.4.2019.06.09.07.36.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Jun 2019 07:36:50 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20190609075658.688-1-Martin.Jansa@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <24b25992-6da5-d4c5-0a67-748133e0f74a@gmail.com>
Date: Sun, 9 Jun 2019 07:36:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190609075658.688-1-Martin.Jansa@gmail.com>
Subject: Re: [warrior][PATCH] dbus-test: Improve ptest dependencies dependencies
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
X-List-Received-Date: Sun, 09 Jun 2019 14:36:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/9/19 12:56 AM, Martin Jansa wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> The dbus-test package is empty, move its dependencies to the ${PN}-ptest
> package. Also ensure that it doesn't depend on the empty ${PN} package
> which is about to start causing image failures in the following commit.
> In this case the correct dependency is dbus itself.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
got it
thanks
Armin
> ---
>  meta/recipes-core/dbus/dbus-test_1.12.12.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/dbus/dbus-test_1.12.12.bb b/meta/recipes-core/dbus/dbus-test_1.12.12.bb
> index f4131926c2..486a996879 100644
> --- a/meta/recipes-core/dbus/dbus-test_1.12.12.bb
> +++ b/meta/recipes-core/dbus/dbus-test_1.12.12.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
>  
>  DEPENDS = "dbus glib-2.0"
>  
> -RDEPENDS_${PN} += "make"
>  RDEPENDS_${PN}-dev = ""
>  
>  SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
> @@ -78,6 +77,7 @@ do_install_ptest() {
>          sed -i -e 's;@PTEST_PATH@;${PTEST_PATH};g'  ${D}${PTEST_PATH}/run-ptest
>  }
>  
> -RDEPENDS_${PN}-ptest += "bash"
> +RDEPENDS_${PN}-ptest += "bash make dbus"
> +RDEPENDS_${PN}-ptest_remove = "${PN}"
>  
>  PRIVATE_LIBS_${PN}-ptest = "libdbus-1.so.3"



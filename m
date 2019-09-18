Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id D82F990000
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 19:00:30 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 4so359810pgm.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 12:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=clwkFw1W9Ls/yk6Itxo+eNxpw5Yul1zK3SpRvQm+U6U=;
	b=vEOpjEf1OJGnNZ/WjhyQ+MprhJQ3iC9rgpPApSKZI9cbW8psWhaCUYYI7ODiwV1o/L
	VTefAZ90LYoFvQDa3iGzepzUrYhqbChKvPxafdD/as8mJ3K5Akti3JaVlEBSUG2e7bTT
	mLp6/1JqRtKYBXGYrw10zWt1OoMBqHEF620Py2sd+S3yV1S1MZzfajys3zWAravhvDxY
	JbKeVeQsFKQQMNu5nEQb1qgwB1gqiMK17PnOrkhagR5IHeEqeM3O2MJCDOCZkYdgn6Nh
	t4FKLntYuoOckNQ5KUQbQsLyJl2XVk8Pf7oKffEVAQ6QA5Xk1SBZu1veOm+5Dyd1kUst
	cxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=clwkFw1W9Ls/yk6Itxo+eNxpw5Yul1zK3SpRvQm+U6U=;
	b=KP14uhzWFrJ0Ga71RrEU17F8M0I4oOvDLwpHb7TWnuziNLLpHh7+hJbRr6QD2Hc0dL
	UaX5u5n2a2CJQKQx7dnFJ27rmIyu08DdlNDP4qukBIP7Sh9VIGF2V9YEGJFQZ8IOZYMF
	myvYmoPM5xpqcmHBqWKmNQ7VLSK5Ndhl3pN68T83r+ze1lc8mvWXPAdE56pa42WSuEwR
	5HbPBktv17COE+2V4aJmfP/w7y0nPwjVZT8KoUAMAIHjqkoAmwO4nSfV5YRzL3danDqV
	j/uZXx/41Wq/OjMOU/8WE2qX4IGeSs+SJT8XaTb3vhKAGD/kZzudVorLMnMMYhPmkDG0
	bS5Q==
X-Gm-Message-State: APjAAAX16nkMgWWMJCN3X9K/w8X8LHwnC6yCSp8fWKHvbX3IkeSPCsYe
	8pXBUBOavMYrtzxDN81WASEB2aMp2xY=
X-Google-Smtp-Source: APXvYqxq0uqRfUKGjkitV9fgJ4qCpla6lz3nTw/zEV20+G4ipFvEUEtQxN+PUQJMMEzZN/TZrynDmg==
X-Received: by 2002:a17:90a:b309:: with SMTP id d9mr5515048pjr.8.1568833231454;
	Wed, 18 Sep 2019 12:00:31 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:45b7:cfa2:129c:2a54?
	([2601:202:4180:c33:45b7:cfa2:129c:2a54])
	by smtp.gmail.com with ESMTPSA id
	u4sm8582359pfu.177.2019.09.18.12.00.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Sep 2019 12:00:30 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
References: <20190918182803.29170-5-bunk@stusta.de>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <4482de89-631e-bcf7-2b7c-2699a9070e9f@gmail.com>
Date: Wed, 18 Sep 2019 12:00:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190918182803.29170-5-bunk@stusta.de>
Subject: Re: [PATCH] libmpc: Remove dead UPSTREAM_CHECK_URI
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
X-List-Received-Date: Wed, 18 Sep 2019 19:00:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/18/19 11:28 AM, Adrian Bunk wrote:
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta/recipes-support/libmpc/libmpc_1.1.0.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta/recipes-support/libmpc/libmpc_1.1.0.bb b/meta/recipes-support/libmpc/libmpc_1.1.0.bb
> index 1e48c576d4..bbc673ff38 100644
> --- a/meta/recipes-support/libmpc/libmpc_1.1.0.bb
> +++ b/meta/recipes-support/libmpc/libmpc_1.1.0.bb
> @@ -8,8 +8,6 @@ SRC_URI = "${GNU_MIRROR}/mpc/mpc-${PV}.tar.gz"
>  SRC_URI[md5sum] = "4125404e41e482ec68282a2e687f6c73"
>  SRC_URI[sha256sum] = "6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e"
>  
> -UPSTREAM_CHECK_URI = "http://www.multiprecision.org/mpc/download.html"
> -
Does the updating check still work in devtool or AUH?

- armin
>  S = "${WORKDIR}/mpc-${PV}"
>  BBCLASSEXTEND = "native nativesdk"
>  



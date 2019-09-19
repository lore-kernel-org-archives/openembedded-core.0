Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id D70B37F5DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 14:19:29 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id n9so2015676pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 07:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=hhU0OOQt3nGwN6Y3/HanDIxXWJieUTImDyUpMKsVxvY=;
	b=RkYx585WalfC3p6bnEFiwKZgqzq2nwg0gIYZxKtT8CxmnF72fJmhF4KCk1Gwpv5VYF
	LTLSIqoIbxug1QdIqLMEYIjDY3v9cFXXMNJlBXDw3PQyj1rPLIMd0AikBiuqL1KfIcNh
	OA2GdG7Zw6kSP/26CgoFn0g77fa7yEqsd5bv83vVuvKBmbOwx9RZxEuMWoDZtodkDGCD
	F6zHx55M+Pf1xI4w+lv/xzVPLD4sk7bm7z+sJ7VAm9oNbSXf/ta5XNABFqS18CaBBowz
	pABwuKSQXMA6o9oP9VJiu2xEFoN+1OtsNf+7ku9Q+Lb3KwE+hOZcdvEfA+cCx44m+wTt
	8ryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=hhU0OOQt3nGwN6Y3/HanDIxXWJieUTImDyUpMKsVxvY=;
	b=MPwIsnLM/YpnJSSpb5QAf5B3pZAaXHGyGFCIYz2T4lhjgs7fcW4H3u7dQLZKEBOnwd
	Rga8h6Ugsrg5n//VQY2kU96W7zaXTJFMBolK2dhKmOH9KB2k1xXn0dIdJDniUvngDrrM
	WtsNL1wgxE/hjmIl5O3dqXGEnKfHqdDIdnSq2ofcUTqce3Bk28GHv9PumtKK4sde2cSQ
	tBpY4sDxJpc7NZWGk739bATeGaFoAbAXSiCb4yWBbc8+Nb1jQLq2r4RDGl2J82+vWRkM
	UoHmcJbhLrsMSk5DKT0mYxz9fvCJwn/GJIMg3A7fAE9ureZXb6E6Qjj6Xne6tozQUtXt
	F41A==
X-Gm-Message-State: APjAAAUgunrPM+GdF8UzeGIfsSMXZgrpMxgMwiY/YcSUee/TutU5FItE
	CEEUwoE0a4nVNSWxRLks/yM=
X-Google-Smtp-Source: APXvYqxj9mshRR6n7a33ktmEyHFFBY9erbu2r5cNKkxHgN/0MVDYadb6XgbK0NdkJSAhGleEyS0Vng==
X-Received: by 2002:a65:6804:: with SMTP id l4mr9561544pgt.329.1568902770906; 
	Thu, 19 Sep 2019 07:19:30 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:f8c7:8a0b:73aa:3f22?
	([2601:202:4180:c33:f8c7:8a0b:73aa:3f22])
	by smtp.gmail.com with ESMTPSA id
	b26sm13501148pfd.61.2019.09.19.07.19.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Sep 2019 07:19:30 -0700 (PDT)
To: Sean Nyekjaer <sean@geanix.com>, openembedded-core@lists.openembedded.org
References: <20190909182913.4070-1-sean@geanix.com>
	<92e67034-87fa-6bc8-917a-76ed954f8166@geanix.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <a2f5ddf3-5c44-defe-c42e-cde8c8c3411a@gmail.com>
Date: Thu, 19 Sep 2019 07:19:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <92e67034-87fa-6bc8-917a-76ed954f8166@geanix.com>
Subject: Re: [thud][PATCH v2] libgpg-error: Fix build with gawk 5.x
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
X-List-Received-Date: Thu, 19 Sep 2019 14:19:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 9/19/19 6:41 AM, Sean Nyekjaer wrote:
>
>
> On 09/09/2019 20.29, Sean Nyekjaer wrote:
>> Based on poky master, but for version 1.32
>>
>> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
>> ---
>>   .../libgpg-error-1.32-gawk5-support.patch     | 161 ++++++++++++++++++
>>   .../libgpg-error/libgpg-error_1.32.bb         |   1 +
>>   2 files changed, 162 insertions(+)
>>   create mode 100644
>> meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.32-gawk5-support.patch
>>
>
> Hi Armin
>
> Could we merge this and the one for warrior?

Yes. its already sitting in the stable/warrior-nmut

- armin
>
> Br
> /Sean



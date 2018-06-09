Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 31B5C76054
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jun 2018 14:55:39 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id m5-v6so7694861pgd.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jun 2018 07:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=yAkGuJSwd3Mt96T51Rq8bkVWE5FiU8vE1rbFlB9XCns=;
	b=d4NDz396KVJv3fPGnun79i1mgeY27YhMkkohXaFL/eE+Tx8OnmJlFKWkKa/7LZf6i9
	F+pyIOE/coQQ4mxENh3i94dnPOI4dgx5ROaQqqEvz8idbjlKHTNZ7ViR8sUXGLZDatq0
	7skBmPaaBrdJX35Uostqq4/9AV1q+YO/+/jv+Lk4Un8XpJi+/xhlzuc98RBFp1AgX5W7
	TXm6EPQQAbdPNwgHNuf56ExJxGfzFU9QyDRtMMyRLZS7+Tmf1AinFWG/p0+wj14v0/ii
	qPWfR404i0nUvRKALeF+e56enodQz5XqTLqv2e8r7yBVw3YFVKvQeSOi4BcLXqwmHMyM
	yafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=yAkGuJSwd3Mt96T51Rq8bkVWE5FiU8vE1rbFlB9XCns=;
	b=iQ5oO8WqHtHMd/btQGI+ZObp2IwqwB+nxvQKN6BSIRT/p/PC3wc5jBPayrJ9lu1Emx
	RoqDwGIRmkkNUQXWErRIUh7HZFIs4ZCTbLE9Av6HCC3sP8qZvVoTdGhswZfGQp6NAvaJ
	f/wY0ljmRyUMYat6ayxeRJzXkU27A24cF/6PcRsPYExFcUqEmAH0wvlwKCHGWeTSjx5e
	2XmIkqDMJo9mhtHc88/iCNgXp7cw78jIzHctdf7IXknDcVqGTWewSLlaWYjJ4L7xlh7y
	UgfGWrBAgvjvjeZoYHiRyMvEJkJVrQmffoSFbJmFTz65IFz9djYrA+zc191DOs6CfduR
	A7dA==
X-Gm-Message-State: APt69E23IZlhVOVrnZorcfToPBZQBLTwo1iYzRaC6CyZAY4trpjdxl05
	3q+vQA1saJvchN6z9r5P4Eijew==
X-Google-Smtp-Source: ADUXVKJEdyGi8w1udVxYNC7/l8uptflr2F9UmkpNNwgx4l0hMI/ah+k48xTmZLbMQ9O+CIAoPIuXpg==
X-Received: by 2002:a65:4607:: with SMTP id v7-v6mr8941524pgq.31.1528556141117;
	Sat, 09 Jun 2018 07:55:41 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:34b1:53bf:ee45:2976?
	([2601:202:4000:1184:34b1:53bf:ee45:2976])
	by smtp.gmail.com with ESMTPSA id
	p2-v6sm59110582pgq.14.2018.06.09.07.55.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jun 2018 07:55:40 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>
References: <1527865239-8221-1-git-send-email-akuster808@gmail.com>
	<CAJ86T=XwYWyFUAstvrVGfvjY3yS2JPvZXCFch9EyrONfByVYLg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <dfdc1aa9-5854-81f8-a9c8-f3bbf49c933e@gmail.com>
Date: Sat, 9 Jun 2018 07:55:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=XwYWyFUAstvrVGfvjY3yS2JPvZXCFch9EyrONfByVYLg@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] busybox: update to 1.28.4
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
X-List-Received-Date: Sat, 09 Jun 2018 14:55:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 06/01/2018 10:12 AM, Andre McCurdy wrote:
> On Fri, Jun 1, 2018 at 8:00 AM, Armin Kuster <akuster808@gmail.com> wrote:
>> Decided to update again.
>>
>> 1.28.3
>> [v3]
>> Update defconfig based on feedback
> It looks like you've incorporated the contents of the config fragments
> into the new defconfig. e.g. CONFIG_FEATURE_VOLUMEID_EXT (which should
> only be enabled if mount-via-label.cfg is included in SRC_URI) will
> now be enabled unconditionally, etc.
>
> When you refresh the defconfig you should do so without any config
> fragments enabled. The config fragments should then be reviewed
> individually too.
I just found this response sitting in my inbox. Thanks for the feedback.
I will send a new version.

thanks again,
- armin
>
>> [v2]
>> Add back busybox-udhcpc-no_deconfig.patch ti SRC_URI, missed earlier
>>
>> [v1]
>> removed patches included in update:
>> busybox/CVE-2011-5325.patch
>> busybox/CVE-2017-15873.patch
>> busybox/busybox-CVE-2017-16544.patch
>>
>> refactored busybox-udhcpc-no_deconfig.patch for this update
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>



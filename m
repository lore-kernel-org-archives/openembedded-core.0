Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id EAFDE7F36C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 17:28:15 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id c195so18164568lfg.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 10:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=IYyzpvWYOXsUJZW2rWP9H5A+wNd//Iw0pdv9MdThl7A=;
	b=GH2uV3bYaGH9Bkpi+Glw6CaBYiQbDPmIwERUvjPVw/6A1GGs7+day30iQva6O+nh3s
	XoHav2bDgVenGQMH73KIOsrU2KVPl/C0J2DwGD4xqOzNv4CG1baiC+dPrjIk6XWi4aRF
	MQJWA+a+Gin909uwxn5WDsHpozLJzwhaLN5oxt/xUFimdCizJT8uCx0Nw3hK2zKgS6tt
	RfudHZ1pPM3FrI7WR4iJ/NNhuI+gmfBeUrDh2Xt1rq3C3+qDc4y19uKYyQSW5W9jUIx5
	yT/zPJn4c8R7gYEBhMxtAltXyUWQaJWZwlePop5pV1zCbu4sBTJ8JQHe7gsO6UqlS0fB
	Febw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=IYyzpvWYOXsUJZW2rWP9H5A+wNd//Iw0pdv9MdThl7A=;
	b=We9x5po1nBNsB2PAqm56wZANfa13JgOs91AMiX4GNc9ef97gwr41FPGNCcO7CD43st
	KHDOyu4QTgWkbYC4hdp21BggZFOGvWhq1GloVeVzO/+F6J6TSqS1DGcV0niT7J6nCZxm
	fAhLv0C8y/qNdkv4vdYFf8HRCMVhFYoLhDAttu7ObTxlnAb05v1z23nKA2TVQXjxp+9K
	k1+6YiUEir4HG97AZDf2DMiGQD4qRzkSbFFd/OhNvpDxMxH6hUizkqjLp7xI5xZ3WfZ/
	86OXDXZff2G7CxiqdsAZIhvU7O9y3FQwrO9w1cg81eDFHJCbM2CF3u+TpUUQbD8BrIw9
	R0pw==
X-Gm-Message-State: APjAAAVtxTh/iTBg0SweM/xX8VrTXqI8y1Obrx2TDxXmsydHRqBjJlaY
	LPkKOidJ17oxr53s1sGdpTI3Cp/zKE4=
X-Google-Smtp-Source: APXvYqzNRLoJjPKYn0o31ZivTc479/xlhvqiUD6SK3ecN49MFplYKsGqsXn4m1fzMBtkSXnGlSDYlg==
X-Received: by 2002:ac2:5305:: with SMTP id c5mr1650439lfh.136.1571246896054; 
	Wed, 16 Oct 2019 10:28:16 -0700 (PDT)
Received: from [192.168.0.8] (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
	by smtp.gmail.com with ESMTPSA id
	k21sm6366991lfm.68.2019.10.16.10.28.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Oct 2019 10:28:15 -0700 (PDT)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20190926005408.13055-1-open.source@oleksandr-kravchuk.com>
	<865ece08-ec52-9203-207b-fe983bc59e3f@intel.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <ef65708f-13c6-d427-2d0b-e388e15b944a@oleksandr-kravchuk.com>
Date: Wed, 16 Oct 2019 19:28:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <865ece08-ec52-9203-207b-fe983bc59e3f@intel.com>
Subject: Re: [PATCH] ell: update to 0.23
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
X-List-Received-Date: Wed, 16 Oct 2019 17:28:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Ross,

Is this still a code freeze?

On 26/09/2019 13:04, Ross Burton wrote:
> On 26/09/2019 01:54, Oleksandr Kravchuk wrote:
>> Changelog:
>> - Add support for checking if uintset is empty.
>>
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>
> This is in ross/mut so it won't get lost, but we're freezing for
> release so this won't be merged until 3.0 is done.
>
> Ross
>


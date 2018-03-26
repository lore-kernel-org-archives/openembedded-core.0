Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f43.google.com (mail-pl0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id C75E978711
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:47:16 +0000 (UTC)
Received: by mail-pl0-f43.google.com with SMTP id f23-v6so12069631plr.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 07:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=YehZ7XNQl6Mc5Kc8nD4Y39XA9Q8lI2efWsJZgTsCRJQ=;
	b=K0zTk1w1Dci/FQO+omHU2ote6wMIcKCLpSf4qORReDDitN8M7WQERO2qgljVI01z37
	gY+aUH6pNOIfDroMfceHv1czMtHAx4OrT6vbtir5iZNNZBQ4CxkJCXm2yMYD0l/UoSCf
	EKEfjMd5ifNSc1VwVqQ1nKdogNBR08uJyJIVij34N3zaSVbFI+4fQhpBN7NBWZ0uPPQD
	c65jMFybVDEpuRKBbNZFfq1H3t2IXvmAJjqcvCHq88j+hpYLWYqVpEuAQKdVYNiuXzjT
	hiQsENEkaptcfw5HBfcHyDOsdgPZE9fS/MJKVY62RzII1MnGFAFpr1w9LmWj2BXfxfdH
	ItpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=YehZ7XNQl6Mc5Kc8nD4Y39XA9Q8lI2efWsJZgTsCRJQ=;
	b=kUXtOGfPffX9nWIqaA1cLhYePnkKhxwEzQEwkhl5469ffbaRZ71d4J6bJAbyw6wtZU
	jEbMirFdbPQVO+TtXuo3WryIXgirrZrT2gQVd2razM9HwRerEziVFLfnnL90DN1W4WZA
	cvYLmiHBEVHWnLhqqG2PirpPAkH+WOJybyJg5wbOzB4daTdNIKDeh0+Zx6m1VmOGSUzy
	1Ehij4f+z77vNt1JWyL8WxLQg4mp8M0QRlfOdBtznqfGj/gz70xP/MRGRxXt7BevuEyq
	FVrYZ/M8vOIL6Sp3sK8shdnQRwRI/8AXCwfH4YfDf4zQibZyoDebNybpgzXiR2+MEYaF
	QlPg==
X-Gm-Message-State: AElRT7HppvtsNvN2/PegcNHKhfg8czPjqRo/MbD3RkT2uqWrFE2zaqri
	WCzEwX6aY4iuXgy5cYGovMuDcg==
X-Google-Smtp-Source: AG47ELvNUcC4RpjwhG6UTRb13NtzdqtDYZ40VJP/6b6CJxwJuKZC9rRtB+bZEoSBRtwaOSzURiyhjg==
X-Received: by 2002:a17:902:9a48:: with SMTP id
	x8-v6mr27876814plv.135.1522075637793; 
	Mon, 26 Mar 2018 07:47:17 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:203c:a04e:87e9:791b?
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id
	n8sm29769114pff.131.2018.03.26.07.47.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Mar 2018 07:47:17 -0700 (PDT)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	akuster@mvista.com, openembedded-core@lists.openembedded.org
References: <cover.1521989435.git.akuster@mvista.com>
	<d4761381-c70a-3c8c-7e69-c7ff884f78e0@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <4d0ac28b-690a-fdf1-e4b8-79e5dd415738@gmail.com>
Date: Mon, 26 Mar 2018 07:47:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <d4761381-c70a-3c8c-7e69-c7ff884f78e0@linux.intel.com>
Subject: Re: [PATCH 00/21] PKG updates and QA warning fix
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
X-List-Received-Date: Mon, 26 Mar 2018 14:47:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 03/26/2018 02:27 AM, Alexander Kanavin wrote:
> On 03/25/2018 06:00 PM, Armin Kuster wrote:
>> Cover letter only
>>
>> Please consider these updates for master-next.
>> nss has an outstanding patch sitting in the queue somewhere.
>> Passed AB except failures not related to these changes.
>
> Why only cover letter? 
Do you know how many electronic trees I have to cut down to provide this
kind of electronic copy for you?

> Can we see the patches please?
done.
- Armin
>
> Alex



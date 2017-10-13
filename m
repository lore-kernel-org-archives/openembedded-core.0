Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 82644605BE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 11:22:45 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id r129so9236180lff.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 04:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=QiS5RU3NxORMi7WNFi8NQfPNuDlqxkBr5Xxz3Oz3w1M=;
	b=mwE0I4TIhxp/6yzuoYMbnRQT5A725MhRFEwPCqZQYBeUJWMp4GFNTM3DBr5C3eo4Y6
	xKUbuXqtP0ZUvt4hEYX63iUDYChuZon7OCzUuuEp32n5rhtjuLJ107DrQi8QpWoKshPd
	v6mk2SFJ22BGqs5LD/ZBp3CvT8qlYHFdfwaUQ2VS8YCBjyMqVCBM3BmJegW+PrWfeQNh
	11wN3a+mj9FTgu6P0XZifJg+iKk1JKely987BKVT4iz8iucpen4ZYKrHdc6yb5+ZL79K
	c1WRv876I50DDP0pSynlALjeKgZhnIaFIK1CXrd7GJW7/dNivqnsfUeOVTFmuUlwZ1W+
	4brQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QiS5RU3NxORMi7WNFi8NQfPNuDlqxkBr5Xxz3Oz3w1M=;
	b=ZDvCfgVzd0UuVhNfB/CfnHxmuiPR6BycF9AszmADuNKJUt+odTIu+YkRlAdhsv9kbu
	HwvNqYY7zy5c/5SToJh0o/k7kQizDB+vG6eY3d3KmaPcNjaI1Rr9wNOGwhH6SQ6JOXYm
	fwNHK8QsRw1ZQAGQuab9SYqBSRlDsMn5fWgOYuBSfwvsgj7kFEjTe4f2X4/hrz1/Irvr
	T8i8zpJ70WB5d9r8CVXf3Fs3XqaCVadpHCEyfVxgygIFzUxp4D3AjOx+tKeI49tkUhGG
	MfrkJNzdwNnxat3Q1klsEmPMNI6/OapHkUKURa5OTgsNzJdTLm0/1HQhvSXpilhNsqlO
	Ay0A==
X-Gm-Message-State: AMCzsaUJbGOipIsc0ZuFg6YKQlbt8Tq0A2XRdkHA42ATnziOgJf/q81r
	rbMhXGQA8ua5yIk4bGkxPjwUhQ==
X-Google-Smtp-Source: AOwi7QCS7d9iWypc7UEEbReYWD3/eeiU0akF9OjWQNm2ei8wZ6Z2k+SaGls7yPDjfS6N9/Az9ymV7g==
X-Received: by 10.46.71.77 with SMTP id u74mr554616lja.79.1507893765942;
	Fri, 13 Oct 2017 04:22:45 -0700 (PDT)
Received: from [10.20.33.194] ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	r84sm178897ljb.28.2017.10.13.04.22.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Oct 2017 04:22:44 -0700 (PDT)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <25961b50-eda5-5b7e-1bb0-01ef5c521d2e@northern.tech>
	<1507885712-31230-1-git-send-email-kristian.amlie@northern.tech>
	<6a525f12-f5ea-d079-83d8-46e6394be8ff@linux.intel.com>
From: Kristian Amlie <kristian.amlie@northern.tech>
Message-ID: <51087e92-b5a0-9d48-0a1f-9c4f61ef6049@northern.tech>
Date: Fri, 13 Oct 2017 13:22:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <6a525f12-f5ea-d079-83d8-46e6394be8ff@linux.intel.com>
Subject: Re: [PATCH v6] do_image: Implement IMAGE_ROOTFS_EXCLUDE_PATH feature.
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
X-List-Received-Date: Fri, 13 Oct 2017 11:22:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13/10/17 12:37, Alexander Kanavin wrote:
> On 10/13/2017 12:08 PM, Kristian Amlie wrote:
>> Rebased again.
>>
>> Can we get this in please? It has been reviewed and rebased several times
>> already, and has lingered on the list for a long time.
> 
> Bear with the pre-release freeze period please; once rocko is out
> patches will start flowing to master again.

Oh ok, I'm not following the schedule. I will try again in a while then.

-- 
Kristian


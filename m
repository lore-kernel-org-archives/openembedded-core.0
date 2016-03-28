Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id D7E7960722
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 20:52:44 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id zm5so20735200pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 13:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=0rJEPNwAmeuUz7tbXqbp3wGiWEdH/TCNB06arZqRVQU=;
	b=oXE2UIMmmFMqGXAvWFO2xbVqHfC4QlkcCqqpNQIcoJ5bTWEA8YydPzTIIJo9seJI97
	G9x3Rgqje9/hLvONmr841/1V/JO4hJdRuBcaLS9WBP3WKCpd7gJYXuLrQAMC3IwZll8E
	0DgYZ7ZX91XeiAhKQT3603Mr+OGCOnzBjTGavg2pqx5CTw1LXdhj46c6zy34qCS43g3B
	WahPRgGjFZsgzV0POiUZsct/qNqnvAfx7RpQmW5Nwaoa+10yEm5ZawY/pxyVvLqzmdY2
	61qVL2rUn4FFJNkHrMfXgY/58NPcEobpfLr6Jjo5kKSBlswLBw4TbY3T2PZ8VK+PuJ7p
	27OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=0rJEPNwAmeuUz7tbXqbp3wGiWEdH/TCNB06arZqRVQU=;
	b=JNR8kH58hhLdNBxnklhvmRm1bVA+TKvJpOS/sW8EFT+7eBAFK6yJ9pSjJaNUTvaQR8
	QMmKBM9ITkdpvpzJJ8q0CBdPl+YrF0+R2VnTpLmkAOVj70YcDKbbLxRZYkLn8GOLh9H/
	KNKB7iGMdSfvEAuOjQaGh+Q+k4rmDhsc+tzVxqLE8qA/FlqISusbUPCVZs0m/yQ3JumP
	QjbqCE46+HFgonXhZvG7GByUKPA9HahL1keRY5EAxmQ03HtDUNgOuXnO97Qz1pQbslc3
	0Qab+v1MkoxUtogByBCIuqpkioKIpWi4KW/z66wIIn5bbRwJ0uSdIV0tuJBZP+fYzpg2
	OmDQ==
X-Gm-Message-State: AD7BkJLbBADu1iJcHM7R4FpMMjf4M5MIwoqQdEBqzLIvuNXTd+k2A2s8qNnkZaWKnQRkuQ==
X-Received: by 10.66.190.40 with SMTP id gn8mr45712696pac.64.1459198365324;
	Mon, 28 Mar 2016 13:52:45 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:714a:4e59:1cde:8924?
	([2601:202:4000:1239:714a:4e59:1cde:8924])
	by smtp.googlemail.com with ESMTPSA id
	i9sm37726428pfi.95.2016.03.28.13.52.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Mar 2016 13:52:44 -0700 (PDT)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <56F952F7.2010409@gmail.com>
	<CAP9ODKqPzybLhTyx8wz1xCpb4_4R0cXSsmYXB3dtLwc4scBbCg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56F99996.9010803@gmail.com>
Date: Mon, 28 Mar 2016 13:52:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqPzybLhTyx8wz1xCpb4_4R0cXSsmYXB3dtLwc4scBbCg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Aarch64 u-boot with gcc .5x
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
X-List-Received-Date: Mon, 28 Mar 2016 20:52:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 03/28/2016 11:20 AM, Otavio Salvador wrote:
> Hello Armin,
> 
> On Mon, Mar 28, 2016 at 12:51 PM, akuster808 <akuster808@gmail.com> wrote:
>> I have an arm64 odroid c2 board.  If I build u-boot with the current OE
>> 5.3 gcc it hangs at kernel load time. If I use 4.9 gcc it works fine. A
>> 5.3 built kernel boots fine with a 4.9 built u-boot.
>>
>> The vendor supplied u-boot is hacked up and am leaning it that direction
>> as the culprit so I am looking for data points.
>>
>> Is anyone using a current u-boot with 5.3 gcc on an arm64 machine? if
>> so, any special tweaks to get that combo to work?
> 
> I am using one ARM 64 SoC with GCC 5.2 at this moment and it works
> fine. What U-Boot version is the fork based on?

2015.01

- armin
> 


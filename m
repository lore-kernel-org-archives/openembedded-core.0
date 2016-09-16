Return-Path: <mats.dev.list@gmail.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id DC5A2731AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 07:41:09 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id l131so55371154lfl.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 00:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=2ZUfvGUCP4qTqRNXXkA4M64bLoRs1ufK6pv/HFf1VOY=;
	b=eJFheOz7ZuGVG1GcBvEetn7wps464uoD6W1FSpBx0gjwLkeMjmrMOTjIblkwVebnLM
	HQvjPAsH/75ljWd+zfMgEvGgf876ewVVpPlCLszHm2iJrNAZIHk93N2cnXKfAWoTv81E
	NelKyjapW5OGK+XZK6dXoW0m7hdubya2S3vDEvGnC598RNU40eWCPRYIioEDQBCjI2mC
	6HMBlPKW3TKp9OcAnt/Mwl6EKYdX8IKhlt5sFYf2zcm+sFee/q71TImLHLKNbaUc9Uf3
	t7PVx8v1IlrstEMlkzl5tRteeiflNjjkM7y4JVVUJdjk12A1TJJ7bvqpxXSRIpvhrDyQ
	1eZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=2ZUfvGUCP4qTqRNXXkA4M64bLoRs1ufK6pv/HFf1VOY=;
	b=DXJFT7rZEsatJNryCVsnOprcCESAF9H0ZAOzmvxiKq9GEdTk0HTnlpEaDbL/BqkczR
	KBwmwRVmm8SewNhY+yRsNj7WT11g1v7d0PsK9ZlMnYia1Foei+6M/lwPTV6KtLZ/myGT
	tiCZrrY2RU4XzOCeNbamaCIij9qnk/6mi3Ib6zPJg10Xb3ILX/y7MgcK8gRHDuPDp1Ws
	e+6gECWDBZYYAe+7+k80ef1O9pJrBj3bwv9nl/zSkUqBnG9YwYwBcxucj7F7h7OWhD2p
	QQFZHzjnGeFXavV89o1v5VCol6Ogp0djb/ADU+UeATgWiv1rWjU415FCBnxr9t6B0cWt
	ExSw==
X-Gm-Message-State: AE9vXwOObi7TitEgQ+QyuOMDLfqJgEmX+AtAZu0iTtPvlhbBKR5ipNLPKcZkMeJcUVYI4A==
X-Received: by 10.25.150.208 with SMTP id y199mr5549461lfd.92.1474011669398;
	Fri, 16 Sep 2016 00:41:09 -0700 (PDT)
Received: from [192.168.43.153] (m5-242-43-85.cust.tele2.se. [5.242.43.85])
	by smtp.gmail.com with ESMTPSA id
	s70sm2062763lfi.23.2016.09.16.00.41.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Sep 2016 00:41:08 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <72492146-b352-1f59-1d23-26f71773d689@mlbassoc.com>
	<6144111.OaLyj9AJNZ@peggleto-mobl.ger.corp.intel.com>
	<1473976307.7207.151.camel@linuxfoundation.org>
	<1517439.eAOeRX8ZQL@peggleto-mobl.ger.corp.intel.com>
	<a6f6bf4f-9024-1ddc-c12a-ae3a83f68252@mlbassoc.com>
From: Mats Karrman <mats.dev.list@gmail.com>
Message-ID: <7bc27086-9868-7b2b-599f-4d0e8942d0a6@gmail.com>
Date: Fri, 16 Sep 2016 09:41:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <a6f6bf4f-9024-1ddc-c12a-ae3a83f68252@mlbassoc.com>
Subject: Re: Crazy display
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
X-List-Received-Date: Fri, 16 Sep 2016 07:41:10 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-09-16 06:29, Gary Thomas wrote:
> I've only seen it when my build machine was quite busy (yesterday
> when I first noticed, I had three builds going at once)
>
Same for me.
I'm running build in a standard Gnome terminal on Ubuntu and have seen 
it popping up suddenly during a build.
I also have the notion that it happens when the machine is very busy / 
low on memory.
// Mats


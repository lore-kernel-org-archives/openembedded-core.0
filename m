Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0FEC83036
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 17:06:31 +0000 (UTC)
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
 by mx.groups.io with SMTP id smtpd.web10.46294.1751303079303043630
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 10:04:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.dev header.s=key1 header.b=gZJmxBHX;
 spf=pass (domain: linux.dev, ip: 91.218.175.183, mailfrom: wen.yang@linux.dev)
Message-ID: <5cb63888-fc03-4599-adb1-07c805db46c1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751303076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zw2XNqWYXbU3VMcoIgXCw/JQJ0cLC0uKV92Dzf4gvxE=;
	b=gZJmxBHX225TlufdpBsTei7//ukl9Nj2I/s9riYEcfq0AMyS6C8b1184DlTL0pW7cjNGpd
	VXZqjCXEM0om8XZ5cKJ23DBSkef0au8aLHNSmrlhJo5vgAS4rkkqtB/XYCO0YPzMCueoDH
	OIB99zH50cqySwV+O54x5y3LCVn8xvo=
Date: Tue, 1 Jul 2025 01:04:25 +0800
MIME-Version: 1.0
Subject: Re: [oe] [oe-core][PATCH] pstack: add recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 openembedded-devel@lists.openembedded.org
References: <20250629090757.11773-1-wen.yang@linux.dev>
 <CANNYZj_UPRBVoOTmewQsHrzQTUM4O+uv9p419Q43ac0LzOnZrw@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Wen Yang <wen.yang@linux.dev>
In-Reply-To: <CANNYZj_UPRBVoOTmewQsHrzQTUM4O+uv9p419Q43ac0LzOnZrw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 17:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219534



On 6/30/25 17:36, Alexander Kanavin wrote:
> On Sun, 29 Jun 2025 at 15:30, Wen Yang via lists.openembedded.org
> <wen.yang=linux.dev@lists.openembedded.org> wrote:
>>
>> This recipe provides pstack for C/C++, Go, Rust, and Python.
>> +SUMMARY = "A utility to print stack traces of running processes"
>> +DESCRIPTION = "A from-scratch implementation of pstack using DWARF debugging and unwind information. \
>> +Works for C/C++, Go, Rust, and Python. A traditional pstack command can generally print a backtrace \
>> +of each thread in a running program, and sometimes from a core file. This version of pstack uses its \
>> +own self contained ELF and DWARF parsing library, libdwelf to parse the DWARF debug and unwind \
>> +information, to get a stack trace."
> 
> This recipe should be going to meta-oe, I don't think it meets the
> requirements for being added to core.
> 

Thanks for your comments. We will follow your suggestion and place it in 
meta-oe. The patch v2 will be sent out soon.

--
Best wishes,
Wen


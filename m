Return-Path: <dev@mcbachmann.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61DEEC433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 21:01:42 +0000 (UTC)
Received: from smtprelay08.ispgateway.de (smtprelay08.ispgateway.de
 [134.119.228.98])
 by mx.groups.io with SMTP id smtpd.web09.3836.1643317301086093976
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 13:01:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: mcbachmann.de, ip: 134.119.228.98,
 mailfrom: dev@mcbachmann.de)
Received: from [77.47.100.50] (helo=[192.168.0.152])
	by smtprelay08.ispgateway.de with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <dev@mcbachmann.de>)
	id 1nDBtP-00041z-UO
	for openembedded-core@lists.openembedded.org; Thu, 27 Jan 2022 22:01:19 +0100
Message-ID: <97c27571-1151-ea7c-35ad-078ff5ddd1a6@mcbachmann.de>
Date: Thu, 27 Jan 2022 22:01:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [OE-core] [PATCH] wic: bootimg-partition: Add directory copy
 support to bootimage creation
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <faaefedf-1ffa-c403-0abe-ab0e00bf27d6@mcbachmann.de>
 <d42e5eb6544c62527590b3301d8c40c7298c5862.camel@linuxfoundation.org>
From: Sven Bachmann <dev@mcbachmann.de>
In-Reply-To: 
 <d42e5eb6544c62527590b3301d8c40c7298c5862.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Df-Sender: c3ZlbkBtY2JhY2htYW5uLmRl
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 21:01:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161056



On 1/25/22 22:30, Richard Purdie wrote:
> On Tue, 2022-01-25 at 21:11 +0100, Sven Bachmann wrote:
>> [Defective Patch]
> 
> I'm afraid the patch within the email has been line wrapped and even with that
> fixed, the whitespace is corrupted making it hard to apply. I do also wonder if
> there are extra tests we should be adding to the test suite to cover this issue
> (see "oe-selftest -r wic")?
> 
> Cheers,
> 
> Richard


Hi Richard,

I'm very sorry about this. I thought I'd configured Thunderbird correctly.
Before resubmitting I'll configure "git send-mail" and use this for sending.
I'll also try to understand the selftest and add a test.

Bye
  Sven


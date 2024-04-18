Return-Path: <sven@svenschwermer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C5FDC4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 13:33:23 +0000 (UTC)
Received: from mail.schwermer.no (mail.schwermer.no [49.12.228.226])
 by mx.groups.io with SMTP id smtpd.web11.12889.1713447198607691559
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Apr 2024 06:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@svenschwermer.de header.s=mail header.b=db1cpzrm;
 spf=pass (domain: svenschwermer.de, ip: 49.12.228.226, mailfrom: sven@svenschwermer.de)
X-Virus-Scanned: Yes
Message-ID: <7458f958-8e86-4d9d-bdba-4c6b8db89e27@svenschwermer.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=svenschwermer.de;
	s=mail; t=1713447191;
	bh=2kwSlTqG2PoYVZHKKog4168I4G+HcG6OvNtMiluJy+o=;
	h=Subject:To:Cc:References:From:In-Reply-To;
	b=db1cpzrmJ1P5Xwpjt6aiahfOd7BpOSNuG5Tbh5K8OD+D6M11galsvgUqDPbaN/AyI
	 k/rTXlpYGXoaiJtnTtNYp4K9wpUraTzQKhNmmUtUbOk/9giq9nHXx4MtPd2bMWH5/L
	 AZPsnUdg9uui4IMw467sD0aTp2B96yAlXxOkogOeD5ocngLWe368Gu931f50EtZPd2
	 5YHAKpoe78uSgNz7oEgu7I7M5FqMKVU3/aJFhi4YGOFY0bATU/7nZF/trQeR+j5yfq
	 IU9GqM9+VvIvJ2leK1Bnh661t2/pDVsCpawVXZbmN8hu+qQqmrfEh9BZACuC6D8Nlx
	 N5XxPsLBqfUgw==
Date: Thu, 18 Apr 2024 15:33:09 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH 2/2] recipetool: Handle several go-import tags
 in go resolver
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: lukas.funke@weidmueller.com, uvv.mail@gmail.com,
 Sven Schwermer <sven.schwermer@disruptive-technologies.com>
References: <20240411101030.2846823-1-sven@svenschwermer.de>
 <20240411101030.2846823-2-sven@svenschwermer.de>
 <34edec135ca064ae92c5a7fd2c04cc2c82aec26e.camel@linuxfoundation.org>
Content-Language: en-US
From: Sven Schwermer <sven@svenschwermer.de>
In-Reply-To: <34edec135ca064ae92c5a7fd2c04cc2c82aec26e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 13:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198516

Hi,

On 4/11/24 2:17 PM, Richard Purdie wrote:
> 
> Should we be extending "oe-selftest -r recipetool" with tests for something?
> 

Good question, I would have to look into the self-testing framework. I 
don't have experience with that yet. Would you consider adding a test a 
requirement to get this merged?

Sven


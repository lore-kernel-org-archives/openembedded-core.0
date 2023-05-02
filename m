Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70007C77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 09:40:39 +0000 (UTC)
Received: from mailrelay1-2.pub.mailoutpod2-cph3.one.com (mailrelay1-2.pub.mailoutpod2-cph3.one.com [46.30.211.182])
 by mx.groups.io with SMTP id smtpd.web10.124803.1683020433151064544
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 02:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa2 header.b=rDeUatoL;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.211.182, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa2;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:to:subject:
	 mime-version:date:message-id:from;
	bh=5qU8+fEmPatd/t0lK1xf6E5965sM6NMkEwQrG06jVgg=;
	b=rDeUatoL+HF1qGdFkCLnMqHlyj9KaqvIgPDco0D7DRz8m9YzuzYuWr3ogWIdIMadp4KM3gZpPr8te
	 1fPp+9ZuIpC0Jp0yXOjIYevY5gnAvV7RFCb060F9j4HJnM9M698dttVjjOKCVE2NmhLwc1tkBAiqYC
	 1xQgthFIWX7k7DccwJ/mNAIiVaSt0fFKXgix9oTzSRYWxqg0gjOWKlYwyzYnJ7HB0eJxb9imvzjxWb
	 Q7hmre6eAQaRoOnHXHdBpJavOT23Tziy7OpOXYhtzbqPPyTNnFf1aM5pU39f1ybVtRh9+hW1CemM4R
	 YFYLADGqAj1cz53tPeMjJNRnUIkRNiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed2;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:to:subject:
	 mime-version:date:message-id:from;
	bh=5qU8+fEmPatd/t0lK1xf6E5965sM6NMkEwQrG06jVgg=;
	b=K30KBGouK4fyjp6Zh4xYsmLlz6iD7Y8C/0+BXRDc3se8wCI0k3CnxSXlNKOZaponbRdOGWOV2L7hQ
	 Ngd8OP6BA==
X-HalOne-ID: 5fb552fb-e8cd-11ed-8b51-99461c6a3fe8
Received: from [192.168.100.228] (c-799071d5.44006-0-69747578.bbcust.telenor.se [213.113.144.121])
	by mailrelay1 (Halon) with ESMTPSA
	id 5fb552fb-e8cd-11ed-8b51-99461c6a3fe8;
	Tue, 02 May 2023 09:40:31 +0000 (UTC)
Message-ID: <ef98b768-d98a-32e3-1b7c-26654c9a2f04@berginkonsult.se>
Date: Tue, 2 May 2023 11:40:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] update-alternatives.bbclass - is this a leftover from
 old override syntax?
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <32f72c25-86e8-498f-c652-d7d4cebda807@berginkonsult.se>
 <196a87eb15d96cd230dc737cdd724f1c592768bd.camel@linuxfoundation.org>
From: Peter Bergin <peter@berginkonsult.se>
In-Reply-To: <196a87eb15d96cd230dc737cdd724f1c592768bd.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 09:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180720


On 2023-05-02 11:38, Richard Purdie wrote:
> We should fix it, can you send a patch please?

Yes - will do!

/Peter



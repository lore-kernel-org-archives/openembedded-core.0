Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 717DCCA5FC4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 07:51:28 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6357.1790927486025108744
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 00:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: key syntax error: missing public key data" header.i=@rootcommit.com header.s=dkim header.b=dcUB0btI;
 spf=pass (domain: rootcommit.com, ip: 185.246.85.4, mailfrom: michael.opdenacker@rootcommit.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C441B4E41107
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 07:51:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 971A9603DC;
	Fri,  2 Oct 2026 07:51:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 196E910328414;
	Fri,  2 Oct 2026 09:51:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=dkim; t=1790927483;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
	bh=3wB7XB1wEyUPWTONRWtSiHDkGrYbVfaR1URXxeFy0ro=;
	b=dcUB0btIDWog1Ivt/99+R2hd+QrP54cPw73nLsBHLfGxtiOWnrQf8gmG746pRv0VlMt+3j
	fhpFwDNVPLJl/PGdXOa2GRAatqkC8I4Sp1k1NInGPR5az9I4CLrnWcBxGs2Fd1WwhWgR0x
	W45r9Mbux1MEfjCEA23zhfUVM5AIlWwju/dow9DEQYVNJG3ngMoXlId7xd9CYDMOvPOK3y
	sJ7pZhQZc1DkO/Qymezv66AredOJBntMjWQtaUKDLl++nsw+DBhMLBugl8YC9C6XuERk7g
	MWK7FOoHfvFjbdWB4fxOc8r7Hpt5H8dg+tW+P9SGeMz1Zljo8iaqfPghSi15IQ==
Message-ID: <6905022a-cdb2-460e-9bab-53b352149463@rootcommit.com>
Date: Fri, 2 Oct 2026 09:51:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jennifer Chukwu <jennifer.chukwu@amarulasolutions.com>
Subject: Re: [OE-core] [PATCH 6/9] acpica: upgrade 20260408 -> 20260930
To: mathieu.dubois-briand@bootlin.com,
 openembedded-core@lists.openembedded.org
References: <20261002-mathieu-2026-10-01-upgrades-v1-0-3fdeab391403@bootlin.com>
 <20261002-mathieu-2026-10-01-upgrades-v1-6-3fdeab391403@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Autocrypt: addr=michael.opdenacker@rootcommit.com; keydata=
 xjMEagLVOhYJKwYBBAHaRw8BAQdApKjypQYDpk7gc2tKU7srAaN/v2wqp3zsRtrICl5tMarN
 Nk1pY2hhZWwgT3BkZW5hY2tlciA8bWljaGFlbC5vcGRlbmFja2VyQHJvb3Rjb21taXQuY29t
 PsKQBBMWCgA4FiEEHltE0IOQ91GyZqTazXRqZ2jNCaAFAmoC1ToCGwMFCwkIBwIGFQoJCAsC
 BBYCAwECHgECF4AACgkQzXRqZ2jNCaAK/QD/fCa/2kPEcJYpt3XjoXUFC40rV5p92/Mn/CcV
 cDDLTNcA/19zgdNIKAqVOaJAcLwhBjCCIZJfAQ80CuPOdGRR5NMGzjgEagLVOhIKKwYBBAGX
 VQEFAQEHQCujvLLf/3B2yAjCRJWU9BUta58RTcZ9ZYYxzsOBj5FmAwEIB8J4BBgWCgAgFiEE
 HltE0IOQ91GyZqTazXRqZ2jNCaAFAmoC1ToCGwwACgkQzXRqZ2jNCaAWEgD/SY55n6h+sq1u
 /Kdbsd4z+uOz2+0Z9V0HtrYLdfgdBTIA/0nuXShti770G4hZDQD52XLANSdPbO7hbwmpNKHm y3UE
In-Reply-To: <20261002-mathieu-2026-10-01-upgrades-v1-6-3fdeab391403@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247083

Hi Mathieu
Thanks for the patch!

On 10/2/26 9:36 AM, Mathieu Dubois-Briand via lists.openembedded.org wrote:
> --- /dev/null
> +++ b/meta/recipes-extended/acpica/acpica_20260930.bb
> @@ -0,0 +1,345 @@
> +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
> +# The following is the difference between the old and the new license text.
> +# Please update the LICENSE value if needed, and summarize the changes in
> +# the commit message via 'License-Update:' tag.
> +# (example: 'License-Update: copyright years updated.')

You forgot to remove the FIXME section ;)
By the way, Jennifer Chukwu sent another patch for the same update 
yesterday. Your patch has a better summary of upstream changes but hers 
doesn't have this problem...

Thanks
Michael.



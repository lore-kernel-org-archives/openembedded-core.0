Received: from outbound3.mail.transip.nl (outbound3.mail.transip.nl [136.144.136.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6.1792789814492561883
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 14:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@myspectrum.nl header.s=transip-a header.b=fVSnW4JE;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.12, mailfrom: oe@myspectrum.nl)
Received: from submission13.mail.transip.nl (unknown [10.103.8.164])
	by outbound3.mail.transip.nl (Postfix) with ESMTP id 4jBFz804NqzDTpL
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 23:10:12 +0200 (CEST)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission13.mail.transip.nl (Postfix) with ESMTPSA id 4jBFz72ZWMz3fCxJc;
	Fri, 23 Oct 2026 23:10:11 +0200 (CEST)
Received: from [192.168.178.17] (212-204-162-136.cable.dynamic.v4.ziggo.nl [212.204.162.136])
	(Authenticated sender: oe@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id B55CB200C4;
	Fri, 23 Oct 2026 21:10:10 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=oe@myspectrum.nl smtp.mailfrom=oe@myspectrum.nl
Message-ID: <8968080d-ebc1-40f4-a2ff-9ce05b67ceea@myspectrum.nl>
Date: Fri, 23 Oct 2026 23:10:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH scarthgap 00/19] Disable compromised CA
 certificates
From: Jeroen Hofstee <oe@myspectrum.nl>
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
 <18E1415384CA8ABA.3062525@lists.openembedded.org>
Content-Language: en-US
In-Reply-To: <18E1415384CA8ABA.3062525@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: ClueGetter at submission13.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1792789811; h=from:subject:to:
 references:in-reply-to:date:mime-version:content-type;
 bh=fnvnF4YtRT9qCM5wa1mGQXSjSy6R8Ss6Xooi+dWqIz4=;
 b=fVSnW4JESJpp+jUlqHjKsnvZl0Tj+5dD5vK8FX6JawkZZz+hYa4++vhChowOKLqLUXWJWV
 /lz6+Bzbmpn1MBaGeh2p0uxt5eHw9pMsxdsTBL+bBuq1WA5iSigDhBFDTlc2Yxb0eshgZz
 4YLIFUwdxPhewOZo3KGy2P/sNJUGuFRAPBsk1/tiS/+OEIu+K/yboQI/yqx0cPmNgyG5am
 VMij3+JIghG8QoEc+cRqLZp3diPytWkujstBLTKfBMcVBGp7C6XxAprnuma4z52Cg1C1+C
 zSseX8UAiMExVlGwgzYGRtWwVPOV9/WnxlNuVYrjfLunOt0oyy/E+pdiZe7tqQ==
X-Report-Abuse-To: abuse@transip.nl
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 21:10:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248569

Hello Paul, sorry again,

pip has the same problem, 
https://github.com/victronenergy/openembedded-core/commit/867c6f1f48bf8bec3a6b394dcde26f97ba1413a7

Regards,
Jeroen

On 10/23/26 22:05, Jeroen Hofstee wrote:
> Hello Paul,
>
> For what it is worth, [1] should do the same for scarthgap / 
> python3-certifi,
> but without porting all new versions back. I don't really mind which 
> approach
> we take.
>
> [1] 
> https://github.com/victronenergy/openembedded-core/commit/4b6650b6cf7d5ebcd60a0bd41c7d9bda3a750a21
>
> Regards,
> Jeroen
>

Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F17C2BA1B
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 21:37:53 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.75970.1696887462607940378
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 14:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=LT3IcVSp;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 59FC486454;
	Mon,  9 Oct 2023 23:37:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1696887459;
	bh=tUoHggvA4gJ3qJCiMHLEwfQcmhg7Gs3Ot1SYKVDm6PA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LT3IcVSpqLGS23NrHSBXYsw+zIV7m2rJ2lQDsqImineUL82uLc/5DYU79ElLL5l0d
	 2Dvnor97e1wD7jh1PjByxmIQL2N/8hTkjqL70TLQzJHK+fiPSqRZ+1S+PlLswqfdyk
	 XG1SoQIhreuCLtBx1ucYEvXP0mU2IoHwVtrycbxvRp/ilb3vjWrLV4D48CeQJh00Zw
	 PeyXPulzGgcEZAmyNGvS3GLvvhX9ZsvKwi527/R7ldz4DV9xRKyb6GgK4zKZQo8riC
	 CX0X6ciQRZFAA6OU2SC7CW9vDpbINnnmIlFwOlJ/tQGJ5i2oICJ21RPuJ1CXUhn5Bz
	 lLwSugXilbeEw==
Message-ID: <486a89a9-4fee-49b9-aa90-a4c396af3a50@denx.de>
Date: Mon, 9 Oct 2023 23:37:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [dunfell][PATCH v2] gawk: Backport CVE-2023-4156 fix
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
References: <20231009191935.202467-1-marex@denx.de>
 <CAOSpxdY8FfeUh-6Nj8AmyTVbRkN6_vX7eJrpFhtq2ZHt-seYYg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAOSpxdY8FfeUh-6Nj8AmyTVbRkN6_vX7eJrpFhtq2ZHt-seYYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 21:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188869

On 10/9/23 23:15, Steve Sakoman wrote:
> Sorry I didn't catch this earlier, but I stopped reviewing after
> noticing the Signed-off-by omission.

What Signed-off-by omission ?

> There was already a patch submitted for this CVE:
> 
> https://lists.openembedded.org/g/openembedded-core/message/188624

OK


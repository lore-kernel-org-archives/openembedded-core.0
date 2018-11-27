Return-Path: <akuster808@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 162576BDE9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 15:43:26 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id a6so2717994itl.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 07:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=A+qQv1z8PGyDs3I8ZcAOQPNCT8Eq36R/HudBTpMssS8=;
	b=sYrAaI13TPf75MksKx8ZJ2Ucj6/GRB9MhdSir9gRYRwZWsgBzh27N4En8Fck9F3QQr
	BlDiLYiLgYMvaJuuPZweEgdWPmwIVhtHnwUlvx1K4mkcVSHensh3fglz13CJhvgQbh3F
	C6lY6jXajX2NT9a9gaVj9OLedCRBHTKc38wU+TEM2ZmIjzw/NIsYfBIExB7LqxO62/Ut
	i9XchkDIT8rAulEITFJPKU5UyH3aCYCPYqnxFiso4H2dG/5YPd/bAkBAFrEhqNY+eSXn
	0CQ/DBDVZYcmlHUuiX1Am1m0pxiSV/L0ePAMrlKeLnFEcflTB6OplARLxJ3+f9CZQu2A
	504g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=A+qQv1z8PGyDs3I8ZcAOQPNCT8Eq36R/HudBTpMssS8=;
	b=B6cBjx1f/1Bxh7hUK2oXgFFuK5AhKF24CrKOplmNzrElcpp7EpgyFN46J13SBF8fh6
	dI0+16gtJBq6DMf+eK+E5Nn2mj5WkZEJKKvW9DVaCbGyLZUna1+DqppEUWoZ+R4NSJC/
	PqEGhExaG4WdtJDhZBTVa92AuBxEK1pF5ZB0OlIbTXQYPmVC/CsGVMU6uUD/qZontGEv
	Yxmhg4giqZyDZsOGblTm97fd4fK0TYevXsT3X1g3bEWonTHu5nutnaB6hBqYF68ryKnI
	A5XeIiK6ja4xq5xFqipTz1Ah1EqddBP8n1WsD6APP6AxUi8ZVI8agGexJQMvPzmnz4/c
	GKkA==
X-Gm-Message-State: AGRZ1gLzJiaiQ7KezAkRaoWczklzwCRQqvcKArVour59N+lqvrMyZRlW
	+KNvKaoI7qANYoO3gkBiEKNfKorA
X-Google-Smtp-Source: AJdET5fkWz/JGqZ8sfd+YJ7+STU7SNibflsvDuJaYC3ISOp0oJ8SF725t3M8Op/Q+DVERcRXswfisg==
X-Received: by 2002:a24:f5c1:: with SMTP id k184mr27062371ith.87.1543333407776;
	Tue, 27 Nov 2018 07:43:27 -0800 (PST)
Received: from [192.168.0.33] (174-24-96-92.clsp.qwest.net. [174.24.96.92])
	by smtp.gmail.com with ESMTPSA id
	n198sm1547175iod.76.2018.11.27.07.43.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Nov 2018 07:43:27 -0800 (PST)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <cover.1542923737.git.paul.eggleton@linux.intel.com>
	<ce1f3acd80c56e712571e76342fa72265838258b.1542923737.git.paul.eggleton@linux.intel.com>
	<d86ecb42fec746949d7fd4d33aea676e@XBOX04.axis.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <3df82ece-8cc0-0872-fe35-4ef4cbed9980@gmail.com>
Date: Tue, 27 Nov 2018 08:43:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <d86ecb42fec746949d7fd4d33aea676e@XBOX04.axis.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] socat: fix LICENSE
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
X-List-Received-Date: Tue, 27 Nov 2018 15:43:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/27/18 4:07 AM, Peter Kjellerstedt wrote:
> Can you please cherry-pick this to the stable releases (Thud, Sumo, etc)?
got it thanks.
in -nmut's for processing
-armin
>
> //Peter
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
>> core-bounces@lists.openembedded.org> On Behalf Of Paul Eggleton
>> Sent: den 22 november 2018 22:56
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH 1/1] socat: fix LICENSE
>>
>> According to both the README and source headers, the LICENSE value for
>> socat is explicitly GPLv2, not v2 or later, so adjust LICENSE
>> accordingly (leaving aside whether "GPL-2.0+-with-OpenSSL-exception"
>> should actually be considered a valid LICENSE string or not).
>>
>> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>> ---
>>  meta/recipes-connectivity/socat/socat_1.7.3.2.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
>> b/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
>> index 927df7463ae..b2d6b1dea4a 100644
>> --- a/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
>> +++ b/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
>> @@ -7,7 +7,7 @@ SECTION = "console/network"
>>
>>  DEPENDS = "openssl readline"
>>
>> -LICENSE = "GPL-2.0+-with-OpenSSL-exception"
>> +LICENSE = "GPL-2.0-with-OpenSSL-exception"
>>  LIC_FILES_CHKSUM =
>> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>>
>> file://README;beginline=257;endline=287;md5=338c05eadd013872abb1d6e198e
>> 10a3f"
>>
>> --
>> 2.17.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



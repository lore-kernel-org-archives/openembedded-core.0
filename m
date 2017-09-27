Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5EEB8719F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 03:08:26 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id u18so7902129pgo.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 20:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=AJUggBqu9R+UrpbQOx2dO/jQ5bCit1JPc6M8QIx4UNY=;
	b=U84ET/W6VMeUzxmJ0Li2Ww9sRgeePJJHr1grS4OV8G5w/r7cwjbnxHHIYEjI9vTSvI
	vHZpk0AhFpvs/hlzX8BWUtx3U750b2x0n9m1qi72V9Ybm9BicS4wrLCQUrwJUZyq8X08
	L7E22s3K8/qz+gnKBQuXWYiox5S7loi1hOl6iS94nb1oqsPxxzr99bSRe+YsmS6loPel
	+jHu1WZY2cskh9afYODGK+KmY90IBVqnQ7v8imEaMTv2gY9nr7Lb3GRnRAkp2FxxDfaX
	h5DVK4cXQlJDeVdY2Rf7RlEFDc1yZtBRMzw3Ju1rdMB56kNFylLOUKeHUyBPsTxvMzcW
	/oqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=AJUggBqu9R+UrpbQOx2dO/jQ5bCit1JPc6M8QIx4UNY=;
	b=Gk8d3mMsH0iJlf2rf3Jk9ohdxuc+0w01hwchQgAtfJ1o1zHAhQFlkPmajQQC0ShP3m
	tmjlyuhXz7Z+ffdMPG5tGSbWKMFEJhXTIkniC6dSkZ2J34lEKIDcIa70fhr2Jb9rSjqG
	ObhyJ3a04NVLjgMba0Rgf8IRGWiHM6MDMDAiiS72Kghot9dBzxQNU5T10auSGb9J9SpL
	Eq0vOGfsWu0youf9QZft2Uj44TYXeAKXuhEvOQ0jzImlqYLpjG3nfu57C9soLE8vawFS
	HbiOh9f8xvP0KQiLboHI6fXbMdpdD+8QlCbmkjaQh7lVZ7GOdetoScBsSGiAsUp1xxUA
	tfzw==
X-Gm-Message-State: AHPjjUhBXMmMH735Xyyi+r6hNQLk++UG2puStwRxZJpCua5PiEFsrnH/
	5Lnpk9R5qyVp100KZwfeOdg=
X-Google-Smtp-Source: AOwi7QDEz2JCuyQKpdEkbjbQKBNtEMbyGHE4iS02c0qz6d0Vuto1izVioKsJNT56Ugy2Wa4waFoZbA==
X-Received: by 10.99.132.199 with SMTP id k190mr13048290pgd.25.1506481708619; 
	Tue, 26 Sep 2017 20:08:28 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:f084:ad3:5bb0:9acb?
	([2601:202:4001:9ea0:f084:ad3:5bb0:9acb])
	by smtp.gmail.com with ESMTPSA id
	z9sm18715067pgc.85.2017.09.26.20.08.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Sep 2017 20:08:28 -0700 (PDT)
To: Will Newton <will.newton@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <20170918134356.16124-1-willn@resin.io>
	<CAFbHwiQnvfGDk2xxHcOhZhLGhi15xkaNRAMFqak4vBVcXAGoDg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <117f7ca7-527d-0146-99eb-84cbb3c3aa44@gmail.com>
Date: Tue, 26 Sep 2017 20:08:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFbHwiQnvfGDk2xxHcOhZhLGhi15xkaNRAMFqak4vBVcXAGoDg@mail.gmail.com>
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [pyro][PATCH] goarch.bbclass: Replace logic for setting GOARM
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
X-List-Received-Date: Wed, 27 Sep 2017 03:08:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 09/26/2017 09:36 AM, Will Newton wrote:
> Hi,
>
> Is this change ok for the stable branch?
merged into staging.
thanks,
Armin
>
> On Mon, Sep 18, 2017 at 4:43 PM, Will Newton <will.newton@gmail.com> wrote:
>> From: Will Newton <will.newton@gmail.com>
>>
>> The previous logic applied a regex to TUNE_FEATURES which could
>> set the GOARM value to 7 incorrectly, for example when dealing
>> with an arm1176 core. Simplify to check for the presence of
>> "armv7" instead. At the same time add a check for "armv6" and
>> set GOARM to 6 in that case.
>>
>> (From OE-Core rev: 07b60c15e9ef650940afdde37bf3f3b9c50a336d)
>>
>> Signed-off-by: Will Newton <willn@resin.io>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  meta/classes/goarch.bbclass | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
>> index 4a5b2ec787..12df88f8c4 100644
>> --- a/meta/classes/goarch.bbclass
>> +++ b/meta/classes/goarch.bbclass
>> @@ -38,8 +38,11 @@ def go_map_arch(a, d):
>>
>>  def go_map_arm(a, f, d):
>>      import re
>> -    if re.match('arm.*', a) and re.match('arm.*7.*', f):
>> -        return '7'
>> +    if re.match('arm.*', a):
>> +        if 'armv7' in f:
>> +            return '7'
>> +        elif 'armv6' in f:
>> +            return '6'
>>      return ''
>>
>>  def go_map_os(o, d):
>> --
>> 2.13.5
>>



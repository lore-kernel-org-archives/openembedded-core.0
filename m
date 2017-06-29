Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 687F877EFE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 00:31:53 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id f127so9852377pgc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 17:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=B9iCsccXX602TeENlSpVbnidq4YXksiK37E5fcrrjHs=;
	b=UblP+MAotS1wZFgv/co76aJpx/WTBZlkf9E/RhrDcDWPpJFRAOmVV6KQHRZSkK5ZZc
	lXTUHBlKnFmjLzY5UwgCRLQmLqo7gTWHYPUkGTKZeGS8MhM1YlBqk2C3l87D/2aFwp5X
	C+pA7eo5EHCf72pFa0QxGnYj2ZRguudO3cZH7836AsW9tnNfuDSw+gq6Wo/8O6NwUkD9
	LkP8YMJC0X6iuJLUx+DCsGPm/DnFlv4wTzjyIywubruu5Lbamc8sT+QUr9BkbR02gf1B
	OqGxLdU2a8ML+ohMyTd+psauaz+yU9QCoFkeE6C+nNnOY+aVaYm7Nwxw8nD7MYjqkYbW
	n0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=B9iCsccXX602TeENlSpVbnidq4YXksiK37E5fcrrjHs=;
	b=bxyS1iU7ppMwaRqw/TF/WnfZaVzhIyWeOk2YQo796V8CBcuProKAh0c7MMHMXQbVIN
	1EbpGbckHs9gpY7E7u8F/CAlRzyk+VWhrGlpuq+vP/64nkwOlR3/3SwDnwJ8xTW2AnMk
	LjdPVKBQUlNeGH7GkioGeocrq0I3kHc4DoWtLAtyUpnCnr/3NbGm6qnr+PayXakqdz3o
	oVWzMmgnNGRYX3cyHbLXDIF67W+PccgVH/4/hQ7LkVfqi/BbQ9fzIQ3pwPWKto1EfLte
	vE396IEK4B8jPS6Mn5Ezw1Qps3SkbM3fCU7SUblmKIyE11wA7R13vkwx8G5yK6lwGreI
	xZiQ==
X-Gm-Message-State: AKS2vOx8m8VZzw2ThYYstv+nWMmBvMFYOK7LMvr2+jcOcpbj4qVv/yLY
	xZgyT3FQIggrg9yzYpk=
X-Received: by 10.99.100.193 with SMTP id y184mr12888435pgb.211.1498696315055; 
	Wed, 28 Jun 2017 17:31:55 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:f93b:3d41:8f3f:2bd0?
	([2601:202:4001:9ea0:f93b:3d41:8f3f:2bd0])
	by smtp.gmail.com with ESMTPSA id
	w26sm7477960pfa.25.2017.06.28.17.31.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 17:31:54 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <20170526070344.6053-1-mirza.krak@endian.se>
	<cda9bddb-3f96-4c9b-1c9e-25dbd5afd7a3@xevo.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <165f2ecd-9f8e-c1fa-9027-fae0aaf53718@gmail.com>
Date: Wed, 28 Jun 2017 17:31:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <cda9bddb-3f96-4c9b-1c9e-25dbd5afd7a3@xevo.com>
Subject: Re: [morty][PATCH 1/1] openssl-native: Compile with -fPIC
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
X-List-Received-Date: Thu, 29 Jun 2017 00:31:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

its in http://git.yoctoproject.org/cgit/cgit.cgi/poky/log/?h=morty-next


On 06/28/2017 11:06 AM, Martin Kelly wrote:
> On 05/26/2017 12:03 AM, Mirza Krak wrote:
>> From: Khem Raj <raj.khem@gmail.com>
>>
>> Fixes
>> | /usr/bin/ld: libcrypto.a(sha1-x86_64.o): relocation R_X86_64_PC32 
>> against undefined symbol `OPENSSL_ia32cap_P' can not be used when 
>> making a shared object; recompile with -fPIC
>> | /usr/bin/ld: final link failed: Bad value
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> (cherry picked from commit 0a19e72081771fca8ed94fb2a2a8996fd3dce00c)
>> Signed-off-by: Mirza Krak <mirza.krak@endian.se>
>> ---
>>
>> I hit the same compiler error as in above commit message when running 
>> on morty branch.
>>
>> I simply cherry-picked that fix in to morty branch. I looked in the 
>> git log of oe-core and it seems to me that it shall be ok to do that?
>>
>> This is a re-send since I messed up Subject the first time around [1]
>>
>
> I want to put in my $0.02 that I have hit the same issue and would 
> also like the fix to be cherry-picked into morty. I tested and agree 
> that it seems to work with no issue.
>
>> [1]. 
>> http://lists.openembedded.org/pipermail/openembedded-core/2017-May/136489.html
>>
>>  meta/recipes-connectivity/openssl/openssl_1.0.2j.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb 
>> b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
>> index 9a7cdedd05..b6fb126349 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
>> @@ -5,6 +5,7 @@ require openssl.inc
>>  DEPENDS += "cryptodev-linux"
>>
>>  CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
>> +CFLAG_append_class-native = " -fPIC"
>>
>>  LIC_FILES_CHKSUM = 
>> "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
>>
>> -- 
>> 2.13.0
>>



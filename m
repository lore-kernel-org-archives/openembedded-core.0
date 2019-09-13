Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 171E37ED5A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 20:59:01 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id q11so8190027lfc.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 13:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=TAm+0dfiOxWsc0L5v8Zq8354hT18TRhHaWrNkSZBZ1w=;
	b=f0oPGu6bjuAsTbqaPO+WjFMP1FZA56zZlVjvJi/DvOlSihC1DmDwOFGEIjVfxxwldp
	bsQhH9pfNnGdcH6CxkFsS913OayFsjU2XaA623LA1OiPK8fpj9vhTHEtbIsX+lHKsaxK
	IOhTpRqcuQgVx95Ar4XwyH+ZpnQ9sYrZ9VUXHBX4HSVfQ2FomixG2bNOuMtFM+yPBxSe
	vizfE+j4jg9cGHfLYcPIxP7seWQjoHVZlm9sp2NKqR+RBqJEQtI7D9whuHC38FRIK4q8
	a1X+Omt4MBav+gU0Qws5s10syIhfP4GyBPt13XwauTHmwQoZNEzKkCCbbvHm23DtxWkq
	f+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=TAm+0dfiOxWsc0L5v8Zq8354hT18TRhHaWrNkSZBZ1w=;
	b=igQi8uf40+QEMxjBXeU8QZWk5NxbDJY0O/garYgAnYh5F5EjTxWs+Ws9B3OwuRClJT
	fmHSrCOAPMkqjHD0hr8WLOW8Qdo3ZtShCSVJN4pNx/rz4Sg8j9v7pYr/v2D/+S6UIhXo
	f5E27pffvVAFbf2XOtJdBI9YFPC0xZ9GAlpArK+nz2aRQbpei42RT86RoPb7ufxGM8HV
	d8X9xjraMHt106gnmfOHMKs4nfrbyN/1hvdirMe9tyaWK5lOUmVTWl31QHUmiOixkup5
	ZdKUCSXooAx2s/zlwlIByLd2VHllWDNFIccZ3xF+04m3jIiodxw4qvRXP9dsIXRlIRlO
	WVUw==
X-Gm-Message-State: APjAAAXsDbQzVz1nyZURLMMiiM0FJk2zMWPvR7oxsHhTHXPdTDvst4wa
	6RbbT6iZZ0KG+09PpYfylAN3p8NODgc=
X-Google-Smtp-Source: APXvYqz/IpQ/rimOGga/pICTbCewb8LFy/C/Zk9t0k4VrIqMFaflFH+7R/O7qb3aqrXlXvkLVr9J3A==
X-Received: by 2002:a19:6a09:: with SMTP id u9mr6473437lfu.91.1568408342315;
	Fri, 13 Sep 2019 13:59:02 -0700 (PDT)
Received: from [192.168.0.8] (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
	by smtp.gmail.com with ESMTPSA id
	p9sm6620382lji.107.2019.09.13.13.59.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Sep 2019 13:59:01 -0700 (PDT)
To: akuster808 <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
References: <20190913191705.32022-1-open.source@oleksandr-kravchuk.com>
	<12846e1e-2489-5686-b2ff-eca62620e96c@gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <6374513c-21a3-cf52-52e3-1e465721a2a1@oleksandr-kravchuk.com>
Date: Fri, 13 Sep 2019 22:59:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <12846e1e-2489-5686-b2ff-eca62620e96c@gmail.com>
Subject: Re: [PATCH v2] curl: update to 7.66.0
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
X-List-Received-Date: Fri, 13 Sep 2019 20:59:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Just a mistake - there was no v1.

On 13/09/2019 22:58, akuster808 wrote:
>
> On 9/13/19 12:17 PM, Oleksandr Kravchuk wrote:
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> What is in Version 2?
>> ---
>>  meta/recipes-support/curl/{curl_7.65.3.bb => curl_7.66.0.bb} | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta/recipes-support/curl/{curl_7.65.3.bb => curl_7.66.0.bb} (95%)
>>
>> diff --git a/meta/recipes-support/curl/curl_7.65.3.bb b/meta/recipes-support/curl/curl_7.66.0.bb
>> similarity index 95%
>> rename from meta/recipes-support/curl/curl_7.65.3.bb
>> rename to meta/recipes-support/curl/curl_7.66.0.bb
>> index 96f90fb8ba..d1975f2460 100644
>> --- a/meta/recipes-support/curl/curl_7.65.3.bb
>> +++ b/meta/recipes-support/curl/curl_7.66.0.bb
>> @@ -9,8 +9,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>>             file://0001-replace-krb5-config-with-pkg-config.patch \
>>  "
>>  
>> -SRC_URI[md5sum] = "bdd220d018c23e7f9ee82894e62a70bc"
>> -SRC_URI[sha256sum] = "0a855e83be482d7bc9ea00e05bdb1551a44966076762f9650959179c89fce509"
>> +SRC_URI[md5sum] = "c238aa394e3aa47ca4fcb0491774149f"
>> +SRC_URI[sha256sum] = "6618234e0235c420a21f4cb4c2dd0badde76e6139668739085a70c4e2fe7a141"
>>  
>>  CVE_PRODUCT = "curl libcurl"
>>  inherit autotools pkgconfig binconfig multilib_header


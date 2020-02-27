Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5F86F61898
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 22:43:33 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t14so394237plr.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 14:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=7hYMlkTpqgvtFTYMSn1rD+XQjKOdCPz6G/JsjOo/P4w=;
	b=WJWHq5yxfBso/x40KGV7cuiA2cK30Ym6UDSiI3WiixefCKjEmgUIFFf8dTKFFKyfVh
	KLBgKRr1lGfGD35skVtTRmLVgoCcQjntaorkNNGvRV91JsqNfrlfi7YWiz6oO160SPO/
	T04TLjzB8mwGpaeGFCiS1ZFmCm6ax+8SmRAzfUxuwCAbDovEsUYv1uAv4CVcSEHYllEg
	8qGXXpx6vrM+1fQZ3//dNmKyJYHhTugnpQctJs/qIo8V5n38UupjvdhaTWfVOchwa8wn
	W0rJVtAl6Ddb/XAUZpEjduBFpFO8wiH+V61xC8ErTTVXiWa6eoeX3ksHY0kXPtSL+wdl
	ahuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=7hYMlkTpqgvtFTYMSn1rD+XQjKOdCPz6G/JsjOo/P4w=;
	b=msKGqa6V9GNNLL+kEw/XYBeSFqOHIFnGbNDTPIaGC6dDnCxzzllo7NQi0Vt1OSkkuC
	aCiUs8SqggmMfnoMdzfqKHBMfSFfhZBFsMgkTezBgp45nhOfi2qjWb1sAol0PLNgYQCP
	olsHTgI8tZ+xPnQihA73fUT/snRfdo0uHJGfumYK5si+y6tIjjWuQU6VHYBnX6A843cY
	7QlQM1iWFNorzejjxm25Ku1pdyxCT1qqJUj883ENSvLJD6O4iqGYc2XwvuOccN0mXn8Y
	YsUlUdOf0mVNEPfIUdvKs3RoOJnSgx9iO4/dRRZZm1EaJtgE1m9wEevH05WX07ax4ZHq
	NQew==
X-Gm-Message-State: APjAAAVeZQkHC5B+60iExricdV5u3mD/9gFzujHfH2ED69xrYP1EE//k
	pwtPqyWqrranOvu2flFiM1g+u56A
X-Google-Smtp-Source: APXvYqxn6Tgyhq1gGxWiZGZ/1ixlq0Dtag1Dcp57E/ImQEQcfGYv6P/WyAmE43LmkhJn6PmhB9SUZA==
X-Received: by 2002:a17:902:b70e:: with SMTP id
	d14mr1008531pls.295.1582843414365; 
	Thu, 27 Feb 2020 14:43:34 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:3d0b:bd00:40e0:2589?
	([2601:202:4180:a5c0:3d0b:bd00:40e0:2589])
	by smtp.gmail.com with ESMTPSA id
	a195sm8435117pfa.120.2020.02.27.14.43.32
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 27 Feb 2020 14:43:32 -0800 (PST)
To: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20200227205608.26788-1-akuster808@gmail.com>
	<20200227205608.26788-2-akuster808@gmail.com>
	<7c57c85f-d26b-0a10-f4fe-f6b7e68056b9@intel.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <ceae3f5d-a3f9-f11b-9d1c-59f1bf82b995@gmail.com>
Date: Thu, 27 Feb 2020 14:43:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7c57c85f-d26b-0a10-f4fe-f6b7e68056b9@intel.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [PATCH 1/2] libuv: needed by bind 9.16
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
X-List-Received-Date: Thu, 27 Feb 2020 22:43:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2/27/20 2:33 PM, Anuj Mittal wrote:
>
>
> On 28-Feb-20 04:56 AM, Armin Kuster wrote:
>> From: Armin Kuster <akuster@mvista.com>
>>
>> move from meta-oe to core
>>
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>   .../libuv/libuv_1.34.0.bb                     | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>   create mode 100644 meta/recipes-connectivity/libuv/libuv_1.34.0.bb
>
> This will need an entry in maintainers.inc as well.

Interesting question.
Does that default to the meta-oe maintainer as that is where we are
getting the recipe from  or the person submitting the patch?


- armin

>
> Thanks,
>
> Anuj
>
>>
>> diff --git a/meta/recipes-connectivity/libuv/libuv_1.34.0.bb
>> b/meta/recipes-connectivity/libuv/libuv_1.34.0.bb
>> new file mode 100644
>> index 0000000000..b842bbda7a
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/libuv/libuv_1.34.0.bb
>> @@ -0,0 +1,19 @@
>> +SUMMARY = "A multi-platform support library with a focus on
>> asynchronous I/O"
>> +HOMEPAGE = "https://github.com/libuv/libuv"
>> +BUGTRACKER = "https://github.com/libuv/libuv/issues"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
>> +
>> +SRCREV = "15ae750151ac9341e5945eb38f8982d59fb99201"
>> +SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit autotools
>> +
>> +do_configure() {
>> +    ${S}/autogen.sh || bbnote "${PN} failed to autogen.sh"
>> +    oe_runconf
>> +}
>> +
>> +BBCLASSEXTEND = "native"
>>



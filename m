Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1CB37616C9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 15:53:18 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id q8so14592152ljb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 07:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9XzmAt30ZOySTFdYqm/4gWokkAPYB2STwWVGjPoR9cA=;
	b=Mcu0I3Kf8drolq9Rx2UjWFPXiEYHE39NIVnflVwbwSdV8WpXzhzFIaTh12kKIrS3ng
	x5SnxwzJFfMXtrU6dNb2nQFL2VFc7wfQVSiMHO7oywxPGyyQdOzcjJGZG/QLA8iHlMEB
	v8JOs0kMX6xAzsPXGebU7euG08YOtAdaZr+uiYsqK0VnKx0pm0ZGZDdHwy71J7qcLJI5
	RO/jvXpLia2+gl8GfG0NOl9fdXJxDGrTcx+fe+JqfJWwmhNQxH4nnk3MjTCrwxjvrKtR
	lULKaI0c/wiHFCUkpdcJvo+Uaq712jCpF1SlzQ8MSil8jylHq6xYYoGYfqm0BwwJPEzr
	DlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9XzmAt30ZOySTFdYqm/4gWokkAPYB2STwWVGjPoR9cA=;
	b=etTY4TUyTI+i4aVwI/s3eecxXuLq7k/AzevDpLLn1kNBgTp/wxWo4W3MXTvncykj35
	ZxmuyHkhyChuiGKmB4ma8NDa4gP0/9M0b3SGwBv8eSKZaMHIAADc8cW+vkAl3NsFCeRD
	QupovJvl9iocqY/3w8R9a2Ql17AKJ6Sbaa6wZOJkijsxD5tu44zpEHAutlVosNnmusMb
	d9q4tzEApirHjuQ4yucm+us+mRznwyHQoMX/Vivm53Vj8jsy/OAqcFbt9POWN+dlqC70
	tGkU1+478nh24oZ4ZQM2eofCTTcjqMcP+6dffDeOFAzRneJb+8kdoMf6zXOjHjjCMqnb
	3KhQ==
X-Gm-Message-State: APjAAAXM0GsLeLoVQeGBGzZK0KYwCuGRrFiY93bCqsftdHEsQE+fs02A
	AAK0DKE/qnRzRyWy0j4F54k=
X-Google-Smtp-Source: APXvYqwURKOUO9+efh3r8qRFHgkLy8q8//rcpfb8vQoRrFm1Z+ev54CIM/PKIHopbzEdVyflHo0rNQ==
X-Received: by 2002:a05:651c:299:: with SMTP id
	b25mr26115168ljo.1.1582645999484; 
	Tue, 25 Feb 2020 07:53:19 -0800 (PST)
Received: from localhost.localdomain ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id
	r21sm8075870ljn.64.2020.02.25.07.53.18
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 25 Feb 2020 07:53:18 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: douglas.royds@taitradio.com
References: <8b666dc3-e5a6-0417-82bd-2b15190d223f@gmail.com>
Message-ID: <ef5aea58-ef88-61c1-b614-88476f5e747c@gmail.com>
Date: Tue, 25 Feb 2020 16:53:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8b666dc3-e5a6-0417-82bd-2b15190d223f@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Overriding SDE_FILE
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
X-List-Received-Date: Tue, 25 Feb 2020 15:53:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2/24/20 8:25 AM, Jacob Kroon wrote:
> Hi Douglas,
> 
> You updated a comment in reproducible_build.bbclass, commit 
> e7b891b76954c784f5a93bd0a1c91315673ce40d:
> 
>> -# Once the value of SOURCE_DATE_EPOCH is determined, it is stored in 
>> the recipe's ${SDE_FILE}.
>> +# Once the value of SOURCE_DATE_EPOCH is determined, it is stored in 
>> the recipe's SDE_FILE.
>> +# If none of these mechanisms are suitable, replace the 
>> do_deploy_source_date_epoch task
>> +# with recipe-specific functionality to write the appropriate 
>> SOURCE_DATE_EPOCH into the SDE_FILE.
>> +#
> 
> But I can't really get this to work. What did work for me was to replace 
> "do_create_source_date_epoch_stamp()" in my recipe:
> 
> do_create_source_date_epoch_stamp() {
>      mkdir -p ${SDE_DIR}
>      date -d "1981-03-03" "+%s" > ${SDE_FILE}
> }
> 
> What is the intended way to achieve the thing I'm trying to do here ?
> 

FYI, JPEW has a proposed patch here

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=jpew/reproducible&id=d091d2aa53ea417f70c10f5ce89151820c3db9ce

for allowing a recipe to just set SOURCE_DATE_EPOCH directly.

But maybe that currently is at odds with SOURCE_DATE_EPOCH being in 
BB_HASHBASE_WHITELIST ?

/Jacob


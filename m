Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 976437D3B7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 20:08:08 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id u22so1788920pfm.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 13:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=0XIOkAePxyVhQkzLijPJsqk1NtFHsirAB84xULqFA/k=;
	b=PZ0hUWQuNfqbHis6XRI+oH+TwWImptmgAXPZaVl+a8I9Tg+P/Bz5J8Xrfc6c027BLX
	72U5YsoXcKE0KFy1brlRnjNMNwP4rWlv5ORxh2O9rhcbFfaSx/J6g07W+8wnn/e07Fbo
	impTVnm3zb/cDbG6+YoqwvdUmctD4pLuZXgsN6xeADIhsUPO0iR3EJdHN7lw9lhHy4gk
	98RdX4Q2SbwI5zjQbU0N4gw/H8xIRE94xb0qPYzcukry7xjaWLrxUp+Z+02x4EgkIk1l
	tTTF0soLypFP5YAWhQLbrikNY9oAxCS5qSp0lZ5HN4lzG17BxEl+/b728lmrwrKASROE
	79JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=0XIOkAePxyVhQkzLijPJsqk1NtFHsirAB84xULqFA/k=;
	b=iBhz34WnJn2t1TeAOj2fxaMd2FgBwqk/Pp3nUrEKIRHPoXoqoYo48sWcjmnTsu0WKv
	18iYfF9ax35OydGtj5ZUkwkg6R2WZDAIqx8hptxdp9HcqufuPZxl2qkNWp/PEvwPWILm
	ZuEeDDomSPdDVDa3fjheh/7V6sYJM5mNQrcrN7L2F//iiXAsHhNflQnB5/00505v0gLu
	sCo7l6FZqEc3QlWTmULAyJUEfOLNyurVtU4lZYO1lwZUSXjI2QRVglES9xCGWgmSQ4uS
	KHm6fO62xVu3yXGyenBH3oHQ595wC8FHkrULlKki06ADvC+6IgunFrgF/YIIKzyMtA94
	kz5Q==
X-Gm-Message-State: APjAAAX1LO6FE120eH1pLK5QPjuhr5fZjrE8OkMTn9XYM6bjVd+sULQW
	xyBLBspKd5/UAYdj7cE4/NBhW6jH
X-Google-Smtp-Source: APXvYqwgfEQblnlc0PsR4FzUXvzfS+Zf+AVVRY3zfgpSFPCHf/li8tcvIkH6VaTyXL4GCClCVAhLQA==
X-Received: by 2002:a65:5685:: with SMTP id v5mr4746967pgs.184.1559938089361; 
	Fri, 07 Jun 2019 13:08:09 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:9501:8703:ab4:a59e?
	([2601:202:4180:c33:9501:8703:ab4:a59e])
	by smtp.gmail.com with ESMTPSA id
	g15sm6299753pfm.119.2019.06.07.13.08.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Jun 2019 13:08:08 -0700 (PDT)
To: Joshua Watt <JPEW.hacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190607154805.15741-1-richard.purdie@linuxfoundation.org>
	<ff680a45-8b31-6167-d5b5-e1a242fc006d@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <643c0139-f738-a603-fd93-cb4c6ee02f37@gmail.com>
Date: Fri, 7 Jun 2019 13:08:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <ff680a45-8b31-6167-d5b5-e1a242fc006d@gmail.com>
Subject: Re: [PATCH] multiconfig: Adapt to bitbake switch 'multiconfig' -> 'mc'
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
X-List-Received-Date: Fri, 07 Jun 2019 20:08:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 6/7/19 8:51 AM, Joshua Watt wrote:
> Is there a reason for this change other than aesthetics?
>
> FWIW, we maintain some recipes across several versions of poky, so
> this rename is going to cause me some headaches
Versions.. as in stable branches?

- armin
>
> On 6/7/19 10:48 AM, Richard Purdie wrote:
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>   .../recipes-test/multiconfig/multiconfig-image-packager_0.1.bb  | 2 +-
>>   meta/lib/oe/sstatesig.py                                        | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git
>> a/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb
>> b/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb
>>
>> index 3dbc0f5d155..a76a6bea1b8 100644
>> ---
>> a/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb
>> +++
>> b/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb
>> @@ -8,7 +8,7 @@ MCIMGTYPE_virtclass-mcextend-tiny = "cpio.gz"
>>     MC_DEPLOY_DIR_IMAGE =
>> "${TOPDIR}/tmp-mc-${MCNAME}/deploy/images/${MCMACHINE}"
>>   -do_install[mcdepends] +=
>> "multiconfig::${MCNAME}:core-image-minimal:do_image_complete
>> multiconfig::${MCNAME}:virtual/kernel:do_deploy"
>> +do_install[mcdepends] +=
>> "mc::${MCNAME}:core-image-minimal:do_image_complete
>> mc::${MCNAME}:virtual/kernel:do_deploy"
>>     do_install () {
>>       install -d ${D}/var/lib/machines/${MCNAME}
>> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
>> index 417943db902..13af16e473c 100644
>> --- a/meta/lib/oe/sstatesig.py
>> +++ b/meta/lib/oe/sstatesig.py
>> @@ -155,7 +155,7 @@ class
>> SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
>>           else:
>>               def get_mc(tid):
>>                   tid = tid.rsplit('.', 1)[0]
>> -                if tid.startswith('multiconfig:'):
>> +                if tid.startswith('mc:'):
>>                       elems = tid.split(':')
>>                       return elems[1]
>>               def recipename_from_dep(dep):



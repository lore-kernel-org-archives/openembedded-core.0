Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id EFB047E62F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 15:45:39 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id a186so7330627pfa.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jun 2019 08:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=gWyRiS93s/XjPZp4VBjzhzrzJFkZjqjcO4OM+KE/m0U=;
	b=vXSpwnN1XBUZ2LwqljCFE0jgwcWM/EvBVHoDVSsMNQV/7/QSUe18OWbTcFu3rhV51R
	EVtI4OtzM8ybe9ln1+to7nKBKgVBH0CGQ3ZuJCQhkqI8AnaDHPTqZ40mHl1tZ6XGVXI3
	GdgbeW744Jf570DEb0VBQ0H9shzo309r7p4PL0pHYuEVe92zZkg+jxEFUEk7nFMO01q6
	OolHqQtdgEPdeMy3ss5M+zYOOrBFFCJRbndZrZAWy2Z5OVQi6ZhzafqNW6/g9o5X7vDI
	tjDOH8dSgrJvzJOByMXG0mNudyj+6L6ALXL5KUywaP5e8OTx3FurUBFCy4gWPOQQQRsd
	IUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=gWyRiS93s/XjPZp4VBjzhzrzJFkZjqjcO4OM+KE/m0U=;
	b=jzgp665bfPHS43+/FdzG908YC/DuWWi09kQ5tMpdUXgP7Jj9TqMbMLU/GN79CXG1Ww
	75jlWsK8jWKyxtyJNkn4FDs4tucNR24kHx6OxJaiSDe3XUSDsI/3E5U5rRC/GjOHaF0C
	0P3a9SQmPAJHs1gfK5GwgxGd81gJYOJLKe+G9I7cZ2oZA5Ws9KAYC/m3h5UFYXhB/12a
	/bzgJBKfpFuXXt9X6NwOOEtY7W2wdcvvVSiBpqg9X9exz08xPEceSAbV10iNAxSsELk1
	lfo+TzBvHdIef0uj5P0+SL3aXlE0UGvubVhP6fXWKm2cv8n+v6UlK3zZBfLogxjhDjog
	LWgA==
X-Gm-Message-State: APjAAAX75KIE7bSETPE6rONbgT6iBjqx73KYjXAZPRO4k1ixp+mjk/Ow
	jRgCxKrYuD+1BoC0FdMe76altHUj
X-Google-Smtp-Source: APXvYqxQM/+FIfmHzPlhr2HiP6KD5nvgPAtSiO4YaxFlRxqwFwUEj0iHmBtzfRkc+RwnsT2bLAxtzA==
X-Received: by 2002:a63:f957:: with SMTP id q23mr16553061pgk.326.1559403940794;
	Sat, 01 Jun 2019 08:45:40 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:d8eb:da43:9914:3fc9?
	([2601:202:4180:c33:d8eb:da43:9914:3fc9])
	by smtp.gmail.com with ESMTPSA id
	j20sm9425935pfi.138.2019.06.01.08.45.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jun 2019 08:45:40 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>
References: <1559137838-8972-1-git-send-email-akuster808@gmail.com>
	<20190529141116.GC28892@localhost>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <2722a848-cba6-e1f0-784b-799f1e4c787c@gmail.com>
Date: Sat, 1 Jun 2019 08:45:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529141116.GC28892@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [thud][PATCH 0/9] Fixes for Thud
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
X-List-Received-Date: Sat, 01 Jun 2019 15:45:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 5/29/19 7:11 AM, Adrian Bunk wrote:
> On Wed, May 29, 2019 at 06:50:29AM -0700, Armin Kuster wrote:
>> ..
>> Mingli Yu (2):
>>   nettle: fix ptest failure
>> ...
>> Richard Purdie (1):
>>   Revert "nettle: fix ptest failure"
>> ...
> These should be dropped for obvious reasons.

its not obvious to me.=C2=A0 This helps in the QA process.=C2=A0 I am ope=
n to
ptest fixes and other QA backports for the Stable Branches.


OE has been benefiting from the donated QA resources from Intel and Wind
River in the Yocto Project.=C2=A0 If I can lessing their burden on the St=
able
branches, I will do that.=C2=A0 Richard have been spending time keeping t=
he
Stable branches QA frameworks in sync for this reason including the
AutoBuilder. Without this, we don't have Stable branches.


- armin
>
> cu
> Adrian
>



